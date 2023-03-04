module "standard.s"; 

function bowmanAction { 
	qr = target.questRecord; 
	val = qr.get( 7500 ); 
	cJob = target.nJob; 
	inventory = target.inventory; 

	if ( val == "s" and ( cJob == 310 or cJob == 320 ) ) { 
		qr.set( 7500, "p1" ); 
		self.say( "Estava esperando voc�. Algum tempo atr�s, #bRene#k de Ossyria me falou algo sobre voc�. Vejo que est� #Ginteressado:interessada# em subir para o 3� n�vel de classe. Para isso, terei de aplicar um teste de for�a, para ver se voc� merece avan�ar. Em meio a uma floresta densa em algum lugar da Ilha Victoria, voc� encontrar� uma passagem secreta que o levar� a uma nova dimens�o. L� dentro, voc� enfrentar� meu clone. Sua tarefa � derrot�-lo e trazer o #b#t4031059##k junto com voc�." ); 
		self.say( "Como ele � o meu clone, voc� pode esperar uma �rdua batalha. Ele usa habilidades de ataque especiais que voc� nunca viu antes e sua tarefa ser� derrot�-lo. Existe um limite de tempo na passagem secreta, ent�o � essencial que voc� o derrote rapidamente. Desejo-lhe boa sorte e espero que traga o #b#t4031059##k com voc�." ); 
	} 
	else if ( val == "p1" ) { 
		if ( inventory.itemCount( 4031059 ) >= 1 ) { 
			self.say( "Bom trabalho. Voc� derrotou meu clone e trouxe o #b#t4031059##k a salvo. Eu estou impressionado. Voc� passou agora da primeira metade do teste para o 3� n�vel de classe. Entregue este colar a #bRene#k de Ossyria para fazer a segunda parte do teste. Tenha cuidado. Estarei torcendo por voc�." ); 
			ret = inventory.exchange( 0, 4031059, -1, 4031057, 1 ); 
			if ( ret == 0 ) self.say( "Tem certeza de que est� com o #b#t4031059##k? Se tiver certeza, certifique-se de que existe um espa�o vazio dispon�vel no seu invent�rio de Etc." ); 
			else qr.set( 7500, "p2"); 
		} 
		else self.say( "Em meio a uma floresta densa em algum lugar da Ilha Victoria, voc� encontrar� uma passagem secreta que o levar� a uma nova dimens�o. L� dentro, voc� enfrentar� meu clone. Sua tarefa � derrot�-lo e trazer o #b#t4031059##k junto com voc�." ); 
	} 
	else if ( val == "p2" ) { 
		if ( inventory.itemCount( 4031057 ) <= 0 ) { 
			self.say( "Ao que parece, voc� perdeu #b#t4031057##k. Por favor, tenha cuidado da pr�xima vez. Aqui est� outro. Sem isto, voc� n�o poder� fazer o teste para o 3� n�vel de classe" ); 
			ret = inventory.exchange( 0, 4031057, 1 ); 
			if ( ret == 0 ) self.say( "Hummm... h� algo estranho. Seu invent�rio de itens est� cheio? Verifique se o seu invent�rio de Etc. tem espa�o suficiente." ); 
		} 
		else self.say( "Leve #b#t4031057##k com voc� e v� ver #bRene#k de Ossyria. � a prova de que voc� passou em um dos testes para o 3� n�vel de classe. Tenho certeza de que voc� vai passar f�cil no outro teste. Agora, siga em frente!" ); 
	} 
	else { 
		if ( target.nJob == 300 ) { 
			if ( target.nLevel >= 30 ) { 
					if ( inventory.itemCount( 4031010 ) >= 1 ) self.say( "Voc� ainda n�o a encontrou, n�? Encontre a #b#p1072002##k que est� perto de #b#m106010000##k pr�ximo a #m100000000#. Entregue-lhe esta carta e ela lhe dir� o que fazer." ); 
				else if ( inventory.itemCount( 4031012 ) >= 1 ) { 
						self.say( "Haha... eu sabia que voc� iria tirar aquele teste de letra. Admito que voc� � um grande arqueiro. Vou torn�-lo muito mais forte do que j� � agora. Mas antes disso... voc� ter� de escolher um dos dois caminhos que lhe ser�o oferecidos. Ser� uma decis�o dif�cil, mas... voc� poder� me fazer qualquer pergunta." ); 
						v1 = self.askMenu( "Certo, quando tomar sua decis�o, clique em [Quero escolher minha profiss�o!] na parte inferior.\r\n#b#L0#Explique-me o que � ser um Ca�ador.#k#l\r\n#b#L1#Explique-me o que � ser um Balestreiro.#k#l\r\n#b#L2#Quero escolher minha profiss�o!#k#l" ); 
					if ( v1 == 0 ) { 
							self.say( "Ok. Eis o que � ser um Ca�ador. Os Ca�adores t�m habilidades como #q3100000# e #q3101002# que permitem que tamb�m usem arcos. Existe tamb�m uma habilidade chamada #q3101004# para os Ca�adores que usam flechas demais. Ela permite que voc� atire flechas por um longo per�odo de tempo sem realmente gastar sua muni��o. Ent�o, se voc� j� gastou muitos mesos em flechas, essa habilidade � perfeita para voc�..." ); 
							self.say( "Vou lhe explicar uma das habilidades do Ca�ador, #b#q3101003##k. Ningu�m � melhor que um Ca�ador nos ataques de longa dist�ncia, mas a hist�ria muda totalmente quando h� v�rios inimigos ou se voc� precisa atac�-los de perto. Por isso, essa habilidade � muito importante. Ela permite n�o s� que voc� ataque o inimigo de perto, como tamb�m manda v�rios monstros para longe. � uma habilidade muito importante para que voc� adquira um pouco mais de espa�o, algo bastante necess�rio." ); 
							self.say( "Vou lhe explicar a habilidade de ataque do Ca�ador, #b#q3101005##k. � uma habilidade que permite que voc� atire flechas com bombas. Se atingir o alvo, a bomba explodir� em cima do inimigo, causando dano nos que estiverem ao redor dele e derrubando-os temporariamente. Combine esta habilidade com #q3000001#, a habilidade de primeiro n�vel, e o dano ser� incr�vel. Voc� deveria tentar se tornar um Ca�ador." ); 
					} 
					else if ( v1 == 1 ) { 
							self.say( "Ok. Eis o que � ser um Balestreiro. Para o Balestreiro, habilidades como #q3200000# e #q3201002# est�o dispon�veis junto com #q3101004# para aqueles que desgastam seus arcos atirando muito e acertando pouco. Esta habilidade permite que o jogador atire as flechas por um longo per�odo de tempo sem desgastar o arco. Ent�o, se voc� j� gastou muitos mesos em arcos, vai querer conferi-la..." ); 
							self.say( "Ok. Umas das habilidades que um Balestreiro pode ter � #b#q3101003##k Ningu�m consegue se aproximar dos ataques de longa dist�ncia do Balestreiro, mas a hist�ria � outra quando se trata de combates corpo a corpo ou enfrentar muitos inimigos de uma s� vez. Por isso, essa habilidade � muito importante. Ela permite que voc� ataque com for�a total, mandando v�rios inimigos para longe no processo. � uma habilidade muito importante que concede a voc� um pouco mais de espa�o, algo bastante necess�rio." ); 
							self.say( "Ok, vou lhe explicar uma das habilidades de ataque do Balestreiro, #b#q3201005##k. Essa habilidade permite que voc� ataque v�rios inimigos, j� que a flecha atravessa o monstro e atinge outro monstro atr�s dele. O dano vai diminuindo cada vez que a flecha atravessa um inimigo, mas ainda consegue atingir v�rios inimigos de uma s� vez, uma habilidade muito #q1201006# para se ter. E... se for combinada com #q3000001#... ela ser� simplesmente incr�vel." ); 
					} 
					else if ( v1 == 2 ) { 
							v2 = self.askMenu( "Bom... j� se decidiu? Escolha a profiss�o que voc� gostaria de ter no seu 2� n�vel de classe.\r\n#b#L0#Ca�ador#k#l\r\n#b#L1#Balestreiro#k#l" ); 
						if ( v2 == 0 ) { 
									mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bCa�ador#k? Voc� sabe que depois que tomar sua decis�o n�o poder� mais escolher outra classe, n�o �?" ); 
									if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
							else if ( mJob == 1 ) { 
								nPSP = ( target.nLevel - 30 ) * 3; 
									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #SP#k demais... voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
								else { 
									ret = inventory.exchange( 0, 4031012, -1 ); 
										if ( ret == 0 ) self.say( "Hummm... tem certeza de que possui #b#t4031012##k da #p1072002#? � melhor ter certeza, pois n�o posso permitir que suba para o pr�ximo n�vel de classe sem isso..." ); 
									else { 
										target.nJob = 310; 
										target.incSP( 1, 0 ); 
										incval1 = random( 300, 350 ); 
										incval2 = random( 150, 200 ); 
										target.incMHP( incval1, 0 ); 
										target.incMMP( incval2, 0 ); 
										inventory.incSlotCount( 4, 4 ); 
											self.say( "Certo, voc� ser� um #bCa�ador#k a partir de agora. Os Ca�adores s�o um bando inteligente com uma vis�o incr�vel, capazes de fincar uma flecha no cora��o de um monstro com facilidade... voc� tem que treinar todos os dias. Vamos ajudar voc� a se tornar mais forte do que j� �." ); 
											self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Ca�ador. Tamb�m expandi seu invent�rio de Etc. com uma nova fileira. Seu HP e MP m�ximos tamb�m aumentaram. Pode conferir." ); 
											self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
											self.say( "Um Ca�ador precisa ser forte. Mas lembre que voc� n�o pode abusar desse poder e us�-lo em um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante. Estarei esperando voc�." ); 
									} 
								} 
							}	 
						} 
						else if ( v2 == 1 ) { 
								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bBalestreiro#k? Depois que tomar sua decis�o, voc� n�o poder� voltar atr�s e mudar de classe. Tem certeza disso?" ); 
								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
							else if ( mJob == 1 ) { 
								nPSP = ( target.nLevel - 30 ) * 3; 
									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #SP#k demais... voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
								else { 
									ret = inventory.exchange( 0, 4031012, -1 ); 
										if ( ret == 0 ) self.say( "Hummm... tem certeza de que possui a #b#t4031012##k da #p1072002#? � melhor ter certeza. N�o posso permitir que suba de n�vel de classe sem isso." ); 
									else { 
										target.nJob = 320; 
										target.incSP( 1, 0 ); 
										incval1 = random( 300, 350 ); 
										incval2 = random( 150, 200 ); 
										target.incMHP( incval1, 0 ); 
										target.incMMP( incval2, 0 ); 
										inventory.incSlotCount( 4, 4 ); 
											self.say( "Muito bem. Agora voc� � um #bBalestreiro#k. Os Balestreiros s�o indiv�duos inteligentes com uma vis�o incr�vel, capazes de fincar uma flecha no cora��o de um monstro com facilidade... n�o deixe de treinar um dia sequer. Vamos ajudar voc� a se tornar mais forte do que j� �." ); 
											self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Balestreiro. Tamb�m expandi seu invent�rio de Etc. com uma nova fileira. Seu HP e MP m�ximos tamb�m aumentaram. Pode conferir." ); 
											self.say( "Tamb�m lhe dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
											self.say( "Um Balestreiro precisa ser forte, mas lembre que voc� n�o pode abusar desse poder e us�-lo em um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante. Estarei esperando voc�." ); 
									} 
								} 
							}	 
						} 
					} 
				} 
				else { 
						nSec = self.askYesNo( "Hummm... voc� cresceu bastante desde a �ltima vez que o vi. N�o vejo mais o ser fraco que existia antes. Na verdade, voc� est� muito mais parecido com um arqueiro agora. Bom, o que voc� acha? Deseja se tornar ainda mais #Gpoderoso:poderosa#? � s� fazer um simples teste. Voc� aceita?" ); 
						if ( nSec == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
					else if ( nSec == 1 ) { 
							self.say( "Boa decis�o. Voc� parece forte, mas preciso saber se voc� � forte o suficiente para passar no teste. N�o � um teste dif�cil, voc� vai se sair muito bem. Aqui, pegue esta carta... n�o a perca!" ); 
						ret = inventory.exchange( 0, 4031010, 1 ); 
							if ( ret == 0 ) self.say( "Hummm... seu invent�rio parece cheio... libere espa�o no seu invent�rio de Etc. e me procure. Sem a carta, voc� n�o poder� fazer o teste." ); 
							else self.say( "Leve esta carta � #b#p1072002##k que est� perto de #b#m106010000##k pr�ximo a #m100000000#. Ela est� me substituindo como instrutora. Entregue-lhe a carta e ela aplicar� o teste em meu lugar. Boa sorte para voc�." ); 
					} 
				} 
			} 
			else { 
					v = self.askMenu( "Voc� tem alguma pergunta sobre a vida como Arqueiro? \r\n#b#L0#Quais s�o as caracter�sticas b�sicas de um Arqueiro?#l\r\n#L1#Quais s�o as armas de um Arqueiro?#l\r\n#L2#Quais s�o as armaduras de um Arqueiro?#l\r\n#L3#Quais s�o as habilidades de um Arqueiro?#l" ); 
				if ( v == 0 ) { 
						self.say( "Eis o que � ser um Arqueiro. O Arqueiro possui um valor razo�vel de vigor e for�a. Sua habilidade mais importante � DES. Ele n�o tem muito vigor, por isso evite combates corpo a corpo se poss�vel." ); 
						self.say( "A principal vantagem � que voc� poder� atacar de longe, evitando os combate corpo a corpo feitos pelos monstros. Al�m disso, com seu alto valor de destreza, voc� conseguir� evitar tamb�m muitos ataques de aproxima��o. Quanto maior for a DES, mais dano voc� conseguir� causar." ); 
				} 
				else if ( v == 1 ) { 
						self.say( "Vou lhe explicar as armas de um Arqueiro. Em vez de usar armas para atacar ou cortar seus oponentes, ele usa armas de longa dist�ncia como arcos e bestas para matar monstros. Ambas t�m suas vantagens e desvantagens." ); 
						self.say( "Os arcos n�o s�o t�o potentes quanto as bestas, mas s�o muito mais r�pidos em uma situa��o de ataque. As bestas, por sua vez, s�o mais potentes e menos r�pidas. Ser� dif�cil tomar uma decis�o..." ); 
						self.say( "Voc� conseguir� flechas e bestas com os monstros, ent�o � importante que os cace com freq��ncia. Mas n�o vai ser f�cil. N�o deixe de treinar um dia sequer e o sucesso ir� at� voc�..." ); 
				} 
				else if ( v == 2 ) { 
						self.say( "Vou lhe explicar as armaduras de um Arqueiro. Ele precisa se movimentar com rapidez, ent�o n�o vai adiantar nada usar armaduras pesadas e complexas. Vestimentas com cord�es longos e inc�modos est�o fora de quest�o." ); 
						self.say( "Se usar a armadura enorme e resistente dos Guerreiros, voc� logo se ver� cercado de inimigos. Equipe-se com uma armadura simples e confort�vel que lhe sirva perfeitamente e cumpra sua fun��o. Vai ajud�-lo bastante quando estiver ca�ando monstros." ); 
				} 
				else if ( v == 3 ) { 
						self.say( "As habilidades dispon�veis para os arqueiros s�o aquelas que usam bem sua elevada precis�o e destreza. � essencial que o Arqueiro adquira habilidades que lhe permitam atacar os inimigos com precis�o." ); 
						self.say( "Existem dois tipos de habilidades de ataque para o arqueiro: #b#q3001004##k e #b#q3001005##k. #q3001004# � uma boa e simples habilidade que permite causar muito dano no inimigo com um uso m�nimo de MP." ); 
						self.say( "Por sua vez, #q3001005# permite atacar o inimigo duas vezes usando uma quantidade consider�vel de MP. Voc� poder� adquirir essa habilidade somente ap�s fazer pelo menos 1 melhoria em #q3001004#. N�o se esque�a disso. Seja qual for sua escolha, torne-se um especialista na habilidade." ); 
				} 
			} 
		} 
		else if ( target.nJob == 0 ) { 
				self.say( "Ent�o voc� deseja se tornar um Arqueiro??? Bem... voc� precisa atender alguns requisitos para isso... no m�nimo #bN�vel 10 e 25 de DES#k. Vejamos... humm..." ); 
			if ( target.nLevel > 9 and target.nDEX > 24 ) { 
					nRet = self.askYesNo( "Voc� est� #Gqualificado:qualificada#. Voc� tem um grande par de olhos para enxergar os verdadeiros monstros e as habilidades necess�rias para atravess�-los com uma flecha... precis�vamos de algu�m assim. Voc� deseja se tornar #Gum Arqueiro:uma Arqueira#?" ); 
					if ( nRet == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
				else if ( nRet == 1 ) { 
				inven = target.inventory; 
					if ( inven.slotCount( 1 ) > inven.holdCount( 1 ) and inven.slotCount( 2 ) > inven.holdCount( 2 ) + 2 ) { 
						self.say( "Certo! Voc� ser� um Arqueiro agora porque assim ordeno... haha. Aqui vai um pouco de meu poder para voc�... R����!" ); 
						ret = inven.exchange( 0, 1452051, 1, 2060000, 2000, 2060000, 2000, 2060000, 2000 ); 
						if ( ret == 0 ) self.say( "Humm... Verifique sua janela de Equip e Uso, pois gostaria de lhe dar uma arma para voc� treinar como recompensa por seu primeiro avan�o de classe." ); 
						else { 
					inventory.incSlotCount( 1, 4 ); 
					inventory.incSlotCount( 2, 4 ); 
					target.nJob = 300; 
					valh = random( 100, 150 ); 
					valm = random( 30, 50 ); 
					target.incMHP( valh, 0 ); 
					target.incMMP( valm, 0 ); 
					target.incSP( 1, 0 ); 
						self.say( "Acrescentei slots no seu invent�rio de equipamento e etc. Voc� tamb�m se tornou bem mais forte. Treine bastante e um dia voc� alcan�ar� o �pice da habilidade dos arqueiros. Estarei observando de longe. Seja #Gesfor�ado:esfor�ada#." ); 
						self.say( "Eu apenas lhe dei um pouco de #bSP#k. Quando voc� abrir o #bmenu de habilidades#k no canto inferior esquerdo da tela, voc� ver� as habilidades que poder� aprender usando SP. Um aviso: Voc� n�o poder� aument�-las de uma vez. Existem tamb�m aquelas que ficar�o dispon�veis somente ap�s voc� aprender algumas habilidades primeiro." ); 
						self.say( "Mais um aviso. Depois que escolher sua classe, tente continuar vivo pelo maior tempo que conseguir. Se voc� morrer, perder� todo o seu n�vel de experi�ncia. Voc� n�o quer perder seus pontos de experi�ncia ganhos com tanto sacrif�cio, n�o �?" ); 
						self.say( "OK! Isso � tudo que posso lhe ensinar. V� aos lugares, treine e se torne ainda melhor. Procure-me quando achar que j� fez tudo o que podia e precisar de algo interessante. Estarei esperando voc�." ); 
						self.say( "Ah, e... se tiver alguma d�vida sobre ser um Arqueiro, sinta-se livre para perguntar. N�o sei tudo sobre ser um Arqueiro, mas responderei o que puder. At� l�..." ); 
				  } 
				  } else self.say( "Humm... Verifique seu invent�rio de EQUIP e USO novamente.  Estou tentando lhe dar uma arma para voc� treinar." ); 
				} 
			  } 
				else self.say( "Voc� precisa treinar mais. N�o pense que ser um Arqueiro � f�cil..." ); 
			} 
			else if ( target.nJob == 310 ) self.say( "Ahhh... � voc�. O que voc� acha? Como � a vida de um Ca�ador? Voc� parece capaz de lidar com as flechas explosivas com facilidade... continue se esfor�ando." ); 
			else if ( target.nJob == 320 ) self.say( "Ahhh... � voc�. O que voc� acha? Como � a vida de um Balestreiro? Tome cuidado com essas flechas girat�rias. Voc� n�o vai querer ferir pessoas inocentes com elas." ); 
			else if ( target.nJob == 311 ) self.say( "Ahhh... voc� deve ter passado em todos os testes e se tornado o #bRanger#k! Eu sabia que voc� conseguiria. O que voc� acha? N�o vai demorar muito para voc� chegar ao topo e se tornar o melhor arqueiro da regi�o." ); 
			else if ( target.nJob == 321 ) self.say( "Ahhh... voc� deve ter passado em todos os testes e se tornado o #bAtirador#k! Eu sabia que voc� conseguiria. O que voc� acha? N�o vai demorar muito para voc� chegar ao topo e se tornar o melhor arqueiro da regi�o." ); 
		else if ( target.nJob == 312 ) self.say( "Ah, meu DEUS... Voc� finalmente conseguiu! Voc� se tornou #bMestre Arqueiro#k! Eu sabia que voc� conseguiria! Ent�o, como � ser o melhor arqueiro?" ); 
		else if ( target.nJob == 322 ) self.say( "Ah, meu DEUS... Voc� finalmente conseguiu! Voc� se tornou #bAtirador de Elite#k! Eu sabia que voc� conseguiria! Ent�o, como � ser o melhor arqueiro?" ); 
			else self.say( "Voc� n�o quer sentir a adrenalina de ca�ar os monstros a partir da estaca zero? Somente os Arqueiros s�o capazes disso..." ); 
	} 
} 

// �ü� ���� 
script "bowman" { 
	// 2�� 8�Ϻ��� 2�� 11�ϱ��� ���� �̺�Ʈ 
	qr = target.questRecord; 
	inventory = target.inventory; 
	cTime = currentTime; 
	esTime = compareTime( cTime, "05/01/09/00/00" ); 
	eeTime = compareTime( "05/02/11/12/00", cTime ); 

	if ( esTime >= 0 and eeTime >= 0 ) { 
		v = self.askMenu( "���� �̰� ��׽ý����� �ü����� ���� ���� ���� ���� �� �ְ� �ִ� #b#p1012100##k��� �մϴ�. �� ���� �ʿ��� �е��� ���� �׻� �ٻڰ� ������ ������. �׷��� ������ ���� �����̶� �����Ű���?\r\n#b#L0# ���� ���� �λ縦 �帮�� �;��.#l\r\n#L1# �ü��� �����ϰų� ����Ʈ�� �����ϰ� �;��.#k#l" ); 
		if ( v == 0 ) { 
			val = qr.get( 9000500 ); 
			if ( val == "" ) self.say( "���� �λ��... ���� ���� ������� ���� �� ���� �����ÿ�ڸ� ã�ư� ���°� ���?" ); 
			else if ( val == "s" or val == "1" ) self.say( "���� ���� �λ��... ���� �ݰ��� �����̷α���...! ������ ���� �����Ͼ��� #b#p1032001##k���� ã�ư� ������. ������ �λ��ϴ� �� �� �ڶ� ���� �ʴ´�ϴ�. �׷� ����� ���ñ⸸�� ��ٸ��� �ְھ��." ); 
			else if ( val == "2" ) { 
				self.say( "�׷�����... ���ظ� �����ؼ� ���� �λ縦 �Ϸ� ���̴ٴ� �ǰ���? �̷��� �ݰ������...! ���򿡵� ���ó�� ������� ������ �ֽô� ���� ��ôٴ� ���� ������ϴ�. �Դٰ� �̰� #b#p1032001##k���� �������̷α���. ���� ���起 ��������. �����ϴ�... �׷� �̰� ������ Ŀ�׽�Ƽ�� #b#p1052001##k���� ã�ư� ���� �ּ���. �ֱ� �ҽ��� ���� ������ �� �Ǿ��ŵ��. ã�ư��� �Ƹ� ��ô ����� �ݰ��ֽ� �ſ���." ); 
				ret1 = inventory.exchangeEx( 800, "4031076", -1, "4031077,DateExpire:2005021112", 1 ); 
				if ( ret1 == 0 ) self.say( "�̷�... ����� ������ â�� �� �������� ���� ������ ���� �� ������. �������� ��Ÿâ�� �� ĭ�� �ϳ� �̻� ���� �� �ٽ� ������ ���� �ɾ� �ּ���." ); 
				else { 
					target.incEXP( 450, 0 ); 
					qr.set( 9000500, "3" ); 
				} 
			} 
			else if ( val == "3" ) { 
				if ( inventory.itemCount( 4031077 ) >= 1 ) self.say( "�̷��� �� ������ ���� �λ縦 �Ϸ� ã�ƿ� �༭ ���� �������ϴ�. ���򿡵� ���ó�� ������� ������ �ֽô� ���� ��ôٴ� ����� ������. ��, �̹����� Ŀ�׽�Ƽ�� #b#p1052001##k���� ã�ư� ���� �帰 �������� ���� �ּ���. �Ƹ� ��ô �⻵�Ͻ� ������." ); 
				else { 
					self.say( "����... ����� ���� �帰 �������� �Ҿ���� �� ������. �ֽ� �����µ� �����ø� �ȵ���~ �̹����� Ư���� �ٽ� ��� �帱�״� �� �������� Ŀ�׽�Ƽ�� #b#p1052001##k�Բ� ���� �帮�� ���� �λ縦 �� �ּ���. �Ƹ� ��ô ����� �ݰ��ֽ� �ſ���." ); 
					ret2 = inventory.exchangeEx( 0, "4031077,DateExpire:2005021112", 1 ); 
					if ( ret2 == 0 ) self.say( "�̷�... ����� ������ â�� �� �������� ���� ������ ���� �� ������. �������� ��Ÿâ�� �� ĭ�� �ϳ� �̻� ���� �� �ٽ� ������ ���� �ɾ� �ּ���." ); 
				} 
			} 
			else if ( val == "e" ) self.say( "����� ���� ������ ���� ���� �λ縦 �Ϸ� ���� ���̽ñ���. �׶��� ���� �ݰ������ϴ�. ���򿡴� �̰� �ش޶�, ���� �ش޶�� �е鸸 ���� ���ó�� �λ縦 �Ϸ� ���� �̵��� ���� ���ŵ��. �����ε� ���� ������ �鷯 �̰� ���� �̾߱⵵ �� �ְ� �ϼ����� ���ھ��." ); 
			else self.say( "����� �̹� ������ ���� �λ縦 �ϼ̽��ϴ�. ���丮�� ���Ϸ��忡�� �� �ܿ��� �� ���� ���ڰ� �� ��ô�ϴ�. �׵��� ��� ã�ư� ���� �λ縦 �� ���°� �����? �׷� ������ �ּ���~" ); 
		} 
		else if ( v == 1 ) bowmanAction; 
	} 
	else bowmanAction; 
} 

function rogueAction { 
	qr = target.questRecord; 
	val = qr.get( 7500 ); 
	cJob = target.nJob; 
	inventory = target.inventory; 

	if ( val == "s" and ( cJob == 410 or cJob == 420 ) ) { 
		qr.set( 7500, "p1" ); 
		self.say( "A� est� voc�. Alguns dias atr�s, #bArec#k de Ossyria falou comigo sobre voc�. Vejo que est� #Ginteressado:interessada# em visitar o mundo sombrio do terceiro n�vel de classe para gatunos. Para alcan�ar esse objetivo, terei de testar sua for�a para descobrir se voc� merece subir de n�vel. Existe uma fenda no meio de um p�ntano profundo na Ilha Victoria que levar� voc� a uma passagem secreta. L� dentro, voc� enfrentar� meu clone. Sua tarefa � derrot�-lo e trazer o #b#t4031059##k junto com voc�." ); 
		self.say( "Como ele � o meu clone, voc� j� pode esperar uma �rdua batalha. Ele usa habilidades de ataque especiais que voc� nunca viu antes e sua tarefa ser� derrot�-lo em uma luta corpo a corpo. Existe um limite de tempo na passagem secreta, ent�o � essencial que voc� o derrote nesse tempo. Desejo-lhe boa sorte e espero que traga o #b#t4031059##k com voc�." ); 
	} 
	else if ( val == "p1" ) { 
		if ( inventory.itemCount( 4031059 ) >= 1 ) { 
			self.say( "Bom trabalho. Voc� derrotou meu clone e trouxe o #b#t4031059##k a salvo. Voc� se mostrou #Gmerecedor:merecedora# de subir para o 3� n�vel de classe por seu desempenho f�sico. Agora entregue este colar a #bArec#k de Ossyria para fazer a segunda parte do teste. Boa sorte! Voc� vai precisar." ); 
			ret = inventory.exchange( 0, 4031059, -1, 4031057, 1 ); 
			if ( ret == 0 ) self.say( "Tem certeza de que est� com o #b#t4031059##k? Se tiver certeza, certifique-se de que existe um espa�o vazio dispon�vel no seu invent�rio de Etc." ); 
			else qr.set( 7500, "p2" ); 
		} 
		else self.say( "Existe uma fenda no meio de um p�ntano profundo na Ilha Victoria que levar� voc� a uma passagem secreta. L� dentro, voc� enfrentar� meu clone. Sua tarefa � derrot�-lo e trazer o #b#t4031059##k junto com voc�." ); 
	} 
	else if ( val == "p2" ) { 
		if ( inventory.itemCount( 4031057 ) <= 0 ) { 
			self.say( "Ao que parece, voc� perdeu #b#t4031057##k. Por favor, tenha cuidado da pr�xima vez. Aqui est� outro. Sem isto, voc� n�o poder� fazer o teste para 3� avan�o de classe" ); 
			ret = inventory.exchange( 0, 4031057, 1 ); 
			if ( ret == 0 ) self.say( "Hummm... algo est� errado. Seu invent�rio de itens est� cheio? Verifique se o seu invent�rio de Etc. tem espa�o suficiente." ); 
		} 
		else self.say( "Leve #b#t4031057##k com voc� e v� ver #bArec#k de Ossyria. � a prova de que voc� passou em um dos testes para o 3� avan�o de classe. Tenho certeza de que voc� vai passar f�cil no outro teste. Boa sorte para voc�..." ); 
	} 
	else { 
		if ( target.nJob == 400 ) { 
			if ( target.nLevel >= 30 ) { 
					if ( inventory.itemCount( 4031011 ) >= 1 ) self.say( "Voc� ainda n�o viu, n�o foi? V� encontrar o #b#p1072003##k que est� perto de #b#m102040000##k pr�ximo a #m103000000#. Entregue-lhe esta carta e ele lhe dir� o que fazer." ); 
				else if ( inventory.itemCount( 4031012 ) >= 1 ) { 
						self.say( "Hummm... voc� voltou inteiro. Eu sabia que aquele teste ia ser f�cil demais para voc�. Admito que voc� � um grande gatuno. Agora... vou torn�-lo ainda mais #Gpoderoso:poderosa# do que j� �. Mas antes disso... voc� ter� escolher um de dois caminhos. Ser� uma decis�o dif�cil, mas... voc� poder� me fazer qualquer pergunta." ); 
						v1 = self.askMenu( "Certo, quando tomar sua decis�o, clique em [Quero escolher minha profiss�o!] na parte inferior...\r\n#b#L0#Explique-me as caracter�sticas do Mercen�rio.#k#l\r\n#b#L1#Explique-me as caracter�sticas do Arruaceiro.#k#l\r\n#b#L2#Quero escolher minha profiss�o!#k#l" ); 
					if ( v1 == 0 ) { 
							self.say( "Deixe-me explicar o papel do Mercen�rio. O Mercen�rio � o Gatuno que usa estrelas ninjas ou adagas. habilidades como #b#q4100000##k e #b#q4100001##k ajudar�o voc� a usar melhor suas estrelas ninjas. Aprimore #q4100000# ainda mais e seu n�mero m�ximo de estrelas ninjas aumentar�. Ent�o, � melhor voc� aprender essa habilidade. Lembre-se disso." ); 
							self.say( "Vou lhe explicar uma das habilidades do Mercen�rio, #b#q4101004##k. Ela aprimora temporariamente, para voc� e seu grupo, as habilidades de salto e velocidade de movimento. Perfeito para quando se estiver enfrentando inimigos muito r�pidos. Tamb�m � �til para quando se estiver caminhando para um lugar distante. N�o seria �timo chegar logo ao local de destino em vez de levar um dia inteiro?" ); 
							self.say( "E aqui est� outra habilidade dispon�vel para o Mercen�rio: #b#q4101005##k. Ela permite recuperar uma por��o do dano causado em um inimigo e absorv�-lo como HP! Quanto maior for o dano, mais sa�de voc� ir� recuperar... n�o � incr�vel? Lembre que o m�ximo que voc� conseguir� absorver de uma s� vez ser� a metade de seu HP m�ximo. Quanto maior o HP do inimigo, mais voc� conseguir� absorver." ); 
					} 
					else if ( v1 == 1 ) { 
							self.say( "Eis o que � ser um Arruaceiro. Os Arruaceiros s�o Gatunos que se especializam em usar adagas. habilidades como #b#q4200000##k e #b#q4201002##k ajudar�o voc� a usar melhor sua adaga. Para come�ar, as adagas t�m uma r�pida velocidade de ataque e se voc� acrescentar a isso uma especializa��o... nossa! Vai ficar t�o r�pida que assustar� qualquer monstro!" ); 
							self.say( "Vou lhe explicar o que #b#q4201004##k faz pelos Arruaceiros. Oferece a voc� uma chance de roubar um item do inimigo. Voc� poder� roubar apenas um inimigo, mas poder� continuar tentando at� conseguir. O item roubado cair� no ch�o; n�o se esque�a de recolh�-lo imediatamente, pois qualquer um poder� peg�-lo." ); 
							self.say( "Vou lhe explicar o que #b#q4201005##k faz pelos Arruaceiros. Utiliza HP e MP para atacar o inimigo 6 VEZES com a adaga. Quanto maior o n�vel da habilidade, mais ataques poder�o ocorrer. Voc� vai cortar o inimigo em pedacinhos com a adaga... aaaah, n�o � demais? O que voc� acha? Quer se tornar um Arruaceiro e sentir a descarga de adrenalina?" ); 
					} 
					else if ( v1 == 2 ) { 
							v2 = self.askMenu( "Ok... j� tomou sua decis�o? Escolha a classe que voc� gostaria de ter no 2� n�vel de classe.\r\n#b#L0#Mercen�rio#k#l\r\n#b#L1#Arruaceiro#k#l" ); 
						if ( v2 == 0 ) { 
								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como \n#bMercen�rio#k? Depois de tomar sua decis�o, voc� n�o poder� voltar atr�s e mudar de id�ia. Tem CERTEZA disso, n�?" ); 
								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
							else if ( mJob == 1 ) { 
								nPSP = ( target.nLevel - 30 ) * 3; 
									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #SP#k demais... voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
								else { 
									ret = inventory.exchange( 0, 4031012, -1 ); 
										if ( ret == 0 ) self.say( "Hummm... tem certeza de que possui #b#t4031012##k do #p1072003#? � melhor ter certeza. N�o posso permitir um avan�o de classe sem isso." ); 
									else { 
										target.nJob = 410; 
										target.incSP( 1, 0 ); 
										incval1 = random( 300, 350 ); 
										incval2 = random( 150, 200 ); 
										target.incMHP( incval1, 0 ); 
										target.incMMP( incval2, 0 ); 
										inventory.incSlotCount( 2, 4 ); 
											self.say( "Certo, daqui para frente voc� ser� um #bMercen�rio#k. Os Mercen�rios apreciam as sombras e a escurid�o, aguardando o momento certo para atravessar o cora��o do inimigo com uma adaga de maneira s�bita e veloz... n�o deixe de treinar. Vou torn�-lo ainda mais #Gpoderoso:poderosa# do que j� �!" ); 
											self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Mercen�rio. Tamb�m acrescentei uma nova fileira a seu invent�rio de Uso e melhorei seu HP e MP m�ximos... pode conferir." ); 
											self.say( "Tamb�m lhe dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k\nlocalizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
											self.say( "Os Mercen�rios t�m de ser fortes. Mas lembre que voc� n�o pode abusar desse poder e us�-lo em um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante." ); 
									} 
								} 
							}	 
						} 
						else if ( v2 == 1 ) { 
								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bArruaceiro#k? Depois de tomar sua decis�o, voc� n�o poder� voltar atr�s. N�o poder� mudar para outra classe. Tem CERTEZA disso, n�?" ); 
								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
							else if ( mJob == 1 ) { 
								nPSP = ( target.nLevel - 30 ) * 3; 
									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #SP#k demais... voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
								else { 
									ret = inventory.exchange( 0, 4031012, -1 ); 
										if ( ret == 0 ) self.say( "Hummm... tem certeza de que possui a #b#t4031012##k do #p1072003#? � melhor ter certeza. N�o posso permitir um avan�o de classe sem isso." ); 
									else { 
										target.nJob = 420; 
										target.incSP( 1, 0 ); 
										incval1 = random( 300, 350 ); 
										incval2 = random( 150, 200 ); 
										target.incMHP( incval1, 0 ); 
										target.incMMP( incval2, 0 ); 
										inventory.incSlotCount( 2, 4 ); 
											self.say( "Certo, voc� ser� um #bArruaceiro#k a partir de agora. Os Arruaceiros t�m m�os e p�s r�pidos para subjugar os inimigos. N�o deixe de treinar. Vou torn�-lo ainda mais #Gpoderoso:poderosa# do que j� �!" ); 
											self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Arruaceiro. Tamb�m acrescentei uma fileira a seu invent�rio de Uso. Seu HP e MP m�ximos tamb�m foram aumentados... pode conferir." ); 
											self.say( "Tamb�m lhe dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
											self.say( "Um Arruaceiro precisa ser forte... mas lembre que voc� n�o pode abusar desse poder e us�-lo em um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante." ); 
									} 
								} 
							}	 
						} 
					} 
				} 
				else { 
						nSec = self.askYesNo( "Hummm... voc� parece bem mais forte. Voc� se livrou daquele visual med�ocre e fraco e se parece muito mais com um gatuno agora. Bom, o que voc� acha? Deseja se tornar ainda mais #Gpoderoso:poderosa#? � s� fazer um simples teste. Voc� aceita?" ); 
						if ( nSec == 0 ) self.say( "Realmente...? Tornar-se mais forte rapidamente lhe ajudar� muito durante sua jornada. Venha me ver se mudar de id�ia. Vou torn�-lo ainda mais #Gpoderoso:poderosa# do que j� �." ); 
					else if ( nSec == 1 ) { 
							self.say( "Bem pensado. Mas preciso saber se voc� � t�o forte quanto parece. N�o � um teste dif�cil, voc� vai conseguir passar. Primeiro, pegue esta carta... n�o a perca." ); 
						ret = inventory.exchange( 0, 4031011, 1 ); 
							if ( ret == 0 ) self.say( "Bem... parece que n�o h� espa�o nas suas reservas para esta carta. Libere espa�o no seu invent�rio de Etc. e venha falar comigo. Voc� poder� fazer o teste somente com a carta." ); 
							else self.say( "Leve esta carta ao #b#p1072003##k que est� perto de #b#m102040000##k pr�ximo a #m103000000#. Ele est� me substituindo como instrutor. Entregue-lhe a carta e ele aplicar� o teste em meu lugar. Se quiser mais detalhes, pe�a diretamente a ele. Desejo-lhe boa sorte." ); 
					} 
				} 
			} 
			else { 
					v = self.askMenu( "Deseja saber alguma coisa sobre os Gatunos?\r\n#b#L0#Quais s�o as caracter�sticas b�sicas de um Gatuno?#l\r\n#L1#Quais s�o as armas de um Gatuno?#l\r\n#L2#Quais s�o as armaduras de um Gatuno?#l\r\n#L3#Quais s�o as habilidades dispon�veis para um Gatuno?#l" ); 
				if ( v == 0 ) { 
						self.say( "Deixe-me explicar o que significa ser um Gatuno. Os Gatunos t�m apenas vigor e for�a suficientes para sobreviver. N�o recomendamos que voc� treine sua for�a como os Guerreiros. Voc� precisa de SOR e DES..." ); 
						self.say( "Se voc� aumentar o n�vel de sorte e destreza, o dano causado nos inimigos tamb�m aumentar�. Os Gatunos tamb�m se diferenciam de outros indiv�duos utilizando armas de arremesso como estrelas ninjas e facas de arremesso. Com sua elevada destreza, tamb�m conseguem evitar v�rios ataques." ); 
				} 
				else if ( v == 1 ) { 
						self.say( "Os Gatunos usam essas armas. Eles t�m somente a quantidade apropriada de intelig�ncia e poder... seu ponto forte s�o seus movimentos r�pidos e mente mais r�pida ainda..." ); 
						self.say( "Por isso, normalmente usamos adagas ou armas de arremesso. As adagas s�o basicamente pequenas espadas, mas s�o muito r�pidas, permitindo que se fa�am v�rios ataques. Se voc� estiver em uma luta corpo a corpo, use a adaga para eliminar o inimigo com rapidez antes que ele reaja a seu ataque." ); 
						self.say( "Como armas de arremesso, est�o dispon�veis as estrelas ninjas e as facas de arremesso. Mas voc� n�o poder� us�-las sozinhas. V� at� a loja de armas em #m103000000# e eles vender�o uma garra chamada #t1472000#. Equipe-se com ela e ser� capaz de arremessar a estrela ninja que se encontra no invent�rio de Uso." );					 
						self.say( "T�o importante quanto escolher a Garra certa � selecionar o tipo de estrela ninja apropriado. Deseja saber onde conseguir essas estrelas? V� conferir a loja de armaduras pr�xima a esta cidade... provavelmente haver� algu�m que seja especializado nelas..." ); 
				} 
				else if ( v == 2 ) { 
						self.say( "Deixe-me explicar que armaduras os Gatunos utilizam. Os Gatunos valorizam a rapidez, por isso voc� precisar� de roupas que lhe sirvam perfeitamente. Mas eles n�o precisam de cotas de malha como os Arqueiros, pois n�o ajudar�o em nada." ); 
						self.say( "Em vez de roupas espalhafatosas ou uma armadura de placas douradas r�gidas e resistentes, tente vestir roupas simples e confort�veis que lhe sirvam perfeitamente e cumpram sua fun��o. Vai ajudar muito na hora de ca�ar os monstros." ); 
				} 
				else if ( v == 3 ) { 
						self.say( "Para os Gatunos, existem habilidades que suportam a alta precis�o e destreza que possu�mos no geral. Existe uma boa variedade de habilidades, para as estrelas ninjas e as adagas. Escolha sua arma com cuidado, pois suas habilidades ser�o determinadas por ela." ); 
						self.say( "Se voc� estiver usando estrelas ninjas, habilidades como #b#q4000001##k ou #b#q4001344##k s�o perfeitas. #q4001344# permite que voc� atire v�rias estrelas ninjas de uma s� vez, ent�o o ajudar� muito ao perseguir inimigos." ); 
						self.say( "Se estiver usando adagas, escolha #b#q4001002##k ou #b#q4001334##k como suas habilidades. #q4001334#, na verdade, ser� uma �tima habilidade para se utilizar, pois permite que voc� ataque com uma seq��ncia insana de golpes, algo que definitivamente deixar� o inimigo atordoado." ); 
				} 
			} 
		} 
		else if ( target.nJob == 0 ) { 
				self.say( "Quer ser um Gatuno? Voc� ter� de atender a alguns crit�rios. N�o podemos aceitar QUALQUER UM... #bSeu n�vel deve ser no m�nimo 10, com DES maior que 25#k. Vamos ver..." ); 
			if ( target.nLevel > 9 and target.nDEX > 24 ) { 
					nRet = self.askYesNo( "Ah...! Voc� se parece com algu�m que definitivamente poderia ser #Gum:uma# de n�s... tudo o que voc� precisa � uma mente maligna e... sim, sim... ent�o, o que voc� acha? Quer ser um Gatuno?" ); 
					if ( nRet == 0 ) self.say( "Entendo... bem, escolher sua classe � um passo muito importante. Mas voc� n�o deseja viver uma vida mais divertida? Avise-me quando tomar sua decis�o, ok?" ); 
				else if ( nRet == 1 ) { 
				inven = target.inventory; 
					if ( inven.slotCount( 1 ) > inven.holdCount( 1 ) + 1 and inven.slotCount( 2 ) > inven.holdCount( 2 ) + 2 ) { 
						self.say( "Certo, a partir de agora, voc� � #Gum:uma# de n�s! Voc� viver� como um n�made a princ�pio, mas seja paciente e logo voc� estar� levando a boa vida. Certo, n�o � muito, mas vou lhe dar algumas de minhas habilidades... R�����!!" ); 
						ret = inven.exchangeEx( 0, "1472061", 1, "1332063", 1, "2070015,Count:1000", 1000, "2070015,Count:1000", 1000, "2070015,Count:1000", 1000 ); 
						if ( ret == 0 ) self.say( "Verifique seu invent�rio de EQUIP e USO. Estou tentando lhe dar uma arma para voc� treinar no seu primeiro avan�o de classe." ); 
						else {					 
					inventory.incSlotCount( 1, 4 ); 
					inventory.incSlotCount( 4, 4 ); 
					target.nJob = 400; 
					valh = random( 100, 150 ); 
					valm = random( 30, 50 ); 
					target.incMHP( valh, 0 ); 
					target.incMMP( valm, 0 ); 
					target.incSP( 1, 0 ); 
						self.say( "Acabei de criar mais slots no seu invent�rio de equipamentos e etc. Al�m disso, voc� est� mais forte agora. Tornando-se #Gum:uma# de n�s e aprendendo a desfrutar a vida de v�rias maneiras, voc� um dia estar� no topo do nosso mundo de escurid�o. Estarei observando cada passo seu. N�o me decepcione." ); 
						self.say( "Eu apenas lhe dei um pouco de #bSP#k. Quando voc� abrir o #bmenu de habilidades#k no canto inferior esquerdo da tela, voc� ver� as habilidades que poder� aprender usando SP. Um aviso: Voc� n�o poder� aument�-las de uma vez. Existem tamb�m aquelas que ficar�o dispon�veis somente ap�s voc� aprender algumas habilidades primeiro." ); 
						self.say( "Mais um aviso. Depois que escolher sua classe, tente continuar #Gvivo:viva# pelo maior tempo que conseguir. Se voc� morrer, perder� todo o seu n�vel de experi�ncia. Voc� n�o quer perder seus pontos de experi�ncia ganhos com tanto sacrif�cio, n�o �?" ); 
						self.say( "OK! Isso � tudo que posso lhe ensinar. V� aos lugares, treine e se torne ainda melhor. Procure-me quando achar que j� fez tudo o que podia e precisar de algo interessante. Ent�o, e somente ent�o, eu lhe darei experi�ncias ainda melhores..." ); 
						self.say( "Ah, e... e se tiver alguma d�vida sobre ser um Gatuno, sinta-se livre para perguntar. Eu n�o sei TUDO, mas vou ajudar voc� com tudo o que sei. At� l�..." ); 
						}  
					} else self.say( "Verifique seu invent�rio de EQUIP e USO. Estou tentando lhe dar uma arma para voc� treinar no seu primeiro avan�o de classe." ); 
				  } 
			 } 
			else self.say( "Humm... voc� � s� um aprendiz... acho que voc� n�o pode ficar conosco ainda... fique muito mais forte e A� me procure..." ); 
			} 
			else if ( target.nJob == 410 ) self.say( "� voc�. Como � a vida de um Mercen�rio? Agora consigo notar seu porte de Mercen�rio... Muito bom! Continue se esfor�ando!" ); 
			else if ( target.nJob == 420 ) self.say( "� voc�. Como � a vida de um Arruaceiro? Agora consigo notar seu porte de Arruaceiro... Muito bom! Continue se esfor�ando!" ); 
			else if ( target.nJob == 411 ) self.say( "Ahhh... � voc�. Voc� deve ter passado no teste e se tornado um #bAndarilho#k! Eu sabia que voc� conseguiria! O que voc� acha? Vejo algu�m que um dia se tornar� #Go:a# MELHOR #Ggatuno:gatuna# da regi�o..." ); 
			else if ( target.nJob == 421 ) self.say( "Ahhh... � voc�. Voc� deve ter passado no teste e se tornado um #bMestre Arruaceiro#k! Eu sabia que voc� conseguiria! O que voc� acha? Vejo algu�m que um dia se tornar� #Go:a# MELHOR #Ggatuno:gatuna# da regi�o..." ); 
			else self.say( "Fazer explora��es � divertido, e ficar mais forte � bom... mas voc� n�o quer aproveitar a vida ao m�ximo? Que tal se tornar um gatuno como n�s e realmente VIVER a vida? Parece bom, n�o �?" ); 
	} 
} 

// ���� ���� 
script "rogue" { 
/*	// 2�� 8�Ϻ��� 2�� 11�ϱ��� ���� �̺�Ʈ 
	qr = target.questRecord; 
	inventory = target.inventory; 
	cTime = currentTime; 
	esTime = compareTime( cTime, "05/01/09/00/00" ); 
	eeTime = compareTime( "05/02/11/12/00", cTime ); 

	if ( esTime >= 0 and eeTime >= 0 ) { 
		v = self.askMenu( "���� �̰� Ŀ�׽�Ƽ���� �������� ���� ���� ���� ���� �� �ְ� �ִ� #b#p1052001##k���. ã�� �̵��� ���� �׻� �ٻ���. �׷��� ������ ���� ���ΰ�?\r\n#b#L0# ���� ���� �λ縦 �帮�� �;��.#l\r\n#L1# �������� �����ϰų� ����Ʈ�� �����ϰ� �;��.#k#l" ); 
		if ( v == 0 ) { 
			val = qr.get( 9000500 ); 
			if ( val == "" ) self.say( "���� �λ��... ���� ���� ������� ���� �� ���� �����ÿ�ڸ� ã�ư� ���°� ���?" ); 
			else if ( val == "s" or val == "1" or  val == "2" ) self.say( "���� ���� �λ��... ���� ��Ư�� �����̷α�! ������ ���� ��׽ý��� #b#p1012100##k�� ã�ư� ����. ������ �λ��ϴ� �� �� �ڶ� ���� �ʾ�. �׷� �ڳװ� ���⸸�� ��ٸ��� �ְڳ�." ); 
			else if ( val == "3" ) { 
				self.say( "�׷���. ���ظ� �����ؼ� ���� �λ縦 �Ϸ� �Դٴ� ���ΰ�? �̷��� �ݰ��ﶧ��...! ���򿡵� �ڳ�ó�� �츮���� ������ �ִ� �����̰� �ִٴ� �����. �Դٰ� �̰� #b#p1012100##k�� �������̷α�. ���� ���起 �ް�. ����... �׷� �ڳ׿��� �츮 ��θ� ã���� ��ʷ� ������ �ְڳ�. �̰��� ������ #b#p9010000##k���� ���ư� ���Գ�. �Ƹ� ���� ���� �����Ծ�." ); 
				ret1 = inventory.exchangeEx( 800, "4031077", -1, "3993003,DateExpire:2005021112", 1 ); 
				if ( ret1 == 0 ) self.say( "�̷�... �ڳ��� ������ â�� �� ������ ���� ������ ���� �� ���� �׷�. �������� ��ġâ�� �� ĭ�� �ϳ� �̻� ���� �� �ٽ� ������ ���� �ɾ� �ְԳ�." ); 
				else { 
					target.incEXP( 450, 0 ); 
					qr.set( 9000500, "4" ); 
				} 
			} 
			else if ( val == "4" ) { 
				if ( inventory.itemCount( 3993003 ) >= 1 ) self.say( "�̷��� �� ������ ���� �λ縦 �Ϸ� ã�ƿ� �༭ ���� ������. ���򿡵� �ڳ�ó��  �츮���� ������ �ִ� �����̰� �ִٴ� ����� ����. ��, ������ ���� �� ������ ������ #b#p9010000##k���� ���ư� ���Գ�. �Ƹ� ���� ���� �����Ծ�." ); 
				else { 
					self.say( "����... �ڳ� ���� �� ������ �Ҿ���� �� ���� �׷�. ������ �����ε� �Ժη� ������ �ȵ���~ �̹����� Ư���� �ٽ� ���״� �� #t3993003#�� #b#p9010000##k���� ������ ���Գ�. �Ƹ� �и��� ���� ���� ���� ���ϼ�." ); 
					ret2 = inventory.exchangeEx( 0, "3993003,DateExpire:2005021112", 1 ); 
					if ( ret2 == 0 ) self.say( "�̷�... �ڳ��� ������ â�� �� ������ ���� ������ ���� �� ���� �׷�. �������� ��ġâ�� �� ĭ�� �ϳ� �̻� ���� �� �ٽ� ������ ���� �ɾ� �ְԳ�." ); 
				} 
			} 
			else if ( val == "e" ) self.say( "�ڳ״� ���� ������ ���� ���� �λ縦 �Ϸ� ���� �����̷α�. �׶��� ���� �ݰ�����. ���򿡴� �̰� �ش޶�, ���� �ش޶�� �༮�鸸 ���� �ڳ�ó�� �λ縦 �Ϸ� ���� �̵��� ���� ���ŵ�. �����ε� ���� ������ �鷯 �̰� ���� �̾߱⵵ �� �ְ� �ϰԳ�." ); 
			else self.say( "�ڳ״� �̹� ������ ���� �λ縦 �߳�. ���丮�� ���Ϸ��忡�� �� �ܿ��� �� ���� ���ڰ� �� �ִٳ�. �׵��� ��� ã�ư� ���� �λ縦 �� ���°� ���? �׷� ������ �ְԳ�~" ); 
		} 
		else if ( v == 1 ) rogueAction; 
	} 
	else rogueAction;*/ 

	qr = target.questRecord; 
	inven = target.inventory;	 
	if ( qr.getState( 6141 ) == 1 ) { 
		v0 = self.askYesNo( "Bem, est� pronto para ir ao campo de treinamento?" ); 
		if ( v0 ==0 ) self.say( "Acho que voc� n�o est� pronto para isso ainda." ); 
		else { 
			quest = FieldSet( "S4ambush" ); 
			ret = quest.enter( target.nCharacterID, 0 ); 
			if ( ret != 0 ) self.say( "J� existe um gatuno na miss�o. Tente novamente mais tarde." ); 
		} 
	} else { 
		if ( target.nLevel >= 200 ) { 
			if ( target.nJob >= 400 and target.nJob < 500 ) { 
				info = qr.get( 7530 ); 
				if ( info == "" ) { 
					rank = target.getRanking; 
					if ( rank > 0 and rank <= 20 ) { 
						//rogue_lv200( rank );	 
						end; 
					} 
				} 
			} 
		} 

		rogueAction; 
	} 
} 

// The job instructor for warriors 
script "change_swordman" { 
	if ( target.nJob == 100 and target.nLevel >= 30 ) { 
		inventory = target.inventory; 
		nBlack = inventory.itemCount( 4031013 ); 
		if ( inventory.itemCount( 4031008 ) >= 1 ) { 
			if ( nBlack == 0 ) { 
				self.say( "Hummm... definitivamente � uma carta do #b#p1022000##k... ent�o voc� veio at� aqui para tentar o teste e subir para o 2� n�vel de classe como Guerreiro. Certo, vou explicar o teste para voc�. N�o se preocupe, n�o � dif�cil." ); 
				self.say( "Vou mandar voc� para um mapa secreto. Voc� ver� monstros que ainda n�o conhece. Eles se parecem com criaturas comuns, mas t�m um comportamento totalmente diferente. Eles n�o aprimoram seu n�vel de experi�ncia nem fornecem itens." ); 
				self.say( "Voc� receber� um item chamado #b#t4031013##k quando derrubar esses monstros. � uma bolinha de vidro especial feita por mentes malignas e sinistras. Junte 30 e v� falar com um colega meu que est� no mapa. � assim que voc� passar� no teste." ); 
				nRet = self.askYesNo( "Assim que estiver dentro do mapa, voc� n�o poder� sair sem concluir a miss�o. Se voc� morrer, seu n�vel de experi�ncia ser� reduzido... ent�o � melhor voc� apertar os cintos e se preparar... bom, deseja come�ar agora?" ); 
				if ( nRet == 0 ) self.say( "Voc� n�o parece muito #Gpreparado:preparada# para isso. Procure-me s� quando estiver #GPRONTO:PRONTA#. N�o h� portais ou lojas por l�, ent�o � melhor voc� estar 100% #Gpreparado:preparada#." ); 
				else if ( nRet == 1 ) { 
					self.say( "Certo, vou deixar voc� entrar! Derrote os monstros l� dentro, junte 30 itens do tipo #t4031013# e inicie uma conversa com um colega meu que tamb�m est� no mapa. Ele lhe dar� a #b#t4031012##k, provando de que voc� passou no teste. Boa sorte para voc�." ); 
					map1 = random( 0, 2 ); 
					if ( map1 == 0 ) registerTransferField( 108000300, "" ); 
					else if ( map1 == 1 ) registerTransferField( 108000301, "" ); 
					else if ( map1 == 2 ) registerTransferField( 108000302, "" ); 
				} 
			} 
			else if ( nBlack > 0 ) { 
				nRet = self.askYesNo( "Ent�o voc� j� desistiu uma vez. N�o se preocupe, voc� sempre poder� refazer o teste. Agora... deseja voltar l� e tentar mais uma vez?" ); 
				if ( nRet == 0 ) self.say( "Voc� n�o parece muito #Gpreparado:preparada# para isso. Procure-me quando estiver #GPRONTO:PRONTA#. N�o h� portais ou lojas por l�, ent�o � melhor voc� estar 100% #Gpreparado:preparada#." ); 
				else if ( nRet == 1 ) { 
					self.say( "Certo! Vou deixar voc� entrar! Sinto muito, mas terei de remover todas as suas bolinhas de gude antes. Derrote todos os monstros l� dentro, junte 30 itens do tipo #t4031013# e inicie uma conversa com um colega meu que tamb�m est� no mapa. Voc� receber� a #b#t4031012##k comprovando que passou no teste. Boa sorte para voc�." ); 
					inventory.exchange( 0, 4031013, -nBlack ); 
					map1 = random( 0, 2 ); 
					if ( map1 == 0 ) registerTransferField( 108000300, "" ); 
					else if ( map1 == 1 ) registerTransferField( 108000301, "" ); 
					else if ( map1 == 2 ) registerTransferField( 108000302, "" ); 
				} 
			} 
		} 
		else self.say( "Deseja se tornar um Guerreiro muito mais forte do que j� �? Deixe-me tomar conta disso. Voc� parece estar mais do que #Gqualificado:qualificada#. V� procurar o #b#p1022000##k de #m102000000# primeiro..." ); 
	} 
	else if ( target.nJob == 100 and target.nLevel < 30 ) self.say( "Deseja se tornar um Guerreiro muito mais forte do que j� �? Deixe-me tomar conta disso, ent�o, mas... voc� parece #Gfraco:fraca# demais. Inicie um treinamento, torne-se mais #Gpoderoso:poderosa# e depois volte aqui." ); 
	else if ( target.nJob == 110 or target.nJob == 120 or target.nJob == 130 ) self.say( "Hummm... foi voc� quem passou no meu teste outro dia! O que voc� acha? Tornou-se mais forte? Bom! Agora consigo definitivamente notar seu porte de Guerreiro." ); 
} 

// The job instructor for magicians 
script "change_magician" { 
	if ( target.nJob == 200 and target.nLevel >= 30 ) { 
		inventory = target.inventory; 
		nBlack = inventory.itemCount( 4031013 ); 
		if ( inventory.itemCount( 4031009 ) >= 1 ) { 
			if ( nBlack == 0 ) { 
				self.say( "Hummm... definitivamente � uma carta de #b#p1032001##k... ent�o voc� veio at� aqui para tentar o teste e subir para o 2� n�vel de classe como Bruxo? Certo, vou explicar o teste para voc�. N�o se preocupe, n�o � dif�cil." ); 
				self.say( "Vou mandar voc� para um mapa secreto. Voc� encontrar� monstros que n�o se costuma ver em qualquer lugar. Eles se parecem com criaturas comuns, mas t�m um comportamento totalmente diferente. Eles n�o aprimoram seu n�vel de experi�ncia nem fornecem itens." ); 
				self.say( "Voc� receber� um item chamado #b#t4031013##k quando derrubar esses monstros. � uma bolinha de vidro especial feita por mentes malignas e sinistras. Junte 30 e v� falar com um colega meu que est� no mapa. � assim que voc� passar� no teste." ); 
				nRet = self.askYesNo( "Assim que estiver dentro do mapa, voc� n�o poder� sair sem concluir a miss�o. Se voc� morrer, seu n�vel de experi�ncia ser� reduzido... ent�o � melhor voc� apertar os cintos e se preparar... bom, deseja come�ar agora?" ); 
				if ( nRet == 0 ) self.say( "N�o acho que voc� esteja #Gqualificado:qualificada# para isso. Venha falar comigo quando estiver bem mais #Gpreparado:preparada#. N�o h� portais ou lojas por l�, ent�o � melhor voc� estar #Gpreparado:preparada# desde j�." ); 
				else if ( nRet == 1 ) { 
					self.say( "Certo, vou deixar voc� entrar! Assim que estiver dentro do mapa, derrote os monstros e junte 30 itens do tipo #t4031013#. Depois disso, v� falar com o meu colega que tamb�m est� por l� para receber #b#t4031012##k como prova de que voc� passou no teste. Boa sorte para voc�." ); 
					// DEBUG 
					map1 = random( 0, 2 ); 
					if ( map1 == 0 ) registerTransferField( 108000200, "" ); 
					else if ( map1 == 1 ) registerTransferField( 108000201, "" ); 
					else if ( map1 == 2 ) registerTransferField( 108000202, "" ); 
				} 
			} 
			else if ( nBlack > 0 ) { 
				nRet = self.askYesNo( "Ent�o voc� j� desistiu uma vez. N�o se preocupe, voc� sempre poder� refazer o teste. Agora... deseja voltar l� e tentar mais uma vez?" ); 
				if ( nRet == 0 ) self.say( "Voc� n�o parece muito #Gpreparado:preparada# para isso. Procure-me quando estiver #GPRONTO:PRONTA#. N�o h� portais ou lojas por l�, ent�o � melhor voc� ficar 100% #Gpreparado:preparada#." ); 
				else if ( nRet == 1 ) { 
					self.say( "Certo, vou deixar voc� entrar! Sinto muito, mas terei de remover todas as suas bolinhas de gude antes. Assim que estiver dentro do mapa, derrote os monstros e junte 30 itens do tipo #t4031013#. Depois disso, v� falar com o meu colega que tamb�m est� por l� para receber #b#t4031012##k, a prova de que voc� passou no teste. Boa sorte para voc�." );		 
					inventory.exchange( 0, 4031013, -nBlack ); 
					map1 = random( 0, 2 ); 
					if ( map1 == 0 ) registerTransferField( 108000200, "" ); 
					else if ( map1 == 1 ) registerTransferField( 108000201, "" ); 
					else if ( map1 == 2 ) registerTransferField( 108000202, "" ); 
				} 
			} 
		} 
		else self.say( "Deseja se tornar um Bruxo mais poderoso do que j� �? Permita-me tomar conta disso. Voc� parece estar #Gqualificado:qualificada#. V� procurar #b#p1032001##k de #m101000000# primeiro." ); 
	} 
	else if ( target.nJob == 200 and target.nLevel < 30 ) self.say( "Deseja se tornar um Bruxo mais poderoso do que j� �? Permita-me tomar conta disso. No entanto, voc� parece um pouco #Gfraco:fraca#. Treine mais um pouco, fique mais forte e depois volte aqui." ); 
	else if ( target.nJob == 210 or target.nJob == 220 or target.nJob == 230 ) self.say( "Ah, foi voc� quem passou no meu teste outro dia! O que voc� acha? Conseguiu se tornar mais forte? Bom! Agora consigo definitivamente notar seu porte de Bruxo..." ); 
} 

// The job instructor for the bowman 
script "change_archer" { 
	if ( target.nJob == 300 and target.nLevel >= 30 ) { 
		inventory = target.inventory; 
		nBlack = inventory.itemCount( 4031013 ); 
		if ( inventory.itemCount( 4031010 ) >= 1 ) { 
			if ( nBlack == 0 ) { 
				self.say( "Hummm... definitivamente � uma carta de #b#p1012100##k... ent�o voc� veio at� aqui para tentar o teste e fazer o 2� avan�o de classe como Arqueiro? Certo, vou explicar o teste para voc�. Mas n�o se preocupe, n�o � dif�cil." ); 
				self.say( "Vou mandar voc� para um mapa secreto. Voc� encontrar� monstros que n�o se costuma ver em qualquer lugar. Eles se parecem com criaturas comuns, mas t�m um comportamento totalmente diferente. Eles n�o aprimoram seu n�vel de experi�ncia nem fornecem itens." ); 
				self.say( "Voc� receber� uma bolinha de gude chamada #b#t4031013##k quando derrubar esses monstros. � uma bolinha de vidro especial feita por mentes malignas e sinistras. Junte 30 e v� falar com um colega meu que est� no mapa. � assim que voc� passar� no teste." ); 
				nRet = self.askYesNo( "Assim que estiver dentro do mapa, voc� n�o poder� sair sem concluir a miss�o. Se voc� morrer, seu n�vel de experi�ncia ser� reduzido... ent�o � melhor voc� apertar os cintos e se preparar... bom, deseja come�ar agora?" ); 
				if ( nRet == 0 ) self.say( "Voc� n�o parece muito #Gpreparado:preparada# para isso. Procure-me quando estiver #GPRONTO:PRONTA#. N�o h� portais ou lojas por l�, ent�o � melhor voc� ficar 100% #Gpreparado:preparada#." ); 
				else if ( nRet == 1 ) { 
					self.say( "Certo! Vou deixar voc� entrar! Derrote os monstros, junte 30 itens do tipo #t4031013# e depois fale com o meu colega que tamb�m est� por l�. Ele recompensar� voc� com a prova de que passou no teste, a #b#t4031012##k. Boa sorte!" ); 
					map1 = random( 0, 2 ); 
					if ( map1 == 0 ) registerTransferField( 108000100, "" ); 
					else if ( map1 == 1 ) registerTransferField( 108000101, "" ); 
					else if ( map1 == 2 ) registerTransferField( 108000102, "" ); 
				} 
			} 
			else if ( nBlack > 0 ) { 
				nRet = self.askYesNo( "Ent�o voc� j� desistiu uma vez. N�o se preocupe, voc� sempre poder� refazer o teste. Agora... deseja voltar l� e tentar mais uma vez?" ); 
				if ( nRet == 0 ) self.say( "Voc� n�o parece muito #Gpreparado:preparada# para isso. Procure-me quando estiver #GPRONTO:PRONTA#. N�o h� portais ou lojas por l�, ent�o � melhor voc� ficar 100% #Gpreparado:preparada#." ); 
				else if ( nRet == 1 ) { 
					self.say( "Certo! Vou deixar voc� entrar! Sinto muito, mas as bolinhas de gude que voc� juntou ser�o removidas. Quando estiver dentro do mapa, derrote os monstros at� coletar 30 #t4031013# e depois fale com o meu colega que tamb�m est� por l�. Ele recompensar� voc� com a prova de que passou no teste, #t4031013#." ); 
					inventory.exchange( 0, 4031013, -nBlack ); 
					map1 = random( 0, 2 ); 
					if ( map1 == 0 ) registerTransferField( 108000100, "" ); 
					else if ( map1 == 1 ) registerTransferField( 108000101, "" ); 
					else if ( map1 == 2 ) registerTransferField( 108000102, "" ); 
				} 
			} 
		} 
		else self.say( "Voc� deseja ser um Arqueiro ainda mais forte? Deixe-me tomar conta disso. Voc� definitivamente parece #Gqualificado:qualificada#. Por enquanto, v� procurar #b#p1012100##k de #m100000000# primeiro." ); 
	} 
	else if ( target.nJob == 300 and target.nLevel < 30 ) self.say( "Voc� deseja ser um Arqueiro ainda mais forte? Deixe-me tomar conta disso. No entanto... voc� parece bem #Gfraco:fraca#. Ser� bem melhor se voc� puder treinar at� se tornar mais forte e voltar depois." ); 
	else if ( target.nJob == 310 or target.nJob == 320 or target.nJob == 330 ) self.say( "Hummm... foi voc� quem passou no meu teste! O que voc� acha? Sente-se mais #Gpoderoso:poderosa# do que antes? Bom! Voc� definitivamente tem agora o porte de um Arqueiro..." ); 
} 

// The instructor for the thief job advancement 
script "change_rogue" { 
	if ( target.nJob == 400 and target.nLevel >= 30 ) { 
		inventory = target.inventory; 
		nBlack = inventory.itemCount( 4031013 ); 
		if ( inventory.itemCount( 4031011 ) >= 1 ) { 
			if ( nBlack == 0 ) { 
				self.say( "Hummm... definitivamente � uma carta do #b#p1052001##k... ent�o voc� veio at� aqui para tentar o teste e subir para o 2� n�vel de classe como Gatuno? Certo, vou explicar o teste para voc�. N�o se preocupe, n�o � dif�cil." ); 
				self.say( "Vou mandar voc� para um mapa secreto. Voc� encontrar� monstros que n�o se costuma ver em qualquer lugar. Eles se parecem com criaturas comuns, mas t�m um comportamento totalmente diferente. Eles n�o aprimoram seu n�vel de experi�ncia nem fornecem itens." ); 
				self.say( "Voc� receber� uma bolinha de gude chamada #b#t4031013##k quando derrubar esses monstros. � uma bolinha de vidro especial feita por mentes malignas e sinistras. Junte 30 e v� falar com um colega meu que est� no mapa. � assim que voc� passar� no teste." ); 
				nRet = self.askYesNo( "Assim que estiver dentro do mapa, voc� n�o poder� sair sem concluir a miss�o. Se voc� morrer, seu n�vel de experi�ncia ser� reduzido... ent�o � melhor voc� apertar os cintos e se preparar... bom, deseja come�ar agora?" ); 
				if ( nRet == 0 ) self.say( "Voc� n�o parece muito #Gpreparado:preparada# para isso. Procure-me quando estiver #GPRONTO:PRONTA#. N�o h� portais ou lojas por l�, ent�o � melhor voc� ficar 100% #Gpreparado:preparada#." ); 
				else if ( nRet == 1 ) { 
					self.say( "Certo! Vou deixar voc� entrar! Derrote os monstros do mapa para juntar 30 itens do tipo #t4031013# e depois fale com o meu colega que tamb�m est� por l�; ele lhe entregar� a #b#t4031012##k como prova de que voc� passou no teste. Boa sorte para voc�." ); 
					map1 = random( 0, 2 ); 
					if ( map1 == 0 ) registerTransferField( 108000400, "" ); 
					else if ( map1 == 1 ) registerTransferField( 108000401, "" ); 
					else if ( map1 == 2 ) registerTransferField( 108000402, "" ); 
				} 
			} 
			else if ( nBlack > 0 ) { 
				nRet = self.askYesNo( "Ent�o voc� j� desistiu uma vez. N�o se preocupe, voc� sempre poder� refazer o teste. Agora... deseja voltar l� e tentar mais uma vez?" ); 
				if ( nRet == 0 ) self.say( "Voc� n�o parece muito #Gpreparado:preparada# para isso. Procure-me quando estiver #GPRONTO:PRONTA#. N�o h� portais ou lojas por l�, ent�o � melhor voc� estar 100% #Gpreparado:preparada#." ); 
				else if ( nRet == 1 ) { 
					self.say( "Certo! Vou deixar voc� entrar! Sinto muito, mas terei de remover todas as suas bolinhas de gude antes de voc� entrar. Derrote os monstros, junte 30 itens do tipo #t4031013# e depois fale com o meu colega que tamb�m est� por l�. Ele lhe entregar� a #b#t4031012##k como prova de que voc� foi vitorioso. Boa sorte para voc�." ); 
					inventory.exchange( 0, 4031013, -nBlack ); 
					map1 = random( 0, 2 ); 
					if ( map1 == 0 ) registerTransferField( 108000400, "" ); 
					else if ( map1 == 1 ) registerTransferField( 108000401, "" ); 
					else if ( map1 == 2 ) registerTransferField( 108000402, "" ); 
				} 
			} 
		} 
		else self.say( "Voc� realmente deseja se aprimorar como Gatuno? Se sim, deixe-me tomar conta disso... voc� parece ter as habilidades necess�rias... por enquanto, voc� poder� ir ver o #b#p1052001##k de #m103000000#." ); 
	} 
	else if ( target.nJob == 400 and target.nLevel < 30 ) self.say( "Voc� realmente deseja se tornar um Gatuno melhor? Ent�o deixe-me tomar conta disso. No entanto, voc� parece muito #Gfraco:fraca#. Treine at� ficar mais forte e depois volte aqui." ); 
	else if ( target.nJob == 410 or target.nJob == 420 or target.nJob == 430 ) self.say( "Hummm... foi voc� quem passou no meu teste!! O que voc� acha? Ficou mais forte desde ent�o? Bom! Agora consigo definitivamente notar seu porte de Gatuno..." ); 
} 

// Warrior Job Instructor 
script "inside_swordman" { 
	if ( target.nJob == 100 and target.nLevel >= 30 ) { 
		inventory = target.inventory; 
		if ( inventory.itemCount( 4031013 ) >= 30 ) { 
			self.say( "Ahhhhh... voc� juntou 30 itens do tipo #t4031013#!! Deve ter sido dif�cil... que incr�vel! Muito bem. Voc� passou no teste. Vou recompens�-lo com a #b#t4031012##k. Leve isto com voc� e volte a #m102000000#." ); 
			nBlack = inventory.itemCount( 4031013 ); 
			ret = inventory.exchange( 0, 4031013, -nBlack, 4031008, -1, 4031012, 1 ); 
			if ( ret == 0 ) self.say( "Algo est� errado... verifique se voc� tem 30 itens do tipo #t4031013#, a carta do #b#p1022000##k e um slot vazio no seu invent�rio de Etc." ); 
			else registerTransferField( 102020300, "" ); 
		} 
		else { 
			nRet = self.askYesNo( "O que est� acontecendo? Acho que voc� n�o juntou 30 itens do tipo #b#t4031013##k ainda... Se estiver tendo problemas com isso, voc� pode sair agora e tentar novamente mais tarde. Ent�o... quer desistir e dar o fora daqui?" ); 
			if ( nRet == 0 ) self.say( "Isso a�! Pare de reclamar e comece a juntar as bolinhas. Venha falar comigo quando tiver juntado 30 itens do tipo #b#t4031013##k." ); 
			else if ( nRet == 1 ) { 
				self.say( "Mesmo...? Certo, vou deixar voc� sair. Mas n�o desista. Voc� sempre poder� tentar novamente, ent�o n�o desista. At� l�, adeus..." ); 
				registerTransferField( 102020300, "" ); 
			} 
		} 
	} 
	else { 
		self.say( "O qu�? Como voc� chegou aqui?... que estranho... bom, vou deixar voc� sair. Este � um lugar muito perigoso. V� embora ou correr� mais riscos." ); 
		registerTransferField( 102020300, "" ); 
	} 
} 

// Magician Job Instructor 
script "inside_magician" { 
	if ( target.nJob == 200 and target.nLevel >= 30 ) { 
		inventory = target.inventory; 
		if ( inventory.itemCount( 4031013 ) >= 30 ) { 
			self.say( "Ahhhhh... voc� juntou 30 itens do tipo #t4031013#!! Deve ter sido dif�cil... Incr�vel. Certo. Voc� passou no teste e, por isso, vou recompens�-lo com a #b#t4031012##k. Leve este item com voc� e volte a #m101000000#." ); 
			nBlack = inventory.itemCount( 4031013 ); 
			ret = inventory.exchange( 0, 4031013, -nBlack, 4031009, -1, 4031012, 1 ); 
			if ( ret == 0 ) self.say( "Hummm... verifique se voc� tem 30 itens do tipo #t4031013#, a carta de #b#p1032001##k e um slot vazio no seu invent�rio de Etc." ); 
			else registerTransferField( 101020000, "" ); 
		} 
		else { 
			nRet = self.askYesNo( "Hummm... o que est� acontecendo? Acho que voc� n�o juntou 30 itens do tipo #b#t4031013##k ainda... Se estiver tendo problemas com isso, voc� pode sair agora e tentar novamente mais tarde. Ent�o... quer desistir e dar o fora daqui?" ); 
			if ( nRet == 0 ) self.say( "Isso a�! Pare de reclamar e comece a juntar as bolinhas. Venha falar comigo quando tiver juntado 30 itens do tipo #b#t4031013##k." ); 
			else if ( nRet == 1 ) { 
				self.say( "Mesmo...? Certo, vou deixar voc� sair. Mas n�o desista. Voc� sempre poder� tentar novamente, ent�o n�o desista. At� l�, adeus..." ); 
				registerTransferField( 101020000, "" ); 
			} 
		} 
	} 
	else { 
		self.say( "O qu�? Como voc� chegou aqui?... que estranho... bom, vou deixar voc� sair. Este � um lugar muito perigoso. V� embora ou correr� mais riscos." ); 
		registerTransferField( 101020000, "" ); 
	} 
} 

// Bowman Job Instructor 
script "inside_archer" { 
	if ( target.nJob == 300 and target.nLevel >= 30 ) { 
		inventory = target.inventory; 
		if ( inventory.itemCount( 4031013 ) >= 30 ) { 
			self.say( "Ahhhhh... voc� juntou 30 itens do tipo #t4031013#!! N�o foi dif�cil?? Muito bem. Voc� passou no teste e, por isso, vou recompens�-lo com a #b#t4031012##k. Leve este item com voc� e volte a #m100000000#." ); 
			nBlack = inventory.itemCount( 4031013 ); 
			ret = inventory.exchange( 0, 4031013, -nBlack, 4031010, -1, 4031012, 1 ); 
			if ( ret == 0 ) self.say( "Hummm... algo est� errado... verifique se voc� tem 30 itens do tipo #t4031013#, a carta de #b#p1012100##k e um slot vazio no seu invent�rio de Etc." ); 
			else registerTransferField( 106010000, "" ); 
		} 
		else { 
			nRet = self.askYesNo( "Hummm... o que est� acontecendo? Acho que voc� n�o juntou 30 itens do tipo #b#t4031013##k ainda... Se estiver tendo problemas com isso, voc� pode sair agora e tentar novamente mais tarde. Ent�o... quer desistir e dar o fora daqui?" ); 
			if ( nRet == 0 ) self.say( "Isso a�! Pare de reclamar e comece a juntar as bolinhas. Venha falar comigo quando tiver juntado 30 itens do tipo #b#t4031013##k." ); 
			else if ( nRet == 1 ) { 
				self.say( "Mesmo...? Certo, vou deixar voc� sair. Mas n�o desista. Voc� sempre poder� tentar novamente, ent�o n�o desista. At� l�, adeus..." ); 
				registerTransferField( 106010000, "" ); 
			} 
		} 
	} 
	else { 
		self.say( "O qu�? Como voc� chegou aqui?... que estranho... bom, vou deixar voc� sair. Este � um lugar muito perigoso. V� embora ou correr� mais riscos." ); 
		registerTransferField( 106010000, "" ); 
	} 
} 

// Thief Job Instructor 
script "inside_rogue" { 
	if ( target.nJob == 400 and target.nLevel >= 30 ) { 
		inventory = target.inventory; 
		if ( inventory.itemCount( 4031013 ) >= 30 ) { 
			self.say( "Ahhhhh... voc� juntou 30 itens do tipo #t4031013#s!! Deve ter sido dif�cil... Incr�vel. Certo. Voc� passou no teste e, por isso, vou recompens�-lo com #b#t4031012##k. Leve este item com voc� e volte a #m103000000#." ); 
			nBlack = inventory.itemCount( 4031013 ); 
			ret = inventory.exchange( 0, 4031013, -nBlack, 4031011, -1, 4031012, 1 ); 
			if ( ret == 0 ) self.say( "Hummm... algo est� errado... verifique se voc� tem 30 itens do tipo #t4031013#, a carta do #b#p1052001##k e um slot vazio no seu invent�rio de Etc." ); 
			else registerTransferField( 102040000, "" ); 
		} 
		else { 
			nRet = self.askYesNo( "Hummm... o que est� acontecendo? Acho que voc� n�o juntou 30 itens do tipo #b#t4031013##k ainda... Se estiver tendo problemas com isso, voc� pode sair agora e tentar novamente mais tarde. Ent�o... quer desistir e dar o fora daqui?" ); 
			if ( nRet == 0 ) self.say( "Isso a�! Pare de reclamar e comece a juntar as bolinhas. Venha falar comigo quando tiver juntado 30 itens do tipo #b#t4031013##k." ); 
			else if ( nRet == 1 ) { 
				self.say( "Mesmo...? Certo, vou deixar voc� sair. Mas n�o desista. Voc� sempre poder� tentar novamente, ent�o n�o desista. At� l�, adeus..." ); 
				registerTransferField( 102040000, "" ); 
			} 
		} 
	} 
	else { 
		self.say( "O qu�? Como voc� chegou aqui? Que estranho... bom, vou deixar voc� sair. Este � um lugar muito perigoso. V� embora ou correr� mais riscos." ); 
		registerTransferField( 102040000, "" ); 
	} 
} 
