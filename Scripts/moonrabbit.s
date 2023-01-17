module "standard.s";


function moonrabbit_takeawayitem {
	inven = target.inventory;

	nItem = inven.itemCount( 4001095 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001095, -nItem );

	nItem = inven.itemCount( 4001096 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001096, -nItem );

	nItem = inven.itemCount( 4001097 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001097, -nItem );

	nItem = inven.itemCount( 4001098 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001098, -nItem );

	nItem = inven.itemCount( 4001099 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001099, -nItem );

	nItem = inven.itemCount( 4001100 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001100, -nItem );

	nItem = inven.itemCount( 4001101 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001101, -nItem );

	return;
}

script "moonrabbit" {

	cTime = currentTime;

	esTime = compareTime( cTime, "07/08/23/00/00" );
	
	if ( esTime < 0 ) self.say( "Oi! Meu nome � Tory. Este lugar est� repleto da misteriosa aura da lua cheia e ningu�m pode passar deste ponto. Sugiro que voc� volte na hora certa." );
	
	else {
		
		field = self.field;

		if ( field.id == 100000200 ) {
			if ( target.isPartyBoss != 1 ) {
				self.say( "Oi! Sou Tory. Este lugar est� repleto da misteriosa aura da lua cheia e ningu�m pode entrar #Gsozinho:sozinha#." );
				self.say( "Se voc� quiser entrar aqui, o l�der do seu grupo precisa conversar comigo. Converse com o l�der sobre isso." );
				end;
			} else {
				self.say( "Oi! Sou Tory. Aqui dentro tem uma linda montanha onde as pr�mulas florescem. Existe um tigre que vive na montanha, o Growlie, e que parece estar procurando algo para comer." );
				v0 = self.askMenu( "Voc� gostaria de seguir para a montanha das pr�mulas e unir for�as com seu grupo para ajudar o Growlie?\r\n#b#L0# Sim, eu vou.#l" );
			}

			if ( v0 == 0 ) {
				setParty = FieldSet( "MoonRabbit" );
				res = setParty.enter( target.nCharacterID, 0 );
				if ( res == -1 ) self.say( "Tenho motivos para n�o poder deixar voc� entrar. Por favor, tente mais tarde." );
				else if ( res == 1 ) self.say( "Ol�! Sou Tory. Este lugar est� repleto da misteriosa aura da lua cheia e ningu�m pode entrar #Gsozinho:sozinha#. Se voc� deseja entrar, o #bl�der do grupo#k precisa falar comigo." );
				else if ( res == 2 ) self.say( "Desculpe, mas o grupo do qual voc� faz parte N�O tem o m�nimo de 3 membros. Por favor, fa�a um grupo de no m�nimo 3 membros de N�vel 10 ou maior. Avise-me quando estiver pronto." );
				else if ( res == 3 ) self.say( "Desculpe, mas algu�m no seu grupo est� abaixo do N�vel 10. Acerte seu grupo para consistir no m�nimo de 3 membros em que todos sejam N�vel 10 ou maior. Avise-me quando estiver pronto." );
				else if ( res == 4 ) self.say( "Desculpe, mas existe outro grupo l� dentro terminando a miss�o. Por favor, fale comigo daqui a pouco." );
				else {
					moonrabbit_takeawayitem;
				}
			}
		} else if ( field.id == 910010100 ) {
			v1 = self.askMenu( "Agradeceria se voc� pegasse um bolinho de arroz para o Growlie faminto. Parece que voc� n�o tem mais nada para fazer aqui. Gostaria de sair deste lugar? \r\n#b#L0# Sim. Por favor, tire-me daqui.#l" );
			if ( v1 == 0 ) {
				moonrabbit_takeawayitem;
				registerTransferField( 100000200, "" );
			}
		} else if ( field.id == 910010400 ) {
			v0 = self.askMenu( "Pessoal, voc�s j� terminaram de espantar esses porcos? Parece que voc� n�o tem mais nada para fazer aqui. Gostaria de sair deste lugar? \r\n#b#L0# Sim, eu gostaria de sair daqui.#l" );
			if ( v0 == 0 ) {				
				moonrabbit_takeawayitem;
				registerTransferField( 100000200, "" );
			}
		} 
	}
}

