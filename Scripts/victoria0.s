module "standard.s";

// Moving to a different town
function goTel( integer mapNum, integer fee ) {
	nRet = self.askYesNo( "Acho que voc� n�o precisa estar aqui. Voc� realmente quer ir para #b#m?" + mapNum + "##k? Bem, ir� custar #b" + fee + "mesos#k. O que voc� acha?" );
	if ( nRet == 1 ) {
		fRet = target.incMoney( -fee, 1 );
		if ( fRet == 0 ) self.say( "Voc� n�o tem dinheiro suficiente. Com suas habilidades, voc� deveria ter mais do que isso!" );
		else registerTransferField( mapNum, "" );
	}
	else self.say( "Tem muita coisa para ver nesta cidade tamb�m. Me diga se voc� quiser ir para mais algum lugar." );
}

// 1. The NPC at Lith harbor that warps the characters to other towns with a service fee.
script "rithTeleport" {
	self.say( "Voc� quer seguir para alguma outra cidade? Posso te levar com pouco dinheiro na jogada. � um pouquinho caro, mas eu dou um desconto especial de 90% para aprendizes." );
	v1 = self.askMenu( "� compreens�vel que voc� possa estar #Gconfuso:confusa# sobre este lugar se esta for sua primeira vez por aqui. Se tiver perguntas sobre este lugar, manda ver. \r\n#b#L0# Que tipos de cidades existem aqui na Ilha Victoria? #l\r\n#L1#Me leva para algum outro lugar.#l" );
	if ( v1 == 0 ) {
		v2 = self.askMenu( "Existem 6 grandes cidades aqui na Ilha Victoria. Qual delas voc� quer conhecer melhor? \r\n#b#L0##m104000000##l\r\n#L1##m102000000##l\r\n#L2##m101000000##l\r\n#L3##m100000000##l\r\n#L4##m103000000##l\r\n#L5##m105040300##l" );
		if ( v2 == 0 ) {
			self.say( "A cidade onde voc� est� � Porto Lito! Certo, eu te contarei mais sobre #b#m104000000##k. � o lugar onde voc� desembarcou na Ilha Victoria viajando no navio. � #m104000000#. Muitos aprendizes que acabam de chegar da Ilha Maple come�am aqui sua jornada." );
			self.say( "� uma cidade calma, com extensa faixa de �gua na parte de tr�s, gra�as ao fato de o porto ficar situado na extremidade oeste da ilha. Muitas das pessoas aqui s�o ou foram pescadoras. Elas podem parecer amea�adoras, mas, se voc� puxar conversa, elas ser�o amig�veis com voc�." ); 
			self.say( "Ao redor da cidade tem uma linda pradaria. Na sua maior parte, os monstros aqui s�o pequenos e gentis, perfeitos para aprendizes. Se voc� ainda n�o escolheu sua carreira, este � um bom lugar para dar um impulso ao seu n�vel.");
		}
		else if ( v2 == 1 ) {
			self.say( "Certo, eu te contarei mais sobre #b#m102000000##k. � uma cidade de guerreiros localizada na parte mais ao norte da Ilha Victoria, cercada por montanhas rochosas. Com um ambiente pouco amistoso, somente os fortes sobrevivem l�." );
			self.say( "Por perto da regi�o montanhosa, voc� encontrar� uma �rvore muito fina, um javali selvagem andando por l� e macacos que vivem por toda a ilha. Existe tamb�m um vale profundo e, se voc� penetrar nele, encontrar� um drag�o imenso com tanto poder que emparelha seu tamanho. Melhor tomar muito cuidado se for l�, ou n�o ir de uma vez." );
			self.say( "Se voc� quer ser #bGuerreiro#k, encontre #r#p1022000##k, o chefe de #m102000000#. Se voc� for n�vel 10 ou maior e tiver tamb�m um bom n�vel de FOR, ele pode fazer de voc� um guerreiro. Se n�o, melhor continuar treinando at� alcan�ar o n�vel." );
		}
		else if ( v2 == 2 ) {
			self.say( "Certo, eu te contarei mais sobre #b#m101000000##k. � uma cidade de bruxos, localizada na parte leste remota da Ilha Victoria. � coberta de �rvores altas e m�sticas. L� voc� tamb�m encontrar� algumas fadas. Elas n�o gostam de humanos em geral, ent�o ser� melhor ficar longe delas e permanecer #Gquieto:quieta#." );
			self.say( "Pr�ximo � floresta voc� encontrar� gosmas verdes, cogumelos andantes, macacos e macacos zumbis, todos moram l�. Entre mais profundamente na floresta e voc� encontrar� bruxas com vassouras voadoras passando pelo c�u. Um alerta para voc�: a menos que voc� seja realmente forte, recomendo que voc� n�o chegue perto delas." );
			self.say( "Se voc� quer ser #bBruxo#k, procure por #r#p1032001##k, o principal feiticeiro de #m101000000#. Ele pode fazer de voc� um feiticeiro se voc� estiver no n�vel 8 ou acima, e tiver uma quantia decente de INT. Se n�o for o caso, voc� precisa se esfor�ar mais e treinar para chegar l�." );
		}
		else if ( v2 == 3 ) {
			self.say( "Certo, eu te contarei mais sobre #b#m100000000##k. � uma cidade de arqueiros, localizada na parte bem ao sul da ilha, em uma regi�o plana, no meio de uma densa floresta e pradarias. O clima � perfeito e tudo � abundante em torno daquela cidade, �tima para viver. V� conferir!" );
			self.say( "Pela pradaria voc� encontrar� monstros fracos como lesmas, cogumelos e porcos. Apesar de que ouvi dizer que, na parte mais densa do Parque dos Porcos, que em algum lugar se conecta � cidade, voc� de vez em quando encontrar� cogumelos enormes e poderosos chamados de Cogum�e." );
			self.say( "Se voc� quer ser #bArqueiro#k, precisa ir ver #r#p1012100##k em #m100000000#. Com o n�vel 10 ou maior e uma quantia decente de DES, ela deve fazer voc� se tornar um arqueiro. Se n�o, v� treinar, fique mais forte, ent�o tente de novo." );
		}
		else if ( v2 == 4 ) {
			self.say( "Certo, eu te contarei mais sobre #b#m103000000##k. � uma cidade de gatunos, localizada na parte noroeste da Ilha Victoria. H� constru��es l� que t�m mesmo um tipo de sensa��o estranha ao seu redor. A maior parte delas � coberta de nuvens negras, mas, se voc� puder subir para um lugar bem alto, poder� ver um lindo p�r-do-sol l�." );
			self.say( "De #m103000000#, voc� pode ir para v�rias masmorras. Voc� pode ir para um p�ntano cheio de crocodilos e serpentes, ou atingir os t�neis subterr�neos, cheios de fantasmas e morcegos. Na parte mais profunda do subterr�neo, voc� encontrar� Lace, que � quase t�o grande e perigoso quanto um drag�o." );
			self.say( "Se voc� quer ser #bGatuno#k, procure #r#p1052001##k, o n�cleo da escurid�o de #m103000000#. Ele deve fazer de voc� um bom gatuno se voc� estiver no n�vel 10 ou acima, com uma boa quantia de DES. Caso n�o, v� ca�ar e treine para chegar l�." );
		}
		else if ( v2 == 5 ) {
			self.say( "Certo, eu te contarei mais sobre #b#m105040300##k. � uma cidade de florestas, localizada no lado sudeste da Ilha Victoria. Fica quase entre #m100000000# e a masmorra de T�nel de Formigas. Tem um hotel l�, ent�o voc� pode descansar depois de um dia cansativo na masmorra... em geral � uma cidade calma." );
			self.say( "Em frente ao hotel tem um velho monge budista que se chama #r#p1061000##k. Ningu�m sabe nada sobre aquele monge. Aparentemente ele coleta materiais dos viajantes e cria alguma coisa, mas n�o conhe�o muito bem os detalhes. Se voc� tiver neg�cios naquela �rea, faz favor de ver isso para mim." );
			self.say( "De #m105040300#, indo para leste, voc� encontrar� o t�nel de formigas conectado � parte mais profunda da Ilha Victoria. L� tem um mont�o de monstros poderosos e repugnantes. Se voc� for para l� pensando que ser� um passeio no parque, acabar� virando um defunto. Antes de ir, voc� tem que se preparar muito bem para um passeio complicado." );
			self.say( "Eu ouvi dizer que... ao que tudo indica, em #m105040300# existe uma entrada secreta que leva para um lugar desconhecido. Parece que, se voc� for fundo l� para dentro, encontrar� uma pilha de pedras pretas que se movem por l�, de verdade. Quero ver isso com meus pr�prios olhos uma hora a�..." );
		}
	}
	else if ( v1 == 1 ) {
		cJob = target.nJob;

		if ( cJob == 0 ) v1 = self.askMenu( "Tem um desconto especial de 90% para todos os aprendizes. Certo, para onde voc� gostaria de ir? \r\n#b#L0##m102000000# (120 mesos) \r\n#b#L1##m101000000# (120 mesos) \r\n#b#L2##m100000000# (80 mesos) \r\n#b#L3##m103000000# (100 mesos)#l" );
		else v1 = self.askMenu( "Oh, voc� n�o � um aprendiz, �h? Ent�o, lamento, mas devo cobrar de voc� o pre�o normal. Para onde gostaria de ir? \r\n#b#L0##m102000000# (1200 mesos) \r\n#b#L1##m101000000# (1200 mesos) \r\n#b#L2##m100000000# (800 mesos) \r\n#b#L3##m103000000# (1000 mesos)#l" );

		if ( v1 == 0 ) {
			if ( cJob == 0 ) goTel( 102000000, 120 );
			else goTel( 102000000, 1200 );
		}
		else if ( v1 == 1 ) {
			if ( cJob == 0 ) goTel( 101000000, 120 );
			else goTel( 101000000, 1200 );
		}
		else if ( v1 == 2 ) {
			if ( cJob == 0 ) goTel( 100000000, 80 );
			else goTel( 100000000, 800 );
		}
		else if ( v1 == 3 ) {
			if ( cJob == 0 ) goTel( 103000000, 100 );
			else goTel( 103000000, 1000 );
		}
	}
}

