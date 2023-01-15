module "standard.s";

// warrior job adv. function
function changeJob1( integer jobCode ) {
	nRet = self.askYesNo( "Certo! Agora vou transformar voc� em um guerreiro muito mais poderoso. Mas, antes disso, certifique-se de que seu SP foi bem usado. Voc� precisa usar pelo menos todo o SP recebido at� o n�vel 70 para fazer o 3� avan�o de carreira. Ah, e como voc� j� escolheu sua profiss�o no segundo n�vel de carreira, n�o precisar� escolher novamente no terceiro. Quer fazer isso agora?" );
	if ( nRet == 0 ) self.say( "Voc� j� passou no teste, ent�o n�o h� por que se preocupar... bom, venha falar comigo quando tomar sua decis�o. Assim que estiver #Gpronto:pronta#, eu concederei a voc� seu 3� avan�o de carreira. Desde que esteja #Gpronto:pronta#..." );
	else {
		nPSP = ( target.nLevel - 70 ) * 3;
		if ( target.nSP > nPSP ) self.say( "Hummm... voc� parece ter #bSP#k demais. Voc� n�o poder� fazer o 3� avan�o de carreira com tanto SP sem uso. Use mais SP nas per�cias de 1� e 2� n�veis antes de voltar aqui." );
		else {
			inventory = target.inventory;
			if ( jobCode == 110 ) target.nJob = 111;
			else if ( jobCode == 120 ) target.nJob = 121;
			else if ( jobCode == 130 ) target.nJob = 131;
			cJob = target.nJob;
			target.incSP( 1, 0 );
			target.incAP( 5, 0 );
			if ( cJob == 111 ) self.say( "Voc� acabou de se tornar um #bTempl�rio#k. Algumas de suas novas per�cias de ataque, como #bGrito#k e #bAtaque Combo#k, s�o devastadoras, e #bEsmagar Armadura#k provocar� uma falha nas habilidades de defesa dos monstros. � melhor voc� se concentrar em adquirir per�cias para a arma em que voc� se especializou nos seus dias como Soldado." );
			else if ( cJob == 121 ) self.say( "Voc� acabou de se tornar um #bCavaleiro Branco#k. Ser� apresentado a voc� um novo livro de per�cias com v�rias per�cias de ataque in�ditas, bem como ataques baseados nos elementos. � recomend�vel que o tipo de arma complementar ao Escudeiro, seja ela uma espada ou ma�a, continue existindo para o Cavaleiro Branco. Existe uma per�cia chamada #bCarga#k que adiciona o elemento fogo, gelo ou raio � arma, tornando o Cavaleiro Branco o �nico guerreiro que consegue executar ataques baseados nos elementos. Carregue sua arma com um elemento que enfraque�a o monstro e em seguida cause um dano maci�o com #bAtaque em Carga#k. Isso definitivamente tornar� voc� uma for�a devastadora." );
			else if ( cJob == 131 ) self.say( "A partir de agora, voc� � um #bCavaleiro Draconiano#k Voc� conhecer� uma s�rie de novas per�cias de ataque para lan�as e lan�as de batalha, e a arma que foi escolhida para o Lanceiro deve continuar existindo para o Cavaleiro Draconiano. Per�cias como #bEsmagar#k (dano m�ximo em um �nico monstro) e #bF�ria do Drag�o#k (dano a v�rios monstros) s�o recomendadas como per�cias de ataque preferenciais, e a per�cia chamada #bRugido do Drag�o#k causar� dano a qualquer criatura na tela com uma for�a devastadora. A desvantagem � que ela usa mais da metade do HP dispon�vel." );
			self.say( "Tamb�m lhe dei um pouco de SP e PH, o que ajudar� voc� a come�ar. Agora voc� se tornou um guerreiro poderoso de verdade. Mas lembre que o mundo real estar� esperando voc� com obst�culos ainda mais dif�ceis de serem superados. Quando voc� achar que n�o � mais capaz de treinar para chegar a um n�vel mais elevado, e somente nesse caso, venha me ver. Estarei aqui esperando." );
		}
	}
}

//4�� ��ų ���Ľ���
function s4common1_Pcheck {
	for ( i = 0 .. 5 ) {
		nJob = target.getPartyMemberJob( i );
		if ( nJob == 112 or nJob == 122 or nJob == 132 or nJob == 212 or nJob == 222 or nJob == 232 or nJob == 312 or nJob == 322 or nJob == 412 or nJob == 422 or nJob == -1 ) {
		} else {
			self.say( "Se houver algu�m que subiu para o 4� n�vel no grupo, voc� n�o poder� continuar." );
			end;
		}
	}
	return;
}

function s4common1 {
	qr = target.questRecord;
	inven = target.inventory;
	if ( qr.getState( 6192 ) == 1 ) {
		if ( target.isPartyBoss == 1 ) {
			if ( target.nJob == 112 or target.nJob == 122 or target.nJob == 132 ) {
				if( inven.itemCount( 4031495 ) <= 0 ) {
					s4common1_Pcheck;
					quest = FieldSet( "S4common1" );
					res = quest.enter( target.nCharacterID, 0 );
					if ( res == -1 ) self.say( "N�o podemos partir por um motivo desconhecido. Tente novamente mais tarde." );
					else if ( res == 1 ) self.say( "Voc� n�o tem um grupo. Forme um grupo com seus amigos para come�ar." );
					else if ( res == 3 ) self.say( "Algu�m do grupo est� em um n�vel menor que 120." );
					else if ( res == 4 ) self.say( "Outro grupo j� come�ou a miss�o. Aguarde um momento e tente novamente." );	
					else {
						quest.resetQuestTime;
					}
				} else self.say( "Voc� j� conquistou minha confian�a. N�o precisa me proteger novamente." );
			} else self.say( "O Guerreiro tem de ser o l�der do grupo." );
		} else self.say( "Somente o l�der do grupo pode decidir quando entrar." );
	} else self.say( "Acho que n�o h� chance de lhe pedir para me proteger." );
	return;
}

