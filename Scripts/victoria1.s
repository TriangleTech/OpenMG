module "standard.s";

// a pile of flowers
script "bush1" {
	qr = target.questRecord;
	val = qr.getState( 2050 );

	inventory = target.inventory;

	if ( target.nLevel > 24 ) {
		if ( val == 1 ) {
			nRet = self.askYesNo( "Tem certeza de que quer levar #b#t4031020##k com voc�?" );
			if ( nRet != 0 ) {
				ret = inventory.exchange( 0, 4031020, 1 );
				if ( ret == 0 ) self.say( "Seu invent�rio de etc. parece estar cheio. Por favor, libere espa�o para poder pegar o item." );
				else registerTransferField( 101000000, "" );
			}
		}
		else if ( val == 2 ) {
			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
				nNewItemID = 0;
				rnum = random( 0, 12 );
				if ( rnum == 0 ) nNewItemID = 4010000;
				else if( rnum == 1 ) nNewItemID = 4010001;
				else if( rnum == 2 ) nNewItemID = 4010002;
				else if( rnum == 3 ) nNewItemID = 4010003;
				else if( rnum == 4 ) nNewItemID = 4010004;
				else if( rnum == 5 ) nNewItemID = 4010005;
				else if( rnum == 6 ) nNewItemID = 4020000;
				else if( rnum == 7 ) nNewItemID = 4020001;
				else if( rnum == 8 ) nNewItemID = 4020002;
				else if( rnum == 9 ) nNewItemID = 4020003;
				else if( rnum == 10 ) nNewItemID = 4020004;
				else if( rnum == 11 ) nNewItemID = 4020005;
				else if( rnum == 12 ) nNewItemID = 4020006;
	
				ret = inventory.exchange( 0, nNewItemID, 2 );
				if ( ret == 0 ) self.say( "Seu invent�rio de etc. parece estar cheio. Por favor, libere espa�o para poder pegar o item." );
				else registerTransferField( 101000000, "" );
			}
			else self.say( "Voc� precisa ter pelo menos um slot vazio no seu invent�rio de etc. para guardar o item que encontrou no meio das flores. Libere espa�o e ent�o tente de novo." );
		}
		else self.say( "No meio de todas estas flores voc� encontrar� algumas com uma aura misteriosa ao seu redor, mas n�o poder� peg�-las porque voc� ainda n�o ouviu qualquer explica��o de #b#p1061005##k sobre quais pegar..." );
	}
	else self.say( "No meio destas flores voc� encontrar� algumas com uma aura misteriosa ao redor. Voc� n�o poder� peg�-las por causa da aura que as cerca." );
}

// herbal bush
script "bush2" {
	qr = target.questRecord;
	val = qr.getState( 2051 );

	inventory = target.inventory;

	if ( target.nLevel > 49 ) {
		if ( val == 1 ) {
			nRet = self.askYesNo( "Tem certeza de que quer levar #b#t4031032##k com voc�?" );
			if ( nRet != 0 ) {
				ret = inventory.exchange( 0, 4031032, 1 );
				if ( ret == 0 ) self.say( "Seu invent�rio de etc. parece estar cheio. Por favor, libere espa�o para poder pegar o item." );
				else registerTransferField( 101000000, "" );
			}
		}
		else if ( val == 2 ) {
			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) and inventory.slotCount( 1 ) > inventory.holdCount( 1 ) ) {
				nNewItemID = 0;
				rnum = random( 1, 30 );
				if( rnum > 0 and rnum < 11 ) {
					nNewItemID = 4020007;
					itemNumber = 2;
				}
				else if( rnum > 10 and rnum < 21 ) {
					nNewItemID = 4020008;
					itemNumber = 2;
				}
				else if( rnum > 20 and rnum < 30 ) {
					nNewItemID = 4010006;
					itemNumber = 2;
				}
				else if ( rnum == 30 ) {
					nNewItemID = 1032013;
					itemNumber = 1;
				}

					ret = inventory.exchange( 0, nNewItemID, itemNumber );
					if ( ret == 0 ) self.say( "Seus invent�rios de equipamento e etc. est�o cheios, o que n�o permite que voc� aceite mais itens. Voc� precisa liberar espa�o no seu invent�rio de etc." );
					else registerTransferField( 101000000, "" );
			}
			else self.say( "Voc� precisa criar algum espa�o para seus invent�rios de equipamentos e etc., para que consiga colocar os itens que encontrar nas moitas de ervas. Por favor, confira novamente depois de fazer o ajuste." );
		}
		else self.say( "No meio das moitas de ervas voc� encontrar� ra�zes com uma energia misteriosa, mas, j� que n�o houve explica��es de #b#p1061005##k sobre elas, n�o tem como saber qual raiz pegar..." );
	}
	else self.say( "No meio das moitas de ervas, voc� encontrar� ra�zes com uma energia misteriosa, mas uma aura estranha ao redor delas torna imposs�vel a gente pegar." );
}

