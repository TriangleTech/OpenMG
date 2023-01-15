module "standard.s";

// Send the character to Christmas Town
script "06_go_xmas" {
	field = self.field;
	qr = target.questRecord;

	if ( field.id == 101000000 ) {
		nRet = self.askYesNo( "Voc� j� ouviu falar de uma cidade Natalina toda coberta de neve que n�o fica muito longe de #m101000000#? � um lugar lindo e sossegado, todo coberto de neve. Voc� quer entrar? Hummm... N�o posso levar voc� l�, assim... Ah, sim! Arranje #b10 #t4000004#s, 10 #t4000003#s e 1000 mesos#k , com isso eu posso levar voc� l�. O que voc� acha? Quer ir at� l�?" );
		if ( nRet == 0 ) self.say( "Voc� deve estar sem tempo, hein? Se voc� tiver tempo mais tarde, passe aqui novamente.  Uma cidade toda coberta de neve... Seu cora��o n�o dispara s� de pensar nisso?" );
		else {
			inventory = target.inventory;
			ret = inventory.exchange( -1000, 4000004, -10, 4000003, -10 );
			if ( ret == 0 ) self.say( "Tem certeza de que tem #b10 #t4000004#s e 10 #t4000003#s e 1000 mesos#k? N�o posso deixar voc� entrar sem aqueles dois e algum dinheiro~" );
			else {
				qr.set( 9002, "0" );
				registerTransferField( 209000000, "st00" );
			}
		}
	}
	else if ( field.id == 211000000 ) {
		nRet = self.askYesNo( "Voc� j� ouviu falar de uma cidade Natalina toda coberta de neve que n�o fica muito longe de #m211000000#? � um lugar lindo e sossegado, todo coberto de neve. Voc� quer entrar? Humm... Hummm... N�o posso levar voc� l�, assim... Ah, sim! Arranje #b10 #t4000086#s, 10 #t4000088#s e 1000 mesos#k , e levo voc� at� l�. O que voc� acha? Quer ir at� l�?" );
		if ( nRet == 0 ) self.say( "Voc� deve estar sem tempo, hein? Se voc� tiver tempo mais tarde, passe aqui novamente.  Uma cidade toda coberta de neve... Seu cora��o n�o dispara s� de pensar nisso?" );
		else {
			inventory = target.inventory;
			ret = inventory.exchange( -1000, 4000086, -10, 4000088, -10 );
			if ( ret == 0 ) self.say( "Tem certeza de que tem #b10 #t4000086#s e 10 #t4000088#s, e 1000 mesos#k? N�o posso deixar voc� entrar sem aqueles dois e algum dinheiro~" );
			else {
				qr.set( 9002, "1" );
				registerTransferField( 209000000, "st00" );
			}
		}
	}
	else if ( field.id == 220000300 ) {
		nRet = self.askYesNo( "Voc� j� ouviu falar de uma cidade Natalina toda coberta de neve que n�o fica muito longe de #m220000300#? � um lugar lindo e sossegado, todo coberto de neve. Voc� quer entrar? Humm... Hummm... N�o posso levar voc� l�, assim... Ah, sim! Arranje #b10 #t4000095#s, 10 #t4000106#s e 1000 mesos#k , e eu levo voc� at� l�. O que voc� acha? Quer ir at� l�?" );
		if ( nRet == 0 ) self.say( "Voc� deve estar sem tempo, hein? Se voc� estiver com tempo mais tarde, passe aqui novamente.  Uma cidade toda coberta de neve... Seu cora��o n�o dispara s� de pensar nisso?" );
		else {
			inventory = target.inventory;
			ret = inventory.exchange( -1000, 4000095, -10, 4000106, -10 );
			if ( ret == 0 ) self.say( "Tem certeza de que tem #b10 #t4000095#s e 10 #t4000106#s, e 1000 mesos#k? N�o posso deixar voc� entrar sem aqueles dois e algum dinheiro~" );
			else {
				qr.set( 9002, "2" );
				registerTransferField( 209000000, "st00" );
			}
		}
	}
}