// ���� 3������ NPC�� Ÿ�Ϸ���
script "warrior3" {
	//4��-�׼�
	qr = target.questRecord;

	if ( target.nLevel < 50 ) {
		self.say( "Humm... Parece que n�o h� nada que eu possa fazer para ajudar voc�. Volte aqui quando ficar mais forte." );
		end;
	} else if ( target.nLevel >= 50 and target.nLevel < 70 ) nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
	else if ( target.nLevel >= 70 ) {
		if ( qr.getState( 6192 ) == 1 ) nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
		else if ( target.nJob == 110 or target.nJob == 120 or target.nJob == 130 ) nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
		else nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
	}

	cLevel = target.nLevel;
	cJob = target.nJob;

	if ( nRet == 0 ) {
		val = qr.getState( 7500 );
		info = qr.get( 7500 );

		if ( cLevel >= 70 ) {
			if ( cJob == 110 or cJob == 120 or cJob == 130 ) {
				inventory = target.inventory;
				if ( val == 0 ) {
					nRet = self.askYesNo( "Bem-vindo. Sou #bTylus#k, o chefe de todos os guerreiros, encarregado de despertar o melhor nos guerreiros que precisam da minha orienta��o. Voc� parece ser o tipo de guerreiro que deseja dar um passo � frente, parece #Gpronto:pronta# para encarar os desafios do 3� n�vel de carreira. Mas j� vi muitos guerreiros prontos para dar o salto, assim como voc�, somente para fracassar no final. E voc�? Est� #Gpronto:pronta# para tentar o teste e subir para o 3� n�vel de carreira?" );
					if ( nRet == 0 ) self.say( "N�o creio que voc� esteja #Gpronto:pronta# para encarar os desafios que est�o por vir. Venha me ver somente quando convencer a si mesmo de que est� #Gpronto:pronta# para encarar os desafios que v�m junto com o seu avan�o." );
					else {
						qr.set( 7500, "s" );
						self.say( "Bom. Voc� ser� #Gtestado:testada# em dois aspectos importantes para os guerreiros: for�a e sabedoria. Vou lhe explicar agora a parte f�sica do teste. Lembra do #b#p1022000##k de Perion? V� at� ele e ou�a sua explica��o sobre a primeira parte do teste. Conclua a miss�o e receba #b#t4031057##k do #p1022000#." );
						self.say( "A por��o mental do teste come�ar� somente quando voc� passar na parte f�sica. #b#t4031057##k ser� a prova de que voc� passou no teste. Vou informar o #b#p1022000##k que voc� est� indo at� ele. Fique preparado. N�o ser� f�cil, mas tenho muita f� em voc�. Boa sorte!" );
					}
				}
				else if ( val == 1 and ( info == "s" or info == "p1" ) ) self.say( "Voc� n�o tem #b#t4031057##k com voc�. V� ver o #b#p1022000##k de Perion, passe no teste e traga #b#t4031057##k com voc�. Somente ent�o voc� poder� fazer o segundo teste. Boa sorte para voc�." );
				else if ( val == 1 and info == "p2" ) {
					if ( inventory.itemCount( 4031057 ) >= 1 ) {
						self.say( "Parab�ns por ter completado a parte f�sica do teste. Eu sabia que voc� conseguiria. Agora que voc� passou na primeira parte do teste, poder� fazer a segunda parte. D�-me o colar primeiro." );
						ret = inventory.exchange( 0, 4031057, -1 );
						if ( ret == 0 ) self.say( "Tem certeza de que possui #b#t4031057##k do #b#p1022000##k? N�o se esque�a de deixar um espa�o no seu invent�rio de Etc." );
						else {
							qr.set( 7500, "end1" );
							self.say( "Aqui est� a 2� parte do teste. Este teste determinar� se voc� � #Gesperto:esperta# o suficiente para dar o pr�ximo passo em dire��o � grandiosidade. Existe uma �rea sombria e coberta de neve chamada de Solo Sagrado no campo de neve em Ossyria. Nem mesmo os monstros conseguem chegar at� l�. Na por��o central da regi�o, existe uma pedra gigante chamada Pedra Sagrada. Voc� ter� de oferecer um item especial como sacrif�cio. A Pedra Sagrada testar� sua sabedoria l� mesmo." );
							self.say( "Voc� ter� de responder a todas as perguntas com honestidade e convic��o. Se voc� responder a tudo corretamente, a Pedra Sagrada o aceitar� formalmente e lhe entregar� #b#t4031058##k. Traga o colar de volta e eu ajudarei voc� a dar o pr�ximo passo. Boa sorte!" );
						}
					}
					else self.say( "Voc� n�o tem #b#t4031057##k com voc�. V� ver o #b#p1022000##k de Perion, passe no teste e traga #b#t4031057##k com voc�. Somente ent�o voc� passar� na primeira parte do teste. Boa sorte!" );
				}
				else if ( val == 1 and info == "end1" ) {
					if ( inventory.itemCount( 4031058 ) >= 1 ) {
						self.say( "Parab�ns por ter completado a parte mental do teste. Voc� respondeu a todas as perguntas corretamente e com sabedoria. Devo dizer que estou bastante impressionado com o n�vel de sabedoria que voc� demonstrou. Entregue-me o colar primeiro, antes de darmos o pr�ximo passo." );
						ret = inventory.exchange( 0, 4031058, -1 );
						if ( ret == 0 ) self.say( "Tem certeza de que possui #b#t4031058##k concedido pela Pedra Sagrada? Se tiver certeza, n�o se esque�a de deixar um espa�o no seu invent�rio de Etc." );
						else {
							qr.setComplete( 7500 );
							changeJob1( cJob );
						}
					}
					else self.say( "Voc� n�o tem #b#t4031058##k com voc�. Encontre a �rea sombria e coberta de neve chamada de Solo Sagrado no campo de neve em Ossyria, ofere�a o item especial como sacrif�cio e responda a todas as perguntas com honestidade e convic��o para receber #b#t4031058##k. Traga isso de volta para mim para concluir o teste do 3� n�vel de carreira. Boa sorte para voc�..." );
				}
				else if ( val == 2 ) changeJob1( cJob );
			}
			else if ( cJob == 111 ) self.say( "Foi voc� quem passou dos testes para subir para o 3� n�vel de carreira. Como � a vida de um #bTempl�rio#k? Voc� ter� de continuar treinando conforme realiza sua jornada por este lugar. Ossyria est� cheia de monstros poderosos que nem mesmo eu conhe�o. Se tiver alguma d�vida, v� falar comigo no fim desta estrada. Desejo-lhe boa sorte." );
			else if ( cJob == 121 ) self.say( "Foi voc� quem passou nos testes para subir para o 3� n�vel de carreira. Como � a vida de um #bCavaleiro Branco#k? Voc� ter� de continuar treinando conforme realiza sua jornada por este lugar. Ossyria est� cheia de monstros poderosos que nem mesmo eu conhe�o. Se tiver alguma d�vida, v� falar comigo no fim desta estrada. Desejo-lhe boa sorte." );
			else if ( cJob == 131 ) self.say( "Foi voc� quem passou nos testes para subir para o 3� n�vel de carreira. Como � a vida de um #bCavaleiro Draconiano#k? Voc� ter� de continuar treinando conforme realiza sua jornada por este lugar. Ossyria est� cheia de monstros poderosos que nem mesmo eu conhe�o. Se tiver alguma d�vida, v� falar comigo no final desta estrada. Desejo-lhe boa sorte." );
			else if ( cJob == 112 ) self.say( "Foi voc� quem conseguiu se tornar o mais forte dos Guerreiros. Voc� ter� de servir de exemplo para todos como #bHer�i#k. Ainda existem muito segredos neste mundo. O poder de Guerreiros como voc� ser� de grande ajuda. Por isso, continue treinando." );
			else if ( cJob == 122 ) self.say( "Foi voc� quem conseguiu se tornar o mais forte dos Guerreiros. Voc� ter� de servir de exemplo para todos como #bPaladino#k. Ainda existem muito segredos neste mundo. O poder de Guerreiros como voc� ser� de grande ajuda. Por isso, continue treinando." );
			else if ( cJob == 132 ) self.say( "Foi voc� quem conseguiu se tornar o mais forte dos Guerreiros. Voc� ter� de servir de exemplo para todos como #bCavaleiro Negro#k. Ainda existem muito segredos neste mundo. O poder de Guerreiros como voc� ser� de grande ajuda. Por isso, continue treinando." );
			else self.say( "Sou #bTylus#k, o chefe de todos os guerreiros, encarregado de despertar o melhor nos guerreiros que precisam da minha orienta��o. Mas voc� n�o se parece com um guerreiro. Infelizmente, n�o posso #Gajud�-lo:ajud�-la#. Esta sala est� cheia de chefes com suas respectivas classes. Se precisar de alguma coisa, v� falar com um deles." );
		}
		else self.say( "Voc� ainda n�o est� #Gqualificado:qualificada# para fazer o 3� avan�o de carreira. Voc� precisa ter no m�nimo n�vel 70 para isso. Treine mais e depois venha me ver." );
	}
	else if ( nRet == 1 ) {
		val2 = qr.get( 7000 );

		if ( val2 == "" ) {
			if ( cLevel >= 50 ) {
				if ( cJob >= 0 and cJob < 200 ) {
					qr.set( 7000, "s");
					self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum, certo? Deve ser #b#p2030008##k... ok, certo! Tenho certeza de que voc� ficar� bem na masmorra. Espero que tome cuidado por l�..." );
				}
				else self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum. Sinto muito, mas voc� n�o parece um guerreiro. V� procurar o chefe da sua profiss�o." );
			}
			else self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum. Sinto muito, mas a masmorra � muito dif�cil para voc�. Voc� deve ter no m�nimo n�vel 50 para pelo menos tentar... treine mais e depois volte aqui." );
		}
		else self.say( "Como voc� est� se saindo na Miss�o da Masmorra de Zakum? Ouvi falar que existe um monstro incr�vel nas profundezas desse lugar... de qualquer forma, boa sorte. Tenho certeza de que voc� vai conseguir." );
	}
	else if ( nRet == 2 ) {
		s4common1;
	}
	else self.say( "Sob constru��o... Por favor, aguarde..." );
}

// magician job adv. function
function changeJob2( integer jobCode ) {
	nRet = self.askYesNo( "Certo! Agora vou transformar voc� em um bruxo muito mais poderoso. Mas, antes disso, certifique-se de que seu SP foi bem usado. Voc� precisa usar pelo menos todo o SP recebido at� o n�vel 70 para subir para o 3� n�vel de carreira. Ah, e como voc� j� escolheu sua profiss�o no segundo avan�o de carreira, n�o precisar� escolher novamente no terceiro. Quer fazer isso agora?" );
	if ( nRet == 0 ) self.say( "Voc� j� passou no teste, ent�o n�o h� por que se preocupar... bom, venha falar comigo quando tomar sua decis�o. Assim que estiver #Gpronto:pronta#, eu concederei a voc� seu 3� avan�o de carreira. Desde que esteja #Gpronto:pronta#." );
	else {
		nPSP = ( target.nLevel - 70 ) * 3;
		if ( target.nSP > nPSP ) self.say( "Hummm... voc� parece ter #bSP#k demais. Voc� n�o poder� subir para o 3� n�vel de carreira com tanto SP sem uso. Use mais SP nas per�cias de 1� e 2� n�veis antes de voltar aqui." );
		else {
			inventory = target.inventory;
			if ( jobCode == 210 ) target.nJob = 211;
			else if ( jobCode == 220 ) target.nJob = 221;
			else if ( jobCode == 230 ) target.nJob = 231;
			cJob = target.nJob;
			target.incSP( 1, 0 );
			target.incAP( 5, 0 );

			if ( cJob == 211 ) self.say( "A partir de agora, voc� � o #bMago do Fogo e Veneno#k. O novo livro de per�cias cont�m feiti�os in�ditos e melhorados de fogo e veneno, e per�cias como #bAmplifica��o Elemental#k (aprimora os feiti�os baseados nos elementos) e #bEspecializa��o em Feiti�os#k (aprimora a velocidade geral dos feiti�os de ataque) permitir�o que voc� ataque os monstros com rapidez e precis�o. Os feiti�os de defesa, como #bResist�ncia Parcial#k (defesa aprimorada contra certos ataques baseados nos elementos) e #bSelo M�stico#k (aprisiona monstros), ajudar�o a compensar a �nica fraqueza que os Magos possuem: falta de HP." );
			else if ( cJob == 221 ) self.say( "A partir de agora, voc� � o #bMago do Gelo e Raio#k. O novo livro de per�cias cont�m feiti�os in�ditos e melhorados do gelo e raio, e per�cias como #bAmplifica��o Elemental#k (aprimora os feiti�os baseados nos elementos) e #bEspecializa��o em Feiti�os#k (aprimora a velocidade geral dos feiti�os de ataque) permitir�o que voc� ataque os monstros com rapidez e precis�o. Os feiti�os de defesa, como #bResist�ncia Parcial#k (permite que voc� se torne resistente contra certos ataques baseados nos elementos) e #bSelo M�stico#k (aprisiona monstros), ajudar�o a compensar a �nica fraqueza que os Magos possuem: falta de HP." );
			else if ( cJob == 231 ) self.say( "A partir de agora, voc� � um #bSacerdote#k O novo livro de per�cias cont�m feiti�os sagrados in�ditos e melhorados, como #bRaio Brilhante#k e #bInvocar Drag�o#k, e per�cias como #bPorta M�stica#k (cria uma porta que sai na cidade mais pr�xima) e #bS�mbolo Sagrado#k (melhora a EXP recebida) poder�o ser essenciais para jogos cooperativos. Feiti�os nada convencionais, como #bMaldi��o#k (transforma monstros em lesmas), tornam a carreira do Sacerdote a mais diferente de todas." );
			self.say( "Tamb�m lhe dei um pouco de SP e PH, algo que beneficiar� voc�. Agora voc� se tornou um bruxo poderoso de verdade. Mas lembre que o mundo real estar� esperando voc� com obst�culos ainda mais dif�ceis de serem superados. Quando voc� achar que n�o � mais capaz de treinar para chegar a um n�vel mais elevado, e somente nesse caso, venha me ver. Estarei aqui esperando." );
		}
	}
}

