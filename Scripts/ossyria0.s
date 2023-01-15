module "standard.s";

// The NPC that warps the character to the different boarding platform
script "getAboard" {
	v = self.askMenu( "A Esta��o de Orbis tem muitas plataformas � escolha. Voc� precisa escolher aquela que vai levar ao destino escolhido. Qual plataforma voc� vai pegar?\r\n#b#L0# A plataforma para o navio que segue para Ellinia #l\r\n#b#L1#A plataforma do navio que segue para Ludibrium#l#k" );
	if ( v == 0 ) {
		nRet = self.askYesNo( "Mesmo se pegar a passagem errada, voc� pode voltar aqui usando o portal. Deseja ir para a #bplataforma do navio que vai para Ellinia#k?" );
		if ( nRet == 0 ) self.say( "Por favor, tenha certeza de para onde est� indo e siga para a plataforma atrav�s de mim. A sa�da � programada, n�o v� perder!" );
		else if ( nRet == 1 ) registerTransferField( 200000110, "west00" );
	}
	else if ( v == 1 ) {
		nRet = self.askYesNo( "Mesmo se pegar a passagem errada, voc� pode voltar aqui usando o portal. Deseja ir para a #bplataforma do navio que vai para Ludibrium#k?" );
		if ( nRet == 0 ) self.say( "Por favor, tenha certeza de para onde est� indo e siga para a plataforma atrav�s de mim. A sa�da � programada, n�o v� perder!" );
		else if ( nRet == 1 ) registerTransferField( 200000120, "west00" );
	}	
	else if ( v == 2 ) {
		nRet = self.askYesNo( "Mesmo se pegar a passagem errada, voc� pode voltar aqui usando o portal. .\r\nDeseja ir para a #bplataforma do navio que vai para Leafre#k?" );
		if ( nRet == 0 ) self.say( "Por favor, tenha certeza de para onde est� indo e siga para a plataforma atrav�s de mim. A sa�da � programada, n�o v� perder!" );
		else if ( nRet == 1 ) registerTransferField( 200000130, "west00" );
	}	
	else if ( v == 3 ) {
		nRet = self.askYesNo( "Mesmo se pegar a passagem errada, voc� pode voltar aqui usando o portal. Deseja ir para a #bplataforma de Hak, que vai para Mu Lung#k?" );
		if ( nRet == 0 ) self.say( "Por favor, tenha certeza de para onde quer ir e siga para a plataforma atrav�s de mim." );
		else if ( nRet == 1 ) registerTransferField( 200000140, "west00" );
	}
}
	
// The NPC that allows you into the dungeon

script "goDungeon" {
	qr = target.questRecord;
	inven = target.inventory;
	if ( qr.getState( 6263 ) == 2 ) {
		if ( inven.itemCount( 4031450 ) > 0 ) {
			v0 = self.askMenu( "Voc�... Fez mesmo o #b#t4031450##k. Ningu�m garante mais qualidade do que Vogen. Certo, vou deixar voc� entrar no #m921100100#.\r\n#b#L0# Sim. Por favor, leve-me para #m921100100#.#l\r\n#L1# Eu gostaria de entrar no Monte El Nath.#l" );
			if ( v0 == 0 ) {
				quest = FieldSet( "S4freeze" );
				ret = quest.enter( target.nCharacterID, 0 );
				if ( ret != 0 ) self.say( "Outros personagem est�o na miss�o. Converse comigo depois." );	
				end;
			}
		}
	}
	self.say( "Ei, parece que voc� quer ir muito mais longe daqui. L�, no entanto, voc� vai se ver com monstros por todos os lados, agressivos, perigosos e, mesmo se achar que j� est� #Gpronto:pronta#, tenha cuidado. H� muito tempo, alguns homens corajosos da nossa cidade seguiram para eliminar quem amea�asse a cidade, mas nunca voltaram..." );

	if ( target.nLevel >= 50 ) {
		nRet = self.askYesNo( "Se estiver pensando em entrar, sugiro que mude de id�ia. Mas se realmente quiser entrar... S� ser� permitido quem for forte o suficiente para continuar vivo l� dentro. Eu n�o quero ver mais ningu�m morrer. Vamos ver... Humm...! Voc� parece bastante forte. Certo, deseja entrar?" );
		if ( nRet == 0 ) self.say( "Mesmo seu n�vel sendo alto, � dif�cil entrar l�. Mas, se mudar de id�ia, fale comigo. Afinal, meu dever � proteger este lugar." );
		else if ( nRet == 1 ) registerTransferField( 211040300, "under00" );
	}
	else self.say( "Se estiver pensando em entrar, sugiro que mude de id�ia. Mas se realmente quiser entrar... S� ser� permitido quem for forte o suficiente para continuar vivo l� dentro. Eu n�o quero ver mais ningu�m morrer. Vamos ver... Hmmm... voc� ainda n�o chegou ao n�vel 50. N�o posso deixar voc� entrar, esque�a." );
}


