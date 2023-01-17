using System.Collections.Generic;

namespace WvsBeta.Common.Objects
{
    public class PetData
    {
        public string Name { get; set; }
        public int ID { get; set; }
        public byte Hungry { get; set; }
        public byte Life { get; set; }
        public Dictionary<byte, PetReactionData> Reactions { get; set; }
    }
}