// robeira, the npc for 3rd job adv for magicians
script "wizard3" {
	qr = target.questRecord;

	if ( target.nLevel < 50 ) {
		self.say( "Humm... Parece que n�o h� nada que eu possa fazer para ajudar voc�. Volte aqui quando ficar mais forte." );
		end;
	}
	else if ( target.nLevel >= 50 and target.nLevel < 70 ) nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
	else if ( target.nLevel >= 70 ) {
		if ( target.nJob == 210 or target.nJob == 220 or target.nJob == 230 ) nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
		else nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
	}

	cLevel = target.nLevel;
	cJob = target.nJob;

		if ( nRet == 0 ) {
		val = qr.getState( 7500 );
		info = qr.get( 7500 );

		if ( cLevel >= 70 ) {
			if ( cJob == 210 or cJob == 220 or cJob == 230 ) {
				inventory = target.inventory;
				if ( val == 0 ) {
					nRet = self.askYesNo( "Bem-vindo. Sou #bRobeira#k, a chefe de todos os bruxos, sempre pronta para oferecer meu conhecimento e orienta��o para os bruxos de todo o mundo. Voc� parece preparado para encarar os desafios do 3� n�vel de carreira, mas aconselho que n�o fique muito confiante. J� vi muitos bruxos irem e virem, falhando em atender �s minhas expectativas no processo. Quanto a voc�, j� n�o sei. Est� #Gpronto:pronta# para tentar o teste e fazer o 3� n�vel de carreira?" );
					if ( nRet == 0 ) self.say( "N�o creio que voc� esteja #Gpronto:pronta# para encarar os desafios que est�o por vir. Venha me ver somente quando convencer a si mesmo de que est� #Gpronto:pronta# para encarar os desafios que v�m junto com o seu avan�o." );
					else {
						qr.set( 7500, "s" );
						self.say( "Bom. Voc� ser� #Gtestado:testada# em dois aspectos importantes para os bruxos: for�a e sabedoria. Vou lhe explicar agora a parte f�sica do teste. Lembra de #b#p1032001##k de Ellinia? V� at� ele e ou�a sua explica��o sobre a primeira parte do teste. Conclua a miss�o e receba #b#t4031057##k do #p1032001#." );
						self.say( "A por��o mental do teste come�ar� somente quando voc� passar da parte f�sica. #b#t4031057##k ser� a prova de que voc� passou no teste. Vou informar #b#p1032001##k que voc� est� indo at� ele. Fique preparado. N�o ser� f�cil, mas tenho muita f� em voc�. Boa sorte!" );
					}
				}
				else if ( val == 1 and ( info == "s" or info == "p1" ) ) self.say( "Voc� n�o tem #b#t4031057##k com voc�. V� ver #b#p1032001##k de Ellinia, passe no teste e traga #b#t4031057##k com voc�. Somente ent�o voc� poder� fazer o segundo teste. Boa sorte para voc�." );
				else if ( val == 1 and info == "p2" ) {
					if ( inventory.itemCount( 4031057 ) >= 1 ) {
						self.say( "Parab�ns por ter completado a parte f�sica do teste. Eu sabia que voc� conseguiria. Agora que voc� passou da primeira parte do teste, poder� fazer a segunda parte. D�-me o colar primeiro." );
						ret = inventory.exchange( 0, 4031057, -1 );
						if ( ret == 0 ) self.say( "Tem certeza de que possui #b#t4031057##k de #b#p1032001##k? N�o se esque�a de deixar um espa�o no seu invent�rio de Etc." );
						else {
							qr.set( 7500, "end1" );
							self.say( "Aqui est� a 2� parte do teste. Este teste determinar� se voc� � #Gesperto:esperta# o suficiente para dar o pr�ximo passo em dire��o � grandiosidade. Existe uma �rea sombria e coberta de neve chamada de Solo Sagrado no campo de neve em Ossyria. Nem mesmo os monstros conseguem chegar at� l�. Na por��o central da regi�o, existe uma pedra gigante chamada de Pedra Sagrada. Voc� ter� de oferecer um item especial como sacrif�cio. A Pedra Sagrada testar� sua sabedoria l� mesmo." );
							self.say( "Voc� ter� de responder a todas as perguntas com honestidade e convic��o. Se voc� responder a tudo corretamente, a Pedra Sagrada o aceitar� formalmente e lhe entregar� #b#t4031058##k. Traga o colar de volta e eu ajudarei voc� a dar o pr�ximo passo. Boa sorte!" );
						}
					}
					else self.say( "Voc� n�o tem #b#t4031057##k com voc�. V� ver #b#p1032001##k de Ellinia, passe no teste e traga #b#t4031057##k com voc�. Somente ent�o voc� passar� na primeira parte do teste. Boa sorte!" );
				}
				else if ( val == 1 and info == "end1" ) {
					if ( inventory.itemCount( 4031058 ) >= 1 ) {
						self.say( "Parab�ns por ter completado a parte mental do teste. Voc� respondeu a todas as perguntas corretamente e com sabedoria. Devo dizer que estou bastante impressionado com o n�vel de sabedoria que voc� demonstrou. Entregue-me o colar primeiro, antes de darmos o pr�ximo passo." );
						ret = inventory.exchange( 0, 4031058, -1 );
						if ( ret == 0 ) self.say( "Tem certeza de que possui #b#t4031058##k concedido pela Pedra Sagrada? Se tiver certeza, n�o se esque�a de deixar um espa�o no seu invent�rio de Etc." );
						else {
							qr.setComplete( 7500 );
							changeJob2( cJob );
						}
					}
					else self.say( "Voc� n�o tem #b#t4031058##k com voc�. Encontre a �rea sombria e coberta de neve chamada de Solo Sagrado no campo de neve em Ossyria, ofere�a o item especial como sacrif�cio e responda a todas as perguntas com honestidade e convic��o para receber #b#t4031058##k. Traga isso de volta para mim para concluir o teste do 3� avan�o de carreira. Boa sorte para voc�..." );
				}
				else if ( val == 2 ) changeJob2( cJob );
			}
			else if ( cJob == 211 or cJob == 221 ) self.say( "Foi voc� quem passou nos testes para subir para o 3� n�vel de carreira. Como � a vida de um #bMago#k? Voc� ter� de continuar treinando conforme realiza sua jornada por este lugar. Ossyria est� cheia de monstros poderosos que nem mesmo eu conhe�o. Se tiver alguma d�vida, v� falar comigo no fim desta estrada. Desejo-lhe boa sorte." );
			else if ( cJob == 231 ) self.say( "Foi voc� quem passou nos testes para subir para o 3� n�vel de carreira. Como � a vida de um #bSacerdote#k? Voc� ter� de continuar treinando conforme realiza sua jornada por este lugar. Ossyria est� cheia de monstros poderosos que nem mesmo eu conhe�o. Se tiver alguma d�vida, v� falar comigo no fim desta estrada. Desejo-lhe boa sorte." );
			else if ( cJob == 212 or cJob == 222 ) self.say( "Foi voc� quem conseguiu se tornar o mais forte dos Bruxos. Voc� ter� de servir de exemplo para todos como #bArquimago#k. Ainda existem muito segredos neste mundo. O poder de Bruxos como voc� ser� de grande ajuda. Por isso, continue treinando." );
			else if ( cJob == 232 ) self.say( "Foi voc� quem conseguiu se tornar o mais forte dos Bruxos. Voc� ter� de servir de exemplo para todos como #bBispo#k. Ainda existem muitos segredos neste mundo. O poder de Bruxos como voc� ser� de grande ajuda. Por isso, continue treinando." );
			else self.say( "Sou #bRobeira#k, a chefe de todos os bruxos, sempre pronta para oferecer meu conhecimento e orienta��o para os bruxos de todo o mundo. Entretanto, voc� n�o parece um bruxo. N�o posso #Gajud�-lo:ajud�-la# assim. Esta sala est� cheia de chefes com suas respectivas classes. Se precisar de alguma coisa, v� falar com um deles." );
		}
		else self.say( "Voc� ainda n�o est� #Gqualificado:qualificada# para subir para o 3� n�vel de carreira. Voc� precisa ter no m�nimo n�vel 70 para isso. Treine mais e depois venha me ver." );
	}
	else if ( nRet == 1 ) {
		val2 = qr.get( 7000 );

		if ( val2 == "" ) {
			if ( cLevel >= 50 ) {
				if ( cJob >= 200 and cJob < 300 ) {
					qr.set( 7000, "s");
					self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum, certo? Deve ser #b#p2030008##k... ok, certo! Tenho certeza de que voc� ficar� bem na masmorra. Espero que tome cuidado por l�..." );
				}
				else self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum. Sinto muito, mas voc� n�o parece um bruxo. V� procurar o chefe da sua profiss�o." );
			}
			else self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum. Sinto muito, mas a masmorra � muito dif�cil para voc�. Voc� deve ter no m�nimo n�vel 50 para pelo menos tentar... treine mais e depois volte aqui." );
		}
		else self.say( "Como voc� est� se saindo na Miss�o da Masmorra de Zakum? Ouvi falar que existe um monstro incr�vel nas profundezas desse lugar... de qualquer forma, boa sorte. Tenho certeza de que voc� vai conseguir." );
	}
	else self.say( "Sob constru��o... em breve..." );
}

