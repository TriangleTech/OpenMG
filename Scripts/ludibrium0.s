module "standard.s";

// 1st eos rock : 2040024, 100th floor
script "ludi014" {
	inven = target.inventory;
	mStone = 0;
	mMap = 0;

	if ( inven.itemCount( 4001020 ) >= 1 ) {
		ret1 = self.askYesNo( "Voc� pode usar o #b#t4001020##k para ativar o #b#p2040024##k. Voc� vai se teletransportar para o 71� andar do #b#p2040025##k ?" );
		if ( ret1 != 0 ) {
			ret2 = inven.exchange( 0, 4001020, -1 );
			if ( ret2 == 0 ) self.say( "Voc� n�o pode ativar o #b#p2040024##k sem #b#t4001020##k." );
			else registerTransferField( 221022900, "go00" );
		}
	}
	else self.say( "H� uma pedra que faz que voc� se teletransporte para #b#p2040025##k, mas ela n�o pode ser ativada sem o pergaminho." );
}

// 2nd eos rock : 2040025, 71st floor
script "ludi015" {
	inven = target.inventory;
	mStone = 0;
	mMap = 0;
	mTower = 0;

	if ( inven.itemCount( 4001020 ) >= 1 ) {
		v1 = self.askMenu( "Voc� pode usar o #b#t4001020##k para ativar o #b#p2040025##k. Qual dessas pedras voc� gostaria de usar para se teletransportar?\r\n#b#L0# #p2040024#(100� andar)#l\r\n#b#L1# #p2040026#(41� andar)#l" );
		if ( v1 == 0 ) {
			mStone = 2040024;
			mMap = 221024400;
			mTower = 100;
		}
		else if ( v1 == 1 ) {
			mStone = 2040026;
			mMap = 221021700;
			mTower = 41;
		}

		if ( mMap == 221024400 or mMap == 221021700 ) {
			ret1 = self.askYesNo( "Voc� pode usar o #b#t4001020##k para ativar o #b#p2040025##k. Voc� ir� se teletransportar para #b#p" + mStone + "##k no" + mTower + "� andar?" );
			if ( ret1 != 0 ) {
				ret2 = inven.exchange( 0, 4001020, -1 );
				if ( ret2 == 0 ) self.say( "Voc� n�o pode ativar o #b#p2040025##k sem #b#t4001020##k." );
				else registerTransferField( mMap, "go00" );
			}
		}
		else self.say( "N�o � poss�vel ativar a Pedra de Eos por raz�es desconhecidas." );
	}
	else self.say( "H� uma pedra que faz que voc� se teletransporte para #b#p2040024# ou #p2040026##k, mas ela n�o pode ser ativada sem o pergaminho." );
}

// 3rd eos rock : 2040026, 41st floor
script "ludi016" {
	inven = target.inventory;
	mStone = 0;
	mMap = 0;
	mTower = 0;

	if ( inven.itemCount( 4001020 ) >= 1 ) {
		v1 = self.askMenu( "Voc� pode usar o #b#t4001020##k para ativar o #b#p2040026##k. Qual dessas pedras voc� gostaria de teletransportar?\r\n#b#L0# #p2040025#(71� andar)#l\r\n#b#L1# #p2040027#(1� andar)#l" );
		if ( v1 == 0 ) {
			mStone = 2040025;
			mMap = 221022900;
			mTower = 71;
		}
		else if ( v1 == 1 ) {
			mStone = 2040027;
			mMap = 221020000;
			mTower = 1;
		}

		if ( mMap == 221022900 or mMap == 221020000 ) {
			ret1 = self.askYesNo( "Voc� pode usar o #b#t4001020##k para ativar o #b#p2040026##k. Voc� ir� se teletransportar para #b#p" + mStone + "##k no" + mTower + "� andar?" );
			if ( ret1 != 0 ) {
				ret2 = inven.exchange( 0, 4001020, -1 );
				if ( ret2 == 0 ) self.say( "Voc� n�o pode ativar o #b#p2040026##k sem #b#t4001020##k." );
				else registerTransferField( mMap, "go00" );
			}
		}
		else self.say( "N�o � poss�vel ativar a Pedra de Eos por raz�es desconhecidas." );
	}
	else self.say( "H� uma pedra que faz que voc� se teletransporte para #b#p2040025# ou #p2040027##k, mas ela n�o pode ser ativada sem o pergaminho." );
}

// the 4th eos rock : 2040027, 1st floor
script "ludi017" {
	inven = target.inventory;
	mStone = 0;
	mMap = 0;

	if ( inven.itemCount( 4001020 ) >= 1 ) {
		ret1 = self.askYesNo( "Voc� pode usar o #b#t4001020##k para ativar o #b#p2040027##k. Voc� vai para o #b#p2040026##k no 41� andar?" );
		if ( ret1 != 0 ) {
			ret2 = inven.exchange( 0, 4001020, -1 );
			if ( ret2 == 0 ) self.say( "Voc� n�o pode ativar o #b#p2040027##k sem #b#t4001020##k." );
			else registerTransferField( 221021700, "go00" );
		}
	}
	else self.say( "H� uma pedra que faz que voc� se teletransporte para #b#p2040026##k, mas ela n�o pode ser ativada sem o pergaminho." );
}

