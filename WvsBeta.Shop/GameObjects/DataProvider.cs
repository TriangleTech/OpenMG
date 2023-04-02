﻿using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using reNX.NXProperties;
using WvsBeta.Common.DataProviders;

namespace WvsBeta.Shop
{
    public class DataProvider : BaseDataProvider
    {
        public static Dictionary<int, CommodityInfo> Commodity { get; } = new Dictionary<int, CommodityInfo>();
        public static Dictionary<int, int[]> Packages { get; } = new Dictionary<int, int[]>();

        public static void Load()
        {
            StartInit();
            LoadBase();

            Reload();

            FinishInit();
        }

        public static void Reload()
        {
            bool unload = false;
            if (pFile == null)
            {
                StartInit();
                unload = true;
            }

            Commodity.Clear();

            foreach (var node in pFile.BaseNode["Etc"]["Commodity.img"])
            {
                var ci = new CommodityInfo(node);
                Commodity[ci.SerialNumber] = ci;
            }

            Program.MainForm.LogAppend("Loaded {0} commodity items!", Commodity.Count);

            Packages.Clear();


            foreach (var node in pFile.BaseNode["Etc"]["CashPackage.img"])
            {
                var sn = int.Parse(node.Name);
                var contents = node["SN"].Select(x => x.ValueInt32()).ToArray();
                var error = false;
                foreach (var commoditySN in contents)
                {
                    if (Commodity.ContainsKey(commoditySN) == false)
                    {
                        error = true;
                        Program.MainForm.LogAppend("Ignoring Package {0} as it contains invalid commodity id {1}", sn, commoditySN);
                        break;
                    }
                }
                if (!error)
                {
                    Packages[sn] = contents;
                }
            }


            Program.MainForm.LogAppend("Loaded {0} cash packages!", Packages.Count);

            if (unload)
            {
                FinishInit();
            }

        }


    }
}
