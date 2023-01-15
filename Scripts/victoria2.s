module "standard.s";

// Arwen and the glass shoes
script "owen" {
		if ( target.nJob != 0 and target.nLevel > 39 ) {
			inventory = target.inventory;
			self.say( "Sim... Sou o alquimista-chefe das fadas. S� que as fadas n�o entram em contato com um ser humano possivelmente por um longo per�odo de tempo... mas uma pessoa forte como voc� estar� bem. Se voc� conseguir os materiais, te fa�o um item especial." );
			v2 = self.askMenu( "O que voc� quer fazer? \r\n#b#L0##t4011007##l\r\n#L1##t4021009##l\r\n#L2##t4031042##l" );
			nNewItemID1 = "";
			if ( v2 == 0 ) {
				nRet = self.askYesNo( "Ent�o voc� quer fazer #t4011007#. Para isso, voc� precisa de um de cada um destes itens refinados: #b#t4011000#, #t4011001#, #t4011002#, #t4011003#, #t4011004#, #t4011005# e #t4011006##k. Manda a� 10.000 mesos e eu fa�o pra voc�." );
				if ( nRet == 0 ) self.say( "N�o � f�cil fazer #t4011007#. Por favor, consiga logo os materiais." );
				else {
					ret = inventory.exchange( -10000, 4011000, -1, 4011001, -1, 4011002, -1, 4011003, -1, 4011004, -1, 4011005, -1, 4011006, -1, 4011007, 1 );
					if ( ret == 0 ) self.say( "Tem certeza de que tem dinheiro suficiente? Por favor, verifique se voc� tem #b#t4011000#, #t4011001#, #t4011002#, #t4011003#, #t4011004#, #t4011005# e #t4011006##k refinados, um de cada." );
					else nNewItemID1 = "#t4011007#";
				}
			}
			else if ( v2 == 1 ) {
				nRet = self.askYesNo( "Ent�o voc� quer fazer #t4021009#? Para isso, voc� precisa de cada um destes, refinados: #b#t4021000#, #t4021001#, #t4021002#, #t4021003#, #t4021004#, #t4021005#, #t4021006#, #t4021007# e #t4021008##k. Manda a� 15.000 mesos e eu fa�o para voc�." );
				if ( nRet == 0 ) self.say( "N�o � f�cil fazer #t4021009#. Por favor, consiga logo os materiais." );
				else {
					ret = inventory.exchange( -15000, 4021000, -1, 4021001, -1, 4021002, -1, 4021003, -1, 4021004, -1, 4021005, -1, 4021006, -1, 4021007, -1, 4021008, -1, 4021009, 1 );
					if ( ret == 0 ) self.say( "Tem certeza de que tem dinheiro suficiente? Por favor, verifique se voc� tem #b#t4021000#, #t4021001#, #t4021002#, #t4021003#, #t4021004#, #t4021005#, #t4011006##k #, #t4021007# e #t4021008##k refinados, um de cada." );
					else nNewItemID1 = "#t4021009#";
				}
			}
			else if ( v2 == 2 ) {
				nRet = self.askYesNo( "Ent�o voc� quer fazer #t4031042# Para isso, voc� precisa de #b1#t4001006#, 1 #t4011007# e 1 #t4021008##k. Manda a� 30.000 mesos e eu fa�o pra voc�. Ah sim, esta pena � um item muito especial. Se por acaso voc� derrubar, ela vai desaparecer, al�m disso, voc� n�o pode pass�-la para ningu�m." );
				if ( nRet == 0 ) self.say( "N�o � f�cil fazer #t4031042#. Por favor, consiga logo os materiais." );
				else {
					ret = inventory.exchange( -30000, 4001006, -1, 4021008, -1, 4011007, -1, 4031042, 1 );
					if ( ret == 0 ) self.say( "Tem certeza de que tem dinheiro suficiente? Veja se voc� tem #b1 #t4001006#, 1 #t4011007# e 1 #t4021008##k prontos para mim." );
					else nNewItemID1 = "#t4031042#";
				}
			}
			if ( nNewItemID1 != "" ) self.say( "Legal, pegue aqui." + nNewItemID1 + ". T� muito bem feito, � importante usar bons materiais. Se um dia precisar da minha ajuda, conte comigo, t� bom?" );
		}
		else self.say( "Fa�o itens valorosos e raros, mas, infelizmente, n�o posso fazer para #Gum:uma# #Gestranho:estranha# como voc�." );
	}

// Mike
script "mike" {
	self.say( "Passe por aqui e voc� vai encontrar a Masmorra Central da Ilha Victoria. Tome cuidado..." );
	if ( target.nJob != 0 and target.nLevel > 44 ) {
		qr = target.questRecord;
		val = qr.getState( 2048 );
		if ( val == 1 ) {
			self.say( "Hummm... ent�o voc� quer saber como conseguir #b#t4021009##k, #b#t4003002##k, #b#t4001005##k e #b#t4001006##k? O que voc� planeja fazer com esses materiais preciosos? Ouvi falar... j� que estudei um pouco sobre a ilha antes de trabalhar como guarda..." );
			self.say( "#b#t4021009##k e #b#t4003002##k h�... Tenho sensa��o de que as fadas de #m101000000# devem saber alguma coisa sobre eles. � das fadas se realmente for o #t4003002# que nunca derrete, sobre o qual estamos falando... eles provavelmente est�o fazendo #t4003002# tamb�m." );
			self.say( "#b#t4001005##k e #b#t4001006##k s�o o problema. Os monstros provavelmente ter�o, uma vez que andaram por aqui durante um longo tempo... quanto a #t4001005#... Ah, sim! O Golem deve ter, j� que ele foi criado pelos bruxos h� muito tempo..." );
			self.say( "#b#t4001006##k ... J� ouvi falar disso, uma chama que lembra uma pena... tem alguma coisa a ver com um drag�o que sopra fogo, algo assim... de qualquer modo, � muito cruel, ent�o ser� dif�cil para voc� tirar #t4001006# dele. Boa sorte!" );
		}
	}
}

