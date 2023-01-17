module "standard.s";

// Mr. Goldstein : 1002003
script "friend00" {
	nRet1 = self.askYesNo( "Espero que consiga fazer tanto quanto ontem... Bem, ol�! N�o quer aumentar sua lista de amigos? Voc� parece uma pessoa que tem um monte de amigos... Bem, o que acha? Com um pouco de dinheiro, eu posso fazer isso acontecer. Lembre-se, no entanto, que isso s� se aplica a um personagem por vez, ent�o, n�o afetar� nenhum outro personagem de sua conta. Voc� aceita?" );
	if ( nRet1 == 0 ) self.say( "Entendo... Voc� n�o tem tantos amigos quanto eu imaginava. Hahaha, t� brincando! De qualquer modo, se mudar de id�ia, sinta-se � vontade para retornar e faremos neg�cio. Se fizer um monte de amigos, a� saber�... hehe..."  );
	else {
		nRet2 = self.askYesNo( "Est� bem, boa lembran�a! Realmente n�o � t�o caro. #b250.000 mesos e adicionarei mais 5 slots � sua lista de amigos#k. E n�o, n�o os venderei individualmente. Uma vez que voc� o compra, ele ficar� permanentemente em sua lista de amigos. Se voc� � um dos que precisam de mais espa�o, ent�o, deveria fazer isso. O que voc� acha? Voc� gastar� 250.000 mesos para isso?" );
		if ( nRet2 == 0 ) self.say( "Entendo... Eu n�o acho que voc� n�o tenha tantos amigos quanto eu imaginava. Se n�o, voc� apenas n�o tem 250.000 mesos com voc� neste momento? De qualquer modo, se mudar de id�ia, volte e faremos neg�cio. Isso, claro, se tiver algum al�vio financeiro... hehe..." );
		else {
			fRet = target.incFriendMax( 5, -250000 );
			if ( fRet == 0 ) self.say( "Ei... Tem certeza de que tem #b250.000 mesos#k?? Se tiver, confirme se estendeu sua lista de amigos ao m�ximo. Mesmo pagando, o m�ximo que pode ter em sua lista de amigos � #b50#k.");
			else self.say( "Certo! Sua lista de amigos ter� 5 slots extras agora. Confira voc� mesmo. E, se precisar de mais espa�o em sua lista de amigos, sabe quem procurar. Claro, n�o ser� de gra�a... Bem, at� logo..." );
		}
	}
}