// bowman job adv function
function changeJob3( integer jobCode ) {
	nRet = self.askYesNo( "Certo! Agora vou transformar voc� em um arqueiro muito mais poderoso. Mas, antes disso, certifique-se de que seu SP foi bem usado. Voc� precisa usar pelo menos todo o SP recebido at� o n�vel 70 para subir para o 3� n�vel de carreira. Ah, e como voc� j� escolheu sua profiss�o no segundo n�vel de carreira, n�o precisar� escolher novamente no terceiro. Quer fazer isso agora?" );
	if ( nRet == 0 ) self.say( "Voc� j� passou do teste, ent�o n�o h� por que se preocupar... bom, venha falar comigo quando tomar sua decis�o. Assim que estiver #Gpronto:pronta#, eu concederei a voc� seu 3� n�vel de carreira. Desde que esteja #Gpronto:pronta#..." );
	else {
		nPSP = ( target.nLevel - 70 ) * 3;
		if ( target.nSP > nPSP ) self.say( "Voc� parece ter #bSP#k demais. Voc� n�o poder� subir para o 3� n�vel de carreira com tanto SP sem uso. Use mais SP nas per�cias de 1� e 2� n�veis antes de voltar aqui." );
		else {
			inventory = target.inventory;
			if ( jobCode == 310 ) target.nJob = 311;
			else if ( jobCode == 320 ) target.nJob = 321;
			cJob = target.nJob;
			target.incSP( 1, 0 );
			target.incAP( 5, 0 );

			if ( cJob == 311 ) self.say( "Voc� acabou de se tornar um #bRanger#k. Umas das per�cias que voc� realmente ter� que dominar � aquela chamada de #bGolpe Mortal#k, que permite ao Ranger disparar flechas a uma curta dist�ncia. #bInferno#k permite ao Ranger executar temporariamente ataques baseados em fogo contra monstros, enquanto per�cias como #bMarionete#k (convoca um espantalho que chama a aten��o do monstro) e #bFalc�o de Prata#k (convoca um falc�o de prata que ataca os monstros) consagram o status do Arqueiro como um especialista em ataques de longa dist�ncia." );
			else if ( cJob == 321 ) self.say( "Voc� acabou de se tornar um #bAtirador#k. Umas das per�cias que voc� realmente ter� que dominar � aquela chamada de #bGolpe Mortal#k, que permite ao Atirador disparar flechas a uma curta dist�ncia. #bNevasca#k permite ao Atirador executar temporariamente ataques baseados em gelo contra monstros, enquanto per�cias como #bMarionete#k (convoca um espantalho que chama a aten��o do monstro) e #b�guia Dourada#k (convoca uma �guia dourada que ataca os monstros) consagram o status do Arqueiro como um especialista em ataques de longa dist�ncia." );
			self.say( "Tamb�m lhe dei um pouco de SP e PH, algo que beneficiar� voc�. Agora voc� se tornou um arqueiro poderoso de verdade. Mas lembre que o mundo real estar� esperando voc� com obst�culos ainda mais dif�ceis de serem superados. Quando voc� achar que n�o � mais capaz de treinar para chegar a um n�vel mais elevado, e somente nesse caso, venha me ver. Estarei aqui esperando." );
		}
	}
}


// Rene, the npc for 3rd job adv for bowman
script "bowman3" {
	if ( target.nLevel < 50 ) {
		self.say( "Humm... Parece que n�o h� nada que eu possa fazer para ajudar voc�. Volte aqui quando ficar mais forte." );
		end;
	}
	else if ( target.nLevel >= 50 and target.nLevel < 70 ) nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
	else if ( target.nLevel >= 70 ) {
		if ( target.nJob == 310 or target.nJob == 320 ) nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
		else nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
	}

	qr = target.questRecord;
	cLevel = target.nLevel;
	cJob = target.nJob;

	if ( nRet == 0 ) {
		val = qr.getState( 7500 );
		info = qr.get( 7500 );
		
		if ( cLevel >= 70 ) {
			if ( cJob == 310 or cJob == 320 ) {
				inventory = target.inventory;
				if ( val == 0 ) {
					nRet = self.askYesNo( "Bem-vindo. Sou #bRene#k, a chefe de todos os arqueiros, encarregada de despertar o melhor nos arqueiros que precisam da minha orienta��o. Voc� parece ser o tipo de arqueiro que deseja dar um passo � frente, parece #Gpronto:pronta# para encarar os desafios do 3� n�vel de carreira. Mas j� vi muitos arqueiros prontos para dar o salto, assim como voc�, somente para fracassar no final. E voc�? Est� #Gpronto:pronta# para tentar o teste e subir para o 3� n�vel de carreira?" );
					if ( nRet == 0 ) self.say( "N�o creio que voc� esteja #Gpronto:pronta# para encarar os desafios que est�o por vir. Venha me ver somente quando convencer a si mesmo de que est� #Gpronto:pronta# para encarar os desafios que v�m junto com o seu avan�o." );
					else {
						qr.set( 7500, "s" );
						self.say( "Bom. Voc� ser� #Gtestado:testada# em dois aspectos importantes para os arqueiros: for�a e sabedoria. Vou lhe explicar agora a parte f�sica do teste. Lembra de #b#p1012100##k de Henesys? V� at� ela e ou�a sua explica��o sobre a primeira parte do teste. Conclua a miss�o e receba #b#t4031057##k de #p1012100#." );
						self.say( "A por��o mental do teste come�ar� somente quando voc� passar da parte f�sica. #b#t4031057##k ser� a prova de que voc� passou no teste. Vou informar #b#p1012100##k que voc� est� indo at� ela. Fique preparado. N�o ser� f�cil, mas tenho muita f� em voc�. Boa sorte!" );
					}
				}
				else if ( val == 1 and ( info == "s" or info == "p1" ) ) self.say( "Voc� n�o tem #b#t4031057##k com voc�. V� ver #b#p1012100##k de Henesys, passe no teste e traga #b#t4031057##k com voc�. Somente ent�o voc� poder� fazer o segundo teste. Boa sorte para voc�." );
				else if ( val == 1 and info == "p2" ) {
					if ( inventory.itemCount( 4031057 ) >= 1 ) {
						self.say( "Parab�ns por ter completado a parte f�sica do teste. Eu sabia que voc� conseguiria. Agora que voc� passou na primeira parte do teste, poder� fazer a segunda parte. D�-me o colar primeiro." );
						ret = inventory.exchange( 0, 4031057, -1 );
						if ( ret == 0 ) self.say( "Tem certeza de que possui #b#t4031057##k de #b#p1012100##k? N�o se esque�a de deixar um espa�o no seu invent�rio de Etc." );
						else {
							qr.set( 7500, "end1" );
							self.say( "Aqui est� a 2� parte do teste. Este teste determinar� se voc� � #Gesperto:esperta# o suficiente para dar o pr�ximo passo em dire��o � grandiosidade. Existe uma �rea sombria e coberta de neve chamada de Solo Sagrado no campo de neve em Ossyria. Nem mesmo os monstros conseguem chegar at� l�. Na por��o central da regi�o, existe uma pedra gigante chamada de Pedra Sagrada. Voc� ter� de oferecer um item especial como sacrif�cio. A Pedra Sagrada testar� sua sabedoria l� mesmo." );
							self.say( "Voc� ter� de responder a todas as perguntas com honestidade e convic��o. Se voc� responder a tudo corretamente, a Pedra Sagrada o aceitar� formalmente e lhe entregar� #b#t4031058##k. Traga o colar de volta e eu ajudarei voc� a dar o pr�ximo passo. Boa sorte!" );
						}
					}
					else self.say( "Voc� n�o tem #b#t4031057##k com voc�. V� ver #b#p1012100##k de Henesys, passe no teste e traga #b#t4031057##k com voc�. Somente ent�o voc� passar� na primeira parte do teste. Boa sorte!" );
				}
				else if ( val == 1 and info == "end1" ) {
					if ( inventory.itemCount( 4031058 ) >= 1 ) {
						self.say( "Parab�ns por ter completado a parte mental do teste. Voc� respondeu a todas as perguntas corretamente e com sabedoria. Devo dizer que estou bastante impressionado com o n�vel de sabedoria que voc� demonstrou. Entregue-me o colar primeiro, antes de darmos o pr�ximo passo." );
						ret = inventory.exchange( 0, 4031058, -1 );
						if ( ret == 0 ) self.say( "Tem certeza de que possui #b#t4031058##k concedido pela Pedra Sagrada? Se tiver certeza, n�o se esque�a de deixar um espa�o no seu invent�rio de Etc." );
						else {
							qr.setComplete( 7500 );
							changeJob3( cJob );
						}
					}
					else self.say( "Voc� n�o tem #b#t4031058##k com voc�. Encontre a �rea sombria e coberta de neve chamada de Solo Sagrado no campo de neve em Ossyria, ofere�a o item especial como sacrif�cio e responda a todas as perguntas com honestidade e convic��o para receber #b#t4031058##k. Traga isso de volta para mim para concluir o teste do 3� n�vel de carreira. Boa sorte para voc�..." );
				}
				else if ( val == 2 ) changeJob3( cJob );
			}
			else if ( cJob == 311 ) self.say( "Foi voc� quem passou nos testes para subir para o 3� n�vel de carreira. Como � a vida de um #bRanger#k? Voc� ter� de continuar treinando conforme realiza sua jornada por este lugar. Ossyria est� cheia de monstros poderosos que nem mesmo eu conhe�o. Se tiver alguma d�vida, v� falar comigo no fim desta estrada. Desejo-lhe boa sorte." );
			else if ( cJob == 321 ) self.say( "Foi voc� quem passou nos testes para fazer o 3� avan�o de carreira. Como � a vida de um #bAtirador#k? Voc� ter� de continuar treinando conforme realiza sua jornada por este lugar. Ossyria est� cheia de monstros poderosos que nem mesmo eu conhe�o. Se tiver alguma d�vida, v� falar comigo no fim desta estrada. Desejo-lhe boa sorte." );
			else if ( cJob == 312 ) self.say( "Foi voc� quem conseguiu se tornar o mais forte dos Arqueiros. Voc� ter� de servir de exemplo para todos como #bMestre Arqueiro#k. Ainda existem muito segredos neste mundo. O poder de Arqueiros como voc� ser� de grande ajuda. Por isso, continue treinando." );
			else if ( cJob == 322 ) self.say( "Foi voc� quem conseguiu se tornar o mais forte dos Arqueiros. Voc� ter� de servir de exemplo para todos como #bAtirador de Elite#k. Ainda existem muitos segredos neste mundo. O poder de Arqueiros como voc� ser� de grande ajuda. Por isso, continue treinando." );
			else self.say( "Sou #bRene#k, a chefe de todos os arqueiros, encarregada de despertar o melhor nos arqueiros que precisam da minha orienta��o. Mas voc� n�o � um arqueiro. N�o acho que eu possa #Gajud�-lo:ajud�-la#. Esta sala est� cheia de chefes com suas respectivas classes. Se precisar de alguma coisa, v� falar com um deles." );
		}
		else self.say( "Voc� ainda n�o est� #Gqualificado:qualificada# para subir para o 3� n�vel de carreira. Voc� precisa ter no m�nimo n�vel 70 para isso. Treine mais e depois venha me ver." );
	}
	else if ( nRet == 1 ) {
		val2 = qr.get( 7000 );

		if ( val2 == "" ) {
			if ( cLevel >= 50 ) {
				if ( cJob >= 300 and cJob < 400 ) {
					qr.set( 7000, "s");
					self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum, certo? Deve ser #b#p2030008##k... ok, certo! Tenho certeza de que voc� ficar� bem na masmorra. Espero que tome cuidado por l�..." );
				}
				else self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum. Sinto muito, mas voc� n�o parece um arqueiro. V� procurar o chefe da sua profiss�o." );
			}
			else self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum. Sinto muito, mas a masmorra � muito dif�cil para voc�. Voc� deve ter no m�nimo n�vel 50 para pelo menos tentar... treine mais e depois volte aqui." );
		}
		else self.say( "Como voc� est� se saindo na Miss�o da Masmorra de Zakum? Ouvi falar que existe um monstro incr�vel nas profundezas desse lugar... de qualquer forma, boa sorte. Tenho certeza de que voc� vai conseguir." );
	}
	else self.say( "Em constru��o... em breve..." );
}

