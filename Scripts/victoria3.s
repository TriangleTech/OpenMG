module "standard.s";

// selling tickets at the subway station to the construction site : The higher the level, the longer the list of tickets available. The character can enter without having to receive a quest.
script "subway_ticket" {
	if ( target.nLevel < 20 ) self.say( "Voc� pode entrar se comprou o bilhete, mas n�o t� parecendo que voc� vai poder. Tem instrumentos estranhos no subterr�neo e deve ser muito dif�cil pra voc� lidar com eles, ent�o treine, se prepare e volte, t� bem?" );
	else {
		giveTicket = 0;

		if ( target.nLevel > 19 and target.nLevel < 30 ) {
			v = self.askMenu( "Voc� precisa comprar o bilhete para entrar. Quando voc� tiver comprado, pode entrar por #p1052007#, � direita. O que voc� gostaria de comprar? \r\n#b#L0#Local de Constru��o B1#l" );
			if ( v == 0 ) giveTicket = 1;
		}
		if ( target.nLevel > 29 and target.nLevel < 40 ) {
			v = self.askMenu( "Voc� precisa comprar o bilhete para entrar. Quando voc� tiver comprado, pode entrar por #p1052007#, � direita. O que voc� gostaria de comprar? \r\n#b#L0#Local de Constru��o B1#l \r\n#b#L1#Local de Constru��o B2#l" );
			if ( v == 0 ) giveTicket = 1;
			else if ( v == 1 ) giveTicket = 2;
		}
		if ( target.nLevel > 39 ) {
			v = self.askMenu( "Voc� precisa comprar o bilhete para entrar. Quando voc� tiver comprado, pode entrar por #p1052007#, � direita. O que voc� gostaria de comprar? \r\n#b#L0#Local de Constru��o B1#l \r\n#b#L1#Local de Constru��o B2#l \r\n#b#L2#Local de Constru��o B3#l" );
			if ( v == 0 ) giveTicket = 1;
			else if ( v == 1 ) giveTicket = 2;
			else if ( v == 2 ) giveTicket = 3;
		}

		inventory = target.inventory;
		// construction site B1 : 500 mesos, construction site B2 : 1200 mesos, construction site B3 : 2000 mesos
		if ( giveTicket == 1 ) {
			nRet = self.askYesNo( "Voc� vai comprar o bilhete para o #bLocal de Constru��o B1#k? Vai custar 500 mesos. Antes de fazer a compra, verifique se voc� tem um slot vazio no seu invent�rio de etc." );
			if ( nRet == 1 ) {
				ret = inventory.exchange( -500, 4031036, 1 );
				if ( ret == 0 ) self.say( "Est� faltando dinheiro? Confirme se voc� tem ou n�o um slot vazio no seu invent�rio de etc." );
				else self.say( "Voc� pode inserir o bilhete em #p1052007#. Ouvi dizer que na �rea 1 existem alguns itens preciosos dispon�veis, mas, com tantas armadilhas por todo lugar, a maioria volta logo. Desejo muito boa sorte." );
			}
			else self.say( "Voc� pode entrar no local se tiver comprado o bilhete. Ouvi dizer que existem instrumentos estranhos em todo lugar por l�, mas no final itens preciosos e raros esperam por voc�. Ent�o, me diga se voc� mudar de id�ia." );
		}
		else if ( giveTicket == 2 ) {
			nRet = self.askYesNo( "Voc� vai comprar o bilhete para o #bLocal de Constru��o B2#k? Vai custar 1200 mesos. Antes de fazer a compra, verifique se voc� tem um slot vazio no seu invent�rio de etc." );
			if ( nRet == 1 ) {
				ret = inventory.exchange( -1200, 4031037, 1 );
				if ( ret == 0 ) self.say( "Est� faltando dinheiro? Confirme se voc� tem ou n�o um slot vazio no seu invent�rio de etc." );
				else self.say( "Voc� pode inserir o bilhete em #p1052007#. Ouvi dizer que na �rea 2 existem alguns itens preciosos dispon�veis, mas, com tantas armadilhas por todo lugar, a maioria volta logo. Por favor, tome cuidado." );
			}
			else self.say( "Voc� pode entrar no local se tiver comprado o bilhete. Ouvi dizer que existem instrumentos estranhos em todo lugar por l�, mas no final itens preciosos e raros esperam por voc�. Ent�o, me diga se voc� mudar de id�ia." );
		}
		else if ( giveTicket == 3 ) {
			nRet = self.askYesNo( "Voc� vai comprar o bilhete para o #bLocal de Constru��o B3#k? Vai custar 2000 mesos. Antes de fazer a compra, verifique se voc� tem um slot vazio no seu invent�rio de etc." );
			if ( nRet == 1 ) {
				ret = inventory.exchange( -2000, 4031038, 1 );
				if ( ret == 0 ) self.say( "Est� faltando dinheiro? Confirme se voc� tem ou n�o um slot vazio no seu invent�rio de etc." );
				else self.say( "Voc� pode inserir o bilhete em #p1052007#. Ouvi dizer que na �rea 3 existem alguns itens preciosos dispon�veis, mas, com tantas armadilhas por todo lugar, a maioria volta logo. Desejo muito boa sorte." );
			}
			else self.say( "Voc� pode entrar no local se tiver comprado o bilhete. Ouvi dizer que existem instrumentos estranhos em todo lugar por l�, mas no final itens preciosos e raros esperam por voc�. Ent�o, me diga se voc� mudar de id�ia." );
		}
	}
}

