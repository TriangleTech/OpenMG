﻿using log4net;
using System;
using System.Collections.Generic;
using System.Linq;
using WvsBeta.Common.Enums;
using WvsBeta.Common.Sessions;
using WvsBeta.Game.Events;
using WvsBeta.Game.Events.Packets;
using WvsBeta.Game.Packets;
using static WvsBeta.MasterThread;

namespace WvsBeta.Game.GameObjects
{
    public enum SnowballTeam
    {
        TEAM_MAPLE = 0,
        TEAM_STORY = 1
    }

    public enum SnowballEventState
    {
        NOT_STARTED = 0,
        IN_PROGRESS = 1,
        MAPLE_WIN = 2,
        STORY_WIN = 3
    }
    class Map_Snowball : TeamEventMap
    {
        /* SNOWBALL CONSTANTS */
        public static readonly int xMin = 0;
        public static readonly int xMax = 900;
        public static readonly int RecoveryAmount = 400;
        public static readonly int RecoveryDelay = 10000;
        public static readonly short SnowballMaxHp = 8999;
        public static readonly int SnowManMaxHp = 7500;
        public static readonly int SnowmanWaitDuration = 20000;
        public static readonly int Speed = 100; //gms-like is 100
        public static readonly short DamageSnowBall = 10;
        public static readonly short DamageSnowMan0 = 15;
        public static readonly short DamageSnowMan1 = 45;

        /**********************/

        public Portal Top { get => Portals["st01"]; }
        public Portal Bottom { get => Portals["st00"]; }
        public readonly SnowballObject MapleSnowball;
        public readonly SnowballObject StorySnowball;
        public readonly SnowmanObject MapleSnowman;
        public readonly SnowmanObject StorySnowman;
        private SnowballEventState _snowballState;

        public Map_Snowball(int id) : base(id)
        {
            MapleSnowman = new SnowmanObject(this, SnowballTeam.TEAM_MAPLE);
            StorySnowman = new SnowmanObject(this, SnowballTeam.TEAM_STORY);
            MapleSnowball = new SnowballObject(this, SnowballTeam.TEAM_MAPLE);
            StorySnowball = new SnowballObject(this, SnowballTeam.TEAM_STORY);
            OnTimerEnd += HandleOnTimerEnd;
        }

        ~Map_Snowball()
        {
            FieldSet.OnStart -= HandleFieldSetStart;
            OnTimerEnd -= HandleOnTimerEnd;
        }

        public override void Reset()
        {
            base.Reset();
            MapleSnowball.Reset();
            StorySnowball.Reset();
            MapleSnowman.Reset();
            StorySnowman.Reset();
            SnowballState = SnowballEventState.NOT_STARTED;
        }

        private void HandleOnTimerEnd(Map map)
        {
            List<GameCharacter> winners;
            List<GameCharacter> losers;
            if (GetWinner() == SnowballEventState.MAPLE_WIN)
            {
                winners = TeamMaple.ToList();
                losers = TeamStory.ToList();
            }
            else
            {
                winners = TeamStory.ToList();
                losers = TeamMaple.ToList();
            }

            winners.ForEach(c => SendEffectVictory(c));
            losers.ForEach(c => SendEffectLose(c));

            RepeatingAction.Start("snowball warper", e =>
            {
                winners.ForEach(c => c.ChangeMap(WinMap.ID));
            }, 10 * 1000, 0);
        }

        public override void SetFieldSet(FieldSet fs)
        {
            base.SetFieldSet(fs);
            FieldSet.OnStart += HandleFieldSetStart;
            FieldSet.OnEnd.Subscribe(HandleFieldSetEnd);
        }

        private void HandleFieldSetStart(object obj, EventArgs args)
        {
            Start();
        }

        private void HandleFieldSetEnd(FieldSet fs)
        {
            End();
        }

        public override void AddPlayer(GameCharacter chr)
        {
            base.AddPlayer(chr);
            SendSnowballState(chr);
        }

        public SnowballEventState SnowballState
        {
            get => _snowballState;
            set
            {
                _snowballState = value;
                SendSnowballState();
            }
        }

        public void SendSnowballState(GameCharacter chr = null)
        {
            var packet = SnowballPackets.SnowballState(
                SnowballState,
                StorySnowball.XPos,
                (byte)(StorySnowball.HP / 1000),
                MapleSnowball.XPos,
                (byte)(MapleSnowball.HP / 1000),
                DamageSnowBall,
                DamageSnowMan0,
                DamageSnowMan1);

            if (chr != null) chr.SendPacket(packet);
            else SendPacket(packet);
        }

        public override bool HandlePacket(GameCharacter character, Packet packet, ClientMessages opcode)
        {
            if (SnowballState == SnowballEventState.IN_PROGRESS)
                switch (opcode)
                {
                    case ClientMessages.FIELD_SNOWBALL_ATTACK:
                        OnSnowballHit(packet.ReadByte(), character, packet.ReadShort(), packet.ReadShort());
                        return true;
                    default:
                        return false;
                }
            else
                return false;
        }