// The function that gives away prizes
function replaceItem( integer itemCode ) {
	inventory = target.inventory;	

	nRet1 = self.askYesNo( "Vamos ver, voc� quer trocar seu #b100 #t" + itemCode + "#s#k pelo que tenho, certo? Antes de trocar, tenha certeza de que possui um slot livre no seu invent�rio de uso ou etc. Ent�o, deseja realmente trocar?" );
	if ( nRet1 == 0 ) self.say( "Hmmm... n�o vai ser nada mau para voc�. Se vier falar comigo na hora certa, posso arranjar �timos itens. De qualquer maneira, quando quiser trocar, � s� vir at� mim." );
	else {
		// hard horn
		if ( itemCode == 4000073 ) {
			rnum = random( 1, 6 );
			if ( rnum == 1 ) {
				nNewItemID = 2000001;
				nNewItemNum = 20;
			}
			else if ( rnum == 2 ) {
				nNewItemID = 2000003;
				nNewItemNum = 15;
			}
			else if ( rnum == 3 ) {
				nNewItemID = 2020001;
				nNewItemNum = 15;
			}
			else if ( rnum == 4 ) {
				nNewItemID = 2010004;
				nNewItemNum = 10;
			}
			else if ( rnum == 5 ) {
				nNewItemID = 4003001;
				nNewItemNum = 15;
			}
			else {
				nNewItemID = 2030000;
				nNewItemNum = 15;
			}
		}
		// Star Pixie's Piece of Star or Flying Eye's Wings
		else if ( itemCode == 4000059 or itemCode == 4000076 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 25 ) {
				nNewItemID = 2000001;
				nNewItemNum = 30;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 2000003;
				nNewItemNum = 20;
			}
			else if ( rnum <= 75 ) {
				nNewItemID = 2010001;
				nNewItemNum = 40;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4003001;
				nNewItemNum = 20;
			}
			else {
				nNewItemID = 2040002;
				nNewItemNum = 1;
			}
		}
		// Nependeath's Seed
		else if ( itemCode == 4000058 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 25 ) {
				nNewItemID = 2000002;
				nNewItemNum = 15;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 2000003;
				nNewItemNum = 25;
			}
			else if ( rnum <= 75 ) {
				nNewItemID = 2010004;
				nNewItemNum = 15;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4003001;
				nNewItemNum = 30;
			}
			else {
				nNewItemID = 2040302;
				nNewItemNum = 1;
			}
		}
		// Jr. Bulldog's Tooth
		else if ( itemCode == 4000078 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 20 ) {
				nNewItemID = 2000002;
				nNewItemNum = 15;
			}
			else if ( rnum <= 40 ) {
				nNewItemID = 2000003;
				nNewItemNum = 25;
			}
			else if ( rnum <= 60 ) {
				nNewItemID = 2010004;
				nNewItemNum = 15;
			}
			else if ( rnum <= 80 ) {
				nNewItemID = 4003001;
				nNewItemNum = 30;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 2050004;
				nNewItemNum = 15;
			}
			else {
				nNewItemID = 2040302;
				nNewItemNum = 1;
			}
		}
		// Lunar Pixie's Piece of Moon
		else if ( itemCode == 4000060 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 25 ) {
				nNewItemID = 2000002;
				nNewItemNum = 25;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 2000006;
				nNewItemNum = 10;
			}
			else if ( rnum <= 75 ) {
				nNewItemID = 2022000;
				nNewItemNum = 5;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4000030;
				nNewItemNum = 15;
			}
			else {
				nNewItemID = 2040902;
				nNewItemNum = 1;
			}
		}
		// Jr. Yeti's Skin or Dark Nependeath's Seed
		else if ( itemCode == 4000048 or itemCode == 4000062 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 25 ) {
				nNewItemID = 2000002;
				nNewItemNum = 30;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 2000006;
				nNewItemNum = 15;
			}
			else if ( rnum <= 75 ) {
				nNewItemID = 2020000;
				nNewItemNum = 20;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4003000;
				nNewItemNum = 5;
			}
			else {
				nNewItemID = 2040402;
				nNewItemNum = 1;
			}
		}
		// Fireball's Flame
		else if ( itemCode == 4000081 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 15 ) {
				nNewItemID = 2000006;
				nNewItemNum = 25;
			}
			else if ( rnum <= 30 ) {
				nNewItemID = 2020006;
				nNewItemNum = 25;
			}
			else if ( rnum <= 45 ) {
				nNewItemID = 4010004;
				nNewItemNum = 8;
			}
			else if ( rnum <= 60 ) {
				nNewItemID = 4010005;
				nNewItemNum = 8;
			}
			else if ( rnum <= 75 ) {
				nNewItemID = 4010006;
				nNewItemNum = 3;
			}
			else if ( rnum <= 90 ) {
				nNewItemID = 4020008;
				nNewItemNum = 3;
			}
			else if ( rnum <= 95 ) {
				nNewItemID = 4020007;
				nNewItemNum = 2;
			}
			else {
				nNewItemID = 2040705;
				nNewItemNum = 1;
			}
		}
		// Luster Pixie's Piece of Sun
		else if ( itemCode == 4000061 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 25 ) {
				nNewItemID = 2000002;
				nNewItemNum = 30;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 2000006;
				nNewItemNum = 15;
			}
			else if ( rnum <= 75 ) {
				nNewItemID = 2020000;
				nNewItemNum = 20;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4003000;
				nNewItemNum = 5;
			}
			else {
				nNewItemID = 2041016;
				nNewItemNum = 1;
			}
		}
		// Cellion's Tail or Lioner's Tail or Grupin's Tail
		else if ( itemCode == 4000070 or itemCode == 4000071 or itemCode == 4000072 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 25 ) {
				nNewItemID = 2000002;
				nNewItemNum = 30;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 2000006;
				nNewItemNum = 15;
			}
			else if ( rnum <= 75 ) {
				nNewItemID = 2020000;
				nNewItemNum = 20;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4003000;
				nNewItemNum = 5;
			}
			else {
				nNewItemID = 2041005;
				nNewItemNum = 1;
			}
		}
		// Hector's Tail 
		else if ( itemCode == 4000051 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 35 ) {
				nNewItemID = 2002004;
				nNewItemNum = 15;
			}
			else if ( rnum <= 70 ) {
				nNewItemID = 2002005;
				nNewItemNum = 15;
			}
			else if ( rnum <= 97 ) {
				nNewItemID = 2002003;
				nNewItemNum = 10;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4001005;
				nNewItemNum = 1;
			}
			else {
				nNewItemID = 2040502;
				nNewItemNum = 1;
			}
		}
		// Dark Jr. Yeti's Skin
		else if ( itemCode == 4000055 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 35 ) {
				nNewItemID = 2022001;
				nNewItemNum = 30;
			}
			else if ( rnum <= 70 ) {
				nNewItemID = 2020006;
				nNewItemNum = 15;
			}
			else if ( rnum <= 97 ) {
				nNewItemID = 2020005;
				nNewItemNum = 30;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4003003;
				nNewItemNum = 1;
			}
			else {
				nNewItemID = 2040505;
				nNewItemNum = 1;
			}
		}
		// Zombie's Lost Tooth
		else if ( itemCode == 4000069 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 25 ) {
				nNewItemID = 2050004;
				nNewItemNum = 20;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 2000006;
				nNewItemNum = 20;
			}
			else if ( rnum <= 75 ) {
				nNewItemID = 2020006;
				nNewItemNum = 15;
			}
			else if ( rnum <= 98 ) {
				nNewItemID = 2020005;
				nNewItemNum = 30;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4003003;
				nNewItemNum = 1;
			}
			else {
				nNewItemID = 2041002;
				nNewItemNum = 1;
			}
		}
		// White Pang's Tail
		else if ( itemCode == 4000052 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 40 ) {
				nNewItemID = 2000006;
				nNewItemNum = 20;
			}
			else if ( rnum <= 60 ) {
				nNewItemID = 4010003;
				nNewItemNum = 7;
			}
			else if ( rnum <= 80 ) {
				nNewItemID = 4010004;
				nNewItemNum = 7;
			}
			else if ( rnum <= 97 ) {
				nNewItemID = 4010005;
				nNewItemNum = 7;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4003002;
				nNewItemNum = 1;
			}
			else {
				nNewItemID = 2040602;
				nNewItemNum = 1;
			}
		}
		// Pepe's Beek
		else if ( itemCode == 4000050 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 30 ) {
				nNewItemID = 2000006;
				nNewItemNum = 20;
			}
			else if ( rnum <= 45 ) {
				nNewItemID = 4010000;
				nNewItemNum = 7;
			}
			else if ( rnum <= 60 ) {
				nNewItemID = 4010001;
				nNewItemNum = 7;
			}
			else if ( rnum <= 79 ) {
				nNewItemID = 4010002;
				nNewItemNum = 7;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4010006;
				nNewItemNum = 2;
			}
			else {
				nNewItemID = 2040702;
				nNewItemNum = 1;
			}
		}
		// Dark Pepe's Beek
		else if ( itemCode == 4000057 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 30 ) {
				nNewItemID = 2000006;
				nNewItemNum = 20;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 4010004;
				nNewItemNum = 7;
			}
			else if ( rnum <= 62 ) {
				nNewItemID = 4010005;
				nNewItemNum = 7;
			}
			else if ( rnum <= 74 ) {
				nNewItemID = 4010006;
				nNewItemNum = 3;
			}
			else if ( rnum <= 86 ) {
				nNewItemID = 4020008;
				nNewItemNum = 2;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4020007;
				nNewItemNum = 2;
			}
			else {
				nNewItemID = 2040705;
				nNewItemNum = 1;
			}
		}
		// Yeti's Horn
		else if ( itemCode == 4000049 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 30 ) {
				nNewItemID = 2000006;
				nNewItemNum = 25;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 4020000;
				nNewItemNum = 7;
			}
			else if ( rnum <= 65 ) {
				nNewItemID = 4020001;
				nNewItemNum = 7;
			}
			else if ( rnum <= 85 ) {
				nNewItemID = 4020002;
				nNewItemNum = 3;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4020007;
				nNewItemNum = 2;
			}
			else {
				nNewItemID = 2040708;
				nNewItemNum = 1;
			}
		}
		// Dark Yeti's Horn
		else if ( itemCode == 4000056 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 30 ) {
				nNewItemID = 2000006;
				nNewItemNum = 25;
			}
			else if ( rnum <= 50 ) {
				nNewItemID = 4020003;
				nNewItemNum = 7;
			}
			else if ( rnum <= 65 ) {
				nNewItemID = 4020004;
				nNewItemNum = 7;
			}
			else if ( rnum <= 85 ) {
				nNewItemID = 4020005;
				nNewItemNum = 7;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 4020008;
				nNewItemNum = 2;
			}
			else {
				nNewItemID = 2040802;
				nNewItemNum = 1;
			}
		}
		// Bulldog's Tooth
		else if ( itemCode == 4000079 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 15 ) {
				nNewItemID = 2000006;
				nNewItemNum = 25;
			}
			else if ( rnum <= 30 ) {
				nNewItemID = 2022001;
				nNewItemNum = 35;
			}
			else if ( rnum <= 45 ) {
				nNewItemID = 4020000;
				nNewItemNum = 8;
			}
			else if ( rnum <= 60 ) {
				nNewItemID = 4020001;
				nNewItemNum = 8;
			}
			else if ( rnum <= 75 ) {
				nNewItemID = 4020002;
				nNewItemNum = 8;
			}
			else if ( rnum <= 90 ) {
				nNewItemID = 4020007;
				nNewItemNum = 2;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 2050004;
				nNewItemNum = 30;
			}
			else {
				nNewItemID = 2041023;
				nNewItemNum = 1;
			}
		}
		// Werewolf's Toenail
		else if ( itemCode == 4000053 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 37 ) {
				nNewItemID = 2000006;
				nNewItemNum = 30;
			}
			else if ( rnum <= 57 ) {
				nNewItemID = 4020006;
				nNewItemNum = 7;
			}
			else if ( rnum <= 77 ) {
				nNewItemID = 4020007;
				nNewItemNum = 2;
			}
			else if ( rnum <= 97 ) {
				nNewItemID = 4020008;
				nNewItemNum = 2;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 2070010;
				nNewItemNum = 1;
			}
			else {
				nNewItemID = 2040805;
				nNewItemNum = 1;
			}
		}
		// Lycanthrope's Toenail
		else if ( itemCode == 4000054 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 37 ) {
				nNewItemID = 2000006;
				nNewItemNum = 30;
			}
			else if ( rnum <= 57 ) {
				nNewItemID = 4020006;
				nNewItemNum = 7;
			}
			else if ( rnum <= 77 ) {
				nNewItemID = 4020007;
				nNewItemNum = 2;
			}
			else if ( rnum <= 97 ) {
				nNewItemID = 4020008;
				nNewItemNum = 2;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 2070010;
				nNewItemNum = 1;
			}
			else {
				nNewItemID = 2041020;
				nNewItemNum = 1;
			}
		}
		// Firedawg's necklace
		else if ( itemCode == 4000080 ) {
			rnum = random( 1, 100 );
			if ( rnum <= 37 ) {
				nNewItemID = 2000006;
				nNewItemNum = 35;
			}
			else if ( rnum <= 57 ) {
				nNewItemID = 4020006;
				nNewItemNum = 9;
			}
			else if ( rnum <= 77 ) {
				nNewItemID = 4020007;
				nNewItemNum = 4;
			}
			else if ( rnum <= 97 ) {
				nNewItemID = 4020008;
				nNewItemNum = 4;
			}
			else if ( rnum <= 99 ) {
				nNewItemID = 2070011;
				nNewItemNum = 1;
			}
			else {
				nNewItemID = 2041008;
				nNewItemNum = 1;
			}
		}
		else {
			nNewItemID = 0;
			nNewItemNum = 0;
		}

		if ( ( inventory.slotCount( 2 ) > inventory.holdCount( 2 ) ) and ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) ) {
			ret = inventory.exchange( 0, itemCode, -100, nNewItemID, nNewItemNum );
			if ( ret == 0 ) self.say( "Hmmm... Tem certeza de que coletou #b100 #t" + itemCode + "#s#k? Se sim, verifique se seu invent�rio est� cheio." );
			else {
				target.incEXP( 500, 0 );
				self.say( "Para seu #b100 #t" + itemCode + "#s#k, aqui est� meu #b" + nNewItemNum + " #t" + nNewItemID + "#(s)#k. O que voc� acha? Gostou do item que dei em troca? Devo ficar aqui por um tempo, ent�o, se juntar mais itens, estou sempre disposto a negociar..." );
			}
		}
		else self.say( "Seu invent�rio de etc. parece estar cheio. Voc� precisa de espa�o livre para trocar comigo! Abra espa�o e me encontre..." );
	}
}