// Take the ticket and let the character into the construction site
script "_subway_in" {
	inventory = target.inventory;

	if ( inventory.itemCount( 4031036 ) >= 1 ) {
		nRet = self.askYesNo( "Aqui est� o leitor de bilhetes. Voc� vai usar #b#t4031036##k? Se voc� usar o bilhete, ser� #Gtrazido:trazida# para dentro imediatamente." );
		if ( nRet == 1 ) {
			ret = inventory.exchange( 0, 4031036, -1 );
			if ( ret == 0 ) self.say( "Insira #b#t4031036##k no leitor de bilhetes." );
			else registerTransferField( 103000900, "" );
		}
	}
	else if ( inventory.itemCount( 4031037 ) >= 1 ) {
		nRet = self.askYesNo( "Aqui est� o leitor de bilhetes. Voc� vai usar #b#t4031037##k? Se voc� usar o bilhete, ser� #Gtrazido:trazida# para dentro imediatamente." );
		if ( nRet == 1 ) {
			ret = inventory.exchange( 0, 4031037, -1 );
			if ( ret == 0 ) self.say( "Insira #b#t4031037##k no leitor de bilhetes." );
			else registerTransferField( 103000903, "" );
		}
	}
	else if ( inventory.itemCount( 4031038 ) >= 1 ) {
		nRet = self.askYesNo( "Aqui est� o leitor de bilhetes. Voc� vai usar #b#t4031038##k? Se voc� usar o bilhete, ser� #Gtrazido:trazida# para dentro imediatamente." );
		if ( nRet == 1 ) {
			ret = inventory.exchange( 0, 4031038, -1 );
			if ( ret == 0 ) self.say( "Insira #b#t4031038##k no leitor de bilhetes." );
			else registerTransferField( 103000906, "" );
		}
	}
	else self.say( "Aqui est� o leitor de bilhetes. N�o ser� permitida sua entrada sem o bilhete." );
}

