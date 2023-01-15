module "standard.s";

// Selling Tickets ( Orbis : 2012000, Ludibrium : 2040000, Ellinia : ? )
script "sell_ticket" {
	field = self.field;
	nTicket = 0;
	tCost = 0;

	if ( target.nLevel < 10 ) self.say( "Seu n�vel parece estar muito baixo para isso. Por motivo de seguran�a, n�o autorizamos ningu�m abaixo do n�vel 10 a entrar neste percurso." );
	else {
		nRet = 0;
		// Orbis 
		if ( field.id == 200000100 ) {
			v1 = self.askMenu( "Ol�, sou o respons�vel pela venda de bilhetes para o passeio de navio a todos os destinos. Qual bilhete gostaria de comprar?\r\n#b#L0# Ellinia na Ilha Vict�ria#l#k\r\n#b#L1# Ludibrium#l" );
			if ( v1 == 0 ) {
				if ( target.nLevel < 30 ) {
					nRet = self.askYesNo( "O passeio para Ellinia na Ilha Vict�ria sai a cada 15 minutos, come�ando em horas cheias, e vai lhe custar #b1.000 mesos#k. Tem certeza de que quer comprar #b#t4031046##k?" );
					nTicket = 4031046;
					tCost = 1000;
				}
				else {
					nRet = self.askYesNo( "O passeio para Ellinia na Ilha Vict�ria sai a cada 15 minutos, come�ando em horas cheias, e vai lhe custar #b5.000 mesos#k. Tem certeza de que quer comprar #b#t4031047##k?" );
					nTicket = 4031047;
					tCost = 5000;
				}
			}
			else if ( v1 == 1 ) {
				if ( target.nLevel < 30 ) {
					nRet = self.askYesNo( "O passeio para Ludibrium sai a cada 10 minutos, come�ando em horas cheias, e vai lhe custar #b2.000 mesos#k. Tem certeza de que quer comprar #b#t4031073##k?" );
					nTicket = 4031073;
					tCost = 2000;
				}
				else {
					nRet = self.askYesNo( "O passeio para Ludibrium sai a cada 10 minutos, come�ando em horas cheias, e vai lhe custar #b6.000 mesos#k. Tem certeza de que quer comprar #b#t4031074##k?" );
					nTicket = 4031074;
					tCost = 6000;
				}
			}
			else if ( v1 == 2 ) {
				if ( target.nLevel < 30 ) {
					nRet = self.askYesNo( "O passeio para a Floresta de Minar perto de Leafre sai a cada 10 minutos, come�ando em horas cheias, e vai lhe custar #b10.000 mesos#k. Tem certeza de que quer comprar #b#t4031330##k?" );
					nTicket = 4031330;
					tCost = 10000;
				}
				else {
					nRet = self.askYesNo( "O passeio para a Floresta de Minar perto de Leafre sai a cada 10 minutos, come�ando em horas cheias, e vai lhe custar #b30.000 mesos#k. Tem certeza de que quer comprar #b#t4031331##k?" );
					nTicket = 4031331;
					tCost = 30000;
				}
			}
		}
		// Ludibrium
		else if ( field.id == 220000100 ) {
			if ( target.nLevel < 30 ) {
				nRet = self.askYesNo( "Ol�, sou o respons�vel pela venda de bilhetes para o passeio de navio para a Esta��o Orbis em Ossyria. O passeio para Orbis sai a cada 10 minutos, come�ando em horas cheias, e vai lhe custar #b2.000 mesos#k. Tem certeza de que quer comprar #b#t4031044##k?" );
				nTicket = 4031044;
				tCost = 2000;
			}
			else {
				nRet = self.askYesNo( "Ol�, sou o respons�vel pela venda de bilhetes para o passeio de navio para a Esta��o Orbis em Ossyria. O passeio para Orbis sai a cada 10 minutos, come�ando em horas cheias, e vai lhe custar #b6.000 mesos#k. Tem certeza de que quer comprar #b#t4031045##k?" );
				nTicket = 4031045;
				tCost = 6000;
			}
		}
		// Ellinia
		else if ( field.id == 101000300 ) {
			if ( target.nLevel < 30 ) {
				nRet = self.askYesNo( "Ol�, sou o respons�vel pela venda de bilhetes para o passeio de navio para a Esta��o Orbis em Ossyria. O passeio para Orbis sai a cada 15 minutos, come�ando em horas cheias, e vai lhe custar #b1.000 mesos#k. Tem certeza de que quer comprar #b#t4031044##k?" );
				nTicket = 4031044;
				tCost = 1000;
			}
			else {
				nRet = self.askYesNo( "Ol�, sou o respons�vel pela venda de bilhetes para o passeio de navio para a Esta��o Orbis em Ossyria. O passeio para Orbis sai a cada 15 minutos, come�ando em horas cheias, e vai lhe custar #b5.000 mesos#k. Tem certeza de que quer comprar #b#t4031045##k?" );
				nTicket = 4031045;
				tCost = 5000;
			}
		}
		//������
		else if ( field.id == 240000100 ) {
			if ( target.nLevel < 30 ) {
				nRet = self.askYesNo( "Ol�, sou o respons�vel pela venda de bilhetes para o passeio de navio para a Esta��o Orbis em Ossyria. O passeio para Orbis sai a cada 10 minutos, come�ando em horas cheias, e vai lhe custar #b2.000 mesos#k. Tem certeza de que quer comprar #b#t4031044##k?" );
				nTicket = 4031044;
				tCost = 2000;
			}
			else {
				nRet = self.askYesNo( "Ol�, sou o respons�vel pela venda de bilhetes para o passeio de navio para a Esta��o Orbis em Ossyria. O passeio para Orbis sai a cada 15 minutos, come�ando em horas cheias, e vai lhe custar #b30.000 mesos#k. Tem certeza de que quer comprar #b#t4031045##k?" );
				nTicket = 4031045;
				tCost = 30000;
			}
		}

		if ( nRet == 0 ) self.say( "Voc� deve ter alguns neg�cios para tratar aqui, certo?" );
		else {
			inventory = target.inventory;
			ret = inventory.exchange( -tCost, nTicket, 1 );
			if ( ret ==0 ) self.say( "Tem certeza de que voc� tem um #b?" + tCost + "mesos#k? Se sim, ent�o devo conferir seu invent�rio de etc. e ver se est� cheio ou n�o." );
		}
	}
}

