﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using log4net;
using WvsBeta.Common;
using WvsBeta.Common.Sessions;

namespace WvsBeta.Center
{
    public class DoorInformation
    {
        public readonly int OwnerId;
        public readonly int DstMap; // this will be the town
        public readonly int SrcMap;
        public readonly short X;
        public readonly short Y;
        public DoorInformation(int dstMap, int srcMap, short x, short y, int owner)
        {
            DstMap = dstMap;
            SrcMap = srcMap;
            X = x;
            Y = y;
            OwnerId = owner;
        }
        public DoorInformation(Packet packet)
        {
            DstMap = packet.ReadInt();
            SrcMap = packet.ReadInt();
            X = packet.ReadShort();
            Y = packet.ReadShort();
            OwnerId = packet.ReadInt();
        }

        public static readonly DoorInformation DefaultNoDoor = new DoorInformation(Constants.InvalidMap, Constants.InvalidMap, -1, -1, -1);
        public void Encode(Packet pw)
        {
            pw.WriteInt(DstMap);
            pw.WriteInt(SrcMap);
            pw.WriteShort(X);
            pw.WriteShort(Y);
        }
    }

    public class PartyMember
    {
        public readonly int id;
        public readonly string name;
        public readonly int job;
        public readonly int level;
        public bool isLeader { get; set; }
        public DoorInformation door { get; set; }

        public PartyMember(int id, string name, int job, int level, bool isLeader)
        {
            this.id = id;
            this.name = name;
            this.job = job;
            this.level = level;
            this.isLeader = isLeader;
            door = DoorInformation.DefaultNoDoor;
        }

        public PartyMember(Packet pr)
        {
            id = pr.ReadInt();
            name = pr.ReadString();
            isLeader = pr.ReadBool();
        }

        public void SendPacket(Packet packet)
        {
            GetCharacter(true)?.SendPacket(packet);
        }

        public bool IsOnline => CenterServer.Instance.IsOnline(id);

        public Character GetCharacter(bool onlyOnline)
        {
            return CenterServer.Instance.FindCharacter(id, onlyOnline);
        }

        public int GetChannel()
        {
            return GetCharacter(true)?.ChannelID ?? PartyPacket.CHANNEL_ID_OFFLINE;
        }

        public int GetMap()
        {
            return GetCharacter(true)?.MapID ?? 0;
        }

        public void SendHpUpdate()
        {
            Character chr = GetCharacter(true);
            if (chr != null)
                CenterServer.Instance.World.GameServers[chr.ChannelID].Connection.SendPacket(PartyPacket.RequestHpUpdate(chr.ID));
        }

        public void EncodeForMigration(Packet pw)
        {
            pw.WriteInt(id);
            pw.WriteString(name);
            pw.WriteBool(isLeader);
        }
    }

    public class Party
    {
        private static ILog _log = LogManager.GetLogger("Party");

        public readonly int partyId;
        public readonly int world;
        public readonly PartyMember[] members = new PartyMember[Constants.MaxPartyMembers];
        public PartyMember leader { get; private set; }
        public IEnumerable<DoorInformation> Doors { get { return members.Where(m => m != null).Select(m => m.door); } }

        private Party(int id, PartyMember ldr)
        {
            partyId = id;
            leader = ldr;
            members[0] = ldr;
        }

        public Party(Packet pr)
        {
            partyId = pr.ReadInt();
            var leaderId = pr.ReadInt();

            for (var i = 0; i < Constants.MaxPartyMembers; i++)
            {
                if (pr.ReadBool())
                {
                    var member = new PartyMember(pr);
                    members[i] = member;
                    if (member.id == leaderId) leader = member;

                    var actualPlayer = member.GetCharacter(false);

                    if (actualPlayer != null)
                    {
                        actualPlayer.PartyID = partyId;
                    }
                }
            }
        }

        /// <summary>
        /// Get the PartyMember element by Character ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public PartyMember GetById(int id)
        {
            return members.FirstOrDefault(x => x != null && x.id == id);
        }

        public bool IsFull() => GetFirstFreeSlot() == -1;
        public int GetFirstFreeSlot() => GetCharacterSlot(null);

        public int GetCharacterSlot(PartyMember pm)
        {
            for (var i = 0; i < Constants.MaxPartyMembers; i++)
            {
                if (members[i] == pm) return i;
            }
            return -1;
        }