// 10. Jane and the wild boar
script "jane" {
	qr = target.questRecord;
	val = qr.getState( 2013 );

	inventory = target.inventory;
	
	if ( val == 2 ) {
		self.say( "� voc�... gra�as a voc� eu consegui fazer muita coisa. Atualmente estou fazendo um pacote de itens. Se precisar de alguma coisa, � s� me avisar." );
		v1 = self.askMenu( "Qual item voc� gostaria de comprar? \r\n#b#L0##t2000002# (pre�o: 310 mesos) #l\r\n#L1##t2022003# (pre�o: 1060 mesos) #l\r\n#L2##t2022000# (pre�o: 1600 mesos) #l\r\n#L3##t2001000# (pre�o: 3120 mesos)#l" );
		if ( v1 == 0 ) {
			nRetNum = self.askNumber( "Voc� quer #b#t2000002##k? #t2000002# permite restaurar 300 de HP. Quantos voc� quer comprar?", 0, 0, 100 );
			nPrice = 310 * nRetNum;
			nRetBuy = self.askYesNo( "Voc� vai comprar #r" + nRetNum + "#k #b#t2000002#(s) #k? #b#t2000002# custa 310 a unidade, ent�o o total vai ser #k" + nPrice + "#k mesos." );
			if ( nRetBuy == 0 ) self.say( "Eu ainda tenho alguns dos materiais que voc� j� comprou de mim. Est� tudo ali, pode escolher � vontade." );
			else {
				ret = inventory.exchange( -nPrice, 2000002, nRetNum );
				if ( ret == 0 ) self.say( "Por acaso est� faltando dinheiro?  Por favor, confira se voc� tem um slot vazio em seu invent�rio de etc. e se voc� tem pelo menos#r" + nPrice + "#k mesos." );
				else self.say( "Obrigado por vir! Aqui sempre podemos fazer neg�cios, ent�o, se precisar de algo, volte, t� bom?" );
			}
		}
		else if ( v1 == 1 ) {
			nRetNum = self.askNumber( "Voc� quer #b#t2022003##k? #t2022003# permite restaurar 1000 de HP. Quantos voc� quer comprar?", 0, 0, 100 );
			nPrice = 1060 * nRetNum;
			nRetBuy = self.askYesNo( "Voc� vai comprar #r" + nRetNum + "#k #b#t2022003#(s) #k? #b#t2022003# custa 1060 mesos a unidade, ent�o o total vai ser #k" + nPrice + "#k mesos." );
			if ( nRetBuy == 0 ) self.say( "Eu ainda tenho alguns dos materiais que voc� j� comprou de mim. Est� tudo ali, pode escolher � vontade." );
			else {
				ret = inventory.exchange( -nPrice, 2022003, nRetNum );
				if ( ret == 0 ) self.say( "Por acaso est� faltando dinheiro? Por favor, confira se voc� tem um slot vazio em seu invent�rio de etc. e se voc� tem pelo menos#r" + nPrice + "#k mesos." );
				else self.say( "Obrigado por vir! Aqui sempre podemos fazer neg�cios, ent�o, se precisar de algo, volte, t� bom?" );
			}
		}
		else if ( v1 == 2 ) {
			nRetNum = self.askNumber( "Voc� quer #b#t2022000##k? #t2022000# permite restaurar 800 de HP. Quantos voc� quer comprar?", 0, 0, 100 );
			nPrice = 1600 * nRetNum;
			nRetBuy = self.askYesNo( "Voc� vai comprar #r" + nRetNum + "#k #b#t2022000#(s) #k? #b#t2022000# custa 1600 mesos a unidade, ent�o o total vai ser #k" + nPrice + "#k mesos." );
			if ( nRetBuy == 0 ) self.say( "Eu ainda tenho alguns dos materiais que voc� j� comprou de mim. Est� tudo ali, pode escolher � vontade." );
			else {
				ret = inventory.exchange( -nPrice, 2022000, nRetNum );
				if ( ret == 0 ) self.say( "Por acaso est� faltando dinheiro?  Por favor, confira se voc� tem um slot vazio em seu invent�rio de etc. e se voc� tem pelo menos#r" + nPrice + "#k mesos." );
				else self.say( "Obrigado por vir! Aqui sempre podemos fazer neg�cios, ent�o, se precisar de algo, volte, t� bom?" );
			}
		}
		else if ( v1 == 3 ) {
			nRetNum = self.askNumber( "Voc� quer #b#t2001000##k? #t2001000# permite restaurar 1000 de HP e de MP. Quantos voc� deseja comprar?", 0, 0, 100 );
			nPrice = 3120 * nRetNum;
			nRetBuy = self.askYesNo( "Voc� vai comprar #r" + nRetNum + "#k #b#t2001000#(s) #k? #b#t2001000# custa 3120 a unidade, ent�o o total vai ser #k" + nPrice + "#k mesos." );
			if ( nRetBuy == 0 ) self.say( "Eu ainda tenho alguns dos materiais que voc� j� comprou de mim. Est� tudo ali, pode escolher � vontade." );
			else {
				ret = inventory.exchange( -nPrice, 2001000, nRetNum );
				if ( ret == 0 ) self.say( "Por acaso est� faltando dinheiro?  Por favor, confira se voc� tem um slot vazio em seu invent�rio de etc. e se voc� tem pelo menos#r" + nPrice + "#k mesos." );
				else self.say( "Obrigado por vir! Aqui sempre podemos fazer neg�cios, ent�o, se precisar de algo, volte, t� bom?" );
			}
		}
	}
	else if ( target.nLevel >= 40 and target.nJob != 0 ) self.say( "Voc� s� poder� comprar a po��o depois de tomar conta dos meus pedidos." );
	else if ( target.nLevel >= 25 and target.nJob != 0 ) self.say( "Voc� n�o parece forte o bastante para poder comprar a minha po��o..." );
	else self.say( "Meu sonho � viajar pra todo lugar, assim como voc�. Mas meu pai n�o me deixa ir, porque ele acha que � muito perigoso. Ele deveria deixar, se bem que, se eu mostrar para ele, de alguma maneira, que eu n�o sou a garota fraca que ele pensa que eu sou..." );
} 

// Camila's Glass Marble Script Portal
script "q2073" {
	qr = target.questRecord;
	val = qr.getState( 2073 );

	if ( val == 1 ) {
		quest = FieldSet( "Yoota" );
		num = quest.getUserCount;
		if ( num <= 0 ) {
			res = quest.enter( target.nCharacterID, 0 );
			if ( res != 0 ) target.message( "Parece que algu�m j� andou visitando a Fazenda de Yoota." );
		} else target.message( "Parece que algu�m j� andou visitando a Fazenda de Yoota." );
	}
	else target.message( "H� uma porta que me levar� para algum lugar, mas n�o consigo entrar l�." );
}