// thief job adv. function
function changeJob4( integer jobCode ) {
	nRet = self.askYesNo( "Certo! Agora vou transformar voc� em um gatuno muito mais poderoso. Mas, antes disso, certifique-se de que seu SP foi bem usado. Voc� precisa usar pelo menos todo o SP recebido at� o n�vel 70 para subir para o 3� n�vel de carreira. Ah, e como voc� j� escolheu sua profiss�o no segundo n�vel de carreira, n�o precisar� escolher novamente no terceiro. Quer fazer isso agora?" );
	if ( nRet == 0 ) self.say( "Voc� j� passou no teste, ent�o n�o h� por que se preocupar... bom, venha falar comigo quando tomar sua decis�o. Assim que estiver #Gpronto:pronta#, eu concederei a voc� seu 3� avan�o de carreira. Desde que esteja #Gpronto:pronta#..." );
	else {
		nPSP = ( target.nLevel - 70 ) * 3;
		if ( target.nSP > nPSP ) self.say( "Hummm... voc� parece ter #bSP#k demais. Voc� n�o poder� subir para o 3� n�vel de carreira com tanto SP sem uso. Use mais SP nas per�cias de 1� e 2� n�veis antes de voltar aqui." );
		else {
			inventory = target.inventory;
			if ( jobCode == 410 ) target.nJob = 411;
			else if ( jobCode == 420 ) target.nJob = 421;
			cJob = target.nJob;
			target.incSP( 1, 0 );
			target.incAP( 5, 0 );

			if ( cJob == 411 ) self.say( "Voc� foi oficialmente nomeado #bAndarilho#k. Este livro introduz uma s�rie de novas per�cias de ataque para os Andarilhos, usando as sombras como uma forma de duplica��o e substitui��o, incluindo per�cias como #bMesos das Sombras#k (substitui MP por mesos e causa dano em monstros com base na quantidade de mesos arremessados) e #bImitador#k (cria uma sombra que imita cada movimento do Andarilho, permitindo que ele ataque o monstro como se existissem dois Andarilhos). Use essas per�cias para derrubar os monstros que s�o dif�ceis de serem derrotados." );
			else if ( cJob == 421 ) self.say( "Voc� foi oficialmente nomeado #bMestre Arruaceiro#k. Uma das novidades do livro de per�cias � uma per�cia chamada #bBando de Gatunos#k. Com ela, voc� convoca outros Arruaceiros para atacar v�rios monstros de uma s� vez. Os Mestres Arruaceiros tamb�m podem usar mesos de v�rias maneiras, para atacar monstros (#bExplos�o de Mesos#k, que explode os mesos no ch�o) ou defender a si mesmos (#bEscudo de Mesos#k, que reduz o dano por arma)." );
			self.say( "Aqui est� um pouco de SP e PH; assim voc� poder� come�ar. Agora voc� se tornou um gatuno poderoso de verdade. Mas lembre que o mundo real estar� esperando voc� com obst�culos ainda mais dif�ceis de serem superados. Quando voc� achar que n�o � mais capaz de treinar para chegar a um n�vel mais elevado, e somente nesse caso, venha me ver. Estarei aqui esperando." );
		}
	}
}