        public int GetCharacterSlot(int characterId)
        {
            for (var i = 0; i < Constants.MaxPartyMembers; i++)
            {
                if (members[i]?.id == characterId) return i;
            }
            return -1;
        }

        public void ForAllMembers(Action<PartyMember> action, int skip = -1, bool onlyOnline = true, int only = -1)
        {
            foreach (var partyMember in members)
            {
                if (partyMember == null) continue;
                if (partyMember.id == skip) continue;
                if (only > -1 && partyMember.id != only) continue;
                if (onlyOnline && partyMember.IsOnline == false) continue;

                action(partyMember);
            }
        }

        public void Invite(int invitor, int invitee) => OnlyWithLeader(invitor, ldr =>
        {
            var toInvite = CenterServer.Instance.FindCharacter(invitee);
            if (toInvite == null)
            {
                ldr.SendPacket(PartyPacket.Error(PartyFunctionError.UNABLE_TO_FIND_PLAYER));
            }
            else if (Invites.ContainsKey(toInvite.ID))
            {
                ldr.SendPacket(PartyPacket.Error(PartyFunctionError.INVITE_USER_ALREADY_HAS_INVITE, toInvite.Name));
            }
            else if (toInvite.PartyID != 0)
            {
                ldr.SendPacket(PartyPacket.Error(PartyFunctionError.JOIN_ALREADY_JOINED));
            }
            else if (IsFull())
            {
                ldr.SendPacket(PartyPacket.Error(PartyFunctionError.JOIN_ALREADY_FULL));
            }
            else
            {
                _log.Debug($"Sending invite from party {partyId} from character {invitor} to {invitee}");
                toInvite.SendPacket(PartyPacket.PartyInvite(this));
                Invites.Add(toInvite.ID, this);
                //TODO do invites expire?
            }
        });

        public void DeclineInvite(Character decliner)
        {
            if (Invites.ContainsKey(decliner.ID))
            {
                _log.Debug($"Invite to party {partyId} has been declined by {decliner.ID}");
                Invites.Remove(decliner.ID);
                leader.SendPacket(PartyPacket.Error(PartyFunctionError.INVITE_REJECTED, decliner.Name));
            }
            else
            {
                Program.MainForm.LogAppend("Trying to decline party invite while no invite exists. CharacterID: {0}, party ID {1}", decliner.ID, partyId);
            }
        }

        public void TryJoin(Character chr, Packet packet)
        {
            if (!Invites.ContainsKey(chr.ID))
            {
                Program.MainForm.LogAppend("Trying to join party while no invite. CharacterID: {0}, party ID {1}",
                    chr.ID, partyId);
                chr.SendPacket(PartyPacket.Error(PartyFunctionError.UNABLE_TO_FIND_PLAYER));
                return;
            }

            Invites.Remove(chr.ID);
            if (IsFull())
            {
                _log.Warn($"Invite accepted to party {partyId} by {chr.ID}, but its already full.");
                chr.SendPacket(PartyPacket.Error(PartyFunctionError.JOIN_ALREADY_FULL));
                return;
            }

            if (chr.PartyID != 0)
            {
                _log.Warn($"Invite accepted to party {partyId} by {chr.ID}, the person is already in a party");
                chr.SendPacket(PartyPacket.Error(PartyFunctionError.JOIN_ALREADY_JOINED));
                return;
            }

            if (leader.GetMap() != chr.MapID)
            {
                _log.Warn($"Invite accepted to party {partyId} by {chr.ID}, but is not in the same map.");
                chr.SendPacket(PartyPacket.Error(PartyFunctionError.UNABLE_TO_FIND_PLAYER));
                return;
            }

            Join(chr, packet);
        }

        private void Join(Character chr, Packet packet)
        {
            var slot = GetFirstFreeSlot();
            if (slot == -1)
            {
                _log.Error($"Trying to join the party, but the free slot is -1??? Party {partyId} Character {chr.ID}");
                return;
            }
            
            _log.Debug($"{chr.ID} joins the party {partyId} under slot {slot}");

            chr.PartyID = partyId;
            var member = new PartyMember(chr.ID, chr.Name, chr.Job, chr.Level, false);
            if (packet.ReadBool())
            {
                member.door = new DoorInformation(packet);
            }

            members[slot] = member;

            ForAllMembers(m => m.SendPacket(PartyPacket.Join(this, member)));
            member.SendHpUpdate();
            SendUpdatePartyData();
            UpdateAllDoors();
            SendPartyMemberJoined(member);
        }