// Sergeant Charlie
script "carlie" {
	self.say( "Ei, tem um tempinho? Bem, meu trabalho � coletar itens aqui e vender em outro lugar, mas ultimamente os monstros t�m ficado mais hostis e ficou muito dif�cil conseguir bons itens... O que voc� acha? Quer fazer neg�cio comigo?" );
		nRet = self.askYesNo( "O trato � simples. Voc� consegue algo que preciso e eu arranjo algo que voc� precisa. O problema � que lido com muita gente. Ent�o, os itens que tenho para oferecer podem mudar cada vez que nos encontrarmos. O que acha? Ainda quer fazer?" );
		if ( nRet == 0 ) self.say( "Hmmm... n�o vai ser nada mau para voc�. Encontre-me na hora certa e voc� pode conseguir itens muito melhores. Mas me avise quando mudar de id�ia." );
		else {
			v = self.askMenu( "Ok! Antes, voc� precisa escolher o item que deseja trocar. Quanto melhor for o item, maior ser� a chance de receber um item melhor em troca.\r\n#b#L0# 100 #t4000073#s#l\r\n#L1# 100 #t4000059#s#l\r\n#L2# 100 #t4000076#s#l\r\n#L3# 100 #t4000058#s#l\r\n#L4# 100 #t4000078#s#l\r\n#L5# 100 #t4000060#s#l\r\n#L6# 100 #t4000062#s#l\r\n#L7# 100 #t4000048#s#l\r\n#L8# 100 #t4000081#s#l\r\n#L9# 100 #t4000061#s#l\r\n#L10# 100 #t4000070#s#l\r\n#L11# 100 #t4000071#s#l\r\n#L12# 100 #t4000072#s#l\r\n#L13# 100 #t4000051#s#l\r\n#L14# 100 #t4000055#s#l\r\n#L15# 100 #t4000069#s#l\r\n#L16# 100 #t4000052#s#l\r\n#L17# 100 #t4000050#s#l\r\n#L18# 100 #t4000057#s#l\r\n#L19# 100 #t4000049#s#l\r\n#L20# 100 #t4000056#s#l\r\n#L21# 100 #t4000079#s#l\r\n#L22# 100 #t4000053#s#l\r\n#L23# 100 #t4000054#s#l\r\n#L24# 100 #t4000080#s#l" );
			if ( v == 0 ) replaceItem( 4000073 );
			else if ( v == 1 ) replaceItem( 4000059 );
			else if ( v == 2 ) replaceItem( 4000076 );
			else if ( v == 3 ) replaceItem( 4000058 );
			else if ( v == 4 ) replaceItem( 4000078 );
			else if ( v == 5 ) replaceItem( 4000060 );
			else if ( v == 6 ) replaceItem( 4000062 );
			else if ( v == 7 ) replaceItem( 4000048 );
			else if ( v == 8 ) replaceItem( 4000081 );
			else if ( v == 9 ) replaceItem( 4000061 );
			else if ( v == 10 ) replaceItem( 4000070 );
			else if ( v == 11 ) replaceItem( 4000071 );
			else if ( v == 12 ) replaceItem( 4000072 );
			else if ( v == 13 ) replaceItem( 4000051 );
			else if ( v == 14 ) replaceItem( 4000055 );
			else if ( v == 15 ) replaceItem( 4000069 );
			else if ( v == 16 ) replaceItem( 4000052 );
			else if ( v == 17 ) replaceItem( 4000050 );
			else if ( v == 18 ) replaceItem( 4000057 );
			else if ( v == 19 ) replaceItem( 4000049 );
			else if ( v == 20 ) replaceItem( 4000056 );
			else if ( v == 21 ) replaceItem( 4000079 );
			else if ( v == 22 ) replaceItem( 4000053 );
			else if ( v == 23 ) replaceItem( 4000054 );
			else if ( v == 24 ) replaceItem( 4000080 );
		}
	}