// Getting the Ticket
script "get_ticket" {
	cTime = currentTime;
	field = self.field;
	inven = target.inventory;

	// The ride from Orbis to Ludibrium : 10 minute interval or Ludibrium to Orbis : 10 minute interval
	if ( field.id == 200000121 or field.id == 220000110 ) {
		tMinute = integer( substring( cTime, 13, 1 ) );

		if ( tMinute < 5 ) self.say( "Come�aremos o embarque 5 minutos antes da sa�da. Por favor, seja paciente e aguarde alguns minutos. Esteja certo de que o navio partir� no hor�rio e n�o receberemos mais bilhetes 1 minuto antes dele partir, ent�o, por favor, esteja aqui a tempo.");
		else if ( tMinute >= 9 ) self.say( "Este navio est� prestes a partir. Desculpe, mas voc� dever� pegar o pr�ximo. A escala das viagens est� dispon�vel por meio dos agentes do balc�o de bilhetes.");
		else {
			nPeople = field.getUserCount;
			if ( nPeople >= 50 ) self.say( "Sinto muito, mas este passeio j� est� CHEIO. N�o podemos aceitar mais nenhum passageiro. Por favor, embarque no pr�ximo.");
			else {
				nRet = self.askYesNo( "Parece que est� cheio de lugares vazios para esta viagem. Por favor, tenha seu bilhete em m�os para embarcar. O trajeto ser� longo, mas chegar� bem a seu destino. O que voc� acha? Quer embarcar neste?");
				if ( nRet == 0 ) self.say( "Voc� deve ter alguns neg�cios para tratar aqui, certo?");
				else {
					if ( target.nLevel >= 30 ) {
						if ( field.id == 200000121 ) {
							ticketID = 4031074;
							wField = 200000122;
						}
						else if ( field.id == 220000110 ) {
							ticketID = 4031045;
							wField = 220000111;
						}
					}
					else if ( target.nLevel < 30 ) {
						if ( field.id == 200000121 ) {
							ticketID = 4031073;
							wField = 200000122;
						}
						else if ( field.id == 220000110 ) {
							nItem = inven.itemCount( 4031045 );
							if ( nItem > 0 ) {
								ticketID = 4031045;
								wField = 220000111;
							} else {
								ticketID = 4031044;
								wField = 220000111;
							}
						}
					}
					inventory = target.inventory;
					ret = inventory.exchange( 0, ticketID, -1 );
					if ( ret == 0 ) self.say( "Ah, n�o... N�o creio que tenha seu bilhete consigo. N�o pode embarcar sem ele. Por favor, compre o bilhete no balc�o de bilhetes." );
					else registerTransferField( wField, "" );
				}
			}
		}
	}
	// Orbis to Ellinia : 15 min interval or Ellinia to Orbis : 15 min interval
	else if ( field.id == 200000111 or field.id == 101000300 ) {
		tMinute = integer( substring( cTime, 12, 2 ) ) % 15;

		if ( tMinute < 10 ) self.say( "Come�aremos o embarque 5 minutos antes da sa�da. Por favor, seja paciente e aguarde alguns minutos. Esteja certo de que o navio partir� no hor�rio e n�o receberemos mais bilhetes 1 minuto antes dele partir, ent�o, por favor, esteja aqui a tempo.");
		else if ( tMinute >= 14 ) self.say( "Este navio est� ficando pronto para partir. Desculpe, mas voc� dever� pegar o pr�ximo. A escala das viagens est� dispon�vel por meio dos agentes do balc�o de bilhetes.");
		else {
			nPeople = field.getUserCount;
			if ( nPeople >= 50 ) self.say( "Sinto muito, mas este passeio j� est� CHEIO. N�o podemos aceitar mais nenhum passageiro. Por favor, embarque no pr�ximo.");
			else {
				nRet = self.askYesNo( "Parece que est� cheio de lugares vazios para esta viagem. Por favor, tenha seu bilhete em m�os para embarcar. O trajeto ser� longo, mas chegar� bem a seu destino. O que voc� acha? Quer embarcar neste?");
				if ( nRet == 0 ) self.say( "Voc� deve ter alguns neg�cios para tratar aqui, certo?");
				else {
					if ( target.nLevel >= 30 ) {
						if ( field.id == 101000300 ) {
							ticketID = 4031045;
							wField = 101000301;
						}
						else if ( field.id == 200000111 ) {
							ticketID = 4031047;
							wField = 200000112;
						}
					}
					else if ( target.nLevel < 30 ) {
						if ( field.id == 101000300 ) {
							nItem = inven.itemCount( 4031045 );
							if ( nItem > 0 ) {
								ticketID = 4031045;
								wField = 101000301;
							} else {
								ticketID = 4031044;
								wField = 101000301;
							}
						}
						else if ( field.id == 200000111 ) {
							ticketID = 4031046;
							wField = 200000112;
						}
					}
					inventory = target.inventory;
					ret = inventory.exchange( 0, ticketID, -1 );
					if ( ret == 0 ) self.say( "Ah, n�o... N�o creio que tenha seu bilhete consigo. N�o pode embarcar sem ele. Por favor, compre o bilhete no balc�o de bilhetes." );
					else registerTransferField( wField, "" );
				}
			}
		}
	}
	//�����񽺿��� �������� ����ϴ� �� : 10�а��� or ���������� �����񽺷� ����ϴ� �� : 10�� ����
	if ( field.id ==  200000131 or field.id == 240000110 ) {
		tMinute = integer( substring( cTime, 13, 1 ) );

		if ( tMinute < 5 ) self.say( "Come�aremos o embarque 5 minutos antes da sa�da. Por favor, seja paciente e aguarde alguns minutos. Esteja certo de que o navio partir� no hor�rio e n�o receberemos mais bilhetes 1 minuto antes dele partir, ent�o, por favor, esteja aqui a tempo.");
		else if ( tMinute >= 9 ) self.say( "Este navio est� ficando pronto para partir. Desculpe, mas voc� dever� pegar o pr�ximo. A escala das viagens est� dispon�vel por meio dos agentes do balc�o de bilhetes.");
		else {
			nPeople = field.getUserCount;
			if ( nPeople >= 50 ) self.say( "Sinto muito, mas este passeio j� est� CHEIO. N�o podemos aceitar mais nenhum passageiro. Por favor, embarque no pr�ximo.");
			else {
				nRet = self.askYesNo( "Parece que est� cheio de lugares vazios para esta viagem. Por favor, tenha seu bilhete em m�os para embarcar. O trajeto ser� longo, mas chegar� bem a seu destino. O que voc� acha? Quer embarcar neste?");
				if ( nRet == 0 ) self.say( "Voc� deve ter alguns neg�cios para tratar aqui, certo?");
				else {
					if ( target.nLevel >= 30 ) {
						if ( field.id == 200000131 ) {
							ticketID = 4031331;
							wField = 200000132;
						}
						else if ( field.id == 240000110 ) {
							ticketID = 4031045;
							wField = 240000111;
						}
					}
					else if ( target.nLevel < 30 ) {
						if ( field.id == 200000131 ) {
							nItem = inven.itemCount( 4031331 );
							if ( nItem > 0 ) {
								ticketID = 4031331;
								wField = 200000132;
							} else {
								ticketID = 4031330;
								wField = 200000132;
							}
						}
						else if ( field.id == 240000110 ) {
							nItem = inven.itemCount( 4031045 );
							if ( nItem > 0 ) {
								ticketID = 4031045;
								wField = 240000111;
							} else {
								ticketID = 4031044;
								wField = 240000111;
							}
						}
					}
					inventory = target.inventory;
					ret = inventory.exchange( 0, ticketID, -1 );
					if ( ret == 0 ) self.say( "Ah, n�o... N�o creio que tenha seu bilhete consigo. N�o pode embarcar sem ele. Por favor, compre o bilhete no balc�o de bilhetes." );
					else registerTransferField( wField, "" );
				}
			}
		}
	}
}