        public void SendPartyMemberJoined(PartyMember joined)
        {
            var pw = new Packet(ISServerMessages.PartyMemberJoined);
            pw.WriteInt(joined.id);
            CenterServer.Instance.SendPacketToServer(pw, (byte)joined.GetChannel());
        }

        public void Leave(Character fucker)
        {
            var slot = GetCharacterSlot(fucker.ID);

            if (slot == -1 || fucker.PartyID == 0)
            {
                _log.Error($"{fucker.ID} tried to get out of party {partyId}, but is not in it?");
                fucker.SendPacket(PartyPacket.Error(PartyFunctionError.WITHDRAW_NOT_JOINED));
            }
            else if (fucker.ID == leader.id)
            {
                _log.Debug($"Disbanding because {fucker.ID} left the party {partyId} (leader)");
                Disband(fucker);
            }
            else
            {
                _log.Debug($"{fucker.ID} left the party {partyId} from slot {slot}");
                var leaving = members[slot];
                members[slot] = null;

                ForAllMembers(m => m.SendPacket(PartyPacket.MemberLeft(m, leaving, this, false, false)));
                leaving.SendPacket(PartyPacket.MemberLeft(leaving, leaving, this, false, false));

                fucker.PartyID = 0;
                SendPartyMemberLeft(fucker);
                SendUpdatePartyData();
                UpdateAllDoors();
            }
        }

        public void SendPartyMemberLeft(Character left)
        {
            var pw = new Packet(ISServerMessages.PartyMemberLeft);
            pw.WriteInt(partyId);
            pw.WriteInt(left.ID);
            CenterServer.Instance.SendPacketToServer(pw, left.ChannelID);
        }

        public void SilentUpdate(int charId, int disconnecting = -1)
        {
            var member = GetById(charId);
            ForAllMembers(m => m.SendPacket(PartyPacket.Load(this, m, disconnecting)));
            member.SendHpUpdate();
            SendUpdatePartyData();
            UpdateAllDoors();
        }
        
        private void Disband(Character disbander) => OnlyWithLeader(disbander.ID, ldr =>
        {
            _log.Debug($"Disbanding party {partyId} by character {disbander.ID}");
            var doors = Doors.ToList();

            ForAllMembers(m =>
            {
                m.SendPacket(PartyPacket.MemberLeft(m, ldr, this, true, false));
                var c = m.GetCharacter(false);

                if (c != null)
                {
                    c.PartyID = 0;
                }
                else
                {
                    _log.Debug($"Unable to set PartyID to 0 of {m.id}");
                }
            }, -1, false);

            for (var i = 0; i < Constants.MaxPartyMembers; i++)
            {
                members[i] = null;
            }

            leader = null;

            Parties.Remove(partyId);
            var discardedInvites = Invites.Where(x => x.Value.partyId == partyId).Select(x => x.Key).ToArray();
            discardedInvites.ForEach(x => Invites.Remove(x));

            SendPartyDisband(doors);
        });

        public void Expel(int expellerId, int toExpel) => OnlyWithLeader(expellerId, ldr =>
        {   
            var slot = GetCharacterSlot(toExpel);

            if (slot == -1)
            {
                _log.Error($"Expelling {toExpel} from party {partyId} by {expellerId}, but was not in party???");
                return;
            }

            _log.Info($"Expelling {toExpel} from party {partyId} by {expellerId}?");

            var expelled = members[slot];
            members[slot] = null;
            ForAllMembers(m => m.SendPacket(PartyPacket.MemberLeft(m, expelled, this, false, true)));
            expelled.SendPacket(PartyPacket.MemberLeft(expelled, expelled, this, false, true));

            var expellchr = expelled.GetCharacter(false);
            if (expellchr != null)
            {
                expellchr.PartyID = 0;
            }
            else
            {
                _log.Debug($"Unable to set PartyID to 0 of {toExpel}");
            }

            SendPartyMemberLeft(expellchr);
            SendUpdatePartyData();
            UpdateAllDoors();
        });

        public void Chat(int chatter, string text)
        {
            PartyMember chr = GetById(chatter);
            if (members.Count(e => e?.IsOnline ?? false) <= 1)
            {
                chr.SendPacket(PartyPacket.NoneOnline());
            }
            else
            {
                // Send to all other members
                ForAllMembers(m => m.SendPacket(PartyPacket.PartyChat(chr.name, text, 1)), chatter);
            }
        }

