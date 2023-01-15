module "standard.s";

function chat_message1( integer index, string makeItem, string needItem, integer unitPrice ) {
	inventory = target.inventory;

	nRetNum = self.askNumber( "Para fazer um " + makeItem + ", eu vou precisar dos seguintes materiais. Quantos voc� gostaria de fazer?\r\n\r\n#b" + needItem + "\r\n#v4031138# " + unitPrice + " mesos#k", 0, 0, 100 );
	nPrice = unitPrice * nRetNum;
	nAllNum = nRetNum * 10;
	nRetBuy = self.askYesNo( "Para fazer #b" + nRetNum + " " + makeItem + "(s)#k, eu vou precisar dos seguintes materiais. Voc� tem mesmo certeza que deseja cri�-los?\r\n\r\n#b" + nAllNum + " " + needItem + "\r\n#v4031138# " + nPrice + " mesos#k" );
	if ( nRetBuy == 0 ) self.say( "N�s temos todos os tipos de itens, ent�o n�o entre em p�nico, e escolha aquele que voc� deseja comprar..." );
	else {
		// To refine Minerals
		if ( index == 1 ) ret = inventory.exchange( -nPrice, 4010000, -nAllNum, 4011000, nRetNum );
		else if ( index == 2 ) ret = inventory.exchange( -nPrice, 4010001, -nAllNum, 4011001, nRetNum );
		else if (	 index == 3 ) ret = inventory.exchange( -nPrice, 4010002, -nAllNum, 4011002, nRetNum );
		else if (	 index == 4 ) ret = inventory.exchange( -nPrice, 4010003, -nAllNum, 4011003, nRetNum );
		else if (	 index == 5 ) ret = inventory.exchange( -nPrice, 4010004, -nAllNum, 4011004, nRetNum );
		else if (	 index == 6 ) ret = inventory.exchange( -nPrice, 4010005, -nAllNum, 4011005, nRetNum );
		else if (	 index == 7 ) ret = inventory.exchange( -nPrice, 4010006, -nAllNum, 4011006, nRetNum );
		// To refine Minerals
		else if (	 index == 100 ) ret = inventory.exchange( -nPrice, 4020000, -nAllNum, 4021000, nRetNum );
		else if (	 index == 101 ) ret = inventory.exchange( -nPrice, 4020001, -nAllNum, 4021001, nRetNum );
		else if (	 index == 102 ) ret = inventory.exchange( -nPrice, 4020002, -nAllNum, 4021002, nRetNum );
		else if (	 index == 103 ) ret = inventory.exchange( -nPrice, 4020003, -nAllNum, 4021003, nRetNum );
		else if (	 index == 104 ) ret = inventory.exchange( -nPrice, 4020004, -nAllNum, 4021004, nRetNum );
		else if (	 index == 105 ) ret = inventory.exchange( -nPrice, 4020005, -nAllNum, 4021005, nRetNum );
		else if (	 index == 106 ) ret = inventory.exchange( -nPrice, 4020006, -nAllNum, 4021006, nRetNum );
		else if (	 index == 107 ) ret = inventory.exchange( -nPrice, 4020007, -nAllNum, 4021007, nRetNum );
		else if (	 index == 108 ) ret = inventory.exchange( -nPrice, 4020008, -nAllNum, 4021008, nRetNum );

		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem todos os itens de que precisa, e se seu invent�rio de etc. est� cheio ou n�o." );
		else self.say( "Ei! Aqui, pegue o" + nRetNum + " " + makeItem + "(s). Isso saiu melhor que a encomenda... um item muito bem refinado assim, eu n�o acho que voc� v� encontrar em lugar nenhum!! Por favor, volte novamente~" );
	}
}

