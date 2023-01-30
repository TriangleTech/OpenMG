﻿using System.Security.Cryptography;
using WvsBeta.Common.Character;
using WvsBeta.Common.Sessions;

namespace WvsBeta.Game.GameObjects.MiniRoom
{
    public static class MiniGamePacket
    {
        public enum MiniRoomTypes
        {
            Omok = 1,
            CardGame = 2,
            Shop = 4,
            EntrustedShop = 5,
        }

        public enum MiniGameError : byte
        {
            RoomAlreadyClosed = 0x01,
            FullCapacity = 0x02,
            OtherRequests = 0x03,
            CantWhileDead = 0x04,
            CantInMiddleOfEvent = 0x05,
            UnableToDoIt = 0x06,
            OtherItemsAtPoint = 0x07, // or 0x0E
            CantEstablishRoom = 0x0A,
            Trade2OnSameMap = 0x09,
            NotEnoughMesos = 0x0F,
            CantStartGameHere = 0x0B,
            BuiltAtMainTown = 0x0C,
            UnableToEnterTournament = 0x0D,
            IncorrectPassword = 0x10,
        }

        public static void Test(GameCharacter chr)
        {
            Packet pw = new Packet();
            pw.WriteByte(0xAF);
            pw.WriteByte(4);
            pw.WriteByte(0);
            new AvatarLook(chr).Encode(pw);
            pw.WriteString(chr.Name);
            chr.SendPacket(pw);
        }

        public static void ShowWindow(GameCharacter pOwner, MiniRoomBase mrb, byte OmokType)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(5);
            pw.WriteByte((byte)MiniRoomTypes.Omok);
            pw.WriteByte(mrb.MaxUsers);
            pw.WriteBool(mrb.Users[0] == pOwner ? false : true);
            for (byte i = 0; i < 2; i++)
            {
                GameCharacter pUser = pOwner.Room.Users[i];
                if (pUser != null)
                {
                    pw.WriteByte(i);
                    new AvatarLook(pUser).Encode(pw);
                    pw.WriteString(pUser.Name);
                }
            }
            pw.WriteByte(0xFF);
            //End of Regular Enter base
            //Start of Omok Enter Base

            pw.WriteByte(0); //slot id

            //GW_Minigamerecord_Decode (20 bytes)
            pw.WriteInt(1);
            //pw.WriteInt(0);
            //pw.WriteInt(0);
            //pw.WriteInt(0);
            pw.WriteInt(mrb.Users[0].GameStats.OmokWins);
            pw.WriteInt(mrb.Users[0].GameStats.OmokTies);
            pw.WriteInt(mrb.Users[0].GameStats.OmokLosses);
            pw.WriteInt(2000);

            if (mrb.EnteredUsers > 1)
            {
                pw.WriteByte(1); //slot id 

                pw.WriteInt(1);
                //pw.WriteInt(0);
                //pw.WriteInt(0);
                //pw.WriteInt(0);
                pw.WriteInt(pOwner.GameStats.OmokWins);
                pw.WriteInt(pOwner.GameStats.OmokTies);
                pw.WriteInt(pOwner.GameStats.OmokLosses);
                pw.WriteInt(2000);
            }
            pw.WriteByte(0xFF);
            //Rest of packet
            pw.WriteString(mrb.Title);
            pw.WriteByte(OmokType); //Pieces type

            //Continue, no idea what this part is.
            pw.WriteByte(0);
            pw.WriteByte(0);
            pw.WriteLong(0);
            pOwner.SendPacket(pw);
        }

        public static void ShowWindowTest(GameCharacter chr)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(5);
            pw.WriteByte((byte)MiniRoomTypes.Omok);
            pw.WriteByte(2);
            pw.WriteBool(true);

            pw.WriteByte(0);
            new AvatarLook(chr).Encode(pw);
            pw.WriteString(chr.Name);

            pw.WriteByte(0xFF);
            pw.WriteByte(0);

            pw.WriteInt(1);
            pw.WriteInt(1);
            pw.WriteInt(1);
            pw.WriteInt(1);
            pw.WriteInt(2000);

            pw.WriteString("lolo");
            pw.WriteByte(4); //Pieces type

            //Continue, no idea what this part is.
            pw.WriteByte(0);