// The statue that lets the character in
script "flower_in" {
	qr = target.questRecord;
	val1 = qr.getState( 2052 );
	val2 = qr.getState( 2053 );
	val3 = qr.getState( 2054 );

	inventory = target.inventory;
	nFlower1 = inventory.itemCount( 4031025 );
	nFlower2 = inventory.itemCount( 4031026 );
	nFlower3 = inventory.itemCount( 4031028 );

	if ( val3 != 0 ) {
		if ( nFlower3 == 0 ) {
			nRet = self.askYesNo( "Quando coloco minha m�o na est�tua, uma luz esquisita me envolve, e sinto como se estivesse me sugando para algum lugar. T� tudo bem ser movido para um lugar imprevis�vel assim?" );
			if ( nRet == 0 ) self.say( "Quando tiro minha m�o da est�tua, ela fica inativa, como se nada tivesse acontecido." );
			else registerTransferField( 105040314, "" );
		}
		else self.say( "Eu coloquei minha m�o na est�tua, mas nada aconteceu. Deve ser por causa de #t4031028# que eu tenho, porque parece que s� interfere no poder da est�tua." );
	}
	else if ( val2 != 0 ) {
		if ( nFlower2 == 0 ) {
			nRet = self.askYesNo( "Quando coloco minha m�o na est�tua, uma luz esquisita me envolve, e sinto como se estivesse me sugando para algum lugar. T� tudo bem ser movido para um lugar imprevis�vel assim?" );
			if ( nRet == 0 ) self.say( "Quando tiro minha m�o da est�tua, ela fica inativa, como se nada tivesse acontecido." );
			else registerTransferField( 105040312, "" );
		}
		else self.say( "Eu coloquei minha m�o na est�tua, mas nada aconteceu. Deve ser por causa de #t4031026# que eu tenho, porque parece que s� interfere no poder da est�tua." );
	}
	else if ( val1 != 0 ) {
		if ( nFlower1 == 0 ) {
			nRet = self.askYesNo( "Quando coloco minha m�o na est�tua, uma luz esquisita me envolve, e sinto como se estivesse me sugando para algum lugar. T� tudo bem ser movido para um lugar imprevis�vel assim?" );
			if ( nRet == 0 ) self.say( "Quando tiro minha m�o da est�tua, ela fica inativa, como se nada tivesse acontecido." );
			else registerTransferField( 105040310, "" );
		}
		else self.say( "Eu coloquei minha m�o na est�tua, mas nada aconteceu. Deve ser por causa de #t4031025# que eu tenho, porque parece que s� interfere no poder da est�tua." );
	}
	else self.say( "Eu coloquei minha m�o na est�tua, mas nada aconteceu." );
}

// Pink Viola
script "viola_pink" {
	qr = target.questRecord;
	val = qr.getState( 2052 );

	inventory = target.inventory;

	if ( val == 0 ) self.say( "Muitas flores est�o florescendo por aqui, exceto aquela de #b#t4031025##k." );
	else if ( val == 2 ) {
		if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
			nNewItemID = 0;
			rnum = random( 0, 5 );
			if ( rnum == 0 ) nNewItemID = 4010000;
			else if( rnum == 1 ) nNewItemID = 4010001;
			else if( rnum == 2 ) nNewItemID = 4010002;
			else if( rnum == 3 ) nNewItemID = 4010003;
			else if( rnum == 4 ) nNewItemID = 4010004;
			else if( rnum == 5 ) nNewItemID = 4010005;
			ret = inventory.exchange( 0, nNewItemID, 2 );
			if ( ret == 0 ) self.say( "Seu invent�rio de etc. est� cheio, ent�o voc� n�o pode receber mais itens l�. Por favor, deixe pelo menos um slot vazio." );
			else registerTransferField( 105040300, "" );
		}
	}
	else {
		if ( inventory.itemCount( 4031025 ) == 0 ) {
			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
				ret = inventory.exchange( 0, 4031025, 10 );
				if ( ret == 0 ) self.say( "Desculpe, mas seu invent�rio de etc. est� cheio, ent�o voc� n�o pode guardar flores. Deixe pelo menos um slot vazio para as flores." );
				else registerTransferField( 105040300, "" );
			}
			else self.say( "Desculpe, mas seu invent�rio de etc. est� cheio, ent�o voc� n�o pode guardar flores. Deixe pelo menos um slot vazio para as flores." );
		}
		else self.say( "Muitos #b#t4031025##k est�o florescendo, mas voc� j� tem, ent�o n�o pode lev�-los por enquanto. Voc� precisa conseguir as flores com John de #m104000000#." );
	}
}

// Blue Viola
script "viola_blue" {
	qr = target.questRecord;
	val = qr.getState( 2053 );

	inventory = target.inventory;

	if ( val == 0 ) self.say( "Muitas flores est�o florescendo por aqui, exceto aquela de #b#t4031026##k." );
	else if ( val == 2 ) {
		if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
			nNewItemID = 0;
			rnum = random( 0, 6 );
			if( rnum == 0 ) nNewItemID = 4020000;
			else if( rnum == 1 ) nNewItemID = 4020001;
			else if( rnum == 2 ) nNewItemID = 4020002;
			else if( rnum == 3 ) nNewItemID = 4020003;
			else if( rnum == 4 ) nNewItemID = 4020004;
			else if( rnum == 5 ) nNewItemID = 4020005;
			else if( rnum == 6 ) nNewItemID = 4020006;
			ret = inventory.exchange( 0, nNewItemID, 2 );
			if ( ret == 0 ) self.say( "Seu invent�rio de etc. est� cheio, ent�o voc� n�o pode receber mais itens l�. Por favor, deixe pelo menos um slot vazio." );
			else registerTransferField( 105040300, "" );
		}
	}
	else {
		if ( inventory.itemCount( 4031026 ) == 0 ) {
			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
				ret = inventory.exchange( 0, 4031026, 20 );
				if ( ret == 0 ) self.say( "Desculpe, mas seu invent�rio de etc. est� cheio, ent�o voc� n�o pode guardar flores. Deixe pelo menos um slot vazio para as flores." );
				else registerTransferField( 105040300, "" );
			}
			else self.say( "Desculpe, mas seu invent�rio de etc. est� cheio, ent�o voc� n�o pode guardar flores. Deixe pelo menos um slot vazio para as flores." );
		}
		else self.say( "Muitos #b#t4031026##k est�o florescendo, mas voc� j� tem, ent�o n�o pode lev�-los por enquanto. Voc� precisa conseguir as flores com John de #m104000000#." );
	}
}

// White Viola
script "viola_white" {
	qr = target.questRecord;
	val = qr.getState( 2054 );

	inventory = target.inventory;

	if ( val == 0 ) self.say( "Muitas flores est�o florescendo por aqui, exceto aquela de #b#t4031028##k." );
	else if ( val == 2 ) {
		if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
			nNewItemID = 0;
			rnum = random( 0, 2 );
			if( rnum == 0 ) nNewItemID = 4010006;
			else if( rnum == 1 ) nNewItemID = 4020007;
			else if( rnum == 2 ) nNewItemID = 4020008;
			ret = inventory.exchange( 0, nNewItemID, 2 );
			if ( ret == 0 ) self.say( "Seu invent�rio de etc. est� cheio, ent�o voc� n�o pode receber mais itens l�. Por favor, deixe pelo menos um slot vazio." );
			else registerTransferField( 105040300, "" );
		}
	}
	else {
		if ( inventory.itemCount( 4031028 ) == 0 ) {
			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
				ret = inventory.exchange( 0, 4031028, 30 );
				if ( ret == 0 ) self.say( "Desculpe, mas seu invent�rio de etc. est� cheio, ent�o voc� n�o pode guardar flores. Deixe pelo menos um slot vazio para as flores." );
				else registerTransferField( 105040300, "" );
			}
			else self.say( "Desculpe, mas seu invent�rio de etc. est� cheio, ent�o voc� n�o pode guardar flores. Deixe pelo menos um slot vazio para as flores." );
		}
		else self.say( "Muitos #b#t4031028##k est�o florescendo, mas voc� j� tem, ent�o n�o pode lev�-los por enquanto. Voc� precisa conseguir as flores com John de #m104000000#." );
	}
}