// chang the assistant : 2040003
script "ludi020" {
	field = self.field;
	qr = target.questRecord;
	val = qr.getState( 3239 );

	if ( val == 1 ) {
		if ( field.id == 220020000 ) {
			inven = target.inventory;
			self.say( "Certo, ent�o. Dentro desse quarto, voc� ver� muitos barris de pl�stico jogados pelos cantos. Acerte os barr�s para faz�-los cair e veja se consegue achar o #b#t4031092##k perdido. Voc� deve coletar #b10 #t4031092#s#k e depois voltar para falar comigo. H� um limite de tempo para fazer isso! Ent�o, v� logo!" );
			hItem = inven.itemCount( 4031092 );
			if ( hItem > 0 ) inven.exchange( 0, 4031092, -hItem );
			setParty = FieldSet( "Ludi020" );
			res = setParty.enter( target.nCharacterID, 0 );
			if ( res != 0 ) self.say( "Desculpe, mas parece que outra pessoa est� l� dentro olhando os barris. S� � permitido uma pessoa por vez aqui, por isso, voc� ter� que esperar pela sua vez." );			
		}
		else if ( field.id == 922000000 ) {
			inven = target.inventory;
			nItem = inven.itemCount( 4031092 );			
			if ( nItem == 0 ) {
				v1 = self.askMenu( "Dentro desse quarto, voc� ver� muitos barris de pl�stico jogados pelos cantos. Acerte os barris para faz�-los cair e veja se consegue achar o #b#t4031092##k perdido. Voc� deve coletar #b10 #t4031092##k antes do tempo limite acabar e depois voltar para falar comigo. O tempo est� passando enquanto conversamos, ent�o, por favor, se apresse!\r\n#b#L0# Eu quero sair daqui.#l" );
				if ( v1 == 0 ) {
					nRet = self.askYesNo( "Tem certeza de que deseja desistir ? Bem, eu posso deixar voc� sair, mas voc� ter� que come�ar bem do in�cio na pr�xima vez em que fizer uma visita aqui. Voc� ainda quer sair desse lugar?" );
					if ( nRet == 0 ) self.say( "Esse � o tipo de atitude que eu tenho procurado! Se voc� come�ou uma coisa, tem que aprender a termin�-la! Agora, por favor, procure nos barris de pl�stico e encontre #b10 #t4031092##k para mim." );
					else registerTransferField( 922000009, "" );
				}
			}
			else if ( nItem >= 10 ) {
				self.say( "Bom trabalho! Voc� conseguiu coletar #b10 #t4031092##k. Bem, j� que voc� nos fez esse grande favor, eu vou te recompensar com algo bem legal. Antes de fazer isso, por favor, veja se o seu invent�rio de uso possui algum espa�o dispon�vel." );
				if ( inven.slotCount( 2 ) > inven.holdCount( 2 ) ) {
					rnum = random( 1, 4 );
					nNewItemID = 0;
					if ( rnum == 1 ) nNewItemID = 2040704;
					else if ( rnum == 2 ) nNewItemID = 2040705;
					else if ( rnum == 3 ) nNewItemID = 2040707;
					else if ( rnum == 3 ) nNewItemID = 2040708;
					nNeed = inven.itemCount( 4031092 );

					ret = inven.exchange( 0, 4031092, -nNeed, nNewItemID, 1 );
					if ( ret == 0 ) self.say( "Voc� tem certeza de que tem #b10 #t4031092#s#k? Se tiver certeza, veja se o seu invent�rio de uso possui algum espa�o dispon�vel." );
					else {
						target.incEXP( 2700, 0 );
						qr.setComplete( 3239 );
						self.say( "O que voc� acha? Voc� gosta do #b#t" + nNewItemID + "##k que eu te dei? Eu nem sei como te agradecer por me ajudar. Obrigado pelo seu esfor�o, a F�brica de Brinquedos deve estar funcionando muito bem. Vou te mandar para fora agora. Se cuida!" );
						registerTransferField( 220020000, "q000" );
					}
				}
				else self.say( "Humm... o seu invent�rio de uso parece estar cheio no momento. Assim, voc� n�o poder� receber minha recompensa. Por favor, libere espa�o no seu invent�rio e venha falar comigo novamente." );
			}
			else {
				v1 = self.askMenu( "Eu acho que voc� n�o coletou 10 #b#t4031092#s#k perdidos. Quebre os barris de pl�stico que voc� v� nesta sala e veja se algum deles cont�m o #b#t4031092##k perdido. Se voc� conseguir pegar os 10 #b#t4031092#s#k antes do limite de tempo terminar, ent�o venha traz�-los para mim. Se voc� quiser sair deste lugar a qualquer momento, venha falar comigo.\r\n#b#L0# Eu quero sair daqui.#l" );
				if ( v1 == 0 ) {
					nRet = self.askYesNo( "Tem certeza de que deseja desistir ? Bem, eu posso deixar voc� sair, mas voc� ter� que come�ar bem do in�cio na pr�xima vez em que fizer uma visita aqui. Voc� ainda quer sair desse lugar?" );
					if ( nRet == 0 ) self.say( "Esse � o tipo de atitude que eu tenho procurado! Se voc� come�ou uma coisa, tem que aprender a termin�-la! Agora, por favor, procure nos barris de pl�stico e encontre #b10 #t4031092#s#k para mim." );
					else registerTransferField( 922000009, "" );
				}
			}						
		}
	}
	else if ( val == 2 ) self.say( "Gra�as a voc�, a F�brica de Brinquedos est� funcionando perfeitamente novamente. Estou t�o feliz que voc� veio nos ajudar. N�s temos cuidado bem de nossas pe�as extras, por isso, n�o se preocupe. Bem, � isso! Eu preciso voltar ao trabalho!" );
	else self.say( "Ultimamente, as pe�as mec�nicas est�o sumindo da F�brica de Brinquedos, e isso me preocupa muito. Eu quero pedir ajuda, mas voc� n�o parece forte o suficiente para nos ajudar. A quem eu deveria pedir para nos ajudar?" );
}

// kicking out of the toy factory quest
script "ludi021" {
	qr = target.questRecord;

	inven = target.inventory;
	qItem = inven.itemCount( 4031092 );
	if ( qItem > 0 ) inven.exchange( 0, 4031092, -qItem );
	registerTransferField( 220020000, "q000" );
}

