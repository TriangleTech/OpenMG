module "standard.s";

function makeSton1( integer index, string makeItem, string needItem ) {
	inventory = target.inventory;

	nRet = self.askYesNo( "Para fazer #b5" + makeItem + "s#k, voc� precisar� dos seguintes itens. A maior parte deles pode ser conseguida eliminando monstros, ent�o n�o ser� muito dif�cil consegui-los O que voc� acha? Voc� quer alguns?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "N�o tem materiais suficientes, hein? Sem problema. Venha me ver depois que conseguir os itens necess�rios. H� diversas maneiras de obt�-los, voc� pode ca�ar monstros ou compr�-los de outras pessoas, ent�o n�o desanime." );
	else {
		// The Magic Rock
		if ( index == 0 ) ret = inventory.exchange( -4000, 4000046, -20, 4000027, -20, 4021001, -1, 4006000, 5 );
		else if ( index == 1 ) ret = inventory.exchange( -4000, 4000025, -20, 4000049, -20, 4021006, -1, 4006000, 5 );
		else if ( index == 2 ) ret = inventory.exchange( -4000, 4000129, -15, 4000130, -15, 4021002, -1, 4006000, 5 );
		else if ( index == 3 ) ret = inventory.exchange( -4000, 4000074, -15, 4000057, -15, 4021005, -1, 4006000, 5 );
		else if ( index == 4 ) ret = inventory.exchange( -4000, 4000054, -7, 4000053, -7, 4021003, -1, 4006000, 5 );
		else if ( index == 5 ) ret = inventory.exchange( -4000, 4000238, -15, 4000241, -15, 4021000, -1, 4006000, 5 );

		// The Summoning Rock
		else if ( index == 100 ) ret = inventory.exchange( -4000, 4000028, -20, 4000027, -20, 4011001, -1, 4006001, 5 );
		else if ( index == 101 ) ret = inventory.exchange( -4000, 4000014, -20, 4000056, -20, 4011003, -1, 4006001, 5 );
		else if ( index == 102 ) ret = inventory.exchange( -4000, 4000132, -15, 4000128, -15, 4011005, -1, 4006001, 5 );
		else if ( index == 103 ) ret = inventory.exchange( -4000, 4000074, -15, 4000069, -15, 4011002, -1, 4006001, 5 );
		else if ( index == 104 ) ret = inventory.exchange( -4000, 4000080, -7, 4000079, -7, 4011004, -1, 4006001, 5 );
		else if ( index == 105 ) ret = inventory.exchange( -4000, 4000226, -15, 4000237, -15, 4011001, -1, 4006001, 5 );
		
		if ( ret == 0 ) self.say( "Por favor, verifique se voc� tem todos os itens de que precisa, ou se seu invent�rio de etc. est� cheio ou n�o." );
		else self.say( "Tome, pegue 5 peda�os de #b" + makeItem + "#k. At� eu tenho que admitir que isso � uma obra-de-arte. Certo, se voc� precisar de minha ajuda � s� voltar aqui e falar comigo!" );
		
	}
}

// The Traveling Alchemist : 2040050
script "make_ston" {
	self.say( "Certo, misture a l�ngua de sapo com o dente de esquilo e... Ah! Quase me esque�o! Esqueci de colocar o p� branco brilhante!! Cara, quase que acontece um desastre... Uau!! H� quanto tempo voc� est� #Gparado:parada# a�? Eu acho que me deixei levar s� um pouquinho pelo meu trabalho... eheh." );
	v1 = self.askMenu( "Como voc� pode ver, eu sou apenas um alquimista andarilho. Eu posso estar em treinamento, mas ainda assim posso criar algumas coisas que voc� pode precisar. Voc� quer dar uma olhada?\r\n\r\n#b#L0# Fazer #t4006000##l\r\n#b#L1# Fazer #t4006001##l" );
	// Make the Magic Rock (4006000)
	if ( v1 == 0 ) {
		v1 = self.askMenu( "Haha... #b#t4006000##k � uma pedra m�stica que s� eu consigo fazer. Muitos viajantes parecem precisar dela para usar suas habilidades mais poderosas que exigem mais de sua MP e HP. H� 5 maneiras de fazer a #t4006000#. Qual maneira voc� quer empregar para faz�-la?\r\n\r\n#b#L0# Fa�a usando #t4000046# e #t4000027##l\r\n#b#L1# Fa�a usando #t4000025# e #t4000049##l\r\n#b#L2# Fa�a usando #t4000129# e #t4000130##l\r\n#b#L3# Fa�a usando #t4000074# e #t4000057##l\r\n#b#L4# Fa�a usando #t4000054# e #t4000053##l" );
		if ( v1 == 0 ) makeSton1( 0, "#t4006000#", "#v4000046# 20 #t4000046#s\r\n#v4000027# 20 #t4000027#s\r\n#v4021001# #t4021001#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 1 ) makeSton1( 1, "#t4006000#", "#v4000025# 20 #t4000025#s\r\n#v4000049# 20 #t4000049#s\r\n#v4021006# #t4021006#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 2 ) makeSton1( 2, "#t4006000#", "#v4000129# 15 #t4000129#s\r\n#v4000130# 15 #t4000130#s\r\n#v4021002# #t4021002#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 3 ) makeSton1( 3, "#t4006000#", "#v4000074# 15 #t4000074#s\r\n#v4000057# 15 #t4000057#s\r\n#v4021005# #t4021005#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 4 ) makeSton1( 4, "#t4006000#", "#v4000054# 7 #t4000054#s\r\n#v4000053# 7 #t4000053#s\r\n#v4021003# #t4021003#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 5 ) makeSton1( 5, "#t4006000#", "#v4000238# 15 #t4000238#s \r\n#v4000241# 15 #t4000241#s\r\n#v4021000# #t4021000#\r\n#v4031138# 4.000 mesos" );
	}
	// Make the Summoning Rock (4006001)
	else if ( v1 == 1 ) {
		v1 = self.askMenu( "Haha ... #b#t4006001##k � uma pedra m�stica que s� eu consigo fazer. Muitos viajantes parecem precisar dela para usar suas habilidades mais poderosas que exigem mais de sua MP e HP. H� 5 maneirdas de fazer a #t4006001#. Qual maneira voc� quer empregar para faz�-la?\r\n\r\n#b#L0# Fa�a usando #t4000028# e #t4000027##l\r\n#b#L1# Fa�a usando #t4000014# e #t4000056##l\r\n#b#L2# Fa�a usando #t4000132# e #t4000128##l\r\n#b#L3# Fa�a usando #t4000074# e #t4000069##l\r\n#b#L4# Fa�a usando #t4000080# e #t4000079##l" );
		if ( v1 == 0 ) makeSton1( 100, "#t4006001#", "#v4000028# 20 #t4000028#s\r\n#v4000027# 20 #t4000027#s\r\n#v4011001# #t4011001#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 1 ) makeSton1( 101, "#t4006001#", "#v4000014# 20 #t4000014#s\r\n#v4000056# 20 #t4000056#s\r\n#v4011003# #t4011003#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 2 ) makeSton1( 102, "#t4006001#", "#v4000132# 15 #t4000132#s\r\n#v4000128# 15 #t4000128#s\r\n#v4011005# #t4011005#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 3 ) makeSton1( 103, "#t4006001#", "#v4000074# 15 #t4000074#s\r\n#v4000069# 15 #t4000069#s\r\n#v4011002# #t4011002#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 4 ) makeSton1( 104, "#t4006001#", "#v4000080# 7 #t4000080#s\r\n#v4000079# 7 #t4000079#s\r\n#v4011004# #t4011004#\r\n#v4031138# 4.000 mesos" );
		else if ( v1 == 5 ) makeSton1( 105, "#t4006001#", "#v4000226# 15 #t4000226#s\r\n#v4000237# 15 #t4000237#s\r\n#v4011001# #t4011001#\r\n#v4031138# 4.000 mesos" );
	}
}

// �̳��� : �����ռ�
function chat_message3( integer index, string makeItem, string needItem, integer reqLevel ) {
	inventory = target.inventory;

	nRet = self.askYesNo( "Para fazer um " + makeItem + "com o estimulador, voc� precisar� dos seguintes itens. O N�vel Limite ser� " + reqLevel + ". Se o estimulador for usado, a op��o de item pode ser toda incrementada, mas #bela tamb�m pode sair pior do que estava antes, al�m de carregar uma chance de falha de 10%, ent�o, por favor, tenha cuidado#k. O que voc� acha? Voc� quer faz�-lo?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "Eu entendo. Usar o estimulador significa um poss�vel risco de destruir a arma. Eu tomaria cuidado tamb�m, mas, se mudar de id�ia, sinta-se � vontade." );
	else {
		sProp = random( 1, 10 );
		if ( sProp == 1 ) {
			// Warrior ���� ���� ����
			if ( index == 0 ) ret = inventory.exchange( 0, 4130002, -1, 1302056, -1, 4000244, -20, 4000245, -25, 4005000, -8);
			else if ( index == 1 ) ret = inventory.exchange( 0, 4130003, -1, 1312030, -1, 4000244, -20, 4000245, -25, 4005000, -8);
			else if ( index == 2 ) ret = inventory.exchange( 0, 4130004, -1, 1322045, -1, 4000244, -20, 4000245, -25, 4005000, -8);
			else if ( index == 3 ) ret = inventory.exchange( 0, 4130005, -1, 1402035, -1, 4000244, -20, 4000245, -25, 4005000, -8);
			else if ( index == 4 ) ret = inventory.exchange( 0, 4130006, -1, 1412021, -1, 4000244, -20, 4000245, -25, 4005000, -8);
			else if ( index == 5 ) ret = inventory.exchange( 0, 4130007, -1, 1422027, -1, 4000244, -20, 4000245, -25, 4005000, -8);
			else if ( index == 6 ) ret = inventory.exchange( 0, 4130008, -1, 1432030, -1, 4000244, -20, 4000245, -25, 4005000, -8);
			else if ( index == 7 ) ret = inventory.exchange( 0, 4130009, -1, 1442044, -1, 4000244, -20, 4000245, -25, 4005000, -8);

			// Magician ���� ���� ����
			else if ( index == 100 ) ret = inventory.exchange( 0, 4130010, -1, 1372010, -1, 4000244, -20, 4000245, -25, 4005001, -6, 4005003, -2);
			else if ( index == 101 ) ret = inventory.exchange( 0, 4130011, -1, 1382035, -1, 4000244, -20, 4000245, -25, 4005001, -6, 4005003, -2);

			// Bowman ���� ���� ����
			else if ( index == 200 ) ret = inventory.exchange( 0, 4130012, -1, 1452019, -1, 4000244, -20, 4000245, -25, 4005000, -3, 4005002, -5);
			else if ( index == 201 ) ret = inventory.exchange( 0, 4130013, -1, 1462015, -1, 4000244, -20, 4000245, -25, 4005000, -5, 4005002, -3);

			// Thief ���� ���� ����
			else if ( index == 300 ) ret = inventory.exchange( 0, 4130014, -1, 1332051, -1, 4000244, -20, 4000245, -25, 4005000, -5, 4005002, -3);
			else if ( index == 301 ) ret = inventory.exchange( 0, 4130014, -1, 1332052, -1, 4000244, -20, 4000245, -25, 4005002, -3, 4005003, -5);
			else if ( index == 302 ) ret = inventory.exchange( 0, 4130015, -1, 1472053, -1, 4000244, -20, 4000245, -25, 4005002, -2, 4005003, -6);

			if ( ret == 0 ) self.say( "Verifique se voc� tem todos os itens necess�rios, ou se o seu invent�rio de equip. possui slots livres." );
			else self.say( "Ah, n�o... Eu devo ter entendido a porcentagem do estimulador toda errada. Todos os itens se foram agora... Me desculpe. Eu te avisei sobre a possibilidade de isso acontecer e fiquei aqui esperando que voc� entendesse. Novamente, eu sinto muito." );
		}
		else {
			// Warrior���� ���� ����
			if ( index == 0 ) ret = inventory.exchangeEx( -120000, "4130002", -1, "1302056", -1,  "4000244", -20, "4000245", -25, "4005000", -8, "1302059,Variation:1", 1 );
			else if ( index == 1 ) ret = inventory.exchangeEx( -120000, "4130003", -1, "1312030", -1,  "4000244", -20, "4000245", -25, "4005000", -8, "1312031,Variation:1", 1 );
			else if ( index == 2 ) ret = inventory.exchangeEx( -120000, "4130004", -1, "1322045", -1,  "4000244", -20, "4000245", -25, "4005000", -8, "1322052,Variation:1", 1 );
			else if ( index == 3 ) ret = inventory.exchangeEx( -120000, "4130005", -1, "1402035", -1,  "4000244", -20, "4000245", -25, "4005000", -8, "1402036,Variation:1", 1 );
			else if ( index == 4 ) ret = inventory.exchangeEx( -120000, "4130006", -1, "1412021", -1, "4000244", -20, "4000245", -25, "4005000", -8, "1412026,Variation:1", 1 );
			else if ( index == 5 ) ret = inventory.exchangeEx( -120000, "4130007", -1, "1422027", -1,  "4000244", -20, "4000245", -25, "4005000", -8, "1422028,Variation:1", 1 );
			else if ( index == 6 ) ret = inventory.exchangeEx( -120000, "4130008", -1, "1432030", -1,  "4000244", -20, "4000245", -25, "4005000", -8, "1432038,Variation:1", 1 );
			else if ( index == 7 ) ret = inventory.exchangeEx( -120000, "4130009", -1, "1442044", -1,  "4000244", -20, "4000245", -25, "4005000", -8, "1442045,Variation:1", 1 );

			// Magician ���� ���� ����
			else if ( index == 100 ) ret = inventory.exchangeEx( -120000, "4130010", -1, "1372010", -1, "4000244", -20, "4000245", -25, "4005001", -6, "4005003", -2, "1372032,Variation:1", 1 );
			else if ( index == 101 ) ret = inventory.exchangeEx( -120000, "4130011", -1, "1382035", -1, "4000244", -20, "4000245", -25, "4005001", -6, "4005003", -2, "1382036,Variation:1", 1 );

			// Bowman ���� ���� ����
			else if ( index == 200 ) ret = inventory.exchangeEx( -120000, "4130012", -1, "1452019", -1, "4000244", -20, "4000245", -25, "4005000", -3, "4005002", -5,  "1452044,Variation:1", 1 );
			else if ( index == 201 ) ret = inventory.exchangeEx( -120000, "4130013", -1, "1462015", -1, "4000244", -20, "4000245", -25, "4005000", -5, "4005002", -3,  "1462039,Variation:1", 1 );

			// Thief ���� ���� ����
			else if ( index == 300 ) ret = inventory.exchangeEx( -120000, "4130014", -1, "1332051", -1,  "4000244", -20, "4000245", -25, "4005000", -5, "4005002", -3,  "1332049,Variation:1", 1 );
			else if ( index == 301 ) ret = inventory.exchangeEx( -120000, "4130014", -1, "1332052", -1,  "4000244", -20, "4000245", -25, "4005002", -3, "4005003", -5,  "1332050,Variation:1", 1 );
			else if ( index == 302 ) ret = inventory.exchangeEx( -120000, "4130015", -1, "1472053", -1,  "4000244", -20, "4000245", -25, "4005002", -2, "4005003", -6,  "1472051,Variation:1", 1 );

			if ( ret == 0 ) self.say( "Verifique se voc� tem todos os itens necess�rios, ou se o seu invent�rio de equipamento possui slots livres." );
			else self.say( "Ok, aqui est�! � seu. " + makeItem + ". Ainda bem que a arma n�o foi destru�da durante o processo. Com certeza isso ajudou a aperfei�oar sua arma. Agora, quando quiser aperfei�oar sua arma, voc� sabe a quem visitar~~" );
		}
	}
}

function chat_message4( integer index, string makeItem, string needItem, integer reqLevel ) {
	inventory = target.inventory;

	nRet = self.askYesNo( "Para fazer um " + makeItem + "com o estimulador, voc� precisar� dos seguintes itens. O N�vel Limite ser� " + reqLevel + ". Se o estimulador for usado, a op��o de item pode ser toda incrementada, mas #bela tamb�m pode sair pior do que estava antes, al�m de carregar uma chance de falha de 10%, ent�o, por favor, tenha cuidado#k. O que voc� acha? Voc� quer faz�-lo?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "Entendo. Eu entendo que voc� queira partir agora, mas, se precisa de ajuda com as armas, por favor, venha me ver~ Eu estarei aqui de qualquer forma." );
	else {
		// Warrior ����
		if ( index == 0 ) ret = inventory.exchange( -120000, 1302056, -1, 4000244, -20, 4000245, -25, 4005000, -8, 1302059, 1);
		else if ( index == 1 ) ret = inventory.exchange( -120000, 1312030, -1, 4000244, -20, 4000245, -25, 4005000, -8, 1312031, 1);
		else if ( index == 2 ) ret = inventory.exchange( -120000, 1322045, -1, 4000244, -20, 4000245, -25, 4005000, -8, 1322052, 1);
		else if ( index == 3 ) ret = inventory.exchange( -120000, 1402035, -1, 4000244, -20, 4000245, -25, 4005000, -8, 1402036, 1);
		else if ( index == 4 ) ret = inventory.exchange( -120000, 1412021, -1, 4000244, -20, 4000245, -25, 4005000, -8, 1412026, 1);
		else if ( index == 5 ) ret = inventory.exchange( -120000, 1422027, -1, 4000244, -20, 4000245, -25, 4005000, -8, 1422028, 1);
		else if ( index == 6 ) ret = inventory.exchange( -120000, 1432030, -1, 4000244, -20, 4000245, -25, 4005000, -8, 1432038, 1);
		else if ( index == 7 ) ret = inventory.exchange( -120000, 1442044, -1, 4000244, -20, 4000245, -25, 4005000, -8, 1442045, 1);
		// Magician ���� ����
		else if ( index == 100 ) ret = inventory.exchange( -120000, 1372010, -1, 4000244, -20, 4000245, -25, 4005001, -6, 4005003, -2, 1372032, 1);
		else if ( index == 101 ) ret = inventory.exchange( -120000, 1382035, -1, 4000244, -20, 4000245, -25, 4005001, -6, 4005003, -2, 1382036, 1);
		// Bowman ���� ����
		else if ( index == 200 ) ret = inventory.exchange( -120000, 1452019, -1, 4000244, -20, 4000245, -25, 4005000, -3, 4005002, -5, 1452044, 1);
		else if ( index == 201 ) ret = inventory.exchange( -120000, 1462015, -1, 4000244, -20, 4000245, -25, 4005000, -5, 4005002, -3, 1462039, 1);
		// Thief ���� ����
		else if ( index == 300 ) ret = inventory.exchange( -120000, 1332051, -1, 4000244, -20, 4000245, -25, 4005000, -5, 4005002, -3, 1332049, 1);
		else if ( index == 301 ) ret = inventory.exchange( -120000, 1332052, -1, 4000244, -20, 4000245, -25, 4005002, -3, 4005003, -5, 1332050, 1);
		else if ( index == 302 ) ret = inventory.exchange( -120000, 1472053, -1, 4000244, -20, 4000245, -25, 4005002, -2, 4005003, -6, 1472051, 1);

		if ( ret == 0 ) self.say( "Verifique se voc� tem todos os itens necess�rios, ou se o seu invent�rio de equip. possui slots livres." );
		else self.say( "Aqui, � seu. " + makeItem + ". Eu acho que me sai muito bem, especialmente beeeeeeem aqui. Eu espero que voc� esteja #Gsatisfeito:satisfeita# com o resultado. Se voc� quiser aperfei�oar outra arma mais tarde, por favor, volte para me ver~" );
	}
}

script "minar_weapon" {
//	qr = target.questRecord;
	inven = target.inventory;
//	if ( qr.getState( 7301 ) == 1 or qr.getState( 7303 ) == 1 ) {
	if ( inven.itemCount( 4001079 ) > 0 ) {
		if ( inven.itemCount( 4001078 ) < 1 ) {
			ret = self.askYesNo( "Humm... Parece que voc� deseja algo de mim. O que �?" );
			if( ret == 0 ) self.say( "Opa! Talvez eu tenha errado." );
			else {
				val = self.askYesNo( "Voc� precisa de #b#t4001078##k? Bem, a �nica maneira de fazer #b#t4001078##k seria modificar #b#t4001079##k. Para modificar #b#t4001079##k precisarei dos seguintes itens. Voc� deseja modific�-lo?\r\n#b#v4001079# #t4001079# \r\n#v4011001# 1 #t4011001#s\r\n#v4011002# 1 #t4011002#s" );
				if ( val == 0 ) {
					self.say( "Se mudar de id�ia, � s� me falar." );
					end;
				} else {
					if ( inven.itemCount( 4001078 ) < 1 ) {
						ret = inven.exchange( 0, 4001079, -1, 4011001, -1, 4011002, -1, 4001078, 1 );
						if ( ret == 0 ) self.say( "Por favor, verifique se voc� tem todos os itens prontos, ou se seu invent�rio de etc. tem espa�o suficiente." );
						else {
							self.say( "O que voc� acha? Como se fosse novo, n�? Se voc� perd�-lo, ou quiser fazer outro novo, sabe onde me achar~" );
							end;
						}
					} else {
						self.say( "Eu acho que voc� j� tem um #b#t4001078##k." );
						end;
					}
				}
			}
		}
	}

	nRet1 = self.askYesNo( "Ol�~ Se tiver interesse em aperfei�oar sua arma, voc� com certeza veio ao lugar certo! Sou o melhor armeiro desta grande cidade de Leafre. Certo, o que voc� acha de uma arma que cont�m o incr�vel poder do drag�o? O que voc� acha?" );
	if ( nRet1 == 0 ) self.say( "Eu sou a �nica pessoa que pode criar uma arma que cont�m o incr�vel poder do drag�o. Me avise se voc� mudar de id�ia." );
	else {
		v1 = self.askMenu( "Certo. Com uma pequena taxa, eu vou criar uma maravilhosa arma para voc�, e, dentro dela, o incr�vel poder do drag�o.\r\n#b#L0# O que � um estimulador?#l\r\n#b#L1# Criar uma arma de Guerreiro usando o estimulador#l\r\n#b#L2# Criar uma arma de M�gico usando o estimulador#l\r\n#b#L3# Criar uma arma de Arqueiro usando o estimulador#l\r\n#b#L4# Criar uma arma de Gatuno usando o estimulador#l\r\n\r\n#b#L5# Criar uma arma normal de Guerreiro#l\r\n#b#L6# Criar uma arma normal de M�gico#l\r\n#b#L7# Criar uma arma normal de Arqueiro#l\r\n#b#L8# Criar uma arma normal de Gatuno#l" );;
		if ( v1 == 0 ) {
			self.say( "Em Leafre, voc� pode aperfei�oar ainda mais sua arma usando o estimulador. Tudo bem, mas o que � o #restimulador#k? � uma po��o misteriosa que est� inclusa no processo de cria��o de uma arma, e, ap�s ser usada, a arma ser� criada com uma op��o de leve incrementa��o da arma, como se voc� a tivesse recebido de um monstro. O estimulador pode ent�o ser usado n�o apenas em armas, mas tamb�m em outros itens. Certifique-se de carregar muitos deles com voc�, pois h� tipos diferentes de estimuladores dispon�veis para diferentes tipos de armas." );
			self.say( "Mas voc� deve estar ciente de algumas coisinhas. Se o estimulador for usado, � muito prov�vel que a op��o de item seja alterada, e o problema com isso � que o resultado pode #bacabar sendo pior#k, bem pior do que a original. Voc� tamb�m correr� o risco de uma taxa de #b10% de fracasso ao criar o item#k, o que significa que voc� perder� os itens que usou para criar o item em quest�o. Bem perigoso, n�o �?" );
			self.say( "At� mesmo com esses riscos relacionados, muitos viajantes procuram minha ajuda para criar uma arma perfeita usando o estimulador. O pensamento quanto ao item ser de m� qualidade, ficar pior do que era ou at� desaparecer pode assustar voc�, mas que tal tentar mesmo assim? Se voc� tiver sorte, o seu item pode ser uma maravilha. Isso � tudo o que posso lhe dizer." );
		}
		else if ( v1 == 1 ) {
			v2 = self.askMenu( "Em quais dessas armas para Guerreiros voc� gostaria de usar o estimulador?\r\n#L0##b #t1302059##k(N�vel Limite: 110, Guerreiro)#l\r\n#L1##b #t1312031##k(N�vel Limite: 110, Guerreiro)#l\r\n#L2##b #t1322052##k(N�vel Limite: 110, Guerreiro)#l\r\n#L3##b #t1402036##k(N�vel Limite: 110, Guerreiro)#l\r\n#L4##b #t1412026##k(N�vel Limite 110, Guerreiro)#l\r\n#L5##b #t1422028##k(N�vel Limite 110, Guerreiro)#l\r\n#L6##b #t1432038##k(N�vel Limite 110, Guerreiro)#l\r\n#L7##b #t1442045##k(N�vel Limite 110, Guerreiro)#l" );
			if ( v2 == 0 ) chat_message3( 0, "#t1302059#", "#v4130002# 1 #t4130002#\r\n#v1302056# 1 #t1302056#\r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 1 ) chat_message3( 1, "#t1312031#", "#v4130003# 1 #t4130003#\r\n#v1312030# 1 #t1312030#\r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 2 ) chat_message3( 2, "#t1322052#", "#v4130004# 1 #t4130004#\r\n#v1322045# 1 #t1322045#\r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 3 ) chat_message3( 3, "#t1402036#", "#v4130005# 1 #t4130005#\r\n#v1402035# 1 #t1402035#\r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 4 ) chat_message3( 4, "#t1412026#", "#v4130006# 1 #t4130006#\r\n#v1412021# 1 #t1412021#\r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 5 ) chat_message3( 5, "#t1422028#", "#v4130007# 1 #t4130007#\r\n#v1422027# 1 #t1422027#\r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 6 ) chat_message3( 6, "#t1432038#", "#v4130008# 1 #t4130008#\r\n#v1432030# 1 #t1432030#\r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 7 ) chat_message3( 7, "#t1442045#", "#v4130009# 1 #t4130009#\r\n#v1442044# 1 #t1442044#\r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
		}
		else if ( v1 == 2 ) {
			v2 = self.askMenu( "Em quais dessas armas para M�gicos voc� gostaria de usar o estimulador?\r\n#L0##b #t1372032##k(N�vel Limite: 108, M�gico)#l\r\n#L1##b #t1382036##k(N�vel Limite: 110, M�gico)#l" );
			if ( v2 == 0 ) chat_message3( 100, "#t1372032#", "#v4130010# 1 #t4130010# \r\n#v1372010# 1 #t1372010# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005001# 6 #t4005001#s\r\n#v4005003# 2 #t4005003#s\r\n#v4031138# 120000 mesos", 108 );
			else if ( v2 == 1 ) chat_message3( 101, "#t1382036#", "#v4130011# 1 #t4130011# \r\n#v1382035# 1 #t1382035# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005001# 6 #t4005001#s\r\n#v4005003# 2 #t4005003#s\r\n#v4031138# 120000 mesos", 110 );
		}
		else if ( v1 == 3 ) {
			v2 = self.askMenu( "Em quais dessas armas para Arqueiros voc� gostaria de usar o estimulador?\r\n#L0##b #t1452044##k(N�vel Limite: 110, Arqueiro)#l\r\n#L1##b #t1462039##k(N�vel Limite: 110, Arqueiro)#l" );
			if ( v2 == 0 ) chat_message3( 200, "#t1452044#", "#v4130012# 1 #t4130012# \r\n#v1452019# 1 #t1452019# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 3 #t4005000#s\r\n#v4005002# 5 #t4005002#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 1 ) chat_message3( 201, "#t1462039#", "#v4130013# 1 #t4130013# \r\n#v1462015# 1 #t1462015# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 5 #t4005000#s\r\n#v4005002# 3 #t4005002#s\r\n#v4031138# 120000 mesos", 110 );
		}
		else if ( v1 == 4 ) {
			v2 = self.askMenu( "Em quais dessas armas para Gatunos voc� gostaria de usar o estimulador?\r\n#L0##b #t1332049##k(N�vel Limite: 110, Gatuno)#l\r\n#L1##b #t1332050##k(N�vel Limite: 110, Gatuno)#l\r\n#L2##b #t1472051##k(N�vel Limite : 110, Gatuno)#l" );
			if ( v2 == 0 ) chat_message3( 300, "#t1332049#", "#v4130014# #t4130014# \r\n#v1332051# #t1332051# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 5 #t4005000#s\r\n#v4005002# 3 #t4005002#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 1 ) chat_message3( 301, "#t1332050#", "#v4130014# 1 #t4130014# \r\n#v1332052# 1 #t1332052# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005002# 3 #t4005002#s\r\n#v4005003# 5 #t4005003#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 2 ) chat_message3( 302, "#t1472051#", "#v4130015# 1 #t4130015# \r\n#v1472053# 1 #t1472053# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005002# 2 #t4005002#s\r\n#v4005003# 6 #t4005003#s\r\n#v4031138# 120000 mesos", 110 );
		}
		else if ( v1 == 5 ) {
			v2 = self.askMenu( "Ent�o voc� est� #Gdisposto:disposta# a aperfei�oar sua arma de Guerreiro, certo? J� que isso n�o envolve estimuladores, sua arma n�o correr� riscos de ser destru�da no processo. Al�m do que, como resultado, a efici�ncia geral da arma ser� aumentada. Por favor, escolha o item que voc� gostaria de criar~\r\n#L0##b #t1302059##k(Limite do N�vel : 110, Guerreiro)#l\r\n#L1##b #t1312031##k(N�vel Limite : 110, Guerreiro)#l\r\n#L2##b #t1322052##k(N�vel Limite: 110, Guerreiro)#l\r\n#L3##b #t1402036##k(N�vel Limite: 110, Guerreiro)#l\r\n#L4##b #t1412026##k(N�vel Limite 110, Guerreiro)#l\r\n#L5##b #t1422028##k(N�vel Limite 110, Guerreiro)#l\r\n#L6##b #t1432038##k(N�vel Limite 110, Guerreiro)#l\r\n#L7##b #t1442045##k(N�vel Limite 110, Guerreiro)#l" );
			if ( v2 == 0 ) chat_message4( 0, "#t1302059#", "#v1302056# #t1302056# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 1 ) chat_message4( 1, "#t1312031#", "#v1312030# 1 #t1312030# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 2 ) chat_message4( 2, "#t1322052#", "#v1322045# 1 #t1322045# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 3 ) chat_message4( 3, "#t1402036#", "#v1402035# 1 #t1402035# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 4 ) chat_message4( 4, "#t1412026#", "#v1412021# 1 #t1412021# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 5 ) chat_message4( 5, "#t1422028#", "#v1422027# 1 #t1422027# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 6 ) chat_message4( 6, "#t1432038#", "#v1432030# 1 #t1432030# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 7 ) chat_message4( 7, "#t1442045#", "#v1442044# 1 #t1442044# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 8 #t4005000#s\r\n#v4031138# 120000 mesos", 110 );
		}
		else if ( v1 == 6 ) {
			v2 = self.askMenu( "Ent�o voc� est� #Gdisposto:disposta# a aperfei�oar sua arma de M�gico, certo? J� que isso n�o envolve estimuladores, sua arma n�o correr� riscos de ser destru�da no processo. Al�m do que, como resultado, a efici�ncia geral da arma ser� aumentada. Por favor, escolha o item que voc� gostaria de criar~\r\n#L0##b #t1372032##k(Limite do N�vel: 108, M�gico)#l\r\n#L1##b #t1382036##k(N�vel Limite: 110, M�gico)#l" );
			if ( v2 == 0 ) chat_message4( 100, "#t1372032#", "#v1372010# 1 #t1372010# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005001# 6 #t4005001#s\r\n#v4005003# 2 #t4005003#s\r\n#v4031138# 120000 mesos", 108 );
			else if ( v2 == 1 ) chat_message4( 101, "#t1382036#", "#v1382035# 1 #t1382035# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005001# 6 #t4005001#s\r\n#v4005003# 2 #t4005003#s\r\n#v4031138# 120000 mesos", 110 );
		}
		else if ( v1 == 7 ) {
			v2 = self.askMenu( "Ent�o voc� est� #Gdisposto:disposta# a aperfei�oar sua arma de Arqueiro, certo? J� que isso n�o envolve estimuladores, sua arma n�o correr� riscos de ser destru�da no processo. Al�m do que, como resultado, a efici�ncia geral da arma ser� aumentada. Por favor, escolha o item que voc� gostaria de criar~\r\n#L0##b #t1452044##k(Limite do N�vel: 110, Arqueiro)#l\r\n#L1##b #t1462039##k(N�vel Limite: 110, Arqueiro)#l" );
			if ( v2 == 0 ) chat_message4( 200, "#t1452044#", "#v1452019# 1 #t1452019# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 3 #t4005000#s\r\n#v4005002# 5 #t4005002#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 1 ) chat_message4( 201, "#t1462039#", "#v1462015# 1 #t1462015# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 5 #t4005000#s\r\n#v4005002# 3 #t4005002#s\r\n#v4031138# 120000 mesos", 110 );
		}
		else if ( v1 == 8 ) {
			v2 = self.askMenu( "Ent�o voc� est� #Gdisposto:disposta# a aperfei�oar sua arma de Gatuno, certo? J� que isso n�o envolve estimuladores, sua arma n�o correr� riscos de ser destru�da no processo. Al�m do que, como resultado, a efici�ncia geral da arma ser� aumentada. Por favor, escolha o item que voc� gostaria de criar~\r\n#L0##b #t1332049##k(Limite do N�vel: 110, Gatuno)#l\r\n#L1##b #t1332050##k(N�vel Limite: 110, Gatuno)#l\r\n#L2##b #t1472051##k(N�vel Limite: 110, Gatuno)#l" );
			if ( v2 == 0 ) chat_message4( 300, "#t1332049#", "#v1332051# #t1332051# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005000# 5 #t4005000#s\r\n#v4005002# 3 #t4005002#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 1 ) chat_message4( 301, "#t1332050#", "#v1332052# 1 #t1332052# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005002# 3 #t4005002#s\r\n#v4005003# 5 #t4005003#s\r\n#v4031138# 120000 mesos", 110 );
			else if ( v2 == 2 ) chat_message4( 302, "#t1472051#", "#v1472053# 1 #t1472053# \r\n#v4000244# 20 #t4000244#s\r\n#v4000245# 25 #t4000245#s\r\n#v4005002# 2 #t4005002#s\r\n#v4005003# 6 #t4005003#s\r\n#v4031138# 120000 mesos", 110 );
		}
	}
}