// Arec, the NPC for the thief's 3rd job adv
script "thief3" {
	if ( target.nLevel < 50 ) {
		self.say( "Humm... Parece que n�o h� nada que eu possa fazer para ajudar voc�. Volte aqui quando ficar mais forte." );
		end;
	}
	else if ( target.nLevel >= 50 and target.nLevel < 70 ) nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
	else if ( target.nLevel >= 70 ) {
		if ( target.nJob == 410 or target.nJob == 420 ) nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
		else nRet = self.askMenu( "Posso #Gajud�-lo:ajud�-la#?" );
	}

	qr = target.questRecord;
	cLevel = target.nLevel;
	cJob = target.nJob;
	inven = target.inventory;

	if ( nRet == 0 ) {
		val = qr.getState( 7500 );
		info = qr.get( 7500 );
		
		if ( cLevel >= 70 ) {
			if ( cJob == 410 or cJob == 420 ) {
				inventory = target.inventory;
				if ( val == 0 ) {
					nRet = self.askYesNo( "Bem-vindo. Sou #bArec#k, o chefe de todos os ladr�es, pronto para compartilhar meu conhecimento sobre as ruas e falar sobre a minha vida dif�cil para aqueles que quiserem me ouvir. Voc� parece #Gpronto:pronta# para dar um passo � frente e encarar os desafios do 3� n�vel de carreira. J� vi muitos gatunos irem e virem, incapazes de atender aos requisitos para o 3� avan�o de carreira. E voc�? Est� #Gpronto:pronta# para tentar o teste e subir para o 3� n�vel de carreira?" );
					if ( nRet == 0 ) self.say( "N�o creio que voc� esteja #Gpronto:pronta# para encarar os desafios que est�o por vir. Venha me ver somente quando convencer a si mesmo de que est� #Gpronto:pronta# para encarar os desafios que v�m junto com o seu avan�o." );
					else {
						qr.set( 7500, "s" );
						self.say( "Bom. Voc� ser� #Gtestado:testada# em dois aspectos importantes para os gatunos: for�a e sabedoria. Vou lhe explicar agora a parte f�sica do teste. Lembra-se do #b#p1052001##k da Cidade das Contas? V� at� ele e ou�a sua explica��o sobre a primeira parte do teste. Conclua a miss�o e receba #b#t4031057##k do #p1052001#." );
						self.say( "A por��o mental do teste come�ar� somente quando voc� passar da parte f�sica. #b#t4031057##k ser� a prova de que voc� passou no teste. Vou informar o #b#p1052001##k que voc� est� indo at� ele. Fique preparado. N�o ser� f�cil, mas tenho muita f� em voc�. Boa sorte!" );
					}
				}
				else if ( val == 1 and ( info == "s" or info == "p1" ) ) self.say( "Voc� n�o tem #b#t4031057##k com voc�. V� ver o #b#p1052001##k da Cidade das Contas, passe no teste e traga #b#t4031057##k com voc�. Somente ent�o voc� poder� fazer o segundo teste. Boa sorte para voc�." );
				else if ( val == 1 and info == "p2" ) {
					if ( inventory.itemCount( 4031057 ) >= 1 ) {
						self.say( "Parab�ns por ter completado a parte f�sica do teste. Eu sabia que voc� conseguiria. Agora que voc� passou na primeira parte do teste, poder� fazer a segunda parte. D�-me o colar primeiro." );
						ret = inventory.exchange( 0, 4031057, -1 );
						if ( ret == 0 ) self.say( "Tem certeza de que possui #b#t4031057##k do #b#p1052001##k? N�o se esque�a de deixar um espa�o no seu invent�rio de Etc." );
						else {
							qr.set( 7500, "end1" );
							self.say( "Aqui est� a 2� parte do teste. Este teste determinar� se voc� � #Gesperto:esperta# o suficiente para dar o pr�ximo passo em dire��o � grandiosidade. Existe uma �rea sombria e coberta de neve chamada de Solo Sagrado no campo de neve em Ossyria. Nem mesmo os monstros conseguem chegar at� l�. Na por��o central da regi�o, existe uma pedra gigante chamada de Pedra Sagrada. Voc� ter� de oferecer um item especial como sacrif�cio. A Pedra Sagrada testar� sua sabedoria l� mesmo." );
							self.say( "Voc� ter� de responder a todas as perguntas com honestidade e convic��o. Se voc� responder a tudo corretamente, a Pedra Sagrada o aceitar� formalmente e lhe entregar� #b#t4031058##k. Traga o colar de volta e eu ajudarei voc� a dar o pr�ximo passo. Boa sorte!" );
						}
					}
					else self.say( "Voc� n�o tem #b#t4031057##k com voc�. V� ver o #b#p1052001##k da Cidade das Contas, passe no teste e traga #b#t4031057##k com voc�. Somente ent�o voc� passar� na primeira parte do teste. Boa sorte!" );
				}
				else if ( val == 1 and info == "end1" ) {
					if ( inventory.itemCount( 4031058 ) >= 1 ) {
						self.say( "Parab�ns por ter completado a parte mental do teste. Voc� respondeu a todas as perguntas corretamente e com sabedoria. Devo dizer que estou bastante impressionado com o n�vel de sabedoria que voc� demonstrou. Entregue-me o colar primeiro, antes de darmos o pr�ximo passo." );
						ret = inventory.exchange( 0, 4031058, -1 );
						if ( ret == 0 ) self.say( "Tem certeza de que possui #b#t4031058##k concedido pela Pedra Sagrada? Se tiver certeza, n�o se esque�a de deixar um espa�o no seu invent�rio de Etc." );
						else {
							qr.setComplete( 7500 );
							changeJob4( cJob );
						}
					}
					else self.say( "Voc� n�o tem #b#t4031058##k com voc�. Encontre a �rea sombria e coberta de neve chamada de Solo Sagrado no campo de neve em Ossyria, ofere�a um Cristal Negro como sacrif�cio e responda a todas as perguntas com honestidade e convic��o para receber #b#t4031058##k. Traga isso de volta para mim para concluir o teste do 3� n�vel de carreira. Boa sorte para voc�..." );
				}
				else if ( val == 2 ) changeJob4( cJob );
			}
			else if ( cJob == 411 ) self.say( "Foi voc� quem passou nos testes para subir para o 3� n�vel de carreira. Como � a vida de um #bAndarilho#k? Voc� ter� de continuar treinando conforme realiza sua jornada por este lugar. Ossyria est� cheia de monstros poderosos que nem mesmo eu conhe�o. Se tiver alguma d�vida, v� falar comigo no fim desta estrada. Desejo-lhe boa sorte." );
			else if ( cJob == 421 ) self.say( "Foi voc� quem passou nos testes para subir para o 3� n�vel de carreira. Como � a vida de um #bMestre Arruaceiro#k? Voc� ter� de continuar treinando conforme realiza sua jornada por este lugar. Ossyria est� cheia de monstros poderosos que nem mesmo eu conhe�o. Se tiver alguma d�vida, v� falar comigo no fim desta estrada. Desejo-lhe boa sorte." );
			else if ( cJob == 412 ) self.say( "Foi voc� quem conseguiu se tornar o mais forte dos Gatunos. Voc� ter� de servir de exemplo para todos como #bAlgoz#k. Ainda existem muitos segredos neste mundo. O poder de Gatunos como voc� ser� de grande ajuda. Por isso, continue treinando." );
			else if ( cJob == 422 ) self.say( "Foi voc� quem conseguiu se tornar o mais forte dos Gatunos. Voc� ter� de servir de exemplo para todos como #bDesordeiro#k. Ainda existem muito segredos neste mundo. O poder de Gatunos como voc� ser� de grande ajuda. Por isso, continue treinando." );
			else self.say( "Sou #bArec#k, o chefe de todos os ladr�es, pronto para compartilhar meu conhecimento sobre as ruas e falar sobre a minha vida dif�cil para aqueles que quiserem me ouvir. Mas voc� n�o se parece com um gatuno. N�o posso compartilhar meu conhecimento com voc�. Esta sala est� cheia de chefes com suas respectivas classes. Se precisar de alguma coisa, v� falar com um deles." );
		}
		else self.say( "Voc� ainda n�o est� #Gqualificado:qualificada# para subir para o 3� n�vel de carreira. Voc� precisa ter no m�nimo n�vel 70 para isso. Treine mais e depois venha me ver." );
	}
	else if ( nRet == 1 ) {
		val2 = qr.get( 7000 );

		if ( val2 == "" ) {
			if ( cLevel >= 50 ) {
				if ( cJob >= 400 ) {
					qr.set( 7000, "s");
					self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum, certo? Deve ser #b#p2030008##k... ok, certo! Tenho certeza de que voc� ficar� bem na masmorra. Espero que tome cuidado por l�..." );
				}
				else self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum. Sinto muito, mas voc� n�o parece um gatuno. V� procurar o chefe da sua profiss�o." );
			}
			else self.say( "Voc� quer permiss�o para realizar a Miss�o da Masmorra de Zakum. Sinto muito, mas a masmorra � muito dif�cil para voc�. Voc� deve ter no m�nimo n�vel 50 para pelo menos tentar... treine mais e depois volte aqui." );
		}
		else self.say( "Como voc� est� se saindo na Miss�o da Masmorra de Zakum? Ouvi falar que existe um monstro incr�vel nas profundezas desse lugar... de qualquer forma, boa sorte. Tenho certeza de que voc� vai conseguir." );
	}
	else self.say( "Em constru��o... em breve..." );
}

// The door of dimension
script "crack" {
	field = self.field;
	qr = target.questRecord;
	val = qr.get( 7500 );
	cJob = target.nJob;

	// moving the warrior
	if ( field.id == 105070001 ) {
		if ( val == "p1" and ( cJob == 110 or cJob == 120 or cJob == 130 ) ) {
			setParty = FieldSet( "ThirdJob1" );
			res = setParty.enter( target.nCharacterID, 0 );
			if ( res != 0 ) self.say( "J� existe algu�m lutando com o clone do #b#p1022000##k. Volte mais tarde." );
		}
		else self.say( "Parece que existe uma porta que me levar� a outra dimens�o, mas n�o consigo entrar por algum motivo." );
	}
	// moving the magician
	else if ( field.id == 100040106 ) {
		if ( val == "p1" and ( cJob == 210 or cJob == 220 or cJob == 230 ) ) {
			setParty = FieldSet( "ThirdJob2" );
			res = setParty.enter( target.nCharacterID, 0 );
			if ( res != 0 ) self.say( "J� existe algu�m lutando com o clone de #b#p1032001##k. Volte mais tarde." );
		}
		else self.say( "Parece que existe uma porta que me levar� a outra dimens�o, mas n�o consigo entrar por algum motivo." );
	}
	// moving the bowman
	else if ( field.id == 105040305 ) {
		if ( val == "p1" and ( cJob == 310 or cJob == 320 ) ) {
			setParty = FieldSet( "ThirdJob3" );
			res = setParty.enter( target.nCharacterID, 0 );
			if ( res != 0 ) self.say( "J� existe algu�m lutando com o clone de #b#p1012100##k. Volte mais tarde." );
		}
		else self.say( "Parece que existe uma porta que me levar� a outra dimens�o, mas n�o consigo entrar por algum motivo." );
	}
	else if ( field.id == 107000402 ) {
		if ( val == "p1" and ( cJob == 410 or cJob == 420 ) ) {
			setParty = FieldSet( "ThirdJob4" );
			res = setParty.enter( target.nCharacterID, 0 );
			if ( res != 0 ) self.say( "J� existe algu�m lutando com o clone do #b#p1052001##k. Volte mais tarde." );
		}
		else self.say( "Parece que existe uma porta que me levar� a outra dimens�o, mas n�o consigo entrar por algum motivo." );
	}
	else self.say( "Parece que existe uma porta que me levar� a outra dimens�o, mas n�o consigo entrar por algum motivo." );
}

// Getting out of the Other Dimension
script "3jobExit" {
	field = self.field;

	nRet = self.askYesNo( "Voc� pode usar o Cristal Brilhante para voltar ao mundo real. Tem certeza de que deseja voltar?" );
	if ( nRet != 0 ) {
		if ( field.id == 108010301 ) registerTransferField( 102000000, "" );
		else if ( field.id == 108010201 ) registerTransferField( 101000000, "" );
		else if ( field.id == 108010101 ) registerTransferField( 100000000, "" );
		else if ( field.id == 108010401 ) registerTransferField( 103000000, "" );
	}
}