script "subway_in" {
	
	field = self.field;
	cTime = currentTime;
	inven = target.inventory;
	tMinute = 0;
	nPeople = 0;

	list = "";
	if ( inven.itemCount( 4031036 ) > 0 ) list = list + "\r\b#b#L0# Local de Constru��o B1#l#k";
	if ( inven.itemCount( 4031037 ) > 0 ) list = list + "\r\b#b#L1# Local de Constru��o B2#l#k";
	if ( inven.itemCount( 4031038 ) > 0 ) list = list + "\r\b#b#L2# Local de Constru��o B3#l#k";
	
	if ( inven.itemCount( 4031710 ) > 0 ) list = list + "\r\b#b#L3# Cidade Folha Nova (para aprendizes)#l#k";
	if ( inven.itemCount( 4031711 ) > 0 ) list = list + "\r\b#b#L4# Cidade Folha Nova (Normal)#l#k";

	if ( list == "" ) {
		self.say( "Aqui est� o leitor de bilhetes. N�o ser� permitida sua entrada sem o bilhete." );
	} else {
		v0 = self.askMenu( "Aqui est� o leitor de bilhetes. Voc� ser� #Gtrazido:trazida# para dentro imediatamente. Qual bilhete voc� gostaria de usar?" + list );
		if ( v0 == 0 ) {
			ret = inven.exchange( 0, 4031036, -1 );
			if ( ret == 0 ) self.say( "Insira #b#t4031036##k no leitor de bilhetes." );
			else registerTransferField( 103000900, "" );		
		} else if ( v0 == 1 ) {
			ret = inven.exchange( 0, 4031037, -1 );
			if ( ret == 0 ) self.say( "Insira #b#t4031037##k no leitor de bilhetes." );
			else registerTransferField( 103000903, "" );
		} else if ( v0 == 2 ) {
			ret = inven.exchange( 0, 4031038, -1 );
			if ( ret == 0 ) self.say( "Insira #b#t4031038##k no leitor de bilhetes." );
			else registerTransferField( 103000906, "" );
		}
		else if ( v0 == 3 ) {
		
			tMinute = integer( substring( cTime, 13, 1 ) );

			if ( tMinute == 0 or tMinute == 5 ) self.say( "N�s come�aremos a embarcar 2 minutos antes da partida. Por favor, seja paciente e espere alguns minutinhos. Fique #Gatento:atenta#, porque o metr� partir� na hora certa, e n�s paramos de receber bilhetes 1 minuto antes disso. Ent�o, por favor, esteja aqui dentro do hor�rio.");
			else if ( tMinute == 9 or tMinute == 4 ) self.say( "O metr� para CFN est� se preparando para a partida. Desculpe, mas voc� ter� que embarcar na pr�xima viagem. O hor�rio das viagens est� dispon�vel com o porteiro, no guich�.");
			else {
				nPeople = field.getUserCount;
				if ( nPeople >= 50 ) self.say( "Desculpe, mas esta viagem est� LOTADA. N�o podemos aceitar mais passageiros. Por favor, embarque na pr�xima viagem.");
				else {
					nRet = self.askYesNo( "Parece que h� muitos lugares vagos nesta viagem. Por favor, esteja com seu bilhete em m�os e ent�o posso deixar voc� entrar. O percurso ser� longo, mas finalmente voc� chegar� ao seu destino. O que voc� acha? Quer embarcar nesta viagem?");
					if ( nRet == 0 ) self.say( "Voc� deve ter algum neg�cio para cuidar aqui, certo?");
					else {
						ret = inven.exchange( 0, 4031710, -1 );
						if ( ret == 0 ) self.say( "Insira #b#t4031710##k no leitor de bilhetes." );
						else registerTransferField( 600010004, "st00" );
					}
				}
			}
		}
		else if ( v0 == 4 ) {
		
			tMinute = integer( substring( cTime, 13, 1 ) );

			if ( tMinute == 0 or tMinute == 5 ) self.say( "N�s come�aremos a embarcar 2 minutos antes da partida. Por favor, seja paciente e espere alguns minutinhos. Fique #Gatento:atenta#, porque o metr� partir� na hora certa, e n�s paramos de receber bilhetes 1 minuto antes disso. Ent�o, por favor, esteja aqui dentro do hor�rio.");
			else if ( tMinute == 9 or tMinute == 4 ) self.say( "O metr� para CFN est� se preparando para a partida. Desculpe, mas voc� ter� que embarcar na pr�xima viagem. O hor�rio das viagens est� dispon�vel com o porteiro, no guich�.");
			else {
				nPeople = field.getUserCount;
				if ( nPeople >= 50 ) self.say( "Desculpe, mas esta viagem est� LOTADA. N�o podemos aceitar mais passageiros. Por favor, embarque na pr�xima viagem.");
				else {
					nRet = self.askYesNo( "Parece que h� muitos lugares vagos nesta viagem. Por favor, esteja com seu bilhete em m�os e ent�o posso deixar voc� entrar. O percurso ser� longo, mas finalmente voc� chegar� ao seu destino. O que voc� acha? Quer embarcar nesta viagem?");
					if ( nRet == 0 ) self.say( "Voc� deve ter algum neg�cio para cuidar aqui, certo?");
					else {
						ret = inven.exchange( 0, 4031711, -1 );
						if ( ret == 0 ) self.say( "Insira #b#t4031711##k no leitor de bilhetes." );
						else registerTransferField( 600010004, "st00" );
					}
				}
			}
		}
	}
}