// taking the character out of the map of herbs
script "herb_out" {
	nRet = self.askYesNo( "Quer se mandar daqui? Bem... este lugar pode realmente te desgastar... T� acostumado, t� bem. De qualquer forma, lembre que, se voc� sair daqui atrav�s de mim, ter� de recome�ar a miss�o. Ainda quer ir?" );
	if ( nRet == 0 ) self.say( "N�o � horr�vel que voc� tenha que reiniciar toda a coisa? Continue tentando... quanto mais voc� explorar, melhor conhecer� todo este lugar. Logo logo voc� vai conseguir andar por aqui com os olhos fechados hehe." );
	else registerTransferField( 101000000, "" );
}

// letting the character into the map of herbs
script "herb_in" {
	qr = target.questRecord;
	val = qr.getState( 2050 );
	val2 = qr.getState( 2051 );

	if ( val2 == 0 ) {
		if ( val == 1 ) {
			nPrice = target.nLevel * 100;
			nRet = self.askYesNo( "Ent�o voc� veio para c� atentendo o pedido de #b#p1061005##k para pegar ervas medicinais? Bem... eu herdei esta terra do meu pai, e n�o posso deixar algum estranho aqui assim � toa... Mas, com #r" + nPrice + "#k mesos, a hist�ria � totalmente diferente... Ent�o, voc� quer pagar a entrada?" );
			if ( nRet == 0 ) self.say( "Entendo... mas entenda meu lado tamb�m, voc� n�o pode ficar aqui de gra�a." );
			else {
				inventory = target.inventory;
				ret = inventory.exchange( -nPrice );
				if ( ret == 0 ) self.say( "Por acaso est� faltando dinheiro? Veja se voc� tem mais de #r" + nPrice + "#k mesos na m�o. N�o espere que eu d� qualquer desconto." );
				else registerTransferField( 101000100, "" );
			}
		}
		else if ( val == 2 ) {
			self.say( "� voc� do outro dia... #p1061005# est� trabalhando duro no rem�dio diet�tico? De qualquer forma, fiquei meio surpreso por voc� percorrer este lugar sem dificuldade. Como recompensa, vou deixar voc� ficar um tempo sem pagar. Voc� pode at� mesmo encontrar alguns itens legais por l�, ao longo do caminho." );
			registerTransferField( 101000100, "" );
		}
		else self.say( "Quer entrar? Voc� deve ter ouvido que existem ervas medicinais preciosas aqui, �h? Mas n�o posso deixar um estranho como voc� por aqui, que nem sabe que eu possuo esta terra. Me desculpe, mas isso � tudo." );
	}
	else if ( val2 == 1 ) {
		nPrice = target.nLevel * 200;
		nRet = self.askYesNo( "� voc� do outro dia... #b#p1061005##k fez outro pedido para voc�? O qu�? Voc� precisa ficar mais tempo? Hummm... � muito perigoso l�, mas... tudo bem, por #r" + nPrice + "mesos te deixo vasculhar tudo. Ent�o, vai pagar pela entrada?" );
		if ( nRet == 0 ) self.say( "Entendo... mas entenda meu lado tamb�m, voc� n�o pode ficar aqui de gra�a." );
		else {
			inventory = target.inventory;
			ret = inventory.exchange( -nPrice );
			if ( ret == 0 ) self.say( "Por acaso est� faltando dinheiro? Veja se voc� tem mais de #r" + nPrice + "#k mesos na m�o. N�o espere que eu d� qualquer desconto." );
			else registerTransferField( 101000102, "" );
		}
	}
	else if ( val2 == 2 ) {
		self.say( "� voc� do outro dia... #p1061005# est� trabalhando duro no rem�dio antiidade? De qualquer forma, fiquei meio surpreso por voc� percorrer este lugar sem dificuldade. Como recompensa, vou deixar voc� ficar um tempo sem pagar. Voc� pode at� mesmo encontrar alguns itens legais por l�, ao longo do caminho." );
		self.say( "Ah sim... #p1032100#, desta cidade mesmo, tentou se esgueirar. Foi agarrado por mim e no processo deixou cair #p1032100# por l�. Tentei procurar, mas n�o fa�o id�ia de onde est�. Que acha de procurar?" );
		registerTransferField( 101000102, "" );
	}
	else self.say( "Quer entrar? Voc� deve ter ouvido que existem ervas medicinais preciosas aqui, �h? Mas n�o posso deixar um estranho aqui, que nem sequer sabe que eu possuo esta terra. Desculpe, mas acho que isso � tudo." );
}