// leaving the awaiting ship
// 200000122 : waiting at the ride for Orbis to Ludibrium
// 220000111 : waiting at the ride for Ludibrium to Orbis
// 101000301 : waiting at the ride for Ellinia to Orbis
// 200000112 : waiting at the ride for Orbis to Ellinia
// 200000100 : Orbis ticketing booth
// 220000100 : Ludibrium ticketing booth
// 101000300 : Ellinia ticketing booth
// 240000111 : �����񽺿��� ������ �� �� ���
// 240000100 : ������ ��ǥ��
script "goOutWaitingRoom" {
	field = self.field;

	nRet = self.askYesNo( "Quer deixar a sala de espera? Voc� pode, mas N�O haver� reembolso do bilhete. Tem certeza de que quer sair desta sala?");
	if ( nRet == 0 ) self.say( "Chegar� logo a seu destino. V� em frente e converse com outras pessoas e, antes que perceba, j� estar� l�." );
	else {
		if ( field.id == 200000122 ) registerTransferField( 200000100, "" );
		else if ( field.id == 220000111 ) registerTransferField( 220000100, "" );
		else if ( field.id == 101000301 ) registerTransferField( 101000300, "" );
		else if ( field.id == 200000112 ) registerTransferField( 200000100, "" );
		else if ( field.id == 240000111 ) registerTransferField( 240000100, "" );
		else if ( field.id == 200000132 ) registerTransferField( 200000100, "" );		
	}
}
script "elevator" {
	cTime = continentTime;
	field = portal.field;

	tMinute = integer( substring( cTime, 12, 2 ) ) % 4;
	if ( field.id == 222020200 ) {
		if ( tMinute == 3 ) registerTransferField( 222020210, "st00" );
		else target.message( "No momento, o elevador n�o est� dispon�vel para este trajeto. Por favor, tente mais tarde." );
	}
	else if ( field.id == 222020100 ) {
		if ( tMinute == 1 ) registerTransferField( 222020110, "st00" );
		else target.message( "No momento, o elevador n�o est� dispon�vel para este trajeto. Por favor, tente mais tarde." );
	}
}
script "minar_elli" {
	field = portal.field;
	inven = target.inventory;
	nItem = inven.itemCount( 4031346 );
	if ( nItem > 0 ) {
		say = "Usou a semente m�gica e ser� transferido para outro lugar.";
		target.message( say );
		ret = inven.exchange( 0, 4031346, -1 );
		if ( ret != 0 ) {
			if ( field.id == 101010000 ) { 
				map = 240010100;
				ptname = "elli00";
			}
			else if ( field.id ==  240010100 ) {
				map = 101010000;
				ptname = "minar00";
			}
			registerTransferField( map, ptname );
		}
	} else {
		say = "A Semente M�gica � necess�ria para passar pelo portal.";
		target.message( say );
	}
}