script "_friend00" {
	if ( serverType == 2 ) {
		v1 = self.askMenu( "Espero que consiga fazer tanto quanto ontem... Estou ajudando pessoas cujo n�vel de personagens est� inicializado. Bem... O que gostaria de fazer?\r\n#b#L0#Gostaria de estender minha lista de amigos.#l\r\n#b#L1#Me suba um n�vel.#l");
		if ( v1 == 0 ) {
			nRet1 = self.askYesNo(  "Bem, ol�! N�o quer aumentar sua lista de amigos? Voc� parece uma pessoa que tem um monte de amigos... Bem, o que acha? Com um pouco de dinheiro, eu posso fazer isso acontecer. Lembre-se, no entanto, que isso s� se aplica a um personagem por vez, ent�o, n�o afetar� nenhum outro personagem de sua conta. Voc� quer fazer isso?" );
			if ( nRet1 == 0 ) self.say( "Entendo... Voc� n�o tem tantos amigos quanto eu imaginava. Hahaha, t� brincando! De qualquer modo, se mudar de id�ia, sinta-se � vontade para retornar e faremos neg�cio. Se fizer um monte de amigos, a� saber�... hehe..." );
			else {
				nRet2 = self.askYesNo( "Est� bem, boa lembran�a! Realmente n�o � t�o caro. #b250.000 mesos e adicionarei mais 5 slots � sua lista de amigos#k. E n�o, n�o os venderei individualmente. Uma vez que voc� o compra, ele ficar� permanentemente em sua lista de amigos. Se voc� � um dos que precisam de mais espa�o a�, ent�o deveria fazer isso. O que voc� acha? Voc� gastar� 250.000 mesos para isso?" );
				if ( nRet2 == 0 ) self.say( "Entendo... Eu n�o acho que voc� n�o tenha tantos amigos quanto eu imaginava. Se n�o, voc� apenas n�o tem 250.000 mesos com voc� neste momento? De qualquer modo, se mudar de id�ia, volte e faremos neg�cio. Isso, claro, se tiver algum al�vio financeiro... hehe..." );
				else {
					fRet = target.incFriendMax( 5, -250000 );
					if ( fRet == 0 ) self.say("Ei... Tem certeza de que tem #b250.000 mesos#k?? Se tiver, confirme se estendeu sua lista de amigos ao m�ximo. Mesmo pagando, o m�ximo que pode ter em sua lista de amigos � #b50#k." );
					else self.say( "Certo! Sua lista de amigos ter� 5 slots extras agora. Confira voc� mesmo. E, se precisar de mais espa�o em sua lista de amigos, sabe quem procurar. Claro, n�o ser� de gra�a... Bem, at� logo..." );
				}
			}
		}
		else if ( v1 == 1 ) {
			if ( target.nLevel >= 114 ) self.say( "Desculpe, mas n�o posso ajud�-lo. Seu n�vel j� est� #bacima do n�vel 114#k.Ap�s o n�vel 114, � por sua conta, colega. Boa sorte!" );
			else {
				self.say( "Certo! Eu te darei EXP para subir de n�vel. Mas lembre-se: Uma vez alcan�ado #bn�vel 114#k, n�o posso mais ajud�-lo. Ent�o, est� preparado para se surpreender?" );
				target.incEXP( 9999999999, 0 );
			}
		}
	}
	else {
		nRet1 = self.askYesNo( "Espero que consiga fazer tanto quanto ontem... Bem, ol�! N�o quer aumentar sua lista de amigos? Voc� parece uma pessoa que tem um monte de amigos... Bem, o que acha? Com um pouco de dinheiro, eu posso fazer isso acontecer. Lembre-se, no entanto, que isso s� se aplica a um personagem por vez, ent�o, n�o afetar� nenhum outro personagem de sua conta. Voc� aceita?" );
		if ( nRet1 == 0 ) self.say(  "Entendo... Voc� n�o tem tantos amigos quanto eu imaginava. Hahaha, t� brincando! De qualquer modo, se mudar de id�ia, sinta-se � vontade para retornar e faremos neg�cio. Se fizer um monte de amigos, a� saber�... hehe..." );
		else {
			nRet2 = self.askYesNo("Est� bem, boa lembran�a! Realmente n�o � t�o caro. #b250.000 mesos e adicionarei mais 5 slots � sua lista de amigos#k. E n�o, n�o os venderei individualmente. Uma vez que voc� o compra, ele ficar� permanentemente em sua lista de amigos. Se voc� � um dos que precisam de mais espa�o, ent�o deveria fazer isso. O que voc� acha? Voc� gastar� 250.000 mesos para isso?" );
			if ( nRet2 == 0 ) self.say( "Entendo... Eu n�o acho que voc� n�o tenha tantos amigos quanto eu imaginava. Se n�o, voc� apenas n�o tem 250.000 mesos com voc� neste momento? De qualquer modo, se mudar de id�ia, volte e faremos neg�cio. Isso, claro, se tiver algum al�vio financeiro... hehe..."  );
			else {
				fRet = target.incFriendMax( 5, -250000 );
				if ( fRet == 0 ) self.say("Ei... Tem certeza de que tem #b250.000 mesos#k?? Se tiver, confirme se estendeu sua lista de amigos ao m�ximo. Mesmo pagando, o m�ximo que pode ter em sua lista de amigos � #b50#k." );
				else self.say( "Certo! Sua lista de amigos ter� 5 slots extras agora. Confira voc� mesmo. E, se precisar de mais espa�o em sua lista de amigos, sabe quem procurar. Claro, n�o ser� de gra�a... Bem, at� logo..." );
			}
		}
	}
}

// Holly : 2040046
script "friend01" {
	nRet1 = self.askYesNo( "Espero que consiga fazer tanto quanto ontem... Bem, ol�! N�o quer aumentar sua lista de amigos? Voc� parece uma pessoa que tem um monte de amigos... Bem, o que acha? Com algum dinheiro, eu posso fazer isso acontecer. Lembre-se, no entanto, que isso s� se aplica a um personagem por vez, ent�o, n�o afetar� nenhum outro personagem de sua conta. Voc� aceita?" );
		if ( nRet1 == 0 ) self.say(  "Entendo... Voc� n�o tem tantos amigos quanto eu imaginava. Hahaha, t� brincando! De qualquer modo, se mudar de id�ia, sinta-se � vontade para retornar e faremos neg�cio. Se fizer um monte de amigos, a� saber�... hehe..." );
		else {
		nRet2 = self.askYesNo("Est� bem, boa lembran�a! Realmente n�o � t�o caro. Por um desconto especial de Ludibrium, #b240.000 mesos e adicionarei mais 5 slots � sua lista de amigos#k. E n�o, n�o os venderei individualmente. Uma vez que voc� o compra, ele ficar� permanentemente em sua lista de amigos. Se voc� � um dos que precisam de mais espa�o, ent�o deveria fazer isso. O que voc� acha? Voc� gastar� 240.000 mesos para isso?" );
		if ( nRet2 == 0 ) self.say( "Entendo... Eu n�o acho que voc� n�o tenha tantos amigos quanto eu imaginava. Se n�o, voc� apenas n�o tem 240.000 mesos com voc� neste momento? De qualquer modo, se mudar de id�ia, volte e faremos neg�cio. Isso, claro, se tiver algum al�vio financeiro... hehe..."  );
		else {
		    fRet = target.incFriendMax( 5, -240000 );
				if ( fRet == 0 ) self.say("Ei... Tem certeza de que tem #b240.000 mesos#k?? Se tiver, confirme se estendeu sua lista de amigos ao m�ximo. Mesmo pagando, o m�ximo que pode ter em sua lista de amigos � #b50#k." );
				else self.say( "Certo! Sua lista de amigos ter� 5 slots extras agora. Confira voc� mesmo. E, se precisar de mais espa�o em sua lista de amigos, sabe quem procurar. Claro, n�o ser� de gra�a... Bem, at� logo..." );
			}
	}
}