// olson the toy soldier : 2040002
script "ludi023" {
	qr = target.questRecord;
	val = qr.getState( 3230 );
	inven = target.inventory;

	if ( val == 1 ) {
		nItem = inven.itemCount( 4031145 );		
		nRet1 = self.askYesNo( "Humm... eu ouvi falar muito de voc� atrav�s de #b#p2040001##k. Voc� conseguiu um bocado de #b#t4031093##k para que ele pudesse fugir do t�dio no trabalho. Bem... � isso a�. H� um monstro muito, muito perigoso l� dentro. Eu quero pedir que voc� nos ajude encontrando o monstro. Voc� gostaria de me ajudar?" );
		if ( nRet1 == 0 ) self.say( "Entendo. � totalmente compreens�vel, considerando o fato de que voc� estar� enfrentando um monstro muito perigoso. Se algum dia voc� mudar de id�ia, venha e volte a falar comigo. Eu tenho certeza de que sua ajuda seria muito �til." );
		else {
			self.say( "Muito obrigado. Na verdade, #b#p2040001##k pediu que voc� conseguisse #b#t4031093#s#k como uma forma de testar suas habilidades e ver se voc� consegue lidar com isso. Ent�o, n�o pense que isso � um pedido vindo do nada. Eu acho que algu�m como voc� pode enfrentar os problemas." );
			nRet2 = self.askYesNo( "H� um tempo, um monstro de outra dimens�o veio aqui gra�as a uma fenda interdimensional, e roubou o p�ndulo do rel�gio. Ele se escondeu naquela sala e se disfar�ou de casa de bonecas. Pra mim parece tudo igual, ent�o n�o tem como descobri-lo. Voc� nos ajudaria a encontr�-lo?" );
			if ( nRet2 == 0 ) self.say( "Entendo. Venha falar comigo quando estiver #Gpronto:pronta# para aceitar essa tarefa. Eu te aconselho a n�o demorar muito, pois o monstro pode se disfar�ar de outra coisa totalmente diferente. N�s temos que agir como se n�o soub�ssemos de nada." );
			else {
				self.say( "Certo! Eu vou te levar para uma sala, onde voc� ir� encontrar v�rias casas de bonecas espalhadas. Uma delas ir� parecer um pouco diferente das outras. O seu trabalho � localizar e quebrar sua porta. Se conseguir encontr�-la, voc� encontrar� o #b#t4031145##k. Se voc� quebrar uma das casas de bonecas verdadeiras, ser� #Gmandado:mandada# de volta para c�, ent�o preste bastante aten��o." );
				self.say( "Voc� tamb�m encontrar� monstros l�, e eles ficaram poderosos demais gra�as ao monstro da outra dimens�o, t�o poderosos que voc� n�o conseguir� elimin�-los. Por favor, encontre o #b#t4031145##k antes de o tempo acabar e avise #b#p2040028##k, que deve estar l� dentro. Vamos come�ar logo!" );
				if ( nItem > 0 ) inven.exchange( 0, 4031145, -nItem );
				setParty = FieldSet( "Ludi023" );
				res = setParty.enter( target.nCharacterID, 0 );
				if ( res != 0 ) self.say( "Outra pessoa deve estar l� dentro procurando pela casa de bonecas. Infelizmente, eu s� posso deixar entrar uma pessoa por vez, ent�o, por favor, espere sua vez." );
			}
		}
	}
	else if ( val == 2 ) self.say( "Gra�as a" + target.sCharacterName + ", nos recuperamos o #b#t4031145##k e destru�mos o monstro da outra dimens�o. Ainda bem que n�o achamos um assim desde ent�o. Eu nem sei como te agradecer por nos ajudar. Espero que goste de sua estadia aqui em Ludibrium!" );
	else self.say( "N�s somos os soldados de brinquedo que protegemos essa sala para impedir que qualquer outra pessoa entre. Eu n�o posso te dizer por que. Agora, se voc� me desculpar, eu tenho trabalho a fazer." );
}

// mark the toy soldier : 2040028
script "ludi024" {
	qr = target.questRecord;
	val = qr.getState( 3230 );
	inven = target.inventory;

	if ( val == 1 ) {
		if ( inven.itemCount( 4031145 ) >= 1 ) {
			self.say( "Ah! Uau! Voc� encontrou a casa de bonecas diferente e achou o #b#t4031145##k! Isso foi um trabalho bem-feito!! Gra�as a isso a Torre do Rel�gio de Ludibrium poder� funcionar novamente! Obrigado por sua ajuda e aceite uma pequena recompensa pelo seu trabalho. Mas, antes de receb�-la, por favor, veja se o seu invent�rio de uso n�o est� cheio." );
			ret = inven.exchange( 0, 4031145, -1, 2000010, 100 );
			if ( ret == 0 ) self.say( "Voc� tem certeza de que tem 1 #b#t4031145##k? Se tiver certeza, verifique o seu invent�rio de uso, ele pode estar cheio!!" );
			else {
				target.incEXP( 2400, 0 );
				qr.setComplete( 3230 );
				self.say( "O que voc� acha? Voc� gosta dos #b100 #t2000010#s#k que eu te dei? Muito obrigado por ter nos ajudado. A Torre do Rel�gio vai funcionar novamente gra�as ao seu trabalho her�ico, e parece que os monstros da outra dimens�o sumiram tamb�m. Vou te deixar sair agora. Te vejo por a�!" );
				registerTransferField( 221024400, "q000" );
			}
		}
		else {
			v1 = self.askMenu( "Ol�! Eu sou #b#p2040028##k, sou eu o encarregado de proteger esta sala. L� dentro, voc� vai encontrar um monte de casas de bonecas e poder� encontrar a que parece um pouco diferente das outras. O seu trabalho � encontr�-la, quebrar sua porta e achar o #b#t4031145##k, que � uma parte integral da Torre do Rel�gio de Ludibrium. Voc� ter� um limite de tempo para fazer isto e, se quebrar a casa de bonecas errada, ser� obrigado a voltar para c�, ent�o, por favor, tenha cuidado.\r\n#b#L0# Eu quero sair daqui.#l" );
			if ( v1 == 0 ) {
				nRet = self.askYesNo( "Tem certeza de que deseja desistir agora? Tudo bem, ent�o... mas lembre-se de que, da pr�xima vez que visitar este local, as casas de boneca ir�o trocar de lugar e voc� ter� que olhar cada uma de novo com muito cuidado. O que voc� acha? Voc� ainda quer sair desse lugar?" );
				if ( nRet == 0 ) self.say( "Eu sabia que voc� ficaria! � importante que voc� termine o que come�ou! Agora, por favor, v� encontrar a casa de boneca diferente das outras, quebre-a e traga o #b#t4031145##k para mim!" );
				else registerTransferField( 221024400, "q000" );
			}
		}
	}	
	else {
		self.say( "Mas o que � isso... n�s temos proibido que as pessoas entrem nessa sala porque um monstro de outra dimens�o est� se escondendo l�. Eu n�o sei como voc� chegou aqui, mas terei que pedir que saia imediatamente, pois dentro desta sala o perigo � enorme." );
		registerTransferField( 221024400, "" );
	}
}