// The place where the character finds the coin at construction site B1: If the character came in without receiving the quest from Shumi, then a random ore of a mineral will be given at the end.
script "subway_get1" {
	qr = target.questRecord;
	val = qr.getState( 2055 );

	inventory = target.inventory;

	if ( inventory.itemCount( 4031039 ) < 1 ) {
		if ( val == 1 ) {
			ret = inventory.exchange( 0, 4031039, 1 );
			if ( ret == 0 ) self.say( "Olhando atentamente em #p1052008#, parece que tem um objeto brilhante, s� que, uma vez que seu invent�rio de etc. est� cheio, o item est� inacess�vel." );
			else {
				self.say( "Olhando atentamente em #p1052008#, parece que tem um objeto brilhante. Estendeu a m�o e conseguiu alcan�ar uma moeda pequena." );
				registerTransferField( 103000100, "" );
			}
		}
		else {
			// If the character walks in without a quest, then give him/her one raw ore of a mineral; if the character walked in after finishing up a quest, then give him/her 2 raw ores of a random mineral.
			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
				if ( val == 2 ) nNewItemNum = 2;
				else nNewItemNum = 1;

				rnum = random( 0, 5 );
				nNewItemID = 0;
				if ( rnum == 0 ) nNewItemID = 4010000;
				else if ( rnum == 1 ) nNewItemID = 4010001;
				else if ( rnum == 2 ) nNewItemID = 4010002;
				else if ( rnum == 3 ) nNewItemID = 4010003;
				else if ( rnum == 4 ) nNewItemID = 4010004;
				else if ( rnum == 5 ) nNewItemID = 4010005;
				ret = inventory.exchange( 0, nNewItemID, nNewItemNum );
				if ( ret == 0 ) self.say( "Olhando atentamente em #t1052008#, parece que tem um objeto brilhante, s� que, uma vez que seu invent�rio de etc. est� cheio, o item est� inacess�vel. Libere espa�o no seu invent�rio de etc., ent�o volte aqui." );
				else registerTransferField( 103000100, "" );
			}
			else self.say( "Voc� n�o pode ter o item que encontrou porque seu invent�rio de etc. est� cheio. Libere espa�o para o item e ent�o volte." );
		}
	}
	else {
		self.say( "Voc� j� tem a moeda. N�s olhamos mais e n�o encontramos nada." );
		registerTransferField( 103000100, "" );
	}
}

// The place where the character finds the stack of money at construction site B2 : If the character came in without receiving the quest from Shumi, an ore of a random jewel will be given.
script "subway_get2" {
	qr = target.questRecord;
	val = qr.getState( 2056 );

	inventory = target.inventory;

	if ( inventory.itemCount( 4031040 ) < 1 ) {
		if ( val == 1 ) {
			ret = inventory.exchange( 0, 4031040, 1 );
			if ( ret == 0 ) self.say( "Olhando atentamente em #p1052008#, parece que tem uma pilha de pap�is, s� que, uma vez que seu invent�rio de etc. est� cheio, o item est� inacess�vel." );
			else {
				self.say( "Olhando atentamente em #p1052008#, parece que tem uma pilha de pap�is ali. Eu estendi minha m�o e... aha! Uma pilha enorme de dinheiro." );
				registerTransferField( 103000100, "" );
			}
		}
		else {
			// 1 random ore of a jewel if the character went in without receiving a quest, 2 if the character received the quest.
			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
				if ( val == 2 ) nNewItemNum = 2;
				else nNewItemNum = 1;

				rnum = random( 0, 6 );
				nNewItemID = 0;
				if ( rnum == 0 ) nNewItemID = 4020000;
				else if ( rnum == 1 ) nNewItemID = 4020001;
				else if ( rnum == 2 ) nNewItemID = 4020002;
				else if ( rnum == 3 ) nNewItemID = 4020003;
				else if ( rnum == 4 ) nNewItemID = 4020004;
				else if ( rnum == 5 ) nNewItemID = 4020005;
				else if ( rnum == 6 ) nNewItemID = 4020006;
				ret = inventory.exchange( 0, nNewItemID, nNewItemNum );
				if ( ret == 0 ) self.say( "Olhando atentamente em #t1052008#, parece que tem alguma coisa ali dentro, mas, uma vez que seu invent�rio de etc. est� cheio, o item est� inacess�vel. Libere espa�o para o item e ent�o volte." );
				else registerTransferField( 103000100, "" );
			}
			else self.say( "Voc� n�o pode ter o item que encontrou porque seu invent�rio de etc. est� cheio. Libere espa�o para o item e ent�o volte." );
		}
	}
	else {
		self.say( "Voc� j� tem a pilha de dinheiro. N�s olhamos mais e n�o encontramos nada." );
		registerTransferField( 103000100, "" );
	}
}

