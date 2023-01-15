 module "standard.s"; 

 script "bookPrize" { 
 	inventory = target.inventory; 

 	if ( inventory.itemCount( 4031048 ) >= 1 ) { 
 		nRet = self.askYesNo( "Opa, opa! Voc� tem #b#t4031048##k? Certo... se me der, eu troco com voc� por um item legal. MAS entenda que o item que voc� recebe � escolhido ALEATORIAMENTE. � uma quest�o de sorte. O que voc� acha? Voc� quer fazer a troca?" ); 

 		if ( nRet == 0 ) self.say( "Tudo bem... sempre que quiser. Veja bem, se voc� tiver este item, ele ir� apenas ocupar espa�o no seu invent�rio. Ent�o, sugiro que voc� troque por um pr�mio." ); 
 		else { 
 			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) and inventory.slotCount( 2 ) > inventory.holdCount( 2 ) ) { 
 				rnum = random( 0, 6 ); 
 				nNewItemID = 0; 
 				nNewItemNum = 0; 
 				if ( rnum == 0 ) { 
 					nNewItemID = 2000004; 
 					nNewItemNum = 100; 
 				} 
 				else if ( rnum == 1 ) { 
 					nNewItemID = 4011006; 
 					nNewItemNum = 10; 
 				} 
 				else if ( rnum == 2 ) { 
 					nNewItemID = 4011000; 
 					nNewItemNum = 10; 
 				} 
 				else if ( rnum == 3 ) { 
 					nNewItemID = 4011005; 
 					nNewItemNum = 10; 
 				} 
 				else if ( rnum == 4 ) { 
 					nNewItemID = 4021005; 
 					nNewItemNum = 10; 
 				} 
 				else if ( rnum == 5 ) { 
 					nNewItemID = 4021001; 
 					nNewItemNum = 10; 
 				} 
 				else if ( rnum == 6 ) { 
 					nNewItemID = 4021007; 
 					nNewItemNum = 10; 
 				} 

 				ret = inventory.exchange( 0, 4031048, -1, nNewItemID, nNewItemNum ); 
 				if ( ret == 0 ) self.say( "Por favor, certifique-se de ter #t4031048# ou se seus invent�rios em uso e de etc. t�m espa�o suficiente." ); 
 				else self.say( "Voc� obteve #b" + nNewItemNum + "# #t" + nNewItemID + "#k? O que voc� acha? Gostou do que tem a�? Hahaha... at� mais~" ); 
 			} 
 			else self.say( "Ei, Ei! Voc� precisa ter pelo menos um slot dispon�vel no seu invent�rio em uso e etc. para receber minha recompensa. Venha falar comigo depois de fazer os ajustes." ); 
 		} 
 	} 
 } 
 /* 
 // The function that gives the questions and in the end, award the user with prizes I 
 function mapleQuiz( integer index ) { 
 	inventory = target.inventory; 
 	qr = target.questRecord; 

 	if ( index == 1 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Qual � o nome da companhia que desenvolveu o MapleStory?\r\n#L0##e1. #n#bWizzette#k#l\r\n#L1##e2. #n#bNexon#k#l\r\n#L2##e3. #n#bWizet#k#l\r\n#L3##e4. #n#bWiznet#k#l\r\n" ); 
 		if ( v1 == 2 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 2 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Qual destas profiss�es n�o est� dispon�vel no MapleStory??\r\n#L0##e1. #n#bGuerreiro#k#l\r\n#L1##e2. #n#bBaBardo#k#l\r\n#L2##e3. #n#bBruxo#k#l\r\n#L3##e4. #n#bArqueiro#k#l\r\n" ); 
 		if ( v1 == 1 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 3 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Qual das op��es a seguir N�O se aplica ao MapleStory?r\n#L0##e1. #n#bMapleStory � um RPG 2-D on-line.#k#l\r\n#L1##e2. #n#bMapleStory possui v�rios minijogos.#k#l\r\n#L2##e3. #n#bO monstro mais fraco no MapleStory � a lesma.#k#l\r\n#L3##e4. #n#bMapleStory � uma aventura 3D.#k#l\r\n" ); 
 		if ( v1 == 3 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 4 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Depois de criar seu personagem, em qual dessas cidades voc� come�a o jogo?\r\n#L0##e1. #n#bCidade dos Cogumelos#k#l\r\n#L1##e2. #n#bPorto Sul#k#l\r\n#L2##e3. #n#bOrbis#k#l\r\n#L3##e4. #n#bPerion#k#l\r\n" ); 
 		if ( v1 == 0 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 5 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Em qual dessas cidades voc� pode se tornar #Gum bruxo:uma bruxa#?\r\n#L0##e1. #n#bPerion#k#l\r\n#L1##e2. #n#bEllinia#k#l\r\n#L2##e3. #n#bSelva do Sono#k#l\r\n#L3##e4. #n#bEl Nath#k#l\r\n" ); 
 		if ( v1 == 1 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 6 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Em qual dessas cidades voc� pode se tornar #Gum arqueiro:uma arqueira#?\r\n#L0##e1. #n#bOrbis#k#l\r\n#L1##e2. #n#bAmherst#k#l\r\n#L2##e3. #n#bHenesys#k#l\r\n#L3##e4. #n#bCidade de Kerning#k#l\r\n" ); 
 		if ( v1 == 2 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 7 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Em qual dessas cidades voc� pode se tornar #Gum Guerreiro:uma Guerreira#?\r\n#L0##e1. #n#bAmherst#k#l\r\n#L1##e2. #n#bSelva do Sono#k#l\r\n#L2##e3. #n#bPorto Sul#k#l\r\n#L3##e4. #n#bPerion#k#l\r\n" ); 
 		if ( v1 == 3 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 8 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Em qual dessas cidades voc� pode se tornar #Gum gatuno:uma gatuna#?\r\n#L0##e1. #n#bCidade de Kerning#k#l\r\n#L1##e2. #n#bPerion#k#l\r\n#L2##e3. #n#bEl Nath#k#l\r\n#L3##e4. #n#bSelva do Sono#k#l\r\n" ); 
 		if ( v1 == 0 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 9 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Qual � o n�vel mais baixo necess�rio para alcan�ar o 2� avan�o na carreira?\r\n#L0##e1. #n#b20#k#l\r\n#L1##e2. #n#b30#k#l\r\n#L2##e3. #n#b40#k#l\r\n#L3##e4. #n#b50#k#l\r\n" ); 
 		if ( v1 == 1 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 10 ) { 
 		v1 = self.askMenu( "L� vai a pergunta. Qual desses pares est� correto??\r\n#L0##e1. #n#bLesma: Pele de Lesma#k#l\r\n#L1##e2. #n#bPorco: Cauda de Porco#k#l\r\n#L2##e3. #n#bCogumelo Espinhoso: Olho do cogumelo espinhoso#k#l\r\n#L3##e4. #n#bCogumelo Zumbi: O amuleto dos mortos#k#l\r\n" ); 
 		if ( v1 == 3 ) answer = 1; 
 		else answer = 0; 
 	} 

 	if ( answer == 0 ) { 
 		qr.set( 9010, "fail" ); 
 		self.say( "Ah, que pena! Resposta errada... Eu escolhi as perguntas mais f�ceis poss�veis... certo, n�o fique mal por isto. Continue tentando!" ); 
 	} 
 	else { 
 		self.say( "Correto! Parab�ns!!! As perguntas n�o estavam muito f�ceis? Como prometi, aqui est� o bolo comemorativo do anivers�rio de 1 ano do MapleStory. Mas, antes disto, verifique se seu invent�rio est� cheio." ); 
 		inventory = target.inventory; 
 		if ( inventory.slotCount( 2 ) > inventory.holdCount( 2 ) ) { 
 			cnum = random( 1, 5 ); 
 			nNewItemID = 0; 
 			if ( cnum == 1 ) nNewItemID = 2020016; 
 			else if ( cnum == 2 ) nNewItemID = 2020017; 
 			else if ( cnum == 3 ) nNewItemID = 2020018; 
 			else if ( cnum == 4 ) nNewItemID = 2020019; 
 			else if ( cnum == 5 ) nNewItemID = 2020020; 

 			ret = inventory.exchange( 0, nNewItemID, 5 ); 
 			if ( ret == 0 ) self.say( "Acho que seu invent�rio est� cheio. Desculpe dizer isto, mas n�o posso entregar a recompensa se seu invent�rio estiver cheio." ); 
 			else { 
 				qr.set( 9010, "end" ); 
 				self.say( "Voc� pegou #b 5 #t" + nNewItemID + "#s#k? Obrigado por participar do nosso evento. Agradecemos por escolher nosso jogo. Obrigado e Tenha Um Mapple Feliz~" ); 
 			} 
 		} 
 		else self.say( "Seu invent�rio parece estar cheio. Desculpe, mas n�o posso entregar a recompensa se seu invent�rio estiver cheio." ); 
  	} 
 } 

 // The function that gives the questions and in the end, award the user with prizes II 

 function mapleQuiz1( integer index ) { 
 	inventory = target.inventory; 
 	qr = target.questRecord; 

 	if ( index == 1 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 2 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 2 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 1 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 3 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 3 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 4 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 0 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 5 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#L0# A��o de Gra�as#k#l\r\n#b#L1# A��o de Gra�as#k#l\r\n#b#L2# A��o de Gra�as#k#l\r\n#b#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 1 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 6 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 2 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 7 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 2 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 8 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 0 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 9 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 1 ) answer = 1; 
 		else answer = 0; 
 	} 
 	else if ( index == 10 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l#k" ); 
 		if ( v1 == 3 ) answer = 1; 
 		else answer = 0; 
 	} 

 	if ( answer == 0 ) { 
 		qr.set( 9010, "fail1" ); 
 		self.say( "Resposta Errada" ); 
 	} 
 	else { 
 		self.say( "Correto" ); 
 		inventory = target.inventory; 
 		if ( inventory.slotCount( 2 ) > inventory.holdCount( 2 ) ) { 
 			cnum = random( 1, 2 ); 
 			nNewItemID = 0; 
 			if ( cnum == 1 ) nNewItemID = 2022004; 
 			else if ( cnum == 2 ) nNewItemID = 2022005; 

 			ret = inventory.exchange( 0, nNewItemID, 10 ); 
 			if ( ret == 0 ) self.say( "Cheio" ); 
 			else { 
 				qr.set( 9010, "end1" ); 
 				self.say( "#b#t" + nNewItemID + "# 10#k Nyaong" ); 
 			} 
 		} 
 		else self.say( "Cheio" ); 
 	} 
 } 

 // Thanks Giving 
 script "_cakePrize" { 
 	qr = target.questRecord; 
 	val = qr.get( 9010 ); 

 	v1 = self.askMenu( "A��o de Gra�as\r\n#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l" ); 
 	if ( v1 == 0 ) { 
 		if ( target.nLevel > 7 ) { 
 			if ( val == "" or val == "fail" or val == "end" or val == "fail1" ) { 
 				if ( val == "fail1" ) self.say( "A��o de Gra�as" ); 
 				else self.say( "A��o de Gra�as" ); 

 				rnum = random( 1, 10 ); 
 				mapleQuiz1( rnum ); 
 			} 
 			else if ( val == "end1" ) self.say( "A��o de Gra�as #b" + target.sCharacterName + "#kA��o de Gra�as" ); 
 		} 
 		else self.say( "A��o de Gra�as" + target.sCharacterName + "A��o de Gra�as" ); 
 	} 
 	else if ( v1 == 1 ) { 
 		inventory = target.inventory; 

 		v2 = self.askMenu( "A��o de Gra�as\r\n#L0# A��o de Gra�as#k#l\r\n#L1# A��o de Gra�as#k#l\r\n#L2# A��o de Gra�as#k#l\r\n#L3# A��o de Gra�as#k#l" ); 
 		if ( v2 == 0 ) { 
 			if ( inventory.itemCount( 3994012 ) >= 1 and inventory.itemCount( 3994000 ) >= 1 and inventory.itemCount( 3994006 ) >= 1 and inventory.itemCount( 3994003 ) >= 1 and inventory.itemCount( 3994001 ) >= 1 and inventory.itemCount( 3994013 ) >= 1 and inventory.itemCount( 3994008 ) >= 1 and inventory.itemCount( 3994005 ) >= 1 and inventory.itemCount( 3994007 ) >= 1 and inventory.itemCount( 3994010 ) >= 1 ) { 
 				if ( inventory.itemCount( 4031019 ) >= 1 ) self.say( "A��o de Gra�as #b#t4031019##kA��o de Gra�as#t4031019#A��o de Gra�as" ); 
 				else { 
 					ret = inventory.exchange( 0, 3994012, -1, 3994000, -1, 3994006, -1, 3994003, -1, 3994001, -1, 3994013, -1, 3994008, -1, 3994005, -1, 3994007, -1, 3994010, -1, 4031019, 1 ); 
 					if ( ret == 0 ) self.say( "A��o de Gra�as" ); 
 					else { 
 						strLog = "[" + target.sCharacterName + "] MAPLE STORY !"; 
 						logEvent( strLog ); 
 						self.say( "A��o de Gra�as" ); 
 					} 
 				} 
 			} 
 			else self.say( "A��o de Gra�as" ); 
 		} 
 		else if ( v2 == 1 ) { 
 			if ( inventory.itemCount( 3994014 ) >= 1 and inventory.itemCount( 3994002 ) >= 1 and inventory.itemCount( 3994011 ) >= 1 and inventory.itemCount( 3994001 ) >= 1 and inventory.itemCount( 3994008 ) >= 1 ) { 
 				if ( inventory.itemCount( 4031019 ) >= 1 ) self.say( "A��o de Gra�as #b#t4031019##A��o de Gra�as#t4031019#A��o de Gra�as" ); 
 				else { 
 					ret = inventory.exchange( 0, 3994014, -1, 3994002, -1, 3994011, -1, 3994001, -1, 3994008, -1, 4031019, 1 ); 
 					if ( ret == 0 ) self.say( "A��o de Gra�as" ); 
 					else { 
 						strLog = "[" + target.sCharacterName + "]A��o de Gra�as de WIZET!"; 
 						logEvent( strLog ); 
 						self.say( "A��o de Gra�as" ); 
 					} 
 				} 
 			} 
 			else self.say( "A��o de Gra�as" ); 
 		} 
 		else if ( v2 == 2 ) { 
 			if ( inventory.itemCount( 3994004 ) >= 2 and inventory.itemCount( 3994001 ) >= 1 and inventory.itemCount( 3994009 ) >= 1 and inventory.itemCount( 3994005 ) >= 1 ) { 
 				if ( inventory.itemCount( 4031019 ) >= 1 ) self.say( "A��o de Gra�as #b#t4031019##kA��o de Gra�as#t4031019#A��o de Gra�as" ); 
 				else { 
 					ret = inventory.exchange( 0, 3994004, -1, 3994001, -1, 3994009, -1, 3994005, -1, 3994004, -1, 4031019, 1 ); 
 					if ( ret == 0 ) self.say( "A��o de Gra�as" ); 
 					else { 
 						strLog = "[" + target.sCharacterName + "]A��o de Gra�as NEXON!"; 
 						logEvent( strLog ); 
 						self.say( "A��o de Gra�as" ); 
 					} 
 				} 
 			} 
 			else self.say( "A��o de Gra�as" ); 
 		} 
 		else if ( v2 == 3 ) { 
 			self.say( "A��o de Gra�as" ); 
 			self.say( "A��o de Gra�as" ); 
 		} 
 	} 
 } 

 // MapleStory 1st Anniversary Quest 
 script "cakePrize" { 
 	qr = target.questRecord; 
 	val = qr.get( 9010 ); 

 	if ( target.nLevel > 7 ) { 
 		if ( val == "" or val == "fail" ) { 
 			if ( val == "" ) self.say( "Oi!! No dia 29 de abril, comemorando o #b anivers�rio de 1 ano do MapleStory#k, oferecemos a todos um bolo de anivers�rio. Estamos dando o bolo para todos que responderem corretamente �s perguntas feitas. Tente voc� tamb�m!" ); 
 			else self.say( "Voc� quer tentar de novo? No dia 29 de abril, comemorando o #b anivers�rio de 1 ano do MapleStory#k, oferecemos a todos um bolo de anivers�rio. Estamos dando o bolo para todos que responderem corretamente �s perguntas feitas. Tente novamente!" ); 

 			rnum = random( 1, 10 ); 
 			mapleQuiz( rnum ); 
 		} 
 		else if ( val == "end" ) self.say( "No dia 29 de abril, comemorando o #b anivers�rio de 1 ano do MapleStory#k, oferecemos a todos um bolo de anivers�rio. Estamos dando o bolo para todos que responderem corretamente �s perguntas feitas." + target.sCharacterName + ", voc� j� respondeu �s perguntas e recebeu o pr�mio! Como estava o bolo??" ); 
 	} 
 	else self.say( "Oi! No dia 29 de abril, comemorando o #b anivers�rio de 1 ano do MapleStory#k, oferecemos a todos um bolo de anivers�rio. Estamos dando o bolo para todos que responderem corretamente �s perguntas feitas." + target.sCharacterName + ", Receio que seu n�vel � muito baixo. Por favor, aumente seu n�vel para 8 e volte mais uma vez~" ); 
 } 

 // ���� �������� �Լ�(New Year's Day Quiz) 
 function mapleQuiz2( integer index ) { 
 	inventory = target.inventory; 
 	qr = target.questRecord; 

 	if ( index == 1 ) { 
 		v1 = self.askMenu( "L� vai a 1� pergunta. A��o de Gra�as de Ossyria?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 		if ( v1 == 1 ) { 
 			v2 = self.askMenu( "L� vai a 2� pergunta. Quais desses conjuntos fazem efeito quando usados juntos?\r\n#b#L0# Uniforme Fantasma Branco+Desgrenhado+Sapatos Transparentes#l\r\n#L1# Traje Coreano+Sapatos Velhos de Borracha Floridos +Jobawi#l\r\n#L2# Roupa de Bruxa+Chap�u de Bruxa#l\r\n#L3# Chap�u de Papai Noel + Sapatos de Papai Noel + Barba de Papai Noel#l#k" ); 
 			if ( v2 == 0 ) { 
 				v3 = self.askMenu( "L� vai a �ltima pergunta. Qual � o nome do monstro principal na terra da lava profunda em El Nath?\r\n#b#L0# Barlog#l\r\n#L1# Rei Gosma#l\r\n#L2# Zakum#l\r\n#L3# Cogum�e#l#k" ); 
 				if ( v3 == 2 ) answer = 1; 
 				else answer = 0; 
 			} 
 			else answer = 0; 
 		} 
 		else answer = 0; 
 	} 
 	else if ( index == 1 ) { 
 		v1 = self.askMenu( "L� vai a 1� pergunta. O que Gordon faz perto da loja de po��es em El Nath?\r\n#b#L0# Luvas#l\r\n#L1# Sapatos#l\r\n#L2# Roupas#l\r\n#L3# Alimentos#l#k" ); 
 		if ( v1 == 1 ) { 
 			v2 = self.askMenu( "L� vai a 2� pergunta. #bQuais itens est�o no Pacote Angelical?\r\n#b#L0# Toga, Aur�ola, Asas de Anjo#l\r\n#L1# Toga, Aur�ola, Sapatos Transparentes, Vara Angelical#l\r\n#L2# Aur�ola, Asas de Anjo#l\r\n#L3# Toga, Aur�ola, Asas de Anjo, Vara Angelical#l#k" ); 
 			if ( v2 == 0 ) { 
 				v3 = self.askMenu( "L� vai a �ltima pergunta. Qual dessas op��es N�O � verdade sobre os bichos no MapleStory?\r\n#b#L0# Bichos pegam mesos que monstros deixam cair#l\r\n#L1# Existem 7 tipos diferentes de bichos � venda atualmente.#l\r\n#L3# Voc� pode aumentar o carisma e o n�vel conversando com o seu bicho de muitas maneiras.#l\r\n#L3#  Quando seu bicho alcan�a certo n�vel, ele aprende a falar.#l#k" ); 
 				if ( v3 == 1 ) answer = 1; 
 				else answer = 0; 
 			} 
 			else answer = 0; 
 		} 
 		else answer = 0; 
 	} 
 	else if ( index == 2 ) { 
 		v1 = self.askMenu( "L� vai a 1� pergunta. Qual dessas op��es n�o � verdade sobre a Loja de Itens?\r\n#b#L0# Voc� pode dar itens de presente a seus amigos.#l\r\n#L1# Existe um bot�o que permite comprar o que voc� est� usando.#l\r\n#L2# As Listas de Desejo podem conter at� 15 itens diferentes.#l\r\n#L3# Pacotes de itens s�o mais baratos.#l#k" ); 
 		if ( v1 == 2 ) { 
 			v2 = self.askMenu( "L� vai a 2� pergunta. Qual � o comando que voc� usa quando deseja descobrir se seus amigos est�o no jogo ou em que local se encontram no momento??\r\n#b#L0# /encontrar nome-personagem#l\r\n#L1# /onde nome-personagem#l\r\n#L2# /quem nome-personagem#l\r\n#L3# /onde nome-personagem#l#k" ); 
 			if ( v2 == 0 ) { 
 				v3 = self.askMenu( "L� vai a �ltima pergunta. Qual � o comando que voc� usa quando deseja obter ajuda??\r\n#b#L0# /!#l\r\n#L1# /?#l\r\n#L2# /h#l\r\n#L3# //#l#k" ); 
 				if ( v3 == 1 ) answer = 1; 
 				else answer = 0; 
 			} 
 			else answer = 0; 
 		} 
 		else answer = 0; 
 	} 
 	else if ( index == 3 ) { 
 		v1 = self.askMenu( "L� vai a 1� pergunta. Qual � a tecla de atalho que mostra a sua lista de amigos??\r\n#b#L0# H#l\r\n#L1# R#l\r\n#L2# A#l\r\n#L3# C#l#k" ); 
 		if ( v1 == 1 ) { 
 			v2 = self.askMenu( "L� vai a 2� pergunta. Qual � a tecla de atalho para o MiniMapa?\r\n#b#L0# H#l\r\n#L1# M#l\r\n#L2# 1#l\r\n#L3# F5#l#k" ); 
 			if ( v2 == 1 ) { 
 				v3 = self.askMenu( "L� vai a �ltima pergunta. Dizem que esta comida faz envelhecer um ano, por isso, as pessoas sempre comem no Dia de Ano-Novo.\r\n#b#L0# Ogokbab#l\r\n#L1# Kimchi#l\r\n#L2# ddukguk#l\r\n#L3# hangwa#l#k" ); 
 				if ( v3 == 2 ) answer = 1; 
 				else answer = 0; 
 			} 
 			else answer = 0; 
 		} 
 		else answer = 0; 
 	} 
 	else if ( index == 4 ) { 
 		v1 = self.askMenu( "L� vai a 1� pergunta. Qual a data do Ano-Novo Chin�s de 2005?\r\n#b#L0# 1 de janeiro#l\r\n#L1# 17 de janeiro#l\r\n#L2# 9 de fevereiro #l\r\n#L3#28 de fevereiro#l#k" ); 
 		if ( v1 == 2 ) { 
 			v2 = self.askMenu( "L� vai a 2� pergunta. Qual desses eventos voc� N�O pode jogar com GGs??\r\n#b#L0# Ola Ola#l\r\n#L1# Bola de Neve#l\r\n#L2# Esta��o do Coco#l\r\n#L3# Floresta da Paci�ncia#l#k" ); 
 			if ( v2 == 3 ) { 
 				v3 = self.askMenu( "L� vai a �ltima pergunta. Onde fica El Nath?\r\n#b#L0# Ilha Victoria#l\r\n#L1# Ossyria#l\r\n#L2# Ilha Maple#l\r\n#L3# Praia Florina#l#k" ); 
 				if ( v3 == 1 ) answer = 1; 
 				else answer = 0; 
 			} 
 			else answer = 0; 
 		} 
 		else answer = 0; 
 	} 
 	else if ( index == 5 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 		if ( v1 == 1 ) { 
 			v2 = self.askMenu( "A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 			if ( v2 == 2 ) { 
 				v3 = self.askMenu( "L� vai a �ltima pergunta. A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 				if ( v3 == 1 ) answer = 1; 
 				else answer = 0; 
 			} 
 			else answer = 0; 
 		} 
 		else answer = 0; 
 	} 
 	else if ( index == 6 ) { 
 		v1 = self.askMenu( "A��o de Gra�as\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 		if ( v1 == 1 ) { 
 			v2 = self.askMenu( "A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 			if ( v2 == 2 ) { 
 				v3 = self.askMenu( "L� vai a �ltima pergunta. A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 				if ( v3 == 1 ) answer = 1; 
 				else answer = 0; 
 			} 
 			else answer = 0; 
 		} 
 		else answer = 0; 
 	} 
 	else if ( index == 7 ) { 
 		v1 = self.askMenu( "A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 		if ( v1 == 1 ) { 
 			v2 = self.askMenu( "A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 			if ( v2 == 2 ) { 
 				v3 = self.askMenu( "L� vai a �ltima pergunta. A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 				if ( v3 == 1 ) answer = 1; 
 				else answer = 0; 
 			} 
 			else answer = 0; 
 		} 
 		else answer = 0; 
 	} 
 	else if ( index == 8 ) { 
 		v1 = self.askMenu( "A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 		if ( v1 == 1 ) { 
 			v2 = self.askMenu( "A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 			if ( v2 == 2 ) { 
 				v3 = self.askMenu( "L� vai a �ltima pergunta. A��o de Gra�as?\r\n#b#L0# A��o de Gra�as#l\r\n#L1# A��o de Gra�as#l\r\n#L2# A��o de Gra�as#l\r\n#L3# A��o de Gra�as#l#k" ); 
 				if ( v3 == 1 ) answer = 1; 
 				else answer = 0; 
 			} 
 			else answer = 0; 
 		} 
 		else answer = 0; 
 	} 

 	if ( answer == 0 ) { 
 		qr.set( 9000200, "fail" ); 
 		self.say( "A��o de Gra�as" ); 
 	} 
 	else { 
 		self.say( "A��o de Gra�as." ); 
 		ret = inventory.exchange( 0, 2022006, 20 ); 
 		if ( ret == 0 ) self.say( "A��o de Gra�as." ); 
 		else { 
 			target.incEXP( 1300, 0 ); 
 			target.incMoney( 10000, 0 ); 
 			qr.set( 9000200, "end" ); 
 			self.say( "A��o de Gra�as." ); 
 		} 
 	} 
 } 

 // ���� �̺�Ʈ(New Year's Day Event) 
 script "cakePrize" { 
 	cTime = currentTime; 

 	esTime = compareTime( cTime, "04/12/31/00/00" ); 
 	eeTime = compareTime( "05/01/02/23/59", cTime ); 

 	if ( esTime < 0 ) self.say( "A��o de Gra�as" ); 
 	else { 
 		if ( eeTime < 0 ) self.say( "A��o de Gra�as!" ); 
 		else { 
 			if ( target.nLevel > 7 ) { 
 				qr = target.questRecord; 
 				val = qr.get( 9000200 ); 
 				if ( val == "" or val == "fail" ) { 
 					self.say( "A��o de Gra�as" ); 

 					rnum = random( 1, 8 ); 
 					mapleQuiz2( rnum ); 
 				} 
 				else if ( val == "end" ) self.say( "A��o de Gra�as?" ); 
 			} 
 			else self.say( "A��o de Gra�as~" ); 
 		} 
 	} 
 } 
 */ 

 // ���긮�� �̺�Ʈ(Ludibrium Event) : 9010004 
 script "ludiEvent" { 
 	cTime = currentTime; 

 	esTime = compareTime( cTime, "04/12/21/00/00" ); 
 	eeTime = compareTime( "05/01/10/23/59", cTime ); 

 	if ( esTime < 0 ) self.say( "A��o de Gra�as~" ); 
 	else { 
 		if ( eeTime < 0 ) self.say( "A��o de Gra�as~!" ); 
 		else { 
 			qr = target.questRecord; 
 			val = qr.get( 9000300 ); 

 			if ( val == "" ) { 
 				qr.set( 9000300, "s" ); 
 				self.say( "A��o de Gra�as" ); 
 				self.say( "A��o de Gra�as." ); 
 			} 
 			else if ( val == "s" ) { 
 				inventory = target.inventory; 
 				if ( inventory.itemCount( 4000106 ) >= 20 and inventory.itemCount( 4000095 ) >= 20 ) { 
 					self.say( "A��o de Gra�as~" ); 
 					ret = inventory.exchange( 0, 4000106, -20, 4000095, -20, 2000010, 150, 2000009, 150 ); 
 					if ( ret == 0 ) self.say( "A��o de Gra�as." ); 
 					else { 
 						qr.set( 9000300, "end" ); 
 						target.incEXP( 2000, 0 ); 
 						strLog = "[" + target.sCharacterName + "] A��o de Gra�as~"; 
 						logEvent( strLog ); 
 						self.say( "A��o de Gra�as~" ); 
 					} 
 				} 
 				else self.say( "A��o de Gra�as." ); 
 			} 
 			else if ( val == "end" ) self.say( "A��o de Gra�as~" ); 
 		} 
 	} 
 } 