// The questioning function
function wizQuestion( integer index ) {
	if ( index == 1 ) {
		v1 = self.askMenu( "Aqui vai a 1� pergunta. Que NPC voc� N�O ver� em Henesys na Ilha Victoria ...?#b\r\n#L0# #p1012101##l\r\n#L1# #p1002001##l\r\n#L2# #p1010100##l\r\n#L3# #p1012100##l\r\n#L4# #p1012102##l" );
		if ( v1 == 0 or v1 == 2 or v1 == 3 or v1 == 4 ) self.say( "Errado...\r\nComece de novo..." );
		else if ( v1 == 1 ) {
			v2 = self.askMenu( "Aqui vai a 2� pergunta. Qual dos monstros a seguir voc� N�O ver� na Ilha Maple ...?#b\r\n#L0# #o100101##l\r\n#L1# #o1210102##l\r\n#L2# #o130101##l\r\n#L3# #o1210100##l\r\n#L4# #o120100##l" );
			if ( v2 == 0 or v2 == 1 or v2 == 2 or v2 == 4 ) self.say( "Errado...\r\nComece de novo..." );
			else if ( v2 == 3 ) {
				v3 = self.askMenu( "Aqui vai a 3� pergunta. Qual dos itens a seguir Maya pediu para curar sua doen�a ...?#b\r\n#L0# Rem�dio incr�vel#l\r\n#L1# Rem�dio ruim#l\r\n#L2# O rem�dio que tudo cura#l\r\n#L3# Rem�dio chin�s#l\r\n#L4# #t4031006##l" );
				if ( v3 == 0 or v3 == 1 or v3 == 2 or v3 == 3 ) self.say( "Errado...\r\nComece de novo..." );
				else if ( v3 == 4 ) {
					v4 = self.askMenu( "Aqui vai a 4� pergunta. Qual das cidades a seguir N�O faz parte da Ilha Victoria ...?#b\r\n#L0# Selva do Sono#l\r\n#L1# Amherst#l\r\n#L2# Perion#l\r\n#L3# Cidade das Contas#l\r\n#L4# Ellinia#l" );
					if ( v4 == 0 or v4 == 2 or v4 == 3 or v4 == 4 ) self.say( "Errado...\r\nComece de novo..." );
					else if ( v4 == 1 ) {
						v5 = self.askMenu( "Aqui vai a 5� pergunta. Que monstro voc� N�O encontrar� no t�nel de formigas na masmorra central da Ilha Victoria ...?#b\r\n#L0# #o2110200##l\r\n#L1# #o2230100##l\r\n#L2# #o5130100##l\r\n#L3# #o2230101##l\r\n#L4# #o3000000##l" );
						if ( v5 == 0 or v5 == 1 or v5 == 2 or v5 == 3 ) self.say( "Errado...\r\nComece de novo..." );
						else if ( v5 == 4 ) {
							self.say( "Muito bem. Todas as suas respostas foram corretas...\r\nSua sabedoria foi comprovada.\r\nPegue este colar e volte para l�..." );
							inventory = target.inventory;
							ret = inventory.exchange( 0, 4031058, 1 );
							if ( ret == 0 ) self.say( "Seu invent�rio de Etc. est� cheio...?" );
						}
					}
				}
			}
		}
	}
	else if ( index == 2 ) {
		v1 = self.askMenu( "Aqui vai a 1� pergunta. Qual par de monstro/sobra est� correto ...?#b\r\n#L0# #o3210100# - Nariz do Javali de Fogo#l\r\n#L1# #o4230100# - Olho do Olho �rtico#l\r\n#L2# #o1210100# - Orelha de Porco#l\r\n#L3# #o2300100# - #t4000042##l\r\n#L4# #o2230101# - Chap�u-de-sol do Cogumelo Zumbi#l" );
		if ( v1 == 0 or v1 == 1 or v1 == 2 or v1 == 4 ) self.say( "Errado...\r\nComece de novo..." );
		else if ( v1 == 3 ) {
			v2 = self.askMenu( "Aqui vai a 2� pergunta. Que NPC voc� N�O ver� em Perion na Ilha Victoria ...?#b\r\n#L0# #p1021100##l\r\n#L1# #p1032002##l\r\n#L2# #p1022002##l\r\n#L3# #p1022003##l\r\n#L4# #p1022100##l" );
			if ( v2 == 0 or v2 == 2 or v2 == 3 or v2 == 4 ) self.say( "Errado...\r\nComece de novo..." );
			else if ( v2 == 1 ) {
				v3 = self.askMenu( "Aqui vai a 3� pergunta. Qual dos NPCs a seguir � o pai de Alex, o garoto fugitivo, que voc� ver� na Cidade das Contas ...?#b\r\n#L0# #p1012005##l\r\n#L1# #p1012002##l\r\n#L2# #p12000##l\r\n#L3# #p20000##l\r\n#L4# #p1012003##l" );
				if ( v3 == 0 or v3 == 1 or v3 == 2 or v3 == 3 ) self.say( "Errado...\r\nComece de novo..." );
				else if ( v3 == 4 ) {
					v4 = self.askMenu( "Aqui vai a 4� pergunta. Qual dos itens a seguir voc� receber� do NPC ap�s juntar 30 Bolinhas de Gude Negras durante o teste para o 2� avan�o de carreira ...?#b\r\n#L0# #t4031012##l\r\n#L1# Colar do Her�i#l\r\n#L2# Pingente do Her�i#l\r\n#L3# Medalha do Her�i#l\r\n#L4# Marca do Her�i#l" );
					if ( v4 == 1 or v4 == 2 or v4 == 3 or v4 == 4 ) self.say( "Errado...\r\nComece de novo..." );
					else if ( v4 == 0 ) {
						v5 = self.askMenu( "Aqui vai a 5� pergunta. Qual par de carreira/estat�stica necess�ria corresponde ao 1� avan�o de carreira...?#b\r\n#L0# Guerreiro - FOR 30+#l\r\n#L1# Bruxo - INT 25+#l\r\n#L2# Arqueiro - DES 25+#l\r\n#L3# Gatuno - DES 20+#l\r\n#L4# Gatuno - SOR 20+#l" );
						if ( v5 == 0 or v5 == 1 or v5 == 3 or v5 == 4 ) self.say( "Errado...\r\nComece de novo..." );
						else if ( v5 == 2 ) {
							self.say( "Muito bem. Todas as suas respostas foram corretas...\r\nSua sabedoria foi comprovada.\r\nPegue este colar e volte para l�..." );
							inventory = target.inventory;
							ret = inventory.exchange( 0, 4031058, 1 );
							if ( ret == 0 ) self.say( "Seu invent�rio de Etc. est� cheio...?" );
						}
					}
				}
			}
		}
	}
	else if ( index == 3 ) {
		v1 = self.askMenu( "Aqui vai a 1� pergunta. Que NPC voc� ver� PRIMEIRO em MapleStory ...?#b\r\n#L0# #p2000##l\r\n#L1# #p1010100##l\r\n#L2# #p2102##l\r\n#L3# #p2001##l\r\n#L4# #p2101##l" );
		if ( v1 == 0 or v1 == 1 or v1 == 2 or v1 == 3 ) self.say( "Errado...\r\nComece de novo..." );
		else if ( v1 == 4 ) {
			v2 = self.askMenu( "Aqui vai a 2� pergunta. Quantos pontos de EXP s�o necess�rios para ir do n�vel 1 ao 2 ...?#b\r\n#L0# 10#l\r\n#L1# 15#l\r\n#L2# 20#l\r\n#L3# 25#l\r\n#L4# 30#l" );
			if ( v2 == 0 or v2 == 2 or v2 == 3 or v2 == 4 ) self.say( "Errado...\r\nComece de novo..." );
			else if ( v2 == 1 ) {
				v3 = self.askMenu( "Aqui vai a 3� pergunta. Que NPC voc� N�O ver� em El Nath em Ossyria ...?#b\r\n#L0# #p2020000##l\r\n#L1# #p2020003##l\r\n#L2# #p2012010##l\r\n#L3# #p2020006##l\r\n#L4# #p2020007##l" );
				if ( v3 == 0 or v3 == 1 or v3 == 3 or v3 == 4 ) self.say( "Errado...\r\nComece de novo..." );
				else if ( v3 == 2 ) {
					v4 = self.askMenu( "Aqui vai a 4� pergunta. Qual das carreiras a seguir voc� N�O poder� adquirir ap�s o 2� n�vel de carreira ...?#b\r\n#L0# Escudeiro#l\r\n#L1# Mercen�rio#l\r\n#L2# Arruaceiro#l\r\n#L3# Cl�rigo#l\r\n#L4# Mago#l" );
					if ( v4 == 0 or v4 == 1 or v4 == 2 or v4 == 3 ) self.say( "Errado...\r\nComece de novo..." );
					else if ( v4 == 4 ) {
						v5 = self.askMenu( "Aqui vai a 5� pergunta. Qual miss�o pode ser feita novamente ...?#b\r\n#L0# Maya e o Rem�dio Estranho#l\r\n#L1# Alex, o Garoto Fugitivo#l\r\n#L2# Pia e o Cogumelo Azul#l\r\n#L3# Arwen e os Sapatos de Vidro#l\r\n#L4# Rede de Comunica��o do Pelot�o Alfa#l" );
						// DEBUG
						if ( v5 == 0 or v5 == 1 or v5 == 2 or v5 == 4 ) self.say( "Errado...\r\nComece de novo..." );
						else if ( v5 == 3 ) {
							self.say( "Muito bem. Todas as suas respostas foram corretas...\r\nSua sabedoria foi comprovada.\r\nPegue este colar e volte para l�..." );
							inventory = target.inventory;
							ret = inventory.exchange( 0, 4031058, 1 );
							if ( ret == 0 ) self.say( "Seu invent�rio de Etc. est� cheio...?" );
						}
					}
				}
			}
		}
	}
	else if ( index == 4 ) {
		v1 = self.askMenu( "Aqui vai a 1� pergunta. Que NPC N�O faz parte do Pelot�o Alfa de Ossyria ...?#b\r\n#L0# Sargento Peter#l\r\n#L1# #p2010000##l\r\n#L2# #p2020003##l\r\n#L3# #p2030002##l\r\n#L4# #p2030001##l" );
		if ( v1 == 1 or v1 == 2 or v1 == 3 or v1 == 4 ) self.say( "Errado...\r\nComece de novo..." );
		else if ( v1 == 0 ) {
			v2 = self.askMenu( "Aqui vai a 2� pergunta. Qual dos itens a seguir N�O � necess�rio para despertar o velho Gl�dio tirado de Manji de Perion ...?#b\r\n#L0# #t4003002##l\r\n#L1# #t4021009##l\r\n#L2# #t4001006##l\r\n#L3# #t4003003##l\r\n#L4# #t4001005##l" );
			if ( v2 == 0 or v2 == 1 or v2 == 2 or v2 == 4 ) self.say( "Errado...\r\nComece de novo..." );
			else if ( v2 == 3 ) {
				v3 = self.askMenu( "Aqui vai a 3� pergunta. Que NPC voc� N�O ver� na Cidade das Contas na Ilha Victoria ...?#b\r\n#L0# #p1052002##l\r\n#L1# #p1052102##l\r\n#L2# #p1052012##l\r\n#L3# #p1052100##l\r\n#L4# #p1040000##l" );
				if ( v3 == 0 or v3 == 1 or v3 == 2 or v3 == 3 ) self.say( "Errado...\r\nComece de novo..." );
				else if ( v3 == 4 ) {
					v4 = self.askMenu( "Aqui vai a 4� pergunta. Qual par de monstro/sobra N�O est� correto ...?#b\r\n#L0# #o3230200# - #t4000059##l\r\n#L1# #o4230105# - Folha de Planta Carn�vora#l\r\n#L2# #o6130101# - #t4000040##l\r\n#L3# #o6130103# - #t4000050##l\r\n#L4# #o3210800# - #t4000029##l" );
					if ( v4 == 0 or v4 == 2 or v4 == 3 or v4 == 4 ) self.say( "Errado...\r\nComece de novo..." );
					else if ( v4 == 1 ) {
						v5 = self.askMenu( "Aqui vai a 5� pergunta. Qual dos monstros a seguir voa no ar...?#b\r\n#L0# #o5130104##l\r\n#L1# #o4230105##l\r\n#L2# #o4230103##l\r\n#L3# #o4130101##l\r\n#L4# #o5300100##l" );
						if ( v5 == 0 or v5 == 1 or v5 == 2 or v5 == 3 ) self.say( "Errado...\r\nComece de novo..." );
						else if ( v5 == 4 ) {
							self.say( "Muito bem. Todas as suas respostas foram corretas...\r\nSua sabedoria foi comprovada.\r\nPegue este colar e volte para l�..." );
							inventory = target.inventory;
							ret = inventory.exchange( 0, 4031058, 1 );
							if ( ret == 0 ) self.say( "Seu invent�rio de Etc. est� cheio...?" );
						}
					}
				}
			}
		}
	}
	else if ( index == 5 ) {
		v1 = self.askMenu( "Aqui vai a 1� pergunta. Qual par de doen�a/resultado desencadeado por um ataque de monstro N�O est� correto...?#b\r\n#L0# Estado de escurid�o � redu��o da precis�o#l\r\n#L1# Estado de maldi��o � diminui EXP ganha#l\r\n#L2# Estado de fraqueza � redu��o da velocidade#l\r\n#L3# Estado de aprisionamento � incapaz de usar per�cias#l\r\n#L4# Estado de envenenamento � redu��o lenta em HP#l" );
		if ( v1 == 0 or v1 == 1 or v1 == 3 or v1 == 4 ) self.say( "Errado...\r\nComece de novo..." );
		else if ( v1 == 2 ) {
			v2 = self.askMenu( "Aqui vai a 2� pergunta. Que NPC voc� N�O ver� em Orbis em Ossyria ...?#b\r\n#L0# #p2010000##l\r\n#L1# #p1022100##l\r\n#L2# #p2010003##l\r\n#L3# #p2012004##l\r\n#L4# #p2012005##l" );
			if ( v2 == 0 or v2 == 2 or v2 == 3 or v2 == 4 ) self.say( "Errado...\r\nComece de novo..." );
			else if ( v2 == 1 ) {
				v3 = self.askMenu( "Aqui vai a 3� pergunta. Qual das miss�es a seguir exige o maior n�vel para ser iniciada...?#b\r\n#L0# Velho Gl�dio de Manji#l\r\n#L1# Luke, o Guardi�o que Queria Viajar#l\r\n#L2# Procurando o Livro Antigo...#l\r\n#L3# Alcaster e o Cristal Negro#l\r\n#L4# Rede de Comunica��o do Pelot�o Alfa #l" );
				if ( v3 == 0 or v3 == 1 or v3 == 2 or v3 == 4 ) self.say( "Errado...\r\nComece de novo..." );
				else if ( v3 == 3 ) {
					v4 = self.askMenu( "Aqui vai a 4� pergunta. Que NPC n�o tem NADA a ver com o refinamento, aperfei�oamento e fabrica��o de itens...?#b\r\n#L0# #p2010003##l\r\n#L1# #p1022003##l\r\n#L2# #p1032003##l\r\n#L3# #p1032002##l\r\n#L4# #p2020000##l" );
					if ( v4 == 0 or v4 == 1 or v4 == 3 or v4 == 4 ) self.say( "Errado...\r\nComece de novo..." );
					else if ( v4 == 2 ) {
						v5 = self.askMenu( "Aqui vai a 5� pergunta. Em MapleStory, qual par de po��o/resultado est� correto?#b\r\n#L0# #t2000001# - Recupera 200 HP#l\r\n#L1# #t2001001# - Recupera 2000 MP#l\r\n#L2# #t2010004# - Recupera 100 MP#l\r\n#L3# #t2020001# - Recupera 300 HP#l\r\n#L4# #t2020003# - Recupera 400 HP#l" );
						if ( v5 == 0 or v5 == 1 or v5 == 2 or v5 == 3 ) self.say( "Errado...\r\nComece de novo..." );
						else if ( v5 == 4 ) {
							self.say( "Muito bem. Todas as suas respostas foram corretas...\r\nSua sabedoria foi comprovada.\r\nPegue este colar e volte para l�..." );
							inventory = target.inventory;
							ret = inventory.exchange( 0, 4031058, 1 );
							if ( ret == 0 ) self.say( "Seu invent�rio de Etc. est� cheio...?" );
						}
					}
				}
			}
		}
	}
	else if ( index == 6 ) {
		v1 = self.askMenu( "Aqui vai a 1� pergunta. Que NPC voc� N�O ver� em Ellinia na Ilha Victoria...?#b\r\n#L0# #p1032003##l\r\n#L1# #p1032002##l\r\n#L2# #p1032001##l\r\n#L3# #p1032100##l\r\n#L4# #p1081101##l" );
		if ( v1 == 0 or v1 == 1 or v1 == 2 or v1 == 3 ) self.say( "Errado...\r\nComece de novo..." );
		else if ( v1 == 4 ) {
			v2 = self.askMenu( "Aqui vai a 2� pergunta. Que monstro voc� N�O enfrentar� em Ossyria ...?#b\r\n#L0# #o5140000##l\r\n#L1# #o5130103##l\r\n#L2# #o6300000##l\r\n#L3# #o8140000##l\r\n#L4# #o5120000##l" );
			if ( v2 == 0 or v2 == 2 or v2 == 3 or v2 == 4 ) self.say( "Errado...\r\nComece de novo..." );
			else if ( v2 == 1 ) {
				v3 = self.askMenu( "Aqui vai a 3� pergunta. Que monstro possui o maior n�vel...?#b\r\n#L0# #o1120100##l\r\n#L1# #o1210101##l\r\n#L2# #o1110100##l\r\n#L3# #o1130100##l\r\n#L4# #o1210103##l" );
				if ( v3 == 0 or v3 == 1 or v3 == 2 or v3 == 4 ) self.say( "Errado...\r\nComece de novo..." );
				else if ( v3 == 3 ) {
					v4 = self.askMenu( "Aqui vai a 4� pergunta. Em MapleStory, qual par de po��o/resultado n�o est� correto...?#b\r\n#L0# #t2050003# - Recupera o estado de maldi��o ou aprisionamento#l\r\n#L1# #t2020014# - Recupera 3000 MP#l\r\n#L2# #t2020004# - Recupera 400 HP#l\r\n#L3# #t2020000# - Recupera 200 MP#l\r\n#L4# #t2000003# - Recupera 100 MP#l" );
					if ( v4 == 0 or v4 == 2 or v4 == 3 or v4 == 4 ) self.say( "Errado...\r\nComece de novo..." );
					else if ( v4 == 1 ) {
						v5 = self.askMenu( "Aqui vai a 5� pergunta. Que NPC N�O tem nada a ver com bichos de estima��o ...?#b\r\n#L0# #p1012005##l\r\n#L1# #p1032102##l\r\n#L2# #p1012007##l\r\n#L3# #p1012002##l\r\n#L4# #p1012004##l" );
						if ( v5 == 0 or v5 == 1 or v5 == 2 or v5 == 4 ) self.say( "Errado...\r\nComece de novo..." );
						else if ( v5 == 3 ) {
							self.say( "Muito bem. Todas as suas respostas foram corretas...\r\nSua sabedoria foi comprovada.\r\nPegue este colar e volte para l�..." );
							inventory = target.inventory;
							ret = inventory.exchange( 0, 4031058, 1 );
							if ( ret == 0 ) self.say( "Seu invent�rio de Etc. est� cheio...?" );
						}
					}
				}
			}
		}
	}
}