// The place where the character finds the sack of money at construction site B3 : If the character came in without receiving the quest from Shumi, a random ore of a rare mineral or a jewel will be given.
script "subway_get3" {
	qr = target.questRecord;
	val = qr.getState( 2057 );

	inventory = target.inventory;

	if ( inventory.itemCount( 4031041 ) < 1 ) {
		if ( val == 1 ) {
			ret = inventory.exchange( 0, 4031041, 1 );
			if ( ret == 0 ) self.say( "Olhando atentamente em #p1052008#, parece que tem um saco de alguma coisa que cont�m um objeto brilhante, s� que, uma vez que seu invent�rio de etc. est� cheio, o item est� inacess�vel." );
			else {
				self.say( "Olhando atentamente em #p1052008#, parece que tem um saco de alguma coisa que cont�m um objeto brilhante. Estendeu a m�o e conseguiu alcan�ar um saco de moedas pesado." );
				registerTransferField( 103000100, "" );
			}
		}
		else {
			// 1 random ore of a mineral or a rare jewel if entering without the quest, 2 if with the quest.
			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
				if ( val == 2 ) nNewItemNum = 2;
				else nNewItemNum = 1;

				rnum = random( 0, 2 );
				nNewItemID = 0;
				if ( rnum == 0 ) nNewItemID = 4010006;
				else if ( rnum == 1 ) nNewItemID = 4020007;
				else if ( rnum == 2 ) nNewItemID = 4020008;
				ret = inventory.exchange( 0, nNewItemID, nNewItemNum );
				if ( ret == 0 ) self.say( "Olhando atentamente em #t1052008#, parece que tem alguma coisa ali dentro, mas, uma vez que seu invent�rio de etc. est� cheio, o item est� inacess�vel. Libere espa�o para o item e ent�o volte." );
				else registerTransferField( 103000100, "" );
			}
			else self.say( "Voc� n�o pode ter o item que encontrou porque seu invent�rio de etc. est� cheio. Libere espa�o para o item e ent�o volte." );
		}
	}
	else {
		self.say( "Voc� j� tem o saco de moedas. N�s olhamos mais e n�o encontramos nada." );
		registerTransferField( 103000100, "" );
	}
}

// The device for the character to leave if giving up midway through the quest
script "subway_out" {
	nRet = self.askYesNo( "Este dispositivo est� conectado ao exterior. Voc� vai desistir e deixar este lugar? Voc� ter� de come�ar do ponto de partida na pr�xima vez que vier aqui..." );
	if ( nRet == 1 ) registerTransferField( 103000100, "" );
}

// A receptionist from sleepywood hotel
script "hotel1" {
	self.say( "Bem-vindo. Somos o Hotel #m105040300#. Nosso hotel trabalha duro para melhor servir o tempo todo. Se voc� est� #Gcansado:cansada#, se sentindo #Gexausto:exausta# por ter ca�ado, que acha de uma estada relaxante em nosso hotel?" );
	v1 = self.askMenu( "Oferecemos dois tipos de servi�o de quarto. Por favor, escolha o de sua prefer�ncia. \r\n#L0##bSauna comum (499 mesos por uso) #k#l\r\n#L1##bSauna VIP (999 mesos por uso)#k#l" );
	if ( v1 == 0 ) {
		nRet = self.askYesNo( "Voc� escolheu a sauna comum. Seu HP e MP ir�o se restaurar rapidamente e voc� pode at� mesmo comprar alguns itens l�. Tem certeza de que deseja entrar?" );
		if ( nRet == 0 ) self.say( "Oferecemos tamb�m outros tipos de servi�o. Por favor, pense bem e ent�o decida." );
		else if ( nRet == 1 ) {
			mon = target.incMoney( -499, 1 );
			if ( mon == 0 ) self.say( "Me desculpe. Parece que voc� n�o tem dinheiro. Ficar em nosso hotel vai custar pelo menos 499 mesos." );
			else registerTransferField( 105040401, "" );
		}
	}
	else if ( v1 == 1 ) {
		nRet = self.askYesNo( "Voc� escolheu a sauna VIP. Seu HP e MP ir�o se restaurar mais rapidamente do que na sauna comum, e voc� pode at� mesmo encontrar um item especial l�. Tem certeza de que deseja entrar?" );
		if ( nRet == 0 ) self.say( "Oferecemos tamb�m outros tipos de servi�o. Por favor, pense bem e ent�o decida." );
		else if ( nRet == 1 ) {
			mon = target.incMoney( -999, 1 );
			if ( mon == 0 ) self.say( "Me desculpe. Parece que voc� n�o tem dinheiro. Ficar em nosso hotel vai custar pelo menos 999 mesos." ); 
			else registerTransferField( 105040402,"" );
		}
	}
}
