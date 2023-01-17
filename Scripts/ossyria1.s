module "standard.s";

// item-selling function
function sellItem( integer itemCode, integer unitPrice, string desc ) {
	nRetNum = self.askNumber( "#b#t" + itemCode + "� ##k realmente o item que voc� precisa? �." + desc + ". Pode n�o ser o item mais f�cil de se conseguir, mas vou fazer um bom neg�cio para voc�. Vai custar #b" + unitPrice + "mesos #k por item. Quantos voc� gostaria de comprar?", 0, 0, 100 );
	nPrice = unitPrice * nRetNum;
	nRetBuy = self.askYesNo( "Deseja realmente comprar #r" + nRetNum + " #t" + itemCode + "#(s)#k? Vai custar" + unitPrice + "mesos por #t" + itemCode + "#, o que d� #r" + nPrice + "#k mesos no total." );
	if ( nRetBuy == 0 ) self.say( "Entendo. Veja bem, tenho muitos itens diferentes aqui. D� uma olhada. Estou vendendo estes itens apenas para voc�. Assim, n�o vou roubar voc� de forma alguma." );
	else {
		inventory = target.inventory;
		ret = inventory.exchange( -nPrice, itemCode, nRetNum );
		if ( ret == 0 ) self.say( "Tem certeza de que possui mesos suficientes? Por favor, verifique se seu invent�rio de uso ou etc. est� cheio ou se voc� possui pelo menos #r" + nPrice + "#k mesos." );
		else self.say( "Obrigado. Se algum outro dia voc� estiver precisando de itens, passe por aqui. Eu posso ter ficado velho com o tempo, mas ainda posso fazer itens m�gicos facilmente." );
	}
}

// Alcaster
script "oldBook1" {
	qr = target.questRecord;
	val = qr.getState( 3035 );
	
	if ( val == 2 ) {
		v1 = self.askMenu( "Gra�as a voc�, #b#t4031056##kest� preso com seguran�a. Claro que acabei usando metade do poder que acumulei por mais de 800 anos... mas agora posso morrer em paz. Oh, por falar nisto... por acaso voc� estaria procurando por itens raros? Como prova de meu agradecimento pelo seu empenho, vou vender alguns itens que tenho SOMENTE para voc�. Escolha o que quiser!\r\n#b#L0##t2050003#(Pre�o: 300 mesos)#l\r\n#L1##t2050004#(Pre�o: 400 mesos)#l\r\n#L2##t4006000#(Pre�o: 5000 mesos)#l\r\n#L3##t4006001#(Pre�o: 5000 mesos)#l" );
		if ( v1 == 0 ) sellItem( 2050003, 300, "Item que cura o estado de selado e amaldi�oado." );
		else if ( v1 == 1 ) sellItem( 2050004, 400, "Item que cura tudo." );
		else if ( v1 == 2 ) sellItem( 4006000, 5000, "Item de poder m�gico usado para per�cias de alta qualidade." );
		else if ( v1 == 3 ) sellItem( 4006001, 5000, "Item de poder de invoca��o usado para per�cias de alta qualidade." );
	}
	else if ( target.nLevel > 54 ) self.say( "Se voc� decidir me ajudar, em troca deixarei o item � venda." );
	else self.say( "Eu sou Alcaster, o Feiticeiro, morador desta cidade por mais de 300 anos, onde tenho trabalhado em muitos encantos e feiti�os." );
}

// Lisa
script "oldBook2" {
	qr = target.questRecord;
	val = qr.getState( 3006 );
	val2 = qr.getState( 3017 );
	
	if ( val == 0 ) self.say( "Voc� est� procurando por #bHella#k? Tecnicamente ela mora aqui, mas voc� n�o vai poder encontr�-la nesses dias. H� alguns meses, ela deixou a cidade repentinamente e n�o voltou mais. N�o vai adiantar muito passar na casa dela, mas, ao menos, a faxineira deve estar l�. Que tal conversar com ela?" );
	else if ( val2 == 0 ) self.say( "Aonde #bHella#k foi... o qu�? S� sabe que ela est� bem? Hmmm... Eu n�o sei se devo confiar na palavra de um estranho, mas, se for verdade, isto � �timo. Claro que voc� j� avisou o Jade, certo? De todos, ele � o mais preocupado com ela." );
	else self.say( "Os monstros ultimamente t�m estado muito mais malvados e cru�is.  E se eles chegarem at� as proximidades?? Espero que isso nunca aconte�a, n�? N�?" );
}