//���ʽ� �� ����
script "moonrabbit_bonus" {
	field = self.field;

	if ( field.id == 910010100 ) {
		self.say( "Ol�! Eu sou Tommy. Existe uma Cidade dos Porcos aqui perto. Os porcos de l� s�o brig�es e incontrol�veis a ponto de roubarem v�rias armas dos viajantes. Eles foram expulsos da cidade e no momento est�o escondidos na Cidade dos Porcos." );
		if ( target.isPartyBoss == 1 ) {
			v0 = self.askMenu( "O que voc� acha de ir at� l� com seu grupo e ensinar �queles porcos arruaceiros uma li��o?\r\n#b#L0# Sim, isto parece �timo! Leve-me at� l�!" );
			if ( v0 == 0 ) {
				setParty = FieldSet( "MoonPig" );
				res = setParty.enter( target.nCharacterID, 0 );
				if ( res == -1 ) self.say( "Tenho motivos para n�o deixar voc� entrar. Por favor, tente mais tarde." );
				else if ( res == 1 ) self.say( "Voc� n�o pode entrar aqui #Gsozinho:sozinha# Para entrar aqui, o #bl�der do grupo#k precisa vir falar comigo." );
				else if ( res == 2 ) self.say( "Desculpe, mas o grupo do qual voc� faz parte N�O tem o m�nimo de 3 membros. Seu grupo precisa ter no m�nimo 3 membros de N�vel 10 ou maior." );
				else if ( res == 3 ) self.say( "Desculpe, mas algu�m no seu grupo est� abaixo do N�vel 10. Seu grupo precisa consistir no m�nimo de 3 membros em que todos sejam N�vel 10 ou maior." );
				else if ( res == 4 ) self.say( "Desculpe, mas existe outro grupo l� dentro terminando a miss�o. Por favor, fale comigo daqui a pouco." );
			}
		} else {
			self.say( "Se realmente desejar ensinar uma li��o a esses porcos, entre no local atrav�s do l�der do seu grupo." );
			end;
		}
	} else if ( field.id == 910010200 ) {
		v1 = self.askMenu( "Gostaria de parar de ca�ar e sair deste lugar? \r\n#b#L0# Sim. Gostaria de sair deste lugar.#l" );
		if ( v1 == 0 ) {
			registerTransferField( 910010400, "st00" );
		}
	} else if ( field.id == 910010300 ) {
		v1 = self.askMenu( "Acho que voc� j� terminou por aqui. Gostaria de sair deste lugar? \r\n#b#L0# Sim. Gostaria de sair deste lugar.#l" );
		if ( v1 == 0 ) {
			moonrabbit_takeawayitem;
			registerTransferField( 100000200, "" );
		}
	}
}

