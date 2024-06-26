﻿using log4net;
using WvsBeta.Common.Enums;
using WvsBeta.Common.Extensions;
using WvsBeta.Common.Sessions;

namespace WvsBeta.Login.PacketHandlers
{
    internal class ConfirmEULAHandler
    {
        public ConfirmEULAHandler(ClientSession session, ILog log, Packet packet)
        {
            if (log.AssertWarning(session.Player.State != GameState.ConfirmEULA, "Tried to confirm EULA while not in dialog")) return;

            if (packet.ReadBool())
            {
                Server.Instance.UsersDatabase.RunQuery(
                    "UPDATE users SET confirmed_eula = 1 WHERE ID = @id",
                    "@id", session.Player.ID
                );

                Packet pack = new Packet(ServerMessages.CONFIRM_EULA_RESULT);
                pack.WriteBool(true); // Is success
                session.SendPacket(pack);
            }

            session.BackToLogin();
        }
    }
}
