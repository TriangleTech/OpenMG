module "standard.s"; 

 // 
script "levelUPBRCB" {
/*	if ( target.nLevel < 25 and target.nLevel >= 15) {
		target.incEXP( 999999999, 0 );
	//	target.incMoney( 10000, 0 );
		strLog = "[" + target.sCharacterName + "] N�vel SUPERIOR" + target.nLevel;
		logEvent( strLog );
	}
	else self.say( "Only users of level 15~25 can level up through this NPC" );*/

	qr = target.questRecord;
	val = qr.get( 8299 );
	check = target.IsClosedBetaTester;
	inventory = target.inventory;
	nRet = self.askYesNo( "Os jogadores que participaram do Closed Beta t�m direito a uma Bandana Brasil! Caso voc� seja um, pode retirar seu pr�mio comigo." ); 
	if( nRet == 1 ) {
		if ( check == 1 and val == "" ) {
			if ( inventory.itemCount ( 1002795 ) < 1  )  {
				ret = inventory.exchange(0, 1002795, 1);
				if ( ret == 1 ) {
					self.say("Voc� recebeu a Bandana Brasil com sucesso. Parab�ns!");
					qr.set( 8299, "end" );
				}
				else self.say("Voc� n�o recebeu a Bandana Brasil. Por favor, verifique se seu invent�rio est� cheio.");
			}
			else self.say("Voc� j� tem uma Bandana Brasil e por isso n�o pode receber outra.");
		}
		else if ( check == 1 and val == "end" ) {
			self.say("Voc� j� tem uma Bandana Brasil e cada jogador participante do Closed Beta s� pode receber uma.");
		}
		else self.say(" Voc� n�o participou do per�odo de Closed Beta, por isso n�o receber� o item.");
	}
	else self.say("Por favor, volte mais tarde. Apenas os jogadores que participaram do Closed Beta t�m direito a receber uma Bandana Brasil.");
}

 // The NPC that lets you level up 
 script "levelUP2" { 
   cName = self.getStrReg( "name" ); 

   if ( target.sCharacterName == cName and target.nLevel < 200 ) { 
 		target.incEXP( 999999999, 0 ); 
 		target.incMoney( 10000, 0 ); 
 		strLog = "[" + target.sCharacterName + "] N�vel SUPERIOR" + target.nLevel; 
 		logEvent( strLog ); 
 	} 
 	else self.say( "Chegue a ser GM!" ); 
 } 

 // �ѹ�����Լ� 
 function setHPMP( integer newHP, integer newMP ) { 
 	if ( newHP != 0 ) target.incMHP( -(target.nMHP-1), 0 ); 
 	if ( newMP != 0 ) target.incMMP( -(target.nMMP-1), 0 ); 

 	if ( newHP != 0 ) target.incMHP( newHP, 0 ); 
 	if ( newMP != 0 ) target.incMMP( newMP, 0 ); 
 	if ( newHP != 0 ) target.incHP( newHP, 0); 
 	if ( newMP != 0 ) target.incMP( newMP, 0); 
 } 

 // �ɷ�ġ ���� �Լ� 
 function setAP( integer newStr, integer newDex, integer newInt, integer newLuk ) { 
 	target.incSTR( -target.nSTR, 0 ); 
 	target.incDEX( -target.nDEX, 0 ); 
 	target.incINT( -target.nINT, 0 ); 
 	target.incLUK( -target.nLUK, 0 ); 

 	target.incSTR( newStr, 0 ); 
 	target.incDEX( newDex, 0 ); 
 	target.incINT( newInt, 0 ); 
 	target.incLUK( newLuk, 0 ); 
 } 

 // GM job adv. 
 script "levelUP" { 
 	if ( target.isMaster == 1 ) { 
 		if ( target.nJob >= 500 ) self.say( "Voc� j� � um GM..." ); 
 		else { 
 			nRet = self.askYesNo( "Tem certeza de que quer se tornar um GM?" ); 
 			if ( nRet == 1 ) { 
 				inventory = target.inventory; 
 				ret = inventory.exchange( 0, 1002140, 1, 1042003, 1, 1062007, 1, 1322013, 1 ); 
 				if ( ret == 0 ) self.say( "Tenha 4 slots dispon�veis para o invent�rio de equipamento." ); 
 				else { 
 					target.incSTR( 999, 0 ); 
 					target.incDEX( 999, 0 ); 
 					target.incINT( 999, 0 ); 
 					target.incLUK( 999, 0 ); 
 					target.incMHP( 30000, 0 ); 
 					target.incMMP( 10000, 0 ); 
 					target.incSP( 255, 0 ); 
 					if (target.isSuperGM == 1) target.nJob = 510; else target.nJob = 500; 
 					self.say( "Daqui para frente, voc� � um GM." ); 
 				} 
 			} 
 		} 
 	} 
 	else { 
 			cName = self.getStrReg( "name" ); 

      if ( target.sCharacterName == cName ) { 
 			inventory = target.inventory; 

 			v1 = self.askMenu( "O que posso fazer por voc�?\r\n#b#L0# Atinja o 1� n�vel de carreira #l\r\n#L1# Atinja o 2� n�vel de carreira#l\r\n#L2# Atinja o 3� n�vel de carreira#l\r\n#L3# Atinja o 4� n�vel de carreira#l\r\n#L4# Ajuste PP#l\r\n#L5# Ganhe mesos#l\r\n#L6# Consiga armas relacionadas com a carreira#l\r\n#L7# Consiga armadura relacionada com a carreira #l\r\n#L8# Ganhe pontos de per�cia(PP)#l\r\n#L9# Ganhe po��es e etc.#l\r\n#L10# Ganhe listas de armas#l\r\n#L11# Ganhe listas de armaduras#l\r\n#L12# Ganhe estrelas voadoras e flechas#l\r\n#L13# Elimine os APs e PPs restantes#l\r\n#L14# Ganhe Bichos de estima��o EXP#l\r\n#L15# Ganhe fama#l\r\n#L16# Torne-se podereoso#l\r\n#L17# Aprenda as per�cias do #l\r\n#L18# Consiga o Livro de Per�cias 4� n�vel #l" ); 
 			if ( v1 == 0 ) { 
 			  v2 = self.askMenu( "Qual voc� quer que seja o 1� avan�o de carreira?#b\r\n#L0# Aprendiz#l\r\n#L1# Espadachim (guerreiro do 1� n�vel)#l\r\n#L2# Bruxo (bruxo do 1� n�vel)#l\r\n#L3# Arqueiro (arqueiro do 1� n�vel)#l\r\n#L4# Pilantra (gatuno do 1� n�vel)#l#k" ); 
 				if ( v2 == 0 ) target.nJob = 0; 
 				else if ( v2 == 1 ) target.nJob = 100; 
 				else if ( v2 == 2 ) target.nJob = 200; 
 				else if ( v2 == 3 ) target.nJob = 300; 
 				else target.nJob = 400; 
 			} 
 			else if ( v1 == 1 ) { 
 			  v2 = self.askMenu( "Qual voc� quer que seja o 2� avan�o de carreira?#b\r\n#L0# Soldado (guerreiro do 2� n�vel)#l\r\n#L1# Escudeiro (guerreiro do 2� n�vel)#l\r\n#L2# Lanceiro (guerreiro do 2� n�vel)#l\r\n#L3# Feiticeiro de fogo/veneno (bruxo do 2� n�vel)#l\r\n#L4# Feiticeiro de gelo/raio (bruxo do 2� n�vel)#l\r\n#L5# Cl�rigo (bruxo do 2� n�vel)#l\r\n#L6# Ca�ador (arqueiro do 2� n�vel)#l\r\n#L7# Balestreiro (arqueiro do 2� n�vel)#l\r\n#L8# Mercen�rio (gatuno do 2� n�vel)#l\r\n#L9# Arruaceiro (gatuno do 2� n�vel)#l#k" ); 
 				if ( v2 == 0 ) target.nJob = 110; 
 				else if ( v2 == 1 ) target.nJob = 120; 
 				else if ( v2 == 2 ) target.nJob = 130; 
 				else if ( v2 == 3 ) target.nJob = 210; 
 				else if ( v2 == 4 ) target.nJob = 220; 
 				else if ( v2 == 5 ) target.nJob = 230; 
 				else if ( v2 == 6 ) target.nJob = 310; 
 				else if ( v2 == 7 ) target.nJob = 320; 
 				else if ( v2 == 8 ) target.nJob = 410; 
 				else target.nJob = 420; 
 			} 
 			else if ( v1 == 2 ) { 
 				v2 = self.askMenu( "Qual voc� quer que seja o 3� avan�o de carreira?#b\r\n#L0# Templ�rio (guerreiro do 3� n�vel)#l\r\n#L1# Cavaleiro (guerreiro do 3� n�vel)#l\r\n#L2# Cavaleiro Draconiano (guerreiro do 3� n�vel)#l\r\n#L3# Mago de fogo/veneno (bruxo do 3� n�vel)#l\r\n#L4# Mago de gelo/raio (bruxo do 3� n�vel)#l\r\n#L5# Sacerdote (bruxo do 3� n�vel)#l\r\n#L6# Ranger (arqueiro do 3� n�vel)#l\r\n#L7# Atirador (arqueiro do 3� n�vel)#l\r\n#L8# Andarinho (gatuno do 3� n�vel)#l\r\n#L9# Mestre Arruaceiro (gatuno do 3� n�vel)#l#k" ); 
 				if ( v2 == 0 ) target.nJob = 111; 
 				else if ( v2 == 1 ) target.nJob = 121; 
 				else if ( v2 == 2 ) target.nJob = 131; 
 				else if ( v2 == 3 ) target.nJob = 211; 
 				else if ( v2 == 4 ) target.nJob = 221; 
 				else if ( v2 == 5 ) target.nJob = 231; 
 				else if ( v2 == 6 ) target.nJob = 311; 
 				else if ( v2 == 7 ) target.nJob = 321; 
 				else if ( v2 == 8 ) target.nJob = 411; 
 				else target.nJob = 421; 
 			} 
 			else if ( v1 == 3 ) { 
 				v2 = self.askMenu( "Qual destes voc� quer?#b\r\n#L0# Her�i (guerreiro do 4� n�vel)#l\r\n#L1# Paladino (guerreiro do 4� n�vel)#l\r\n#L2# Cavaleiro Negro (guerreiro do 4� n�vel)#l\r\n#L3# Arquimago de fogo/veneno (bruxo do 4� n�vel)#l\r\n#L4#Arquimago de gelo/raio (bruxo do 4� n�vel)#l\r\n#L5# Bispo (bruxo do 4� n�vel)#l\r\n#L6# Mestre Arqueiro (arqueiro do 4� n�vel)#l\r\n#L7# Atirador de Elite (arqueiro do 4� n�vel)#l\r\n#L8# Algoz (arqueiro do 4� n�vel)#l\r\n#L9# Desordeiro (gatuno do 4� n�vel)#l#k" ); 
 				if ( v2 == 0 ) target.nJob = 112; 
 				else if ( v2 == 1 ) target.nJob = 122; 
 				else if ( v2 == 2 ) target.nJob = 132; 
 				else if ( v2 == 3 ) target.nJob = 212; 
 				else if ( v2 == 4 ) target.nJob = 222; 
 				else if ( v2 == 5 ) target.nJob = 232; 
 				else if ( v2 == 6 ) target.nJob = 312; 
 				else if ( v2 == 7 ) target.nJob = 322; 
 				else if ( v2 == 8 ) target.nJob = 412; 
 				else target.nJob = 422; 
 			}			 
 			else if ( v1 == 4 ) { 
 				v2 = self.askMenu( "Irei ajustar somente seu FOR, DES, INT e SOR. Como gostaria de ser classificado?#b\r\n#L0# Guerreiro, n�vel 30#l\r\n#L1# Bruxo, n�vel 30#l\r\n#L2# Arqueiro, n�vel 30#l\r\n#L3# Gatuno poderoso com adaga, n�vel 30#l\r\n#L4# Gatuno sortudo com adaga, atirador de shurikens, n�vel 30#l\r\n#L5# Guerreiro, n�vel 70#l\r\n#L6# Bruxo, n�vel 70#l\r\n#L7# Arqueiro, n�vel 70#l\r\n#L8# Gatuno poderoso com adaga, n�vel 70#l\r\n#L9# Gatuno sortudo com adaga, atirador de shurikens, n�vel 70#l#k" ); 
 				if ( v2 == 0 ) setAP( 120, 42, 4, 4 ); 
 				else if ( v2 == 1 ) setAP( 4, 4, 129, 33 ); 
 				else if ( v2 == 2 ) setAP( 35, 127, 4, 4 ); 
 				else if ( v2 == 3 ) setAP( 20, 60, 4, 86 ); 
 				else if ( v2 == 4 ) setAP( 4, 60, 4, 102 ); 
 				else if ( v2 == 5 ) setAP( 255, 120, 4, 4 ); 
 				else if ( v2 == 6 ) setAP( 4, 4, 294, 73 ); 
 				else if ( v2 == 7 ) setAP( 75, 292, 4, 4 ); 
 				else if ( v2 == 8 ) setAP( 55, 110, 4, 206 ); 
 				else if ( v2 == 9 ) setAP( 4, 110, 4, 257 ); 
 			} 
 			else if ( v1 == 5 ) target.incMoney( 1000000, 0 ); 
 			else if ( v1 == 6 ) { 
 				v2 = self.askMenu( "Para escolher suas armas, precisa primeiro selecionar sua carreira. Qual destes?#b\r\n#L0# Guerreiro#l\r\n#L1# Bruxo#l\r\n#L2# Arqueiro#l\r\n#L3# Gatuno#l#k" ); 
 				if ( v2 == 0 ) { 
 					v3 = self.askMenu( "Qual arma voc� quer?#b\r\n#L0# Arma de n�vel 30, guerreiro#l\r\n#L1# Arma de n�vel 70, guerreiro#l\r\n#L2# Arma de n�vel 80, guerrerio#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1302008, 1, 1312005, 1, 1322014, 1, 1402002, 1, 1412006, 1, 1422001, 1, 1432002, 1, 1442001, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 8 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1302012, 1, 1312010, 1, 1322019, 1, 1402012, 1, 1412008, 1, 1422010, 1, 1432007, 1, 1442008, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 8 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1302018, 1, 1312011, 1, 1322028, 1, 1402015, 1, 1412009, 1, 1422012, 1, 1432010, 1, 1442019, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 8 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 				else if ( v2 == 1 ) { 
 					v3 = self.askMenu( "Qual arma voc� quer?#b\r\n#L0# Arma de n�vel 30, bruxo#l\r\n#L1# Arma de n�vel 70, bruxo#l\r\n#L2# Arma de n�vel 80, bruxo#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1372001, 1, 1382002, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 2 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1382007, 1, 1382010, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 2 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1382008, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 1 slot dispon�vel para o invent�rio de equipamento." ); 
 					} 
 				} 
 				else if ( v2 == 2 ) { 
 					v3 = self.askMenu( "Qual arma voc� quer?#b\r\n#L0# Arma de n�vel 30, arqueiro#l\r\n#L1# Arma de n�vel 70, arqueiro#l\r\n#L2# Arma de n�vel 80, arqueiro#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1452005, 1, 1462004, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 2 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1452011, 1, 1462009, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 2 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1452015, 1, 1462013, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 2 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 				else { 
 					v3 = self.askMenu( "Qual arma voc� quer?#b\r\n#L0# Arma de n�vel 30, gatuno#l\r\n#L1# Arma de n�vel 70, gatuno#l\r\n#L2# Arma de n�vel 80, gatuno#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1332009, 1, 1332012, 1, 1472010, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 3 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1332019, 1, 1332018, 1, 1472029, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 3 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1332022, 1, 1332023, 1, 1472031, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 3 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 			} 
 			else if ( v1 == 7 ) { 
 				v2 = self.askMenu( "Para escolher suas armas, precisa primeiro selecionar sua carreira. Qual destes?#b\r\n#L0# Guerreiro#l\r\n#L1# Guerreira#l\r\n#L2# Bruxo#l\r\n#L3# Bruxa#l\r\n#L4# Arqueiro#l\r\n#L5# Arqueira#l\r\n#L6# Gatuno#l\r\n#L7# Gatuna#l#k" ); 
 				if ( v2 == 0 ) { 
 					v3 = self.askMenu( "Qual armadura para guerreiro voc� quer?#b\r\n#L0# Armadura de N�vel 30#l\r\n#L1# Armadura de N�vel 70#l\r\n#L2# Armadura de N�vel 80#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1002023, 1, 1032006, 1, 1040026, 1, 1060016, 1, 1082006, 1, 1072040, 1, 1092002, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1002030, 1, 1032015, 1, 1040104, 1, 1060092, 1, 1082105, 1, 1072156, 1, 1092017, 1, 1102024, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 8 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1002340, 1, 1032016, 1, 1050082, 1, 1082117, 1, 1072212, 1, 1092017, 1, 1102030, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 				else if ( v2 == 1 ) { 
 					v3 = self.askMenu( "Qual armadura para guerreira voc� quer?#b\r\n#L0# Armadura de N�vel 30#l\r\n#L1# Armadura de N�vel 70#l\r\n#L2# Armadura de N�vel 80#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1002023, 1, 1032006, 1, 1051010, 1, 1082006, 1, 1072040, 1, 1092002, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 6 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1002030, 1, 1032015, 1, 1041099, 1, 1061098, 1, 1082105, 1, 1072156, 1, 1092017, 1, 1102024, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 8 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1002340, 1, 1032016, 1, 1051078, 1, 1082117, 1, 1072212, 1, 1092017, 1, 1102030, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 				else if ( v2 == 2 ) { 
 					v3 = self.askMenu( "Qual armadura para bruxo voc� quer?#b\r\n#L0# Armadura de N�vel 30#l\r\n#L1# Armadura de N�vel 70#l\r\n#L2# Armadura de N�vel 80#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1002013, 1, 1032007, 1, 1050029, 1, 1082053, 1, 1072078, 1, 1092008, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 6 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1002254, 1, 1032015, 1, 1050069, 1, 1082100, 1, 1072160, 1, 1092008, 1, 1102024, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1002274, 1, 1032016, 1, 1050073, 1, 1082123, 1, 1072179, 1, 1092008, 1, 1102030, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 				else if ( v2 == 3 ) { 
 					v3 = self.askMenu( "Qual armadura para bruxa voc� quer?#b\r\n#L0# Armadura de N�vel 30#l\r\n#L1# Armadura de N�vel 70#l\r\n#L2# Armadura de N�vel 80#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1002013, 1, 1032007, 1, 1041053, 1, 1061049, 1, 1082053, 1, 1072078, 1, 1092008, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1002254, 1, 1032015, 1, 1051054, 1, 1082100, 1, 1072160, 1, 1092008, 1, 1102024, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1002274, 1, 1032016, 1, 1051058, 1, 1082123, 1, 1072179, 1, 1092008, 1, 1102030, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
         else if ( v2 == 4 ) { 
 					v3 = self.askMenu( "Qual armadura para arqueiro voc� quer?#b\r\n#L0# Armadura de N�vel 30#l\r\n#L1# Armadura de N�vel 70#l\r\n#L2# Armadura de N�vel 80#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1002165, 1, 1032006, 1, 1040068, 1, 1060057, 1, 1082050, 1, 1072082, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 6 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1002289, 1, 1032015, 1, 1050063, 1, 1082108, 1, 1072167, 1, 1102024, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 6 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1002278, 1, 1032016, 1, 1050077, 1, 1082112, 1, 1072185, 1, 1102030, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 6 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 				else if ( v2 == 5 ) { 
 					v3 = self.askMenu( "Qual armadura para arqueira voc� quer?#b\r\n#L0# Armadura de N�vel 30#l\r\n#L1# Armadura de N�vel 70#l\r\n#L2# Armadura de N�vel 80#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1002165, 1, 1032006, 1, 1041054, 1, 1061050, 1, 1082050, 1, 1072082, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 3 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1002289, 1, 1032015, 1, 1051064, 1, 1082108, 1, 1072167, 1, 1102024, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 3 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1002278, 1, 1032016, 1, 1051068, 1, 1082112, 1, 1072185, 1, 1102030, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 3 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 				else if ( v2 == 6 ) { 
 					v3 = self.askMenu( "Qual armadura para gatuno voc� quer?#b\r\n#L0# Armadura de N�vel 30#l\r\n#L1# Armadura de N�vel 70#l\r\n#L2# Armadura de N�vel 80#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1002175, 1, 1032007, 1, 1040057, 1, 1060043, 1, 1082044, 1, 1072036, 1, 1092008, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1002285, 1, 1032015, 1, 1040106, 1, 1060094, 1, 1082097, 1, 1072163, 1, 1092008, 1, 1102024, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 8 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1002330, 1, 1032016, 1, 1040109, 1, 1060098, 1, 1082120, 1, 1072174, 1, 1092008, 1, 1102030, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 8 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 				else { 
 					v3 = self.askMenu( "Qual armadura para gatuna voc� quer?#b\r\n#L0# Armadura de N�vel 30#l\r\n#L1# Armadura de N�vel 70#l\r\n#L2# Armadura de N�vel 80#l#k" ); 
 					if ( v3 == 0 ) { 
 						ret = inventory.exchange( 0, 1002175, 1, 1032007, 1, 1041048, 1, 1061044, 1, 1082044, 1, 1072036, 1, 1092008, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 7 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else if ( v3 == 1 ) { 
 						ret = inventory.exchange( 0, 1002285, 1, 1032015, 1, 1041103, 1, 1061102, 1, 1082097, 1, 1072163, 1, 1092008, 1, 1102024, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 8 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 					else { 
 						ret = inventory.exchange( 0, 1002330, 1, 1032016, 1, 1041106, 1, 1061105, 1, 1082120, 1, 1072174, 1, 1092008, 1, 1102030, 1 ); 
 						if ( ret == 0 ) self.say( "Tenha, ao menos, 8 slots dispon�veis para o invent�rio de equipamento." ); 
 					} 
 				} 
 			} 
 			else if ( v1 == 8 ) { 
 				v2 = self.askMenu( "Quanto disso voc� quer?#b\r\n#L0# Ganhar 1 PP#l\r\n#L1# Ganhar 30 PP#l\r\n#L2# Ganhar 100 PP#l\r\n#L3# Perder 1 PP#l" ); 
 				if ( v2 == 0 ) target.incSP( 1, 0 ); 
 				else if ( v2 == 1 ) target.incSP( 30, 0 ); 
 				else if ( v2 == 2 ) target.incSP( 100, 0 ); 
 				else target.incSP( -1, 0 ); 
 			} 
 			else if ( v1 == 9 ) { 
 				v2 = self.askMenu( "O que voc� quer?#b\r\n#L0# 200 Elixires Energ�ticos#l\r\n#L1# 100 rem�dios perfeitos#l\r\n#L2# 100 pedras convocadoras#l\r\n#L3# 100 pedras m�gicas#l#k" ); 
 				if ( v2 == 0 ) ret = inventory.exchange( 0, 2000005, 100, 2000005, 100 ); 
 				else if ( v2 == 1 ) ret = inventory.exchange( 0, 2050004, 100 ); 
 				else if ( v2 == 2 ) ret = inventory.exchange( 0, 4006001, 100 ); 
 				else ret = inventory.exchange( 0, 4006000, 100 ); 
 			} 
 			else if ( v1 == 10 ) { 
 				v2 = self.askMenu( "Somente 60% de pergaminhos dispon�veis aqui!#b\r\n#L0# 100 #t2043001#s#l\r\n#L1# 100 #t2043101#s#l\r\n#L2# 100 #t2043201#s#l\r\n#L3# 100 #t2043301#s#l\r\n#L4# 100 #t2043701#s#l\r\n#L5# 100 #t2043801#s#l\r\n#L6# 100 #t2044001#s#l\r\n#L7# 100 #t2044101#s#l\r\n#L8# 100 #t2044201#s#l\r\n#L9# 100 #t2044301#s#l\r\n#L10# 100 #t2044401#s#l\r\n#L11# 100 #t2044501#s#l\r\n#L12# 100 #t2044601#s#l\r\n#L13# 100 #t2044701#s#l" ); 
 				if ( v2 == 0 ) ret = inventory.exchange( 0, 2043001, 100 ); 
 				else if ( v2 == 1 ) ret = inventory.exchange( 0, 2043101, 100 ); 
 				else if ( v2 == 2 ) ret = inventory.exchange( 0, 2043201, 100 ); 
 				else if ( v2 == 3 ) ret = inventory.exchange( 0, 2043301, 100 ); 
 				else if ( v2 == 4 ) ret = inventory.exchange( 0, 2043701, 100 ); 
 				else if ( v2 == 5 ) ret = inventory.exchange( 0, 2043801, 100 ); 
 				else if ( v2 == 6 ) ret = inventory.exchange( 0, 2044001, 100 ); 
 				else if ( v2 == 7 ) ret = inventory.exchange( 0, 2044101, 100 ); 
 				else if ( v2 == 8 ) ret = inventory.exchange( 0, 2044201, 100 ); 
 				else if ( v2 == 9 ) ret = inventory.exchange( 0, 2044301, 100 ); 
 				else if ( v2 == 10 ) ret = inventory.exchange( 0, 2044401, 100 ); 
 				else if ( v2 == 11 ) ret = inventory.exchange( 0, 2044501, 100 ); 
 				else if ( v2 == 12 ) ret = inventory.exchange( 0, 2044601, 100 ); 
 				else ret = inventory.exchange( 0, 2044701, 100 ); 
 			} 
 			else if ( v1 == 11 ) { 
 				v2 = self.askMenu( "Somente 60% de pergaminhos dispon�veis aqui!#b\r\n#L0# 100 #t2040001#s#l\r\n#L1# 100 #t2040301#s#l\r\n#L2# 100 #t2040401#s#l\r\n#L3# 100 #t2040501#s#l\r\n#L4# 100 #t2040504#s#l\r\n#L5# 100 #t2040601#s#l\r\n#L6# 100 #t2040704#s#l\r\n#L7# 100 #t2040801#s#l\r\n#L8# 100 #t2040804#s#l\r\n#L9# 100 #t2040901#s#l\r\n#L10# 100 #t2041013#s#l\r\n#L11# 100 #t2041016#s#l\r\n#L12# 100 #t2041019#s#l\r\n#L13# 100 #t2041022#s#l#k" ); 
 				if ( v2 == 0 ) ret = inventory.exchange( 0, 2040001, 100 ); 
 				else if ( v2 == 1 ) ret = inventory.exchange( 0, 2040301, 100 ); 
 				else if ( v2 == 2 ) ret = inventory.exchange( 0, 2040401, 100 ); 
 				else if ( v2 == 3 ) ret = inventory.exchange( 0, 2040501, 100 ); 
 				else if ( v2 == 4 ) ret = inventory.exchange( 0, 2040504, 100 ); 
 				else if ( v2 == 5 ) ret = inventory.exchange( 0, 2040601, 100 ); 
 				else if ( v2 == 6 ) ret = inventory.exchange( 0, 2040704, 100 ); 
 				else if ( v2 == 7 ) ret = inventory.exchange( 0, 2040801, 100 ); 
 				else if ( v2 == 8 ) ret = inventory.exchange( 0, 2040804, 100 ); 
 				else if ( v2 == 9 ) ret = inventory.exchange( 0, 2040901, 100 ); 
 				else if ( v2 == 10 ) ret = inventory.exchange( 0, 2041013, 100 ); 
 				else if ( v2 == 11 ) ret = inventory.exchange( 0, 2041016, 100 ); 
 				else if ( v2 == 12 ) ret = inventory.exchange( 0, 2041019, 100 ); 
 				else ret = inventory.exchange( 0, 2041022, 100 ); 
 			} 
 			else if ( v1 == 12 ) { 
 				v2 = self.askMenu( "O que voc� quer?#b\r\n#L0# 5 jogos de Shurikens#l\r\n#L1# 5 jogos de flechas de a�o para o arco#l\r\n#L2# 5 jogos de flechas de a�o para besta#l#k" ); 
 				if ( v2 == 0 ) ret = inventory.exchange( 0, 2070006, 800, 2070006, 800, 2070006, 800, 2070006, 800, 2070006, 800 ); 
 				else if ( v2 == 1 ) ret = inventory.exchange( 0, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800 ); 
 				else ret = inventory.exchange( 0, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800 ); 
 			} 
 			else if ( v1 == 13 ) { 
 				v2 = self.askMenu( "O que voc� quer?#b\r\n#L0# Eliminar PP restante #l\r\n#L1# Eliminar PP restante #l#k" ); 
 				if ( v2 == 0 ) target.incAP( -target.nAP, 0 ); 
 				else if ( v2 == 1 ) target.incSP( -target.nSP, 0 ); 
 			} 
 			else if ( v1 == 14 ) { 
 				v2 = self.askMenu( "O que voc� quer?#b\r\n#L0# Intimidade bicho +1#l\r\n#L1# Intimidade bicho +10#l\r\n#L2# Intimidade bicho +100#l\r\n#L3# intimidade aninal +1000#l#k" ); 
 				if ( v2 == 0 ) target.incPetTame( 1 ); 
 				else if ( v2 == 1 ) target.incPetTame( 10 ); 
 				else if ( v2 == 2 ) target.incPetTame( 100 ); 
 				else target.incPetTame( 1000 ); 
 			} 
 			else if ( v1 == 15 ) { 
 				v2 = self.askMenu( "O que voc� quer?#b\r\n#L0# Fama +1#l\r\n#L1# Fama +10#l\r\n#L2# Fama +20#l#k" ); 
 				if ( v2 == 0 ) target.incPOP( 1, 0 ); 
 				else if ( v2 == 1 ) target.incPOP( 10, 0 ); 
 				else target.incPOP( 20, 0 ); 
 			} 
 			else if ( v1 == 16 ) { 
 				v2 = self.askMenu( "Escolha sua carreira!#b\r\n#L0# Guerreiro#l\r\n#L1# Bruxo#l\r\n#L2# Arqueiro#l\r\n#L3# Gatuno#l#k" ); 
 				if ( v2 == 0 ) { 
 					v3 = self.askMenu( "Escolha de novo.#b\r\n#L0# Soldado, N�vel 60 #l\r\n#L1# Escudeiro, N�vel 60 #l\r\n#L2# Lanceiro, N�vel 60 #l\r\n" 
 					+ "#L3# Templ�rio, N�vel 100 #l\r\n#L4# Cavaleiro, N�vel 100 #l\r\n#L5# Cavaleiro Draconiano, N�vel 100 #l\r\n" 
 					+ "#L6#Templ�rio, N�vel 120 #l\r\n#L7# Cavaleiro, N�vel 120 #l\r\n#L8# Cavaleiro Draconiano, N�vel 120 #l\r\n" 
 					+ "#L9# Her�i, N�vel 160 #l\r\n#L10#Paladino, N�vel 160 #l\r\n#L11#Cavaleiro Negro, N�vel 160 #l\r\n#k" ); 
 					//Level 60 Crusader 
 					if ( v3 == 0 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 
 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1402011, 1, 1312009, 1, 1302011, 1, 1412007, 1, 1102014, 1, 1002101, 1,   1082061, 1, 1072149, 1, 1040093, 1, 1060082, 1, 1032014, 1, 1092011, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1402011, 1, 1312009, 1, 1302011, 1, 1412007, 1, 1102014, 1, 1002101, 1,   1082061, 1, 1072149, 1, 1041092, 1, 1061091, 1, 1032014, 1, 1092011, 1,  2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 110 ) target.nJob = 110; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 3980, 387 ); 
 						setAP( 230, 84, 4, 4 );						 
 					} 
 					if ( v3 == 1 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 
 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1402011, 1, 1302011, 1, 1422009, 1, 1322018, 1, 1102014,1, 1002101, 1,   1082061, 1, 1072149, 1, 1040093, 1, 1060082, 1, 1032014, 1, 1092011, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1402011, 1, 1302011, 1, 1422009, 1, 1322018, 1, 1102014,1, 1002101, 1,   1082061, 1, 1072149, 1, 1041092, 1, 1061091, 1, 1032014, 1, 1092011, 1,  2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 110 ) target.nJob = 110; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 3980, 387 ); 
 						setAP( 246, 66, 4, 4 );						 
 					} 
 					if ( v3 == 2 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 
 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1432004, 1, 1442010, 1, 1102014,1, 1002101, 1,   1082061, 1, 1072149, 1, 1040093, 1, 1060082, 1, 1032014, 1,  2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1432004, 1, 1442010, 1, 1102014,1, 1002101, 1,   1082061, 1, 1072149, 1, 1041092, 1, 1061091, 1, 1032014, 1,  2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 110 ) target.nJob = 110; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 3980, 387 ); 
 						setAP( 230, 84, 4, 4 );						 
 					} 
 					//100Fighter 
 					else if ( v3 == 3 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 
 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113,1, 1060102, 1,   1312015, 1, 1302023, 1, 1402016, 1, 1412010, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1,  1312015, 1, 1302023, 1, 1402016, 1, 1412010, 1, 2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 111 ) target.nJob = 111; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 5943, 561 ); 
 						setAP( 407, 110, 4, 4 ); 
 	//					target.incSP( 30, 0 ); 
 					} 
 					//Page 
 					else if ( v3 == 4 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 
 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113,1, 1060102, 1,   1302023, 1, 1402016, 1, 1422013, 1, 1322029, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1,  1312015, 1, 1322029, 1, 1332026, 1, 1322029, 1, 2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 121 ) target.nJob = 121; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 5943, 561 ); 
 						setAP( 407, 110, 4, 4 ); 
 	//					target.incSP( 30, 0 ); 
 					} 
 					//Spearman 
 					else if ( v3 == 5 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113,1, 1060102, 1,  1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 
 						if ( target.nJob != 131 ) target.nJob = 131; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 5943, 561 ); 
 						setAP( 407, 110, 4, 4 ); 
 	//					target.incSP( 50, 0 ); 
 					} 
 				//Level 120 
 					else if ( v3 == 6 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 
 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113,1, 1060102, 1,   1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1,  1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 111 ) target.nJob = 111; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 7776, 683 ); 
 						setAP( 477, 140, 4, 4 ); 
 	//					target.incSP( 30, 0 ); 
 					} 
 					//Page 
 					else if ( v3 == 7 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 
 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113,1, 1060102, 1,   1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1,  1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 121 ) target.nJob = 121; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 7776, 683 ); 
 						setAP( 477, 140, 4, 4 ); 
 	//					target.incSP( 30, 0 ); 
 					} 
 					//Spearman 
 					else if ( v3 == 8 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1040113,1, 1060102, 1,   1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082130, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1,  1312015, 1, 1322029, 1, 1332026, 1, 1332027, 1, 1402016, 1, 1422013, 1, 1432011, 1, 1442020, 1, 2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 
 						if ( target.nJob != 131 ) target.nJob = 131; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 7776, 683 ); 
 						setAP( 477, 140, 4, 4 ); 
 	//					target.incSP( 50, 0 ); 
 					} 
 					//160 
 					else if ( v3 == 9 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 
 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1040121,1, 1060110, 1,  1312031, 1, 1402036, 1, 2000005, 100, 2000005, 100, 2000005, 100 );  
 						} else {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1, 1312031, 1, 1402036, 1, 2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 112 ) target.nJob = 112; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 9776, 683 ); 
 						setAP( 627, 200, 4, 4 ); 
 					} 
 					//Paladin 
 					else if ( v3 == 10 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 
 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1040121,1, 1060110, 1,   1322052, 1,  1402036, 1, 1422028, 1, 1302059, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1092028, 1, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1,  1322052, 1, 1402036, 1, 1422028, 1, 1302059, 1, 2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 122 ) target.nJob = 122; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 9776, 683 ); 
 						setAP( 627, 200, 4, 4 ); 
 					} 
 					//Spearman 
 					else if ( v3 == 11 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) {  
 							ret = inventory.exchange( 4000000, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1040121,1, 1060110, 1,   1442045, 1, 1432038, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); //���Įĭ, ��ũ�׷��̽�, ����Ͱ�, ��ũ ���ġ, �׸� ũ����Ʈ����, ���Ͻ��� ���� 
 						} else {  
 							ret = inventory.exchange( 4000000, 1002532, 1, 1032023, 1, 1082140, 1, 1072220, 1, 1102035, 1, 1061122, 1, 1041123, 1,  1442045, 1, 1432038, 1, 2000005, 100, 2000005, 100, 2000005, 100); 
 						} 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 
 						if ( target.nJob != 132 ) target.nJob = 132; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 9776, 683 ); 
 						setAP( 627, 200, 4, 4 ); 
 					} 
 				//���� 
 				} else if ( v2 == 1 ) { 
 					v3 = self.askMenu( "�� ���~#b\r\n#L0# Level 60 Fire & Poison Wizard#l\r\n#L1# Level 60 Ice & Lightning Wizard#l\r\n#L2# Level 60 Cleric#l\r\n" 
 					+ "#L3# Mago de fogo/veneno, N�vel 100 #l\r\n#L4# Mago de gelo/raio, N�vel 100 #l\r\n#L5# Sacerdote, N�vel 100 #l\r\n" 
 					+ "#L6#Mago de fogo/veneno, N�vel 120 #l\r\n#L7#Mago de gelo/raio, N�vel 120 #l\r\n#L8#Sacerdote, N�vel 120 #l\r\n" 
 					+ "#L9#Arquimago de fogo/veneno, N�vel 160 #l\r\n#L10# Arquimago de gelo/raio, N�vel 160 #l\r\n#L11#Bispo, N�vel 160 #l#k" );	 
 					if ( v3 == 0 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1050056, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1051047, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 210 ) target.nJob = 210; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 812, 2804 ); 
 						setAP( 4, 4, 524, 93 ); 
 //						target.incSP( 50, 0 ); 

 					} 
 					else if ( v3 == 1 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1050056, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1051047, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 220 ) target.nJob = 220; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 812, 2804 ); 
 						setAP( 4, 4, 524, 93 ); 
 //						target.incSP( 50, 0 ); 

 					} 
 					else if ( v3 == 2 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1050056, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1372014, 1, 1382006, 1, 1102014, 1, 1072139, 1, 1082088, 1, 1002245, 1, 1032014, 1, 1051047, 1, 1092029, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 230 ) target.nJob = 230; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 812, 2804 ); 
 						setAP( 4, 4, 524, 93 ); 
 //						target.incSP( 50, 0 ); 

 					} 
 					//100 
 					else if ( v3 == 3 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 211 ) target.nJob = 211; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1273, 4308 ); 
 						setAP( 4, 4, 414, 103 );			 
 					} 

 					else if ( v3 == 4 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 221 ) target.nJob = 221; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1273, 4308 ); 
 						setAP( 4, 4, 414, 103 );		 
 					} 
 					else if ( v3 == 5 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 231 ) target.nJob = 231; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1273, 4308 ); 
 						setAP( 4, 4, 414, 103 );	 
 					} 
 					//120 
 					else if ( v3 == 6 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 211 ) target.nJob = 211; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1584, 5324 ); 
 						setAP( 4, 4, 524, 103 );				 
 					} 

 					else if ( v3 == 7 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 221 ) target.nJob = 221; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1584, 5324 ); 
 						setAP( 4, 4, 524, 103 );			 
 					} 
 					else if ( v3 == 8 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382008, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 231 ) target.nJob = 231; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1584, 5324 ); 
 						setAP( 4, 4, 524, 103 ); 
 					} 
 					//160 
 					else if ( v3 == 9 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 212 ) target.nJob = 212; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 2584, 7324 ); 
 						setAP( 4, 4, 674, 153 );			 
 					} 

 					else if ( v3 == 10 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 222 ) target.nJob = 222; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 2584, 7324 ); 
 						setAP( 4, 4, 674, 153 );		 
 					} 
 					else if ( v3 == 11 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1050103, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1092029, 1, 1002366, 1, 1032023, 1, 1082134, 1, 1072224, 1, 1102035, 1, 1051102, 1, 1382036, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
						
 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 232 ) target.nJob = 232; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 2584, 7324 ); 
 						setAP( 4, 4, 674, 153 ); 
 					} 
 				}  
 				//�ü� 
 				else if ( v2 == 2 ) { 
 					v3 = self.askMenu( "Escolha de novo.#b\r\n#L0# Ca�ador, N�vel 60 #l\r\n#L1# Arqueiro, N�vel 60 #l\r\n"  
 					+ "#L2# Ranger, N�vel 100 #l\r\n#L3# Atirador, N�vel 100 #l\r\n" 
 					+ "#L4# Ranger, N�vel 120 #l\r\n#L5# Atirador, N�vel 120 #l\r\n"	 
 					+ "#L6#Mestre Arqueiro, N�vel 160 #l\r\n#L7#Marcador N�vel, 160 #l" );	 
 					if ( v3 == 0 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000,  1452004, 1, 1102014, 1, 1032014, 1, 1050059, 1,1072146, 1, 1082091,1, 1002269, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800  ); 
 						else ret = inventory.exchange( 4000000, 1452004, 1, 1102014, 1, 1032014, 1, 1051042, 1,1072146, 1, 1082091,1, 1002269, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 311 ) target.nJob = 311; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1577, 880 ); 
 						setAP( 65, 247, 4, 4 ); 
 					}					 
 					else if ( v3 == 1 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000,  1462008, 1, 1102014, 1, 1032014, 1, 1050059, 1,1072146, 1, 1082091,1, 1002269, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800  ); 
 						else ret = inventory.exchange( 4000000, 1462008, 1, 1102014, 1, 1032014, 1, 1051042, 1,1072146, 1, 1082091,1, 1002269, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 321 ) target.nJob = 321; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1577, 880 ); 
 						setAP( 60, 252, 4, 4 );			 
 					}		 
 					//100 
 					else if ( v3 == 2 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000,  1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1050107,1, 1452017, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800  ); 
 						else ret = inventory.exchange( 4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1051102,1, 1452017, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 311 ) target.nJob = 311; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 2831, 1468 ); 
 						setAP( 100, 417, 4, 4 ); 
 					}					 
 					else if ( v3 == 3 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000,  1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1050107,1, 1462018, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800  ); 
 						else ret = inventory.exchange( 4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1051102,1, 1462018, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 321 ) target.nJob = 321; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 2831, 1468 ); 
 						setAP( 95, 422, 4, 4 );			 
 					}		 
 					else if ( v3 == 4 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000,  1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1050107,1, 1452021, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800  ); 
 						else ret = inventory.exchange( 4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1051102,1, 1452021, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 311 ) target.nJob = 311; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 3366, 1769 ); 
 						setAP( 95, 521, 4, 4 ); 
 					}					 
 					else if ( v3 == 5 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000,  1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1050107,1, 1462018, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800  ); 
 						else ret = inventory.exchange( 4000000, 1002405, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1051102,1, 1462018, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 321 ) target.nJob = 321; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 3366, 1769 ); 
 						setAP( 90, 526, 4, 4 );			 
 					}		 
 					else if ( v3 == 6 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000,  1002407, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1050107,1, 1452044, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800  ); 
 						else ret = inventory.exchange( 4000000, 1002407, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1051102,1, 1452044, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2060002, 800, 2060002, 800, 2060002, 800, 2060002, 800 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 312 ) target.nJob = 312; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 4366, 2769 ); 
 						setAP( 155, 671, 4, 4 ); 
 					}					 
 					else if ( v3 == 7 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000,  1002407, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1050107,1, 1462039, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800  ); 
 						else ret = inventory.exchange( 4000000, 1002407, 1, 1032023, 1, 1082127, 1, 1072204, 1,1102035, 1, 1051102,1, 1462039, 1, 2000005, 100, 2000005, 100, 2000005, 100, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800, 2061002, 800 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 322 ) target.nJob = 322; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 4366, 2769 ); 
 						setAP( 150, 676, 4, 4 );			 
 					}	 
 				} 
 				//���� 
 				else if ( v2 == 3 ) { 
 					v3 = self.askMenu( "Escolha de novo.#b\r\n#L0#Arruaceiro, N�vel 60 #l\r\n#L1#Mercen�rio N�vel 60 #l\r\n" 
 					+ "#L2#Mestre Arruaceiro, N�vel 100 #l\r\n#L3# Andarilho, N�vel 100 #l\r\n" 
 					+ "#L4# Mestre Arruaceiro, N�vel 120 #l\r\n#L5#Andarilho, N�vel 120 #l\r\n" 
 					+ "#L6# Desordeiro, N�vel 160 #l\r\n#L7#Algoz, N�vel 160 #l" );	 
 					if ( v3 == 0 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1332015, 1, 1102014, 1, 1072152, 1, 1082094, 1,1002248, 1, 1040100,1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000, 1332015, 1, 1102014, 1, 1072152, 1, 1082094, 1,1002248, 1041096,1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 420 ) target.nJob = 420; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1561, 1018 ); 
 						setAP( 4, 100, 4, 212 ); 
 					}	 
 					else if ( v3 == 1 ) { 
 						if ( target.nLevel < 60 ) { 
 							self.say( "Voc� n�o � N�vel 60! Aumente para 60" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) { 
 							ret = inventory.exchange( 4000000, 1472025, 1, 1102014, 1, 1072152, 1, 1082094, 1,1002248, 1, 1040100,1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 							if ( ret == 0 ) { 
 								self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 								end; 
 							} 

 							ret = inventory.exchangeEx( 0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800 );						 
 							if ( ret == 0 ) { 
 								self.say( "N�o pude te dar a shuriken, pois seu invent�rio de uso estava cheio. Pegue mais tarde, est� bem? Tecle Pr�xima!" ); 
 		//						end; 
 							} 
 						} else {  
 							ret = inventory.exchange( 4000000,1472025, 1, 1102014, 1, 1072152, 1, 1082094, 1,1002248, 1, 1041096,1, 1032014, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 							if ( ret == 0 ) { 
 								self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 								end; 
 							} 

 							ret = inventory.exchangeEx( 0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800 );						 
 							if ( ret == 0 ) { 
 								self.say( "N�o pude te dar a shuriken, pois seu invent�rio de uso estava cheio. Pegue mais tarde, est� bem? Tecle Pr�xima!" ); 
 		//						end; 
 							} 
 						} 

 						if ( target.nJob != 410 ) target.nJob = 410; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 1561, 1018 ); 
 						setAP( 4, 130, 4, 487 );			 
 					}	 

 					//100 
 					else if ( v3 == 2 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092018, 1, 1002326, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1050097, 1, 1332027, 1, 1332026, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000,1092018, 1, 1002326, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1051091, 1, 1332027, 1, 1332026, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 421 ) target.nJob = 421; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 2824, 1818 ); 
 						setAP( 4, 130, 4, 487 ); 
 					}	 
 					else if ( v3 == 3 ) { 
 						if ( target.nLevel < 100 ) { 
 							self.say( "Voc� n�o � N�vel 100! Aumente para 100" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) { 
 							ret = inventory.exchange( 4000000, 1002326, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1050097, 1,  1472033, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 							if ( ret == 0 ) { 
 								self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 								end; 
 							} 

 							ret = inventory.exchangeEx( 0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800 );						 
 							if ( ret == 0 ) { 
 								self.say( "N�o pude te dar a shuriken, pois seu invent�rio de uso estava cheio. Pegue mais tarde, est� bem? Tecle Pr�xima!" ); 
 		//						end; 
 							} 
 						} else {  
 							ret = inventory.exchange( 4000000, 1002326, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1051091, 1, 1472033, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 							if ( ret == 0 ) { 
 								self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 								end; 
 							} 

 							ret = inventory.exchangeEx( 0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800 );						 
 							if ( ret == 0 ) { 
 								self.say( "N�o pude te dar a shuriken, pois seu invent�rio de uso estava cheio. Pegue mais tarde, est� bem? Tecle Pr�xima!" ); 
 		//						end; 
 							} 
 						} 

 						if ( target.nJob != 411 ) target.nJob = 411; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 2824, 1818 ); 
 						setAP( 4, 130, 4, 487 );			 
 					}	 
 					else if ( v3 == 4 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092018, 1, 1002326, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1050097, 1, 1332027, 1, 1332026, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000,1092018, 1, 1002326, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1051091, 1, 1332027, 1, 1332026, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 421 ) target.nJob = 421; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 3134, 2018 ); 
 						setAP( 4, 130, 4, 487 ); 
 					}	 
 					else if ( v3 == 5 ) { 
 						if ( target.nLevel < 120 ) { 
 							self.say( "Voc� n�o � N�vel 120! Aumente para 120" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) { 
 							ret = inventory.exchange( 4000000, 1002326, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1050097, 1, 1472033, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 							if ( ret == 0 ) { 
 								self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 								end; 
 							} 

 							ret = inventory.exchangeEx( 0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800 );						 
 							if ( ret == 0 ) { 
 								self.say( "N�o pude te dar a shuriken, pois seu invent�rio de uso estava cheio. Pegue mais tarde, est� bem? Tecle Pr�xima!" ); 
 		//						end; 
 							} 
 						} else {  
 							ret = inventory.exchange( 4000000, 1002326, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1051091, 1, 1472033, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 							if ( ret == 0 ) { 
 								self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 								end; 
 							} 

 							ret = inventory.exchangeEx( 0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800 );						 
 							if ( ret == 0 ) { 
 								self.say( "N�o pude te dar a shuriken, pois seu invent�rio de uso estava cheio. Pegue mais tarde, est� bem? Tecle Pr�xima!" ); 
 		//						end; 
 							} 
 						} 

 						if ( target.nJob != 411 ) target.nJob = 411; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 3134, 2018 ); 
 						setAP( 4, 130, 4, 487 );			 
 					}	 
 					//160				 
 					else if ( v3 == 6 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) ret = inventory.exchange( 4000000, 1092018, 1, 1002382, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1050097, 1, 1332049, 1, 1332050, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 						else ret = inventory.exchange( 4000000,1092018, 1, 1002382, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1051091, 1, 1332049, 1, 1332050, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 

 						if ( ret == 0 ) { 
 							self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 							end; 
 						} 

 						if ( target.nJob != 422 ) target.nJob = 422; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 4134, 2818 ); 
 						setAP( 4, 180, 4, 637 ); 
 					}	 
 					else if ( v3 == 7 ) { 
 						if ( target.nLevel < 160 ) { 
 							self.say( "Voc� n�o � N�vel 160! Aumente para 160" ); 
 							end;						 
 						} 

 						if ( target.nGender == 0 ) { 
 							ret = inventory.exchange( 4000000, 1002382, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1050097, 1, 1472052, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 							if ( ret == 0 ) { 
 								self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 								end; 
 							} 

 							ret = inventory.exchangeEx( 0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800 );						 
 							if ( ret == 0 ) { 
 								self.say( "N�o pude te dar a shuriken, pois seu invent�rio de uso estava cheio. Pegue mais tarde, est� bem? Tecle Pr�xima!" ); 
 		//						end; 
 							} 
 						} else {  
 							ret = inventory.exchange( 4000000, 1002382, 1, 1032023, 1, 1082143, 1,1072214, 1, 1102035,1, 1051091, 1, 1472052, 1, 2000005, 100, 2000005, 100, 2000005, 100 ); 
 							if ( ret == 0 ) { 
 								self.say( "Confira se seus invent�rios de equipamentos e de uso t�m espa�o suficiente." ); 
 								end; 
 							} 

 							ret = inventory.exchangeEx( 0, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800, "2070006,Count:800", 800 );						 
 							if ( ret == 0 ) { 
 								self.say( "N�o pude te dar a shuriken, pois seu invent�rio de uso estava cheio. Pegue mais tarde, est� bem? Tecle Pr�xima!" ); 
 		//						end; 
 							} 
 						} 

 						if ( target.nJob != 412 ) target.nJob = 412; 
 						if ( target.nPOP < 20 ) { 
 							upPOP = 20 - target.nPOP; 
 							target.incPOP( upPOP, 0 ); 
 						} 
 						setHPMP( 4134, 2818 ); 
 						setAP( 4, 180, 4, 637 );			 
 					}	 
 				} 
 			} 
 			else if ( v1 == 17 ) { 
 				job = target.nJob; 
 				if ( job == 112 ) { 
 					target.learnSkill( 1121000 ); //�����ÿ�� 
 					target.learnSkill( 1121001 ); //���� ���׳� 
 					target.learnSkill( 1121002 );//���Ľ� 
 					target.learnSkill( 1120003 );//���꽺�� �޺� 
 					target.learnSkill( 1120004 ); 
 					target.learnSkill( 1120005 ); 
 					target.learnSkill( 1121006 ); 
 //					target.learnSkill( 1121008 );//������ �� 
 					target.learnSkill( 1121010 ); 
 					target.learnSkill( 1121011 ); 
 				} 
 				else if ( job == 122 ) { 
 					target.learnSkill( 1221000 ); //�����ÿ�� 
 					target.learnSkill( 1221001 ); //���� ���׳� 
 					target.learnSkill( 1221002 );//���Ľ� 
 					target.learnSkill( 1221003 ); 
 					target.learnSkill( 1221004 ); 
 					target.learnSkill( 1220005 ); 
 					target.learnSkill( 1220006 ); 
 					target.learnSkill( 1221007 ); 
 //					target.learnSkill( 1221009 );//��ȥ 
 					target.learnSkill( 1220010 ); 
 					target.learnSkill( 1221011 ); 
 					target.learnSkill( 1221012 ); 
 				} 
 				else if ( job == 132 ) { 
 					target.learnSkill( 1321000 ); 
 					target.learnSkill( 1321001 ); 
 					target.learnSkill( 1321002 ); 
 					target.learnSkill( 1321003 ); 
 					target.learnSkill( 1320005 ); 
 					target.learnSkill( 1320006 ); 
 //					target.learnSkill( 1321007 ); //������ȥ 
 					target.learnSkill( 1320008 ); 
 					target.learnSkill( 1320009 ); 
 					target.learnSkill( 1321010 ); 
 				} 
 				else if ( job == 212 ) { 
 					target.learnSkill( 2121000 ); 
 					target.learnSkill( 2121001 ); 
 					target.learnSkill( 2121002 ); 
 					target.learnSkill( 2121003 ); 
 					target.learnSkill( 2121004 ); 
 					target.learnSkill( 2121005 ); 
 //					target.learnSkill( 2121006 ); //�޵λ� ������ 
 					target.learnSkill( 2121007 ); 
 					target.learnSkill( 2121008 ); 
 				} 
 				else if ( job == 222 ) { 
 					target.learnSkill( 2221000 ); 
 					target.learnSkill( 2221001 ); 
 					target.learnSkill( 2221002 ); 
 					target.learnSkill( 2221003 ); 
 					target.learnSkill( 2221004 ); 
 					target.learnSkill( 2221005 ); 
 //					target.learnSkill( 2221006 );//����ũ 
 					target.learnSkill( 2221007 ); 
 					target.learnSkill( 2221008 ); 
 				} 
 				else if ( job == 232 ) { 
 					target.learnSkill( 2321000 ); 
 					target.learnSkill( 2321001 ); 
 					target.learnSkill( 2321002 ); 
 					target.learnSkill( 2321003 ); 
 					target.learnSkill( 2321004 ); 
 //					target.learnSkill( 2321005 );//�������� 
 					target.learnSkill( 2321006 ); 
 					target.learnSkill( 2321007 ); 
 					target.learnSkill( 2321008 ); 
 					target.learnSkill( 2321009 ); 
 				} 
 				else if ( job == 312 ) { 
 					target.learnSkill( 3121000 ); 
 					target.learnSkill( 3121002 ); 
 					target.learnSkill( 3121003 ); 
 					target.learnSkill( 3121004 ); 
 					target.learnSkill( 3120005 ); 
 					target.learnSkill( 3121006 ); 
 //					target.learnSkill( 3121007 );//�ܽ�Ʈ�� 
 					target.learnSkill( 3121008 ); 
 					target.learnSkill( 3121009 ); 
 				} 
 				else if ( job == 322 ) { 
 					target.learnSkill( 3221000 ); 
 					target.learnSkill( 3221001 ); 
 					target.learnSkill( 3221002 ); 
 					target.learnSkill( 3221003 ); 
 					target.learnSkill( 3220004 ); 
 					target.learnSkill( 3221005 ); 
 //					target.learnSkill( 3221006 );//����ε� 
 					target.learnSkill( 3221007 ); 
 					target.learnSkill( 3221008 ); 
 				} 
 				else if ( job == 412 ) { 
 					target.learnSkill( 4121001 ); 
 					target.learnSkill( 4121001 ); 
 					target.learnSkill( 4120002 ); 
 					target.learnSkill( 4121003 ); 
 					target.learnSkill( 4121004 ); 
 					target.learnSkill( 4120005 ); 
 					target.learnSkill( 4121006 ); 
 //					target.learnSkill( 4121007 );//Ʈ���ý��ο� 
 					target.learnSkill( 4121008 ); 
 					target.learnSkill( 4121009 ); 
 				} 
 				else if ( job == 422 ) { 
 					target.learnSkill( 4221000 ); 
 					target.learnSkill( 4221001 ); 
 					target.learnSkill( 4220002 ); 
 					target.learnSkill( 4221003 ); 
 					target.learnSkill( 4221004 ); 
 					target.learnSkill( 4220005 ); 
 					target.learnSkill( 4221006 ); 
 //					target.learnSkill( 4221007 );//��ī�ο� Į�� 
 					target.learnSkill( 4221008 ); 
 				} 
 			} else if ( v1 == 18 ) { 
 				inventory = target.inventory; 
 				if ( target.nJob == 112 )          ret = inventory.exchange( 0, 2290096, 1, 2290000, 1, 2290001, 1, 2290002, 1, 2290003, 1, 2290004, 1, 2290005, 1, 2290006, 1, 2290007, 1, 2290014, 1, 2290015, 1, 2280007, 1, 2290008, 1, 2290009, 1, 2290010, 1, 2290011, 1, 2290016, 1, 2290017, 1 ); 
 				else if ( target.nJob == 122 ) ret = inventory.exchange( 0, 2290096, 1, 2290000, 1, 2290001, 1, 2290002, 1, 2290003, 1, 2290004, 1, 2290005, 1, 2280008, 1, 2290006, 1, 2290007, 1, 2290012, 1, 2290013, 1 ,2290014, 1, 2290015, 1, 2290018, 1, 2290019, 1, 2290020, 1, 2290021, 1 ); 
 				else if ( target.nJob == 132 ) ret = inventory.exchange( 0, 2290096, 1, 2290000, 1, 2290001, 1, 2290002, 1, 2290003, 1, 2290004, 1, 2290005, 1, 2290006, 1, 2290007, 1, 2290022, 1, 2290023, 1 ); 
 				else if ( target.nJob == 212 ) ret = inventory.exchange( 0, 2290096, 1, 2290024, 1, 2290025, 1, 2290026, 1, 2290027, 1, 2290028, 1, 2290029, 1, 2290030, 1, 2290031, 1, 2290036, 1, 2290037, 1, 2290038, 1, 2290039, 1, 2290040, 1, 2290041, 1); 
 				else if ( target.nJob == 222 ) ret = inventory.exchange( 0, 2290096, 1, 2290024, 1, 2290025, 1, 2290026, 1, 2290027, 1, 2290028, 1, 2290029, 1, 2290032, 1, 2290033, 1, 2290042, 1, 2290043, 1, 2290044, 1, 2290045, 1, 2290046, 1, 2290047, 1 ); 
 				else if ( target.nJob == 232 ) ret = inventory.exchange( 0, 2290096, 1, 2290024, 1, 2290025, 1, 2290026, 1, 2290027, 1, 2290028, 1, 2290029, 1, 2290034, 1, 2290035, 1, 2290048, 1, 2290049, 1, 2280009, 1, 2290050, 1, 2290051, 1 ); 
 				else if ( target.nJob == 312 ) ret = inventory.exchange( 0, 2290096, 1, 2290052, 1, 2290053, 1, 2290054, 1, 2290055, 1, 2290056, 1, 2290057, 1, 2290058, 1, 2290059, 1, 2290060, 1, 2290061, 1, 2290062, 1, 2290063, 1, 2290064, 1, 2290065, 1 ); 
 				else if ( target.nJob == 322 ) ret = inventory.exchange( 0, 2290096, 1, 2290052, 1, 2290053, 1, 2290054, 1, 2290055, 1, 2290066, 1, 2290067, 1, 2290068, 1, 2290069, 1, 2290070, 1, 2290071, 1, 2290072, 1, 2290073, 1, 2290074, 1, 2290075, 1 ); 
 				else if ( target.nJob == 412 ) ret = inventory.exchange( 0, 2290096, 1, 2290076, 1, 2290077, 1, 2290078, 1, 2290079, 1, 2290080, 1, 2290081, 1, 2290082, 1, 2290083, 1, 2280010, 1, 2290084, 1, 2290085, 1, 2290086, 1, 2290087, 1, 2290088, 1, 2290089, 1 ); 
 				else if ( target.nJob == 422 ) ret = inventory.exchange( 0, 2290096, 1, 2290076, 1, 2290077, 1, 2290078, 1, 2290079, 1, 2290080, 1, 2290081, 1, 2290082, 1, 2290083, 1, 2290090, 1, 2290091, 1, 2290092, 1, 2290093, 1, 2290094, 1, 2290095, 1 ); 

 				if ( ret == 0 ) self.say( "N�o pude te dar a shuriken, pois seu invent�rio de uso estava cheio. Feche esta janela e fale novamente comigo." ); 
 			} 
 	  }	 
 		else self.say( "Chegue a ser um GM!" ); 
 	} 
 } 