            chr.SendPacket(pw);
        }
        public static void AddVisitor(GameCharacter chr, MiniRoomBase mrb)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(4);
            pw.WriteByte(chr.RoomSlotId);
            new AvatarLook(chr).Encode(pw);
            pw.WriteString(chr.Name);

            //GW_Minigamerecord_Decode
            pw.WriteInt(1);
            //pw.WriteInt(0);
            //pw.WriteInt(0);
            //pw.WriteInt(0);
            pw.WriteInt(chr.GameStats.OmokWins);
            pw.WriteInt(chr.GameStats.OmokTies);
            pw.WriteInt(chr.GameStats.OmokLosses);
            pw.WriteInt(2000);
            mrb.BroadcastPacket(pw, chr);

        }

        public static void AddVisitor(GameCharacter chr, GameCharacter to)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x04);
            pw.WriteByte(0x01);
            new AvatarLook(chr).Encode(pw);
            pw.WriteString("lolwat123");
            pw.WriteInt(1);
            pw.WriteInt(0);
            pw.WriteInt(0);
            pw.WriteInt(0);
            pw.WriteInt(2000); //total score: should be 0 
            to.SendPacket(pw);
        }

        public static void AddShop(GameCharacter chr)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(5);
            pw.WriteByte((byte)MiniRoomTypes.Shop);
            pw.WriteByte(4);
            pw.WriteBool(false);
            pw.WriteByte(0);
            new AvatarLook(chr).Encode(pw);
            pw.WriteString("loltest123");
            pw.WriteByte(0xFF);
            pw.WriteString("lolwattest");
            pw.WriteByte(0x10);
            pw.WriteByte(0);
            chr.SendPacket(pw);
        }

        public static void ErrorMessage(GameCharacter chr, MiniGameError error)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(5);
            pw.WriteByte(0);
            pw.WriteByte((byte)error);
            chr.SendPacket(pw);
        }

        public static void Ready(GameCharacter chr, MiniRoomBase mrb)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x20);
            mrb.BroadcastPacket(pw);
        }

        public static void UnReady(GameCharacter chr, MiniRoomBase mrb)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x21);
            mrb.BroadcastPacket(pw);
        }

        public static void OmokMessage(GameCharacter chr, MiniRoomBase mrb, byte Type)
        {
            //You have double -3's o.o
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x27);
            pw.WriteByte(Type); //0: cant put it there 0x29: you have double -3's
            chr.SendPacket(pw);
        }

        public static void RequestTie(GameCharacter chr, MiniRoomBase mrb)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x18);
            mrb.BroadcastPacket(pw);
        }

        public static void RequestTieResult(GameCharacter chr, MiniRoomBase mrb)
        {
            //Your opononent denied your request for a tie
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x19);
            mrb.BroadcastPacket(pw);
        }

        public static void RequestHandicap(GameCharacter chr, MiniRoomBase mrb)
        {
            //Your opponent has requested for a handicap. Will you accept it? 
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x1C);
            chr.SendPacket(pw);
        }

        public static void RequestHandicapResult(GameCharacter chr, MiniRoomBase mrb, bool Accepted, byte CountBack)
        {
            //Your opponent denied your request for a handicap
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x1D);
            pw.WriteBool(Accepted); //deny or not ?
            pw.WriteByte(CountBack);
            if (chr.RoomSlotId == 0)
                pw.WriteByte(1);
            else
                pw.WriteByte(0);
            mrb.BroadcastPacket(pw);
        }

        public static void MoveOmokPiece(GameCharacter chr, MiniRoomBase mrb, int X, int Y, byte Piece)
        {
            //decodebuffer (8 bytes.. obviously 2 ints)
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x26); //?
            pw.WriteInt(X);
            pw.WriteInt(Y);
            //Type
            pw.WriteByte(Piece); //Works as piece too 
            mrb.BroadcastPacket(pw);
        }

        public static void RemoveOmokPieceTest(MiniRoomBase mrb, int X, int Y, byte Piece)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x26);
            pw.WriteInt(X);
            pw.WriteInt(Y);
            pw.WriteSByte(-1);
            mrb.BroadcastPacket(pw);
        }

        public static void Skip(MiniRoomBase mrb, byte pWho)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x25);
            pw.WriteByte(pWho);
            mrb.BroadcastPacket(pw);
        }

        public static void Start(GameCharacter chr, MiniRoomBase mrb)
        {
            //Timer is (null) then client stops responding ;-;
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x23);
            pw.WriteByte(mrb.mWinnerIndex); //0 Would let slot 1, 1 would let slot 0
            mrb.BroadcastPacket(pw);
        }
        public static void Start2(GameCharacter chr, MiniRoomBase mrb)
        {
            //Timer is (null) then client stops responding ;-;
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x23);
            pw.WriteByte(1); //piece id 
            chr.SendPacket(pw);
        }

        public static void UpdateGame(GameCharacter pWinner, MiniRoomBase mrb, byte Type)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0x24);

            switch (Type)
            {
                case 0: pw.WriteByte(0); break;
                case 1: pw.WriteByte(1); break;
                case 2: pw.WriteByte(2); break;
            }
            pw.WriteByte(pWinner.RoomSlotId);

            //gamestats
            pw.WriteInt(1);
            //pw.WriteInt(1337);
            //pw.WriteInt(1337);
            //pw.WriteInt(1337);
            pw.WriteInt(mrb.Users[0].GameStats.OmokWins);
            pw.WriteInt(mrb.Users[0].GameStats.OmokTies);
            pw.WriteInt(mrb.Users[0].GameStats.OmokLosses);
            pw.WriteInt(1);

            pw.WriteInt(1);
            //pw.WriteInt(1337);
            //pw.WriteInt(1337);
            //pw.WriteInt(1337);
            pw.WriteInt(mrb.Users[1].GameStats.OmokWins);
            pw.WriteInt(mrb.Users[1].GameStats.OmokTies);
            pw.WriteInt(mrb.Users[1].GameStats.OmokLosses);
            pw.WriteInt(1);

            pw.WriteLong(0);
            mrb.BroadcastPacket(pw);
        }

        public static void ShowLeaveMessage(GameCharacter pCharacter)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(10);
            pw.WriteByte(pCharacter.RoomSlotId);
            pw.WriteByte(1);
            pCharacter.SendPacket(pw);
        }

        public static void RoomClosedMessage(GameCharacter pCharacter)
        {
            Packet pw = new Packet(ServerMessages.MINI_ROOM_BASE);
            pw.WriteByte(0xA);
            pw.WriteByte(pCharacter.RoomSlotId);
            pw.WriteByte(2);
            pCharacter.SendPacket(pw);
        }
        //public static void OnMove
    }
}