        public void OnSnowballHit(byte type, GameCharacter chr, short damage, short delay)
        {
            Program.MainForm.LogDebug("Type: " + type);
            if (MasterThread.IsDebug && chr.IsAdmin)
            {
                var weapon = chr.Inventory.Equipped[EquippedType.Normal][Common.Constants.EquipSlots.Slots.Weapon];
                if (weapon?.ItemID == EquipIds.OldGladius)
                {
                    damage = 100;
                }
            }
            switch(type)
            {
                case 0:
                    StorySnowball.OnHit(-damage);
                    break;
                case 1:
                    MapleSnowball.OnHit(-damage);
                    break;
                case 2:
                    StorySnowman.OnHit(damage);
                    break;
                case 3:
                    MapleSnowman.OnHit(damage);
                    break;
                default:
                    return;
            }

            SendPacket(SnowballPackets.SnowballHit(type, damage, delay), chr);
        }

        public SnowballEventState UpdateSnowballPositions()
        {
            var now = MasterThread.CurrentTime;
            MapleSnowball.UpdatePosition(now);
            StorySnowball.UpdatePosition(now);

            if (MapleSnowball.XPos >= xMax)
            {
                SnowballState = SnowballEventState.MAPLE_WIN;
            }
            else if (StorySnowball.XPos >= xMax)
            {
                SnowballState = SnowballEventState.STORY_WIN;
            }

            return SnowballState;
        }

        public SnowballEventState GetWinner()
        {
            if (SnowballState == SnowballEventState.MAPLE_WIN || SnowballState == SnowballEventState.STORY_WIN)
            {
                return SnowballState;
            }

            Program.MainForm.LogDebug("Maple: " + MapleSnowball.XPos + ". Story: " + StorySnowball.XPos);
            return MapleSnowball.XPos > StorySnowball.XPos ? SnowballEventState.MAPLE_WIN : SnowballEventState.STORY_WIN;
        }

        public class SnowmanObject
        {
            public int CurHP { get; set; }
            public readonly Map_Snowball Field;
            public readonly SnowballTeam Team;

            public SnowmanObject(Map_Snowball snowballmap, SnowballTeam team)
            {
                Field = snowballmap;
                Team = team;
            }

            public void Reset()
            {
                CurHP = SnowManMaxHp;
            }

            public void OnHit(int damage)
            {
                if (Field.UpdateSnowballPositions() == SnowballEventState.IN_PROGRESS)
                {
                    var oldHp = CurHP;
                    CurHP -= damage;

                    if (CurHP <= 0)
                    {
                        CurHP = SnowManMaxHp;
                        var AltBall = Team == SnowballTeam.TEAM_MAPLE ? Field.StorySnowball : Field.MapleSnowball;
                        AltBall.WaitTime = MasterThread.CurrentTime;
                        AltBall.HP = SnowballMaxHp;
                        AltBall.Stopped = true;
                        //onsnowballmsg
                    }

                    Field.SendSnowballState();
                }
            }
        }

        public class SnowballObject
        {
            public static readonly int[] Delay = { 220, 260, 300, 340, 380, 420, 460, 500, 0, -500 };
            public short HP { get; set; }
            public bool Stopped { get; set; }
            public long WaitTime { get; set; }
            public short XPos { get; private set; }
            public long LastSpeedChanged { get; private set; }
            public long LastRecovery { get; private set; }
            public readonly Map_Snowball Field;
            public readonly SnowballTeam Team;

            public SnowballObject(Map_Snowball snowballmap, SnowballTeam team)
            {
                Field = snowballmap;
                Team = team;
            }

            public void Reset()
            {
                Stopped = false;
                XPos = 0;
                HP = SnowballMaxHp;
            }

            public void OnHit(int damage)
            {
                Program.MainForm.LogDebug("Damage: " + damage);
                void CheckSnowmanWait()
                {
                    if (MasterThread.CurrentTime - WaitTime > SnowmanWaitDuration)
                    {
                        if (Stopped)
                        {
                            Stopped = false;
                            //onsnowballmsg?
                        }
                    }
                    else
                    {
                        Program.MainForm.LogDebug("Damage 0 wait");
                        damage = 0;
                    }
                }

                void UpdateHP()
                {
                    var OldHP = HP / 1000;
                    var nhp = HP + damage * Speed / 100;
                    nhp = nhp <= 0 ? 0 : nhp >= SnowballMaxHp ? SnowballMaxHp : nhp;
                    HP = (short)nhp;
                    Program.MainForm.LogDebug("New HP " + HP);
                    Field.SendSnowballState();
                }

                CheckSnowmanWait();

                if (Field.UpdateSnowballPositions() == SnowballEventState.IN_PROGRESS)
                    UpdateHP();

                //section update thingy?

            }

            public void UpdatePosition(long tCur)
            {
                Program.MainForm.LogDebug("XPos: " + XPos);
                var SpeedUpdate = (int)(tCur - LastSpeedChanged);
                var curDelay = Delay[HP / 1000];

                if (curDelay != 0)
                {
                    var Pos = xMin;
                    if (xMin < XPos + SpeedUpdate / curDelay)
                        Pos = XPos + SpeedUpdate / curDelay;
                    if (Pos > xMax)
                        Pos = xMax;
                    this.XPos = (short)Pos;
                    this.LastSpeedChanged = SpeedUpdate + LastSpeedChanged - SpeedUpdate % curDelay;
                }
                else
                    LastSpeedChanged = tCur;

                if (tCur - LastRecovery <= RecoveryDelay)
                {
                    Program.MainForm.LogDebug("recov diff: " + (tCur - LastRecovery));
                    return;
                }
                else
                {
                    var NewHP = HP + RecoveryAmount;
                    this.HP = (short)(NewHP < 0 ? 0 : NewHP > SnowballMaxHp ? SnowballMaxHp : NewHP);
                    this.LastRecovery = tCur;

                    return;
                }
            }
        }
    }
}
