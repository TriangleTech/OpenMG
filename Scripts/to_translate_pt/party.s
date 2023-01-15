 module "standard.s"; 

 function party1_takeawayitem { 
 	inven = target.inventory; 
 	count = inven.itemCount( 4001007 ); 
 	if ( count > 0 ) inven.exchange( 0, 4001007, -count ); 
 	count = inven.itemCount( 4001008 ); 
 	if ( count > 0 ) inven.exchange( 0, 4001008, -count ); 
	
 	return; 
 } 

 // Party Quest - The NPC that lets the users in. 
 script "party1_enter" { 
 	if ( target.isPartyBoss != 1 ) { 
 		self.say( "Que tal voc� e seu grupo terminarem uma miss�o juntos? Aqui voc� vai encontrar obst�culos e problemas que s� poder�o ser resolvidos em equipe. Se quiser tentar, pe�a ao #bl�der do seu grupo#k para falar comigo." ); 
 		end; 
 	} 

 	setParty = FieldSet( "Party1" ); 
 	res = setParty.enter( target.nCharacterID, 0 ); 
         if ( res == -1 ) self.say( "Tenho motivos para n�o deixar seu grupo entrar. Tente mais tarde, por favor." ); 
 	else if ( res == 1 ) self.say( "Voc� n�o est� no grupo. Voc� s� pode fazer esta miss�o quando estiver no grupo." ); 
 	else if ( res == 2 ) self.say( "Seu grupo n�o possui quatro membros. Volte quando tiver quatro membros." ); 
 	else if ( res == 3 ) self.say( "Algu�m no seu grupo n�o est� entre os n�veis 21 ~30. Por favor, verifique novamente." ); 
 	else if ( res == 4 ) self.say( "Um outro grupo j� entrou para completar a miss�o. Por favor, tente mais tarde." ); 
 	else { 
 		party1_takeawayitem; 
 	} 
 } 

 function(integer) check_stage( string st, integer checkall ) { 
 	quest = FieldSet( "Party1" ); 
 	stage = quest.getVar( "stage" ); 
 	if ( stage != st ) { 
 		self.say( "Voc�s todos completaram a miss�o deste est�gio. Use o portal para seguir para o pr�ximo est�gio..." ); 
 		return 0; 
 	} 

 	field = self.field; 
 	if ( checkall == 1 and quest.getUserCount != field.getUserCount ) { 
 		self.say( "Parece que nem todos os membros do grupo est�o juntos. Todos do seu grupo precisam vir do est�gio anterior para participar da miss�o. Por favor, tenha todos os membros prontos aqui..." ); 
 		return 0; 
 	} 
 	return 1; 
 } 

 // The individual quest within a party quest 
 function party1_personal { 
 	charName = target.sCharacterName + "_"; 

 	quest = FieldSet( "Party1" ); 
 	prob = quest.getVar( charName ); 
 	if ( prob == "clear" ) { 
 		self.say( "Uau, voc� respondeu bem ao meu desafio. Aqui est� o passe para o grupo; entregue ao l�der." ); 
 		return; 
 	} 

 	if ( prob == "" ) q = random( 0, 8 ); // Dish out questions. 
 	else q = integer(prob); // Repeat the question. 

 	// Explaining the questions and the answers 
 	desc = ""; 
 	if ( q == 0 ) { desc = "Tarefa. O n�mero de cupons que voc� deve coletar � o mesmo n�mero dos pontos de experi�ncia necess�rios para avan�ar do #rn�vel 1 para o n�vel 2."; ans = 15; } 
 	else if ( q == 1 ) { desc = "Esta � a tarefa. O n�mero de cupons que voc� deve coletar � o mesmo n�mero do n�vel necess�rio para fazer o primeiro avan�o na carreira como feiticeiro."; ans = 8; } 
 	else if ( q == 2 ) { desc = "Esta � a tarefa. O n�mero de cupons que voc� deve coletar � o mesmo n�mero do n�vel m�nimo de FOR necess�ria para fazer o primeiro avan�o na carreira como guerreiro."; ans = 35; } 
 	else if ( q == 3 ) { desc = "Esta � a tarefa. O n�mero de cupons que voc� deve coletar � o mesmo n�mero do n�vel m�nimo de INT necess�ria para fazer o primeiro avan�o na carreira como bruxo."; ans = 20; } 
 	else if ( q == 4 ) { desc = "Esta � a tarefa. O n�mero de cupons que voc� deve coletar � o mesmo n�mero do n�vel m�nimo de DES necess�ria para fazer o primeiro avan�o na carreira como arqueiro."; ans = 25; } 
 	else if ( q == 5 ) { desc = "Esta � a tarefa. O n�mero de cupons que voc� deve coletar � o mesmo n�mero do n�vel m�nimo de DES necess�ria para fazer o primeiro avan�o na carreira como gatuno."; ans = 25; } 
 	else if ( q == 6 ) { desc = "Esta � a tarefa. O n�mero de cupons que voc� deve coletar � o mesmo n�mero do n�vel necess�rio para fazer o primeiro avan�o na carreira como guerreiro."; ans = 10; } 
 	else if ( q == 7 ) { desc = "Esta � a tarefa. O n�mero de cupons que voc� deve coletar � o mesmo n�mero do n�vel necess�rio para fazer o primeiro avan�o na carreira como arqueiro."; ans = 10; } 
 	else if ( q == 8 ) { desc = "Esta � a tarefa. O n�mero de cupons que voc� deve coletar � o mesmo n�mero do n�vel necess�rio para fazer o primeiro avan�o na carreira como gatuno."; ans = 10; } 

 	// If the question is given 
 	if ( prob == "" ) { 
 		quest.setVar( charName, string(q) ); 
 		self.say( "Voc� precisa coletar o mesmo n�mero de #bcupons#k dos Jacar�s que a reposta das minhas charadas individuais." ); 
 		self.say( desc ); 
 		return; 
 	} 

 	// Scoring 
 	inven = target.inventory; 
 	if ( inven.itemCount( 4001007 ) == ans ) { 
 		if ( inven.exchange( 0, 4001007, -ans, 4001008, 1 ) == 0 ) { 
 			self.say( "Voc� precisa coletar o n�mero de cupons sugerido pela resposta.  Nem mais nem menos. Verifique se voc� tem mesmo os cupons." ); 
 			return; 
 		} 
 		quest.setVar( charName, "clear" ); 
 		self.say( "Resposta correta! Voc� acaba de ganhar um #bpasse#k. Por favor, entregue-o para o l�der do seu grupo." ); 
 	} 
 	else { 
 		self.say( "Resposta incorreta. S� posso entregar o passe se voc� coletar o n�mero de #bcupons#k sugerido pela resposta � pergunta. Vou repetir a pergunta." ); 
 		self.say( desc ); 
 	} 
 } 

 function party1_help { 
 	field = self.field; 
 	if ( field.id == 103000801 ) self.say( "Vou descrever o 2� est�gio. Voc� ver� algumas cordas ao meu lado. #b3 delas est�o conectadas ao portal para o pr�ximo est�gio#k. Tudo o que voc� precisa � que #b3 membros do grupo encontrem as cordas corretas e se segurem nelas#k.\r\nMAS isto n�o contar� se voc� se pendurar muito embaixo. Por favor, suba o suficiente para a resposta ser considerada correta. E apenas 3 membros do seu grupo ser�o permitidos nas cordas. Quando isto acontecer, o l�der do grupo dever� #bclicar duas vezes em mim para saber se a resposta est� correta ou n�o#k. Boa sorte para voc�s!" ); 
 	else if ( field.id == 103000802 ) self.say( "Vou descrever o 3� est�gio. Voc� ver� um monte de barris com gatinhos dentro no alto das plataformas. #b 3 dessas plataformas estar�o conectadas ao portal que leva ao pr�ximo est�gio#k. #b3 membros do grupo precisam encontrar as plataformas corretas para subir e completar o est�gio.\r\nMAS � preciso ficar firme no centro, e n�o na beira, para que a resposta seja considerada correta. E apenas 3 membros do seu grupo ser�o permitidos nas plataformas. Quando os membros estiverem nas plataformas, o l�der do grupo dever� #bclicar duas vezes em mim para saber se a resposta est� correta ou n�o#k. Boa sorte para voc�s~!" ); 
 	else if ( field.id == 103000803 ) self.say( "Vou descrever o 4� est�gio. Voc� ver� um monte de barris por perto. #b 3 desses barris estar�o conectados ao portal que leva ao pr�ximo est�gio#k. #b3 membros do grupo precisam encontrar os barris corretos e ficar em cima deles#k para completar o est�gio. MAS, para a resposta contar, � preciso ficar bem firme no centro do barril, n�o na beira. E apenas 3 membros do seu grupo podem ficar em cima dos barris. Quando os membros estiverem em cima, o l�der do grupo dever� #bclicar duas vezes em mim para saber se a resposta est� correta ou n�o#k. Boa sorte para voc�s!" ); 
 } 

 function party1_stage1 { 
 	quest = FieldSet( "Party1" ); 
 	stage = quest.getVar( "stage" ); 
 	if ( stage == "" ) { 
 		quest.setVar( "stage", "1" ); 
 		self.say( "Ol�. Bem-vindo ao primeiro est�gio.  Olhe ao redor e voc� ver� Jacar�s andando por a�. Depois de derrotados, eles v�o tossir um #bcupom#k. Fora o l�der, cada membro do grupo deve falar comigo, ouvir a pergunta e juntar o mesmo n�mero de #bcupons#k da resposta.\r\nEu darei o #bpasse#k ao jogador que coletar o n�mero correto de #bcupons#k. Assim que todos os membros obtiverem os #bpasses#k e entregarem ao l�der, este entregar� os #bpasses#k para mim, completando o est�gio. Quanto mais r�pidos os est�gios forem completados, mais est�gios haver� para desafiar. Por isto, sugiro que d�em conta r�pido de tudo. Bem, boa sorte para voc�s." ); 
 		return; 
 	} 
 	if ( stage != "1" ) { 
 		self.say( "Voc� completou este est�gio. Siga para o pr�ximo est�gio usando o portal. Cuidado..." ); 
 		return; 
 	} 

 	// checking the number of passes 
 	users = quest.getUserCount - 1; // exclude the leader of the party 

 	inven = target.inventory; 
 	if ( inven.itemCount( 4001008 ) < users ) self.say( "Desculpe, mas voc� n�o tem o n�mero suficiente de passes. Voc� precisa me entregar o n�mero correto de passes; deve ser o mesmo n�mero de membros do seu grupo menos o l�der, #b" + users + "passes#k para completar o est�gio. Diga aos membros do seu grupo para responder �s perguntas, juntar os passes e entregar para voc�." ); 
 	else { 
 		self.say( "Voc� juntou #b" + users + "passe#k! Parab�ns por completar o est�gio! Eu vou criar o portal que envia voc� para o pr�ximo est�gio. H� um limite de tempo para chegar l�, apresse-se. Boa sorte para todos voc�s!" ); 
 		if ( inven.exchange( 0, 4001008, -users ) == 0 ) { 
 			self.say( "Voc� precisa me entregar o n�mero correto de passes; deve ser o mesmo n�mero de membros do seu grupo menos o l�der. Nem mais nem menos. Por favor, verifique se voc� tem a quantidade correta." ); 
 			return; 
 		} 
 		field = self.field; 
 		field.effectScreen( "quest/party/clear" ); 
 		field.effectSound( "Grupo1/Completado" ); 
 		field.effectObject( "gate" ); 
 		field.enablePortal( "next00", 1 ); 
 		quest.setVar( "stage", "2" ); 
 		quest.incExpAll( 100 ); 
 	} 
 } 

 function(string) area_check( integer num, integer user ) { 
 	field = self.field; 
 	count = 0; 
 	answer = ""; 
 	for ( i = 1..num ) { 
 		cur = field.countUserInArea( string( i-1 ) ); 
 		count = count + cur; 
 		answer = answer + string( cur ); 
 	} 
 	if ( count == user ) return answer; 
 	return ""; 
 } 

 function party1_stage2 { 
 	if ( check_stage( "2", 1 ) == 0 ) return; 

 	quest = FieldSet( "Party1" ); 
 	question = quest.getVar( "ans2" ); 
 	if ( question == "" ) { 
 		quest.setVar( "ans2", shuffle( 1, "1110" ) ); 
 		self.say( "Oi. Bem-vindo ao 2� est�gio. Voc� ver� algumas cordas perto de mim. #b3 dessas cordas estar�o conectadas ao portal que leva ao pr�ximo est�gio#k. Tudo o que voc� precisa � que #b3 membros do grupo encontrem as cordas e se segurem nelas#k.\r\nMAS isto n�o conta como resposta correta se voc� se pendurar muito embaixo. Por favor, suba o suficiente para a resposta ser considerada correta. E apenas 3 membros do seu grupo ser�o permitidos nas cordas. Quando isto acontecer, o l�der do grupo dever� #bclicar duas vezes em mim para saber se a resposta est� correta ou n�o#k. Agora, encontre as cordas certas para se pendurar!" ); 
 		return; 
 	} 

 	field = self.field; 
 	answer = area_check( 4, 3 ); 

 	if ( answer == "" ) self.say( "Parece que voc� ainda n�o encontrou as 3 cordas. Pense numa combina��o diferente das cordas. Apenas 3 membros podem se pendurar nas cordas. E n�o se pendurem muito embaixo ou a resposta n�o ir� contar. Continue!" ); 
 	else if ( question != answer ) { 
 		field.effectScreen( "quest/party/wrong_kor" ); 
 		field.effectSound( "Grupo1/Falhou" ); 
 	} 
 	else { 
 		field.effectScreen( "quest/party/clear" ); 
 		field.effectSound( "Grupo1/Completado" ); 
 		field.effectObject( "gate" ); 
 		field.enablePortal( "next00", 1 ); 
 		quest.setVar( "stage", "3" ); 
 		quest.incExpAll( 200 ); 
 	} 
 } 

 function party1_stage3 { 
 	if ( check_stage( "3", 1 ) == 0 ) return; 

 	quest = FieldSet( "Party1" ); 
 	question = quest.getVar( "ans3" ); 
 	if ( question == "" ) { 
 		quest.setVar( "ans3", shuffle( 1, "11100" ) ); 
 		self.say( "Ol�. Bem-vindo ao 3� est�gio. Em cima das plataformas, voc�s ver�o alguns barris por perto com gatinhos dentro. Destas plataformas, #b3 levar�o ao portal para o pr�ximo est�gio#k. #b3 membros do grupo precisam encontrar as plataformas corretas para subir e completar o est�gio.\r\nMAS � preciso ficar firme no centro, e n�o na beira, para que a resposta seja considerada correta. E apenas 3 membros do seu grupo ser�o permitidos nas plataformas. Quando os membros estiverem nas plataformas, o l�der do grupo dever� #bclicar duas vezes em mim para saber se a resposta est� correta ou n�o#k. Agora, encontre as plataformas corretas~!" ); 
 		return; 
 	} 

 	field = self.field; 
 	answer = area_check( 5, 3 ); 

 	if ( answer == "" ) self.say( "Parece que voc� ainda n�o encontrou as 3 plataformas. Pense numa combina��o diferente das plataformas. E lembre-se de que apenas 3 membros podem ficar nas plataformas, firmes no centro, para que a resposta seja v�lida. Continue!" ); 
 	else if ( question != answer ) { 
 		field.effectScreen( "quest/party/wrong_kor" ); 
 		field.effectSound( "Grupo1/Falhou" ); 
 	} 
 	else { 
 		field.effectScreen( "quest/party/clear" ); 
 		field.effectSound( "Grupo1/Completado" ); 
 		field.effectObject( "gate" ); 
 		field.enablePortal( "next00", 1 ); 
 		quest.setVar( "stage", "4" ); 
 		quest.incExpAll( 400 ); 
 	} 
 } 

 function party1_stage4 { 
 	if ( check_stage( "4", 1 ) == 0 ) return; 

 	quest = FieldSet( "Party1" ); 
 	question = quest.getVar( "ans4" ); 
 	if ( question == "" ) { 
 		quest.setVar( "ans4", shuffle( 1, "111000" ) ); 
 		self.say( "Oi. Bem-vindo ao 4� est�gio. Voc� ver� alguns barris por perto. 3 desses barris estar�o conectados ao portal que leva ao pr�ximo est�gio. #b3 membros do grupo precisam encontrar os barris corretos e ficar em cima deles#k para completar o est�gio. MAS, para a resposta contar, � preciso ficar bem firme no centro do barril, n�o na beira. E apenas 3 membros do seu grupo podem ficar em cima dos barris. Quando os membros estiverem em cima, o l�der do grupo dever� #bclicar duas vezes em mim para saber se a resposta est� correta ou n�o#k. Agora, encontre os barris corretos~!" ); 
 		return; 
 	} 

 	field = self.field; 
 	answer = area_check( 6, 3 ); 

 	if ( answer == "" ) self.say( "Parece que voc� ainda n�o encontrou os 3 barris. Pense numa combina��o diferente dos barris. E n�o esque�a que apenas 3 membros podem ficar em cima dos barris, firmes no centro para que a resposta conte como correta. Continue!" ); 
 	else if ( question != answer ) { 
 		field.effectScreen( "quest/party/wrong_kor" ); 
 		field.effectSound( "Grupo1/Falhou" ); 
 	} 
 	else { 
 		field.effectScreen( "quest/party/clear" ); 
 		field.effectSound( "Grupo1/Completado" ); 
 		field.effectObject("gate" ); 
 		field.enablePortal( "next00", 1 ); 
 		quest.setVar( "stage", "5" ); 
 		quest.incExpAll( 800 ); 
 	} 
 } 

 function party1_stage5 { 
 	if ( check_stage( "5", 1 ) == 0 ) return; 

 	quest = FieldSet( "Party1" ); 

 	inven = target.inventory; 
 	if ( inven.itemCount( 4001008 ) < 10 ) self.say( "Ol�. Bem-vindo ao 5� est�gio final. Ande pelo mapa e voc� poder� ver alguns Monstros Chefes. Derrote todos e junte 10 #bpasses#k para mim. Obtido o seu passe, o l�der do seu grupo vai junt�-los e me entregar quanto tiver todos os 10. Os monstros podem parecer familiares, mas eles s�o muito mais fortes do que voc� pensa. Por isso, tenha cuidado. Boa sorte!" ); 
 	else { 
 		if ( inven.exchange( 0, 4001008, -10 ) == 0 ) { 
 			self.say( "Voc� acabou com todos os Monstros Chefes e juntou todos os #b10 passes#k. Bom trabalho." ); 
 			return; 
 		} 
 		field = self.field; 
 		field.effectScreen( "quest/party/clear" ); 
 		field.effectSound( "Grupo1/Completado" ); 
 		field.effectObject( "gate" ); 
 		quest.setVar( "stage", "clear" ); 
 		quest.incExpAll( 1500 ); 
 		self.say( "Aqui est� o portal que leva ao �ltimo est�gio de b�nus. � um est�gio que permite derrotar monstros comuns um pouco mais facilmente. Voc� ter� um tempo limite para derrotar o m�ximo poss�vel deles, mas poder� sair do est�gio quando quiser falando com o NPC. Mais uma vez, parab�ns por completar todos os est�gios. Cuidado..." ); 
 		return; 
 	} 
 } 

 // reward 
 function party1_reward { 
 	self.say( "Incr�vel! Voc� completou todos os est�gios para chegar at� aqui. Aqui est� uma pequena recompensa pelo trabalho bem-feito. Mas, antes de aceitar, verifique se voc� possui slots dispon�veis nos invent�rios de uso e etc." ); 

 	inven = target.inventory; 
 	if ( inven.slotCount( 2 ) > inven.holdCount( 2 ) and inven.slotCount( 4 ) > inven.holdCount( 4 ) ) { 
 		rnum = random( 0, 39 ); 
                 nNewItemID = 0; 
                 nNewItemNum = 0; 
 		if ( rnum == 0 ) { 
 			nNewItemID = 2000004; 
 			nNewItemNum = 5; 
 		} 
 		else if ( rnum == 1 ) { 
 			nNewItemID = 2000001; 
 			nNewItemNum = 100; 
 		} 
 		else if ( rnum == 2 ) { 
 			nNewItemID = 2000002; 
 			nNewItemNum = 70; 
 		} 
 		else if ( rnum == 3 ) { 
 			nNewItemID = 2000003; 
 			nNewItemNum = 100; 
 		} 
 		else if ( rnum == 4 ) { 
 			nNewItemID = 2000006; 
 			nNewItemNum = 50; 
 		} 
 		else if ( rnum == 5 ) { 
 			nNewItemID = 2022000; 
 			nNewItemNum = 15; 
 		} 
 		else if ( rnum == 6 ) { 
 			nNewItemID = 2022003; 
 			nNewItemNum = 15; 
 		} 
 		else if ( rnum == 7 ) { 
 			nNewItemID = 2040002; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 8 ) { 
 			nNewItemID = 2040402; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 9 ) { 
 			nNewItemID = 2040502; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 10 ) { 
 			nNewItemID = 2040505; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 11 ) { 
 			nNewItemID = 2040602; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 12 ) { 
 			nNewItemID = 2040802; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 13 ) { 
 			nNewItemID = 4003000; 
 			nNewItemNum = 30; 
 		} 
 		else if ( rnum == 14 ) { 
 			nNewItemID = 4010000; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 15 ) { 
 			nNewItemID = 4010001; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 16 ) { 
 			nNewItemID = 4010002; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 17 ) { 
 			nNewItemID = 4010003; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 18 ) { 
 			nNewItemID = 4010004; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 19 ) { 
 			nNewItemID = 4010005; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 20 ) { 
 			nNewItemID = 4010006; 
 			nNewItemNum = 5; 
 		} 
 		else if ( rnum == 21 ) { 
 			nNewItemID = 4020000; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 22 ) { 
 			nNewItemID = 4020001; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 23 ) { 
 			nNewItemID = 4020002; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 24 ) { 
 			nNewItemID = 4020003; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 25 ) { 
 			nNewItemID = 4020004; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 26 ) { 
 			nNewItemID = 4020005; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 27 ) { 
 			nNewItemID = 4020006; 
 			nNewItemNum = 8; 
 		} 
 		else if ( rnum == 28 ) { 
 			nNewItemID = 4020007; 
 			nNewItemNum = 3; 
 		} 
 		else if ( rnum == 29 ) { 
 			nNewItemID = 4020008; 
 			nNewItemNum = 3; 
 		} 
 		else if ( rnum == 30 ) { 
 			nNewItemID = 1032002; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 31 ) { 
 			nNewItemID = 1032004; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 32 ) { 
 			nNewItemID = 1032005; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 33 ) { 
 			nNewItemID = 1032006; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 34 ) { 
 			nNewItemID = 1032007; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 35 ) { 
 			nNewItemID = 1032009; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 36 ) { 
 			nNewItemID = 1032010; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 37 ) { 
 			nNewItemID = 1002026; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 38 ) { 
 			nNewItemID = 1002089; 
 			nNewItemNum = 1; 
 		} 
 		else if ( rnum == 39 ) { 
 			nNewItemID = 1002090; 
 			nNewItemNum = 1; 
 		} 
 		ret = inven.exchange( 0, nNewItemID, nNewItemNum ); 
 		if ( ret == 0 ) self.say( "Hmmm... voc� tem certeza de que seu invent�rio de uso e etc. t�m espa�o? N�o posso recompensar voc� pelo esfor�o se seus invent�rios estiverem cheios." ); 
 		else registerTransferField( 103000805, "" ); 
 	} 
 	else self.say( "Seu invent�rio de uso e etc. precisam ter pelo menos um slot vazio para receber as recompensas. Por favor, fa�a os ajustes necess�rios e fale comigo." ); 
 } 

 // party quest - the host NPC 
 script "party1_play" { 
 	field = self.field; 
 	quest = FieldSet( "Party1" ); 

 	// the reward 
 	if ( quest.getVar( "stage" ) == "clear" ) { 
 		party1_reward; 
 		end; 
 	} 

 	if ( target.isPartyBoss != 1 ) { 
 		if ( field.id == 103000800 ) party1_personal; 
 		else party1_help; 
 	} 
 	else { 
 		if ( field.id == 103000800 ) party1_stage1; 
 		else if ( field.id == 103000801 ) party1_stage2; 
 		else if ( field.id == 103000802 ) party1_stage3; 
 		else if ( field.id == 103000803 ) party1_stage4; 
 		else if ( field.id == 103000804 ) party1_stage5; 
 	} 
 } 

 // party quest - the NPC that leads the users out 
 script "party1_out" { 
 	field = self.field; 
 	if ( field.id == 103000805 ) { 
 		nRet = self.askYesNo( "Voc� ca�ou muito no mapa de b�nus? Assim que sair deste lugar, voc� n�o poder� voltar e ca�ar de novo. Tem certeza de que deseja sair?" ); 
 		if ( nRet == 0 ) self.say( "Entendo. Este mapa foi feito para voc� ca�ar o m�ximo poss�vel antes que o tempo acabe. Voc� precisa falar comigo se quiser sair deste est�gio." ); 
 		else registerTransferField( 103000890, "" ); 
 	} 
 	else if ( field.id == 103000890 ) { 
 		inven = target.inventory; 
 		count = inven.itemCount( 4001007 ); 
 		if ( count > 0 ) { 
 			if ( inven.exchange( 0, 4001007, -count ) == 0 ) { 
 				self.say( "Tem certeza de que possui a quantidade exata de cupons? Por favor, verifique mais uma vez." ); 
 				end; 
 			} 
 		} 
 		count = inven.itemCount( 4001008 ); 
 		if ( count > 0 ) { 
 			if ( inven.exchange( 0, 4001008, -count ) == 0 ) { 
 				self.say( "Tem certeza de que possui a quantidade exata de passes? Por favor, verifique novamente." ); 
 				end; 
 			} 
 		} 
 		registerTransferField( 103000000, "" ); 
 	} 
 	else { 
 		// Send the user to the "mapa final" from every stage 
 		nRet = self.askYesNo( "Se sair do mapa, voc� vai precisar refazer toda a miss�o se quiser tentar novamente. Ainda quer sair deste mapa?"); 
 		if ( nRet == 0 ) self.say( "Entendo. O trabalho de equipe � muito importante aqui. Por favor, esforce-se mais com os membros do seu grupo." ); 
 		else registerTransferField( 103000890, "" ); 
 	} 
 } 