script "moonrabbit_tiger" {
	quest = FieldSet( "MoonRabbit" );

	if ( quest.getVar( "clear" ) == "1" ) {
		if ( target.isPartyBoss == 1 ) {
			self.say( "� s� me procurar para mais! #b#t4001101##k. Fa�a uma boa viagem!" );
			quest.transferFieldAll( 910010100, "st00" );
			end;
		} else {
			self.say( "Por favor, avance com o l�der do grupo." );
			end;
		}
	}

	if ( target.isPartyBoss != 1 ) {
		v0 = self.askMenu( "Rosno! Eu sou Growlie e estou sempre pronto para proteger este local. O que traz voc� aqui?\r\n#b#L0# Por favor, conte-me sobre este lugar.#l\r\n#L2# Eu gostaria de sair daqui.#l" );
	} else {
		v0 = self.askMenu( "Rosno! Eu sou Growlie e estou sempre pronto para proteger este local. O que traz voc� aqui?\r\n#b#L0# Por favor, conte-me sobre este lugar.#l\r\n#L1# Eu trouxe #t4001101#. #l\r\n#L2# Eu gostaria de sair daqui.#l" );
	}

	if ( v0 == 0 ) {
		self.say( "Este lugar pode ser melhor descrito como o primeiro local para voc� provar os deliciosos bolinhos de arroz feitos pela Coelhinha da Lua quando � lua cheia." );
		self.say( "Junte as sementes de pr�mulas das folhas ca�das por aqui e plante-as no vaso da lua crescente para ver as pr�mulas florescendo. Existem 6 tipos de pr�mulas e todas precisam de vasos diferentes. � indispens�vel que o vaso se adapte � semente da flor..." );
		self.say( "Quando as flores das pr�mulas brotarem, a Lua cheia vai surgir e a Coelhinha da Lua aparecer� girando o moinho. Sua tarefa � derrotar os monstros para que a Coelhinha da Lua possa se concentrar para fazer o melhor bolinho de arroz poss�vel." );
		self.say( "Eu gostaria que voc� e seu grupo cooperassem e me conseguissem 10 bolinhos de arroz. Eu recomendo seriamente que voc� consiga os bolinhos de arroz dentro do tempo designado." );
	} else if ( v0 == 1 ) {
		inven = target.inventory;
		nItem = inven.itemCount( 4001101 );
		if ( nItem >= 10 ) {
			self.say( "Oh... este n�o � o bolinho de arroz feito pela Coelhinha da Lua? Por favor, d�-me o bolinho de arroz." );
			field = self.field;
			success = field.setProtectMobDamagedByMob( 1 );
			if ( success == 0 ) end;
			ret = inven.exchange( 0, 4001101, -10 );
			if ( ret != 0 ) {
				if ( quest.getVar( "clear" ) != "1" ) {
					field.effectScreen( "quest/party/clear" );
					field.effectSound( "Grupo1/Completado" );
					field.setMobGen( 0, 0 );
					field.removeAllMob;		// Except MobDamagedByMob
					quest.incExpAll( 1600 );
					quest.setVar( "clear", "1" );

					//special EXP up for summer break event
					cTime = currentTime;
					if ( serverType == 2 ) {
						wsTime = compareTime( cTime, "07/07/05/00/00" );
						weTime =  compareTime( "07/08/19/23/59", cTime );
					} else {
						wsTime = compareTime( cTime, "07/07/16/00/00" );
						weTime =  compareTime( "07/08/19/23/59", cTime );
					}

					if ( wsTime >= 0 and weTime >= 0 ) {
						say = "Voc� vai receber EXP extra por completar a miss�o do grupo do <Evento Miss�o de Grupo de Ver�o 2007>.";
						quest.broadcastMsg( 6, say );
						quest.incExpAll( 400 );
					}
				} 
				self.say( "Mmmm... est� uma del�cia. � s� me procurar para mais! #b#t4001101##k. Fa�a uma boa viagem!" );
				quest.transferFieldAll( 910010100, "st00" );
			} else {
				field.setProtectMobDamagedByMob( 0 );
				self.say( "Por acaso voc� perdeu o bolinho de arroz?" );
				end;
			}
		} else {
			self.say( "Eu aconselho voc� a verificar e ter certeza de que reuniu #b10 #t4001101#s#k." );
			end;
		}
	} else if ( v0 == 2 ) {
		v1 = self.askYesNo( "Se voc� abandonar agora, n�o ter� completado a miss�o.  Quer mesmo fazer isto?" );
		if ( v1 == 0 ) self.say( "Bom. Continue tentando." );
		else {
			 self.say( "Certo, ent�o. Te vejo por a�." );
			 registerTransferField( 910010300, "st00" );
		}
	}
}

script "moonrabbit_start" {
	field = Field( 910010000 );
	field.setMobGen( 0, 0 );
	field.removeAllMob;
}

script "moonrabbit_mobgen" {
	field = Field( 910010000 );
	field.setMobGen( 1, 0 );
	field.summonMob( -180, -196, 2100052 );
}