// wisp : 2040030
script "ludi026" {
	v1 = self.askMenu( "Ol�, voc� a�! Eu sou #b#p1032102##k, o disc�pulo principal da Ilha Victoria. #p1032102# me chamou para verificar se os bichinhos est�o sendo bem tratados aqui em Ludibrium. O que posso fazer por voc�?\r\n#b#L0# Meu bichinho voltou a ser um boneco. Por favor, me ajude a faz�-lo se mover de novo!#l\r\n#L1#Me fale mais sobre Bichinhos.#l\r\n#L2#Como eu cuido dos Bichinhos?#l\r\n#L3#Os Bichinhos tamb�m morrem?#l\r\n#L4#Quais s�o os comandos dos Gatinhos Marrom e Preto?#l\r\n#L5#Quais s�o os comandos do Cachorrinho Marrom?#l\r\n#L6#Quais s�o os comandos dos Coelhinhos Rosa e Branco?#l\r\n#L7#Quais s�o os comandos do Mini Kargo?#l\r\n#L8#Quais s�o os comandos de Rudolph e Dasher?#l\r\n#L9#Quais s�o os comandos do Porquinho Preto?#l\r\n#L10#Quais s�o os comandos do Panda?#l\r\n#L11#Quais s�o os comandos do Husky?#l\r\n#L12#Quais s�o os comandos do Dino Boy e Dino Girl?#l\r\n#L13#Quais s�o os comandos do Macaco?#l\r\n#L14#Quais s�o os comandos do Peru?#l\r\n#L15#Quais s�o os comandos do Tigre Branco?#l\r\n#L16#Quais s�o os comandos do Ping�im?#l\r\n#L17#Quais s�o os comandos do Porquinho Dourado?#l\r\n#L18#Quais s�o os comandos do Rob�?#l\r\n#L19#Quais s�o os comandos do Mini Yeti?#l\r\n#L20#Quais s�o os comandos do Balrog Jr.?#l\r\n#L21#Quais s�o os comandos do Beb� Drag�o?#l\r\n#L22#Quais s�os os comandos dos Drag�es Verde/Vermelho/Azul?#l\r\n#L23#Quais s�o os comandos do Drag�o Negro?#l\r\n#L24#Quais s�o os comandos do Anjo da Morte Jr.?#l\r\n#L25#Quais s�o os comandos do porco-espinho?#l\r\n#L26#Quais s�o os comandos do Boneco de Neve?#l#k" );
	if ( v1 == 0 ) {
		qr = target.questRecord;
		val = qr.getState( 3240 );
		inven = target.inventory;

		isPet = self.askPet( "" );

		if ( isPet != "" ) {
			if ( val == 0 or val == 2 ) {
				nRet1 = self.askYesNo( "Parece que voc� j� conheceu #p1012005#. #p1012005# � algu�m que estudava a m�gia da vida com meu mestre, #p1032102#. Eu ouvi dizer que ele usou uma magia de vida incompleta em um boneco para criar um animal vivo... o boneco que voc� tem � o mesmo boneco que #p1012005# criou, chamado de #bBichinho#k?" );
				if ( nRet1 == 0 ) self.say( "Mas com certeza parece como se fosse um trabalho de #p1012005#. Ah, bem! N�o importa. Eu vi #p1012005# nos �ltimos anos e tenho certeza de que ele n�o pode criar magia da vida em bonecos. Bem, � isso..." );
				else {
					self.say( "Entendo. Esse boneco costumava ser um animal vivo... mas o mesmo item que #p1012005# usou para dar vida ao bichinho, #b#t5180000##k, se esgotou e o bichinho voltou a ser apenas um boneco... ele n�o se move mais porque agora � um boneco de novo... humm... a vida n�o � algo que voc� possa criar com m�gica...?" );
					self.say( "Voc� quer fazer o boneco voltar a ser o que era? Um ser com vida? Voc� quer que o seu bichinho volte a te acompanhar, andando por a�, te fazendo companhia, certo? Claro! Isso � totalmente poss�vel! J� que eu sou o disc�pulo da Fada que estudou m�gica com #p1012005#... Talvez eu possa fazer que ele viva novamente..." );
					nRet2 = self.askYesNo( "Se eu puder conseguir #b#t5180000##k e #b#t4031034##k, talvez eu consiga fazer que seu boneco volte � vida. O que voc� acha? Voc� quer ir buscar estes itens? Traga os itens para mim e eu tentarei fazer que seu boneco volte � vida..." );
					if ( nRet2 == 0 ) self.say( "Voc� quer deixar o boneco do jeito que est�? � um boneco agora, mas... ser� dif�cil apagar suas mem�rias tamb�m. Se voc� mudar de id�ia, � s� vir falar comigo..." );
					else {
						qr.set( 3240, "" );
						self.say( "Muito bem. Eu vou dizer isso novamente, mas o que preciso � #b#t5180000##k e #b#t4031034##k. Me traga estes dois itens e eu posso fazer seu boneco voltar � vida. #b#t4031034##k � dif�cil de achar... em algum lugar de Ludibrium voc� ir� encontrar a casa de #b#p1012005##k. A casa est� vazia no momento, mas d� uma procurada e talvez voc� o encontre." );
					}
				}
			}
			else if ( val == 1 ) {
				if ( inven.itemCount( 5180000 ) > 0 and inven.itemCount( 4031034 ) > 0 ) {
					nRet3 = self.askYesNo( "Voc� me trouxe #b#t5180000##k e #b#t4031034##k... com esses itens, eu posso trazer o boneco de volta � vida, usando o poder m�gico de meu mestre. O que voc� acha? Voc� deseja usar os itens e reanimar seu bichinho?" );
					if ( nRet3 == 0 ) self.say( "Eu entendo, voc� n�o tem certeza sobre isso, n�o �? Voc� n�o acha que deixar o bichinho como um boneco n�o � errado? Por favor, volte aqui se voc� mudar de id�ia..." );
					else {
						petCode = self.askPet( "Ent�o, qual bichinho voc� deseja restaurar? Por favor, escolha o bichinho que voc� deseja reviver..." );
						okPet = inven.setPetLife( petCode, 5180000, 4031034 );
						if ( okPet == 0 ) self.say( "Alguma coisa est� errada... voc� tem certeza de que possui #b#t5180000##k e #b#t4031034##k? Sem esses dois itens eu n�o posso fazer seu boneco voltar a ser um bichinho." );
						else {
							qr.setComplete( 3240 );
							self.say( "Seu boneco agora voltou a ser um bichinho. Entretanto, minha m�gica n�o � perfeita, por isso, eu n�o posso te prometer que ele vai viver para sempre ... cuide do seu bichinho antes que o #t5180000# se esgote. Bem, acho que � isso... adeus!" );
						}
					}
				}
				else self.say( "Eu acho que voc� n�o conseguiu #b#t5180000##k e #b#t4031034##k ainda. Em algum lugar de Ludibrium voc� vai encontrar a casa de #b#p1012005##k. A casa est� vazia no momento, mas d� uma procurada e talvez voc� o encontre. Viva!" );
			}
		}
		else {
			if ( val == 2 ) self.say( "Ol�! Como est� indo o seu bichinho reanimado? Fico contente em saber que voc� est� feliz com seu bichinho. Bem, agora tenho que voltar aos estudos que meu mestre me passou, por isso..." );
			else self.say( "Eu sou #p2040030#, continuando com os estudos que meu mestre #p1032102# me deu. Parece que h� muitos bichinhos at� mesmo aqui em Ludibrium. Eu preciso voltar aos meus estudos, ent�o, se puder me dar licen�a..." );
		}
	}
	else if ( v1 == 1 ) {
		self.say( "Humm... voc� deve ter muitas perguntas sobre bichinhos. H� muito tempo, uma pessoa com o nome de #b#p1012005##k jogou #t5180000# nele, e lan�ou um feiti�o nele para criar um animal m�gico. Eu sei que parece inacredit�vel, mas � um boneco que se tornou um ser vivo. Eles entendem e acompanham as pessoas." );
		self.say( "Mas #t5180000# s� aparece aos pouqinhos na base da �rvore do Mundo, por isso, esses beb�s n�o podem viver para sempre... Eu sei, � uma coisa chata... mas, mesmo que ele se torne um boneco de novo, sempre poder�o ser reanimados e voltarem a viver. Seja bom com ele enquanto ele est� vivo." );
		self.say( "Ah, sim! Eles ir�o reagir quando voc� falar comandos especiais. Voc� pode brigar com eles, am�-los... tudo depende de como voc� toma conta deles. Eles t�m medo de abandonar seus mestres, por isso, seja bom com eles, tenha amor por eles. Eles podem se sentir tristes e solit�rios muito r�pido..." );
	}
	else if ( v1 == 2 ) {
		self.say( "Dependendo do comando que voc� der, os bichinhos podem gostar, odiar ou mostrar outros tipos de rea��o a eles. Se voc� der um comando ao bichinho e ele obedecer sem reclamar, o seu la�o de amizade aumenta. Clique duas vezes no bichinho e poder� visualizar os n�veis de intimidade, energia e etc..." );
		self.say( "Fale com o bichinho, d� aten��o a ele, e seu n�vel de intimidade ir� aumentar, e seu n�vel geral tamb�m ir� aumentar. � medida que o seu n�vel de intimidade aumenta, o n�vel geral do bichinho tamb�m ir� aumentar. � medida que o n�vel geral aumenta, algum dia o bichinho pode at� mesmo falar um pouco parecido como uma pessoa, ent�o tente criar seu bichinho da melhor forma poss�vel. Claro que n�o ser� f�cil fazer isso..." );
		self.say( "Eles s�o bonecos com vida, e, por isso, eles tamb�m sentem fome, por exemplo. #bEnergia Completa#k Mostra o n�vel de fome do bichinho, sendo que 100 � o m�ximo, e, quanto mais baixo esse n�vel ficar, mais fome o seu bichinho est� sentindo. Depois de um tempo, ele n�o vai seguir seus comandos e ficar� irritado, ent�o � bom tomar cuidado." );
		self.say( "Isso a�! Bichinhos n�o podem comer comida humana normal. Um urso de pel�cia chamado #b#p2041014##k, que mora em Ludibrium, vende #b#t2120000##k ent�o, se voc� precisar de comida para seu bichinho, v� falar com #b#p2041014##k. � uma boa id�ia comprar comida extra e alimentar seu bichinho antes que ele fique com muita fome." );
		self.say( "Oh, e se voc� n�o der comida ao bichinho por muito tempo, ele volta para casa sozinho. Voc� pode tir�-lo de casa e lhe dar comida, mas isso n�o � muito bom para a sa�de do bichinho, ent�o tente aliment�-lo regularmente para evitar esses problemas, certo? Acho que � s� isso." );
	}
	else if ( v1 == 3 ) {
		self.say( "Morrendo... bem, veja, eles n�o est�o VIVOS na verdade, ent�o n�o sei se morrer seja a palavra certa a ser usada. Eles s�o bonecos com o poder m�gico de #p1012005#k e #t5180000# que os torna um objeto com vida. Claro que, enquanto ele est� vivo, ele se parece com um animal vivo..." );
		self.say( "Ap�s algum tempo... Sim! � isso que voc� est� pensando! Eles param de se movimentar. Eles voltam a ser apenas um boneco, quando o efeito da m�gica acaba e o #t5180000# se esgota. Mas isso n�o significa que ele fica im�vel para sempre, pois, quando voc� derramar #t5180000# sobre ele, ele volta � vida." );
		self.say( "Mesmo sabendo disso, � triste v�-los parar de se movimentar. Seja legal com eles enquanto eles est�o vivos e se movendo. E n�o se esque�a de lhes dar comida tamb�m. N�o � legal saber que h� uma coisinha viva que te segue e s� obedece a voc�?" ); 
	}
	else if ( v1 == 4 ) {
		self.say( "Estes s�o os comandos dos #rGatinhos Marrom e Preto#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#best�pido, eu te odeio, bob�o#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bCoc�#k(n�vel 1 ~ 30)\r\n#bconverse, diga algo, bata um papo#k(n�vel 10 ~ 30)\r\n#bbonitinho#k(n�vel 10 ~ 30)\r\n#bacorde, fique de p�, levante-se#k(n�vel 20 ~ 30)" );
	}
	else if ( v1 == 5 ) {
		self.say( "Estes s�o os comandos do #rCachorrinho Marrom#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#best�pido, eu te odeio, cachorro mau, bob�o#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bxixi#k(n�vel 1 ~ 30)\r\n#bconverse, diga algo, bata um papo#k(n�vel 10 ~ 30)\r\n#babaixe#k(n�vel 10 ~ 30)\r\n#bacorde, fique de p�, levante-se#k(n�vel 20 ~ 30)" );
	}
	else if ( v1 == 6 ) {
		self.say( "Estes s�o os comandos dos #rCoelhinhos Rosa e Branco#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#bacorde, fique de p�, levante-se#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bconverse, diga algo, bata um papo#k(n�vel 10 ~ 30)\r\n#babra�ar#k(n�vel 10 ~ 30)\r\n#bdurma, fique com sono, v� para a cama#k(n�vel 20 ~ 30)" );
	}
	else if ( v1 == 7 ) {
		self.say( "Estes s�o os comandos do #rMini Kargo#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#bacorde, fique de p�, levante-se#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bxixi#k(n�vel 1 ~ 30)\r\n#bconverse, diga algo, bata um papo#k(n�vel 10 ~ 30)\r\n#bsuplique, mostre carisma#k(n�vel 10 ~ 30)\r\n#babaixe#k(n�vel 10 ~ 30)\r\n#bbom garoto, boa garota#k(n�vel 20 ~ 30)" );
	}
	else if ( v1 == 8 ) {
 		self.say( "Estes s�o os comandos de #rRudolph e Dasher#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#blevantar, ficar de p�#k(n�vel 1 ~ 30)\r\n#best�pido, eu te odeio, bob�o#k(n�vel 1 ~ 30)\r\n#bfeliz natal, feliz natal#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bconverse, diga algo, bata um papo#k(n�vel 11 ~ 30)\r\n#bsolit�rio, sozinho#k(n�vel 11 ~ 30)\r\n#bbonitinho#k(n�vel 11 ~ 30)\r\n#bbusque, v�#k(level 21 ~ 30)" );
	}
	else if ( v1 == 9 ) {
 		self.say( "Estes s�o os comandos do #rPorquinho Preto#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bm�o#k(n�vel 1 ~ 30)\r\n#best�pido, eu te odeio, bob�o#k(n�vel 1 ~ 30)\r\n#bconverse, bata um papo, diga algo#k(n�vel 10 ~ 30)\r\n#bsorria#k(n�vel 10 ~ 30)\r\n#bsuplique, mostre carisma#k(n�vel 20 ~ 30)" );
	}
	else if ( v1 == 10 ) {
 		self.say( "Estes s�o os comandos do #rPanda#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bdescansar, relaxar#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bacorde, fique de p�, levante-se#k(n�vel 1 ~ 30)\r\n#bconverse, bata um papo, diga algo#k(n�vel 10 ~ 30)\r\n#bvamos brincar#k(n�vel 10 ~ 30)\r\n#bm�, bl�#k(n�vel 10 ~ 30)\r\n#bdormir#k(n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 11 ) {
 		self.say( "Estes s�o os comandos do #rHusky#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#best�pido, eu te odeio, cachorro mau, bob�o#k(n�vel 1 ~ 30)\r\n#bm�o#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#babaixe#k(n�vel 10 ~ 30)\r\n#bconverse, bata um papo, diga algo#k(n�vel 10 ~ 30)\r\n#bacorde, fique de p�, levante-se#k(n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 12 ) {
		self.say( "Estes s�o os comandos para #rDino Boy, Dino Girl#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bsorria, gargalhe#k(n�vel 1 ~ 30)\r\n#best�pido, eu te odeio, bob�o#k(n�vel 1 ~ 30)\r\n#bconverse, bata um papo, diga algo#k(n�vel 10 ~ 30)\r\n#bbonitinho#k(n�vel 10 ~ 30)\r\n#bdurma, tire uma soneca, fique com sono#k(n�vel 20 ~ 30)" );
	}
	else if ( v1 == 13 ) {
		self.say( "Estes s�o os comandos do #rMacaco#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bdescansar#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garoto mau, garota m�#k(n�vel 1 ~ 30)\r\n#bxixi#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#blevantar, ficar de p�#k(n�vel 1 ~ 30)\r\n#bconverse, bata um papo, diga algo#k(n�vel 10 ~ 30)\r\n#bbrincar#k(n�vel 10 ~ 30)\r\n#beu quero#k(n�vel 10 ~ 30)\r\n#bdurma, v� para a cama, fique com sono#k(n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 14 ) {
		self.say( "Estes s�o os comandos do #rPeru#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bn�o, garoto mal-educado, malvado#k(n�vel 1 ~ 30)\r\n#best�pido#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#blevantar, ficar de p�#k(n�vel 1 ~ 30)\r\n#bconverse, bata um papo, glu#k(n�vel 10 ~ 30)\r\n#bsim, bom garoto#k(n�vel 10 ~ 30)\r\n#bfique com sono, sonequinha, dormir muito#k(n�vel 20 ~ 30)\r\n#bolho de p�ssaro, a��o de gra�as, voar, p�ssaro frito, eu estou com fome#k(n�vel 30)" );
  	}
	else if ( v1 == 15 ) {
		self.say( "Estes s�o os comandos do #rTigre Branco#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garoto mau, garota m�#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bdescansar, relaxar#k(n�vel 1 ~ 30)\r\n#best�pido, eu te odeio, bob�o#k(n�vel 1 ~ 30)\r\n#bconverse, bata um papo, diga algo#k(n�vel 10 ~ 30)\r\n#bparecer triste, olhar triste#k(n�vel 10 ~ 30)\r\n#besperar#k(n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 16 ) {
		self.say( "Estes s�o os comandos do #rPing�im#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garoto mau, garota m�#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bacorde, fique de p�, levante-se#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bconverse, bata um papo, diga algo#k(n�vel 10 ~ 30)\r\n#babra�ar, me abrace#k(n�vel 10 ~ 30)\r\n#basa, m�o#k(n�vel 10 ~ 30)\r\n#bdormir#k(n�vel 20 ~ 30)\r\n#bbeijar, beijar bochecha, bicota#k(n�vel 20 ~ 30)\r\n#bvoar#k(n�vel 20 ~ 30)\r\n#bbonito, ador�vel#k(n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 17 ) {
		self.say( "Estes s�o os comandos do #rPorquinho Dourado#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garoto mau, garota m�#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bconverse, bata um papo, diga algo#k(n�vel 11 ~ 30)\r\n#bme ame, me abra�e#k(n�vel 11 ~ 30)\r\n#bdurma, fique com sono, v� para a cama#k(n�vel 21 ~ 30)\r\n#bignorar / impressionado / saia daqui#k(n�vel 21 ~ 30)\r\n#brole, mostre o dinheiro#k(n�vel 21 ~ 30)" );
  	}	
	else if ( v1 == 18 ) {
		self.say( "Estes s�o os comandos do #rRob�#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bacorde, fique de p�, levante-se#k(n�vel 1 ~ 30)\r\n#best�pido, eu te odeio, bob�o#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garota m�, garoto mau#k(n�vel 1 ~ 30)\r\n#batacar, avan�ar#k(n�vel 1 ~ 30)\r\n#bTe amo#k(n�vel 1 ~ 30)\r\n#bbom, suplique, mostre carisma#k(n�vel 11 ~ 30)\r\n#bfale, converse, bata um papo, diga algo#k(n�vel 11 ~ 30)\r\n#bdisfarce, mude, transforme#k(n�vel 11 ~ 30)" );
  	}
	else if ( v1 == 19 ) {
		self.say( "Estes s�o os comandos do #rMini Yeti#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bmau, n�o, garoto mau, garota m�#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bdan�ar, requebrar, rebolar#k(n�vel 1 ~ 30)\r\n#bbonito, bonitinho, lindo, ador�ve�#k(n�vel 1 ~ 30)\r\n#bTe amo, gosto de voc�, meu amor#k(n�vel 1 ~ 30)\r\n#bconverse, bata um papo, diga algo#k(n�vel 11 ~ 30)\r\n#bdurma, soneca, fique com sono, v� para a cama#k(n�vel 11 ~ 30)" );
  	}
	else if ( v1 == 20 ) {
		self.say( "Estes s�o os comandos do #rBalrog Jr.#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bdeitar#k(n�vel 1 ~ 30)\r\n#bn�o|mau|garota m�|garoto mau#k(n�vel 1 ~ 30)\r\n#bTe amo|meu amor|gosto de voc�#k(n�vel 1 ~ 30)\r\n#bbonito|bonitinho|lindo|ador�vel#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#bsorria|ria|gargalhe#k(n�vel 1 ~ 30)\r\n#beu quero#k(n�vel 11 ~ 30)\r\n#bbom|suplique|mostre carisma#k(n�vel 11 ~ 30)\r\n#bfale|converse|bata um papo|diga algo#k(n�vel 11 ~ 30)\r\n#bdurma|soneca|fique com sono#k(n�vel 11 ~ 30)\r\n#bsolte pum#k(n�vel 21 ~ 30)" );
  	}
	else if ( v1 == 21 ) {
		self.say( "Estes s�o os comandos do #rBeb�-drag�o#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bn�o|mau|garota m�|garoto mau#k(n�vel 1 ~ 30)\r\n#bTe amo|amo voc�#k(n�vel 1 ~ 30)\r\n#bcoc�#k(n�vel 1 ~ 30)\r\n#best�pido|eu te odeio|bob�o#k(n�vel 1 ~ 30)\r\n#bbonitinho#k(n�vel 11 ~ 30)\r\n#bconverse|bata um papo|diga algo#k(n�vel 11 ~ 30)\r\n#bdurma|fique com sono|v� para a cama#k(n�vel 11 ~ 30)" );
	}
	else if ( v1 == 22 ) {
		self.say( "Estes s�o os comandos dos #rDrag�es Verde/Vermelho/Azul#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 15 ~ 30)\r\n#bn�o|mau|garota m�|garoto mau#k(n�vel 15 ~ 30)\r\n#bTe amo|amo voc�#k(n�vel 15 ~ 30)\r\n#bcoc�#k(n�vel 15 ~ 30)\r\n#best�pido|eu te odeio|bob�o#k(n�vel 15 ~ 30)\r\n#bconverse|bata um papo|diga algo#k(n�vel 15 ~ 30)\r\n#bdurma|fique com sono|v� para a cama#k(n�vel 15 ~ 30)\r\n#bmudar#k(n�vel 21 ~ 30)" );
	}
	else if ( v1 == 23 ) {
		self.say( "Estes s�o os comandos do #rDrag�o Negro#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 15 ~ 30)\r\n#bn�o|mau|garota m�|garoto mau#k(n�vel 15 ~ 30)\r\n#bTe amo|amo voc�#k(n�vel 15 ~ 30)\r\n#bcoc�#k(n�vel 15 ~ 30)\r\n#best�pido|eu te odeio|bob�o#k(n�vel 15 ~ 30)\r\n#bconverse|bata um papo|diga algo#k(n�vel 15 ~ 30)\r\n#bdurma|fique com sono|v� para a cama#k(n�vel 15 ~ 30)\r\n#bbonitinho, mudar#k(n�vel 21 ~ 30)" );
	}
	else if ( v1 == 24 ) {
		self.say( "Estes s�o os comandos para o #rAnjo da Morte Jr.#k O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bn�o|mau|garota m�|garoto mau#k(n�vel 1 ~ 30)\r\n#bfingir de morto, coc�#k(n�vel 1 ~ 30)\r\n#bconverse|bata um papo|diga algo#k(n�vel 1 ~ 30)\r\n#bTe amo, abra�ar#k(n�vel 1 ~ 30)\r\n#bcheire meu p�, dance rock, bu#k(n�vel 1 ~ 30)\r\n#btravessuras ou gostosuras#k(n�vel 1 ~ 30)\r\n#bmonstromash#k(n�vel 1 ~ 30)" );
	}
	else if ( v1 == 25 ) {
		self.say( "Estes s�o os comandos do #rPorco-espinho#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#bn�o|mau|garota m�|garoto mau#k(n�vel 1 ~ 30)\r\n#bTe amo abra�ar bom garoto#k(n�vel 1 ~ 30)\r\n#bconverse|bata um papo|diga algo#k(n�vel 1 ~ 30)\r\n#balmofada durma tricote coc�#k(n�vel 1 ~ 30)\r\n#bpenteie praia#k(n�vel 10 ~ 30)\r\n#b�rvore ninja#k(n�vel 20 ~ 30)\r\n#bdardo#k(n�vel 20 ~ 30)" );
	}
	else if ( v1 == 26 ) {
		self.say( "Estes s�o os comandos do #rBoneco de neve#k. O n�vel descrito pr�ximo ao comando mostra o n�vel necess�rio ao bichinho para que ele responda.\r\n#bsenta#k(n�vel 1 ~ 30)\r\n#best�pido,eu te odeio,bob�o#k(n�vel 1 ~ 30)\r\n#bte amo,meu amor,eu gosto de voc�#k(n�vel 1 ~ 30)\r\n#bfeliz natal#k(n�vel 1 ~ 30)\r\n#bbonitinho,ador�vel,bonito,lindo#k(n�vel 1 ~ 30)\r\n#bpenteie praia/mau,n�o,garota m�,garoto mau#k(n�vel 1 ~ 30)\r\n#bconverse,bata um papo,diga algo/durma,fique com sono,v� para a cama#k(n�vel 10 ~ 30)\r\n#bmudar#k(n�vel 20 ~ 30)" );
	}
}

// ������ġ : 2040031
script "ludi027" {
	qr = target.questRecord;
	val = qr.getState( 3240 );
	inven = target.inventory;

	if ( val == 1 ) {
		if ( inven.itemCount( 4031034 ) >= 1 ) {
			self.say( "Voc� j� tem #b#t4031034##k." );
			end;
		}
		
		nRet = self.askYesNo( "No meio de tantos pergaminhos deixados por #b#p1012005##k, eu vejo um que emite uma luz brilhante. Ser� que devo pegar?" );
		if ( nRet != 0 ) {
			ret = inven.exchange( 0, 4031034, 1 );
			if ( ret == 0 ) self.say( "Eu n�o tenho nenhum espa�o livre em meu invent�rio. � melhor eu desocupar um espa�o para que possa carregar esse pergaminho comigo." );
		}
	}
}

// weaver the trainer : 2040032
script "ludi028" {
	inven = target.inventory;
	if ( inven.itemCount( 4031128 ) > 0 ) self.say( "Pegue essa carta, pule sobre os obst�culos com seu bichinho e leve a carta para meu irm�o #p2040033#. Leve a carta para ele e algo bom vai acontecer com seu bichinho." );
	else {
		nRet = self.askYesNo( "Essa � a estrada onde voc� pode levar seu bichinho para dar uma volta. Voc� pode andar nela ou pode treinar seu bichinho para que ele pule os obst�culos. Se voc� ainda n�o � muito intimo de seu bichinho, isso pode ser um prolema e ele n�o vai seguir suas ordens t�o bem... ent�o... o que voc� acha? Quer treinar seu bichinho?" );
		if ( nRet == 0 ) self.say( "Humm... muito #Gocupado:ocupada# agora? Se voc� quiser fazer isso depois, � s� voltar e falar comigo." );
		else {
			ret = inven.exchange( 0, 4031128, 1 );
			if ( ret == 0 ) self.say( "Seu invent�rio de etc. est� cheio! Eu n�o posso te dar a carta a nao ser que exista espa�o livre em seu invent�rio. Libere espa�o no seu invent�rio e venha falar comigo novamente." );
				else self.say( "Ok, aqui est� a carta. Se eu te mandasse l� sem a carta, ele n�o saberia quem � voc�, por isso, passe pelos obst�culos com seu bichinho, v� at� o topo e depois fale com #p2040033# e entregue a carta. N�o ser� dif�cil se voc� prestar aten��o no seu bichinho enquanto estiver ultrapassando os obst�culos. Boa sorte!" );
			}
	}
}

// nerr the trainer : 2040033
script "ludi029" {
	inven = target.inventory;
	if ( inven.itemCount( 4031128 ) > 0 ) {
		self.say( "Ei! Essa carta � do meu irm�o! Provavelmente me dando uma bronca por achar que eu n�o estou trabalhando com vontade... O qu�? Ahhh... voc� seguiu os conselhos de meu irm�o e treinou o seu bichinho at� chegar aqui em cima? Lega!! J� que voc� se esfor�ou tanto para chegar aqui, eu vou vou aumentar seu n�vel de intimidade com seu bichinho." );
		pName = target.sPetName;
		if ( pName == null ) self.say( "Humm... voc� conseguiu chegar aqui com seu bichinho!? Esses obst�culos s�o para os bichinhos. O que voc� est� fazendo aqui sem ele? Saia daqui!" );
		else {
			ret = inven.exchange( 0, 4031128, -1 );
			if ( ret == 0 ) self.say( "Ei! Voc� tem certeza de que est� com a carta do meu irm�o? Verifique no seu invent�rio de etc. para ver se a carta est� l� ou n�o!" );
			else {
				target.incPetTame( 4 );
				self.say( "O que voc� acha? Voc� n�o acha que ficou muito �ntimo do seu bichinho? Se voc� estiver com tempo, treine seu bichinho novamente nesse curso de obst�culos... com a permiss�o de meu irm�o, � claro!" );
			}
		}
	}
	else self.say( "Meu irm�o me disse para tomar conta do curso de obst�culos, mas... j� que estou t�o longe dele, n�o consigo evitar de ficar brincando, hehe... j� que ele n�o pode me controlar, eu aproveito para relaxar um pouco." );
}

script "library" {
	qr = target.questRecord;
	count = 0;
	bookname = "";

	book1 = qr.getState( 3615 ); //��ο� ��� ��ȭå ȸ��
	if ( book1 == 2 ) {
		count++;
		bookname = bookname + "#b#v4031235##t4031235##k\r\n";
	}

	book2 = qr.getState( 3616 ); //���� ����
	if ( book2 == 2 ) {
		count++;
		bookname = bookname + "#b#v4031236##t4031236##k\r\n";
	}

	book3 = qr.getState( 3617 ); //������ ����
	if ( book3 == 2 ) {
		count++;
		bookname = bookname + "#b#v4031237##t4031237##k\r\n";
	}
	
	book4 = qr.getState( 3618 ); //������ �̾߱�
	if ( book4 == 2 ) {
		count++;
		bookname = bookname + "#b#v4031238##t4031238##k\r\n";
	}

	book5 = qr.getState( 3630 ); //�ؿ� ���� �� ������
	if ( book5 == 2 ) {
		count++;
		bookname = bookname + "#b#v4031270##t4031270##k\r\n";
	}

	book6 = qr.getState( 3633 ); //ȿ�� ��û
	if ( book6 == 2 ) {
		count++;
		bookname = bookname + "#b#v4031280##t4031280##k\r\n";
	}

	book7 = qr.getState( 3639 ); //�ݵ��� ������
	if ( book7 == 2 ) {
		count++;
		bookname = bookname + "#b#v4031298##t4031298##k\r\n";
	}

	if ( count != 0 ) {
		self.say( "Vamos ver... #b" + target.sCharacterName + "#k Eu devolvi um total de #b" + count + "#k livros.\r\nA lista de livros devolvidos �:\r\n\r\n" + bookname );
		self.say( "A biblioteca est� se ajeitando agora, principalmente gra�as a voc�, #b" + target.sCharacterName + "#k. Se a hist�ria se misturar mais uma vez, ent�o, eu poderei contar com voc� para repar�-la novamente." );
	} else {
		self.say( "#b" + target.sCharacterName + "#k ainda n�o devolveu nenhum livro de hist�ria..." );
	}
}
