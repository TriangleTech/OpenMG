﻿using System.Collections.Generic;
using WvsBeta.Game.Scripting;

namespace WvsBeta.Scripts.Scripts
{
    [Script("standard")]
    public class Standard : IStandardScript
    {
        public IDictionary<string, string> ScriptNameMap { get; set; }
        public Standard()
        {
            ScriptNameMap = new Dictionary<string, string>
            {
                { "taxi1", "taxi" },
                { "taxi2", "taxi" },
                { "taxi3", "taxi" },
                { "taxi4", "taxi" },
                { "mTaxi", "taxi" },
                { "market00", "market" },
                { "market01", "market" },
                { "market02", "market" },
                { "market03", "market" },
                { "market04", "market" },
                { "market05", "market" },
                { "market06", "market" },
                { "market07", "market" },
                { "market08", "market" },
                { "market09", "market" },
                { "levelUP", "etc" },
                { "levelUP2", "etc" },
                { "begin2", "mapleIsland" },
                { "begin4", "mapleIsland" },
                { "begin5", "mapleIsland" },
                { "begin7", "mapleIsland" },
                { "bari", "mapleIsland" },
                { "rein", "mapleIsland" },
                { "pio", "mapleIsland" },
                { "rithTeleport", "victoria0" },
                { "jane", "victoria0" },
                { "q2073", "victoria0" },
                { "bush1", "victoria1" },
                { "bush2", "victoria1" },
                { "herb_out", "victoria1" },
                { "herb_in", "victoria1" },
                { "owen", "victoria2" },
                { "mike", "victoria2" },
                { "flower_in", "victoria2" },
                { "viola_pink", "victoria2" },
                { "viola_blue", "victoria2" },
                { "viola_white", "victoria2" },
                { "flower_out", "victoria2" },
                { "petmaster", "victoria2" },
                { "pet_life", "victoria2" },
                { "pet_lifeitem", "victoria2" },
                { "pet_letter", "victoria2" },
                { "subway_ticket", "victoria3" },
                { "_subway_in", "victoria3" },
                { "subway_in", "victoria3" },
                { "subway_get1", "victoria3" },
                { "subway_get2", "victoria3" },
                { "subway_get3", "victoria3" },
                { "subway_out", "victoria3" },
                { "hotel1", "victoria3" },
                { "guild_proc", "ossyria2" },
                { "guild_mark", "ossyria2" },
                { "party1_enter", "party" },
                { "party1_play", "party" },
                { "party1_out", "party" },
                { "refine_henesys", "make1" },
                { "refine_sleepy", "make1" },
                { "face_henesys1", "face" },
                { "face_henesys2", "face" },
                { "face_orbis1", "face" },
                { "face_orbis2", "face" },
                { "face_ludi1", "face" },
                { "face_ludi2", "face" },
                { "lens_henesys1", "face" },
                { "lens_orbis1", "face" },
                { "lens_ludi1", "face" },
                { "skin_henesys1", "skin" },
                { "skin_orbis1", "skin" },
                { "skin_ludi1", "skin" },
                { "hair_henesys1", "hair" },
                { "hair_henesys2", "hair" },
                { "hair_kerning1", "hair" },
                { "hair_kerning2", "hair" },
                { "hair_orbis1", "hair" },
                { "hair_orbis2", "hair" },
                { "hair_ludi1", "hair" },
                { "hair_ludi2", "hair" },
                { "1011000", "shop" },
                { "1011001", "shop" },
                { "1011100", "shop" },
                { "1012004", "shop" },
            };
        }
    }
}