function( string ) wt_mapcode( integer mapNum ) {
	if( mapNum == 101000000 ) return "elli";
	else if( mapNum == 104000000 ) return "lith";
	else if( mapNum == 102000000 ) return "peri";
	else if( mapNum == 103000000 ) return "kern";
	else if( mapNum == 200000000 ) return "orbi";
	else if( mapNum == 211000000 ) return "elna";
	else if( mapNum == 220000000 ) return "ludi";
	else if( mapNum == 240000000 ) return "mina";
	else if( mapNum == 680000000 ) return "Amor";
	else if( mapNum == 250000000 ) return "muru";
	return "hene";
}

function( integer ) wt_mapcode2( string mapName ) {
	if( mapName == "elli" ) return 101000000;
	else if( mapName == "lith" ) return 104000000;
	else if( mapName == "peri" ) return 102000000;
	else if( mapName == "kern" ) return 103000000;
	else if( mapName == "orbi" ) return 200000000;
	else if( mapName == "elna" ) return 211000000;
	else if( mapName == "ludi" ) return 220000000;
	else if( mapName == "mina" ) return 240000000;
	else if( mapName == "Amor" ) return 680000000;
	else if( mapName == "muru" ) return 250000000;
	return 100000000;
}

script "world_trip" {
	field = self.field;
	qr = target.questRecord;
	
	cJob = target.nJob;

	if ( field.id == 100000000 or field.id == 101000000 or field.id == 102000000 or field.id == 103000000 or field.id == 104000000 or field.id == 200000000 or field.id == 220000000 or field.id == 680000000 or field.id == 250000000 or field.id == 240000000 ) {
		if ( cJob == 0 ) self.say( "Se est� entediado com a vida cotidiana, que tal cair fora, pra variar? N�o h� nada como mergulhar numa nova cultura, aprender algo novo em um minuto! Aproveite para cair fora e viajar. Recomendamos uma #bTour Mundial#k! Est� preocupado com a despesa da viagem? Sem preocupa��es! A #bAg�ncia de Viagnes Maple#k oferece primeira classe pelo precinho de #b300 mesos#k" );
		else self.say( "Se est� entediado com a vida cotidiana, que tal cair fora, pra variar? N�o h� nada como mergulhar numa nova cultura, aprender algo novo em um minuto! Aproveite para cair fora e viajar. N�s da Ag�ncia de Viagens Maple recomendamos voc� embarcar em um #b Tour Mundial#k! Est� preocupado com a despesa da viagem? N�o deveria! N�s da #bAg�ncia de Viagens Maple#k, temos um pacote para voc� por SOMENTE #b3.000 mesos!#k" ); 

		v0 = self.askMenu( "Agora lhe oferecemos este lugar para ter o prazer de viajar: #bSantu�rio dos Cogumelos no Jap�o#k. Estaremos l�, como seu guia tur�stico. Descanso garantido, o n�mero de destinos ainda v�o aumentar. Gostaria de ir agora para o Santu�rio dos Cogumelos?\r\n#b#L0# Sim, leve-me ao Santu�rio dos Cogumelos (Jap�o)#k#l" );
		if ( v0 == 0 ) {
			self.say( "Gostaria de viajar para o #bSantu�rio dos Cogumelos no Jap�o#k? Se deseja sentir a ess�ncia do Jap�o, nada como visitar o Templo, um p�lo cultural japon�s. O Santu�rio dos Cogumelos � um lugar m�tico que adora o Incompar�vel Deus Cogumelo dos tempos antigos." );
			self.say( "Veja a sacerdotisa servir ao Deus Cogumelo e n�o deixe de provar Takoyaki, Yakisoba e outras del�cias vendidas nas ruas do Jap�o. Agora vamos para o #bSantu�rio dos Cogumelos#k, um lugar m�tico, como se um dia tivesse sido de fato." );
			if ( cJob == 0 ) mon = target.incMoney( -300, 1 );
			else mon = target.incMoney( -3000, 1 );
			if ( mon == 0 ) { 
				self.say( "Por favor, confira se tem mesos suficientes para ir." );
				end;
			} else {
				mapcode = field.id;
				map = wt_mapcode( mapcode );
				qr.set( 8792, map );
				registerTransferField( 800000000, "st00" );
			}
		}	
	}
	else if ( field.id == 800000000 ) {
		backmap = wt_mapcode2( qr.get( 8792 ) );
		v0 = self.askMenu( "Como est� a viagem? Est� curtindo?\r\n#b#L0#Sim, j� basta de viajar. Posso voltar #m" + backmap + "#? #l\r\n#b#L1#NN�o, gostaria de continuar a explorar este lugar.#l" );
		if ( v0 == 0 ) {
			self.say( "Muito bem. Agora levarei voc� de volta para onde estava antes de visitar o Jap�o. Caso queira por o p� na estrada novamente, por favor, me avise!" );
			registerTransferField( backmap, "" );			
		}
		else if ( v0 == 1 ){
			self.say( "Ok. Caso mude de id�ia, por favor, me avise." );
		    end;
		}
	}
}