function chat_message11( integer index, string makeItem, string needItemIcon, string needItemString, integer unitPrice ) {
	inventory = target.inventory;

	nRetNum = self.askNumber( "Para fazer um " + makeItem + ", eu vou precisar dos seguintes materiais. Quantos voc� gostaria de fazer?\r\n\r\n#b" + needItemIcon + " 10 " + needItemString + "\r\n#v4031138# " + unitPrice + " mesos#k", 0, 0, 100 );
	nPrice = unitPrice * nRetNum;
	nAllNum = nRetNum * 10;
	nRetBuy = self.askYesNo( "Para fazer #b" + nRetNum + " " + makeItem + "(s)#k, eu vou precisar dos seguintes materiais. Voc� tem mesmo certeza de que deseja cri�-los?\r\n\r\n#b" + needItemIcon + " " + nAllNum + " " + needItemString + "\r\n#v4031138# " + nPrice + " mesos#k" );
	if ( nRetBuy == 0 ) self.say( "N�s temos todos os tipos de itens, ent�o n�o entre em p�nico, e escolha aquele que voc� deseja comprar..." );
	else {
		// To refine Minerals
		if ( index == 1 ) ret = inventory.exchange( -nPrice, 4010000, -nAllNum, 4011000, nRetNum );
		else if ( index == 2 ) ret = inventory.exchange( -nPrice, 4010001, -nAllNum, 4011001, nRetNum );
		else if (	 index == 3 ) ret = inventory.exchange( -nPrice, 4010002, -nAllNum, 4011002, nRetNum );
		else if (	 index == 4 ) ret = inventory.exchange( -nPrice, 4010003, -nAllNum, 4011003, nRetNum );
		else if (	 index == 5 ) ret = inventory.exchange( -nPrice, 4010004, -nAllNum, 4011004, nRetNum );
		else if (	 index == 6 ) ret = inventory.exchange( -nPrice, 4010005, -nAllNum, 4011005, nRetNum );
		else if (	 index == 7 ) ret = inventory.exchange( -nPrice, 4010006, -nAllNum, 4011006, nRetNum );
		// To refine Minerals
		else if (	 index == 100 ) ret = inventory.exchange( -nPrice, 4020000, -nAllNum, 4021000, nRetNum );
		else if (	 index == 101 ) ret = inventory.exchange( -nPrice, 4020001, -nAllNum, 4021001, nRetNum );
		else if (	 index == 102 ) ret = inventory.exchange( -nPrice, 4020002, -nAllNum, 4021002, nRetNum );
		else if (	 index == 103 ) ret = inventory.exchange( -nPrice, 4020003, -nAllNum, 4021003, nRetNum );
		else if (	 index == 104 ) ret = inventory.exchange( -nPrice, 4020004, -nAllNum, 4021004, nRetNum );
		else if (	 index == 105 ) ret = inventory.exchange( -nPrice, 4020005, -nAllNum, 4021005, nRetNum );
		else if (	 index == 106 ) ret = inventory.exchange( -nPrice, 4020006, -nAllNum, 4021006, nRetNum );
		else if (	 index == 107 ) ret = inventory.exchange( -nPrice, 4020007, -nAllNum, 4021007, nRetNum );
		else if (	 index == 108 ) ret = inventory.exchange( -nPrice, 4020008, -nAllNum, 4021008, nRetNum );

		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem todos os itens de que precisa, e se seu invent�rio de etc. est� cheio ou n�o." );
		else self.say( "Ei! Aqui, pegue o" + nRetNum + " " + makeItem + "(s). Isso saiu melhor que a encomenda... um item muito bem refinado assim, eu n�o acho que voc� v� encontrar em lugar nenhum!! Por favor, volte novamente~" );
	}
}
function chat_message2( integer index, string makeItem, string needItem ) {
	inventory = target.inventory;

	nRet = self.askYesNo( "Para fazer um " + makeItem + ", eu vou precisar dos seguintes materiais. Certifique-se de que n�o vai usar um item que est� sendo aperfei�oado como material. O que voc� acha? Voc� quer um?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "Mesmo? Que pena ouvir isso. Volte quando precisar de mim." );
	else {
		// Making Helmet
		if ( index == 1 ) ret = inventory.exchange( -300, 1002001, -1, 4021006, -1, 1002041, 1 );
		else if ( index == 2 ) ret = inventory.exchange( -500, 1002001, -1, 4011002, -1, 1002042, 1 );
		else if ( index == 3 ) ret = inventory.exchange( -500, 1002043, -1, 4011001, -1, 1002002, 1 );
		else if ( index == 4 ) ret = inventory.exchange( -800, 1002043, -1, 4011002, -1, 1002044, 1 );
		else if ( index == 5 ) ret = inventory.exchange( -500, 1002039, -1, 4011001, -1, 1002003, 1 );
		else if ( index == 6 ) ret = inventory.exchange( -800, 1002039, -1, 4011002, -1, 1002040, 1 );
		else if ( index == 7 ) ret = inventory.exchange( -1000, 1002051, -1, 4011001, -2, 1002007, 1 );
		else if ( index == 8 ) ret = inventory.exchange( -1500, 1002051, -1, 4011002, -2, 1002052, 1 );
		else if ( index == 9 ) ret = inventory.exchange( -1500, 1002059, -1, 4011001, -3, 1002011, 1 );
		else if ( index == 10 ) ret = inventory.exchange( -2000, 1002059, -1, 4011002, -3, 1002058, 1 );
		else if ( index == 11 ) ret = inventory.exchange( -1500, 1002055, -1, 4011001, -3, 1002009, 1 );
		else if ( index == 12 ) ret = inventory.exchange( -2000, 1002055, -1, 4011002, -3, 1002056, 1 );
		else if ( index == 13 ) ret = inventory.exchange( -2000, 1002027, -1, 4011002, -4, 1002087, 1 );
		else if ( index == 14 ) ret = inventory.exchange( -4000, 1002027, -1, 4011006, -4, 1002088, 1 );
		else if ( index == 15 ) ret = inventory.exchange( -4000, 1002005, -1, 4011006, -5, 1002049, 1 );
		else if ( index == 16 ) ret = inventory.exchange( -5000, 1002005, -1, 4011005, -5, 1002050, 1 );
		else if ( index == 17 ) ret = inventory.exchange( -8000, 1002004, -1, 4021000, -3, 1002047, 1 );
		else if ( index == 18 ) ret = inventory.exchange( -10000, 1002004, -1, 4021005, -3, 1002048, 1 );
		else if ( index == 19 ) ret = inventory.exchange( -12000, 1002021, -1, 4011002, -5, 1002099, 1 );
		else if ( index == 20 ) ret = inventory.exchange( -15000, 1002021, -1, 4011006, -6, 1002098, 1 );
		else if ( index == 21 ) ret = inventory.exchange( -20000, 1002086, -1, 4011002, -5, 1002085, 1 );
		else if ( index == 22 ) ret = inventory.exchange( -25000, 1002086, -1, 4011004, -4, 1002028, 1 );

		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem todos os itens de que precisa, e se seu invent�rio de etc. est� cheio ou n�o." );
		else self.say( "Ei! Aqui, pegue o" + makeItem + ". Eu sou bom... voc� j� viu um item refinado desse jeito em algum outro lugar? Por favor, volte novamente~" );
	}
}

function chat_message10( integer index, string makeItem, string needItem, string itemOption ) {
	inventory = target.inventory;

	nRet = self.askYesNo( "Para aperfei�oar um " + makeItem + ", eu vou precisar dos seguintes materiais. Este item tem uma op��o de" + itemOption + ". Certifique-se que n�o vai usar um item que est� sendo aperfei�oado como material. O que voc� acha? Voc� quer um?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "Mesmo? Que pena ouvir isso. Volte quando precisar de mim." );
	else {
		// Making Shield or Helmet
		if ( index == 1 ) ret = inventory.exchange( -100000 , 1092012, -1, 4011002, -10, 1092013, 1 );
		else if ( index == 2 ) ret = inventory.exchange( -100000 , 1092012, -1, 4011003, -10, 1092014, 1 );
		else if ( index == 3 ) ret = inventory.exchange( -120000 , 1092009, -1, 4011007, -1, 4011004, -15, 1092010, 1 );
		else if ( index == 4 ) ret = inventory.exchange( -120000 , 1092009, -1, 4011007, -1, 4011003, -15, 1092011, 1 );
		else if ( index == 100 ) ret = inventory.exchange( -30000 , 1002100, -1, 4011007, -1, 4011001, -7, 1002022, 1 );
		else if ( index == 101 ) ret = inventory.exchange( -30000 , 1002100, -1, 4011007, -1, 4011002, -7, 1002101, 1 );

		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem todos os itens de que precisa, e se seu invent�rio de etc. est� cheio ou n�o." );
		else self.say( "Ei! Aqui, pegue o" + makeItem + ". Eu sou bom... voc� j� viu um item refinado desse jeito em algum outro lugar? Por favor, volte novamente~" );
	}
}

// refining ores and jewels, along with upgrading the items at Perion.
script "refine_perion" {
	
	
	nRet1 = self.askYesNo( "Espere! Voc� tem o min�rio de uma j�ia ou mineral? Com uma pequena taxa de servi�o, eu posso transform�-los nos materiais necess�rios para criar escudos ou armas. E n�o � s� isso! Eu tamb�m posso aperfei�oar um item criando assim um objeto muito melhor! O que voc� acha? Voc� aceita?" );
	if ( nRet1 == 0 ) self.say( "Mesmo? Que pena ouvir isso. Se voc� n�o precisa, bem... se voc� coletar muito min�rio no futuro, � s� vir me procurar. Eu farei algo que s� eu consigo fazer." );
	else {
		v1 = self.askMenu( "Tudo bem, com o min�rio e uma pequena taxa de servi�o, eu posso refin�-lo para que voc� possa us�-lo. Veja se o seu invent�rio de etc. possui algum espa�o dispon�vel. Agora ... o que voc� gostaria que eu fizesse?\r\n#b#L0# Refinar um min�rio raro#l\r\n#L1# Refinar uma j�ia#l\r\n#L2# Aperfei�oar um capacete#l\r\n#L3# Aperfei�oar um escudo#l" );
		if ( v1 == 0 ) {
			v2 = self.askMenu( "Que tipo de mineral voc� quer criar?\r\n#b#L0# #t4011000##l\r\n#L1# #t4011001##l\r\n#L2# #t4011002##l\r\n#L3# #t4011003##l\r\n#L4# #t4011004##l\r\n#L5# #t4011005##l\r\n#L6# #t4011006##l" );
			if ( v2 == 0 ) chat_message11( 1, "#t4011000#", "#v4010000#", "#t4010000#", 300 );
			else if ( v2 == 1 ) chat_message11( 2, "#t4011001#", "#v4010001#", "#t4010001#", 300 );
			else if ( v2 == 2 ) chat_message11( 3, "#t4011002#", "#v4010002#", "#t4010002#", 300 );
			else if ( v2 == 3 ) chat_message11( 4, "#t4011003#", "#v4010003#", "#t4010003#", 500 );
			else if ( v2 == 4 ) chat_message11( 5, "#t4011004#", "#v4010004#", "#t4010004#", 500 );
			else if ( v2 == 5 ) chat_message11( 6, "#t4011005#", "#v4010005#", "#t4010005#", 500 );
			else if ( v2 == 6 ) chat_message11( 7, "#t4011006#", "#v4010006#", "#t4010006#", 800 );
		}
		else if ( v1 == 1 ) {
			v2 = self.askMenu( "Que j�ia voc� quer refinar?\r\n#b#L0# #t4021000##l\r\n#L1# #t4021001##l\r\n#L2# #t4021002##l\r\n#L3# #t4021003##l\r\n#L4# #t4021004##l\r\n#L5# #t4021005##l\r\n#L6# #t4021006##l\r\n#L7# #t4021007##l\r\n#L8# #t4021008##l" );
			if ( v2 == 0 ) chat_message11( 100, "#t4021000#", "#v4020000#", "#t4020000#", 500 );
			else if ( v2 == 1 ) chat_message11( 101, "#t4021001#", "#v4020001#", "#t4020001#", 500 );
			else if ( v2 == 2 ) chat_message11( 102, "#t4021002#", "#v4020002#", "#t4020002#", 500 );
			else if ( v2 == 3 ) chat_message11( 103, "#t4021003#", "#v4020003#", "#t4020003#", 500 );
			else if ( v2 == 4 ) chat_message11( 104, "#t4021004#", "#v4020004#", "#t4020004#", 500 );
			else if ( v2 == 5 ) chat_message11( 105, "#t4021005#", "#v4020005#", "#t4020005#", 500 );
			else if ( v2 == 6 ) chat_message11( 106, "#t4021006#", "#v4020006#", "#t4020006#", 500 );
			else if ( v2 == 7 ) chat_message11( 107, "#t4021007#", "#v4020007#", "#t4020007#", 1000 );
			else if ( v2 == 8 ) chat_message11( 108, "#t4021008#", "#v4020008#", "#t4020008#", 3000 );
		}
		else if ( v1 == 2 ) {
			self.say( "Ent�o, voc� quer aperfei�oar o capacete? Ok, ent�o. Mas vou te dar um conselho: Todos os itens que ser�o usados para o aperfei�oamento ir�o desaparecer, e se voc� usar um item que j� tenha sido #raperfei�oado#k com um pergaminho, n�o haver� efeito quando aperfei�oado. Leve isso em considera��o quando for tomar a decis�o, certo?" );
			v2 = self.askMenu( "Agora... que tipo de capacete voc� quer aperfei�oar ou criar?\r\n#L0##b #t1002041##k(N�vel Limite: 15, todos)#l\r\n#L1##b #t1002042##k(N�vel Limite: 15, todos)#l\r\n#L2##b #t1002002##k(N�vel Limite: 10, guerreiro)#l\r\n#L3##b(N�vel Limite: 10, guerreiro)#l\r\n#L4##b #t1002003##k(N�vel Limite: 12, guerreiro)#l\r\n#L5##b #t1002040##k(N�vel Limite: 12, guerreiro)#l\r\n#L6##b #t1002007##k(N�vel Limite: 15, guerreiro)#l\r\n#L7##b #t1002052##k(N�vel Limite: 15, guerreiro)#l\r\n#L8##b #t1002011##k(N�vel Limite: 20, guerreiro)#l\r\n#L9##b #t1002058##k(N�vel Limite: 20, guerreiro)#l\r\n#L10##b #t1002009##k(N�vel Limite: 20, guerreiro)#l\r\n#L11##b #t1002056##k(N�vel Limite: 20, guerreiro)#l\r\n#L12##b #t1002087##k(N�vel Limite: 22, guerreiro)#l\r\n#L13##b #t1002088##k(N�vel Limite: 22, guerreiro)#l\r\n#L14##b #t1002049##k(N�vel Limite: 25, guerreiro)#l\r\n#L15##b #t1002050##k(N�vel Limite: 25, guerreiro)#l\r\n#L16##b #t1002047##k(N�vel Limite: 35, guerreiro)#l\r\n#L17##b #t1002048##k(N�vel Limite: 35, guerreiro)#l\r\n#L18##b #t1002099##k(N�vel Limite: 40, guerreiro)#l\r\n#L19##b #t1002098##k(N�vel Limite: 40, guerreiro)#l\r\n#L20##b #t1002085##k(N�vel Limite: 50, guerreiro)#l\r\n#L21##b #t1002028##k(N�vel Limite: 50, guerreiro)#l\r\n#L22##b #t1002022##k(N�vel Limite: 55, guerreiro)#l\r\n#L23##b #t1002101##k(N�vel Limite: 55, guerreiro)#l" );
			if ( v2 == 0 ) chat_message2( 1, "#t1002041#", "#v1002001# #t1002001# \r\n#v4021006# #t4021006# \r\n#v4031138# 300 mesos" );
			else if ( v2 == 1 ) chat_message2( 2, "#t1002042#", "#v1002001# #t1002001# \r\n#v4011002# #t4011002# \r\n#v4031138# 500 mesos" );
			else if ( v2 == 2 ) chat_message2( 3, "#t1002002#", "#v1002043# #t1002043# \r\n#v4011001# #t4011001# \r\n#v4031138# 500 mesos" );
			else if ( v2 == 3 ) chat_message2( 4, "#t1002044#", "#v1002043# #t1002043# \r\n#v4011002# #t4011002# \r\n#v4031138# 800 mesos" );
			else if ( v2 == 4 ) chat_message2( 5, "#t1002003#", "#v1002039# #t1002039# \r\n#v4011001# #t4011001# \r\n#v4031138# 500 mesos" );
			else if ( v2 == 5 ) chat_message2( 6, "#t1002040#", "#v1002039# #t1002039# \r\n#v4011002# #t4011002# \r\n#v4031138# 800 mesos" );
			else if ( v2 == 6 ) chat_message2( 7, "#t1002007#", "#v1002051# #t1002051# \r\n#v4011001# 2 #t4011001#s \r\n#v4031138# 1.000 mesos" );
			else if ( v2 == 7 ) chat_message2( 8, "#t1002052#", "#v1002051# #t1002051# \r\n#v4011002# 2 #t4011002#s \r\n#v4031138# 1.500 mesos" );
			else if ( v2 == 8 ) chat_message2( 9, "#t1002011#", "#v1002059# #t1002059# \r\n#v4011001# 3 #t4011001#s \r\n#v4031138# 1.500 mesos" );
			else if ( v2 == 9 ) chat_message2( 10, "#t1002058#", "#v1002059# #t1002059# \r\n#v4011002# 3 #t4011002#s \r\n#v4031138# 2.000 mesos" );
			else if ( v2 == 10 ) chat_message2( 11, "#t1002009#", "#v1002055# #t1002055# \r\n#v4011001# 3 #t4011001#s \r\n#v4031138# 1.500 mesos" );
			else if ( v2 == 11 ) chat_message2( 12, "#t1002056#", "#v1002055# #t1002055# \r\n#v4011002# 3 #t4011002#s \r\n#v4031138# 2.000 mesos" );
			else if ( v2 == 12 ) chat_message2( 13, "#t1002087#", "#v1002027# #t1002027# \r\n#v4011002# 4 #t4011002#s \r\n#v4031138# 2.000 mesos" );
			else if ( v2 == 13 ) chat_message2( 14, "#t1002088#", "#v1002027# #t1002027# \r\n#v4011006# 4 #t4011006#s \r\n#v4031138# 4.000 mesos" );
			else if ( v2 == 14 ) chat_message2( 15, "#t1002049#", "#v1002005# #t1002005# \r\n#v4011006# 5 #t4011006#s \r\n#v4031138# 4.000 mesos" );
			else if ( v2 == 15 ) chat_message2( 16, "#t1002050#", "#v1002005# #t1002005# \r\n#v4011005# 5 #t4011005#s \r\n#v4031138# 5.000 mesos" );
			else if ( v2 == 16 ) chat_message2( 17, "#t1002047#", "#v1002004# #t1002004# \r\n#v4021000# 3 #t4021000#s \r\n#v4031138# 8.000 mesos" );
			else if ( v2 == 17 ) chat_message2( 18, "#t1002048#", "#v1002004# #t1002004# \r\n#v4021005# 3 #t4021005#s \r\n#v4031138# 10.000 mesos" );
			else if ( v2 == 18 ) chat_message2( 19, "#t1002099#", "#v1002021# #t1002021# \r\n#v4011002# 5 #t4011002#s \r\n#v4031138# 12.000 mesos" );
			else if ( v2 == 19 ) chat_message2( 20, "#t1002098#", "#v1002021# #t1002021# \r\n#v4011006# 6 #t4011006#s \r\n#v4031138# 15.000 mesos" );
			else if ( v2 == 20 ) chat_message2( 21, "#t1002085#", "#v1002086# #t1002086# \r\n#v4011002# 5 #t4011002#s \r\n#v4031138# 20.000 mesos" );
			else if ( v2 == 21 ) chat_message2( 22, "#t1002028#", "#v1002086# #t1002086# \r\n#v4011004# 4 #t4011004#s \r\n#v4031138# 25.000 mesos" );
			else if ( v2 == 22 ) chat_message10( 100, "#t1002022#", "#v1002100# #t1002100# \r\n#v4011007# #t4011007# \r\n#v4011001# 7 #t4011001#s \r\n#v4031138# 30.000 mesos", "DEX +1, MP +30" );
			else if ( v2 == 23 ) chat_message10( 101, "#t1002101#", "#v1002100# #t1002100# \r\n#v4011007# #t4011007# \r\n#v4011002# 7 #t4011002#s \r\n#v4031138# 30000 mesos", "STR +1, MP +30" );
		}
		else if ( v1 == 3 ) {
			self.say( "Ent�o, voc� quer aperfei�oar o escudo? Ok, ent�o. Mas vou te dar um conselho: Todos os itens que ser�o usados para o aperfei�oamento ir�o desaparecer, e se voc� usar um item que j� tenha sido #raperfei�oado#k com um pergaminho, n�o haver� efeito quando aperfei�oado. Leve isso em considera��o quando for tomar a decis�o, certo?" );
			v2 = self.askMenu( "Ent�o~~ que tipo de escudo voc� quer aperfei�oar e criar?\r\n#L0##b #t1092013##k(N�vel Limite: 40, guerreiro)#l\r\n#L1##b #t1092014##k(N�vel Limite: 40, guerreiro)#l\r\n#L2##b #t1092010##k(N�vel Limite: 60, guerreiro)#l\r\n#L3##b #t1092011##k(N�vel Limite: 60, guerreiro)#l" );
			if ( v2 == 0 ) chat_message10( 1, "#t1092013#", "#v1092012# #t1092012# \r\n#v4011002# 10 #t4011002#s \r\n#v4031138# 100.000 mesos", "STR +2" );
			else if ( v2 == 1 ) chat_message10( 2, "#t1092014#", "#v1092012# #t1092012# \r\n#v4011003# #t4011003# \r\n#v4031138# 100.000 mesos", "DEX +2" );
			else if ( v2 == 2 ) chat_message10( 3, "#t1092010#", "#v1092009# #t1092009# \r\n#v4011007# #t4011007# \r\n#v4011004# 15 #t4011004#s \r\n#v4031138# 120.000 mesos", "DEX +2" );
			else if ( v2 == 3 ) chat_message10( 4, "#t1092011#", "#v1092009# #t1092009# \r\n#v4011007# #t4011007# \r\n#v4011003# 15 #t4011003#s \r\n#v4031138# 120.000 mesos", "STR +2" );
		}
	}
	
}

function chat_message3( integer index, string makeItem, string needItem, integer reqLevel ) {
	inventory = target.inventory;


	nRet = self.askYesNo( "Para fazer um " + makeItem + ", eu vou precisar dos seguintes materiais. O limite de n�vel � " + reqLevel + "e por favor, certifique-se de que n�o vai usar um item que est� sendo aperfei�oado como material. O que voc� acha? Voc� quer um?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "N�o tem os materiais? Tudo bem... v� procurar todos eles e depois venha falar comigo, certo? Eu vou esperar..." );
	else {
		if ( index == 1 ) ret = inventory.exchange( -1000, 4000021, -15, 4011001, -1, 1082003, 1 );
		else if ( index == 2 ) ret = inventory.exchange( -2000, 4011001, -2, 1082000, 1 );
		else if ( index == 3 ) ret = inventory.exchange( -5000, 4000021, -40, 4011000, -2, 1082004, 1 );
		else if ( index == 4 ) ret = inventory.exchange( -10000, 4011001, -2, 1082001, 1 );
		else if ( index == 5 ) ret = inventory.exchange( -20000, 4011000, -3, 4011001, -2, 4003000, -15, 1082007, 1 );
		else if ( index == 6 ) ret = inventory.exchange( -30000, 4011001, -4, 4000021, -30, 4003000, -30, 1082008, 1 );
		else if ( index == 7 ) ret = inventory.exchange( -40000, 4011001, -5, 4000021, -50, 4003000, -40, 1082023, 1 );
		else if ( index == 8 ) ret = inventory.exchange( -50000, 4011001, -3, 4021007, -2, 4000030, -30, 4003000, -45, 1082009, 1 );
		else if ( index == 9 ) ret = inventory.exchange( -70000, 4011007, -1, 4011000, -8, 4011006, -2, 4000030, -50, 4003000, -50, 1082059, 1 );

		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem todos os itens de que precisa, e se seu invent�rio de equip. est� cheio ou n�o." );
		else self.say( "Aqui! pegue o" + makeItem + ". Voc� n�o acha que eu sou t�o bom quanto o Sr. Trov�o? Voc� vai ficar mais que feliz com o que eu fiz aqui." );
	}
}

function chat_message4( integer index, string makeItem, string needItem, integer reqLevel ) {
	inventory = target.inventory;

	nRet = self.askYesNo( "Para fazer um " + makeItem + ", eu vou precisar dos seguintes materiais. O limite de n�vel � " + reqLevel + "e por favor, certifique-se de que n�o vai usar um item que est� sendo aperfei�oado como material. O que voc� acha? Voc� quer um?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "N�o tem os materiais? Tudo bem... v� procurar todos eles e depois venha falar comigo, certo? Eu vou esperar..." );
	else {
		if ( index == 1 ) ret = inventory.exchange( -20000, 1082007, -1, 4011001, -1, 1082005, 1 );
		else if ( index == 2 ) ret = inventory.exchange( -25000, 1082007, -1, 4011005, -2, 1082006, 1 );
		else if ( index == 3 ) ret = inventory.exchange( -30000, 1082008, -1, 4021006, -3, 1082035, 1 );
		else if ( index == 4 ) ret = inventory.exchange( -40000, 1082008, -1, 4021008, -1, 1082036, 1 );
		else if ( index == 5 ) ret = inventory.exchange( -45000, 1082023, -1, 4011003, -4, 1082024, 1 );
		else if ( index == 6 ) ret = inventory.exchange( -50000, 1082023, -1, 4021008, -2, 1082025, 1 );
		else if ( index == 7 ) ret = inventory.exchange( -55000, 1082009, -1, 4011002, -5, 1082010, 1 );
		else if ( index == 8 ) ret = inventory.exchange( -60000, 1082009, -1, 4011006, -4, 1082011, 1 );
		else if ( index == 9 ) ret = inventory.exchange( -70000, 1082059, -1, 4011002, -3, 4021005, -5, 1082060, 1 );
		else if ( index == 10 ) ret = inventory.exchange( -80000, 1082059, -1, 4021007, -2, 4021008, -2, 1082061, 1 );

		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem todos os itens de que precisa, e se seu invent�rio de equip. est� cheio ou n�o." );
		else self.say( "Aqui! pegue o" + makeItem + ". Voc� n�o acha que eu sou t�o bom quanto o Sr. Trov�o? Voc� vai ficar mais que feliz com o que eu fiz aqui." );
	}
}

function chat_message5( integer index, string makeItem, string needItem, integer needNumber, integer itemNumber ) {
	inventory = target.inventory;

	nRetNum = self.askNumber( "Com #b" + needNumber + " " + needItem + "#k, eu posso criar" + itemNumber + " " + makeItem + ". Fique feliz, pois essa � por minha conta. O que voc� acha? Quantos voc� quer?", 0, 0, 100 );
	nNeedNum = nRetNum * needNumber;
	nAllNum = nRetNum * itemNumber;
	nRetBuy = self.askYesNo( "Voc� quer fazer #b" + makeItem + "#k " + nRetNum + "vezes? Eu vou precisar de  #r" + nNeedNum + " " + needItem + "#k ent�o." );
	if ( nRetBuy == 0 ) self.say( "N�o tem os materiais? N�o tem problema... v� procurar todos eles e depois venha falar comigo, certo? Eu vou esperar..." );
	else {
		if ( index == 1 ) ret = inventory.exchange( 0, 4000003, -nNeedNum, 4003001, nAllNum );
		else if ( index == 2 ) ret = inventory.exchange( 0, 4000018, -nNeedNum, 4003001, nAllNum );
		else if ( index == 3 ) ret = inventory.exchange( 0, 4011001, -nNeedNum, 4011000, -nNeedNum, 4003000, nAllNum );
		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem todos os itens de que precisa, e se seu invent�rio de etc. est� cheio ou n�o." );
		else self.say( "Aqui! Pegue!" + nAllNum + " " + makeItem + ". Voc� n�o acha que eu sou t�o bom quanto o Sr. Trov�o? Voc� vai ficar mais que feliz com o que eu fiz aqui." );
	}
}

// refining ores of minerals, jewels and items at Perion.
script "refine_perion2" {
	nRet1 = self.askYesNo( "Eu sou o aprendiz do Sr. Trov�o. Ele est� ficando muito velho e n�o � mais o que era... haha! Ah, que droga! Por favor, n�o v� contar a ele que eu disse isso... bem... eu posso fazer v�rios itens especificamente projetados para os guerreiros, ent�o, o que voc� acha? Quer deixar eu fazer?" );
	if ( nRet1 == 0 ) self.say( "*Suspiro*... Meu chefe com certeza vai me falar um monte se eu n�o fizer as coisas direitinho hoje ... Ah, bem... que droga!" );
	else {
		v1 = self.askMenu( "Certo! A taxa de servi�o ser� razo�vel, ent�o n�o se preocupe. O que voc� quer fazer?\r\n#b#L0# Fazer uma luva#l\r\n#L1# Aperfei�oar uma luva#l\r\n#L2# Criar materiais#l" );;
		if ( v1 == 0 ) {
			v2 = self.askMenu( "Eu sou o melhor criador de luvas dessa cidade!! Agora... que tipo de luva voc� quer que eu fa�a?\r\n#L0##b #t1082003##k (N�vel Limite: 10, guerreiro)#l\r\n#L1##b #t1082000##k(N�vel Limite: 15, guerreiro)#l\r\n#L2##b #t1082004##k(N�vel Limite: 20, guerreiro)#l\r\n#L3##b #t1082001##k(N�vel Limite: 25, guerreiro)#l\r\n#L4##b #t1082007##k(N�vel Limite: 30, guerreiro)#l\r\n#L5##b #t1082008##k(N�vel Limite: 35, guerreiro)#l\r\n#L6##b #t1082023##k(N�vel Limite: 40, guerreiro)#l\r\n#L7##b #t1082009##k(N�vel Limite: 50, guerreiro)#l\r\n#L8##b #t1082059##k(N�vel Limite: 60, guerreiro)#l" );
			if ( v2 == 0 ) chat_message3( 1, "#t1082003#", "#v4000021# 15 #t4000021#s\r\n#v4011001# #t4011001# \r\n#v4031138# 1.000 mesos", 10 );
			else if ( v2 == 1 ) chat_message3( 2, "#t1082000#", "#v4011001# 2 #t4011001#s \r\n#v4031138# 2.000 mesos", 15 );
			else if ( v2 == 2 ) chat_message3( 3, "#t1082004#", "#v4000021# 40 #t4000021#s \r\n#v4011000# 2 #t4011000#s \r\n#v4031138# 5.000 mesos", 20 );
			else if ( v2 == 3 ) chat_message3( 4, "#t1082001#", "#v4011001# 2 #t4011001#s \r\n#v4031138# 10.000 mesos", 25 );
			else if ( v2 == 4 ) chat_message3( 5, "#t1082007#", "#v4011000# 3 #t4011000#s \r\n#v4011001# 2 #t4011001#s \r\n#v4003000# 15 #t4003000#s \r\n#v4031138# 20.000 mesos", 30 );
			else if ( v2 == 5 ) chat_message3( 6, "#t1082008#", "#v4000021# 30 #t4000021#s \r\n#v4011001#  4 #t4011001#s \r\n#v4003000# 30 #t4003000#s \r\n#v4031138# 30.000 mesos", 35 );
			else if ( v2 == 6 ) chat_message3( 7, "#t1082023#", "#v4000021# 50 #t4000021#s \r\n#v4011001# 5 #t4011001#s \r\n#v4003000# 40 #t4003000#s \r\n#v4031138# 40.000 mesos", 40 );
			else if ( v2 == 7 ) chat_message3( 8, "#t1082009#", "#v4011001# 3 #t4011001#s \r\n#v4021007# 2 #t4021007#s \r\n#v4000030# 30 #t4000030#s \r\n#v4003000# 45 #t4003000#s \r\n#v4031138# 50.000 mesos", 50 );
			else if ( v2 == 8 ) chat_message3( 9, "#t1082059#", "#v4011007# #t4011007# \r\n#v4011000# 8 #t4011000#s \r\n#v4011006# 2 #t4011006#s \r\n#v4000030# 50 #t4000030#s \r\n#v4003000# 50 #t4003000#s \r\n#v4031138# 70.000 mesos", 60 );
		}
		else if ( v1 == 1 ) {
			self.say( "Ent�o, voc� quer aperfei�oar a luva? Ok, ent�o. Mas vou te dar um conselho: Todos os itens que ser�o usados para o aperfei�oamento ir�o desaparecer, e se voc� usar um item que j� tenha sido #raperfei�oado#k com um pergaminho, o efeito ir� desaparecer quando aperfei�oado. Leve isso em considera��o quando for tomar a decis�o, certo?" );
			v2 = self.askMenu( "Ent�o~~ que tipo de luva voc� quer aperfei�oar e criar?\r\n#L0##b #t1082005##k(N�vel Limite: 30, guerreiro)#l\r\n#L1##b #t1082006##k(N�vel Limite: 30, guerreiro)#l\r\n#L2##b #t1082035##k(N�vel Limite: 35, guerreiro)#l\r\n#L3##b #t1082036##k(N�vel Limite: 35, guerreiro)#l\r\n#L4##b #t1082024##k(N�vel Limite: 40, guerreiro)#l\r\n#L5##b #t1082025##k(N�vel Limite: 40, guerreiro)#l\r\n#L6##b #t1082010##k(N�vel Limite: 50, guerreiro)#l\r\n#L7##b #t1082011##k(N�vel Limite: 50, guerreiro)#l\r\n#L8##b #t1082060##k(N�vel Limite: 60, guerreiro)#l\r\n#L9##b #t1082061##k(N�vel Limite: 60, guerreiro)#l" );
			if ( v2 == 0 ) chat_message4( 1, "#t1082005#", "#v1082007# #t1082007# \r\n#v4011001# #t4011001# \r\n#v4031138# 20.000 mesos", 30 );
			else if ( v2 == 1 ) chat_message4( 2, "#t1082006#", "#v1082007# #t1082007# \r\n#v4011005# 2 #t4011005#s \r\n#v4031138# 25.000 mesos", 30 );
			else if ( v2 == 2 ) chat_message4( 3, "#t1082035#", "#v1082008# #t1082008# \r\n#v4021006# 3 #t4021006#s \r\n#v4031138# 30.000 mesos", 35 );
			else if ( v2 == 3 ) chat_message4( 4, "#t1082036#", "#v1082008# #t1082008# \r\n#v4021008# #t4021008# \r\n#v4031138# 40.000 mesos", 35 );
			else if ( v2 == 4 ) chat_message4( 5, "#t1082024#", "#v1082023# #t1082023# \r\n#v4011003# 4 #t4011003#s \r\n#v4031138# 45.000 mesos", 40 );
			else if ( v2 == 5 ) chat_message4( 6, "#t1082025#", "#v1082023# #t1082023# \r\n#v4021008# 2 #t4021008#s \r\n#v4031138# 50.000 mesos", 40 );
			else if ( v2 == 6 ) chat_message4( 7, "#t1082010#", "#v1082009# #t1082009# \r\n#v4011002# 5 #t4011002#s \r\n#v4031138# 55.000 mesos", 50 );
			else if ( v2 == 7 ) chat_message4( 8, "#t1082011#", "#v1082009# #t1082009# \r\n#v4011006# 4 #t4011006#s \r\n#v4031138# 60.000 mesos", 50 );
			else if ( v2 == 8 ) chat_message4( 9, "#t1082060#", "#v1082059# #t1082059# \r\n#v4011002# 3 #t4011002#s \r\n#v4021005# 5 #t4021005#s \r\n#v4031138# 70.000 mesos", 60 );
			else if ( v2 == 9 ) chat_message4( 10, "#t1082061#", "#v1082059# #t1082059# \r\n#v4021007# 2 #t4021007#s \r\n#v4021008# 2 #t4021008#s \r\n#v4031138# 80.000 mesos", 60 );
		}
		else if ( v1 == 2 ) {
			v2 = self.askMenu( "Ent�o, voc� quer criar alguns materiais, certo? Ok... Que tipos de materiais voc� quer criar?\r\n#L0##bCriar #t4003001# com #t4000003##k#l\r\n#L1##bCriar #t4003001# com #t4000018##k#l\r\n#L2##bCriar #t4003000#s#k#l" );
			if ( v2 == 0 ) chat_message5( 1, "#t4003001#(s)", "#t4000003#es", 10, 1 );
			else if ( v2 == 1 ) chat_message5( 2, "#t4003001#(s)", "#t4000018#s", 5, 1 );
			else if ( v2 == 2 ) chat_message5( 3, "#t4003000#s", "#t4011001#(s) e #t4011000#(s) cada", 1, 15 );
		}
	}
}

function chat_message6( integer index, string makeItem, string needItem, integer reqLevel ) {
	inventory = target.inventory;

	nRet = self.askYesNo( "Para fazer um " + makeItem + ", eu vou precisar dos seguintes materiais. O N�vel Limite � " + reqLevel + ". O que voc� acha? Voc� quer que eu fa�a?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "Ah, verdade? Est� com falta de alguns materiais, n�? J� que voc� vai fiar pela cidade mesmo, v� procurar alguns dos materiais e traga-os para mim... eu vou fazer um item maravilhoso para voc�..." );
	else {
		// Making a claw
		if ( index == 1 ) ret = inventory.exchange( -2000, 4011001, -1, 4000021, -20, 4003000, -5, 1472001, 1 );
		else if ( index == 2 ) ret = inventory.exchange( -3000, 4011000, -2, 4011001, -1, 4000021, -30, 4003000, -10, 1472004, 1 );
		else if ( index == 3 ) ret = inventory.exchange( -15000, 4011000, -3, 4011001, -2, 4000021, -50, 4003000, -20, 1472008, 1 );
		else if ( index == 4 ) ret = inventory.exchange( -30000, 4011000, -4, 4011001, -3, 4000021, -80, 4003000, -25, 1472011, 1 );
		else if ( index == 5 ) ret = inventory.exchange( -40000, 4011000, -3, 4011001, -4, 4000021, -100, 4003000, -30, 1472014, 1 );
		else if ( index == 6 ) ret = inventory.exchange( -50000, 4011000, -4, 4011001, -5, 4000030, -40, 4003000, -35, 1472018, 1 );
		// Making a glove
		else if ( index == 100 ) ret = inventory.exchange( -1000, 4000021, -15, 1082002, 1 );
		else if ( index == 101 ) ret = inventory.exchange( -7000, 4000021, -30, 4000018, -20, 1082029, 1 );
		else if ( index == 102 ) ret = inventory.exchange( -7000, 4000021, -30, 4000015, -20, 1082030, 1 );
		else if ( index == 103 ) ret = inventory.exchange( -7000, 4000021, -30, 4000020, -20, 1082031, 1 );
		else if ( index == 104 ) ret = inventory.exchange( -10000, 4011000, -2, 4000021, -40, 1082032, 1 );
		else if ( index == 105 ) ret = inventory.exchange( -15000, 4011000, -2, 4011001, -1, 4000021, -10, 1082037, 1 );
		else if ( index == 106 ) ret = inventory.exchange( -25000, 4011001, -2, 4000021, -50, 4003000, -10, 1082042, 1 );
		else if ( index == 107 ) ret = inventory.exchange( -30000, 4011001, -3, 4011000, -1, 4000021, -60, 4003000, -15, 1082046, 1 );
		else if ( index == 108 ) ret = inventory.exchange( -40000, 4000021, -80, 4021000, -3, 4000014, -200, 4003000, -30, 1082075, 1 );
		else if ( index == 109 ) ret = inventory.exchange( -50000, 4021005, -3, 4021008, -1, 4000030, -40, 4003000, -30, 1082065, 1 );
		else if ( index == 110 ) ret = inventory.exchange( -70000, 4011007, -1, 4011000, -8, 4021007, -1, 4000030, -50, 4003000, -50, 1082092, 1 );

		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem tudo o que precisa, e se h� um espa�o livre em seu invent�rio de equip." );
		else self.say( "Aqui! Pegue o" + makeItem + ". O que voc� acha? N�o � muito legal? N�o � sempre que se v� uma belezinha dessas!" );
	}
}

function chat_message7( integer index, string makeItem, string needItem ) {
	inventory = target.inventory;

	nRet = self.askYesNo( "Para aperfei�oar um " + makeItem + ", eu vou precisar dos seguintes materiais. Oh, e por favor, certifique-se de n�o usar um item j� aperfei�oado para fazer o novo aperfei�oamento. O que voc� acha? Voc� quer que eu fa�a?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "Ah, verdade? Est� com falta de alguns materiais, n�? J� que voc� vai ficar pela cidade mesmo, v� procurar alguns dos materiais e traga-os para mim... eu vou fazer um item maravilhoso para voc�..." );
	else {
		// Upgrading a claw
		if ( index == 1 ) ret = inventory.exchange( -1000, 1472001, -1, 4011002, -1, 1472002, 1 );
		else if ( index == 2 ) ret = inventory.exchange( -2000 , 1472001, -1, 4011006, -1, 1472003, 1 );
		else if ( index == 3 ) ret = inventory.exchange( -3000 , 1472004, -1, 4011001, -2, 1472005, 1 );
		else if ( index == 4 ) ret = inventory.exchange( -5000 , 1472004, -1, 4011003, -2, 1472006, 1 );
		else if ( index == 5 ) ret = inventory.exchange( -5000 , 1472000, -1, 4011001, -3, 4000021, -20, 4003001, -30, 1472007, 1 );
		else if ( index == 6 ) ret = inventory.exchange( -10000 , 1472008, -1, 4011002, -3, 1472009, 1 );
		else if ( index == 7 ) ret = inventory.exchange( -15000 , 1472008, -1, 4011003, -3, 1472010, 1 );
		else if ( index == 8 ) ret = inventory.exchange( -20000 , 1472011, -1, 4011004, -4, 1472012, 1 );
		else if ( index == 9 ) ret = inventory.exchange( -25000 , 1472011, -1, 4021008, -1, 1472013, 1 );
		// Upgrading a glove
		else if ( index == 100 ) ret = inventory.exchange( -5000, 1082032, -1, 4011002, -1, 1082033, 1 );
		else if ( index == 101 ) ret = inventory.exchange( -7000, 1082032, -1, 4021004, -1, 1082034, 1 );
		else if ( index == 102 ) ret = inventory.exchange( -10000, 1082037, -1, 4011002, -2, 1082038, 1 );
		else if ( index == 103 ) ret = inventory.exchange( -12000, 1082037, -1, 4021004, -2, 1082039, 1 );
		else if ( index == 104 ) ret = inventory.exchange( -15000, 1082042, -1, 4011004, -2, 1082043, 1 );
		else if ( index == 105 ) ret = inventory.exchange( -20000, 1082042, -1, 4011006, -1, 1082044, 1 );
		else if ( index == 106 ) ret = inventory.exchange( -22000, 1082046, -1, 4011005, -3, 1082047, 1 );
		else if ( index == 107 ) ret = inventory.exchange( -25000, 1082046, -1, 4011006, -2, 1082045, 1 );
		else if ( index == 108 ) ret = inventory.exchange( -45000, 1082075, -1, 4011006, -4, 1082076, 1 );
		else if ( index == 109 ) ret = inventory.exchange( -50000, 1082075, -1, 4021008, -2, 1082074, 1 );
		else if ( index == 110 ) ret = inventory.exchange( -55000, 1082065, -1, 4021000, -5, 1082067, 1 );
		else if ( index == 111 ) ret = inventory.exchange( -60000, 1082065, -1, 4011006, -2, 4021008, -1, 1082066, 1 );
		else if ( index == 112 ) ret = inventory.exchange( -70000, 1082092, -1, 4011001, -7, 4000014, -200, 1082093, 1 );
		else if ( index == 113 ) ret = inventory.exchange( -80000, 1082092, -1, 4011006, -7, 4000027, -150, 1082094, 1 );

		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem tudo o que precisa, e se h� um espa�o livre em seu invent�rio de equip.." );
		else self.say( "Aqui! Pegue o" + makeItem + ". O que voc� acha? N�o � muito legal? N�o � sempre que se v� uma belezinha dessas!" );
	}
}

function chat_message8( integer index, string makeItem, string needItem, string itemOption ) {
	inventory = target.inventory;

	nRet = self.askYesNo( "Para aperfei�oar um " + makeItem + ", eu vou precisar dos seguintes materiais. H� tamb�m um aperfei�oamento de #r" + itemOption + "#k com o item. Certifique-se de n�o usar um item j� aperfei�oado como parte do novo aperfei�oamento. O que voc� acha? Voc� quer faz�-lo?\r\n\r\n#b" + needItem );
	if ( nRet == 0 ) self.say( "Ah, verdade? Est� com falta de alguns materiais, n�? J� que voc� vai ficar pela cidade mesmo, v� procurar alguns dos materiais e traga-os para mim... eu vou fazer um item maravilhoso para voc�..." );
	else {
		if ( index == 1 ) ret = inventory.exchange( -30000 , 1472014, -1, 4021000, -5, 1472015, 1 );
		else if ( index == 2 ) ret = inventory.exchange( -30000 , 1472014, -1, 4011003, -5, 1472016, 1 );
		else if ( index == 3 ) ret = inventory.exchange( -35000 , 1472014, -1, 4021008, -2, 1472017, 1 );
		else if ( index == 4 ) ret = inventory.exchange( -40000 , 1472018, -1, 4021000, -6, 1472019, 1 );
		else if ( index == 5 ) ret = inventory.exchange( -40000 , 1472018, -1, 4021005, -6, 1472020, 1 );

		if ( ret == 0 ) self.say( "Por favor, verifique com cuidado se voc� tem tudo o que precisa, e se h� um espa�o livre em seu invent�rio de equip.." );
		else self.say( "Aqui! Pegue o" + makeItem + ". O que voc� acha? N�o � muito legal? N�o � sempre que se v� uma belezinha dessas!" );
	}
}

function chat_message9( integer index, string makeItem, string needItem, integer needNumber, integer itemNumber ) {
	inventory = target.inventory;

	nRetNum = self.askNumber( "Com #b" + needNumber + " " + needItem + "#k, eu posso criar" + itemNumber + " " + makeItem + ". Fique feliz, pois este aqui vai sair de gra�a. O que voc� acha? Quantos voc� gostaria de criar?", 0, 0, 100 );
	nNeedNum = nRetNum * needNumber;
	nAllNum = nRetNum * itemNumber;
	nRetBuy = self.askYesNo( "Voc� quer fazer #b" + makeItem + " " + nRetNum + "vezes#k? Eu vou precisar de  #r" + nNeedNum + " " + needItem + "#k para faz�-lo." );
	if ( nRetBuy == 0 ) self.say( "Parece que voc� n�o tem todos os itens necess�rios para isso. J� que voc� vai ficar pela cidade mesmo, v� procurar alguns dos materiais e traga-os para mim... Eu vou fazer um item maravilhoso para voc�..." );
	else {
		if ( index == 1 ) ret = inventory.exchange( 0, 4000003, -nNeedNum, 4003001, nAllNum );
		else if ( index == 2 ) ret = inventory.exchange( 0, 4000018, -nNeedNum, 4003001, nAllNum );
		else if ( index == 3 ) ret = inventory.exchange( 0, 4011001, -nNeedNum, 4011000, -nNeedNum, 4003000, nAllNum );
		if ( ret == 0 ) self.say(  "Por favor, verifique com cuidado se voc� tem tudo o que precisa, e se h� um espa�o livre em seu invent�rio de etc.." );
		else self.say( "Aqui! Pegue" + nAllNum + " " + makeItem + ". O que voc� acha? N�o � muito legal? N�o � sempre que se v� uma belezinha dessas!" );
	}
}

// creating and upgrading items at kerning city
script "refine_kerning" {
	nRet1 = self.askYesNo( "Por acaso voc� tem um mineral ou um #t4000021# ? Com uma taxa, eu posso fazer um equipamento de gatuno perfeito para voc�. Ah, sim! N�o conte a ningu�m sobre meus neg�cios aqui nessa cidade. Ent�o, voc� quer mesmo?" );
	if ( nRet1 == 0 ) self.say( "Mesmo? Voc� n�o vai se arrepender nem um pouquinho se me deixar fazer isso... se mudar de id�ia basta me procurar e n�s faremos neg�cios..." );
	else {
		v1 = self.askMenu( "Bem, a taxa ser� razo�vel, n�o precisa se preocupar. O que voc� quer fazer?\r\n#b#L0# Criar uma garra#l\r\n#L1# Criar uma luva#l\r\n#L2# Aperfei�oar uma garra#l\r\n#L3# Aperfei�oar uma luva#l\r\n#L4# Criar materiais#l" );;
		if ( v1 == 0 ) {
			v2 = self.askMenu( "A garra � a luva que voc� colocou para jogar shurikens. Mas ela � in�til para os gatunos que usam adagas. Agora, que tipo de garra que voc� quer que eu crie?\r\n#L0##b #t1472001##k(N�vel Limite: 15, gatuno)#l\r\n#L1##b #t1472004##k(N�vel Limite: 20, gatuno)#l\r\n#L2##b #t1472008##k(N�vel Limite: 30, gatuno)#l\r\n#L3##b #t1472011##k(N�vel Limite: 35, gatuno)#l\r\n#L4##b #t1472014##k(N�vel Limite: 40, gatuno)#l\r\n#L5##b #t1472018##k(N�vel Limite: 50, gatuno)#l" );
			if ( v2 == 0 ) chat_message6( 1, "#t1472001#", "#v4011001# #t4011001# \r\n#v4000021# 20 #t4000021#s \r\n#v4003000# 5 #t4003000#s \r\n#v4031138# 2000 mesos", 15 );
			else if ( v2 == 1 ) chat_message6( 2, "#t1472004#", "#v4011000# 2 #t4011000#s \r\n#v4011001# #t4011001# \r\n#v4000021# 30 #t4000021#s \r\n#v4003000# 10 #t4003000#s \r\n#v4031138# 3000 mesos", 20 );
			else if ( v2 == 2 ) chat_message6( 3, "#t1472008#", "#v4011000# 3 #t4011000#s \r\n#v4011001# 2 #t4011001#s \r\n#v4000021# 50 #t4000021#s \r\n#v4003000# 20 #t4003000#s \r\n#v4031138# 15000 mesos", 30 );
			else if ( v2 == 3 ) chat_message6( 4, "#t1472011#", "#v4011000# 4 #t4011000#s \r\n#v4011001# 3 #t4011001#s \r\n#v4000021# 80#t4000021#s \r\n#v4003000# 25 #t4003000#s \r\n#v4031138# 30000 mesos", 35 );
			else if ( v2 == 4 ) chat_message6( 5, "#t1472014#", "#v4011000# 3 #t4011000#s \r\n#v4011001# 4 #t4011001#s \r\n#v4000021# 100 #t4000021#s \r\n#v4003000# 30 #t4003000#s \r\n#v4031138# 40000 mesos", 40 );
			else if ( v2 == 5 ) chat_message6( 6, "#t1472018#", "#v4011000# 4 #t4011000#s \r\n#v4011001# 5 #t4011001#s \r\n#v4000030# 40 #t4000030#s \r\n#v4003000# 35 #t4003000#s \r\n#v4031138# 50000 mesos", 50 );
		}
		else if ( v1 == 1 ) {
			v2 = self.askMenu( "Agora... que tipo de luva voc� quer que eu crie?\r\n#L0##b #t1082002##k(N�vel Limite: 10, todos)#l\r\n#L1##b #t1082029##k(N�vel Limite: 15, gatuno)#l\r\n#L2##b #t1082030##k(N�vel Limite: 15, gatuno)#l\r\n#L3##b #t1082031##k(N�vel Limite: 15, gatuno)#l\r\n#L4##b #t1082032##k(N�vel Limite: 20, gatuno)#l\r\n#L5##b #t1082037##k(N�vel Limite: 25, gatuno)#l\r\n#L6##b #t1082042##k(N�vel Limite: 30, gatuno)#l\r\n#L7##b #t1082046##k(N�vel Limite: 35, gatuno)#l\r\n#L8##b #t1082075##k(N�vel Limite: 40, gatuno)#l\r\n#L9##b #t1082065##k(N�vel Limite: 50, gatuno)#l\r\n#L10##b #t1082092##k(N�vel Limite: 60, gatuno)#l" );
			if ( v2 == 0 ) chat_message6( 100, "#t1082002#", "#v4000021# 15 #t4000021#s \r\n#v4031138# 1.000 mesos", 10 );
			else if ( v2 == 1 ) chat_message6( 101, "#t1082029#", "#v4000021# 30 #t4000021#s \r\n#v4000018# 20 #t4000018#s \r\n#v4031138# 7.000 mesos", 15 );
			else if ( v2 == 2 ) chat_message6( 102, "#t1082030#", "#v4000021# 30 #t4000021#s \r\n#v4000015# 20 #t4000015#s \r\n#v4031138# 7.000 mesos", 15 );
			else if ( v2 == 3 ) chat_message6( 103, "#t1082031#", "#v4000021# 30 #t4000021#s \r\n#v4000020# 20 #t4000020#s \r\n#v4031138# 7.000 mesos", 15 );
			else if ( v2 == 4 ) chat_message6( 104, "#t1082032#", "#v4011000# 2 #t4011000#s \r\n#v4000021# 40 #t4000021#s \r\n#v4031138# 10.000 mesos", 20 );
			else if ( v2 == 5 ) chat_message6( 105, "#t1082037#", "#v4011000# 2 #t4011000#s \r\n#v4011001# #t4011001# \r\n#v4000021# 10 #t4000021#s \r\n#v4031138# 15.000 mesos", 25 );
			else if ( v2 == 6 ) chat_message6( 106, "#t1082042#", "#v4011001# 2 #t4011001#s \r\n#v4000021# 50 #t4000021#s \r\n#v4003000# 10 #t4003000#s \r\n#v4031138# 25.000 mesos", 30 );
			else if ( v2 == 7 ) chat_message6( 107, "#t1082046#", "#v4011001# 3 #t4011001#s \r\n#v4011000# #t4011000# \r\n#v4000021# 60 #t4000021#s \r\n#v4003000# 15 #t4003000#s \r\n#v4031138# 30.000 mesos", 35 );
			else if ( v2 == 8 ) chat_message6( 108, "#t1082075#", "#v4021000# 3 #t4021000#s \r\n#v4000014# 200 #t4000014#s \r\n#v4000021# 80 #t4000021#s \r\n#v4003000# 30 #t4003000#s \r\n#v4031138# 40.000 mesos", 40 );
			else if ( v2 == 9 ) chat_message6( 109, "#t1082065#", "#v4021005# 3 #t4021005#s \r\n#v4021008# #t4021008# \r\n#v4000030# 40 #t4000030#s \r\n#v4003000# 30 #t4003000#s \r\n#v4031138# 50.000 mesos", 50 );
			else if ( v2 == 10 ) chat_message6( 110, "#t1082092#", "#v4011007# #t4011007# \r\n#v4011000# 8 #t4011000#s \r\n#v4021007# #t4021007# \r\n#v4000030# 50 #t4000030#s \r\n#v4003000# 50 #t4003000#s \r\n#v4031138# 70.000 mesos", 60 );
		}
		else if ( v1 == 2 ) {
			self.say( "Voc� quer aperfei�oar uma garra? Ok, ent�o. Mas vou te dar um conselho: Todos os itens que ser�o usados para o aperfei�oamento ir�o desaparecer, e se voc� usar um item que j� tenha sido #raperfei�oado#k com um pergaminho, n�o haver� efeito quando aperfei�oado. Leve isso em considera��o quando for tomar a decis�o, certo?" );
			v2 = self.askMenu( "A garra � o equipamento que se veste para jogar shurikens. Mas ela � in�til para os gatunos que usam adagas. Bem, que tipo de Garra voc� quer criar? \r\n#L0##b #t1472002##k(N�vel Limite: 15, gatuno)#l\r\n#L1##b #t1472003##k(N�vel Limite: 15, gatuno)#l\r\n#L2##b #t1472005##k(N�vel Limite: 20, gatuno)#k#l\r\n#L3##b #t1472006##k(N�vel Limite: 20, gatuno)#l\r\n#L4##b #t1472007##k(N�vel Limite: 25, gatuno)#l\r\n#L5##b #t1472009##k(N�vel Limite: 30, gatuno)#l\r\n#L6##b #t1472010##k(N�vel Limite: 30, gatuno)#l\r\n#L7##b #t1472012##k(N�vel Limite: 35, gatuno)#l\r\n#L8##b #t1472013##k(N�vel Limite: 35, gatuno)#l\r\n#L9##b #t1472015##k(N�vel Limite: 40, gatuno)#l\r\n#L10##b #t1472016##k(N�vel Limite: 40, gatuno)#l\r\n#L11##b #t1472017##k(N�vel Limite: 40, gatuno)#l\r\n#L12##b #t1472019##k(N�vel Limite: 50, gatuno)#l\r\n#L13##b #t4021005# Eliminar#k(N�vel Limite: 50, gatuno)#l" );
			if ( v2 == 0 ) chat_message7( 1, "#t1472002#", "#v1472001# #t1472001# \r\n#v4011002# #t4011002# \r\n#v4031138# 1.000 mesos" );
			else if ( v2 == 1 ) chat_message7( 2, "#t1472003#", "#v1472001# #t1472001# \r\n#v4011006# #t4011006# \r\n#v4031138# 2.000 mesos" );
			else if ( v2 == 2 ) chat_message7( 3, "#t1472005#", "#v1472004# #t1472004# \r\n#v4011001# 2 #t4011001#s \r\n#v4031138# 3.000 mesos" );
			else if ( v2 == 3 ) chat_message7( 4, "#t1472006#", "#v1472004# #t1472004# \r\n#v4011003# 2 #t4011003#s \r\n#v4031138# 5.000 mesos" );
			else if ( v2 == 4 ) chat_message7( 5, "#t1472007#", "#v1472000# #t1472000# \r\n#v4011001# 3 #t4011001#s \r\n#v4000021# 20 #t4000021#s \r\n#v4003001# 30 #t4003001#s \r\n#v4031138# 5.000 mesos" );
			else if ( v2 == 5 ) chat_message7( 6, "#t1472009#", "#v1472008# #t1472008# \r\n#v4011002# 3 #t4011002#s \r\n#v4031138# 10.000 mesos" );
			else if ( v2 == 6 ) chat_message7( 7, "#t1472010#", "#v1472008# #t1472008# \r\n#v4011003# 3 #t4011003#s \r\n#v4031138# 15.000 mesos" );
			else if ( v2 == 7 ) chat_message7( 8, "#t1472012#", "#v1472011# #t1472011# \r\n#v4011004# 4 #t4011004#s \r\n#v4031138# 20.000 mesos" );
			else if ( v2 == 8 ) chat_message7( 9, "#t1472013#", "#v1472011# #t1472011# \r\n#v4021008# #t4021008# \r\n#v4031138# 25.000 mesos" );
			else if ( v2 == 9 ) chat_message8( 1, "#t1472015#", "#v1472014# #t1472014# \r\n#v4021000# 5 #t4021000#s \r\n#v4031138# 30.000 mesos", "DEX +2" );
			else if ( v2 == 10 ) chat_message8( 2, "#t1472016#", "#v1472014# #t1472014# \r\n#v4011003# 5 #t4011003#s \r\n#v4031138# 30.000 mesos", "LUK +2" );
			else if ( v2 == 11 ) chat_message8( 3, "#t1472017#", "#v1472014# #t1472014# \r\n#v4021008# 2 #t4021008#s \r\n#v4031138# 35.000 mesos", "LUK +3" );
			else if ( v2 == 12 ) chat_message8( 4, "#t1472019#", "#v1472018# #t1472018# \r\n#v4021000# 6 #t4021000#s \r\n#v4031138# 40.000 mesos", "DEX +3" );
			else if ( v2 == 13 ) chat_message8( 5, "#t1472020#", "#v1472018# #t1472018# \r\n#v4021005# 6 #t4021005#s \r\n#v4031138# 40.000 mesos", "LUK +3" );
		}
		else if ( v1 == 3 ) {
			self.say( "Voc� quer aperfei�oar uma luva? Ok, ent�o. Mas vou te dar um conselho: Todos os itens que ser�o usados para o aperfei�oamento ir�o desaparecer, e se voc� usar um item que j� tenha sido #raperfei�oado#k com um pergaminho, n�o haver� efeito quando aperfei�oado. Leve isso em considera��o quando for tomar a decis�o, certo?" );
			v2 = self.askMenu( "Ent�o... que tipo de luva voc� quer aperfei�oar? \r\n#L0##b #t1082033##k(N�vel Limite: 20, gatuno)#l\r\n#L1##b #t1082034##k(N�vel Limite: 20, gatuno)#l\r\n#L2##b #t1082038##k(N�vel Limite: 25, gatuno)#l\r\n#L3##b #t1082039##k(N�vel Limite: 25, gatuno)#l\r\n#L4##b #t1082043##k(N�vel Limite: 30, gatuno)#l\r\n#L5##b #t1082044##k(N�vel Limite: 30, gatuno)#l\r\n#L6##b #t1082047##k(N�vel Limite: 35, gatuno)#l\r\n#L7##b #t1082045##k(N�vel Limite: 35, gatuno)#l\r\n#L8##b #t1082076##k(N�vel Limite: 40, gatuno)#l\r\n#L9##b #t1082074##k(N�vel Limite: 40, gatuno)#l\r\n#L10##b #t1082067##k(N�vel Limite: 50, gatuno)#l\r\n#L11##b #t1082066##k(N�vel Limite: 50, gatuno)#l\r\n#L12##b #t1082093##k(N�vel Limite: 60, gatuno)#l\r\n#L13##b #t1082094##k(N�vel Limite: 60, gatuno)#l" );
			if ( v2 == 0 ) chat_message7( 100, "#t1082033#", "#v1082032# #t1082032# \r\n#v4011002# #t4011002# \r\n#v4031138# 5.000 mesos" );
			else if ( v2 == 1 ) chat_message7( 101, "#t1082034#", "#v1082032# #t1082032# \r\n#v4021004# #t4021004# \r\n#v4031138# 7.000 mesos" );
			else if ( v2 == 2 ) chat_message7( 102, "#t1082038#", "#v1082037# #t1082037# \r\n#v4011002# 2 #t4011002#s \r\n#v4031138# 10.000 mesos" );
			else if ( v2 == 3 ) chat_message7( 103, "#t1082039#", "#v1082037# #t1082037# \r\n#v4021004# 2 #t4021004#s \r\n#v4031138# 12.000 mesos" );
			else if ( v2 == 4 ) chat_message7( 104, "#t1082043#", "#v1082042# #t1082042# \r\n#v4011004# 2 #t4011004#s \r\n#v4031138# 15.000 mesos" );
			else if ( v2 == 5 ) chat_message7( 105, "#t1082044#", "#v1082042# #t1082042# \r\n#v4011006# #t4011006# \r\n#v4031138# 20.000 mesos" );
			else if ( v2 == 6 ) chat_message7( 106, "#t1082047#", "#v1082046# #t1082046# \r\n#v4011005# 3 #t4011005#s \r\n#v4031138# 22.000 mesos" );
			else if ( v2 == 7 ) chat_message7( 107, "#t1082045#", "#v1082046# #t1082046# \r\n#v4011006# 2 #t4011006#s \r\n#v4031138# 25.000 mesos" );
			else if ( v2 == 8 ) chat_message7( 108, "#t1082076#", "#v1082075# #t1082075# \r\n#v4011006# 4 #t4011006#s \r\n#v4031138# 45.000 mesos" );
			else if ( v2 == 9 ) chat_message7( 109, "#t1082074#", "#v1082075# #t1082075# \r\n#v4021008# 2 #t4021008#s \r\n#v4031138# 50.000 mesos" );
			else if ( v2 == 10 ) chat_message7( 110, "#t1082067#", "#v1082065# #t1082065# \r\n#v4021000# 5 #t4021000#s \r\n#v4031138# 55.000 mesos" );
			else if ( v2 == 11 ) chat_message7( 111, "#t1082066#", "#v1082065# #t1082065# \r\n#v4011006# 2 #t4011006#s \r\n#v4021008# #t4021008# \r\n#v4031138# 60.000 mesos" );
			else if ( v2 == 12 ) chat_message7( 112, "#t1082093#", "#v1082092# #t1082092# \r\n#v4011001# 7 #t4011001#s \r\n#v4000014# 200 #t4000014#s \r\n#v4031138# 70.000 mesos" );
			else if ( v2 == 13 ) chat_message7( 113, "#t1082094#", "#v1082092# #t1082092# \r\n#v4011006# 7 #t4011006#s \r\n#v4000027# 150 #t4000027#s \r\n#v4031138# 80.000 mesos" );
		}
		else if ( v1 == 4 ) {
			v2 = self.askMenu( "Voc� disse que deseja criar um material? Muito bem... de que tipo?\r\n#L0##b Criar #t4003001# com #t4000003##k#l\r\n#L1##b Criar #t4003001# com #t4000018##k#l\r\n#L2##b Criar #t4003000# #k#l" );
			if ( v2 == 0 ) chat_message9( 1, "#t4003001#(s)", "#t4000003#es", 10, 1 );
			else if ( v2 == 1 ) chat_message9( 2, "#t4003001#(s)", "#t4000018#s", 5, 1 );
			else if ( v2 == 2 ) chat_message9( 3, "#t4003000#s", "#t4011001# e #t4011000# cada", 1, 15 );
		}
	}
}
