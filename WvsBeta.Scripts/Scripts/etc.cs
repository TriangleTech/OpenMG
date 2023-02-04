﻿using WvsBeta.Common;
using WvsBeta.Game;
using WvsBeta.Game.Scripting;

namespace WvsBeta.Scripts.Scripts
{
    [Script("levelUPBRCB")]
    class LevelUPCRB : INpcScript
    {
        public void Run(INpcHost self, GameCharacter target)
        {
            var qr = target.QuestRecord;
            var val = qr.Get(8299);
            var check = target.IsClosedBetaTester;
            var inventory = target.Inventory;
            var nRet = self.AskYesNo("Os jogadores que participaram do Closed Beta têm direito a uma Bandana Brasil! Caso você seja um, pode retirar seu prêmio comigo.");
            if (nRet == 1)
            {
                if (check && val == "" )
                {
                    if (inventory.ItemCount(1002795) < 1)
                    {
                        var ret = inventory.Exchange(0, 1002795, 1);
                        if (ret == 1)
                        {
                            self.Say("Você recebeu a Bandana Brasil com sucesso. Parabéns!");
                            qr.Set(8299, "end");
                        }

                        else self.Say("Você não recebeu a Bandana Brasil. Por favor, verifique se seu inventário está cheio.");
                    }

                    else self.Say("Você já tem uma Bandana Brasil e por isso não pode receber outra.");
                }
                else if (check && val == "end" )
                {
                    self.Say("Você já tem uma Bandana Brasil e cada jogador participante do Closed Beta só pode receber uma.");
                }
                else self.Say(" Você não participou do período de Closed Beta, por isso não receberá o item.");
            }
            else self.Say("Por favor, volte mais tarde. Apenas os jogadores que participaram do Closed Beta têm direito a receber uma Bandana Brasil.");
        }
    }
    // The NPC that lets you level up 
    [Script("levelUP2")]
    class LevelUP2 : INpcScript
    {
        public void Run(INpcHost self, GameCharacter target)
        {
            var cName = (string)self.GetStrReg("name");

            if (target.Name == cName && target.Level < 200 ) {
                target.AddEXP(999999999);
                target.Inventory.ExchangeMesos(10000);
                var strLog = "[" + target.Name + "] Level UP " + target.Level;
                self.Log(strLog);
            }
            else self.Say("Become a GM!");
        }
    }
    static class Etc
    {
        // ÇÑ¹æ¼ÂÆÃÇÔ¼ö 
        public static void SetHPMP(GameCharacter target, short newHP, short newMP)
        {
            if (newHP != 0) target.SetHPAndMaxHP(newHP);
            if (newHP != 0) target.SetMPAndMaxMP(newMP);
        }