// spiruna
script "oldBook5" {
	qr = target.questRecord;
	val = qr.getState( 3014 );

	if ( val == 2 ) {
		v1 = self.askMenu( "Hella � uma boa crian�a. Tudo o que pe�o, seja dif�cil ou n�o, ela faz sem reclamar de nada. Um dia ela vai se tornar uma bruxa muito melhor do que eu. O que voc� quer de mim, afinal??\r\n#b#L0#I Eu quero fazer #t4005004##k#l\r\n#b#L1#N�o, nada#k#l" );
		if ( v1 == 0 ) {
			inventory = target.inventory;
			nRet = self.askYesNo( "#b#t4005004##k?? Como voc�... voc� ficou sabendo por #b#p2020005##k? Sim, eu sei como refinar, mas... este min�rio � muito dif�cil de se conseguir. Para fazer #b1 #t4005004##k, eu preciso de #b10 #t4004004#s#k e 50000 mesos. Voc� quer um?" );
			if ( nRet == 0 ) self.say( "#b#t4005004##k. Faz muito tempo que n�o vejo... faz centenas de anos desde a �ltima vez que refinei, por isto, mal consigo lembrar-me de como fiz... claro que voc� n�o vai t�-lo agora..." );
			else {
				ret = inventory.exchange( -50000, 4004004, -10, 4005004, 1 );
				if ( ret == 0 ) self.say( "Voc� est� sem mesos? Verifique se voc� tem #b10 #t4004004#s#k, 50000 mesos e se seu invent�rio de etc. tem espa�o." );
				else self.say( "Aqui, pegue #b1 #t4004004##k. Faz tanto tempo desde a �ltima vez que fiz um, espero que tenha dado certo... Ali�s, como voc� conseguiu os min�rios de cristal? Voc� deve ser mesmo especial. De qualquer modo, � um item incr�vel. Por favor, fa�a bom uso dele." );
			}
		}
		else self.say( "Estou trabalhando em um feiti�o importante, por isto, n�o me perturbe e saia imediatamente. Eu n�o posso me concentrar quando um forasteiro fica rondando minha casa. Por favor, v� embora..." );
	}
	else self.say( "Estou trabalhando em um feiti�o importante, por isto, n�o me perturbe e saia imediatamente. Eu n�o posso me concentrar quando um forasteiro fica rondando minha casa. Por favor, v� embora..." );
}

//���� ���̵�
script "tamepig_enter" {
	qr = target.questRecord;
	inven = target.inventory;
	field = self.field;
	if ( field.id == 230000003 ) {
		if ( qr.getState( 6002 ) == 1 ) {
			if ( inven.itemCount( 4031508 ) < 5 or inven.itemCount( 4031507 ) < 5 ) {
				quest = FieldSet( "TamePig" );
				ret = quest.enter( target.nCharacterID, 0 );			
				if ( ret != 0 ) target.message( "Algu�m j� est� tentando proteger o Porco Vigia. Por favor, tente mais tarde." );	
				else {
					nItem = inven.itemCount( 4031508 );
					if ( nItem > 0 ) ret = inven.exchange( 0, 4031508, -nItem );
					nItem2 = inven.itemCount( 4031507 );
					if ( nItem2 > 0 ) ret = inven.exchange( 0, 4031507, -nItem2 );
				}
			} else self.say( "Ei~ voc� j� tem bastante #b#t4031508##k e #b#t4031507##k. Eu n�o acho que voc� precise entrar l� novamente ~^^" );
		} else if ( qr.getState( 6002 ) == 2 ) self.say( "Voc� j� se saiu bem protegendo o porco. Parab�ns mais uma vez~" );
		else self.say( "Como assim protegendo o porco? De onde voc� tirou esta id�ia?" );
	}
}	

script "tamepig_out" {
	inven = target.inventory;
	if ( inven.itemCount( 4031508 ) >= 5 and inven.itemCount( 4031507 ) >= 5 ) {
		self.say( "Uau~ Voc� conseguiu coletar 5 de cada b#t4031508##k e #b#t4031507##k!  Ok ent�o, enviarei voc� para #m230000003#. Por favor, fale comigo novamente quando chegar l�." );
		registerTransferField( 230000003, "" );
	} else {
		v0 = self.askYesNo( "Que pena, mas voc� n�o coletou 5 de cada #b#t4031508##k ou #b#t4031507##k. Voc� gostaria de parar a miss�o e ir embora?" );
		if ( v0 == 0 ) self.say( "Por favor, pense com cuidado e fale comigo." );
		else {
			self.say( "Voc� ser� transferido para #m923010100#." );
			registerTransferField( 923010100, "" );
		}
	}
}

script "tamepig_out2" {
	inven = target.inventory;
//	self.say( "Que pena, mas voc� n�o coletou 5 de cada #b#t4031508##k ou #b#t4031507##k. Vou deixar voc� sair, ent�o." );
	nItem = inven.itemCount( 4031508 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4031508, -nItem );
	nItem2 = inven.itemCount( 4031507 );
	if ( nItem2 > 0 ) ret = inven.exchange( 0, 4031507, -nItem2 );

	target.playPortalSE;
	registerTransferField( 230000003, "" );
}