script "go_xmas" { 									
	field = self.field;					
    qr = target.questRecord;
	val = qr.get( 8640 );				
									
	inventory = target.inventory;
									
	cTime = currentTime;
	aTime = compareTime( cTime, val );	
									
	esTime = compareTime( cTime, "07/11/20/00/00" ); // check for the event-starting time								
	eeTime = compareTime( "08/01/15/23/00", cTime ); // check for the time after the event is over								
									
	if ( esTime < 0 ) self.say( "Sinto muito, Vila Feliz ainda n�o est� aberta ao p�blico~ Seja paciente!" );								
	else {								
		if ( eeTime < 0 ) self.say( "Desculpe, mas Vila Feliz est� fechada." );							
		else {							
			qr = target.questRecord;
			val1 = qr.getState( 4437 ); // ���Ǵ� ����Ʈ�� �Ϸ��ϰ� �� ���� ��ȭ ( �����̴� ���� ^ ^; )						
									
			if ( val1 == 1 or val1 == 2 ) { 						
				if ( field.id == 250000000 ) {					
					nRet = self.askYesNo( "Ahhh~ Voc� arranjou o requerimento do jornaleiro~ Est� #Gcurioso:curiosa# em ver quantas aventuras Vila Feliz reservou para voc�?  Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "0" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}
				else if ( field.id == 101000000 ) {					
					nRet = self.askYesNo( "Ahhh~ Voc� arranjou o requerimento do jornaleiro~ Est� #Gcurioso:curiosa# em ver quantas aventuras Vila Feliz reservou para voc�?  Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "1" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}					
				else if ( field.id == 200000000 ) {					
					nRet = self.askYesNo( "Ahhh~ Voc� arranjou o requerimento do jornaleiro~ Est� #Gcurioso:curiosa# em ver quantas aventuras Vila Feliz reservou para voc�?  Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "2" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}
				else if ( field.id == 211000000 ) {					
					nRet = self.askYesNo( "Ahhh~ Voc� arranjou o requerimento do jornaleiro~ Est� #Gcurioso:curiosa# em ver quantas aventuras Vila Feliz reservou para voc�?  Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "3" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}					
				else if ( field.id == 220000300 ) {					
					nRet = self.askYesNo( "Ahhh~ Voc� arranjou o requerimento do jornaleiro~ Est� #Gcurioso:curiosa# em ver quantas aventuras Vila Feliz reservou para voc�?  Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "4" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}
				else if ( field.id == 600000000 ) {					
					nRet = self.askYesNo( "Ahhh~ Voc� arranjou o requerimento do jornaleiro~ Est� #Gcurioso:curiosa# em ver quantas aventuras Vila Feliz reservou para voc�?  Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "5" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}
				else if ( field.id == 100000000 ) {					
					nRet = self.askYesNo( "Ahhh~ Voc� arranjou o requerimento do jornaleiro~ Est� #Gcurioso:curiosa# em ver quantas aventuras Vila Feliz reservou para voc�?  Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "6" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}				
			}						
			else if ( val1 == 0 ) { 						
				if ( field.id == 250000000 ) {					
					nRet = self.askYesNo( "Voc� est� #Gcurioso:curiosa# sobre as aventuras que Happyville guardou para voc�?  Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "0" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}
				else if ( field.id == 101000000 ) {					
					nRet = self.askYesNo( "Voc� est� #Gcurioso:curiosa# sobre as aventuras que Happyville guardou para voc�?  Vamos~~" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "1" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}					
				else if ( field.id == 200000000 ) {					
					nRet = self.askYesNo( "Voc� est� #Gcurioso:curiosa# sobre as aventuras que Vila Feliz reservou para voc�?  Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "2" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}
				else if ( field.id == 211000000 ) {					
					nRet = self.askYesNo( "Voc� est� #Gcurioso:curiosa# sobre as aventuras que Vila Feliz reservou para voc�? Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "3" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}					
				else if ( field.id == 220000300 ) {					
					nRet = self.askYesNo( "Voc� est� #Gcurioso:curiosa# sobre as aventuras que Vila Feliz reservou para voc�? Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "4" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}
				else if ( field.id == 600000000 ) {					
					nRet = self.askYesNo( "Voc� est� #Gcurioso:curiosa# sobre as aventuras que Vila Feliz reservou para voc�? Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "5" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}
				else if ( field.id == 100000000 ) {					
					nRet = self.askYesNo( "Voc� est� #Gcurioso:curiosa# sobre as aventuras que Vila Feliz reservou para voc�? Vamos!" );				
					if ( nRet == 0 ) self.say( "Parece que voc� est� muito #Gocupado:ocupada# agora. Se arranjar algum tempo livre durante a sua jornada, por favor, venha me ver! Voc� vai desvendar uma cidade Natalina como nenhuma outra~" );				
					else {				
						qr.set( 9002, "6" );			
						registerTransferField( 209000000, "st00" );			
					}				
				}				
			}					
		}							
	}								
}									

// Leaving the christmas town : beginners go for free; others require a christmas ornament
script "go_victoria" {
	qr = target.questRecord;
	val = qr.get( 9002 );

	if ( val == "0" ) nRet = self.askYesNo( "Voc� n�o tem mais nada para fazer aqui, h�? Quer voltar para #m250000000#? Se quiser voltar, posso te mandar de volta para #m250000000# agora mesmo. O que voc� acha? Voc� quer voltar?" );
	else if ( val == "1" ) nRet = self.askYesNo( "Voc� n�o tem mais nada para fazer aqui, h�? Quer voltar para #m1010000 na Ilha Vit�ria? Se quiser voltar, posso te mandar de volta para #m101000000# agora mesmo. O que voc� acha? Voc� quer voltar?" );
	else if ( val == "2" ) nRet = self.askYesNo( "Voc� n�o tem mais nada para fazer aqui, h�? Quer voltar para #m200000000# em Ossyria? Se quiser voltar, posso te mandar de volta para #m200000000# agora mesmo. O que voc� acha? Voc� quer voltar?" );
	else if ( val == "3" ) nRet = self.askYesNo( "Voc� n�o tem mais nada para fazer aqui, h�? Quer voltar para #m200000000# em Ossyria? Se quiser voltar, posso te mandar de volta para #m211000000# agora mesmo. O que voc� acha? Voc� quer voltar?" );
	else if ( val == "4" ) nRet = self.askYesNo( "Voc� n�o tem mais nada para fazer aqui, h�? Quer voltar para #m2000000300# em Ossyria? Se quiser voltar, posso te mandar de volta para #m220000300# agora mesmo. O que voc� acha? Voc� quer voltar?" );
	else if ( val == "5" ) nRet = self.askYesNo( "Voc� n�o tem mais nada para fazer aqui, h�? Quer voltar para #m600000000# em Masteria? Se quiser voltar, posso te mandar de volta para #m600000000# agora mesmo. O que voc� acha? Voc� quer voltar?" );
	else nRet = self.askYesNo( "Voc� n�o tem mais nada para fazer aqui, h�? Quer voltar para #m101000000# na Ilha Vit�ria? Se quiser voltar, posso te mandar de volta para #m100000000# agora mesmo. O que voc� acha? Voc� quer voltar?" );

	if ( nRet == 0 ) self.say( "Voc� deve ter algum neg�cio para resolver aqui, certo? N�o � m� id�ia descansar um pouco nesta �rea e recuperar toda a sua for�a antes de voltar l�, novamente." );
	else {
		inven = target.inventory;
		ItemB = inven.itemCount( 1472063 ) ;
		ItemC = inven.itemCount( 2060005 ) ;
		ItemD = inven.itemCount( 2060006 ) ;

		if ( ItemB > 0 ) ret = inven.exchange( 0, 1472063 , -ItemB );

		if ( ItemC > 0 ) ret = inven.exchange( 0, 2060005 , -ItemC ); 

		if ( ItemD > 0 ) ret = inven.exchange( 0, 2060006 , -ItemD );

		inven.removeEquippedItem( 1472063 );
		inven.removeEquippedItem( 2060005 );
		inven.removeEquippedItem( 2060006 );
		
		if ( val == "0" ) registerTransferField( 250000000, "xmas00" );
		else if ( val == "1" ) registerTransferField( 101000000, "xmas00" );
		else if ( val == "2" ) registerTransferField( 200000000, "xmas00" );
		else if ( val == "3" ) registerTransferField( 211000000, "xmas00" );
		else if ( val == "4" ) registerTransferField( 220000300, "xmas00" );
		else if ( val == "5" ) registerTransferField( 600000000, "xmas00" );		
		else registerTransferField( 100000000, "xmas00" );
	}
}

// decorating tree NPC
script "desc_tree" {
	self.say( "Voc� v� um grupo de bonecos de neve parados logo ali? Fale com um deles, isso vai lev�-lo � famosa �rvore de Natal ( ela � gigantesca! Enquanto estiver por l�, voc� pode redecorar a �rvore usando v�rios tipos de enfeites. O que voc� acha? Parece legal, n�?" );
	self.say( "Apenas 6 de cada vez podem estar presentes em cada mapa, e voc� n�o pode #bfazer com�rcio ou abrir uma loja#k l�. Al�m disso, apenas voc� pode recolher os enfeites que derrubar no caminho, n�o se preocupe em perd�-los por aqui." );
	self.say( "Claro, os itens que voc� derruba no mapa n�o v�o desaparecer nunca. Quando voc� estiver pronto, pode sair pelo boneco de neve que est� dentro. Quando voc� sair, n�o vai mais poder recuperar os itens derrubados dentro do mapa, portanto, n�o se preocupe em recolher esses itens.  N�o � agrad�vel?" );
	self.say( "Bem, v� at� #p2002001#, compre mais enfeites de Natal por l� e depois decore a �rvore com eles~ Demais! O enfeite maior e mais bonito n�o � vendido por ele.  Provavelmente j� foi... levado por algum monstro!  Dum dum dum~" );
}

function go_tree( integer v, integer map ) {
	if ( v == 0 ) str = "Primeiro";
	else if ( v == 1 ) str = "Segundo";
	else if ( v == 2 ) str = "Terceiro";
	else if ( v == 3 ) str = "Quarto";
	else if ( v == 4 ) str = "Quinto";

	field = Field( map + v );
	if ( field.getUserCount < 6 ) registerTransferField( map + v, "" );
	else self.say( "Voc� vai entrar #bna sala que foi" + str + "�rvore#k? Humm... Desculpe, mas aqui est� lotado neste momento. Por favor, entre em outra sala~" );
}

// The NPC1 that leads the users to the map that decorates the tree
script "go_tree1" {
	v = self.askMenu( "Ol�~ sou #p2001001#. Posso levar voc� at� a sala onde fica a �rvore de Natal gigantesca! Para mais informa��es, fale com #b#p2001000##k. Em qual sala voc� vai entrar? \r\n#b#L0#TNa sala com a primeira �rvore#l\r\n#L1#T, na sala com a segunda �rvore#l\r\n#L2#T, na sala com a terceira �rvore#l\r\n#L3#T, na sala com a quarta �rvore#l\r\n#L4#T, na sala com a quinta �rvore#l" );
	go_tree( v, 209000001 );
}

// The NPC2 that leads the users to the map that decorates the tree
script "go_tree2" {
	v = self.askMenu( "Ol�~ sou #p2001002#. Posso levar voc� at� a sala onde fica a �rvore de Natal gigantesca! Para mais informa��es, fale com #b#p2001000##k. Em qual sala voc� vai entrar? \r\n#b#L0#TNa sala com a primeira �rvore#l\r\n#L1#T, na sala com a segunda �rvore#l\r\n#L2#T, na sala com a terceira �rvore#l\r\n#L3#T, na sala com a quarta �rvore#l\r\n#L4#T, na sala com a quinta �rvore#l" );
	go_tree( v, 209000006 );
}

// The NPC3 that leads the users to the map that decorates the tree
script "go_tree3" {
	v = self.askMenu( "Ol�~ sou #p2001003#. Posso levar voc� at� a sala onde fica a �rvore de Natal gigantesca! Para mais informa��es, fale com #b#p2001000##k. Em qual sala voc� vai entrar? \r\n#b#L0#TNa sala com a primeira �rvore#l\r\n#L1#T, na sala com a segunda �rvore#l\r\n#L2#T, na sala com a terceira �rvore#l\r\n#L3#T, na sala com a quarta �rvore#l\r\n#L4#T, na sala com a quinta �rvore#l" );
	go_tree( v, 209000011 );
}

// The NPC that lets you leave the map of decorating trees
script "out_tree" {
	nRet = self.askYesNo( "J� decorou uma �rvore e deixou ela bem bonita? Decorar uma �rvore de Natal com outras pessoas � uma experi�ncia interessante. N�o acha?  Ah �... tem certeeeeza que quer deixar esse lugar?" );
	if ( nRet == 0 ) self.say( "Voc� precisa de mais tempo para decorar a �rvore, h�? Se voc� quiser sair daqui, pode vir falar comigo~" );
	else registerTransferField( 209000000, "" );
}

// Torre Event
script "thor" {
	if ( target.nLevel > 9 ) {
		cTime = currentTime;

		esTime = compareTime( cTime, "07/11/20/00/00" );
		eeTime = compareTime( "08/01/15/23/59", cTime );

		if ( esTime < 0 ) self.say( "O evento ainda n�o come�ou. Por favor, espere." );
		else {
			if ( eeTime < 0 ) self.say( "O evento acabou. Vejo voc� no ano que vem~" );
			else {
				qr = target.questRecord;
				val1 = qr.get( 8845 );
				val2 = qr.get( 8846 );
				aTime = compareTime( cTime, val2 );

				if ( aTime >= 1440 ) {
					if ( val1 == "s" ) {
						inven = target.inventory;
						if ( inven.itemCount( 4031063 ) >= 1 ) {
							if ( inven.slotCount( 1 ) > inven.holdCount( 1 ) and inven.slotCount( 3 ) > inven.holdCount( 3 ) ) {
								self.say( "Ahh legal~ Este � o meu chifre! Muito obrigado! Vou te dar isso. Vai ser muito �til para voc�. Tchau~" );
								nNewItemID = 0;
								rnum = random( 0, 14 );
								if ( rnum == 0 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012011,Period:21600", 1 );
								else if ( rnum == 1 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012012,Period:21600", 1 );
								else if ( rnum == 2 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012013,Period:21600", 1 );
								else if ( rnum == 3 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012014,Period:21600", 1 );
								else if ( rnum == 4 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012015,Period:21600", 1 );
								else if ( rnum == 5 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012016,Period:21600", 1 );
								else if ( rnum == 6 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012017,Period:21600", 1 );
								else if ( rnum == 7 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012018,Period:21600", 1 );
								else if ( rnum == 8 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012019,Period:21600", 1 );
								else if ( rnum == 9 ) ret = inven.exchangeEx( 0, "4031063", -1, "1012020,Period:21600", 1 );
								else if ( rnum == 10 ) ret = inven.exchange( 0, 4031063, -1, 3992024, 1 );
								else if ( rnum == 11 ) ret = inven.exchange( 0, 4031063, -1, 3992025, 1 );
								else if ( rnum == 12 ) ret = inven.exchange( 0, 4031063, -1, 3992026, 1 );
								else if ( rnum == 13 ) ret = inven.exchange( 0, 4031063, -1, 2020012, 1 );
								else if ( rnum == 14 ) ret = inven.exchange( 0, 4031063, -1, 2020013, 1 );

								if ( ret == 0 ) self.say( "Voc� tem slots vazios na guia de itens? Voc� j� tem meu chifre?  Verifique novamente!" );
								else {
									qr.set( 8845, "end" );
									qr.set( 8846, cTime );
								}
							}
							else self.say( "Voc� deveria ter pelo menos um slot vazio na guia de Equip. ou Preparo.Por favor, volte depois~" );
						}
						else self.say( "Voc� j� recebeu meu chifre? Oh... Descobri em qual loja era. Era um item da Loja de ItensEles colocaram meu chifre em algum lugar da loja.  Voc� j� esteve l�? Hummm... N�o sei onde est�... Voc� pode pegar meu chifre?" );
					}
					else {
						v1 = self.askMenu( "Torre est� de olho em voc�. O que voc� gostaria de dizer? \r\n#b#L0# Al�, voc� sabe como conseguir enfeites de Natal? #l\r\n#L1# Por que voc� est� chorando?#l#k" );
						if ( v1 == 0 ) self.say( "Ahh... Pergunte ao Rudy, ele sabe de todas essas coisas!!! Eu deveria estar procurando pelo meu chifre!!!..." );
						else {
							v2 = self.askMenu( "O vov� Cliff me deu outra bronca... DE NOVO? DE NOVO? Perdi meu chifre DE NOVO! \r\n#b#L0# Voc� fica muito bem sem ele#l\r\n#L1# A�... Voc� deveria ser mais #Gcuidadoso:cuidadosa##l\r\n#L2# Como voc� perdeu?#l#k" );
							if ( v2 == 0 ) self.say( "... Mesmo? Obrigado, mas... Para ajudar o Vov� Cliff, preciso de meu chifre..." );
							else if ( v2 == 1 ) self.say( "Eu sei, eu sei. Mas, quando come�o a fazer alguma coisa, esque�o completamente das coisas..." );
							else {
								v3 = self.askMenu( "Perdi meu chifre quando estava praticando empurrar o tren�... As pessoas acham que sou muito desastrado... Acontece que fico muito nervoso quando v�o pelos c�us... Por isso � que perdi meu chifre durante o treinamento! \r\n#b#L0# Vou ajudar voc� a recuperar seu chifre. #l\r\n#L1# Qual seria a minha recompensa se ajudasse voc� a encontrar seu chifre?#l#k" );
								if ( v3 == 1 ) self.say( "... N�o espere nenhuma recompensa quando estiver ajudando os outros!! Vai aparecer algu�m LEGAL, disposto a me ajudar." );
								else { 
									qr.set( 8845, "s" );
									self.say( "Mesmo? Procurou nas lojas?  Algu�m me disse... Humm... Ahh, Esqueci.  Eu deveria estar procurando pelo meu chifre. Se voc� me ajudar a encontrar meu chifre, vou recompens�-lo com algo precioso." );
								}
							}
						}
					}
				}
				else self.say( "Ei, � voc�! Voc� encontrou o chifre para mim, n�o foi? Voc� s� pode participar do evento uma vez por dia~ Por favor, volte outro dia." );
			}
		}
	}
	else self.say( "Ah, n�o... Perdi meu chifre precioso!!!! Ahhh, n�o parece que voc� � forte o suficiente para me ajudar. Por favor, treine mais um pouco e volte a me procurar, certo?" );
}

// trade  between user's presents and Mayple Claws
function GivePresent(integer PresentNum) {

	Num = PresentNum ;
	inventory = target.inventory;
	qr = target.questRecord;
	
	boxask= self.askMenu("Vejo que tem alguns presentes a�... �timo trabalho, #Ggaroto:garota#! Quantos presentes gostaria de me dar? \r\n#b#L0#10 caixas#l\r\n#b#L1#20 caixas#l\r\n#b#L2#40 caixas #l\r\n#b#L3#50 caixas#l\r\n#b#L4#100 caixas#l\r\n#b#L5#I N�o fa�o id�ia quais caixas devo dar a voc�. #l\r\n#b#L6#N�o, n�o quero trocar.#l#k");
	
	if (boxask  == 0 ) {
		ret = inventory.exchange( 0, Num, -10, 2000000, 50);
		if ( ret == 0 ) self.say( "Humm, voc� vai precisar de mais presentes se quiser mesmo me ajudar com a Miau Noel!" );
		else { 
		qr.set( 8827, "end" );
		self.say( "Superobrigado, lembre-se de voltar se achar mais presentes!" );
		}
	}
	else if (boxask  == 1 ) {
	ret = inventory.exchange( 0, Num, -20, 2000003, 30, 2000001, 30);
		if ( ret == 0 ) self.say( "Humm, voc� vai precisar de mais presentes se quiser mesmo me ajudar com a Miau Noel!" );
		else { 
		qr.set( 8827, "end" );
		self.say( "Superobrigado, lembre-se de voltar se achar mais presentes!" );
		}
	}
	else if (boxask  == 2 ) {
	ret = inventory.exchange( 0, Num, -40, 2000002, 30, 2010004, 30);
		if ( ret == 0 ) self.say( "Humm, voc� vai precisar de mais presentes se quiser mesmo me ajudar com a Miau Noel!" );
		else { 
		qr.set( 8827, "end" );
		self.say( "Superobrigado, lembre-se de voltar se achar mais presentes!" );
		}
	}
	else if (boxask  == 3 ) {
	ret = inventory.exchange( 0, Num, -50, 2000006, 30);
		if ( ret == 0 ) self.say( "Humm, voc� vai precisar de mais presentes se quiser mesmo me ajudar com a Miau Noel!" );
		else { 
		qr.set( 8827, "end" );
		self.say( "Superobrigado, lembre-se de voltar se achar mais presentes!" );
		}
	}
	else if (boxask  == 4 ) {
	ret = inventory.exchange( 0, Num, -100, 2000005, 30);
		if ( ret == 0 ) self.say( "Humm, voc� vai precisar de mais presentes se quiser mesmo me ajudar com a Miau Noel!" );
		else { 
		qr.set( 8827, "end" );
		self.say( "Superobrigado, lembre-se de voltar se achar mais presentes!" );
		}
	}
	
	else if (boxask == 5 ) {
		self.say( "Se estiver no n�vel 10-20, precisar� encontrar os #bpresentes Vermelhos e Verdes#k. Se estiver no n�vel 21-30, precisar� encontrar os #bpresentes Vermelhos e Brancos#k. Se estiver no n�vel 31-40, precisar� encontrar os #bpresentes Vermelhos e Azuis#k. Se estiver no n�vel 41-60, precisar� encontrar os #bpresentes Azuis e Brancos#k. Se estiver no n�vel 61 ou acima, precisar� encontrar os #bpresentes Verdes e Brancos#k." );	
	}
	
	else self.say( "OK... Fique � vontade para retornar se quiser.");

}

script "LendPaw" {

	inven = target.inventory;

	cTime = currentTime;		
	
	//*This quest will be available from 12/6 ~ 12/20
	es1Time = compareTime( cTime, "06/12/06/00/00" );
	ee1Time = compareTime( "06/12/20/23/59", cTime );

	//This quest will be available from 12/21 ~ 1/10			
	es2Time = compareTime( cTime, "06/12/21/00/00" );
	ee2Time = compareTime( "07/01/10/23/59", cTime );
	
	es3Time = compareTime( cTime, "06/12/21/00/00" );
	ee3Time = compareTime( "07/01/10/23/59", cTime );
		
	/*if ( es1Time < 0 ) self.say( "O evento ainda n�o come�ou. Por favor, espere~" );
	else {
			if ( ee1Time < 0 ) self.say( "O evento acabou. Vejo voc� no ano que vem~" );
			else choosemenu = 0;
			}*/

	if ( es1Time < 0 ) self.say( "Desculpe, agora estou muito ocupado. Por favor, fale comigo depois do sexto. Obrigado." );
	if ( ee3Time < 0 ) self.say( "Como est� o ano novo? Voc� est� seguindo suas resolu��es de ano novo? Sei que eu estou. Felizmente 2007 vai ser do jeito que voc� imaginou. Te vejo por a�~!" );
	
	if (es1Time > 0 and ee1Time > 0 ) choosemenu = 0;
	if (es2Time > 0 and ee2Time > 0 ) choosemenu = 1;
			
	nItem = inven.itemCount(4031519);
		
	if (es3Time > 0 and ee3Time > 0 and nItem >= 1 )	choosemenu = 2;

		
	  if ( choosemenu == 0 ) {
		
		if ( target.nLevel < 10 )	self.say ( "Ei, desculpe, mas n�o acho que seja forte o bastante para me ajudar agora." );
		else {
	 		qr = target.questRecord;
			val = qr.get( 8827 );			// Lend a Paw to Maple Claws 1  8827
			
			if (val == "end" ) {
				ret = self.askYesNo( "Ei, bom te ver de novo! Como est�? E ent�o, j� achou mais presentes para mim? Gostaria de fazer outra troca?");
				if (ret == 0) self.say ( "Ah, verdade? Tudo bem. Vou ficar aqui por mais um tempo, se achar mais presentes, sabe onde me encontrar.");
				else  {
				 self.say ( "Doce. Parece que s�o boas not�cias. Estarei aqui esperando.");
				 qr.set( 8827, "ing" );
				}
			}
			else if (val == "ing"){
				if ( target.nLevel >= 10 and  target.nLevel <= 20 )	{
					PresentNum = 4031443;
					GivePresent(PresentNum);
				}
				else if ( target.nLevel >= 21 and  target.nLevel <= 30 ) {	
					PresentNum = 4031440;		
					GivePresent(PresentNum);
				}
				else if ( target.nLevel >= 31 and  target.nLevel <= 40 ) {
					PresentNum = 4031441;
					GivePresent(PresentNum);
				}
				else if ( target.nLevel >= 41 and  target.nLevel <= 60 ) {	
					PresentNum = 4031439;
					GivePresent(PresentNum);
				}
				else  {
					PresentNum = 4031442;
					GivePresent(PresentNum);
				}
			}
			
			else {
			nRet = self.askYesNo("Como v�o as coisas? Estou um pouco atrapalhado, se voc� puder me ajudar, agrade�o, no estilo Miau Noel.");
				if(nRet!=0) {
				self.say( "Super obrigado.  Estava fazendo minhas entregas como sempre, quando vi esse Balrog Rubro gigante voando, tomei um susto t�o grande que quase sa� da minha pr�pria pele! Ele come�ou a me atacar! Consegui me defender e afastar aquela criatura alucinada, mas os presentes acabaram se espalhando por todo lado e agoro os monstros os levaram."); 
				self.say( "Preciso que voc� encontre todos os presentes que conseguir e depois traga para mim. Tudo acontece de acordo com o n�vel em que est�, e voc� s� vai pegar os presentes certos matando os monstros que pertencerem ao seu n�vel. Voc� vai precisar, no m�nimo, de 10, sendo 100 o m�ximo que voc� pode recolher por vez. Vou dar os melhores pr�mios para aqueles que encontrarem o limite m�ximo de 100. Confie em mim; Voc� n�o vai receber apenas um muito obrigado da Miau Noel quando terminar... Vai fundo!" );
				qr.set( 8827, "ing" );
				
					ask = self.askMenu("O que voc� quer? \r\n#b#L0#WO que voc� quis dizer com Pertencer ao seu N�vel? \r\n#L1#I Gostaria de proseguir na jornada#l#k");
					if (ask == 0)
						self.say("Ok. Voc� precisa encontrar monstros que estejam de acordo com o seu n�vel para pegar os presentes certos. Se estiver no n�vel 10-20, precisar� encontrar os #bpresentes Vermelhos e Verdes#k. Se estiver no n�vel 21-30, precisar� encontrar os #bpresentes Vermelhos e Brancos#k. Se estiver no n�vel 31-40, precisar� encontrar os #bpresentes Vermelhos e Azuis#k. Se estiver no n�vel 41-60, precisar� encontrar os #bpresentes Azuis e Brancos#k. Se estiver no n�vel 61 ou acima, precisar� encontrar os #bpresentes Verdes e Brancos#k. Para receber alguma coisa de mim, voc� precisa encontrar pelo menos cinco presentes. Quanto maior o n�mero de presentes, melhor o pr�mio. Por favor, volte quando estiver pronto!");
					else if (ask ==1)
						self.say("OK... Vou esperar voc�.") ;
				
				}
				else self.say( "Que grosseria! Esque�a. Com certeza vou colocar um carv�o na sua meia..." );
			}
	       }

	  }
	  
	  if ( choosemenu == 1 ) {

	  if ( target.nLevel < 10 )	self.say ( "Ei, desculpe, mas n�o acho que seja forte o bastante para me ajudar agora." );
	  
	  else {
		qr = target.questRecord;
		val = qr.get( 8828 );
		
		goRowen = qr.get( 8835 );
		goAyan = qr.get( 8836 );
		goEric = qr.get( 8837 );
		goPort = qr.get( 8838 );
		
		reRowen = qr.get( 8839 );
		reAyan = qr.get( 8840 );
		reEric = qr.get( 8841 );
		rePort = qr.get( 8842 );
		
		if (val == "end" )	self.say ( "Obrigado por me ajudar a entregar estes presentes aos quatro amigos que pedi para voc� encontrar. No esp�rito do Natal, acho que seria uma boa id�ia comprar um presente para algu�m especial! Certamente a pessoa vai gostar dessa boa a��o. Boas Festas~!");
		
		else if (val == "ing"){
					
			if( reRowen == "ing" ){
				nItem = inven.itemCount(4031486);
				if (nItem == 0 and  goRowen != "end" ) {			// if a user lost the item
				self.say( "Ah, n�o! Voc� perdeu a caixa de presentes?  Felizmente tenho algumas a mais comigo. Vou dar outra pra voc�. Por favor, n�o perca desta vez!" );
				ret = inven.exchange( 0, 4031486, 1);
				if (ret != 0 ) 
					self.say( "Agora voc� consegiu a caixa de presentes" );
				else self.say("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde."); 
				}
				else{
				if ( goRowen != "end"  )
				self.say( "Parece que voc� ainda tem o presente que te dei.  Lembra que voc� precisava dar para algu�m... Pe�a ajuda aos seus amigos se precisar!" );
				else {	 
					ret = inven.exchangeEx( 0, "4031519,Named:1", 1 );
		 
					if (ret == 1) {
					self.say( "Vejo que voc� fez a entrega, isso � �timo.  Agora, no esp�rito do Natal, dei um presente especial para voc�.  Apenas outra pessoa pode abri-lo. Por isso voc� precisa trocar presentes para receber um.  Agrade�o mais uma vez e desejo Boas Festas!" );
					qr.set( 8839, "end" );
					qr.set( 8828, "" );
					}
					else  self.say ("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde.");
				}
				}
			}
			
			else if( reAyan == "ing" ){
				nItem = inven.itemCount(4031486);
				if (nItem == 0 and  goAyan != "end" ) {			// if a user lost the item
				self.say( "Ah, n�o! Voc� perdeu a caixa de presentes? Felizmente tenho algumas a mais comigo. Vou dar outra pra voc�. Por favor, n�o perca desta vez!" );
				ret = inven.exchange( 0, 4031486, 1);
				if (ret != 0 ) 
					self.say( "Agora voc� conseguiu a caixa de presentes" );
				else self.say("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde."); 
				}
				else {
				if ( goAyan != "end"  )
				self.say( "Parece que voc� ainda guardou o presente que te dei.  Lembra que voc� precisava dar para algu�m... Pe�a ajuda aos seus amigos se precisar!" );
				else {	 
					ret = inven.exchangeEx( 0, "4031519,Named:1", 1 );
		 
					if (ret == 1) {
					self.say( "Vejo que voc� j� entregou, isso � �timo. Agora, no esp�rito do Natal, dou um presente especial para voc�. Apenas outra pessoa pode abri-lo. Por isso voc� precisa trocar presentes para receber o seu. Agrade�o mais uma vez e desejo Boas Festas!" );
					qr.set( 8840, "end" );
					qr.set( 8828, "" );
					}
					else  self.say ("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde.");
				}
				}
			}
			
			else if( reEric == "ing" ){
				nItem = inven.itemCount(4031486);
				if (nItem == 0 and  goEric != "end" ) {			// if a user lost the item
				self.say( "Ah, n�o! Voc� perdeu a caixa de presentes? Felizmente tenho algumas a mais comigo. Vou dar outra pra voc�. Por favor, n�o perca desta vez!" );
				ret = inven.exchange( 0, 4031486, 1);
				if (ret != 0 ) 
					self.say( "Agora voc� conseguiu a caixa de presentes" );
				else self.say("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde."); 
				}
				else {
				if ( goEric != "end"  )
				self.say( "Parece que voc� ainda guardou o presente que te dei. Lembra que voc� precisava dar para algu�m... Pe�a ajuda aos seus amigos se precisar!" );
				else {	 
					ret = inven.exchangeEx( 0, "4031519,Named:1", 1 );
		 
					if (ret == 1) {
					self.say( "Vejo que voc� j� entregou, isso � �timo. Agora, no esp�rito do Natal, dou um presente especial para voc�. Apenas outra pessoa pode abri-lo. Por isso voc� precisa trocar presentes para receber o seu. Agrade�o mais uma vez e desejo Boas Festas!" );
					qr.set( 8841, "end" );
					qr.set( 8828, "" );
					}
					else  self.say ("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde.");
				}
				}
			}
			
			else if( rePort == "ing" ){
				nItem = inven.itemCount(4031486);
				if (nItem == 0 and  goPort != "end" ) {			// if a user lost the item
				self.say( "Ah, n�o! Voc� perdeu a caixa de presentes?  Felizmente tenho algumas a mais comigo. Vou dar outra pra voc�.  Por favor, n�o perca desta vez!" );
				ret = inven.exchange( 0, 4031486, 1);
				if (ret != 0 ) 
					self.say( "Agora voc� conseguiu a caixa de presentes" );
				else self.say("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde."); 
				}
				else {
				if ( goPort != "end"  )
				self.say( "Parece que voc� ainda guardou o presente que te dei. Lembra que voc� precisava dar para algu�m... Pe�a ajuda aos seus amigos se precisar!" );
				else {	 
					ret = inven.exchangeEx( 0, "4031519,Named:1", 1 );
		 
					if (ret == 1) {
					self.say( "Vejo que voc� j� entregou o seu, isso � �timo.  Agora, no esp�rito do Natal, dou um presente especial para voc�. Apenas outra pessoa pode abri-lo. Por isso voc� precisa trocar presentes para receber o seu. Agrade�o mais uma vez e desejo Boas Festas!" );
					qr.set( 8842, "end" );
					qr.set( 8828, "" );
					}
					else  self.say ("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde.");
				}
			}
			}
			else if( goRowen == "end" and goAyan == "end" and goEric == "end" and goPort == "end" ) qr.set( 8828, "end" );
			
		}     

		else {									
			nRet = self.askYesNo("Ol�! N�o consegui consertar meu tren� e ainda tenho presentes para entregar... Voc� acha que consegue assumir esta tareta?");

			if(nRet!=0) {	// accept 
				self.say( "Super obrigado.  Preciso que voc� pegue estes presentes e distribua para as boas pessoas das cidades de: Ellinia, Perion, Orbis e setor �mega. Elas v�o distribuir para as crian�as. Voc� vai precisar falar com eles para saber quem est� aceitando os presentes. Preciso que todos sejam entregues, volte depois de pegar um, embora, n�o importa o que voc� fizer, vou ficar muito agradecido. Acredite em mim, voc� vai receber mais do que os parab�ns do Papai Noel quando terminar!" );
				
				menu = self.askMenu("Ok, estes s�o meus grandes amigos, preciso que voc� entregue os presentes para eles.  Quem voc� gostaria de visitar? \r\n#b#L0#Rowen, a Fada\r\n#L1#Ayan#l\r\n#L2#Ericsson#l\r\n#L3#Porter#l\r\n#L4#Nainda n�o. Estou muito ocupado.#l#k");
				if (menu == 0) {
					if(goRowen != "end"){
					ret = inven.exchange( 0, 4031486, 1 );
					if (ret == 1) {
						self.say("Ah, Rowen.  Ela mora em Ellinia, n�o vai ser muito dif�cil encontr�-la. H� uma chance remota de ela n�o estar de bom humor e n�o aceitar seu presente, mas n�o se preocupe. Se voc� persistir, ela vai aceitar. Afinal, quem n�o adora receber presentes?  V� se encontrar com ela agora~!");	
						qr.set( 8839, "ing" );	// Rowen the Fairy	
						qr.set( 8828, "ing" );
					}
					else 	self.say("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde.");				
					}
					else 	self.say("Voc� j� esteve l� na �ltima vez~! Tenho certeza que ela est� empolgada com o presente que vou levar!");				
				}
				else if (menu == 1) {
					if(goAyan != "end"){
					ret = inven.exchange( 0, 4031486, 1 );
					if (ret == 1) {
						self.say("Ok, Ayan.  Ela mora em Perion, n�o vai ser muito dif�cil encontr�-la. H� uma chance remota de ela n�o estar de bom humor e n�o aceitar seu presente, mas n�o se preocupe. Se voc� persistir, ela vai aceitar. Afinal, ela adorou o presente que dei na �ltima vez.  V� ao seu encontro agora~!");	
						qr.set( 8840, "ing" );	// Ayan
						qr.set( 8828, "ing" );
					}
					else 	self.say("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde.");				
					}
					else 	self.say("Voc� j� esteve l� na �ltima vez~! Tenho certeza de que ela est� empolgada com o presente que vou levar!");				
				}
				
				else if (menu == 2) {
					if(goEric != "end"){
					ret = inven.exchange( 0, 4031486, 1 );
					if (ret == 1) {
						self.say("Ahh, Ericsson.  Ele mora em Orbis, e, acredite em mim, n�o ser� dif�cil encontr�-lo, porque ele realmente se destaca. Pode ser que esteja de p�ssimo humor e n�o aceite o seu presente, mas continue conversando com ele. Se voc� persistir, ele vai aceitar. No fundo ele tem um cora��o de ouro e vai adorar receber um presente.  V� ao seu encontro agora~!");	
						qr.set( 8841, "ing" );		// Ericson
						qr.set( 8828, "ing" );
					}
					else 	self.say("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde.");				
					}
					else 	self.say("Voc� j� esteve l� na �ltima vez~! Tenho certeza de que ele est� empolgado com o presente que vou levar!");				
				}
				
				else if (menu == 3) {
					if(goPort != "end"){
					ret = inven.exchange( 0, 4031486, 1 );
					if (ret == 1) {
						self.say("Porter Ele vive no setor �mega e pode n�o ser muito f�cil encontr�-lo num mar de aventais, mas no fim, voc� vai acabar o encontrando.  Pode ser que esteja de p�ssimo humor e n�o aceite o seu presente, mas continue conversando com ele. Se voc� persistir, ele vai aceitar.  �s vezes ele gosta de provocar as pessoas.  V� ao seu encontro agora~!");	
						qr.set( 8842, "ing" );	// Porter	
						qr.set( 8828, "ing" );
					}
					else 	self.say("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde.");				
					}
					else 	self.say("Voc� j� esteve l� na �ltima vez~! Tenho certeza de que ele est� empolgado com o presente que vou levar!");				
				}
				
				else 	self.say("Eu entendo. Todos est�o ocupados com suas pr�prias coisas nestes dias, mas eu preciso muito de sua ajuda.  Preciso entregar estes presentes para meus amigos queridos, ficaria muito satisfeito se voc� pudesse entreg�-los logo. Estarei aqui esperando.");				
				
			}
			else	// rejection
				self.say( "Que grosseria! Esque�a. Com certeza vou colocar um carv�o na sua meia..." );
		}
	  }
	  }

	  if ( choosemenu == 2 ) {
	 		  
		qr = target.questRecord;
		val = qr.get( 8831 );					
		
		goRowen = qr.get( 8835 );
		goAyan = qr.get( 8836 );
		goEric = qr.get( 8837 );
		goPort = qr.get( 8838 );
		
		if (val == "end" )	{			
			ret = self.askYesNo( "Voc� quer tentar de novo?");
			if (ret == 0) self.say ( "Ah, verdade? Tudo bem. Vou ficar aqui por mais um tempo; se achar mais presentes, sabe onde me encontrar.");
				else  {
				 self.say ( "Doce. Parece que s�o boas not�cias. Estarei aqui esperando.");
				 qr.set( 8831, "" );
				 }
		}	 
			
			
		else if (val == "ing"){
		
		name = target.sCharacterName ;
		if ( name != inven.getItemTitle( 4031519, 0 ) ) {
			if ( inven.slotCount( 2 ) > inven.holdCount( 2 ) and inven.slotCount( 4 ) > inven.holdCount( 4 ) and inven.slotCount( 1 ) > inven.holdCount( 1 ) ) {
		
				ret2 = inven.exchange( 0, 4031519, -1);
				if (ret2 == 1 ) {
				
					rn1 = random( 1, 1000000 );

					if (1 <= rn1 and rn1 <= 70000) 	ret = inven.exchange( 0, 2000000, 25 );			
					else if (70000 < rn1 and rn1 <= 140000) 	ret = inven.exchange( 0, 2000003, 25 );
					else if (140000 < rn1 and rn1 <= 170000) 	ret = inven.exchange( 0, 4020003, 10 );
					else if (170000 < rn1 and rn1 <= 220000) 	ret = inven.exchange( 0, 1322000, 1 );
					else if (220000 < rn1 and rn1 <= 320000) 	ret = inven.exchange( 0, 2060000, 100 );
					else if (320000 < rn1 and rn1 <= 380000) 	ret = inven.exchange( 0, 4010004, 2 );
					else if (380000 < rn1 and rn1 <= 385000) 	ret = inven.exchange( 0, 1002143, 1 );
					else if (385000 < rn1 and rn1 <= 385030) 	ret = inven.exchange( 0, 1432005, 1 );
					else if (385030 < rn1 and rn1 <= 485030) 	ret = inven.exchange( 0, 2061000, 100 );
					else if (485030 < rn1 and rn1 <= 495030) 	ret = inven.exchange( 0, 1040022, 1 );
					else if (495030 < rn1 and rn1 <= 505030) 	ret = inven.exchange( 0, 1060031, 1 );
					else if (505030 < rn1 and rn1 <= 505031) 	ret = inven.exchange( 0, 2048000, 1 );
					else if (505031 < rn1 and rn1 <= 555031) 	ret = inven.exchange( 0, 2000006, 5 );
					else if (555031 < rn1 and rn1 <= 575031) 	ret = inven.exchange( 0, 4011006, 1 );
					else if (575031 < rn1 and rn1 <= 625031) 	ret = inven.exchange( 0, 2000001, 10 );
					else if (625031 < rn1 and rn1 <= 630031) 	ret = inven.exchange( 0, 2022120, 2 );
					else if (630031 < rn1 and rn1 <= 643960) 	ret = inven.exchange( 0, 1002138, 1 );
					else if (643960 < rn1 and rn1 <= 693960) 	ret = inven.exchange( 0, 4010003, 2 );
					else if (693960 < rn1 and rn1 <= 743960) 	ret = inven.exchange( 0, 4010005, 1 );
					else if (743960 < rn1 and rn1 <= 753960) 	ret = inven.exchange( 0, 2050004, 3 );
					else if (753960 < rn1 and rn1 <= 758960) 	ret = inven.exchange( 0, 2000005, 3 );
					else if (758960 < rn1 and rn1 <= 768960) 	ret = inven.exchange( 0, 2000004, 2 );
					else if (768960 < rn1 and rn1 <= 769960) 	ret = inven.exchange( 0, 1072103, 1 );
					else if (769960 < rn1 and rn1 <= 819960) 	ret = inven.exchange( 0, 2000002, 5 );
					else if (819960 < rn1 and rn1 <= 869960) 	ret = inven.exchange( 0, 2002010, 1 );
					else if (869960 < rn1 and rn1 <= 879960) 	ret = inven.exchange( 0, 1040044, 1 );
					else if (879960 < rn1 and rn1 <= 929960) 	ret = inven.exchange( 0, 4010006, 2 );
					else if (929960 < rn1 and rn1 <= 979960) 	ret = inven.exchange( 0, 2002004, 1 );
					else if (979960 < rn1 and rn1 <= 999960) 	ret = inven.exchange( 0, 4004000, 1 );
					else if (999960 < rn1 and rn1 <= 999970) 	ret = inven.exchange( 0, 2041013, 1 );
					else if (999970 < rn1 and rn1 <= 999980) 	ret = inven.exchange( 0, 2041016, 1 );
					else if (999980 < rn1 and rn1 <= 999990) 	ret = inven.exchange( 0, 2041019, 1 );
					else  	ret = inven.exchange( 0, 2041022, 1 );
				
					self.say( "Isto � para voc�." );
					qr.set( 8831, "end" );
				}
				else 	self.say( "Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde." );
			}
			
			else self.say( "Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde." );
		}
		else	self.say( "Ei, voc� n�o pode abrir isto!! Voc� n�o trocou presentes com um amigo!" );
		
		}     

		else {									
			nRet = self.askYesNo("Voc� trocou presentes com um amigo? Se trocou, gostaria que ajudasse a abrir o seu presente?");

			if(nRet!=0) {	// accept 
				self.say( "Ok, legal! Adoro fazer isso. Vou ajudar a abrir seu presente e acabar com o suspense." );
				qr.set( 8831, "ing" );
			}
			else	// rejection
				self.say( "Mesmo? Certo! Lembre-se de abrir logo o presente ou corre o risco de perd�-lo. Estarei por aqui; se voc� precisar de mim, sabe onde me encontrar." );
		}
	  }

	 
}

script "DeliveryP1" {
	
 		qr = target.questRecord;
		Preval = qr.get( 8839 );		// Christmas : Retrun to MapleClaws from Rowen the Fairy	8839			
		val = qr.get( 8835 );			// Christmas : Delivery present to Rowen the Fairy		8835

		rn1 = random( 1, 10 );
		if (rn1 < 6) yes = 1;
		else yes = 0;
		
		if (val == "end" ) 
			 self.say ( "J� recebi seu presente. Superobrigado.");

		else if (val == "ing") {
		
			inventory = target.inventory;
			nItem = inventory.itemCount(4031486);
		
			if ( nItem < 1) self.say ( "Voc� � uma pessoa estranha, vir aqui sem nenhum presente!");
			else {
					if (yes == 1) {
						ret = inventory.exchange( 0, 4031486, -1);
						if ( ret == 0 ) self.say( "Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde." );
						else  {
								// give Maple point
								self.say( "Muito obrigado por ter me dado um presente! Por favor, d� um al� para Miau Noel por mim!" );
								qr.set( 8835, "end" );
						}
					}
					else  self.say ( "... Agora n�o estou de muito bom humor.  Por favor, me desculpe por precisar de mais tempo para mim mesmo. Talvez, se voc� voltar a falar comigo mais tarde, eu j� esteja com vontade receber voc�.");
			}
		}
		
		else {
		nRet = self.askYesNo("Quer alguma coisa de mim? Isso tem alguma coisa a ver com Miau Noel?");
			if(nRet!=0 and Preval == "ing" ) {
			self.say( "Ah... Ok... Oi! Prazer em te conhecer! Voc� deve vir da parte de Miau Noel, o quer dizer que... Voc� est� com o meu presente!"); 
			qr.set( 8835, "ing" );			
			}
			else if (nRet == 0) self.say( "Se voc� n�o tem nada para me dizer, ent�o, por favor, v� embora!" );
			else  self.say( "Ei, acho que voc� ainda n�o viu a Miau Noel. Sugiro que voc� v� ver a Miau Noel primeiro, antes de me ver." );
		}
      
}

script "DeliveryP2" {
	
 		qr = target.questRecord;
		Preval = qr.get( 8840 );	//Christmas : Retrun to MapleClaws from Ayan		8840				
		val = qr.get( 8836 );		//Christmas : Delivery present to Ayan			8836

		rn1 = random( 1, 10 );
		if (rn1 < 6) yes = 1;
		else yes = 0;
		
		if (val == "end" ) 
			 self.say ( "J� recebi seu presente. Superobrigado!");

		else if (val == "ing") {
		
			inventory = target.inventory;
			nItem = inventory.itemCount(4031486);
		
			if ( nItem < 1) self.say ( "Voc� � uma pessoa estranha, vir aqui sem nenhum presente!");
			else {
					if (yes == 1) {
						ret = inventory.exchange( 0, 4031486, -1);
						if ( ret == 0 ) self.say( "Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde." );
						else  {
								// give Maple point
								self.say( "Muito obrigado pelo seu presente! Por favor, diga Al� ao Miau Noel por mim!" );
								qr.set( 8836, "end" );
						}
					}
					else  self.say ( "... Agora n�o estou de muito bom humor.  Por favor, me desculpe por precisar de mais tempo para mim mesmo. Talvez, se voc� voltar a falar comigo mais tarde, eu j� esteja com vontade receber voc�.");
			}
		}
		
		else {
		nRet = self.askYesNo("Quer alguma coisa de mim? Isso tem alguma coisa a ver com Miau Noel?");
			if( nRet != 0 and Preval == "ing" ) {
			self.say( "Ah... Ok... Oi! Prazer em te conhecer! Voc� deve vir da parte de Miau Noel, o quer dizer que... Voc� est� com o meu presente!"); 
			qr.set( 8836, "ing" );			
			}
			else if (nRet == 0) self.say( "Se voc� n�o tem nada para me dizer, ent�o, por favor, v� embora!" );
			else  self.say( "Ei, acho que voc� ainda n�o viu a Miau Noel. Sugiro que voc� v� ver a Miau Noel primeiro, antes de me ver." );
		}
      
}

script "DeliveryP3" {
	
 		qr = target.questRecord;
		Preval = qr.get( 8841 );	//Christmas : Retrun to MapleClaws from Ericson		8841				
		val = qr.get( 8837 );		//Christmas : Delivery present to Ericson			8837
		
		rn1 = random( 1, 10 );
		if (rn1 < 6) yes = 1;
		else yes = 0;
				
		if (val == "end" ) 
			 self.say ( "J� recebi seu presente. Superobrigado.");
		
		else if (val == "ing") {
		
			inventory = target.inventory;
			nItem = inventory.itemCount(4031486);
		
			if ( nItem < 1) self.say ( "Voc� � uma pessoa estranha, vir aqui sem nenhum presente!");
			else {
					if (yes == 1) {
						ret = inventory.exchange( 0, 4031486, -1);
						if ( ret == 0 ) self.say( "Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde." );
						else  {
								// give Maple point
								self.say( "Muito obrigado pelo seu presente! Por favor, diga al� para a Miau Noel por mim!" );
								qr.set( 8837, "end" );
						}
					}
					else  self.say ( "... Agora n�o estou de muito bom humor.  Por favor, me desculpe por precisar de mais tempo para mim mesmo. Talvez, se voc� me procurar mais tarde, eu j� esteja com vontade de falar com voc�.");
			}
		}
		
		else {
		nRet = self.askYesNo("Quer alguma coisa de mim? Isso tem alguma coisa a ver com Miau Noel?");
			if( nRet!=0 and Preval == "ing" ) {
				self.say( "Ah... Ok... Oi! Prazer em te conhecer! Voc� deve vir da parte de Miau Noel, o quer dizer que... Voc� est� com o meu presente!"); 
				qr.set( 8837, "ing" );			
			}
			else if (nRet == 0) self.say( "Se voc� n�o tem nada para me dizer, ent�o, por favor, v� embora!" );
			else  self.say( "Ei, acho que voc� ainda n�o encontrou Miau Noel. Sugiro que voc� v� ver Miau Noel primeiro, antes de me ver." );
		}
      
}

script "DeliveryP4" {
	
 		qr = target.questRecord;
		Preval = qr.get( 8842 );		// Christmas : Retrun to MapleClaws from Porter			
		val = qr.get( 8838 );			// Christmas : Delivery present to Porter	

		rn1 = random( 1, 10 );			// random
		if (rn1 < 6) yes = 1;
		else yes = 0;
		
		if (val == "end" ) 
			 self.say ( "J� recebi seu presente. Superobrigado!");

		else if (val == "ing") {
		
			inventory = target.inventory;
			nItem = inventory.itemCount(4031486);
		
			if ( nItem < 1) self.say ( "Voc� � uma pessoa estranha, vir aqui sem nenhum presente!");
			else {
					if (yes == 1) {
						ret = inventory.exchange( 0, 4031486, -1);
						if ( ret == 0 ) self.say( "Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, fale comigo mais tarde." );
						else  {
							// give Maple point
							self.say( "Muito obrigado pelo seu presente! Por favor, diga al� para a Miau Noel por mim!" );
							qr.set( 8838, "end" );
						}
					}
					else  self.say ( "... Agora n�o estou de muito bom humor. Por favor, me desculpe por precisar de mais tempo para mim mesmo. Talvez, se voc� me procurar mais tarde, eu j� esteja com vontade de falar com voc�.");
			}
		}
		
		else {
		nRet = self.askYesNo("Quer alguma coisa de mim? Isso tem alguma coisa a ver com Miau Noel?");
			if( nRet!= 0 and Preval == "ing" ) {
				self.say( "Ah... Ok... Oi! Prazer em te conhecer! Voc� deve vir da parte de Miau Noel, o quer dizer que... Voc� est� com o meu presente!"); 
				qr.set( 8838, "ing" );			
			}
			else if (nRet == 0) self.say( "Se voc� n�o tem nada para me dizer, ent�o, por favor, v� embora!" );
			else  self.say( "Ei, acho que voc� ainda n�o viu a Miau Noel. Sugiro que voc� v� ver a Miau Noel primeiro, antes de me ver." );
		}
      
}

//Simon NPC

script "go_xmas06" {		// potal Shalom Temple
	
	field = self.field;
	qr = target.questRecord;
	val = qr.get( 8847 );
					
	if ( field.id == 101000000 ) {
		
		qr.set( 8847, "0" );
		
		nRet = self.askYesNo( "O Templo Shalom � diferente de qualquer coisa que j� tenha visto.  � um lugar excelente tamb�m para tirar fotos. Voc� quer entrar?" );
		if ( nRet == 0 ) self.say( "Entendo. Voc� deve ter neg�cios para tratar aqui. Caso queira visitar o templo novamente, por favor, me avise!" );
		else {
				self.say( "Certo, vamos!" );
				registerTransferField( 681000000, "st00" );
		}
	}
	
	else if ( field.id == 211000000 ) {
	
		qr.set( 8847, "1" );
		nRet = self.askYesNo( "O Templo Shalom � diferente de qualquer coisa que j� tenha visto.  � um lugar excelente tamb�m para tirar fotos. Voc� quer entrar?" );
		if ( nRet == 0 ) self.say( "Entendo. Voc� deve ter neg�cios para tratar aqui. Caso queira visitar o templo novamente, por favor, me avise!" );
		else {
				self.say( "Certo, vamos!" );
				registerTransferField( 681000000, "st00" );
		}
	}
	
	else if ( field.id == 220000300 ) {
		qr.set( 8847, "2" );
		nRet = self.askYesNo( "O Templo Shalom � diferente de qualquer coisa que j� tenha visto.  � um lugar excelente tamb�m para tirar fotos. Voc� quer entrar?" );
		if ( nRet == 0 ) self.say( "Entendo. Voc� deve ter neg�cios para tratar aqui. Caso queira visitar o templo novamente, por favor, me avise!" );
		else {
				self.say( "Certo, vamos!" );
				registerTransferField( 681000000, "st00" );
		}
	}

	else if ( field.id == 681000000 ) {
	 if (val =="0") {
		nRet = self.askYesNo( "Espero que tenha gostado de conhecer este templo. Est� pronto para voltar do lugar onde veio?" );
		if ( nRet == 0 ) self.say( "Fique � vontade, pelo tempo que quiser! Este templo tem lugares muito bonitos para tirar fotos. Aproveite sua estada!" );
		else {
				self.say( "Aguardo uma nova visita sua ao templo. Se cuida!" );
				registerTransferField( 101000000, "h001" );
		}
	 } 
	 else if (val =="1") {
		nRet = self.askYesNo( "Espero que tenha gostado de conhecer este templo. Est� pronto para voltar do lugar onde veio?" );
		if ( nRet == 0 ) self.say( "Fique � vontade, pelo tempo que quiser! Este templo tem lugares muito bonitos para tirar fotos. Aproveite sua estada!" );
		else {
				self.say( "Aguardo uma nova visita sua ao templo. Se cuida!" );
				registerTransferField( 211000000, "h001" );
		}
	 } 
	 else if (val =="2") {
		nRet = self.askYesNo( "Espero que tenha gostado de conhecer este templo. Est� pronto para voltar do lugar onde veio?" );
		if ( nRet == 0 ) self.say( "Fique � vontade, pelo tempo que quiser! Este templo tem lugares muito bonitos para tirar fotos. Aproveite sua estada!" );
		else {
				self.say( "Aguardo uma nova visita sua ao templo. Se cuida!" );
				registerTransferField( 220000300, "h001" );
		}
	 } 
		
	}
    else end;
}
// 2007 Maplemas/Versalmas/Grubber Competition Script

// trade  between users and Maple Claws
function GivePresent1(integer PresentNum1) 
{

	Num = PresentNum1;
	inventory = target.inventory;
	qr = target.questRecord;
	cTime = currentTime;
	val1 = qr.getState ( 4997 );
	valn1 = qr.get ( 8200 );
	valn2 = qr.get ( 8201 );
	valn3 = qr.get ( 8202 );
	valn2int = integer( valn2 );
	
	boxask= self.askMenu( "Voc� conseguiu? Fant�stico! Quantos presentes voc� recuperou? \r\n\r\n#b#L0#I Tenho 10 presentes para voc�.#l#k\r\n#b#L1#I Tenho 20 presentes para voc�. #l#k\r\n#b#L2#Itenho 30 presentes para voc�. #l#k\r\n#b#L3#Itenho 40 presentes para voc�!#l#k\r\n#b#L4#ITenho 60 presentes para voc�!#l#k\r\n#b#L5#Itenho 90 presentes para voc�!#l#k\r\n#b#L6#Itenho 100 presentes para voc�!#l#k\r\n#b#L7#Wqual a cor do presente que devo procurar?#l#k" );
	
	if ( boxask  == 0 ) 
	{
		if ( valn1 == "" )
		{	
			if ( valn2int > 90 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k do dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje.  Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
			if ( valn2int <= 90 )
			{
				ret = inventory.exchange( 0, Num, -10, 4031878, 1, 2000002, 25 );
				if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa...  Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
				else
				{
					valn2sum = valn2int + 10;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "10 presentes! � um bom come�o! \r\n<procure no saco de brinquedos dela>\r\nAqui est�!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 90 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje.  Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
				if ( valn2int <= 90 )
				{
					ret = inventory.exchange( 0, Num, -10, 4031878, 1, 2000002, 25 );
					if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
					else
					{
						valn2sum = valn2int + 10;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "10 presentes! � um bom come�o! \r\n<procure no saco de brinquedos dela>\r\nAqui est�!" );
					}
				}
			}
		}
	}
	else if (boxask  == 1 )
	{
		if ( valn1 == "" )
		{
			if ( valn2int > 80 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia.  Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers, no dia de hoje.  Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
			if ( valn2int <= 80 )
			{
				ret = inventory.exchange( 0, Num, -20, 4031878, 2, 2000006, 30 );
				if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
				else
				{

					valn2sum = valn2int + 20;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "20 presentes! Voc� se esfor�ou bastante! \r\n<procure no saco de brinquedos dela>\r\nAqui est�!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 80 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers, no dia de hoje. Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
				if ( valn2int <= 80 )
				{
					ret = inventory.exchange( 0, Num, -20, 4031878, 2, 2000006, 30 );
					if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou100.#k" );
					else
					{
						valn2sum = valn2int + 20;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "20 presentes! Voc� se esfor�ou bastante! \r\n<procure no saco de brinquedos dela>\r\nAqui est�!" );
					}
				}
			}
		}
	}
	else if (boxask  == 2 )
	{
	if ( val1 == 2 )
	{
		if ( valn1 == "" )
		{
			if ( valn2int > 70 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
			if ( valn2int <= 70 )
			{
				rn1 = random( 1, 100 );
				if (1 <= rn1 and rn1 <= 25 ) 	ret = inventory.exchange( 0, Num, -30, 4031878, 3, 2022195, 5 );
				else if ( 25 < rn1 and rn1 <= 50 ) 	ret = inventory.exchange( 0, Num, -30, 4031878, 3, 2022190, 5 );
				else if ( 50 < rn1 and rn1 <= 75 ) 	ret = inventory.exchange( 0, Num, -30, 4031878, 3, 2002020, 5 );
				else if ( 75 < rn1 and rn1 <= 100 ) ret = inventory.exchange( 0, Num, -30, 4031878, 3, 2002021, 5 );
				if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
				else
				{
					valn2sum = valn2int + 30;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "30 presentes! Voc� fez muitas crian�as felizes! Deixe-me encontrar algo para recompens�-lo\r\n<procure no saco de brinquedos dela>\r\nAqui est�!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 70 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
				if ( valn2int <= 70 )
				{
					rn1 = random( 1, 100 );
					if (1 <= rn1 and rn1 <= 25 ) 	ret = inventory.exchange( 0, Num, -30, 4031878, 3, 2022195, 5 );
					else if ( 25 < rn1 and rn1 <= 50 ) 	ret = inventory.exchange( 0, Num, -30, 4031878, 3, 2022190, 5 );
					else if ( 50 < rn1 and rn1 <= 75 ) 	ret = inventory.exchange( 0, Num, -30, 4031878, 3, 2002020, 5 );
					else if ( 75 < rn1 and rn1 <= 100 ) ret = inventory.exchange( 0, Num, -30, 4031878, 3, 2002021, 5 );
					if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
					else
					{
						valn2sum = valn2int + 30;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "30 presentes! Voc� fez muitas crian�as felizes! Deixe-me encontrar algo para recompens�-lo\r\n<procure no saco de brinquedos dela>\r\nAqui est�!" );
					}
				}
			}
		}
	}
	else self.say ( "Voc� ja falou com a pequena Suzy? Tem uma crian�a na cidade de Folha Nova que precisa da sua ajuda para reencontrar seu esp�rito natalino.  Primeiro ajude-a a decidir, e, assim que fizer isso, voc� vai poder recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask  == 3 ) 
	{
	if ( val1 == 2 )
	{	
		if ( valn1 == "" )
		{
			if ( valn2int > 60 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
			if ( valn2int <= 60 )
			{
				ret = inventory.exchange( 0, Num, -40, 4031878, 4, 2022271, 3 );
				if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
				else
				{	
					valn2sum = valn2int + 40;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "Foi um grande lote de brinquedos que voc� recuperou para mim! Por isso, voc� merece algo perfeito para um jantar de natal... #bPresunto MapleNatal! #k!\r\n<procure no saco de brinquedos dela>\r\nAqui est�! Del�cia!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 60 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
				if ( valn2int <= 60 )
				{
					ret = inventory.exchange( 0, Num, -40, 4031878, 4, 2022271, 3 );
					if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
					else
					{	
						valn2sum = valn2int + 40;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "Foi um grande lote de brinquedos que voc� recuperou para mim! Por isso, voc� merece algo perfeito para um jantar de natal... #bPresunto MapleNatal! #k!\r\n<procure no saco de presentes dela>\r\nAqui est�! Del�cia!" );
					}
				}
			}
		}
	}
	else self.say ( "Voc� ja falou com a pequena Suzy? Tem uma crian�a na cidade de Folha Nova que precisa da sua ajuda para reencontrar seu esp�rito natalino.  Primeiro ajude-a a decidir, e, assim que fizer isso, voc� vai poder recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask  == 4 )
	{
	if ( val1 == 2 )
	{	
		if ( valn1 == "" )
		{
			if ( valn2int > 40 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje.  Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
			if ( valn2int <= 40 )
			{
				rn1 = random( 1, 100 );
				if (1 <= rn1 and rn1 <= 56 )	ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2002020, 5, 2002021, 5 );
				else if ( 56 < rn1 and rn1 <= 66 ) 	ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2041014, 1 );
				else if ( 66 < rn1 and rn1 <= 76 ) ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2041017, 1 );
				else if ( 76 < rn1 and rn1 <= 86 ) 	ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2041020, 1 );
				else if ( 86 < rn1 and rn1 <= 96 ) ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2041023, 1 );
				else if ( 96 < rn1 and rn1 <= 100 ) ret = inventory.exchange( 0, Num, -60, 4031878, 6, 1302080, 1 );
				
				if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
				else
				{
					valn2sum = valn2int + 60;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "Uau, foi um grande lote de brinquedos que voc� recuperou para mim! Deixe-me encontrar algo para recompens�-lo\r\n<procure no saco de presentes dela>\r\nAqui est�!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 40 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
				if ( valn2int <= 40 )
				{
					rn1 = random( 1, 100 );
					if (1 <= rn1 and rn1 <= 56 )	ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2002020, 5, 2002021, 5 );
					else if ( 56 < rn1 and rn1 <= 66 ) 	ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2041014, 1 );
					else if ( 66 < rn1 and rn1 <= 76 ) ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2041017, 1 );
					else if ( 76 < rn1 and rn1 <= 86 ) 	ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2041020, 1 );
					else if ( 86 < rn1 and rn1 <= 96 ) ret = inventory.exchange( 0, Num, -60, 4031878, 6, 2041023, 1 );
					else if ( 96 < rn1 and rn1 <= 100 ) ret = inventory.exchange( 0, Num, -60, 4031878, 6, 1302080, 1 );
					
					if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
					else
					{
						valn2sum = valn2int + 60;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "Uau, foi um grande lote de brinquedos que voc� recuperou para mim! Deixe-me encontrar algo para recompens�-lo\r\n<procure no saco de presentes dela>\r\nAqui est�!" );
					}
				}
			}
		}
	}
	else self.say ( "Voc� ja falou com a pequena Suzy? Tem uma crian�a na cidade de Folha Nova que precisa da sua ajuda para reencontrar seu esp�rito natalino.  Primeiro ajude-a a decidir, e, assim que fizer isso, voc� vai poder recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask == 5 )
	{
	if ( val1 == 2 )
	{	
		if ( valn1 == "" )
		{
			if ( valn2int > 10 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje.  Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
			if ( valn2int <= 10 )
			{
				rn1 = random( 1, 101 );
				if (1 <= rn1 and rn1 <= 40 )	ret = inventory.exchange( 0, Num, -90, 4031878, 9, 2002023, 10 );
				else if ( 40 < rn1 and rn1 <= 65 ) 	ret = inventory.exchange( 0, Num, -90, 4031878, 9, 2022182, 1 );
				else if ( 65 < rn1 and rn1 <= 72 ) ret = inventory.exchange( 0, Num, -90, 4031878, 9, 1432015, 1 );
				else if ( 72 < rn1 and rn1 <= 79 ) 	ret = inventory.exchange( 0, Num, -90, 4031878, 9, 2040805, 1 );
				else if ( 79 < rn1 and rn1 <= 86 ) ret = inventory.exchange( 0, Num, -90, 4031878, 9, 1302080, 1 );
				else if ( 86 < rn1 and rn1 <= 100 ) ret = inventory.exchange( 0, Num, -90, 4031878, 9, 2022276, 5 );
				else if ( 100 < rn1 and rn1 <= 101 ) ret = inventory.exchange( 0, Num, -90, 4031878, 9, 1432046, 1 );
				
				if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
				else
				{
					valn2sum = valn2int + 90;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "Uau, foi um grande lote de brinquedos que voc� recuperou para mim! Deixe-me ver o que tenho para voc�...\r\n<procure no saco de presentes dela>\r\nAqui est�!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 10 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
				if ( valn2int <= 10 )
				{
					rn1 = random( 1, 100 );
					if (1 <= rn1 and rn1 <= 50 )	ret = inventory.exchange( 0, Num, -90, 4031878, 9, 2002023, 10 );
					else if ( 50 < rn1 and rn1 <= 75 ) 	ret = inventory.exchange( 0, Num, -90, 4031878, 9, 2022182, 1 );
					else if ( 75 < rn1 and rn1 <= 85 ) ret = inventory.exchange( 0, Num, -90, 4031878, 9, 1432015, 1 );
					else if ( 85 < rn1 and rn1 <= 92 ) 	ret = inventory.exchange( 0, Num, -90, 4031878, 9, 2040805, 1 );
					else if ( 92 < rn1 and rn1 <= 99 ) ret = inventory.exchange( 0, Num, -90, 4031878, 9, 1302080, 1 );
					else if ( 99 < rn1 and rn1 <= 100 ) ret = inventory.exchange( 0, Num, -90, 4031878, 9, 1432046, 1 );
					
					if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
					else
					{
						valn2sum = valn2int + 90;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "Uau, foi um grande lote de brinquedos que voc� recuperou para mim! Deixe-me ver o que tenho para voc�...\r\n<procure no saco de presentes dela>\r\nAqui est�!" );
					}
				}
			}
		}
	}
	else self.say ( "Voc� ja falou com a pequena Suzy? Tem uma crian�a na cidade de Folha Nova que precisa da sua ajuda para reencontrar seu esp�rito natalino.  Primeiro ajude-a a decidir, e, assim que fizer isso, voc� vai poder recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask == 6 )
	{
	if ( val1 == 2 )
	{		
		if ( valn1 == "" )
		{
			if ( valn2int > 0 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
			if ( valn2int <= 0 )
			{
				if ( valn3 == "end" )
				{
					self.say ( "Uau, voc� recuperou mais 100 presentes para mim! Foi excelente, mas, infelizmente, como disse, s� posso dar uma �rvore MapleNatal como recompensa para cada mapler. Se voc� quiser mais uma �rvore, voc� pode tentar suas chances recuperando mais #b90 presentes#k! Voc� pode estar com sorte!" );
					end;
				}
				else
				{
					ret = inventory.exchange( 0, Num, -100, 4031878, 10, 1432046, 1 );
					if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios.  N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
					else
					{
						valn2sum = valn2int + 100;
						valn2str = string( valn2sum );
						qr.set( 8200, cTime );
						qr.set( 8201, valn2str );
						qr.set( 8202, "end" );
						self.say( "Uau, voc� recuperou mais 100 presentes para mim! Muitas crian�as v�o voltar a aproveitar o MapleNatal gra�as a voc�. Para isto, tenho uma coisa muito especial para voc�!\r\n<procure no saco de presentes dela>\r\nAqui est�... a sua pr�pria #b�rvore MapleNatal#k!\r\nEspero que voc� goste! S� posso dar este tipo de recompensa uma �nica vez, mas voc� pode continuar a recuperar presentes comigo em lotes de #b90 ou menos#k para mais recompensas. Que o seu esp�rito de Natal brilhe t�o radiante quanto esta �rvore!" );
					}
				}
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 0 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers, no dia de hoje. Parab�ns por manter o esp�rito de MapleNatal vivo e presente!" ); 
				if ( valn2int == 0 )
				{
					ret = inventory.exchange( 0, Num, -100, 4031878, 10, 1432046, 1 );
					if ( ret == 0 ) self.say( "Hummm, parece que seu n�mero est� um pouco abaixo. Voc� n�o tem muitos presentes para me dar ou seus slots est�o cheios. N�o se preocupe, volte quando voc� tiver a quantidade certa... Vou continuar por aqui.  Lembre-se, voc� pode resgatar at� #b100 presentes#k por dia e pode traz�-los em lotes de #b10, 20, 30, 40, 60, 90 ou 100.#k" );
					else
					{
						valn2sum = valn2int + 100;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						qr.set( 8202, "end" );
						self.say( "Uau, voc� recuperou mais 100 presentes para mim! Muitas crian�as v�o voltar a aproveitar o MapleNatal gra�as a voc�. Para isto, tenho uma coisa muito especial para voc�!\r\n<procure no saco de presentes dela>\r\nAqui est�... a sua pr�pria #b�rvore MapleNatal#k!\r\nEspero que voc� goste! S� posso dar este tipo de recompensa uma �nica vez, mas voc� pode continuar a recuperar presentes comigo em lotes de #b90 ou menos#k para mais recompensas. Que o seu esp�rito de Natal brilhe t�o radiante quanto esta �rvore!" );
					}
				}
			}
		}
	
		
	}
	else self.say ( "Voc� j� falou com a pequena Suzy? Tem uma crian�a na cidade de Folha Nova que precisa da sua ajuda para reencontrar seu esp�rito natalino.  Primeiro ajude-a a decidir, e, assim que fizer isso, voc� vai poder recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask == 7 ) self.say ( "Se estiver no n�vel 10-20, precisar� encontrar os #bpresentes Vermelhos e Verdes#k. Se estiver no n�vel 21-30, precisar� encontrar os #bpresentes Vermelhos e Brancos#k. N�vel 31-40, maplers precisam encontrar #bpresentes vermelhos e azuisk, enquanto os n�veis 41-60 precisam dos #bpresentes Azuis e Brancos#k. E, por �ltimo, aqueles dos n�veis 61 ou mais precisam encontrar #bpresentes Verdes e Brancos#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Traga todos para mim, quanto mais, melhor!" );
	else self.say( "OK... Fique � vontade para retornar se quiser.");
}

//trade between users and O-Pongo

function GivePresent2(integer PresentNum2) 
{

	Num = PresentNum2;
	inventory = target.inventory;
	qr = target.questRecord;
	cTime = currentTime;
	val1 = qr.getState ( 4998 );
	valn1 = qr.get ( 8200 );
	valn2 = qr.get ( 8201 );
	valn3 = qr.get ( 8203 );
	valn2int = integer( valn2 );
		
	boxask= self.askMenu( "�timo! Quantos presentes voc� recuperou? \r\n\r\n#b#L0#I Tenho 10 presentes para voc�.#l#k\r\n#b#L1#I Tenho 20 presentes para voc�. #l#k\r\n#b#L2#Itenho 30 presentes para voc�. #l#k\r\n#b#L3#Itenho 40 presentes para voc�!#l#k\r\n#b#L4#ITenho 60 presentes para voc�!#l#k\r\n#b#L5#Itenho 90 presentes para voc�!#l#k\r\n#b#L6#Itenho 100 presentes para voc�!#l#k\r\n#b#L7#Wqual a cor do presente que devo procurar?#l#k" );
	
	if ( boxask  == 0 ) 
	{
		if ( valn1 == "" )
		{	
			if ( valn2int > 90 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
			if ( valn2int <= 90 )
			{
				ret = inventory.exchange( 0, Num, -10, 4031879, 1, 2000002, 25 );
				if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�. Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
				else
				{
					valn2sum = valn2int + 10;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "Isso foi um bom esfor�o! Tenho alguns itens �teis como forma de retribui��o! \r\nSe quiser mais presentes tradicionais de Versal, voc� precisa trazer quantidades maiores de presentes a cada vez!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 90 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
				if ( valn2int <= 90 )
				{
					ret = inventory.exchange( 0, Num, -10, 4031879, 1, 2000002, 25 );
					if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�. Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
					else
					{
						valn2sum = valn2int + 10;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "Isso foi um bom esfor�o! Tenho alguns itens �teis como forma de retribui��o! \r\nSe quiser mais presentes tradicionais de Versal, voc� precisa trazer quantidades maiores de presentes a cada vez!" );
					}
				}
			}
		}
	}
	else if (boxask  == 1 )
	{
		if ( valn1 == "" )
		{
			if ( valn2int > 80 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje.  Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
			if ( valn2int <= 80 )
			{
				ret = inventory.exchange( 0, Num, -20, 4031879, 2, 4003000, 10, 4003001, 10, 4011001, 2 );
				if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�.  Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
				else
				{

					valn2sum = valn2int + 20;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "Oh! Um belo lote de presentes! Para isso, tenho mais itens considerados �teis pelas pessoas do seu mundo! \r\nEspero que voc� aproveite esses itens do mundo Maple! Se quiser uma amostra dos itens de Versal, voc� precisa trazer um n�mero maior de presentes. Boa ca�ada!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 80 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
				if ( valn2int <= 80 )
				{
					ret = inventory.exchange( 0, Num, -20, 4031879, 2, 4003000, 10, 4003001, 10, 4011001, 2 );
					if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�.  Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
					else
					{
						valn2sum = valn2int + 20;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "Oh! Um belo lote de presentes! Para isso, tenho mais itens considerados �teis pelas pessoas do seu mundo! \r\nEspero que voc� aproveite esses itens do mundo Maple! Se voc� quiser uma amostra dos itens de Versal, precisa trazer um n�mero maior de presentes. Boa ca�ada!" );
					}
				}
			}
		}
	}
	else if (boxask  == 2 )
	{
	if ( val1 == 2 )
	{
		if ( valn1 == "" )
		{
			if ( valn2int > 70 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
			if ( valn2int <= 70 )
			{
				rn1 = random( 1, 100 );
				if (1 <= rn1 and rn1 <= 25 ) 	ret = inventory.exchange( 0, Num, -30, 4031879, 3, 4020007, 10 );
				else if ( 25 < rn1 and rn1 <= 50 ) 	ret = inventory.exchange( 0, Num, -30, 4031879, 3, 4020008, 10 );
				else if ( 50 < rn1 and rn1 <= 75 ) 	ret = inventory.exchange( 0, Num, -30, 4031879, 3, 2020014, 5 );
				else if ( 75 < rn1 and rn1 <= 100 ) ret = inventory.exchange( 0, Num, -30, 4031879, 3, 2002022, 5 );
				if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�.  Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
				else
				{
					valn2sum = valn2int + 30;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "Vejamos, o que temos aqui... Parece que voc� me trouxe um lote interessante de presentes para Versalizar! Leve isto em troca! \r\nFeliz VersalNatal!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 70 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
				if ( valn2int <= 70 )
				{
					rn1 = random( 1, 100 );
					if (1 <= rn1 and rn1 <= 25 ) 	ret = inventory.exchange( 0, Num, -30, 4031879, 3, 4020007, 10 );
					else if ( 25 < rn1 and rn1 <= 50 ) 	ret = inventory.exchange( 0, Num, -30, 4031879, 3, 4020008, 10 );
					else if ( 50 < rn1 and rn1 <= 75 ) 	ret = inventory.exchange( 0, Num, -30, 4031879, 3, 2020014, 5 );
					else if ( 75 < rn1 and rn1 <= 100 ) ret = inventory.exchange( 0, Num, -30, 4031879, 3, 2002022, 5 );
					if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�.  Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
					else
					{
						valn2sum = valn2int + 30;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "Vejamos, o que temos aqui... Parece que voc� me trouxe um lote interessante de presentes para Versalizar! Leve isto em troca! \r\nFeliz VersalNatal!" );
					}
				}
			}
		}
	}
	else self.say ( "Voc� j� falou com a pequena Suzy? Acho que ela precisa da sua ajuda para recuperar seu esp�rito natalino; ela est� na cidade de Folha Nova. Primeiro ajude-a a decidir, e, assim que fizer isso, estar� pronto para recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask  == 3 ) 
	{
	if ( val1 == 2 )
	{	
		if ( valn1 == "" )
		{
			if ( valn2int > 60 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje.  Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
			if ( valn2int <= 60 )
			{
				ret = inventory.exchange( 0, Num, -40, 4031879, 4, 2022272, 3 );
				if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�.  Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
				else
				{	
					valn2sum = valn2int + 40;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "Ah! Vejo que a sua ca�a foi boa... Vejamos, para #b40 presentes#k, tenho uma surpresa deliciosa para oferecer: o tradicional jantar natalino de Versal ( #bSalm�o Defumado#k! Est� cheirando t�o bem que nem estou com vontade de dividir com voc�! T� brincando! Voc� merece, trabalhou duro para conseguir! Bom VersalNatal!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 60 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje.  Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
				if ( valn2int <= 60 )
				{
					ret = inventory.exchange( 0, Num, -40, 4031879, 4, 2022272, 3 );
					if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�.  Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
					else
					{	
						valn2sum = valn2int + 40;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "Ah! Vejo que a sua ca�ada foi boa... Vejamos, para #b40 presentes#k, tenho uma surpresa deliciosa para oferecer: o tradicional jantar natalino de Versal ( #bSalm�o Defumado#k! Est� cheirando t�o bem que nem estou com vontade de dividir com voc�! T� brincando! Voc� merece, trabalhou duro para conseguir! Bom VersalNatal!" );
					}
				}
			}
		}
	}
	else self.say ( "Voc� j� falou com a pequena Suzy? Acho que ela precisa da sua ajuda para recuperar seu esp�rito natalino; ela est� na cidade de Folha Nova. Primeiro ajude-a a decidir, e, assim que fizer isso, estar� pronto para recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask  == 4 )
	{
	if ( val1 == 2 )
	{	
		if ( valn1 == "" )
		{
			if ( valn2int > 40 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
			if ( valn2int <= 40 )
			{
				rn1 = random( 1, 1000 );
				if (1 <= rn1 and rn1 <= 500 )	ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2020014, 5, 2002022, 5 );
				else if ( 500 < rn1 and rn1 <= 700 ) 	ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2022275, 5 );
				else if ( 700 < rn1 and rn1 <= 800 ) ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2022274, 3 );
				else if ( 800 < rn1 and rn1 <= 900 ) 	ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2022273, 3 );
				else if ( 900 < rn1 and rn1 <= 995 ) ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2022277, 3 );
				else if ( 995 < rn1 and rn1 <= 1000 ) ret = inventory.exchange( 0, Num, -60, 4031879, 6, 1082228, 1 );
				
				if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�. Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
				else
				{
					valn2sum = valn2int + 60;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "#b60 presentes#k! Fant�stico! Por seu empenho, vou procurar melhor em minha sacola de guloseimas... Experimente este! \r\nAproveite estes presentes de Versal e um Feliz NatalVersal para voc�!" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 40 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
				if ( valn2int <= 40 )
				{
					rn1 = random( 1, 1000 );
					if (1 <= rn1 and rn1 <= 500 )	ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2020014, 5, 2002022, 5 );
					else if ( 500 < rn1 and rn1 <= 700 ) 	ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2022275, 5 );
					else if ( 700 < rn1 and rn1 <= 800 ) ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2022274, 3 );
					else if ( 800 < rn1 and rn1 <= 900 ) 	ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2022273, 3 );
					else if ( 900 < rn1 and rn1 <= 995 ) ret = inventory.exchange( 0, Num, -60, 4031879, 6, 2022277, 3 );
					else if ( 995 < rn1 and rn1 <= 1000 ) ret = inventory.exchange( 0, Num, -60, 4031879, 6, 1082228, 1 );
					
					if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�. Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
					else
					{
						valn2sum = valn2int + 60;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "#b60 presentes#k! Fant�stico! Por seu empenho, vou procurar melhor em minha sacola de guloseimas... Experimente este! \r\nAproveite estes presentes de Versal e um Feliz NatalVersal para voc�!" );
					}
				}
			}
		}
	}
	else self.say ( "Voc� j� falou com a pequena Suzy? Acho que ela precisa da sua ajuda para recuperar seu esp�rito natalino; ela est� na cidade de Folha Nova. Primeiro ajude-a a decidir, e, assim que fizer isso, estar� pronto para recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask == 5 )
	{
	if ( val1 == 2 )
	{	
		if ( valn1 == "" )
		{
			if ( valn2int > 10 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
			if ( valn2int <= 10 )
			{
				rn1 = random( 1, 1000 );
				if (1 <= rn1 and rn1 <= 400 )	ret = inventory.exchange( 0, Num, -90, 4031879, 9, 2022275, 10 );
				else if ( 400 < rn1 and rn1 <= 600 ) 	ret = inventory.exchange( 0, Num, -90, 4031879, 9, 2022274, 5 );
				else if ( 600 < rn1 and rn1 <= 755 ) ret = inventory.exchange( 0, Num, -90, 4031879, 9,2022273, 3 );
				else if ( 755 < rn1 and rn1 <= 905 ) 	ret = inventory.exchange( 0, Num, -90, 4031879, 9, 2022277, 3 );
				else if ( 905 < rn1 and rn1 <= 975 ) ret = inventory.exchange( 0, Num, -90, 4031879, 9, 2040805, 1 );
				else if ( 975 < rn1 and rn1 <= 990 ) ret = inventory.exchange( 0, Num, -90, 4031879, 9, 1082228, 1 );
				else if ( 990 < rn1 and rn1 <= 1000 ) ret = inventory.exchange( 0, Num, -90, 4031879, 9, 1442061, 1 );
				
				if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�.  Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
				else
				{
					valn2sum = valn2int + 90;
					valn2str = string( valn2sum );
					qr.set( 8200, cTime );
					qr.set( 8201, valn2str );
					self.say( "Ho Ho Ho! Ho Ho Ho! #b90 presentes#k! Fale sobre seu estoque! Muitas crian�as ficariam bem felizes ao receber presentes Versalizados neste natal. Voc� merece s� o melhor do Natal Versal pelo seu empenho... Aqui, leve este! r\nEspero que aproveite seu presente! Viu, n�o falei que os presentes do NatalVersal eram os melhores?" );
				}	
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 10 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
				if ( valn2int <= 10 )
				{
					rn1 = random( 1, 1000 );
					if (1 <= rn1 and rn1 <= 400 )	ret = inventory.exchange( 0, Num, -90, 4031879, 9, 2022275, 10 );
					else if ( 400 < rn1 and rn1 <= 600 ) 	ret = inventory.exchange( 0, Num, -90, 4031879, 9, 2022274, 5 );
					else if ( 600 < rn1 and rn1 <= 755 ) ret = inventory.exchange( 0, Num, -90, 4031879, 9,2022273, 3 );
					else if ( 755 < rn1 and rn1 <= 905 ) 	ret = inventory.exchange( 0, Num, -90, 4031879, 9, 2022277, 3 );
					else if ( 905 < rn1 and rn1 <= 975 ) ret = inventory.exchange( 0, Num, -90, 4031879, 9, 2040805, 1 );
					else if ( 975 < rn1 and rn1 <= 990 ) ret = inventory.exchange( 0, Num, -90, 4031879, 9, 1082228, 1 );
					else if ( 990 < rn1 and rn1 <= 1000 ) ret = inventory.exchange( 0, Num, -90, 4031879, 9, 1442061, 1 );					
					if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�. Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
					else
					{
						valn2sum = valn2int + 90;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						self.say( "Ho Ho Ho! Ho Ho Ho! #b90 presentes#k! Fale sobre seu estoque! Muitas crian�as ficariam bem felizes de receber presentes Versalizados neste natal. Voc� merece s� o melhor do Natal Versal pelo seu empenho... Aqui, leve este! r\nEspero que aproveite seu presente! Viu, n�o falei que os presentes do NatalVersal eram os melhores?" );
					}
				}
			}
		}
	}
	else self.say ( "Voc� j� falou com a pequena Suzy? Acho que ela precisa da sua ajuda para recuperar seu esp�rito natalino; ela est� na cidade de Folha Nova. Primeiro ajude-a a decidir, e, assim que fizer isso, estar� pronto para recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask == 6 )
	{
	if ( val1 == 2 )
	{		
		if ( valn1 == "" )
		{
			if ( valn2int > 0 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
			if ( valn2int <= 0 )
			{
				if ( valn3 == "end" )
				{
					self.say ( "Uau, voc� recuperou mais 100 presentes para mim! Foi excelente, mas, infelizmente, como disse, s� posso dar uma �rvore MapleNatal como recompensa para cada mapler. D� para apenas uma rodada! Se voc� quiser mais uma �rvore, voc� pode tentar suas chances recuperando mais 90 presentes! Voc� pode estar com sorte! Boa sorte!" );
					end;
				}
				else
				{
					ret = inventory.exchange( 0, Num, -100, 4031879, 10, 1442061, 1 );
					if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�. Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
					else
					{
						valn2sum = valn2int + 100;
						valn2str = string( valn2sum );
						qr.set( 8200, cTime );
						qr.set( 8201, valn2str );
						qr.set( 8203, "end" );
						self.say( "Sua dedica��o � de impressionar, #Gmeu jovem amigo:minha jovem amiga#. Voc� trabalhou muito duro para espalhar a alegria do Natal Versal, por isso devo lhe dar este item ( um tradicional arbusto, decorado, que dura 30 dias de pura felicidade ( #bO Cactus do Natal Versal#k! Ta-da! \r\nHo, ho, ho, s� posso dar este tipo de recompensa uma �nica vez, mas voc� pode continuar a recuperar presentes comigo em lotes de \r\n90 ou menos#b para mais recompensas. Que o seu Cactus se mantenha reluzente durante todo o Natal Versal e mais!" );
					}
				}
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 0 ) self.say ( "Depois deste resgate, parece que voc� j� ultrapassou seu limite de #b100 presentes#k por dia. Guarde esses e traga para mim amanh�! Quero me assegurar de que vou ter recompensas o suficiente para todos os Maplers no dia de hoje. Reconhe�o seu empenho em criar a alegria do VersalNatal!" ); 
				if ( valn2int == 0 )
				{
					ret = inventory.exchange( 0, Num, -100, 4031879, 10, 1442061, 1 );
					if ( ret == 0 ) self.say( "Ah, posso ser de Versal, mas o conceito num�rico � o mesmo tanto aqui quanto l�.  Voc� n�o recolheu presentes o suficiente ou seus slots est�o cheios. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 or 100#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Certifique-se de que conseguiu o n�mero certo!" );
					else
					{
						valn2sum = valn2int + 100;
						valn2str = string( valn2sum );
						qr.set( 8201, valn2str );
						qr.set( 8202, "end" );
						self.say( "Sua dedica��o � de impressionar, #Gmeu jovem amigo:minha jovem amiga#. Voc� trabalhou muito duro para espalhar a alegria do Natal Versal, por isso devo lhe dar este item ( um tradicional arbusto, decorado, que dura 30 dias de pura felicidade ( #bO Cactus do Natal Versal#k! Ta-da! \r\nHo, ho, ho, S� posso dar este tipo de recompensa uma �nica vez, mas voc� pode continuar a recuperar presentes comigo em lotes de \r\n90 ou menos#b para mais recompensas. Que o seu Cactus se mantenha reluzente durante todo o Natal Versal e mais!" );
					}
				}
			}
		}
	
		
	}
	else self.say ( "Voc� j� falou com a pequena Suzy? Acho que ela precisa da sua ajuda para recuperar seu esp�rito natalino; ela est� na cidade de Folha Nova. Primeiro ajude-a a decidir, e, assim que fizer isso, estar� pronto para recuperar 30 ou mais presentes de cada vez, comigo." );
	}
	else if (boxask == 7 ) self.say ( "Se estiver no n�vel 10-20, precisar� encontrar os #bpresentes Vermelhos e Verdes#k. Se estiver no n�vel 21-30, precisar� encontrar os #bpresentes Vermelhos e Brancos#k. N�vel 31-40, maplers precisam encontrar #bpresentes vermelhos e azuisk, enquanto os n�veis 41-60 precisam dos #bpresentes Azuis e Brancos#k.  E, por �ltimo, aqueles que forem do n�vel 61 ou mais devem encontrar os #b presentes verdes e brancos#k. Tragam para mim, quanto mais, melhor!" );
	else self.say( "OK... Fique � vontade para retornar se quiser.");
}

function GivePresent3(integer PresentNum3) 
{
	Num = PresentNum3;
	inventory = target.inventory;
	cTime = currentTime;
	qr = target.questRecord;
	valn1 = qr.get ( 8200 );
	valn2 = qr.get ( 8201 );
	valn3 = qr.get ( 8203 );
	valn2int = integer( valn2 );
		
	boxask= self.askMenu( "Excelente! Como prometido, tenho muitas maletas... cada uma tem uma quantidade diferente de mesos, � s� voc� escolher. Quantos presentes voc� quer recolher em troca de dinheiro? \r\n\r\n#b#L0#Recolher 25 presentes#l#k\r\n#b#L1#Recolher 50 presentes#l#k\r\n#b#L2#Recolher 75 presentes#l#k\r\n#b#L3#Recolher 100 presentes#l#k" );
	
	if ( boxask  == 0 ) 
	{
		if ( valn1 == "" )
		{	
			if ( valn2int > 75 ) self.say ( "Voc� s� pode recolher #b100 presentes#k por dia, #Ggaroto:garota#, portanto, n�o posso deixar voc� fazer isso. Escolha uma quantidade menor para recolher!" ); 
			if ( valn2int <= 75 )
			{
				q1 = self.askMenu( "25 presentes... nada mau, #Ggaroto:garota#. Por isso voc� vai receber #buma a��o #k da minha nova empresa e mais os mesos de uma dessas tr�s maletas!\r\npor recuperar 25 presentes, uma dessas maletas cont�m #b10.000 mesos#k, outra cont�m #b25.000 mesos#k e a �ltima cont�m #b50.000 mesos#k. Voc� � quem decide quanto pegar. Estou torcendo por voc�! Agora, qual das maletas voc� vai pegar? \r\n\r\n#b#L0#Cescolher maleta #1#l#k\r\n#b#L1#Cescolher maleta #2#l#k\r\n#b#L2#Cescolher maleta #3#l#k\r\n#b#L3#I mudar de id�ia. #l#k" );				
				if ( q1 == 3 )
				{
					self.say ( "<Murm�rio> Voc� n�o vai dar para tr�s comigo, n�o �, #Ggaroto:garota#? Ou voc� quer guardar os que voc� j� tem e recuperar outros mais tarde? N�o culpo voc�! Boa jogada! Quanto mais presentes voc� resgatar de uma s� vez, maior chance de ganhar muito dinheiro! Volte quando estiver pronto!" );
					end;
				}
				else
				{
					rn1 = random( 1, 100 );
					if (1 <= rn1 and rn1 <= 65 ) Meso = 10000;
					else if ( 65 < rn1 and rn1 <= 90 ) Meso = 25000;
					else if ( 90 < rn1 and rn1 <= 100 ) Meso = 50000;
					ret = inventory.exchange( Meso, Num, -25, 4031880, 1 );
					if ( ret == 0 ) self.say( "<Murm�rios> Voc� ainda n�o tem muitos presentes para me dar, #Ggaroto:garota#... talvez voc� tenha derrubado alguns no caminho, na afoba��o de chegar depressa! HARRR-HARR-HARRR! Volte quando voc� tiver mais presentes! Enquanto isso, estes mesos v�o ficar esperando por voc� bem aqui na minha maleta!" );
					else
					{
						self.say ( "Parece que voc� conseguiu..." + Meso + "Mesos! \r\nBom trabalho, #Ggaroto:garota#... Mas ainda quero mais alguns presentes. Traga assim que voc� os encontrar! Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia!" );
						valn2sum = valn2int + 25;
						valn2str = string( valn2sum );
						qr.set( 8200, cTime );
						qr.set( 8201, valn2str );
					}	
				}
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				qr.set( 8205, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 75 ) self.say ( "Voc� s� pode recolher 100 presentes por dia, #Ggaroto:garota#, portanto, n�o posso deixar voc� fazer isso. Escolha uma quantidade menor para recolher!" ); 
				if ( valn2int <= 75 )
				{
					q1 = self.askMenu( "25 presentes... nada mau, #Ggaroto:garota#. Por isso voc� vai receber #buma a��o #k da minha nova empresa e mais os mesos de uma dessas tr�s maletas!\r\npor recuperar 25 presentes, uma dessas maletas cont�m #b10.000 mesos#k, outra cont�m #b25.000 mesos#k e a �ltima cont�m #b50.000 mesos#k. Voc� � quem decide quanto pegar. Estou torcendo por voc�! Agora, qual das maletas voc� vai pegar? \r\n\r\n#b#L0#Cescolher maleta #1#l#k\r\n#b#L1#Cescolher maleta #2#l#k\r\n#b#L2#Cescolher maleta #3#l#k\r\n#b#L3#I mudar de id�ia. #l#k" );				
					if ( q1 == 3 )
					{
						self.say ( "<Murm�rio> Voc� n�o vai dar para tr�s comigo, n�o �, #Ggaroto:garota#? Ou voc� quer guardar os que voc� j� tem e recuperar outros mais tarde? N�o culpo voc�! Boa jogada! Quanto mais presentes voc� resgatar de uma s� vez, maior chance de ganhar muito dinheiro! Volte quando estiver pronto!" );
						end;
					}
					else
					{
						rn1 = random( 1, 100 );
						if (1 <= rn1 and rn1 <= 65 ) Meso = 10000;
						else if ( 65 < rn1 and rn1 <= 90 ) Meso = 25000;
						else if ( 90 < rn1 and rn1 <= 100 ) Meso = 50000;
						ret = inventory.exchange( Meso, Num, -25, 4031880, 1 );
						if ( ret == 0 ) self.say( "<Murm�rios> Voc� ainda n�o tem muitos presentes para me dar, #Ggaroto:garota#... talvez voc� tenha derrubado alguns no caminho, na afoba��o de chegar depressa! HARRR-HARR-HARRR! Volte quando voc� tiver mais presentes! Enquanto isso, estes mesos v�o ficar esperando por voc� bem aqui na minha maleta!" );
						else
						{
							self.say ( "Parece que voc� conseguiu..." + Meso + "Mesos! \r\nBom trabalho, #Ggaroto:garota#... Mas ainda quero mais alguns presentes. Traga assim que voc� os encontrar! Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia!" );
							valn2sum = valn2int + 25;
							valn2str = string( valn2sum );
							qr.set( 8201, valn2str );
						}	
					}
				}
			}
		}
	}
	else if (boxask  == 1 )
	{
		if ( valn1 == "" )
		{	
			if ( valn2int > 50 ) self.say ( "Voc� s� pode recolher 100 presentes por dia, #Ggaroto:garota#, portanto, n�o posso deixar voc� fazer isso. Escolha uma quantidade menor para recolher!" ); 
			if ( valn2int <= 50 )
			{
				q1 = self.askMenu( "50 presentes! Nada mau, #Ggaroto:garota#... Nada mau mesmo.  Por isso voc� vai receber #b duas a��es #k da minha nova empresa e mais os mesos de uma dessas tr�s maletas!\r\npor recuperar 50 presentes, uma dessas maletas cont�m #b10.000 mesos#k, outra cont�m #b25.000 mesos#k e a �ltima cont�m #b50.000 mesos#k. Voc� � quem decide quanto pegar. Agora, qual das maletas voc� vai pegar? \r\n\r\n#b#L0#Cescolher maleta #1#l#k\r\n#b#L1#Cescolher maleta #2#l#k\r\n#b#L2#Cescolher maleta #3#l#k\r\n#b#L3#I mudar de id�ia. #l#k" );				
				if ( q1 == 3 )
				{
					self.say ( "<Murm�rio> Voc� n�o vai dar para tr�s comigo, n�o �, #Ggaroto:garota#? Ou voc� quer guardar os que voc� j� tem e recuperar outros mais tarde? N�o culpo voc�! Boa jogada! Quanto mais presentes voc� resgatar de uma s� vez, maior a chance de ganhar muito dinheiro! Volte quando estiver pronto!" );
					end;
				}
				else
				{
					rn1 = random( 1, 100 );
					if (1 <= rn1 and rn1 <= 55 ) Meso = 25000;
					else if ( 55 < rn1 and rn1 <= 90 ) Meso = 50000;
					else if ( 90 < rn1 and rn1 <= 100 ) Meso = 150000;
					ret = inventory.exchange( Meso, Num, -50, 4031880, 2 );
					if ( ret == 0 ) self.say( "<Murm�rios> Voc� ainda n�o tem muitos presentes para me dar, #Ggaroto:garota#... talvez voc� tenha derrubado alguns no caminho, na afoba��o de chegar depressa! HARRR-HARR-HARRR! Volte quando voc� tiver mais presentes! Enquanto isso, estes mesos v�o ficar esperando por voc� bem aqui na minha maleta!" );
					else
					{
						self.say ( "Parece que voc� conseguiu..." + Meso + "Mesos! \r\nBom trabalho, #Ggaroto:garota#... Mas ainda quero mais alguns presentes. Traga assim que voc� os encontrar! Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia!" );
						valn2sum = valn2int + 50;
						valn2str = string( valn2sum );
						qr.set( 8200, cTime );
						qr.set( 8201, valn2str );
					}	
				}
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				qr.set( 8205, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{
				if ( valn2int > 50 ) self.say ( "Voc� s� pode recolher 100 presentes por dia, #Ggaroto:garota#, portanto, n�o posso deixar voc� fazer isso. Escolha uma quantidade menor para recolher!" ); 
				if ( valn2int <= 50 )
				{
					q1 = self.askMenu( "50 presentes! Nada mau, #Ggaroto:garota#... Nada mau mesmo.  Por isso voc� vai receber #b duas a��es #k da minha nova empresa e mais os mesos de uma dessas tr�s maletas!\r\npor recuperar 50 presentes, uma dessas maletas cont�m #b10.000 mesos#k, outra cont�m #b25.000 mesos#k e a �ltima cont�m #b50.000 mesos#k. Voc� � quem decide quanto pegar. Agora, qual das maletas voc� vai pegar? \r\n\r\n#b#L0#Cescolher maleta #1#l#k\r\n#b#L1#Cescolher maleta #2#l#k\r\n#b#L2#Cescolher maleta #3#l#k\r\n#b#L3#I mudar de id�ia. #l#k" );				
					if ( q1 == 3 )
					{
						self.say ( "<Murm�rio> Voc� n�o vai dar para tr�s comigo, n�o �, #Ggaroto:garota#? Ou voc� quer guardar os que voc� j� tem e recuperar outros mais tarde? N�o culpo voc�! Boa jogada! Quanto mais presentes voc� resgatar de uma s� vez, maior a chance de ganhar muito dinheiro! Volte quando estiver pronto!" );
						end;
					}
					else
					{
						rn1 = random( 1, 100 );
						if (1 <= rn1 and rn1 <= 55 ) Meso = 25000;
						else if ( 55 < rn1 and rn1 <= 90 ) Meso = 50000;
						else if ( 90 < rn1 and rn1 <= 100 ) Meso = 150000;
						ret = inventory.exchange( Meso, Num, -50, 4031880, 2 );
						if ( ret == 0 ) self.say( "<Murm�rios> Voc� ainda n�o tem muitos presentes para me dar, #Ggaroto:garota#... talvez voc� tenha derrubado alguns no caminho, na afoba��o de chegar depressa! HARRR-HARR-HARRR! Volte quando voc� tiver mais presentes! Enquanto isso, estes mesos v�o ficar esperando por voc� bem aqui na minha maleta!" );
						else
						{
							self.say ( "Parece que voc� conseguiu..." + Meso + "Mesos! \r\nBom trabalho, #Ggaroto:garota#... Mas ainda quero mais alguns presentes. Traga assim que voc� os encontrar! Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia!" );
							valn2sum = valn2int + 50;
							valn2str = string( valn2sum );
							qr.set( 8201, valn2str );
						}	
					}
				}
			}
		}
	}
	else if (boxask  == 2 )
	{
		if ( valn1 == "" )
		{	
			if ( valn2int > 25 ) self.say ( "Voc� s� pode recolher 100 presentes por dia, #Ggaroto:garota#, portanto, n�o posso deixar voc� fazer isso. Escolha uma quantidade menor para recolher!" ); 
			if ( valn2int <= 25 )
			{
				q1 = self.askMenu( "75 presentes! Excelente trabalho! J� posso dizer que voc� � um excelente funcion�rio da minha empresa! Por isso voc� vai receber #btr�s a��es#k da minha nova empresa e ainda os mesos de uma das tr�s maletas!\r\npelo fato de voc� ter trazido 75 presentes, vou apostar em seu jogo! Uma das maletas cont�m #b50.000 mesos#k, outra cont�m #b200.000 mesos#k e a �ltima cont�m #b500.000 mesos#k. Agora � a sua vez, #Ggaroto:garota#! Qual das maletas voc� vai pegar? \r\n\r\n#b#L0#Cescolher maleta #1#l#k\r\n#b#L1#Cescolher maleta #2#l#k\r\n#b#L2#Cescolher maleta #3#l#k\r\n#b#L3#I mudar de id�ia. #l#k" );				
				if ( q1 == 3 )
				{
					self.say ( "<Murm�rio> Voc� n�o vai dar para tr�s comigo, n�o �, #Ggaroto:garota#? Ou voc� quer guardar os que voc� j� tem e recuperar outros mais tarde? N�o culpo voc�! Boa jogada! Quanto mais presentes voc� resgatar de uma s� vez, maior a chance de ganhar muito dinheiro! Volte quando estiver pronto!" );
					end;
				}
				else
				{
					rn1 = random( 1, 100 );
					if (1 <= rn1 and rn1 <= 55 ) Meso = 50000;
					else if ( 55 < rn1 and rn1 <= 90 ) Meso = 200000;
					else if ( 90 < rn1 and rn1 <= 100 ) Meso = 500000;
					ret = inventory.exchange( Meso, Num, -75, 4031880, 3 );
					if ( ret == 0 ) self.say( "<Murm�rios> Voc� ainda n�o tem muitos presentes para me dar, #Ggaroto:garota#... talvez voc� tenha derrubado alguns no caminho, na afoba��o de chegar depressa! HARRR-HARR-HARRR! Volte quando voc� tiver mais presentes! Enquanto isso, estes mesos v�o ficar esperando por voc� bem aqui na minha maleta!" );
					else
					{
						self.say ( "Parece que voc� conseguiu..." + Meso + "Mesos! \r\nBom trabalho, #Ggaroto:garota#... Mas ainda quero mais alguns presentes. Traga assim que voc� os encontrar! Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia!" );
						valn2sum = valn2int + 75;
						valn2str = string( valn2sum );
						qr.set( 8200, cTime );
						qr.set( 8201, valn2str );
					}	
				}
			}
		}
		if ( valn1 != "" )
		{
			aTime = compareTime( cTime, valn1 );
			if ( aTime >= 1440 )
			{
				qr.set( 8200, "" );
				qr.set( 8201, "" );
				qr.set( 8205, "" );
				self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
				end;
			}
			if ( aTime < 1440 )
			{	
				if ( valn2int > 25 ) self.say ( "Voc� s� pode recolher 100 presentes por dia, #Ggaroto:garota#, portanto, n�o posso deixar voc� fazer isso. Escolha uma quantidade menor para recolher!" ); 
				if ( valn2int <= 25 )
				{
					q1 = self.askMenu( "75 presentes! Excelente trabalho! J� posso dizer que voc� � um excelente funcion�rio da minha empresa! Por isso voc� vai receber #btr�s a��es#k da minha nova empresa e ainda os mesos de uma das tr�s maletas!\r\npelo fato de voc� ter trazido 75 presentes, vou apostar em seu jogo! Uma das maletas cont�m #b50.000 mesos#k, outra cont�m #b200.000 mesos#k e a �ltima cont�m #b500.000 mesos#k. Agora � a sua vez, #Ggaroto:garota#! Qual das maletas voc� vai pegar? \r\n\r\n#b#L0#Cescolher maleta #1#l#k\r\n#b#L1#Cescolher maleta #2#l#k\r\n#b#L2#Cescolher maleta #3#l#k\r\n#b#L3#I mudar de id�ia. #l#k" );				
					if ( q1 == 3 )
					{
						self.say ( "<Murm�rio> Voc� n�o vai dar para tr�s comigo, n�o �, #Ggaroto:garota#? Ou voc� quer guardar os que voc� j� tem e recuperar outros mais tarde? N�o culpo voc�! Boa jogada! Quanto mais presentes voc� resgatar de uma s� vez, maior a chance de ganhar muito dinheiro! Volte quando estiver pronto!" );
						end;
					}
					else
					{
						rn1 = random( 1, 100 );
						if (1 <= rn1 and rn1 <= 55 ) Meso = 50000;
						else if ( 55 < rn1 and rn1 <= 90 ) Meso = 200000;
						else if ( 90 < rn1 and rn1 <= 100 ) Meso = 500000;
						ret = inventory.exchange( Meso, Num, -75, 4031880, 3 );
						if ( ret == 0 ) self.say( "<Murm�rios> Voc� ainda n�o tem muitos presentes para me dar, #Ggaroto:garota#... talvez voc� tenha derrubado alguns no caminho, na afoba��o de chegar depressa! HARRR-HARR-HARRR! Volte quando voc� tiver mais presentes! Enquanto isso, estes mesos v�o ficar esperando por voc� bem aqui na minha maleta!" );
						else
						{
							self.say ( "Parece que voc� conseguiu..." + Meso + "Mesos! \r\nBom trabalho, #Ggaroto:garota#... Mas ainda quero mais alguns presentes. Traga assim que voc� os encontrar! Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia!" );
							valn2sum = valn2int + 75;
							valn2str = string( valn2sum );
							qr.set( 8201, valn2str );
						}	
					}
				}
			}
		}
	}
	else if (boxask  == 3 ) 
	{
		if ( valn3 == "end" )
		{
			self.say ( "Pare a�, #Ggaroto:garota#! Voc� j� trouxe #b100 presentes hoje#k. Esse � o esp�rito, mas n�o quero abrir m�o de tanto dinheiro por dia. Guarde esses e traga para mim amanh�!" );
			end;
		}
		else
		{
			if ( valn1 == "" )
			{	
				if ( valn2int > 0 ) self.say ( "Voc� s� pode recolher #b100 presentes#k por dia, #Ggaroto:garota#, portanto, n�o posso deixar voc� fazer isso. Escolha uma quantidade menor para recolher!" ); 
				if ( valn2int <= 0 )
				{
					q1 = self.askMenu( "100 PRESENTES! Se voc� est� trabalhando em tempo integral para mim, vou ter que promov�-lo! Por isso voc� vai receber #bquatro a��es#k da minha nova empresa e ainda os mesos de uma das tr�s maletas!\r\npelo fato de voc� ter trazido 100 presentes, vou trazer dinheiro pra valer! Uma das maletas cont�m #b100.000 mesos#k, outra cont�m #b500.000 mesos#k e a �ltima cont�m inacredit�veis#b1.000.000 de mesos#k. UM MILH�O DE MESOS, #Ggaroto:garota#!!! � suficiente para muitos se aposentarem... A n�o ser que seus gostos sejam caros como os meus! HARRR-HARR-HARRRGHH!!! E a�, #Ggaroto:garota#? O que vai ser?  Qual a maleta que voc� vai escolher? Este � o dinheiro grande, por isso escolha com sabedoria! \r\n\r\n#b#L0#Cescolher maleta #1#l#k\r\n#b#L1#Cescolher maleta #2#l#k\r\n#b#L2#Cescolher maleta #3#l#k\r\n#b#L3#I mudar de id�ia. #l#k" );				
					if ( q1 == 3 )
					{
						self.say ( "<Murm�rio> Voc� n�o vai dar para tr�s comigo, n�o �, #Ggaroto:garota#? Ou voc� quer guardar os que voc� j� tem e recuperar outros mais tarde? N�o culpo voc�! Boa jogada! Quanto mais presentes voc� resgatar de uma s� vez, maior a chance de ganhar muito dinheiro! Volte quando estiver #Gpronto:pronta#!" );
						end;
					}
					else
					{
						rn1 = random( 1, 100 );
						if (1 <= rn1 and rn1 <= 55 ) Meso = 100000;
						else if ( 55 < rn1 and rn1 <= 90 ) Meso = 500000;
						else if ( 90 < rn1 and rn1 <= 100 ) Meso = 1000000;
						ret = inventory.exchange( Meso, Num, -100, 4031880, 4 );
						if ( ret == 0 ) self.say( "<Murm�rios> Voc� ainda n�o tem muitos presentes para me dar, #Ggaroto:garota#... talvez voc� tenha derrubado alguns no caminho, na afoba��o de chegar depressa! HARRR-HARR-HARRR! Volte quando voc� tiver mais presentes! Enquanto isso, estes mesos v�o ficar esperando por voc� bem aqui na minha maleta!" );
						else
						{
							self.say ( "Parece que voc� conseguiu..." + Meso + "Mesos! \r\nExcelente trabalho, #Ggaroto:garota#... Estamos no caminho certo para fazer esta empresa decolar! Mas ainda preciso de mais presentes, portanto pode me trazer mais amanh�! Tem mais dinheiro para voc�!" );
							valn2sum = valn2int + 100;
							valn2str = string( valn2sum );
							qr.set( 8200, cTime );
							qr.set( 8201, valn2str );
							qr.set( 8205, "end" );
						}	
					}
				}
			}
			if ( valn1 != "" )
			{
				aTime = compareTime( cTime, valn1 );
				if ( aTime >= 1440 )
				{
					qr.set( 8200, "" );
					qr.set( 8201, "" );
					qr.set( 8205, "" );
					self.say ( "Por favor, fale comigo assim que eu zerar seu limite di�rio de resgate de presentes." );
					end;
				}
				if ( aTime < 1440 )
				{	
					if ( valn2int > 0 ) self.say ( "Voc� s� pode recolher #b100 presentes#k por dia, #Ggaroto:garota#, portanto, n�o posso deixar voc� fazer isso. Escolha uma quantidade menor para recolher!" ); 
					if ( valn2int <= 0 )
					{
						q1 = self.askMenu( "100 PRESENTES! Se voc� est� trabalhando em tempo integral para mim, vou ter que promov�-lo! Por isso voc� vai receber #bquatro a��es#k da minha nova empresa e ainda os mesos de uma das tr�s maletas!\r\npelo fato de voc� ter trazido 100 presentes, vou trazer dinheiro pra valer! Uma das maletas cont�m #b100.000 mesos#k, outra cont�m #b500.000 mesos#k e a �ltima cont�m inacredit�veis#b1.000.000 de mesos#k. UM MILH�O DE MESOS, #Ggaroto:garota#!!! � suficiente para muitos se aposentarem... A n�o ser que seus gostos sejam caros como os meus! HARRR-HARR-HARRRGHH!!! E a�, #Ggaroto:garota#? O que vai ser? Qual a maleta que voc� vai escolher? Este � o dinheiro grande, por isso escolha com sabedoria! \r\n\r\n#b#L0#Cescolher maleta #1#l#k\r\n#b#L1#Cescolher maleta #2#l#k\r\n#b#L2#Cescolher maleta #3#l#k\r\n#b#L3#I mudar de id�ia. #l#k" );				
						if ( q1 == 3 )
						{
							self.say ( "<Murm�rio> Voc� n�o vai dar para tr�s comigo, n�o �, #Ggaroto:garota#? Ou voc� quer guardar os que voc� j� tem e recuperar outros mais tarde? N�o culpo voc�! Boa jogada! Quanto mais presentes voc� resgatar de uma s� vez, maior a chance de ganhar muito dinheiro! Volte quando estiver #Gpronto:garota#!" );
							end;
						}
						else
						{
							rn1 = random( 1, 100 );
							if (1 <= rn1 and rn1 <= 55 ) Meso = 100000;
							else if ( 55 < rn1 and rn1 <= 90 ) Meso = 500000;
							else if ( 90 < rn1 and rn1 <= 100 ) Meso = 1000000;
							ret = inventory.exchange( Meso, Num, -100, 4031880, 4 );
							if ( ret == 0 ) self.say( "<Murm�rios> Voc� ainda n�o tem muitos presentes para me dar, #Ggaroto:garota#... talvez voc� tenha derrubado alguns no caminho, na afoba��o de chegar depressa! HARRR-HARR-HARRR! Volte quando voc� tiver mais presentes! Enquanto isso, estes mesos v�o ficar esperando por voc� bem aqui na minha maleta!" );
							else
							{
								self.say ( "Parece que voc� conseguiu..." + Meso + "Mesos! \r\nExcelente trabalho, #Ggaroto:garota#... Estamos no caminho certo para fazer esta empresa decolar! Mas ainda preciso de mais presentes, portanto, pode me trazer mais amanh�! Tem mais dinheiro para voc�!" );
								valn2sum = valn2int + 100;
								valn2str = string( valn2sum );
								qr.set( 8201, valn2str );
								qr.set( 8205, "end" );
							}	
						}
					}
				}
			}
		}
	}
	else self.say( "Ok. Fique � vontade para retornar se quiser.");
}



//I've seen some monster dropping presents.  Do these belong to you? (MapleClaw)
script "claws_present"
{
	inventory = target.inventory;
	qr = target.questRecord;

	val1 = qr.getState ( 4998 );

	cTime = currentTime;
	
	esTime = compareTime( cTime, "07/11/20/00/00" ); // check for the event-starting time								
	eeTime = compareTime( "08/01/15/23/00", cTime ); // check for the time after the event is over
									
	if ( esTime < 0 ) self.say( "Ainda n�o � �poca de Natal!" );								
	else {								
		if ( eeTime < 0 ) self.say( "O Natal acabou." );							
		else 
		{
			menu1 = self.askMenu ( "Meus presentes! Voc� encontrou! Alguns deles, pelo menos! \r\n\r\n#b#L0#Hcomo posso ajudar com estes presentes perdidos?#l#k\r\n#b#L1#Iencontrei um monte destes presentes e queria devolver para voc�!#l#k" );
			if ( menu1 == 0 )
			{
				self.askMenu ( "Eu n�o perdi nada... Eles foram roubados do meu dep�sito! Na verdade, preciso recuperar o m�ximo que puder antes do t�rmino do Maple Natal. Caso contr�rio, temo que muitos bons meninos v�o ficar sem presente neste ano... n�o podemos deixar isso acontecer! Para me ajudar, recolha todos os presentes que puder e traga de volta para mim! \r\n#b#L0#Scoisa certa, Miau Noel.#l#k" );
				self.askMenu ( "Como foram perdidos muitos presentes, decidi organizar voc�s de acordo com seus n�veis para obter o m�ximo de empenho de todos. Voc� precisa encontrar monstros que estejam de acordo com o seu n�vel para pegar os presentes certos. Se estiver no n�vel 10-20, precisar� encontrar os #bpresentes Vermelhos e Verdes#k. Se estiver no n�vel 21-30, precisar� encontrar os #bpresentes Vermelhos e Brancos#k. Se estiver no n�vel 31-40, precisar� encontrar os #bpresentes Vermelhos e Azuis#k. Se estiver no n�vel 41-60, precisar� encontrar os #bpresentes Azuis e Brancos#k. E, por �ltimo, se estiver no n�vel 61 ou mais, precisar� encontrar os #bpresentes Verdes e Brancos#k\r\n#b#L0#Aalgo mais?#l#k" );
				menu2 = self.askMenu ( "Para receber alguma coisa minha, voc� precisa encontrar ao menos cinco presentes. Quanto maior o n�mero de presentes, melhor o pr�mio. Lembre-se, voc� pode me trazer lotes de presentes em grupos de #b10, 20, 30, 40, 60, 90 ou 100#k. E se voc� me trouxer #b100 presentes#k, Vou recompens�-lo com uma #b�rvore de MapleNatal#k  S� sua!\r\nQuando voc� tiver juntado um monte deles, pode trazer para mim! Tenho um n�mero limitado de recompensas para distribuir, voc� pode me trazer o m�ximo de #b100 presentes por dia#k. E como disse, voc� tamb�m vai receber #b1 estrela do esp�rito de MapleNatal#k para cada dez presentes que trouxer. Mantenha esse esp�rito bem aceso!\r\n\r\n#b#L0#Ok, Vou fazer isso! A prop�sito, sabia que uma pessoa da NLC est� oferecendo mesos pelos seus presentes?#l#k" );
				if ( menu2 == 0 ); self.say ( "Rrrrrrawr!!!! Ouvi dizer que um certo #bSr. Grubber#k voltou � cidade! Sei bem que, como a Miau Noel, devo ser gentil e cordial com todos, mas esse Sr. Grubber faz as minhas unhas encresparem! Sem d�vida, ele est� na minha lista de maus meninos h� muito, muito tempo, e tenho suspeitas de que ele estava por tr�s daquele ataque que o Balrog Rubro me fez, no ano passado. O que quer que ele esteja armando, sei que n�o est� dentro do esp�rito de MapleNatal.N�o acredite no que ele diz, e tenho certeza de que nem preciso lembrar: vender presentes roubados #en�o#n faz parte do esp�rito de Natal Maple!" );
			}
			if ( menu1 == 1 )
			{	
				if ( val1 == 2 ) self.say ( "Tsc, tsc... Voc� decidiu comemorar o Natal Versal neste ano, lembra?  Infelizmente, voc� n�o pode mais recuperar presentes comigo." );
				else
				{
					if ( target.nLevel >= 10 and  target.nLevel <= 20 )	{
						PresentNum1 = 4031443;
						GivePresent1(PresentNum1);
					}
					else if ( target.nLevel >= 21 and  target.nLevel <= 30 ) {
						PresentNum1 = 4031440;		
						GivePresent1(PresentNum1);
					}
					else if ( target.nLevel >= 31 and  target.nLevel <= 40 ) {
						PresentNum1 = 4031441;
						GivePresent1(PresentNum1);
					}
					else if ( target.nLevel >= 41 and  target.nLevel <= 60 ) {
						PresentNum1 = 4031439;
						GivePresent1(PresentNum1);
					}
					else  {
						PresentNum1 = 4031442;
						GivePresent1(PresentNum1);
					}
				}
			}			
		}							
	}								
}	




script "pongo_present"
{
	inventory = target.inventory;
	qr = target.questRecord;

	val1 = qr.getState ( 4997 );

	cTime = currentTime;
	esTime = compareTime( cTime, "07/11/20/00/00" ); // check for the event-starting time								
	eeTime = compareTime( "08/01/15/23/00", cTime ); // check for the time after the event is over
									
	if ( esTime < 0 ) self.say( "Ainda n�o � �poca de Natal!" );								
	else 
	{								
		if ( eeTime < 0 ) self.say( "O Natal acabou." );							
		else 
		{
			q1 = self.askMenu ( "Sou conhecido como O-Pongo, o camundongo de VersalNatal! O que posso fazer por voc�? \r\n#b#L0#Cvoc� pode me falar mais sobre o VersalNatal? Como � o VersalNatal? #l#k\r\n#b#L1#WO que voc� acha destes presentes, O-Pongo? Encontrei muitos deles com monstros assustadores. #l#k\r\n#b#L2#ITenho um monte de presentes para voc�, O-Pongo, prontos para serem Versalizados!#l#k" );
			if ( q1 == 0 )
			{
				self.askMenu ( "Bem, o VersalNatal tem suas ra�zes na antiga f�bula de Versal. � uma hist�ria antiga, passada h� muitas eras. � uma hist�ria um pouco longa, mas muito importante para n�s, versalianos. \r\n#b#L0#I'Gostaria de ouvi-la?#l#k" );
				self.say ( "Muito bem, jovem #Gamigo:amiga#! Vou lhe contar a hist�ria! \r\nVersal n�o foi sempre coberta de sombras, sabe. H� muito, muito tempo atr�s, antes de Versal ser o que se tornou hoje, era apenas uma simples vila Versaliana entre os campos cultivados com cebolas, que serviam ao pr�prio sustento. O sol brilhava todos os dias na vila, banhando a terra com seu calor e sua luz. Para assegurar que suas cebolas crescessem grandes e em quantidade suficiente, os versalianos cantavam can��es para o sol todos os dias, para ajudar no desenvolvimento das cebolas. Todavia, as criaturas selvagens da floresta viam as maduras e saborosas cebolas dos alde�es e se esquivavam para roub�-las! Com a perda de algumas colheitas, os versalianos tiveram trabalho extra apenas para ter o suficiente para comer." );
				self.say ( "Os anci�os da vila tiveram uma id�ia. Entre as criaturas da floresta vivia uma fera poderosa. A fera era muito forte, mais forte do que qualquer uma das outras criaturas. Devido � sua for�a, esta fera era respeitada pelos alde�es e temida pelos outros monstros. Os anci�os decidiram fazer um acordo com a fera, apesar do medo dos alde�es. A vila daria parte de seu alimento em troca da sua prote��o contra qualquer mal. E, por muitos anos, a vila ficou em paz." );
				self.say ( "Sob a prote��o da fera, os alde�es n�o se preocuparam mais com suas planta��es e n�o foram mais roubados pelas criaturas. Sem o roubo, os estoques de cebolas cresceram. E, com muitas cebolas deliciosas para comer, os alde�es come�aram a negligenciar o trabalho nas lavouras e esqueceram suas can��es para o sol. As can��es foram diminuindo, o sol come�ou a se inclinar no c�u e sua luz foi diminuindo. \r\nmas, � medida que os alde�es prosperavam, a fera come�ou a ficar descontente com sua cota de comida. Ela come�ou a se sentir mais e mais faminta e pediu mais comida. Os alde�es recusaram at� que a fera amea�ou com�-los. Amedrontados, os versalianos cederam e alimentaram mais a fera." );
				self.askMenu ( "Acontece que, quanto mais a fera comia, mais ela crescia e maior se tornava seu apetite. Em pouco tempo, a fera cresceu tanto que nenhuma refei��o normal a satisfazia, e ela precisava de refei��es que abastecessem muitos invernos. Para vencer sua fome insaci�vel, a fera gigante pulou at� os c�us com um rosnado assustador e engoliu a grande fonte de energia, a �nica capaz de saci�-la ( o sol. Sem as can��es dos versalianos, o sol ficou baixo, e a fera conseguiu alcan��-lo. Em um gole...  todo o mundo foi jogado numa escurid�o eterna.\r\n#b#L0#WUau!#l#k" );
				self.say ( "Sem o sol, a terra ficou fria, as cebolas secaram e, sem poder manter suas planta��es, muitos versalianos passaram fome. A fera n�o se importou com nada disso, estava muito satisfeita com o sol na sua barriga. Ela rastejou at� uma caverna escura em um vale desolado e dormiu o sono das eras.\r\nos dias se passaram e os versalianos come�aram a morrer de fome.  <calafrios> Que terr�vel forma de morrer. Sem a prote��o da fera e energia para se defender, os alde�es se tornaram presa f�cil das criaturas que os cercavam.  Amedrontados, os alde�es pediram que os anci�es os ajudassem, mas eles tinham muito medo de confrontar a fera." );
				self.say ( "Um grupo de ca�adores ( almas corajosas, homens e mulheres com suas fam�lias e filhos ( decidiu que n�o suportava mais ver seus entes queridos sofrendo. Eles engoliram o pr�prio medo e foram ao encontro da fera na caverna. Depois de uma longa e aterrorizante batalha, eles finalmente triunfaram sobre a fera! O sol, liberto dos confins do est�mago da fera, voltou aos c�us e a luz mais uma vez retornou ao mundo de Versal!" );
				self.say ( "Nos dias que se seguiram � batalha com a fera, as pessoas de Versal celebraram a volta do sol com o pouco que tinham, mas saborearam cada pedacinho com grande satisfa��o. A pena foi que o sol, enfraquecido pelo tempo que passou na barriga da fera, perdeu o poder de permanecer brilhando o ano todo. Assim, os versalianos voltaram a cantar as can��es para que o sol recuperasse sua vitalidade. O sol brilhou por exatos 99 dias, mas, no cent�simo dia, n�o teve for�as para continuar brilhando. O sol deitou-se em um sono de recupera��o, prometendo voltar a cada ano, com for�as renovadas para brilhar mais forte, retornando no dia que agora � conhecido como Natal de Versal. Desde essa �poca a luz n�o fica presente durante todo o ano em Versal. O sol se retira dos c�us por alguns meses e a noite toma seu lugar durante sua aus�ncia." );
				self.askMenu ( "Nunca mais os versalianos tiveram garantias da presen�a do sol.  O ano seguinte, no dia em que o sol ressurgiu e no anivers�rio da derrota da fera, os versalianos comemoraram mais uma vez e chamaram de ''99 dias de contentamento.'' Com o tempo, a tradi��o continuou e as pessoas come�aram a dar presentes uns para os outros, complementando a celebra��o. E foi assim que o feriado conhecido como o Natal de Versal surgiu! \r\n#b#L0#Wuau, � uma grande hist�ria. Voc� acredita que a f�bula seja verdadeira? #l#k" );
				self.askMenu ( "H� muita verdade em todas as f�bulas, #Gmeu amigo:minha amiga#. E o Natal de Versal � sobre muitas verdades. \r\nSei o que est� pensando... Anteriormente mencionei os ''30 dias de contentamento'' enquanto a f�bula diz que foram 99 dias. Percebe, o Natal de Versal n�o costumava ter apenas 30 dias. Antigamente, comemorava-se por 99 dias a cada ano, de acordo com a hist�ria, mas, com o passar dos anos, a visita do sol ao nosso mundo vem se tornando cada vez mais curta. Isso apenas mostra que o Natal de Versal fica mais e mais importante a cada ano! Nossos dias de luz podem ser poucos, mas n�s, versalianos vamos comemorar esses dias com muita alegria e cantar nossas can��es de louvor ao sol cada vez mais alto! \r\ndevo acrescentar que esta hist�ria � tanto para a fera quanto para os alde�es.  Entenda esta f�bula como quiser, #Gmeu jovem amigo:minha jovem amiga#, o importante � manter o esp�rito do Natal de Versal vivo!\r\n#b#L0#Tobrigado.  Vou ter isso sempre em mente. #l#k" );
			}
			else if ( q1 == 1 )
			{
				self.askMenu ( "Presentes! Adoro presentes! Posso ver alguns deles?  <Examinando os presentes>Humm... Por que, o que � isto?  Po��es vermelhas e azul? Flechas? OH! \r\n#b#L0#WO que est� errado?#l#k" );
				self.askMenu ( "Bem, parece que os presentes dados no MapleNatal n�o s�o assim t�o incr�veis.Um pouquinho chatos, na verdade. Muito pr�ticos e com certeza n�o t�o gostosos! N�o, n�o. Com certeza, os versalianos n�o iriam gostar de receber estes itens de Natal Versal. Se as crian�as daqui forem um pouco parecidas com as crian�as do mundo Maple, estamos com problemas! Pela minha experi�ncia, crian�as s�o sempre exigentes, n�o importa de que mundo elas v�m! E, se n�o ganharem o que querem, n�o v�o ficar felizes... N�o quero ver as crian�as tristes! Especialmente no Natal Versal! \r\nHo-Ho-Ho! Tenho um plano!\r\n\r\n#b#L0#Um... O que voc� est� pensando em fazer, O-Pongo?#l#k" );
				self.say ( "Por que, � f�cil! Com um movimento da minha varinha m�gica de Natal Versal, posso transformar estes presentes em algo bem mais divertido! O que precisamos aqui � de um pouco da alegria do Natal Versal... e � isso que eu quero! Tudo que preciso � que voc� me traga os presentes que encontrar, assim ou vou versalizar todos eles! Devo entregar eu mesmo estes presentes! Adoro ver a alegria nos rostinhos dos pequeninos!" );
				self.askMenu ( "Claro, claro, por fazer esta boa a��o, vou recompens�-lo com alguns destes presentes de Versal! Tenho de tudo, desde #bLuvas verdes#k at� #bCactus VersalNatal#k s� seus, sem mencionar todas as guloseimas que mencionei antes! Acredite em mim, voc� ainda n�o viveu se n�o experimentou uma #bCebola Caramelada #k!\r\n#b#L0#Er... Eu acredito em voc�.#l#k" );
				self.askMenu ( "<risadas> Vamos resolver isso assim que voc� tiver um em suas m�os! \r\nAgora, o tipo de presentes que voc� vai me trazer depende do tamanho de sua for�a. Monstros diferentes carregam presentes de cores diferentes. Se estiver no n�vel 10-20, precisar� encontrar os #bpresentes Vermelhos e Verdes#k. Se estiver no n�vel 21-30, precisar� encontrar os #bpresentes Vermelhos e Brancos#k. N�vel 31-40, maplers precisam encontrar #bpresentes vermelhos e azuisk, enquanto os n�veis 41-60 precisam dos #bpresentes Azuis e Brancos#k. Por fim, aqueles que estiverem no n�vel 61 ou superior devem recolher #bpresentes verdes e brancos#k. Voc� pode me trazer os presentes em lotes de #b10, 20, 30, 40, 60, 90 ou 100#k. Por favor, lembre-se de que voc� s� pode entregar #b100 presentes por dia#k. Vou confessar uma coisa, favore�o aqueles que trabalham duro e que contribuem mais, portanto, quanto mais presentes voc� trouxer, melhor a recompensa que vai receber! \r\n#b#L0#Sparece �timo! Estou pronto para ca�ar!#l#k" );
				self.askMenu ( "Sabia que podia contar com algu�m como voc�. Outra coisa que voc� deve saber: Para cada 10 presentes que voc� trouxer, seu empenho vai criar #b1 Orbe de Alegria VersalNatal #k! Se voc� me trouxer #b60 presentes#k em uma vez, voc� vai receber #b6 Orbes de alegria VersalNatal #k!\r\nNeste feriado, digo que devemos criar o m�ximo de #dalegria VersalNatal#k que pudermos! Se conseguirmos criar mais alegria de VersalNatal neste mundo do que qualquer outro esp�rito de natal, no final dos 30 dias de contentamento, todos os que foram escolhidos para celebrar o VersalNatal neste ano v�o receber, de mim, uma #brecompensa especial#k! \r\n#b#L0#A Recompensa especial?! Isso � empolgante! O que � isto? #l#k" );
				self.say ( "Por que uma #brecompensa especial#k � muito mais divertida quando � uma surpresa, n�o �? Sim, sim! Por isso n�o vou contar exatamente o que � a recompensa! N�o, n�o... Isso certamente tiraria toda a gra�a! Mas, confie em mim, � uma coisa que ser� extremamente �til para todos! \r\nFa�a o seu melhor para criar o m�ximo de alegria #dVersalNatal#k que voc� conseguir, trazendo o maior n�mero de presentes que encontrar. Assim voc� vai descobrir em primeira m�o qual � o presente surpresa no fim dos 30 dias! Lembre-se, s� vou dar o presente especial se a alegria de #dVersalNatal#k for o #besp�rito de Natal mais forte#k neste ano... Apenas seu grande empenho e de todos aqueles que festejarem conosco ser� recompensado!" );
			}
			else if ( q1 == 2 )
			{
				if ( val1 == 2 ) self.say ( "Voc� decidiu comemorar o MapleNatal neste ano, lembra?Acho que voc� deveria ter levado esses presentes para a Miau Noel... Ela est� esperando receb�-los de voc�." );
				else
				{
					if ( target.nLevel >= 10 and  target.nLevel <= 20 )	{
						PresentNum2 = 4031443;
						GivePresent2(PresentNum2);
					}
					else if ( target.nLevel >= 21 and  target.nLevel <= 30 ) {
						PresentNum2 = 4031440;		
						GivePresent2(PresentNum2);
					}
					else if ( target.nLevel >= 31 and  target.nLevel <= 40 ) {
						PresentNum2 = 4031441;
						GivePresent2(PresentNum2);
					}
					else if ( target.nLevel >= 41 and  target.nLevel <= 60 ) {
						PresentNum2 = 4031439;
						GivePresent2(PresentNum2);
					}
					else  {
						PresentNum2 = 4031442;
						GivePresent2(PresentNum2);
					}
				}
			}
		}
	}
}

script "grubber_present"
{
	inventory = target.inventory;
	qr = target.questRecord;

	val1 = qr.get ( 8204 );
	
	cTime = currentTime;
	esTime = compareTime( cTime, "07/11/20/00/00" ); // check for the event-starting time								
	eeTime = compareTime( "08/01/15/23/00", cTime ); // check for the time after the event is over
									
	if ( esTime < 0 ) self.say( "Ainda n�o � �poca de Natal!" );								
	else 
	{								
		if ( eeTime < 0 ) self.say( "O Natal acabou." );							
		else 
		{
			if ( val1 == "end" )
			{
				self.askMenu ( "Voc� parece ser esperto... E os espertinhos sabem quando uma oportunidade aparece. O que acha de participar de uma lucrativa oportunidade de neg�cios?\r\n#b#L0#Gnatal Invejoso do Grubber#l#k" );
				q1 = self.askMenu ( "O que voc� trouxe para mim, #Ggaroto:garota#? \r\n#b#L0#Itrouxe alguns presentes, Sr. Grubber!#l#k\r\n#b#L1#Sdesculpe, mas n�o tenho nada para voc� agora, Sr.Grubber!#l#k" );
				if ( q1 == 1 ) self.say ( "O qu�? Bem, volte para l�, #Ggaroto:garota#! Dinheiro vivo por trabalho duro!" );
				else
				{
					if ( target.nLevel >= 10 and  target.nLevel <= 20 )	{
						PresentNum3 = 4031443;
						GivePresent3(PresentNum3);
					}
					else if ( target.nLevel >= 21 and  target.nLevel <= 30 ) {
						PresentNum3 = 4031440;		
						GivePresent3(PresentNum3);
					}
					else if ( target.nLevel >= 31 and  target.nLevel <= 40 ) {
						PresentNum3 = 4031441;
						GivePresent3(PresentNum3);
					}
					else if ( target.nLevel >= 41 and  target.nLevel <= 60 ) {
						PresentNum3 = 4031439;
						GivePresent3(PresentNum3);
					}
					else  {
						PresentNum3 = 4031442;
						GivePresent3(PresentNum3);
					}
				}
			}
			else
			{
				self.askMenu ( "Voc� parece ser esperto... E os espertinhos sabem quando uma oportunidade aparece. O que acha de participar de uma lucrativa oportunidade de neg�cios?\r\n#b#L0#Gnatal Invejoso do Grubber#l#k" );
				q1 = self.askMenu ( "Permita que me apresente. Meu nome � Barnaby Carlyle Grubber III, mas pode me chamar de Sr. Grubber. Posso ser chamado de o milion�rio que venceu sozinho, um homem de neg�cios extraordin�rio, � o que digo -- HAR-HAR!!! \r\nN�o sou o que sou permanecendo apenas sentado, ocioso! N�o tem a menor chance! Arregacei as mangas e sujei as m�os com trabalho duro! Para ganhar dinheiro vivo � preciso trabalho duro! Quer ficar t�o #Grico:rica# quanto eu? Deixe-me perguntar uma coisa: VOC� est� pronto para arrega�ar as mangas e sujar as m�os? \r\n\r\n#b#L0#YSim, senhor, Sr. Grubber, senhor! Estou ouvindo!#l#k\r\n#b#L1#Nme diga, por que eu iria gastar meu tempo precioso ouvindo as baboseiras de um enrolador, cavador de dinheiro, metido como voc�? #l#k" );
				if ( q1 == 1 ) self.say ( "Grrrrr!!! N�o me diga que voc� � uma daquelas pessoas que acreditam que mesos s�o a raiz de todo o mal? Ha! Os �nicos que dizem isso s�o aqueles que n�o t�m mesos! HAR-HAR-HAR!!! Saia da minha frente, #Ggaroto:garota#!" );
				else
				{
					self.askMenu ( "EXATAMENTE! Grrr ( Voc� � #Gum espertinho:uma espertinha#! Pelo fato de voc� ser mesmo #Gum espertinho:uma espertinha#, #Ggaroto:garota#, vou propor um trato! Dinheiro para MIM significa dinheiro para VOC�! \r\n#b#L0#Hque tal?#l#k" );
					self.askMenu ( "Veja bem, #Ggaroto:garota#, ganha-se muito dinheiro vendendo presentes, mas tenho um problema, n�o consigo decidir o que fabricar, quais itens seriam bons presentes. Parece que escovas de dente e calotas n�o fazem mais sucesso com as crian�as hoje em dia! Fazer bons presentes � um neg�cio dif�cil... N�o � f�cil adivinhar o que vai fazer sucesso neste ano para o natal. � por isso que eu, Barnaby Carlyle Grubber Terceiro, bolei um plano brilhante para este ano! \r\n#b#L0#Er... Qual � o plano?#l#k" );
					self.askMenu ( "Voc� ouviu por a� que os monstros roubaram um mont�o de presentes da Miau Noel? Bem, ela foi roubada! Gatinha trouxa! E esses presentes j� tinham sido comprados, embrulhados e estavam prontos para ser enviados para a Noite de Natal Maple! De qualquer forma, o azar dela cabe direitinho em meus planos! Entendeu? HARRR-HARR-HARRRGHH!!! O meu plano? Decidi que vou pegar esses presentes! Vou compr�-los de quem quer que os recolha! E vou pagar caro por eles! \r\n#b#L0#Er... Como isso vai ajudar? #l#k" );
					self.askMenu ( "Observando os presentes deste ano, vou ser capaz de planejar quais devem ser fabricados no ano que vem! E, afinal de contas, posso juntar todos e vender novamente para os pais! Com certeza, esses presentes reformados n�o v�o servir para este ano... mas v�o servir no ano que vem! HARRR-HARR-HARRRGHH!!! E os pais n�o v�o saber de nada... V�o compr�-los de novo! Quanto mais presentes pegar neste ano, menos terei que produzir ano que vem! � uma situa��o ganha-ganha!\r\n#b#L0#Er, parece que sim--#l#k" );
					self.askMenu ( "ENGENHOSO, n�? Eu sei! O qu�? Quer dizer que algumas crian�as n�o v�o receber presentes no Maple Natal deste ano? Claro, talvez... E ( O Qu�??? As crian�as v�o receber no ano que vem o que pediram neste ano?  Sim... mas ( Pare de me interromper! Se pensarmos a longo prazo, as ind�strias Grubber v�o fazer muito mais presentes para os pais comprarem ( quero dizer, para as crian�as... Ent�o vai ser bom a longo prazo! \r\n#b#L0#Uh, ok...#l#k" );
					self.askMenu ( "O mais importante, #Ggaroto:garota#, � o dinheiro no seu bolso! Dinheiro que voc� pode gastar no que quiser!  Voc� vai poder se dar um presente muito legal de Maple Natal neste ano! Uma nova arma, bonitas meias! HAR-HAR!!! Caso voc� recupere alguns presentes matando monstros, traga para mim! Toda vez que voc� me trouxer um monte de brinquedos, vou dar um monte de dinheiro! Voc� tem o potencial de ganhar #bdezenas de milhares, centenas de milhares #k, talvez at� #bmilh�es de mesos#k fazendo isso para mim!\r\n#b#L0#<gulp>... Milh�es? #l#k" );
					q2 = self.askYesNo ( "Milh�es... Se voc� trabalhar duro! E isso n�o � tudo! Pelo seu trabalho duro, #Ggaroto:garota#, tamb�m vou deixar voc� fazer parte... Vou dar a��es da minha nova divis�o da empresa que fabrica presentes! Voc� vai receber um #bCertificado de Meia das ind�strias Grubber, Inc#k. sempre que voc� me ajudar! Seremos s�cios! Guarde essas a��es e, quando elas decolarem no mercado, voc� vai poder troc�-las por uma coisa bem legal! Voc� vai ser #Grico:rica# como eu! \r\nO que me diz, #Ggaroto:garota#? Parece que fechamos um acordo?" );
					if ( q2 == 0 ) self.say ( "Voc� est� recusando meu plano?! Grrrr! Quanto custa arranjar bons ajudantes nos dias de hoje?! � duro ser rico, estou te falando. <suspiro> Como meu pai costumava dizer: Mais mesos, mais problemas." );
					else
					{
						qr.set ( 8204, "end" );
						self.say ( "Perfeito! Assim � que vai funcionar: Voc� pode me trazer presentes em lotes de #b25, 50, 75 ou 100 presentes#k. Estou disposto a comprar at� #b100 presentes#k seus, e vou pegar apenas certos tipos de presentes, dependendo do n�vel em que voc� est�: Se estiver no n�vel 10-20, precisar� encontrar os #bpresentes Vermelhos e Verdes#k. Se estiver no n�vel 21-30, precisar� encontrar os #bpresentes Vermelhos e Brancos#k. Se estiver no n�vel 31-40, precisar� encontrar os #bpresentes Vermelhos e Verdes#k. Se estiver no n�vel 41-60, precisar� encontrar os #bpresentes Vermelhos e Verdes#k. E, por �ltimo, aqueles dos n�veis 61 ou mais precisam encontrar #bpresentes Verdes e Brancos#k. Lembre-se, voc� pode recuperar um total de #b100 presentes#k por dia! Traga todos para mim, quanto mais, melhor! \r\nCada vez que voc� trouxer um lote, vamos jogar um joguinho: Vou mostrar 3 maletas cheias de dinheiro ( cada uma com uma quantidade diferente de mesos. Voc� precisa escolher uma ( e vai levar os mesos que estiverem nela!");
						self.say ( "E n�o se preocupe, nenhuma delas est� vazia. N�o, n�o, n�o! Isso seria um truque baixo! HARRR-HARR-HARRR! Por exemplo, se voc� trouxer #b25 presentes#k, uma das maletas ter� #b10.000 mesos#k, uma ter� #b25.000 mesos#k e a outra ter� #b50.000 mesos#k. Voc� n�o vai saber o quanto recebeu at� abrir a maleta, mas � GARANTIDO que vai sempre receber dinheiro quando me trouxer presentes. Quero esses presentes, tenho muito dinheiro para torrar e sou bom por cada meso!" );
						self.say ( "Al�m disso, quanto mais presentes voc� trouxer de cada vez, mais dinheiro voc� vai encontrar em cada maleta! Se voc� trouxer #b100 presentes#k de uma vez, uma das 3 maletas vai guardar#b1 MILH�O DE MESOS#k ! N�o se preocupe... Vou explicar tudo de novo com mais detalhes assim que voc� me trouxer o n�mero solicitado de presentes." );
						self.say ( "E, finalmente, para cada #b25 presentes#k que voc� pegar para mim, vou lhe dar #bum Papel de A��es das Ind�strias Grubber, Inc#k. ( uma a��o da minha companhia! Se voc� me trouxer #b100 presentes#k de uma vez, vou lhe dar #bquatro a��es#k. Entendeu como funciona? Guarde essas a��es e voc� vai conseguir uma coisa bem legal no final! \r\nEntendeu bem? Agora, p� na estrada e v� achar esses presentes!" );
					}	
				}				
			}
		}
	}
}

script "suzy_lost"
{
	inventory = target.inventory;
	qr = target.questRecord;

	val1 = qr.getState ( 4994 );
	val2 = qr.getState ( 4997 );
	val3 = qr.getState ( 4998 );
	
	cTime = currentTime;
	esTime = compareTime( cTime, "07/11/20/00/00" ); // check for the event-starting time								
	eeTime = compareTime( "08/01/15/23/00", cTime ); // check for the time after the event is over
									
	if ( esTime < 0 ) self.say( "Ainda n�o � �poca de Natal!" );								
	else 
	{								
		if ( eeTime < 0 ) self.say( "O Natal acabou." );							
		else 
		{
			if ( val1 == 0 ) self.askMenu ( "O que � isto? \r\n#b#LEsquece. Estou errado.#l" );
			if ( val1 == 1 ) self.askMenu ( "O que � isto? \r\n#b#LEsquece. Estou errado.#l" );
			if ( val1 == 2 )
			{
				if ( val2 == 2 ) self.askMenu ( "O que � isto? \r\n#b#LEsquece. Estou errado.#l" );
				else
				{
					if ( val3 == 2 ) self.askMenu ( "O que � isto? \r\n#b#LEsquece. Estou errado.#l" );
					else
					{
						nItem = inventory.itemCount( 4031877 ) ;
						if ( nItem != 0 ) self.askMenu ( "O que � isto? \r\n#b#LEsquece. Estou errado.#l" );
						else
						{
							self.say ( "O que voc� quer dizer? Ah, voc� n�o fez... Voc� perdeu a lista de pedidos que eu te dei? Achei que os adultos n�o perdiam as coisas como eu!" );
							ret = inventory.exchange( 0, 4031877, 1 );
							if ( ret == 0 ) self.say( "Os slots ETC do seu parceiro est�o cheios." );
							else self.say ( "Aqui, escrevi de novo para voc�. Por favor, n�o perca desta vez!" );
						}
					}	
				}
			}
		}
	}
}