        // ´É·ÂÄ¡ ¼¼ÆÃ ÇÔ¼ö 
        public static void SetAP(GameCharacter target, short newStr, short newDex, short newInt, short newLuk)
        {
            target.SetStr(newStr);
            target.SetDex(newDex);
            target.SetInt(newInt);
            target.SetLuk(newLuk);
        }
    }
    // GM job adv.
    [Script("levelUP")]
    class LevelUP : INpcScript
    {
        int ret, v3, v4, v5, v6, v7, v8, v9, v10;
        short upPOP, job;
        public void Run(INpcHost self, GameCharacter target)
        {
            if (target.IsAdmin)
            {
                if (target.Job >= 500) self.Say("You are already a GM...");
                else
                {
                    var nRet = self.AskYesNo("Are you sure you want to become a GM?");
                    if (nRet == 1)
                    {
                        var inventory = target.Inventory;
                        var ret = inventory.Exchange(0, 1002140, 1, 1042003, 1, 1062007, 1, 1322013, 1);
                        if (ret == 0) self.Say("Please make room for 4 slots in your equipment inventory.");
                        else
                        {
                            target.AddStr(999);
                            target.AddDex(999);
                            target.AddInt(999);
                            target.AddLuk(999);
                            target.SetMaxHP(30000);
                            target.SetMaxMP(10000);
                            target.SetSP(255);
                            //if (target.IsAdmin) target.Job = 510; else target.Job = 500;
                            target.SetJob(Constants.Gm.ID);
                            self.Say("From now on, you are a GM.");
                        }
                    }
                }
            }
            else
            {
                var cName = self.GetStrReg("name");

                if (target.Name == cName)
                {
                    var inventory = target.Inventory;

                    var v1 = self.AskMenu("What can I do for you?\r\n#b#L0# Reach 1st job level #l\r\n#L1# Reach 2nd job level#l\r\n#L2# Reach 3rd job level#l\r\n#L3# Reach 4th job level#l\r\n#L4# Adjust AP#l\r\n#L5# Earn mesos#l\r\n#L6# Get job-related weapons#l\r\n#L7# Get job-related armor #l\r\n#L8# Increase skill points (SP)#l\r\n#L9# Get potions and etc.# l\r\n#L10# Get Weapon Lists#l\r\n#L11# Get Armor Lists#l\r\n#L12# Get Throwing-Stars and Arrows#l\r\n#L13# Remove remaining SP and AP#l\r\n#L14# Increase Pet Closeness#l\r\n#L15# Increase Fame#l\r\n#L16# Become Powerful#l\r\n#L17 # Max skills #l\r\n#L18# Get 4th level Skill Book #l");
                    if (v1 == 0)
                    {
                        var v2 = self.AskMenu("Qual você quer que seja o 1º avanço de carreira?#b\r\n#L0# Aprendiz#l\r\n#L1# Espadachim (guerreiro do 1º nível)#l\r\n#L2# Bruxo (bruxo do 1º nível)#l\r\n#L3# Arqueiro (arqueiro do 1º nível)#l\r\n#L4# Pilantra (gatuno do 1º nível)#l#k");
                        if (v2 == 0) target.Job = 0;
                        else if (v2 == 1) target.Job = 100;
                        else if (v2 == 2) target.Job = 200;
                        else if (v2 == 3) target.Job = 300;
                        else target.Job = 400;
                    }
                    else if (v1 == 1)
                    {
                        var v2 = self.AskMenu("Qual você quer que seja o 2º avanço de carreira?#b\r\n#L0# Soldado (guerreiro do 2º nível)#l\r\n#L1# Escudeiro (guerreiro do 2º nível)#l\r\n#L2# Lanceiro (guerreiro do 2º nível)#l\r\n#L3# Feiticeiro de fogo/veneno (bruxo do 2º nível)#l\r\n#L4# Feiticeiro de gelo/raio (bruxo do 2º nível)#l\r\n#L5# Clérigo (bruxo do 2º nível)#l\r\n#L6# Caçador (arqueiro do 2º nível)#l\r\n#L7# Balestreiro (arqueiro do 2º nível)#l\r\n#L8# Mercenário (gatuno do 2º nível)#l\r\n#L9# Arruaceiro (gatuno do 2º nível)#l#k");
                        if (v2 == 0) target.Job = 110;
                        else if (v2 == 1) target.Job = 120;
                        else if (v2 == 2) target.Job = 130;
                        else if (v2 == 3) target.Job = 210;
                        else if (v2 == 4) target.Job = 220;
                        else if (v2 == 5) target.Job = 230;
                        else if (v2 == 6) target.Job = 310;
                        else if (v2 == 7) target.Job = 320;
                        else if (v2 == 8) target.Job = 410;
                        else target.Job = 420;
                    }
                    else if (v1 == 2)
                    {
                        var v2 = self.AskMenu("Qual você quer que seja o 3º avanço de carreira?#b\r\n#L0# Templário (guerreiro do 3º nível)#l\r\n#L1# Cavaleiro (guerreiro do 3º nível)#l\r\n#L2# Cavaleiro Draconiano (guerreiro do 3º nível)#l\r\n#L3# Mago de fogo/veneno (bruxo do 3º nível)#l\r\n#L4# Mago de gelo/raio (bruxo do 3º nível)#l\r\n#L5# Sacerdote (bruxo do 3º nível)#l\r\n#L6# Ranger (arqueiro do 3º nível)#l\r\n#L7# Atirador (arqueiro do 3º nível)#l\r\n#L8# Andarinho (gatuno do 3º nível)#l\r\n#L9# Mestre Arruaceiro (gatuno do 3º nível)#l#k");
                        if (v2 == 0) target.Job = 111;
                        else if (v2 == 1) target.Job = 121;
                        else if (v2 == 2) target.Job = 131;
                        else if (v2 == 3) target.Job = 211;
                        else if (v2 == 4) target.Job = 221;
                        else if (v2 == 5) target.Job = 231;
                        else if (v2 == 6) target.Job = 311;
                        else if (v2 == 7) target.Job = 321;
                        else if (v2 == 8) target.Job = 411;
                        else target.Job = 421;
                    }
                    else if (v1 == 3)
                    {
                        var v2 = self.AskMenu("Qual destes você quer?#b\r\n#L0# Herói (guerreiro do 4º nível)#l\r\n#L1# Paladino (guerreiro do 4º nível)#l\r\n#L2# Cavaleiro Negro (guerreiro do 4º nível)#l\r\n#L3# Arquimago de fogo/veneno (bruxo do 4º nível)#l\r\n#L4#Arquimago de gelo/raio (bruxo do 4º nível)#l\r\n#L5# Bispo (bruxo do 4º nível)#l\r\n#L6# Mestre Arqueiro (arqueiro do 4º nível)#l\r\n#L7# Atirador de Elite (arqueiro do 4º nível)#l\r\n#L8# Algoz (arqueiro do 4º nível)#l\r\n#L9# Desordeiro (gatuno do 4º nível)#l#k");
                        if (v2 == 0) target.Job = 112;
                        else if (v2 == 1) target.Job = 122;
                        else if (v2 == 2) target.Job = 132;
                        else if (v2 == 3) target.Job = 212;
                        else if (v2 == 4) target.Job = 222;
                        else if (v2 == 5) target.Job = 232;
                        else if (v2 == 6) target.Job = 312;
                        else if (v2 == 7) target.Job = 322;
                        else if (v2 == 8) target.Job = 412;
                        else target.Job = 422;
                    }
                    else if (v1 == 4)
                    {
                        var v2 = self.AskMenu("Irei ajustar somente seu FOR, DES, INT e SOR. Como gostaria de ser classificado?#b\r\n#L0# Guerreiro, nível 30#l\r\n#L1# Bruxo, nível 30#l\r\n#L2# Arqueiro, nível 30#l\r\n#L3# Gatuno poderoso com adaga, nível 30#l\r\n#L4# Gatuno sortudo com adaga, atirador de shurikens, nível 30#l\r\n#L5# Guerreiro, nível 70#l\r\n#L6# Bruxo, nível 70#l\r\n#L7# Arqueiro, nível 70#l\r\n#L8# Gatuno poderoso com adaga, nível 70#l\r\n#L9# Gatuno sortudo com adaga, atirador de shurikens, nível 70#l#k");
                        if (v2 == 0) Etc.SetAP(target, 120, 42, 4, 4);
                        else if (v2 == 1) Etc.SetAP(target, 4, 4, 129, 33);
                        else if (v2 == 2) Etc.SetAP(target, 35, 127, 4, 4);
                        else if (v2 == 3) Etc.SetAP(target, 20, 60, 4, 86);
                        else if (v2 == 4) Etc.SetAP(target, 4, 60, 4, 102);
                        else if (v2 == 5) Etc.SetAP(target, 255, 120, 4, 4);
                        else if (v2 == 6) Etc.SetAP(target, 4, 4, 294, 73);
                        else if (v2 == 7) Etc.SetAP(target, 75, 292, 4, 4);
                        else if (v2 == 8) Etc.SetAP(target, 55, 110, 4, 206);
                        else if (v2 == 9) Etc.SetAP(target, 4, 110, 4, 257);
                    }
                    else if (v1 == 5) target.Inventory.ExchangeMesos(1000000);
                    else if (v1 == 6)
                    {
                        var v2 = self.AskMenu("Para escolher suas armas, precisa primeiro selecionar sua carreira. Qual destes?#b\r\n#L0# Guerreiro#l\r\n#L1# Bruxo#l\r\n#L2# Arqueiro#l\r\n#L3# Gatuno#l#k");
                        if (v2 == 0)
                        {
                            v3 = self.AskMenu("Qual arma você quer?#b\r\n#L0# Arma de nível 30, guerreiro#l\r\n#L1# Arma de nível 70, guerreiro#l\r\n#L2# Arma de nível 80, guerrerio#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1302008, 1, 1312005, 1, 1322014, 1, 1402002, 1, 1412006, 1, 1422001, 1, 1432002, 1, 1442001, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 8 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1302012, 1, 1312010, 1, 1322019, 1, 1402012, 1, 1412008, 1, 1422010, 1, 1432007, 1, 1442008, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 8 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1302018, 1, 1312011, 1, 1322028, 1, 1402015, 1, 1412009, 1, 1422012, 1, 1432010, 1, 1442019, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 8 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                        else if (v2 == 1)
                        {
                            v3 = self.AskMenu("Qual arma você quer?#b\r\n#L0# Arma de nível 30, bruxo#l\r\n#L1# Arma de nível 70, bruxo#l\r\n#L2# Arma de nível 80, bruxo#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1372001, 1, 1382002, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 2 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1382007, 1, 1382010, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 2 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1382008, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 1 slot disponível para o inventário de equipamento.");
                            }
                        }
                        else if (v2 == 2)
                        {
                            v3 = self.AskMenu("Qual arma você quer?#b\r\n#L0# Arma de nível 30, arqueiro#l\r\n#L1# Arma de nível 70, arqueiro#l\r\n#L2# Arma de nível 80, arqueiro#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1452005, 1, 1462004, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 2 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1452011, 1, 1462009, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 2 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1452015, 1, 1462013, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 2 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                        else
                        {
                            v3 = self.AskMenu("Qual arma você quer?#b\r\n#L0# Arma de nível 30, gatuno#l\r\n#L1# Arma de nível 70, gatuno#l\r\n#L2# Arma de nível 80, gatuno#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1332009, 1, 1332012, 1, 1472010, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 3 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1332019, 1, 1332018, 1, 1472029, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 3 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1332022, 1, 1332023, 1, 1472031, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 3 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                    }
                    else if (v1 == 7)
                    {
                        var v2 = self.AskMenu("Para escolher suas armas, precisa primeiro selecionar sua carreira. Qual destes?#b\r\n#L0# Guerreiro#l\r\n#L1# Guerreira#l\r\n#L2# Bruxo#l\r\n#L3# Bruxa#l\r\n#L4# Arqueiro#l\r\n#L5# Arqueira#l\r\n#L6# Gatuno#l\r\n#L7# Gatuna#l#k");
                        if (v2 == 0)
                        {
                            v3 = self.AskMenu("Qual armadura para guerreiro você quer?#b\r\n#L0# Armadura de Nível 30#l\r\n#L1# Armadura de Nível 70#l\r\n#L2# Armadura de Nível 80#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1002023, 1, 1032006, 1, 1040026, 1, 1060016, 1, 1082006, 1, 1072040, 1, 1092002, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1002030, 1, 1032015, 1, 1040104, 1, 1060092, 1, 1082105, 1, 1072156, 1, 1092017, 1, 1102024, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 8 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1002340, 1, 1032016, 1, 1050082, 1, 1082117, 1, 1072212, 1, 1092017, 1, 1102030, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                        else if (v2 == 1)
                        {
                            v3 = self.AskMenu("Qual armadura para guerreira você quer?#b\r\n#L0# Armadura de Nível 30#l\r\n#L1# Armadura de Nível 70#l\r\n#L2# Armadura de Nível 80#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1002023, 1, 1032006, 1, 1051010, 1, 1082006, 1, 1072040, 1, 1092002, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 6 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1002030, 1, 1032015, 1, 1041099, 1, 1061098, 1, 1082105, 1, 1072156, 1, 1092017, 1, 1102024, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 8 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1002340, 1, 1032016, 1, 1051078, 1, 1082117, 1, 1072212, 1, 1092017, 1, 1102030, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                        else if (v2 == 2)
                        {
                            v3 = self.AskMenu("Qual armadura para bruxo você quer?#b\r\n#L0# Armadura de Nível 30#l\r\n#L1# Armadura de Nível 70#l\r\n#L2# Armadura de Nível 80#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1002013, 1, 1032007, 1, 1050029, 1, 1082053, 1, 1072078, 1, 1092008, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 6 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1002254, 1, 1032015, 1, 1050069, 1, 1082100, 1, 1072160, 1, 1092008, 1, 1102024, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1002274, 1, 1032016, 1, 1050073, 1, 1082123, 1, 1072179, 1, 1092008, 1, 1102030, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                        else if (v2 == 3)
                        {
                            v3 = self.AskMenu("Qual armadura para bruxa você quer?#b\r\n#L0# Armadura de Nível 30#l\r\n#L1# Armadura de Nível 70#l\r\n#L2# Armadura de Nível 80#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1002013, 1, 1032007, 1, 1041053, 1, 1061049, 1, 1082053, 1, 1072078, 1, 1092008, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1002254, 1, 1032015, 1, 1051054, 1, 1082100, 1, 1072160, 1, 1092008, 1, 1102024, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1002274, 1, 1032016, 1, 1051058, 1, 1082123, 1, 1072179, 1, 1092008, 1, 1102030, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                        else if (v2 == 4)
                        {
                            v3 = self.AskMenu("Qual armadura para arqueiro você quer?#b\r\n#L0# Armadura de Nível 30#l\r\n#L1# Armadura de Nível 70#l\r\n#L2# Armadura de Nível 80#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1002165, 1, 1032006, 1, 1040068, 1, 1060057, 1, 1082050, 1, 1072082, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 6 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1002289, 1, 1032015, 1, 1050063, 1, 1082108, 1, 1072167, 1, 1102024, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 6 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1002278, 1, 1032016, 1, 1050077, 1, 1082112, 1, 1072185, 1, 1102030, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 6 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                        else if (v2 == 5)
                        {
                            v3 = self.AskMenu("Qual armadura para arqueira você quer?#b\r\n#L0# Armadura de Nível 30#l\r\n#L1# Armadura de Nível 70#l\r\n#L2# Armadura de Nível 80#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1002165, 1, 1032006, 1, 1041054, 1, 1061050, 1, 1082050, 1, 1072082, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 3 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1002289, 1, 1032015, 1, 1051064, 1, 1082108, 1, 1072167, 1, 1102024, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 3 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1002278, 1, 1032016, 1, 1051068, 1, 1082112, 1, 1072185, 1, 1102030, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 3 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                        else if (v2 == 6)
                        {
                            v3 = self.AskMenu("Qual armadura para gatuno você quer?#b\r\n#L0# Armadura de Nível 30#l\r\n#L1# Armadura de Nível 70#l\r\n#L2# Armadura de Nível 80#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1002175, 1, 1032007, 1, 1040057, 1, 1060043, 1, 1082044, 1, 1072036, 1, 1092008, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1002285, 1, 1032015, 1, 1040106, 1, 1060094, 1, 1082097, 1, 1072163, 1, 1092008, 1, 1102024, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 8 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1002330, 1, 1032016, 1, 1040109, 1, 1060098, 1, 1082120, 1, 1072174, 1, 1092008, 1, 1102030, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 8 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                        else
                        {
                            v3 = self.AskMenu("Qual armadura para gatuna você quer?#b\r\n#L0# Armadura de Nível 30#l\r\n#L1# Armadura de Nível 70#l\r\n#L2# Armadura de Nível 80#l#k");
                            if (v3 == 0)
                            {
                                ret = inventory.Exchange(0, 1002175, 1, 1032007, 1, 1041048, 1, 1061044, 1, 1082044, 1, 1072036, 1, 1092008, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 7 slots disponíveis para o inventário de equipamento.");
                            }
                            else if (v3 == 1)
                            {
                                ret = inventory.Exchange(0, 1002285, 1, 1032015, 1, 1041103, 1, 1061102, 1, 1082097, 1, 1072163, 1, 1092008, 1, 1102024, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 8 slots disponíveis para o inventário de equipamento.");
                            }
                            else
                            {
                                ret = inventory.Exchange(0, 1002330, 1, 1032016, 1, 1041106, 1, 1061105, 1, 1082120, 1, 1072174, 1, 1092008, 1, 1102030, 1);
                                if (ret == 0) self.Say("Tenha, ao menos, 8 slots disponíveis para o inventário de equipamento.");
                            }
                        }
                    }
                    else if (v1 == 8)
                    {
                        var v2 = self.AskMenu("Quanto disso você quer?#b\r\n#L0# Ganhar 1 PP#l\r\n#L1# Ganhar 30 PP#l\r\n#L2# Ganhar 100 PP#l\r\n#L3# Perder 1 PP#l");
                        if (v2 == 0) target.IncSP(1, 0);
                        else if (v2 == 1) target.IncSP(30, 0);
                        else if (v2 == 2) target.IncSP(100, 0);
                        else target.IncSP(-1, 0);
                    }
                    else if (v1 == 9)
                    {
                        var v2 = self.AskMenu("O que você quer?#b\r\n#L0# 200 Elixires Energéticos#l\r\n#L1# 100 remédios perfeitos#l\r\n#L2# 100 pedras convocadoras#l\r\n#L3# 100 pedras mágicas#l#k");
                        if (v2 == 0) ret = inventory.Exchange(0, 2000005, 100, 2000005, 100);
                        else if (v2 == 1) ret = inventory.Exchange(0, 2050004, 100);
                        else if (v2 == 2) ret = inventory.Exchange(0, 4006001, 100);
                        else ret = inventory.Exchange(0, 4006000, 100);
                    }
                    else if (v1 == 10)
                    {
                        var v2 = self.AskMenu("Somente 60% de pergaminhos disponíveis aqui!#b\r\n#L0# 100 #t2043001#s#l\r\n#L1# 100 #t2043101#s#l\r\n#L2# 100 #t2043201#s#l\r\n#L3# 100 #t2043301#s#l\r\n#L4# 100 #t2043701#s#l\r\n#L5# 100 #t2043801#s#l\r\n#L6# 100 #t2044001#s#l\r\n#L7# 100 #t2044101#s#l\r\n#L8# 100 #t2044201#s#l\r\n#L9# 100 #t2044301#s#l\r\n#L10# 100 #t2044401#s#l\r\n#L11# 100 #t2044501#s#l\r\n#L12# 100 #t2044601#s#l\r\n#L13# 100 #t2044701#s#l");
                        if (v2 == 0) ret = inventory.Exchange(0, 2043001, 100);
                        else if (v2 == 1) ret = inventory.Exchange(0, 2043101, 100);
                        else if (v2 == 2) ret = inventory.Exchange(0, 2043201, 100);
                        else if (v2 == 3) ret = inventory.Exchange(0, 2043301, 100);
                        else if (v2 == 4) ret = inventory.Exchange(0, 2043701, 100);
                        else if (v2 == 5) ret = inventory.Exchange(0, 2043801, 100);
                        else if (v2 == 6) ret = inventory.Exchange(0, 2044001, 100);
                        else if (v2 == 7) ret = inventory.Exchange(0, 2044101, 100);
                        else if (v2 == 8) ret = inventory.Exchange(0, 2044201, 100);
                        else if (v2 == 9) ret = inventory.Exchange(0, 2044301, 100);
                        else if (v2 == 10) ret = inventory.Exchange(0, 2044401, 100);
                        else if (v2 == 11) ret = inventory.Exchange(0, 2044501, 100);
                        else if (v2 == 12) ret = inventory.Exchange(0, 2044601, 100);
                        else ret = inventory.Exchange(0, 2044701, 100);
                    }
                    else if (v1 == 11)
                    {
                        var v2 = self.AskMenu("Somente 60% de pergaminhos disponíveis aqui!#b\r\n#L0# 100 #t2040001#s#l\r\n#L1# 100 #t2040301#s#l\r\n#L2# 100 #t2040401#s#l\r\n#L3# 100 #t2040501#s#l\r\n#L4# 100 #t2040504#s#l\r\n#L5# 100 #t2040601#s#l\r\n#L6# 100 #t2040704#s#l\r\n#L7# 100 #t2040801#s#l\r\n#L8# 100 #t2040804#s#l\r\n#L9# 100 #t2040901#s#l\r\n#L10# 100 #t2041013#s#l\r\n#L11# 100 #t2041016#s#l\r\n#L12# 100 #t2041019#s#l\r\n#L13# 100 #t2041022#s#l#k");
                        if (v2 == 0) ret = inventory.Exchange(0, 2040001, 100);
                        else if (v2 == 1) ret = inventory.Exchange(0, 2040301, 100);
                        else if (v2 == 2) ret = inventory.Exchange(0, 2040401, 100);
                        else if (v2 == 3) ret = inventory.Exchange(0, 2040501, 100);
                        else if (v2 == 4) ret = inventory.Exchange(0, 2040504, 100);
                        else if (v2 == 5) ret = inventory.Exchange(0, 2040601, 100);
                        else if (v2 == 6) ret = inventory.Exchange(0, 2040704, 100);
                        else if (v2 == 7) ret = inventory.Exchange(0, 2040801, 100);
                        else if (v2 == 8) ret = inventory.Exchange(0, 2040804, 100);
                        else if (v2 == 9) ret = inventory.Exchange(0, 2040901, 100);
                        else if (v2 == 10) ret = inventory.Exchange(0, 2041013, 100);
                        else if (v2 == 11) ret = inventory.Exchange(0, 2041016, 100);
                        else if (v2 == 12) ret = inventory.Exchange(0, 2041019, 100);
                        else ret = inventory.Exchange(0, 2041022, 100);
                    }
                    else if (v1 == 12)
                    {
                        var v2 = self.AskMenu("O que você quer?#b\r\n#L0# 5 jogos de Shurikens#l\r\n#L1# 5 jogos de flechas de aço para o arco#l\r\n#L2# 5 jogos de flechas de aço para besta#l#k");
                        if (v2 == 0) ret = inventory.Exchange(0, 2070006, 800, 2070006, 800, 2070006, 800, 2070006, 800, 2070006, 800);
                        else if (v2 == 1) ret = inventory.Exchange(0, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800);
                        else ret = inventory.Exchange(0, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800);
                    }
                    else if (v1 == 13)
                    {
                        var v2 = self.AskMenu("O que você quer?#b\r\n#L0# Eliminar PP restante #l\r\n#L1# Eliminar PP restante #l#k");
                        if (v2 == 0) target.IncAP((short)-target.AP, 0);
                        else if (v2 == 1) target.IncSP((short)-target.SP, 0);
                    }
                    else if (v1 == 14)
                    {
                        var v2 = self.AskMenu("O que você quer?#b\r\n#L0# Intimidade bicho +1#l\r\n#L1# Intimidade bicho +10#l\r\n#L2# Intimidade bicho +100#l\r\n#L3# intimidade aninal +1000#l#k");
                        if (v2 == 0) target.IncPetTame(1);
                        else if (v2 == 1) target.IncPetTame(10);
                        else if (v2 == 2) target.IncPetTame(100);
                        else target.IncPetTame(1000);
                    }
                    else if (v1 == 15)
                    {
                        var v2 = self.AskMenu("O que você quer?#b\r\n#L0# Fama +1#l\r\n#L1# Fama +10#l\r\n#L2# Fama +20#l#k");
                        if (v2 == 0) target.IncPOP(1, 0);
                        else if (v2 == 1) target.IncPOP(10, 0);
                        else target.IncPOP(20, 0);
                    }
                    else if (v1 == 16)
                    {
                        var v2 = self.AskMenu("Escolha sua carreira!#b\r\n#L0# Guerreiro#l\r\n#L1# Bruxo#l\r\n#L2# Arqueiro#l\r\n#L3# Gatuno#l#k");
                        if (v2 == 0)
                        {
                            v3 = self.AskMenu("Escolha de novo.#b\r\n#L0# Soldado, Nível 60 #l\r\n#L1# Escudeiro, Nível 60 #l\r\n#L2# Lanceiro, Nível 60 #l\r\n"
                            + "#L3# Templário, Nível 100 #l\r\n#L4# Cavaleiro, Nível 100 #l\r\n#L5# Cavaleiro Draconiano, Nível 100 #l\r\n"
                            + "#L6#Templário, Nível 120 #l\r\n#L7# Cavaleiro, Nível 120 #l\r\n#L8# Cavaleiro Draconiano, Nível 120 #l\r\n"
                            + "#L9# Herói, Nível 160 #l\r\n#L10#Paladino, Nível 160 #l\r\n#L11#Cavaleiro Negro, Nível 160 #l\r\n#k");
                            //Level 60 Crusader 
                            if (v3 == 0)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }
                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1402011, 1, 1312009, 1, 1302011, 1, 1412007, 1, 1102014, 1, 1002101, 1, 1082061, 1, 1072149, 1, 1040093, 1, 1060082, 1, 1032014, 1, 1092011, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1402011, 1, 1312009, 1, 1302011, 1, 1412007, 1, 1102014, 1, 1002101, 1, 1082061, 1, 1072149, 1, 1041092, 1, 1061091, 1, 1032014, 1, 1092011, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 110) target.Job = 110;
                                if (target.POP < 20)
                                {
                                    short upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 3980, 387);
                                Etc.SetAP(target, 230, 84, 4, 4);
                            }
                            if (v3 == 1)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }
                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1402011, 1, 1302011, 1, 1422009, 1, 1322018, 1, 1102014, 1, 1002101, 1, 1082061, 1, 1072149, 1, 1040093, 1, 1060082, 1, 1032014, 1, 1092011, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1402011, 1, 1302011, 1, 1422009, 1, 1322018, 1, 1102014, 1, 1002101, 1, 1082061, 1, 1072149, 1, 1041092, 1, 1061091, 1, 1032014, 1, 1092011, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 110) target.Job = 110;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 3980, 387);
                                Etc.SetAP(target, 246, 66, 4, 4);
                            }
                            if (v3 == 2)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }
                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1432004, 1, 1442010, 1, 1102014, 1, 1002101, 1, 1082061, 1, 1072149, 1, 1040093, 1, 1060082, 1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1432004, 1, 1442010, 1, 1102014, 1, 1002101, 1, 1082061, 1, 1072149, 1, 1041092, 1, 1061091, 1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 110) target.Job = 110;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 3980, 387);
                                Etc.SetAP(target, 230, 84, 4, 4);
                            }
                            //100Fighter 
                            else if (v3 == 3)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }
                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113, 1, 1060102, 1, 1312015, 1, 1302023, 1, 1402016, 1, 1412010, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1312015, 1, 1302023, 1, 1402016, 1, 1412010, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 111) target.Job = 111;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 5943, 561);
                                Etc.SetAP(target, 407, 110, 4, 4);
                                //					target.IncSP( 30, 0 ); 
                            }
                            //Page 
                            else if (v3 == 4)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }
                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113, 1, 1060102, 1, 1302023, 1, 1402016, 1, 1422013, 1, 1322029, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1312015, 1, 1322029, 1, 1332026, 1, 1322029, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 121) target.Job = 121;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 5943, 561);
                                Etc.SetAP(target, 407, 110, 4, 4);
                                //					target.IncSP( 30, 0 ); 
                            }
                            //Spearman 
                            else if (v3 == 5)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }

                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113, 1, 1060102, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }
                                if (target.Job != 131) target.Job = 131;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 5943, 561);
                                Etc.SetAP(target, 407, 110, 4, 4);
                                //					target.IncSP( 50, 0 ); 
                            }
                            //Level 120 
                            else if (v3 == 6)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }
                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113, 1, 1060102, 1, 1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 111) target.Job = 111;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 7776, 683);
                                Etc.SetAP(target, 477, 140, 4, 4);
                                //					target.IncSP( 30, 0 ); 
                            }
                            //Page 
                            else if (v3 == 7)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }
                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113, 1, 1060102, 1, 1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 121) target.Job = 121;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 7776, 683);
                                Etc.SetAP(target, 477, 140, 4, 4);
                                //					target.IncSP( 30, 0 ); 
                            }
                            //Spearman 
                            else if (v3 == 8)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }

                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113, 1, 1060102, 1, 1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }
                                if (target.Job != 131) target.Job = 131;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 7776, 683);
                                Etc.SetAP(target, 477, 140, 4, 4);
                                //					target.IncSP( 50, 0 ); 
                            }
                            //160 
                            else if (v3 == 9)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }
                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1040121, 1, 1060110, 1, 1312031, 1, 1402036, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1312031, 1, 1402036, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 112) target.Job = 112;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 9776, 683);
                                Etc.SetAP(target, 627, 200, 4, 4);
                            }
                            //Paladin 
                            else if (v3 == 10)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }
                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1040121, 1, 1060110, 1, 1322052, 1, 1402036, 1, 1422028, 1, 1302059, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1322052, 1, 1402036, 1, 1422028, 1, 1302059, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 122) target.Job = 122;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 9776, 683);
                                Etc.SetAP(target, 627, 200, 4, 4);
                            }
                            //Spearman 
                            else if (v3 == 11)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }

                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1040121, 1, 1060110, 1, 1442045, 1, 1432038, 1, 2000005, 100, 2000005, 100, 2000005, 100); //°ñµåÄ®Ä­, ´ÙÅ©±×·¹ÀÌ½º, µþ±â±Í°í¸®, ´ÙÅ© Æä·ÎÄ¡, ±×¸° Å©¸®¼¾Æ®ºÎÃ÷, ÀÚÀÏ½ºÀÇ ¸ÁÅä 
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1442045, 1, 1432038, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                }

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }
                                if (target.Job != 132) target.Job = 132;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 9776, 683);
                                Etc.SetAP(target, 627, 200, 4, 4);
                            }
                            //¹ý»ç 
                        }
                        else if (v2 == 1)
                        {
                            v3 = self.AskMenu("¶Ç °ñ¶ó~#b\r\n#L0# Level 60 Fire & Poison Wizard#l\r\n#L1# Level 60 Ice & Lightning Wizard#l\r\n#L2# Level 60 Cleric#l\r\n"
                            + "#L3# Mago de fogo/veneno, Nível 100 #l\r\n#L4# Mago de gelo/raio, Nível 100 #l\r\n#L5# Sacerdote, Nível 100 #l\r\n"
                            + "#L6#Mago de fogo/veneno, Nível 120 #l\r\n#L7#Mago de gelo/raio, Nível 120 #l\r\n#L8#Sacerdote, Nível 120 #l\r\n"
                            + "#L9#Arquimago de fogo/veneno, Nível 160 #l\r\n#L10# Arquimago de gelo/raio, Nível 160 #l\r\n#L11#Bispo, Nível 160 #l#k");
                            if (v3 == 0)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1050056, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1051047, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 210) target.Job = 210;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 812, 2804);
                                Etc.SetAP(target, 4, 4, 524, 93);
                                //						target.IncSP( 50, 0 ); 

                            }
                            else if (v3 == 1)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1050056, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1051047, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 220) target.Job = 220;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 812, 2804);
                                Etc.SetAP(target, 4, 4, 524, 93);
                                //						target.IncSP( 50, 0 ); 

                            }
                            else if (v3 == 2)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1050056, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1051047, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 230) target.Job = 230;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 812, 2804);
                                Etc.SetAP(target, 4, 4, 524, 93);
                                //						target.IncSP( 50, 0 ); 

                            }
                            //100 
                            else if (v3 == 3)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 211) target.Job = 211;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1273, 4308);
                                Etc.SetAP(target, 4, 4, 414, 103);
                            }

                            else if (v3 == 4)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 221) target.Job = 221;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1273, 4308);
                                Etc.SetAP(target, 4, 4, 414, 103);
                            }
                            else if (v3 == 5)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 231) target.Job = 231;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1273, 4308);
                                Etc.SetAP(target, 4, 4, 414, 103);
                            }
                            //120 
                            else if (v3 == 6)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 211) target.Job = 211;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1584, 5324);
                                Etc.SetAP(target, 4, 4, 524, 103);
                            }

                            else if (v3 == 7)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 221) target.Job = 221;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1584, 5324);
                                Etc.SetAP(target, 4, 4, 524, 103);
                            }
                            else if (v3 == 8)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 231) target.Job = 231;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1584, 5324);
                                Etc.SetAP(target, 4, 4, 524, 103);
                            }
                            //160 
                            else if (v3 == 9)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 212) target.Job = 212;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 2584, 7324);
                                Etc.SetAP(target, 4, 4, 674, 153);
                            }

                            else if (v3 == 10)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 222) target.Job = 222;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 2584, 7324);
                                Etc.SetAP(target, 4, 4, 674, 153);
                            }
                            else if (v3 == 11)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 232) target.Job = 232;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 2584, 7324);
                                Etc.SetAP(target, 4, 4, 674, 153);
                            }
                        }
                        //±Ã¼ö 
                        else if (v2 == 2)
                        {
                            v3 = self.AskMenu("Escolha de novo.#b\r\n#L0# Caçador, Nível 60 #l\r\n#L1# Arqueiro, Nível 60 #l\r\n"
                            + "#L2# Ranger, Nível 100 #l\r\n#L3# Atirador, Nível 100 #l\r\n"
                            + "#L4# Ranger, Nível 120 #l\r\n#L5# Atirador, Nível 120 #l\r\n"
                            + "#L6#Mestre Arqueiro, Nível 160 #l\r\n#L7#Marcador Nível, 160 #l");
                            if (v3 == 0)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1452004, 1, 1102014, 1, 1032014, 1, 1050059, 1, 1072146, 1, 1082091, 1, 1002269, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800);
                                else ret = inventory.Exchange(4000000, 1452004, 1, 1102014, 1, 1032014, 1, 1051042, 1, 1072146, 1, 1082091, 1, 1002269, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 311) target.Job = 311;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1577, 880);
                                Etc.SetAP(target, 65, 247, 4, 4);
                            }
                            else if (v3 == 1)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1462008, 1, 1102014, 1, 1032014, 1, 1050059, 1, 1072146, 1, 1082091, 1, 1002269, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800);
                                else ret = inventory.Exchange(4000000, 1462008, 1, 1102014, 1, 1032014, 1, 1051042, 1, 1072146, 1, 1082091, 1, 1002269, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 321) target.Job = 321;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1577, 880);
                                Etc.SetAP(target, 60, 252, 4, 4);
                            }
                            //100 
                            else if (v3 == 2)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1050107, 1, 1452017, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800);
                                else ret = inventory.Exchange(4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1051102, 1, 1452017, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 311) target.Job = 311;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 2831, 1468);
                                Etc.SetAP(target, 100, 417, 4, 4);
                            }
                            else if (v3 == 3)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1050107, 1, 1462018, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800);
                                else ret = inventory.Exchange(4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1051102, 1, 1462018, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 321) target.Job = 321;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 2831, 1468);
                                Etc.SetAP(target, 95, 422, 4, 4);
                            }
                            else if (v3 == 4)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1050107, 1, 1452021, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800);
                                else ret = inventory.Exchange(4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1051102, 1, 1452021, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 311) target.Job = 311;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 3366, 1769);
                                Etc.SetAP(target, 95, 521, 4, 4);
                            }
                            else if (v3 == 5)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1050107, 1, 1462018, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800);
                                else ret = inventory.Exchange(4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1051102, 1, 1462018, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 321) target.Job = 321;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 3366, 1769);
                                Etc.SetAP(target, 90, 526, 4, 4);
                            }
                            else if (v3 == 6)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1002407, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1050107, 1, 1452044, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800);
                                else ret = inventory.Exchange(4000000, 1002407, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1051102, 1, 1452044, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 312) target.Job = 312;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 4366, 2769);
                                Etc.SetAP(target, 155, 671, 4, 4);
                            }
                            else if (v3 == 7)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1002407, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1050107, 1, 1462039, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800);
                                else ret = inventory.Exchange(4000000, 1002407, 1, 1032023, 1, 1082127, 1, 1072204, 1, 1102035, 1, 1051102, 1, 1462039, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 322) target.Job = 322;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 4366, 2769);
                                Etc.SetAP(target, 150, 676, 4, 4);
                            }
                        }
                        //µµÀû 
                        else if (v2 == 3)
                        {
                            v3 = self.AskMenu("Escolha de novo.#b\r\n#L0#Arruaceiro, Nível 60 #l\r\n#L1#Mercenário Nível 60 #l\r\n"
                            + "#L2#Mestre Arruaceiro, Nível 100 #l\r\n#L3# Andarilho, Nível 100 #l\r\n"
                            + "#L4# Mestre Arruaceiro, Nível 120 #l\r\n#L5#Andarilho, Nível 120 #l\r\n"
                            + "#L6# Desordeiro, Nível 160 #l\r\n#L7#Algoz, Nível 160 #l");
                            if (v3 == 0)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1332015, 1, 1102014, 1, 1072152, 1, 1082094, 1, 1002248, 1, 1040100, 1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1332015, 1, 1102014, 1, 1072152, 1, 1082094, 1, 1002248, 1041096, 1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 420) target.Job = 420;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1561, 1018);
                                Etc.SetAP(target, 4, 100, 4, 212);
                            }
                            else if (v3 == 1)
                            {
                                if (target.Level < 60)
                                {
                                    self.Say("Você não é Nível 60! Aumente para 60");
                                    return;
                                }

                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1472025, 1, 1102014, 1, 1072152, 1, 1082094, 1, 1002248, 1, 1040100, 1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                    if (ret == 0)
                                    {
                                        self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                        return;
                                    }

                                    ret = inventory.ExchangeEx(0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800);
                                    if (ret == 0)
                                    {
                                        self.Say("Não pude te dar a shuriken, pois seu inventário de uso estava cheio. Pegue mais tarde, está bem? Tecle Próxima!");
                                        //						return; 
                                    }
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1472025, 1, 1102014, 1, 1072152, 1, 1082094, 1, 1002248, 1, 1041096, 1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                    if (ret == 0)
                                    {
                                        self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                        return;
                                    }

                                    ret = inventory.ExchangeEx(0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800);
                                    if (ret == 0)
                                    {
                                        self.Say("Não pude te dar a shuriken, pois seu inventário de uso estava cheio. Pegue mais tarde, está bem? Tecle Próxima!");
                                        //						return; 
                                    }
                                }

                                if (target.Job != 410) target.Job = 410;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 1561, 1018);
                                Etc.SetAP(target, 4, 130, 4, 487);
                            }

                            //100 
                            else if (v3 == 2)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092018, 1, 1002326, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1050097, 1, 1332027, 1, 1332026, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092018, 1, 1002326, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1051091, 1, 1332027, 1, 1332026, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 421) target.Job = 421;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 2824, 1818);
                                Etc.SetAP(target, 4, 130, 4, 487);
                            }
                            else if (v3 == 3)
                            {
                                if (target.Level < 100)
                                {
                                    self.Say("Você não é Nível 100! Aumente para 100");
                                    return;
                                }

                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1002326, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1050097, 1, 1472033, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                    if (ret == 0)
                                    {
                                        self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                        return;
                                    }

                                    ret = inventory.ExchangeEx(0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800);
                                    if (ret == 0)
                                    {
                                        self.Say("Não pude te dar a shuriken, pois seu inventário de uso estava cheio. Pegue mais tarde, está bem? Tecle Próxima!");
                                        //						return; 
                                    }
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1002326, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1051091, 1, 1472033, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                    if (ret == 0)
                                    {
                                        self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                        return;
                                    }

                                    ret = inventory.ExchangeEx(0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800);
                                    if (ret == 0)
                                    {
                                        self.Say("Não pude te dar a shuriken, pois seu inventário de uso estava cheio. Pegue mais tarde, está bem? Tecle Próxima!");
                                        //						return; 
                                    }
                                }

                                if (target.Job != 411) target.Job = 411;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 2824, 1818);
                                Etc.SetAP(target, 4, 130, 4, 487);
                            }
                            else if (v3 == 4)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092018, 1, 1002326, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1050097, 1, 1332027, 1, 1332026, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092018, 1, 1002326, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1051091, 1, 1332027, 1, 1332026, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 421) target.Job = 421;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 3134, 2018);
                                Etc.SetAP(target, 4, 130, 4, 487);
                            }
                            else if (v3 == 5)
                            {
                                if (target.Level < 120)
                                {
                                    self.Say("Você não é Nível 120! Aumente para 120");
                                    return;
                                }

                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1002326, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1050097, 1, 1472033, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                    if (ret == 0)
                                    {
                                        self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                        return;
                                    }

                                    ret = inventory.ExchangeEx(0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800);
                                    if (ret == 0)
                                    {
                                        self.Say("Não pude te dar a shuriken, pois seu inventário de uso estava cheio. Pegue mais tarde, está bem? Tecle Próxima!");
                                        //						return; 
                                    }
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1002326, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1051091, 1, 1472033, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                    if (ret == 0)
                                    {
                                        self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                        return;
                                    }

                                    ret = inventory.ExchangeEx(0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800);
                                    if (ret == 0)
                                    {
                                        self.Say("Não pude te dar a shuriken, pois seu inventário de uso estava cheio. Pegue mais tarde, está bem? Tecle Próxima!");
                                        //						return; 
                                    }
                                }

                                if (target.Job != 411) target.Job = 411;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 3134, 2018);
                                Etc.SetAP(target, 4, 130, 4, 487);
                            }
                            //160				 
                            else if (v3 == 6)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }

                                if (target.Gender == 0) ret = inventory.Exchange(4000000, 1092018, 1, 1002382, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1050097, 1, 1332049, 1, 1332050, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                else ret = inventory.Exchange(4000000, 1092018, 1, 1002382, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1051091, 1, 1332049, 1, 1332050, 1, 2000005, 100, 2000005, 100, 2000005, 100);

                                if (ret == 0)
                                {
                                    self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                    return;
                                }

                                if (target.Job != 422) target.Job = 422;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 4134, 2818);
                                Etc.SetAP(target, 4, 180, 4, 637);
                            }
                            else if (v3 == 7)
                            {
                                if (target.Level < 160)
                                {
                                    self.Say("Você não é Nível 160! Aumente para 160");
                                    return;
                                }

                                if (target.Gender == 0)
                                {
                                    ret = inventory.Exchange(4000000, 1002382, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1050097, 1, 1472052, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                    if (ret == 0)
                                    {
                                        self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                        return;
                                    }

                                    ret = inventory.ExchangeEx(0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800);
                                    if (ret == 0)
                                    {
                                        self.Say("Não pude te dar a shuriken, pois seu inventário de uso estava cheio. Pegue mais tarde, está bem? Tecle Próxima!");
                                        //						return; 
                                    }
                                }
                                else
                                {
                                    ret = inventory.Exchange(4000000, 1002382, 1, 1032023, 1, 1082143, 1, 1072214, 1, 1102035, 1, 1051091, 1, 1472052, 1, 2000005, 100, 2000005, 100, 2000005, 100);
                                    if (ret == 0)
                                    {
                                        self.Say("Confira se seus inventários de equipamentos e de uso têm espaço suficiente.");
                                        return;
                                    }

                                    ret = inventory.ExchangeEx(0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800);
                                    if (ret == 0)
                                    {
                                        self.Say("Não pude te dar a shuriken, pois seu inventário de uso estava cheio. Pegue mais tarde, está bem? Tecle Próxima!");
                                        //						return; 
                                    }
                                }

                                if (target.Job != 412) target.Job = 412;
                                if (target.POP < 20)
                                {
                                    upPOP = (short)(20 - target.POP);
                                    target.IncPOP(upPOP, 0);
                                }
                                Etc.SetHPMP(target, 4134, 2818);
                                Etc.SetAP(target, 4, 180, 4, 637);
                            }
                        }
                    }
                    else if (v1 == 17)
                    {
                        job = target.Job;
                        if (job == 112)
                        {
                            target.LearnSkill(1121000); //¸ÞÀÌÇÃ¿ë»ç 
                            target.LearnSkill(1121001); //¸ó½ºÅÍ ¸¶±×³Ý 
                            target.LearnSkill(1121002);//½ºÅÄ½º 
                            target.LearnSkill(1120003);//¾îµå¹ê½ºµå ÄÞº¸ 
                            target.LearnSkill(1120004);
                            target.LearnSkill(1120005);
                            target.LearnSkill(1121006);
                            //					target.LearnSkill( 1121008 );//¿µ¿õÀÇ °Ë 
                            target.LearnSkill(1121010);
                            target.LearnSkill(1121011);
                        }
                        else if (job == 122)
                        {
                            target.LearnSkill(1221000); //¸ÞÀÌÇÃ¿ë»ç 
                            target.LearnSkill(1221001); //¸ó½ºÅÍ ¸¶±×³Ý 
                            target.LearnSkill(1221002);//½ºÅÄ½º 
                            target.LearnSkill(1221003);
                            target.LearnSkill(1221004);
                            target.LearnSkill(1220005);
                            target.LearnSkill(1220006);
                            target.LearnSkill(1221007);
                            //					target.LearnSkill( 1221009 );//ÅõÈ¥ 
                            target.LearnSkill(1220010);
                            target.LearnSkill(1221011);
                            target.LearnSkill(1221012);
                        }
                        else if (job == 132)
                        {
                            target.LearnSkill(1321000);
                            target.LearnSkill(1321001);
                            target.LearnSkill(1321002);
                            target.LearnSkill(1321003);
                            target.LearnSkill(1320005);
                            target.LearnSkill(1320006);
                            //					target.LearnSkill( 1321007 ); //°ËÀº¿µÈ¥ 
                            target.LearnSkill(1320008);
                            target.LearnSkill(1320009);
                            target.LearnSkill(1321010);
                        }
                        else if (job == 212)
                        {
                            target.LearnSkill(2121000);
                            target.LearnSkill(2121001);
                            target.LearnSkill(2121002);
                            target.LearnSkill(2121003);
                            target.LearnSkill(2121004);
                            target.LearnSkill(2121005);
                            //					target.LearnSkill( 2121006 ); //¸ÞµÎ»ç ¾ÆÀÌÁî 
                            target.LearnSkill(2121007);
                            target.LearnSkill(2121008);
                        }
                        else if (job == 222)
                        {
                            target.LearnSkill(2221000);
                            target.LearnSkill(2221001);
                            target.LearnSkill(2221002);
                            target.LearnSkill(2221003);
                            target.LearnSkill(2221004);
                            target.LearnSkill(2221005);
                            //					target.LearnSkill( 2221006 );//½ºÆÄÅ© 
                            target.LearnSkill(2221007);
                            target.LearnSkill(2221008);
                        }
                        else if (job == 232)
                        {
                            target.LearnSkill(2321000);
                            target.LearnSkill(2321001);
                            target.LearnSkill(2321002);
                            target.LearnSkill(2321003);
                            target.LearnSkill(2321004);
                            //					target.LearnSkill( 2321005 );//¸¶¹ýÂ÷´Ü 
                            target.LearnSkill(2321006);
                            target.LearnSkill(2321007);
                            target.LearnSkill(2321008);
                            target.LearnSkill(2321009);
                        }
                        else if (job == 312)
                        {
                            target.LearnSkill(3121000);
                            target.LearnSkill(3121002);
                            target.LearnSkill(3121003);
                            target.LearnSkill(3121004);
                            target.LearnSkill(3120005);
                            target.LearnSkill(3121006);
                            //					target.LearnSkill( 3121007 );//ÇÜ½ºÆ®¸µ 
                            target.LearnSkill(3121008);
                            target.LearnSkill(3121009);
                        }
                        else if (job == 322)
                        {
                            target.LearnSkill(3221000);
                            target.LearnSkill(3221001);
                            target.LearnSkill(3221002);
                            target.LearnSkill(3221003);
                            target.LearnSkill(3220004);
                            target.LearnSkill(3221005);
                            //					target.LearnSkill( 3221006 );//ºí¶óÀÎµå 
                            target.LearnSkill(3221007);
                            target.LearnSkill(3221008);
                        }
                        else if (job == 412)
                        {
                            target.LearnSkill(4121001);
                            target.LearnSkill(4121001);
                            target.LearnSkill(4120002);
                            target.LearnSkill(4121003);
                            target.LearnSkill(4121004);
                            target.LearnSkill(4120005);
                            target.LearnSkill(4121006);
                            //					target.LearnSkill( 4121007 );//Æ®¸®ÇÃ½º·Î¿ì 
                            target.LearnSkill(4121008);
                            target.LearnSkill(4121009);
                        }
                        else if (job == 422)
                        {
                            target.LearnSkill(4221000);
                            target.LearnSkill(4221001);
                            target.LearnSkill(4220002);
                            target.LearnSkill(4221003);
                            target.LearnSkill(4221004);
                            target.LearnSkill(4220005);
                            target.LearnSkill(4221006);
                            //					target.LearnSkill( 4221007 );//³¯Ä«·Î¿î Ä®³¯ 
                            target.LearnSkill(4221008);
                        }
                    }
                    else if (v1 == 18)
                    {
                        inventory = target.Inventory;
                        if (target.Job == 112) ret = inventory.Exchange(0, 2290096, 1, 2290000, 1, 2290001, 1, 2290002, 1, 2290003, 1, 2290004, 1, 2290005, 1, 2290006, 1, 2290007, 1, 2290014, 1, 2290015, 1, 2280007, 1, 2290008, 1, 2290009, 1, 2290010, 1, 2290011, 1, 2290016, 1, 2290017, 1);
                        else if (target.Job == 122) ret = inventory.Exchange(0, 2290096, 1, 2290000, 1, 2290001, 1, 2290002, 1, 2290003, 1, 2290004, 1, 2290005, 1, 2280008, 1, 2290006, 1, 2290007, 1, 2290012, 1, 2290013, 1, 2290014, 1, 2290015, 1, 2290018, 1, 2290019, 1, 2290020, 1, 2290021, 1);
                        else if (target.Job == 132) ret = inventory.Exchange(0, 2290096, 1, 2290000, 1, 2290001, 1, 2290002, 1, 2290003, 1, 2290004, 1, 2290005, 1, 2290006, 1, 2290007, 1, 2290022, 1, 2290023, 1);
                        else if (target.Job == 212) ret = inventory.Exchange(0, 2290096, 1, 2290024, 1, 2290025, 1, 2290026, 1, 2290027, 1, 2290028, 1, 2290029, 1, 2290030, 1, 2290031, 1, 2290036, 1, 2290037, 1, 2290038, 1, 2290039, 1, 2290040, 1, 2290041, 1);
                        else if (target.Job == 222) ret = inventory.Exchange(0, 2290096, 1, 2290024, 1, 2290025, 1, 2290026, 1, 2290027, 1, 2290028, 1, 2290029, 1, 2290032, 1, 2290033, 1, 2290042, 1, 2290043, 1, 2290044, 1, 2290045, 1, 2290046, 1, 2290047, 1);
                        else if (target.Job == 232) ret = inventory.Exchange(0, 2290096, 1, 2290024, 1, 2290025, 1, 2290026, 1, 2290027, 1, 2290028, 1, 2290029, 1, 2290034, 1, 2290035, 1, 2290048, 1, 2290049, 1, 2280009, 1, 2290050, 1, 2290051, 1);
                        else if (target.Job == 312) ret = inventory.Exchange(0, 2290096, 1, 2290052, 1, 2290053, 1, 2290054, 1, 2290055, 1, 2290056, 1, 2290057, 1, 2290058, 1, 2290059, 1, 2290060, 1, 2290061, 1, 2290062, 1, 2290063, 1, 2290064, 1, 2290065, 1);
                        else if (target.Job == 322) ret = inventory.Exchange(0, 2290096, 1, 2290052, 1, 2290053, 1, 2290054, 1, 2290055, 1, 2290066, 1, 2290067, 1, 2290068, 1, 2290069, 1, 2290070, 1, 2290071, 1, 2290072, 1, 2290073, 1, 2290074, 1, 2290075, 1);
                        else if (target.Job == 412) ret = inventory.Exchange(0, 2290096, 1, 2290076, 1, 2290077, 1, 2290078, 1, 2290079, 1, 2290080, 1, 2290081, 1, 2290082, 1, 2290083, 1, 2280010, 1, 2290084, 1, 2290085, 1, 2290086, 1, 2290087, 1, 2290088, 1, 2290089, 1);
                        else if (target.Job == 422) ret = inventory.Exchange(0, 2290096, 1, 2290076, 1, 2290077, 1, 2290078, 1, 2290079, 1, 2290080, 1, 2290081, 1, 2290082, 1, 2290083, 1, 2290090, 1, 2290091, 1, 2290092, 1, 2290093, 1, 2290094, 1, 2290095, 1);

                        if (ret == 0) self.Say("Não pude te dar a shuriken, pois seu inventário de uso estava cheio. Feche esta janela e fale novamente comigo.");
                    }
                }
                else self.Say("Become a GM!");
            }
        }
    }
}