        public void OnlyWithLeader(int lid, Action<PartyMember> action)
        {
            if (lid == leader.id)
            {
                action(leader);
            }
            else
            {
                _log.Warn($"Trying to run func for only the leader, but {lid} is not the leader of party {partyId}!");
            }
        }

        public void UpdateDoor(DoorInformation newDoor, int ownerId, int only = -1)
        {
            Trace.WriteLine("UPDATING DOOR: " + ownerId);
            var doorOwner = GetById(ownerId);
            if (doorOwner != null)
            {
                doorOwner.door = newDoor;
                byte idx = (byte)GetCharacterSlot(doorOwner);
                ForAllMembers(m =>
                {
                    if (m.GetChannel() == doorOwner.GetChannel())
                    {
                        m.SendPacket(PartyPacket.TownPortalChangedUnk(this, m, newDoor, idx));
                    }
                }, only: only);
            }
        }

        private void UpdateAllDoors()
        {
            var mems = members.Where(m => m != null);
            var doors = mems.Select(m => m.door);
            foreach (var door in doors.ToList())
            {
                UpdateDoor(door, door.OwnerId);
            }
        }

        private void SendUpdatePartyData()
        {
            Packet pw = new Packet(ISServerMessages.PartyInformationUpdate);
            pw.WriteInt(partyId);
            pw.WriteInt(leader.id);

            for (var i = 0; i < Constants.MaxPartyMembers; i++)
            {
                var member = members[i];
                if (member != null)
                {
                    pw.WriteInt(member.id);
                }
                else
                {
                    pw.WriteInt(0);
                }
            }

            CenterServer.Instance.World.SendPacketToEveryGameserver(pw);
        }

        private void SendPartyDisband(IList<DoorInformation> doors)
        {
            Packet pw = new Packet(ISServerMessages.PartyDisbanded);
            pw.WriteInt(partyId);
            CenterServer.Instance.World.SendPacketToEveryGameserver(pw);
        }

        /****************************************************************/

        private static readonly LoopingID IdGenerator = new LoopingID(1, int.MaxValue);
        public static readonly Dictionary<int, Party> Parties = new Dictionary<int, Party>(); //partyId -> party
        public static readonly Dictionary<int, Party> Invites = new Dictionary<int, Party>(); //invitee -> party

        public static void CreateParty(Character leader, Packet packet)
        {
            if (leader == null)
            {
                return;
            }

            if (leader.Job == 0)
            {
                _log.Warn($"Cannot create party because the leader would be a beginner. Leader {leader.ID}");
                leader.SendPacket(PartyPacket.Error(PartyFunctionError.CREATE_NEW_BEGINNER_DISALLOWED));
                return;
            }

            if (leader.PartyID != 0)
            {
                _log.Warn($"Cannot create party because the leader is already in a party. Leader {leader.ID}");
                leader.SendPacket(PartyPacket.Error(PartyFunctionError.CREATE_NEW_ALREADY_JOINED));
                return;
            }

            PartyMember ldr = new PartyMember(leader.ID, leader.Name, leader.Job, leader.Level, true);
            if (packet.ReadBool()) // Has door
            {
                ldr.door = new DoorInformation(packet);
            }

            int id = IdGenerator.NextValue();
            Party pty = new Party(id, ldr);
            _log.Info($"Created party {id} with leader {leader.ID}");

            Parties.Add(pty.partyId, pty);
            leader.PartyID = pty.partyId;
            pty.SendUpdatePartyData();
            leader.SendPacket(PartyPacket.PartyCreated(leader.ID, pty.partyId));
            pty.UpdateAllDoors();
        }

        public static void EncodeForMigration(Packet pw)
        {
            pw.WriteInt(IdGenerator.Current);
            pw.WriteInt(Parties.Count);
            foreach (var kvp in Parties)
            {
                pw.WriteInt(kvp.Key);

                var party = kvp.Value;

                pw.WriteInt(party.leader.id);

                for (var i = 0; i < Constants.MaxPartyMembers; i++)
                {
                    var member = party.members[i];
                    if (member != null)
                    {
                        pw.WriteBool(true);
                        member.EncodeForMigration(pw);
                    }
                    else
                    {
                        pw.WriteBool(false);
                    }
                }
            }
        }

        public static void DecodeForMigration(Packet pr)
        {
            IdGenerator.Reset(pr.ReadInt());
            var parties = pr.ReadInt();
            for (var i = 0; i < parties; i++)
            {
                var party = new Party(pr);
                Parties.Add(party.partyId, party);
            }
        }
    }
}