// Leave the flower mission map
script "flower_out" {
	nRet = self.askYesNo( "Quando coloco minha m�o na est�tua, uma luz esquisita me envolve, e sinto como se estivesse me sugando para algum lugar. T� tudo bem voltar para #m105040300#?" );
	if ( nRet == 0 ) self.say( "Quando tiro minha m�o da est�tua, ela fica inativa, como se nada tivesse acontecido." );
	else registerTransferField( 105040300, "" );
}

// Pet Info
script "petmaster" {
	self.say( "Hummm... por acaso voc� est� educando um dos meus filhos? Eu aperfei�oei um feiti�o que usa #t5180000# para dar sopro de vida em um boneco. As pessoas chamam de #bBichinho#k. Se voc� tiver um, pode me perguntar o que quiser." );
	v1 = self.askMenu( "Sobre o que voc� quer saber mais? \r\n#b#L0# Me conte mais sobre Bichinhos. #l\r\n#L1# Como educar Bichinhos? #l\r\n#L2# Bichinhos morrem tamb�m? \r\n#b#L3# Quais s�o os comandos para os Gatinhos Marrom e Preto? \r\n#b#L4# Quais s�o os comandos para o Cachorrinho Marrom? \r\n#b#L5# Quais s�o os comandos para os Coelhinhos Rosa e Branco? \r\n#b#L6# Quais s�o os comandos para o Mini Kargo? \r\n#b#L7# Quais s�o os comandos para Rudolph, Dasher? \r\n#b#L8# Quais s�o os comandos para o Porco Preto? \r\n#b#L9# Quais s�o os comandos para o Panda? \r\n#b#L10# Quais s�o os comandos para o Husky? \r\n#b#L11# Quais s�o os comandos para Dino Boy, Dino Girl? \r\n#b#L12# Quais s�o os comandos para o Macaco? \r\n#b#L13# Quais s�o os comandos para o Peru? \r\n#b#L14# Quais s�o os comandos para o Tigre Branco? \r\n#b#15# Quais s�o os comandos para o Ping�im? \r\n#b#L16# Quais s�o os comandos para o Porco Dourado? \r\n#b#L17# Quais s�o os comandos para Rob�s? \r\n#b#L18# Quais s�o os comandos para o Mini Yeti? \r\n#b#L19# Quais s�o os comandos para o Balrog Jr.? \r\n#b#L20# Quais s�o os comandos para o Drag�o Beb�? \r\n#b#L21# Quais s�o os comandos para os Drag�es Verde, Vermelho, Azul? \r\n#b#L22# Quais s�o os comandos para o Drag�o Negro? \r\n#b#L23# Quais s�o os comandos para o Anjo da Morte? \r\n#b#L24# Quais s�o os comandos para o Porco-Espinho? \r\n#b#L25# Quais s�o os comandos para o Boneco de Neve? \r\n#b#L26# Por favor, me ensine como transferir pontos de habilidade dos bichinhos." );
	if ( v1 == 0 ) {
		self.say( "Ent�o voc� quer saber mais sobre bichinhos. H� muito tempo eu fiz um boneco, borrifei #t5180000# nele e lancei um encanto para criar um animal m�gico. Sei que parece inacredit�vel, mas s�o bonecos que se tornaram vivos de verdade. Entendem e obedecem muito bem �s pessoas." );
		self.say( "Mas #t5180000# s� aparece um pouco, bem na base da �rvore do Mundo, ent�o n�o posso lhe dar muito tempo de vida... Eu sei, � muito triste... mas, mesmo que ele se torne um boneco novamente, eu posso sempre traz�-lo de novo � vida. Seja legal enquanto estiver com ele." );
		self.say( "Ah sim! Eles ir�o reagir quando voc� der comandos especiais. Voc� pode dar bronca neles, dar carinho para eles... tudo depende de como voc� vai cuidar deles. Eles ficam com medo de se separar dos seus donos, ent�o seja legal com eles, mostre que os ama. Eles podem de repente ficar tristes..." );
	}
	else if ( v1 == 1 ) {
		self.say( "Dependendo do comando que voc� der, os bichinhos podem adorar, odiar e demonstrar outros tipos de rea��es. Se voc� der um comando e o bichinho obedecer direitinho, a intimidade aumenta. Dando dois cliques no bichinho voc� pode ver intimidade, n�vel, energia, etc." );
		self.say( "Converse com o bichinho, preste aten��o nele, e seu n�vel de intimidade ir� crescer. Eventualmente, seu n�vel geral ir� subir tamb�m. Se o n�vel de intimidade aumentar, o n�vel geral do bichinho ir� aumentar logo depois. � medida que o n�vel geral aumenta, um dia o bichinho pode at� mesmo falar um pouquinho, como uma pessoa. Ent�o tente aumentar pra valer! � claro que n�o ser� t�o f�cil..." );
		self.say( "Podem ser s� bonecos vivos, mas eles t�m uma vida normal, como n�s. Ent�o eles sentem fome tamb�m. A #bEnergia#k mostra o n�vel de fome do bichinho. 100 � o m�ximo e, quanto mais baixo fica, significa que o bichinho est� ficando com fome. Depois de um tempo ele nem mesmo vai obedecer a seus comandos e ficar� agressivo, ent�o tome cuidado com isso." );
		self.say( "Ah sim! Os bichinhos n�o podem comer comida de gente. Meu disc�pulo #b#p1012004##k vende #b#t2120000##k no mercado #m100000000#. Se voc� precisar de comida para seu bichinho, procure #m100000000#. � uma boa id�ia manter um estoque de comida e alimentar seu bichinho antes que ele fique com muita fome." );
		self.say( "Ah... e se voc� n�o alimentar o bichinho por um longo per�odo de tempo, ele volta para casa por si mesmo. Voc� pode tir�-lo da sua casa e aliment�-lo, mas isso n�o � nada bom para a sa�de dele. Tente aliment�-lo regularmente, assim ele n�o chega a esse n�vel, t� bom? Eu acho que vai fazer isso." );
	}
	else if ( v1 == 2 ) {
		self.say( "Morrendo... bem, eles n�o s�o tecnicamente VIVOS, ganharam vida por influ�ncia alheia, ent�o n�o sei se morte � o termo correto. S�o bonecos com meu poder m�gico, e o poder de #t5180000# torna objetos vivos. � claro que, enquanto vivos, eles s�o como um animal normal..." );
		self.say( "Depois de algum tempo... isto � certo, eles param de se mexer. Eles simplesmente voltam a ser bonecos ap�s o efeito da magia enfraquecer e #t5180000# se esgotar. Mas n�o significa que parou para sempre, porque, se voc� derramar #t5180000# nele, ele voltar� a ser vivo." );
		self.say( "Mesmo que voltem a se mover, � triste v�-los totalmente parados. Seja am�vel com eles enquanto eles forem vivos, t� bom? Alimente-os bem, tamb�m. N�o � legal saber que h� algo vivo que te faz companhia e obedece s� a voc�?" ); 
	}
	else if ( v1 == 3 ) {
		self.say( "Estes s�o os comandos para o #rGatinho Marrom e Gatinho Preto#k. O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#b senta#k (n�vel 1 ~ 30) \r\n#b mau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#b est�pido, te odeio, bob�o#k (n�vel 1 ~ 30) \r\n#b te amo#k (n�vel 1 ~ 30) \r\n#b faz coc�#k (n�vel 1 ~ 30) \r\n#b fala, diz, bate papo#k (n�vel 10 ~ 30) \r\n#b gracinha#k (n�vel 10 ~ 30) \r\n#b em p�, fica, sobe#k (n�vel 20 ~ 30)" );
	}
	else if ( v1 == 4 ) {
		self.say( "Estes s�o os comandos para o #rCachorrinho Marrom#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#b senta#k (n�vel 1 ~ 30) \r\n#b mau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#b est�pido, te odeio, bob�o#k (n�vel 1 ~ 30) \r\n#b te amo#k (n�vel 1 ~ 30) \r\n#b faz xixi#k (n�vel 1 ~ 30) \r\n#b fala, diz, bate papo#k (n�vel 10 ~ 30) \r\n#bdeita#k (n�vel 10 ~ 30) \r\n#b em p�, fica, sobe#k (n�vel 20 ~ 30)" );
	}
	else if ( v1 == 5 ) {
		self.say( "Estes s�o os comandos para o #rCoelhinho Rosa e Coelhinho Branco#k. O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#b mau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bem p�, fica, sobe#k (n�vel 1 ~ 30) \r\n#b te amo#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#b fala, diz, bate papo#k (n�vel 10 ~ 30) \r\n#babra�a#k (n�vel 10 ~ 30) \r\n#bdorme, com sono, vai para a cama#k (n�vel 20 ~ 30)" );
	}
	else if ( v1 == 6 ) {
		self.say( "Estes s�o os comandos para o #rMini Kargo#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#b mau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bem p�, fica, sobe#k (n�vel 1 ~ 30) \r\n#b te amo#k (n�vel 1 ~ 30) \r\n#bfaz xixi#k (n�vel 1 ~ 30) \r\n#b fala, diz, bate papo#k (n�vel 10 ~ 30) \r\n#baquele olhar, carisma#k (n�vel 10 ~ 30) \r\n#bdeita#k (n�vel 20 ~ 30) \r\n#bbom garoto, boa garota#k (n�vel 20 ~ 30)" );
	}
	else if ( v1 == 7 ) {
 		self.say( "Estes s�o os comandos para #rRudolph, Dasher#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#bmau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bem p�, fica#k (n�vel 1 ~ 30) \r\n#b est�pido, te odeio, bob�o#k (n�vel 1 ~ 30) \r\n#bfeliz natal#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bfala, diz, bate papo#k (n�vel 11 ~ 30) \r\n#bsolit�rio, sozinho#k (n�vel 11 ~ 30) \r\n#bgracinha#k (n�vel 11 ~ 30) \r\n#bcorre, vai#k (n�vel 21 ~ 30)" );
	}
	else if ( v1 == 8 ) {
 		self.say( "Estes s�o os comandos para o #rPorquinho Preto#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#b mau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bd� a m�o#k (n�vel 1 ~ 30) \r\n#best�pido, te odeio, bob�o#k (n�vel 1 ~ 30) \r\n#bconversa, bate papo, diz#k (n�vel 10 ~ 30) \r\n#bsorria#k (n�vel 10 ~ 30) \r\n#baquele olhar, carisma#k (n�vel 20 ~ 30)" );
	}
	else if ( v1 == 9 ) {
 		self.say( "Estes s�o os comandos para o #rPanda#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#bacalma, relaxa#k (n�vel 1 ~ 30) \r\n#bmau, n�o, garota m�, garoto mau#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bem p�, fica, sobe#k (n�vel 1 ~ 30) \r\n#bconversa, bate papo, diz#k (n�vel 10 ~ 30) \r\n#bvamos brincar#k (n�vel 10 ~ 30) \r\n#bm��, bl��#k (n�vel 10 ~ 30) \r\n#bdorme#k (level 20 ~ 30)" );
  	}
	else if ( v1 == 10 ) {
 		self.say( "Estes s�o os comandos para o #rHusky#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#b senta#k (n�vel 1 ~ 30) \r\n#bmau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#best�pido, te odeio, bob�o#k (n�vel 1 ~ 30) \r\n#bd� a m�o#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bdeita#k (n�vel 10 ~ 30) \r\n#bfala, bate papo, diz#k (n�vel 10 ~ 30) \r\n#bem p�, fica, sobe#k (n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 11 ) {
		self.say( "Estes s�o os comandos para #rDino Boy, Dino Girl#k. O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#b mau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bsorria, ria#k (n�vel 1 ~ 30) \r\n#best�pido, te odeio, bob�o#k (n�vel 1 ~ 30) \r\n#bconversa, bate papo, diz#k (n�vel 10 ~ 30) \r\n#bgracinha#k (n�vel 10 ~ 30) \r\n#bdorme, cochila, com sono#k (n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 12 ) {
		self.say( "Estes s�o os comandos para o #rMacaco#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#bdescansa#k (n�vel 1 ~ 30) \r\n#bmau, n�o, garota m�, garoto mau#k (n�vel 1 ~ 30) \r\n#bfaz xixi#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bem p�, fica#k (n�vel 1 ~ 30) \r\n#bconversa, bate papo, diz#k (n�vel 10 ~ 30) \r\n#bbrinca#k (n�vel 10 ~ 30) \r\n#bmelong#k (n�vel 10 ~ 30) \r\n#bdorme, vai para a cama, com sono#k (level 20 ~ 30)" );
  	}

	else if ( v1 == 13 ) {
		self.say( "Estes s�o os comandos para o #rPeru#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#bn�o, mal-educado, travesso#k (n�vel 1 ~ 30) \r\n#best�pido#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bem p�, fica#k (n�vel 1 ~ 30) \r\n#bfala, diz, faz glu glu#k (n�vel 10 ~ 30) \r\n#bsim, bom garoto#k (n�vel 10 ~ 30) \r\n#bcom sono, cochilo de ave, soneca#k (n�vel 20 ~ 30) \r\n#bolho de ave, a��o de gra�as, voa, ave frita, com fome#k (n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 14 ) {
		self.say( "Estes s�o os comandos para o #rTigre Branco#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#bmau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bdescansa, acalma#k (n�vel 1 ~ 30) \r\n#best�pido, te odeio, bob�o#k (n�vel 1 ~ 30) \r\n#bconversa, bate papo, diz#k (n�vel 10 ~ 30) \r\n#btriste, olhar triste#k (n�vel 10 ~ 30) \r\n#bespera#k (n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 15 ) {
		self.say( "Estes s�o os comandos para o #rPing�im#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#bmau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bem p�, fica, sobe#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bconversa, bate papo, diz#k (n�vel 10 ~ 30) \r\n#babra�a, me abra�a#k (n�vel 10 ~ 30) \r\n#bd� a asa, d� a m�o#k (n�vel 10 ~ 30) \r\n#bdorme#k (n�vel 20 ~ 30) \r\n#bbeija, beijoca, mu���#k (n�vel 20 ~ 30) \r\n#bvoa#k (n�vel 20 ~ 30) \r\n#bbonito, fofo#k (n�vel 20 ~ 30)" );
  	}
	else if ( v1 == 16 ) {
		self.say( "Estes s�o os comandos para o #rPorco Dourado#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#b mau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bconversa, bate papo, diz#k (n�vel 11 ~ 30) \r\n#bme ama, me abra�a#k (n�vel 11 ~ 30) \r\n#bdorme, com sono, vai para a cama#k (n�vel 21 ~ 30) \r\n#bignora, impressionado, fora daqui#k (n�vel 21 ~ 30) \r\n#brola, mostra a grana#k (n�vel 21 ~ 30)" );
  	}
	else if ( v1 == 17 ) {
		self.say( "Estes s�o os comandos para o #rRob�#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#b senta#k (n�vel 1 ~ 30) \r\n#bem p�, fica, sobe#k (n�vel 1 ~ 30) \r\n#best�pido, te odeio, bob�o#k (n�vel 1 ~ 30) \r\n#bmau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bataca, carrega#k (n�vel 1 ~ 30) \r\n#bte amo#k (n�vel 1 ~ 30) \r\n#bbom, aquele olhar, carisma#k (n�vel 11 ~ 30) \r\n#bdiscursa, fala, bate papo, diz#k (n�vel 11 ~ 30) \r\n#bdisfar�a, muda, transforma#k (n�vel 11 ~ 30)" );
  	}
	else if ( v1 == 18 ) {
		self.say( "Estes s�o os comandos para o #rMini Yeti#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#b mau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bdan�a, agita, sacode#k (n�vel 1 ~ 30) \r\n#bbonito, gracinha, lindo, fofo#k (n�vel 1 ~ 30) \r\n#bte amo, te gosto, meu amor#k (n�vel 1 ~ 30) \r\n#bconversa, bate papo, diz#k (n�vel 11 ~ 30) \r\n#bdorme, cochila, com sono, vai para a cama#k (n�vel 11 ~ 30)" );
  	}
	else if ( v1 == 19 ) {
		self.say( "Estes s�o os comandos para o #rBalrog Jr.#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bdeita#k (n�vel 1 ~ 30) \r\n#bn�o|mau|menina m�|menino mau#k (n�vel 1 ~ 30) \r\n#bte amo|meu amor|te gosto#k (n�vel 1 ~30) \r\n#bbonito|gracinha|lindo|fofo#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#bsorriso amarelo|risinho|ria#k (n�vel 1 ~ 30) \r\n#bmelong#k (n�vel 11 ~ 30) \r\n#bbom|aquele olhar|carisma#k (n�vel 11 ~ 30) \r\n#bfala|conversa|bate papo|diz#k (n�vel 11 ~ 30) \r\n#bdorme|cochila|com sono#k (n�vel 11 ~ 30) \r\n#btagarela#k (n�vel 21 ~ 30)" );
	}
	else if ( v1 == 20 ) {
		self.say( "Estes s�o os comandos para o #rDrag�o Beb�#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#bn�o | mau | menina m� | menino mau#k (n�vel 1 ~ 30) \r\n#bte amo | amo voc�#k (n�vel 1 ~ 30) \r\n#bfaz coc�#k (n�vel 1 ~ 30) \r\n#best�pido | te odeio | bob�o#k (n�vel 1 ~ 30) \r\n#bgracinha#k (n�vel 11 ~ 30) \r\n#bconversa | bate papo | diz#k (n�vel 11 ~ 30) \r\n#bdorme | com sono | vai para a cama#k (n�vel 11 ~ 30)" );
	}
	else if ( v1 == 21 ) {
		self.say( "Estes s�o os comandos para o #rDrag�o Verde/Vermelho/Azul#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 15 ~ 30) \r\n#bn�o | mau | menina m� | menino mau#k (n�vel 15 ~ 30) \r\n#bte amo | amo voc�#k (n�vel 15 ~ 30) \r\n#bfaz coc�#k (n�vel 15 ~ 30) \r\n#best�pido | te odeio | bob�o#k (n�vel 15 ~ 30) \r\n#bconversa | bate papo | diz#k (n�vel 15 ~ 30) \r\n#bdorme | com sono | vai para a cama#k (n�vel 21 ~ 30)" );
	}
	else if ( v1 == 22 ) {
		self.say( "Estes s�o os comandos para o #rDrag�o Negro#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 15 ~ 30) \r\n#bn�o | mau | menina m� | menino mau#k (n�vel 15 ~ 30) \r\n#bte amo | amo voc�#k (n�vel 15 ~ 30) \r\n#bfaz coc�#k (n�vel 15 ~ 30) \r\n#best�pido | te odeio | bob�o#k (n�vel 15 ~ 30) \r\n#bconversa | bate papo | diz#k (n�vel 15 ~ 30) \r\n#bdorme | com sono | vai para a cama#k (n�vel 15 ~ 30) )\r\n#bgracinha | muda#k(n�vel 21 ~ 30)" );
	}
	else if ( v1 == 23 ) {
		self.say( "Estes s�o os comandos para o #rAnjo da Morte Jr.#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#bn�o | mau | menina m� | menino mau#k (n�vel 1 ~ 30) \r\n#bfinge de morto | faz coc�#k (n�vel 1 ~ 30) \r\n#bconversa | bate papo | diz#k (n�vel 1 ~ 30) \r\n#bte amo | abra�o#k (n�vel 1 ~ 30) \r\n#bcheira meus p�s | dan�a rock | buuu#k (n�vel 1 ~ 30) \r\n#btravessuras ou gostosuras#k (n�vel 1 ~ 30) \r\n#bpir�o de monstro#k (n�vel 1 ~ 30)" );
	}
	else if ( v1 == 24 ) {
		self.say( "Estes s�o os comandos para o #rPorco-Espinho#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#bn�o | mau | menina m� | menino mau#k (n�vel 1 ~ 30) \r\n#bte amo | abra�o | bom garoto#k (n�vel 1 ~ 30) \r\n#bconversa | bate papo | diz#k (n�vel 1 ~ 30) \r\n#btravesseiro | dorme tricota | faz coc�#k (n�vel 1 ~ 30) \r\n#bpenteia | praia #k (n�vel 10 ~ 30) \r\n#b�rvore ninja#k (n�vel 20 ~ 30) \r\n#bdardo#k (n�vel 20 ~ 30)" );
	}
	else if ( v1 == 25 ) {
		self.say( "Estes s�o os comandos para o #rBoneco de Neve#k O n�vel exibido pr�ximo ao comando mostra o n�vel em que o bichinho precisa estar para que responda. \r\n#bsenta#k (n�vel 1 ~ 30) \r\n#best�pido, te odeio, bob�o#k (n�vel 1 ~ 30) \r\n#bte amo, meu amor, te gosto#k (n�vel 1 ~ 30) \r\n#bfeliz natal#k (n�vel 1 ~ 30) \r\n#bgracinha, fofo, bonito, lindo#k (n�vel 1 ~ 30) \r\n#bpenteia, praia / mau, n�o, menina m�, menino mau#k (n�vel 1 ~ 30) \r\n#bconversa, bate papo, diz / dorme, com sono, vai para a cama#k (n�vel 10 ~ 30) \r\n#bmuda#k (n�vel 20 ~ 30)" );
	}
	else if ( v1 == 26 ) {
		self.say( "Para transferir pontos de habilidade, proximidade e n�vel dos bichinhos � exigido o Pergaminho de Zerar PH do bicho. Se voc� levar este pergaminho para a Fada Mar, em Ellinia, ela ir� transferir o n�vel e a proximidade do bichinho para outra pessoa. Estou dando isto para voc�, sobretudo, porque posso sentir seu amor pelo seu bichinho. Entretanto, n�o posso distribuir isto de gra�a. Posso te entregar este livro por 250.000 mesos. Ah, quase esqueci! Mesmo tendo este livro, ele n�o ser� �til se voc� n�o tiver um novo bichinho para transferir os pontos de habilidade." );
		nRet = self.askYesNo( "Ser�o deduzidos 250.000 mesos. Voc� realmente quer comprar?" );
		if ( nRet != 0 ) {
			inventory = target.inventory;
			ret = inventory.exchange( -250000, 4160011, 1 );
			if ( ret == 0 ) self.say( "Por favor, veja se o seu invent�rio tem slot vazio ou voc� n�o tem dinheiro suficiente." );
		}
	}
	
}

// Extending pet's life
script "pet_life" {
	qr = target.questRecord;
	val = qr.getState( 2049 );

	inventory = target.inventory;
	v1 = self.askMenu( "Sou Mar, a fada. Posso reviver o bichinho ou transferir EXP existente para um outro. \r\n#b#L0# Quero que o boneco vire meu bichinho de novo. #l\r\n#L1# Quero transferir a EXP existente do meu bichinho para um novo bichinho.#l\r\n#k" );
	
	if ( v1 == 0 ) {
		isPet = self.askPet( "" );
		if ( isPet != "" ) {
			if ( val == 0 or val == 2 ) {
				self.say( "Prazer em conhecer! Sou #p1032102# e estudo v�rios tipos de feiti�os aqui em #m101000000#. Sou especialmente fascinada pela magia da vida. O mist�rio que n�o tem fim, o mist�rio conhecido como vida... T� tentando descobrir como criar vida." );
				nRet1 = self.askYesNo( "Parece que voc� j� encontrou #p1012005#. #p1012005# � uma pessoa que estudava a magia da vida comigo. Ouvi dizer que ele usou uma magia da vida incompleta em um boneco para criar um animal com vida... O boneco que voc� tem � o mesmo que #p1012005# criou, chamado de #bBichinho#k?" );
				if ( nRet1 == 0 ) self.say( "Mas ele se parece com o feito por #p1012005#, com certeza. Ah... bem, deixa pra l�. Tenho visto #p1012005# h� anos e estou segura de que ele n�o pode obter sucesso na magia de vida para bonecos. Bem, ent�o..." );
				else {
					self.say( "Entendo. O boneco chegou a ser um bicho vivo... mas o mesmo item que #p1012005# usou para dar vida para o bichinho, #b#t5180000##k esgotou e assim voltou a ser boneco... obviamente n�o est� se mexendo, j� que � um boneco agora... hummm... essa coisa � chamada de vida realmente, n�o alguma coisa que voc� pode criar com magia...?" );
					self.say( "Voc� quer trazer de volta o boneco como era, com vida? Voc� quer voltar ao tempo em que seu bichinho lhe obedecia, somente a voc�, e lhe fazia companhia, n�? Claro, � totalmente poss�vel. Uma vez que sou a Fada que estudou a magia da vida com #p1012005#... Talvez eu possa fazer com que se mexa de novo..." );
//					nRet2 = self.askYesNo( "Se eu conseguir #b#t5180000##k e #b#t5180000##k, talvez possa trazer o boneco de novo � vida. O que voc� acha? Voc� quer reunir os itens? Traga os itens e eu tentarei fazer seu boneco reviver..." );
					nRet2 = self.askYesNo( "Se eu conseguir uma #b#t5180000##k e um #b#t4031034##k, talvez possa trazer o boneco de novo � vida. O que voc� acha? Voc� quer reunir os itens? Traga os itens e eu tentarei fazer seu boneco reviver..." );
					if ( nRet2 == 0 ) self.say( "Quer deixar o boneco como ele �? � um boneco e tudo, mas... ser� dif�cil apagar sua mem�ria com isto tamb�m. Se voc� se arrepender, me procura, t�?" );
					else {
						qr.set( 2049, "" );
//						self.say( "Muito bem. Vou dizer de novo, mas o que eu preciso � de #b#t5180000##k e #b#t5180000##k. Consiga-os e eu posso trazer o boneco de volta � vida. #b#t4031034##k � o mais dif�cil de conseguir... o que acha de procurar #b#t4031034##k, de #b#t4031034##k? Talvez essa pessoa d� uma ou duas dicas..." );
						self.say( "Muito bem. Vou dizer de novo, mas o que eu preciso � de uma #b#t5180000##k e um #b#t4031034##k. Consiga-os e eu posso trazer o boneco de volta � Cida.O #b#t4031034##k � o mais dif�cil de conseguir... o que acha de procurar o #b#p1012006##k, de #bHenesys#k? Talvez essa pessoa d� uma ou duas dicas..." );
					}
				}
			}
			else if ( val == 1 ) {
				inventory = target.inventory;
				if ( inventory.itemCount( 5180000 ) > 0 and inventory.itemCount( 4031034 ) > 0 ) {
					//nRet3 = self.askYesNo( "Voc� comprou #b#t4031034##k e #b#t4031034##k... com eles eu posso trazer o boneco de volta � vida com meu poder m�gico. O que voc� acha? Voc� quer usar os itens e despertar seu bichinho...?" );
					nRet3 = self.askYesNo( "Voc� comprou a #b#t5180000##k e #b#t4031034##k... Com eles eu posso trazer o boneco de volta � vida com meu poder m�gico. O que voc� acha? Voc� quer usar os itens e despertar seu bichinho...?" );
					if ( nRet3 == 0 ) self.say( "Entendo... voc� n�o t� 100% pronto pra isso, n�? Voc� n�o t� pensando em deixar esse bichinho como boneco, certo? Por favor, volte se mudar de opini�o..." );
					else {
						petCode = self.askPet( "Ent�o, qual bichinho voc� quer recuperar? Escolha o bichinho que voc� mais quer vivo..." );
						okPet = inventory.setPetLife( petCode, 5180000, 4031034 );
						if ( okPet == 0 ) self.say( "Alguma coisa n�o est� certa... voc� tem certeza de que tem #b#t5180000##k e #b#t4031034##k? Sem esses dois eu n�o posso fazer o boneco voltar a ser bichinho." );
						else {
							qr.setComplete( 2049 );
							self.say( "Seu boneco agora voltou a ser seu bichinho. Entretanto, minha magia n�o � perfeita. Assim, n�o posso prometer vida eterna... por favor cuide bem desse bichinho antes que #t5180000# esgote. Bem, ent�o... tchau..." );
						}
					}
				}
				else self.say( "Ainda n�o conseguiu #b#t5180000##k e #b#t4031034##k, certo? V� ver #b#p1012006##k, de #m100000000#, essa pessoa deve saber sobre o pergaminho. Por favor, re�na esses itens rapidamente..." );
			}
		}
		else {
			if ( val == 2 ) self.say( "Oi... como est� o bichinho com essa nova vida? Me sinto muito bem ao ver voc� feliz com seu bichinho. Bem, ent�o... terei de voltar para os meus estudos..." );
			else self.say( "Oi, sou #p1032102# e estudo v�rios tipos de feiti�os aqui em #m101000000#. Tenho estudado a magia da vida por centenas de anos, mas isso n�o tem fim... Bem, ent�o terei de voltar aos meus estudos..." );
		}
	}
	else if ( v1 == 1 ) {
		isPet = self.askPetAllExcept( "", "" );
		if ( isPet != "" and inventory.itemCount( 4160011 ) > 0 ) {
			petCode = self.askPetAllExcept( "Ent�o voc� quer transferir a proximidade existente do seu bichinho? Se voc� fizer isso, a proximidade e o n�vel do seu bichinho ficar�o em 0, e o novo bichinho ficar� com a proximidade e o n�vel dele. Por favor, escolha o bichinho para o qual voc� deseja transferir sua proximidade.", "" );
			petCode2 = self.askPetAllExcept( "� hora de transferir a proximidade do bichinho escolhido para o novo bichinho. Por favor, escolha o novo bichinho.", petCode );
			nRet4 = self.askYesNo( "Agora a magia vai come�ar. Tem certeza de que voc� quer fazer esta transfer�ncia?" );
			if ( nRet4 != 0 ) {
				okPet = inventory.movePetStat( petCode, petCode2, 4160011 );
				if ( okPet == 0 ) self.say( "A proximidade do bichinho foi transferida com sucesso." );
				else if ( okPet == 1 ) self.say( "Por favor, veja se voc� tem o item apropriado." );
				else if ( okPet == 2 ) self.say( "A proximidade do novo bichinho parece ser mais alta do que a do bichinho existente. Verifique novamente." );
			}
		}
		else {
			self.say( "Eu n�o acho que voc� tem #t4160011# ou um bichinho para a proximidade ser transferida...  Cloy de Henesys definitivamente saberia sobre #t4160011#..." );
		}
	}
	
}	

// Giving the item that extends the life of the pet
script "pet_lifeitem" {
	qr = target.questRecord;
	val = qr.getState( 2049 );

	isPet = self.askPet( "" );

//	v = self.askMenu( "Voc� tem algum neg�cio comigo? \r\n#b#L0#Me fale sobre este lugar. #l\r\n#L1#Estou aqui por causa da fama/promessa/ordem de #l\r\n#L1#...#l" );
	v = self.askMenu( "Voc� tem algum neg�cio comigo? \r\n#b#L0#Me fale sobre este lugar. #l\r\n#L1#Estou aqui por causa do Pergaminho da Vida. #l\r\n#L1#...#l" );
	if ( v == 0 ) {
		inventory = target.inventory;
		if ( inventory.itemCount( 4031035 ) > 0 ) self.say( "Pegue aquela carta, pule sobre os obst�culos com o seu bichinho e leve a carta para o meu irm�o #p1012007#. Leve a carta para ele e algo bom vai acontecer ao seu bichinho." );
		else {
			nRet = self.askYesNo( "Esta � uma rua onde voc� pode passear com o seu bichinho. Voc� pode s� andar pela rua ou pode treinar seu bichinho para passar por obst�culos. Se voc� ainda n�o se sente bem pr�ximo do seu bichinho, pode ser um problema, pois ele n�o ir� lhe obedecer muito... ent�o, o que voc� acha? Quer adestrar o seu bichinho?" );
			if ( nRet == 0 ) self.say( "Hummm... muito #Gocupado:ocupada# para fazer isso agora? De qualquer forma, se quiser, volte e me procure." );
			else {
				ret = inventory.exchange( 0, 4031035, 1 );
				if ( ret == 0 ) self.say( "Seu invent�rio de etc. est� cheio! N�o posso te dar a carta a menos que haja espa�o no seu invent�rio. Deixe um slot livre e ent�o fale comigo." );
				else self.say( "Certo, aqui est� a carta. Ele n�o saberia que eu te enviei se voc� fosse para l� direto. Passe pelos obst�culos com seu bichinho, v� bem para o topo e ent�o fale com #p1012007# para lhe dar a carta. N�o ser� dif�cil se voc� prestar aten��o no seu bichinho enquanto passa pelos obst�culos. Boa sorte!" );
			}
		}
	}
	else if ( v == 1 ) {
		if ( isPet != "" and val == 1 ) {
			inventory = target.inventory;
			if ( inventory.itemCount( 4031034 ) > 0 ) self.say( "Hummm... voc� j� tem #b#t4031034##k. Leve este pergaminho para #b#p1032102##k de #m101000000#." );
			else {
				self.say( "Voc� est� aqui com o #bbichinho#b que n�o se mexe#k? � triste ver... �h? Voc� veio aqui atrav�s de #b#p1032102##k? Entendo... #b#t4031034##k, �h... ei ei~ como se eu realmente tivesse comigo... o que, o que � isto no meu bolso?" );
				self.say( "Uau!!! �... isto � #b#t4031034##k? Ah, certo... #p1012005# provavelmente se apropriou das minhas roupas e se mandou ou algo assim... droga! Eu disse para ele n�o ir simplesmente pegando roupas dos outros e vestindo... Bem, n�o � meu de qualquer forma... voc� precisa disto? Humm..." );
				nRet1 = self.askYesNo( "N�o acho que eu possa simplesmente dar pra voc�! Preciso testar seu conhecimento sobre bichinhos em geral. Horr�vel para um bichinho se seu dono nem mesmo souber cuidar dele. Voc� precisa acertar tudo ou n�o pegar� o pergaminho. O que voc� acha? Quer fazer o teste?" );
				if ( nRet1 == 0 ) self.say( "Qu�?! J� est� desistindo? Se voc� tivesse criado bem seu bichinho, isso seria moleza! Me procure quando mudar de id�ia." );
				else {
					self.say( "Certo! 5 perguntas e voc� precisa responder a todas da forma correta! T� pronto? L� vai!" );
					v1 = self.askMenu( "Pergunta 1) Em qual cidade est� #p1012004#, a pessoa que vende #t2120000# de \r\n#b#L0# #m104000000##l\r\n#L1# #m100000000##l\r\n#L2# #m102000000##l\r\n#L3# #m101000000##l\r\n#L4# #m103000000##l\r\n#L5# #m105040300##l" );
					if ( v1 == 0 or v1 == 2 or v1 == 3 or v1 == 4 or v1 == 5 ) self.say( "Errado! Voc� n�o sabe muito mesmo... voc� realmente criou um bichinho? � horr�vel!" );
					else if ( v1 == 1 ) {
						v2 = self.askMenu( "Pergunta 2) Haha... foi s� pra praticar! Certo, ent�o... dentre estas pessoas, escolha algu�m que n�o tem nada a ver com bichinhos. \r\n#b#L0# #p1032102##l\r\n#L1# #p1012005##l\r\n#L2# #p1012101##l" );
						if ( v2 == 0 or v2 == 1 ) self.say( "Errado! Voc� n�o sabe muito mesmo... voc� realmente criou um bichinho? � horr�vel!" );
						else if ( v2 == 2 ) {
							v3 = self.askMenu( "Pergunta 3) Muito f�cil, n�? Certo, dentre estas descri��es sobre bichinhos, escolha a que n�o faz sentido. \r\n#b#L0#Para dar nome para um bichinho, voc� precisa do item batismo de bichinho. #l\r\n#L1#Quando voc� d� um comando para o bichinho e ele obedece, algumas vezes o n�vel de intimidade cresce. #l\r\n#L2#N�o alimente bem o bichinho, e o n�vel de intimidade abaixa. #l\r\n#L3#Bichinhos podem atacar monstros com seus donos.#k#l" );
							if ( v3 == 0 or v3 == 1 or v3 == 2 ) self.say( "Errado! Voc� n�o sabe muito mesmo... voc� realmente criou um bichinho? � horr�vel!" );
							else if ( v3 == 3 ) {
								v4 = self.askMenu( "Pergunta 4) Faltam duas! Bem, em qual n�vel os bichinhos come�am a usar frases humanas? \r\n#L0##e1. #n#bN�vel 5 #k#l\r\n#L1##e2. #n#bN�vel 10 #k#l\r\n#L2##e3. #n#bN�vel 15 #k#l\r\n#L3##e4. #n#bN�vel 20#k#l" );
								if ( v4 == 0 or v4 == 2 or v4 == 3 ) self.say( "Errado! Voc� n�o sabe muito mesmo... voc� realmente criou um bichinho? � horr�vel!" );
								else if ( v4 == 1 ) {
									v5 = self.askMenu( "Pergunta 5) �ltima pergunta! #p1012004# de #m100000000# vende #t2120000#. Quanto aumenta o n�vel da energia? ?\r\n#b#L0# 10#l\r\n#L1# 20#l\r\n#L2# 30#l\r\n#L3# 40#l" );
									if ( v5 == 0 or v5 == 1 or v5 == 3 ) self.say( "Ah, n�o!!! Que desperd�cio! � a �ltima pergunta! N�o desista!" );
									else {
										self.say( "Certo! Hummm... voc� sabe bastante sobre bichinhos. Legal, j� que voc� sabe um monte, te dou o pergaminho com satisfa��o. Eu sei que n�o � meu e tudo mais, mas... quem � que vestiria roupas de outra pessoa e deixaria algo t�o importante nelas? L� vai!" );
										inventory = target.inventory;
										ret = inventory.exchange( 0, 4031034, 1 );
										if ( ret == 0 ) self.say( "Ai ai... voc� tem um slot dispon�vel no seu invent�rio de etc.? N�o posso te dar se estiver cheio." );
										//else self.say( "T�... ent�o, tudo o que voc� precisa fazer agora � peg�-lo e ir para #p1032102#com #b#t5180000##k... Hahaha muito boa sorte pra voc�!" );
										else self.say( "T�... Ent�o, tudo o que voc� precisa fazer agora � peg�-lo e ir falar com a #p1032102# levando tamb�m uma #b#t5180000##k... Hahaha muito boa sorte pra voc�!" );
									}
								}
							}
						}
					}
				}
			}
		}
		else self.say( "Ei, tem certeza de que voc� encontrou #b#p1032102##k? N�o minta pra mim se voc� nunca o encontrou, porque isso � �bvio. Nem mesmo foi uma boa mentira!" );
	}
}

// Raising Pet's Closeness
script "pet_letter" {
	inventory = target.inventory;
	if ( inventory.itemCount( 4031035 ) > 0 ) {
		self.say( "Oba, � carta do meu irm�o! Provavelmente me dando bronca por pensar que eu n�o t� trabalhando... hum? Ahhh... voc� seguiu o conselho do meu irm�o, adestrou o seu bichinho e subiu aqui, �h? Legal! J� que voc� trabalhou duro pra chegar aqui, vou aumentar seu n�vel de intimidade com o seu bichinho." );
		pName = target.sPetName;
		if ( pName == null ) self.say( "Hummm... voc� realmente veio aqui com seu bichinho? Estes obst�culos s�o para bichos. O que voc� t� fazendo aqui sem ele? Voc� t� de brincadeira!!!" );
		else {
			ret = inventory.exchange( 0, 4031035, -1 );
			if ( ret == 0 ) self.say( "Ei, voc� tem mesmo a carta do meu irm�o? V� ao invent�rio de etc. e veja se a carta realmente t� l� ou n�o!" );
			else {
				target.incPetTame( 2 );
				self.say( "O que voc� acha? Voc� n�o acha que se aproximou demais do seu bichinho? Se tiver tempo, treine seu bichinho de novo neste percurso de obst�culos... claro, com a permiss�o do meu irm�o." );
			}
		}
	}
	else self.say( "Meu irm�o me disse pra tomar cuidado com o percurso de obst�culos, mas... j� que estou t�o longe dele, n�o consigo resistir, t� querendo fazer bagun�a... hehe. N�o o vejo pessoalmente mesmo, acho que posso s� dar uma relaxada por uns minutos." );
}