// The Holy Land
script "holyStone" {
	qr = target.questRecord;
	val = qr.get( 7500 );

	if ( val == "end1" ) {
		nRet = self.askYesNo( "... ... ...\r\nSe voc� quiser testar sua sabedoria, ter� de oferecer #b#t4005004##k como sacrif�cio...\r\nEst� #Gpronto:pronta# para oferecer #t4005004# e responder �s minhas perguntas?" );
		if ( nRet == 0 ) self.say( "Volte quando estiver preparado." );
		else {
			inventory = target.inventory;
			if ( inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) {
				if ( inventory.itemCount( 4031058 ) >= 1 ) self.say( "Voc� j� tem #b#t4031058##k com voc�...\r\nPegue o colar e volte para l�..." );
				else {
					ret = inventory.exchange( 0, 4005004, -1 );
					if ( ret == 0 ) self.say( "Se voc� quiser testar sua sabedoria, ter� de oferecer #b#t4005004##k como sacrif�cio." );
					else {
						self.say( "Certo... Vou testar sua sabedoria agora. Responda a todas as perguntas corretamente para passar no teste. MAS, se voc� mentir para mim uma �nica vez, ter� de come�ar tudo de novo... ok, vamos l�." );
						rnum = random( 1, 6 );
						if ( rnum == 1 ) wizQuestion( 1 );
						else if ( rnum == 2 ) wizQuestion( 2 );
						else if ( rnum == 3 ) wizQuestion( 3 );
						else if ( rnum == 4 ) wizQuestion( 4 );
						else if ( rnum == 5 ) wizQuestion( 5 );
						else if ( rnum == 6 ) wizQuestion( 6 );
					}
				}
			}
			else self.say( "Seu invent�rio de Etc. est� cheio... arranje espa�o nele ou n�o poder� fazer o teste. Ap�s fazer os ajustes, tente novamente..." );
		}
	}
}