//����-������
script "crane" {
	if ( target.nJob == 0 ) {
		meso = 600;
		meso2 = 150;
	} else {
		meso = 6000;
		meso2 = 1500;
	}

	field = self.field;
	if ( field.id == 250000100 ) {
		//�ʺ���
		if ( target.nJob == 0 ) {
			val = self.askMenu( "Ol�! Eu sou a cegonha que voa de #bMu Lung#k para #bOrbis#k e volta. V�o o tempo todo, ent�o imaginei por que n�o fazer algum dinheiro levando viajantes como voc� por um pre�o baixo? � um bom neg�cio para mim. O que voc� acha? Quer voar para #bOrbis#k agora mesmo? Para iniciantes, cobro s� #b" + meso + "mesos#k.\r\n#b#L0# Est� bem, leve-me a Orbis.#l" );
			if ( val == 0 ) {
				cNum = Field( 200090310 ).getUserCount;
				if ( cNum <=0 ) {
					if ( target.nMoney < meso ) self.say( "Tem certeza de que voc� tem mesos suficientes?" );
					else {
						crane = FieldSet( "Crane_SS" );
						ret = crane.enter( target.nCharacterID, 0 );
						if ( ret != 0 ) self.say( "Algu�m mais est� indo a Orbis neste exato momento. Fale comigo daqui a pouco." );
						else {
							ret = target.incMoney( -meso, 1 );
							crane.resetQuestTime;
						}
					}
				} else self.say( "Algu�m mais est� indo a Orbis neste exato momento. Fale comigo daqui a pouco." );
			} else {
				val2 = self.askYesNo( "Quer mudar para #b#m251000000##k agora? Se tiver #b" + meso2 + "mesos#k, te levarei agora mesmo." );
				if ( val2 == 0 ) self.say( "Ok. Caso mude de id�ia, por favor, me avise." );
				else {
					ret = target.incMoney( -meso2, 1 );
					if ( ret == 0 ) self.say( "Tem certeza de que voc� tem mesos suficientes?" );
					else registerTransferField( 251000000, "" );
				}
			}
		//�Ϲ�
		} else {		
			val = self.askMenu( "Ol�! Eu sou a cegonha que voa de #bMu Lung#k para #bOrbis#k e volta. V�o o tempo todo, ent�o imaginei por que n�o fazer algum dinheiro levando viajantes como voc� por um pre�o baixo? � um bom neg�cio para mim. O que voc� acha? \r\n#b#L0# Orbis(" + meso + "mesos)#l\r\n#L1# Vila das Ervas(" + meso2 + "mesos#l" );
			if ( val == 0 ) {
				cNum = Field( 200090310 ).getUserCount;
				if ( cNum <=0 ) {
					if ( target.nMoney < meso ) self.say( "Tem certeza de que voc� tem mesos suficientes?" );
					else {
						crane = FieldSet( "Crane_SS" );
						ret = crane.enter( target.nCharacterID, 0 );
						if ( ret != 0 ) self.say( "Algu�m mais est� indo a Orbis neste exato momento. Fale comigo daqui a pouco." );
						else {
							ret = target.incMoney( -meso, 1 );
							crane.resetQuestTime;
						}
					}
				} else {
					self.say( "Algu�m mais est� indo a Orbis neste exato momento. Fale comigo daqui a pouco." );
				}
			} else {
				val2 = self.askYesNo( "Quer mudar para #b#m251000000##k agora? Se tiver #b" + meso2 + "mesos#k, te levarei agora mesmo." );
				if ( val2 == 0 ) self.say( "Ok. Caso mude de id�ia, por favor, me avise." );
				else {
					ret = target.incMoney( -meso2, 1 );
					if ( ret == 0 ) self.say( "Tem certeza de que voc� tem mesos suficientes?" );
					else registerTransferField( 251000000, "" );
				}
			}
		}
	//������
	} else if ( field.id == 200000141 ) {
		if ( target.nJob == 0 ) {
			cNum = Field( 200090300 ).getUserCount;
			if ( cNum <= 0 ) {
				v0 = self.askMenu( "Ol�! Eu sou a cegonha que voa de #bOrbis#k para #bMu Lung#k e volta. V�o o tempo todo, ent�o imaginei por que n�o fazer algum dinheiro levando viajantes como voc� por um pre�o baixo? � um bom neg�cio para mim. O que voc� acha? Quer voar para #bMu Lung#k agora mesmo? Para iniciantes, cobro s� #b" + meso + "mesos#k.\r\n#b#L0# Est� bem, leve-me a Mu Lung.#l" );
				if ( v0 == 0 ) {
					cNum = Field( 200090300 ).getUserCount;
					if ( cNum <=0 ) {
						if ( target.nMoney < meso ) self.say( "Tem certeza de que voc� tem mesos suficientes?" );
						else {
							crane = FieldSet( "Crane_MR" );
							ret = crane.enter( target.nCharacterID, 0 );
							if ( ret != 0 ) {
								self.say( "Algu�m mais est� indo a Mu Lung neste exato momento. Fale comigo daqui a pouco." );
							} else {
								ret = target.incMoney( -meso, 1 );
								crane.resetQuestTime;
							}
						}
					} else self.say( "Algu�m mais est� indo a Mu Lung neste exato momento. Fale comigo daqui a pouco." );
				}
			} else {
				self.say( "Algu�m mais est� indo a Mu Lung neste exato momento. Fale comigo daqui a pouco." );
			}
		} else {
			cNum = Field( 200090300 ).getUserCount;
			if ( cNum <=0 ) {
				v0 = self.askMenu( "Ol�! Eu sou a cegonha que voa de #bOrbis#k para #bMu Lung#k e volta. V�o o tempo todo, ent�o imaginei por que n�o fazer algum dinheiro levando viajantes como voc� por um pre�o baixo? � um bom neg�cio para mim. O que voc� acha? \r\n#b#L0# Mu Lung(" + meso + " mesos)#l" );
				if ( v0 == 0 ) {
					cNum = Field( 200090300 ).getUserCount;
					if ( cNum <=0 ) {
						if ( target.nMoney < meso ) self.say( "Tem certeza de que voc� tem mesos suficientes?" );
						else {
							crane = FieldSet( "Crane_MR" );
							ret = crane.enter( target.nCharacterID, 0 );
							if ( ret != 0 ) self.say( "Algu�m mais est� indo a Mu Lung neste exato momento. Fale comigo daqui a pouco." );
							else {
								ret = target.incMoney( -meso, 1 );
								crane.resetQuestTime;
							}
						}
					} else self.say( "Algu�m mais est� indo a Mu Lung neste exato momento. Fale comigo daqui a pouco." );
				}
			} else {
				self.say( "Algu�m mais est� indo a Mu Lung neste exato momento. Fale comigo daqui a pouco." );
			}
		}
	} else if ( field.id == 251000000 ) {
		if ( target.nJob == 0 ) v0 = self.askYesNo( "Ol�! Eu sou a cegonha que voa de #bOrbis#k para #bMu Lung#k e volta. V�o o tempo todo, ent�o imaginei por que n�o fazer algum dinheiro levando viajantes como voc� por um pre�o baixo? � um bom neg�cio para mim. O que voc� acha? Quer voar para #bMu Lung#k agora mesmo? Para iniciantes, cobro s� #b" + meso2 + " mesos#k. " );
		else v0 = self.askYesNo( "Ol�! Eu sou a cegonha que voa de de #bOrbis#k para #bMu Lung#k e volta. V�o o tempo todo, ent�o imaginei por que n�o fazer algum dinheiro levando viajantes como voc� por um pre�o baixo? � um bom neg�cio para mim. O que voc� acha? Quer voar para #bMu Lung#k agora mesmo? Cobro s� #b" + meso2 + " mesos#k." );
		if ( v0 == 0 ) self.say( "Ok. Caso mude de id�ia, por favor, me avise." );
		else {
			ret = target.incMoney( -meso2, 1 );			
			if ( ret == 0 ) self.say( "Tem certeza de que voc� tem mesos suficientes?" );
			else registerTransferField( 250000100, "" );
		}
	}
}

//���� �̵��� �浹 ��ũ��Ʈ
script "crane_MR" {
	move = FieldSet( "Crane_MR" );
	time = move.getQuestTime;
	if ( time >= 58 ) registerTransferField( 250000100, "" );
}

script "crane_SS" {
	move = FieldSet( "Crane_SS" );
	time = move.getQuestTime;
	if ( time >= 58 ) registerTransferField( 200000141, "" );
}
