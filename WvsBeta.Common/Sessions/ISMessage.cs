﻿namespace WvsBeta.Common.Sessions
{
    public enum ISClientMessages : byte
    {
        Ping = (byte)ServerMessages.PING,
        Pong = (byte)ClientMessages.PONG,
        OFFSET = 30, // Make sure we do not conflict with ping/pong

        ServerRequestAllocation,
        ServerSetConnectionsValue,
        ServerRegisterUnregisterCharacter = 133,
        ServerRegisterRegisterCharacter = 134,

        PlayerChangeServer = 34,
        PlayerQuitCashShop,
        PlayerRequestWorldLoad,
        PlayerRequestWorldList,
        PlayerRequestChannelStatus,
        PlayerWhisperOrFindOperation,
        PlayerUsingSuperMegaphone,
        PlayerBuffUpdate,
        
        GroupMessage,

        MessengerJoin,
        MessengerLeave,
        MessengerInvite,
        MessengerBlocked,
        MessengerDeclined,
        MessengerChat,
        MessengerAvatar,

        PartyCreate,
        PartyInvite,
        PartyAccept,
        PartyLeave,
        PartyExpel,
        PartyDisconnect,
        PartyDecline,
        PartyDoorChanged,

        RequestBuddylist,
        BuddyUpdate,
        BuddyInvite,
        BuddyInviteAnswer,
        BuddyListExpand,
        BuddyDisconnect,
        BuddyDecline,

        AdminMessage,
        FindPlayer,
        
        ChangeRates,
        PlayerUpdateMap, //Used for parties :/
        ServerMigrationUpdate,
        PlayerCreateCharacterNamecheck,
        PlayerCreateCharacter,
        PlayerDeleteCharacter,

        KickPlayer,
        UpdatePlayerJobLevel,

        BroadcastPacketToGameServers,
        BroadcastPacketToGameServersExcept,
        BroadcastPacketToShopservers,
        ReloadEvents,
    }

    public enum ISServerMessages : byte
    {
        Ping = (byte)ServerMessages.PING,
        Pong = (byte)ClientMessages.PONG,
        OFFSET = 30, // Make sure we do not conflict with ping/pong

        ServerAssignmentResult,
        ServerSetUserNo, // For Centers -> Logins

        PlayerChangeServerData,
        PlayerChangeServerResult,
        PlayerRequestWorldLoadResult,
        PlayerRequestChannelStatusResult,
        PlayerRequestWorldListResult,
        PlayerWhisperOrFindOperationResult,
        PlayerSuperMegaphone,

        PlayerSendPacket,

        ChangeRates,

        AdminMessage,
        FindPlayer,

        RequestBuddylist,
        BuddyUpdate,
        BuddyInvite,
        BuddyInviteAnswer,
        //BuddyUpdateChannel,
        //BuddyUpdateUnk,
        BuddyDisconnect,

        ChangeParty,
        UpdateHpParty,
        PartyInformationUpdate,
        PartyDisbanded,
        PartyMemberJoined,
        PartyMemberLeft,

        GuildLoad,
        GuildUnload,
        GuildUpdateRanks,
        GuildEmblemUpdated,
        GuildExpand,
        GuildMemberIsOnline,
        GuildMemberDisconnect,
        GuildMemberJoin,
        GuildMemberLeave,
        GuildMemberChangeRank,
        GuildMemberJobLevelUpdate,

        Test,
        MessengerOperation,
        PartyDisconnect,
        PlayerBuffUpdate,
        BuddyChat,
        BuddyDecline,
        
        ServerMigrationUpdate,
        ChangeCenterServer,
        PlayerCreateCharacterNamecheckResult,
        PlayerCreateCharacterResult,
        PlayerDeleteCharacterResult,

        KickPlayerResult,
        
        WSE_ChangeScrollingHeader,
        ReloadNPCScript,
        ReloadCashshopData,
    }
}
