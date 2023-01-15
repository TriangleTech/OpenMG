 module "standard.s"; 

 function fighterAction { 
 	qr = target.questRecord; 
 	val = qr.get( 7500 ); 
 	cJob = target.nJob;
 	inventory = target.inventory; 

 	if ( val == "s" and ( cJob == 110 or cJob == 120 or cJob == 130 ) ) { 
 		qr.set( 7500, "p1"); 
 		self.say( "Estava esperando voc�. Alguns dias atr�s, #bTylus#k de Ossyria me falou de voc�. Bem... Eu gostaria de testar sua for�a. Existe uma passagem secreta perto do t�nel de formigas. S� voc� poder� atravess�-la. Quando estiver l� dentro, voc� encontrar� meu outro eu. Derrote-o e traga o #b#t4031059##k para mim."); 
 		self.say( "Meu outro eu � bastante forte. Ele usa muitas habilidades especiais e voc� dever� travar uma luta corpo a corpo com ele. Entretanto, n�o � poss�vel permanecer muito tempo na passagem secreta. � essencial que voc� o derrote o mais r�pido poss�vel. Bem... Boa sorte! Fico aguardando voc� trazer o #b#t4031059##k para mim." ); 
 	} 
 	else if ( val == "p1" ) { 
 		if ( inventory.itemCount( 4031059 ) >= 1 ) { 
 			self.say( "Uau... Voc� derrotou meu outro eu e trouxe o #b#t4031059##k para mim. Muito bom! Isso certamente prova sua for�a. Em termos de for�a, voc� j� pode ir para o 3� n�vel nde classe. Conforme prometido, darei  #b#t4031057##k a voc�. Entregue este colar a #bTylus#k de Ossyria e poder� fazer um segundo teste para o 3� n�vel de classe. Boa sorte~." ); 
 			ret = inventory.exchange( 0, 4031059, -1, 4031057, 1 ); 
 			if ( ret == 0 ) self.say( "Hum... que estranho. Tem certeza de que est� com o #b#t4031059##k? Se estiver, certifique-se de que possui um slot vazio na guia de itens." ); 
 			else qr.set( 7500, "p2"); 
 		} 
 		else self.say( "Existe uma passagem secreta perto do t�nel de formigas. S� voc� poder� atravess�-la. Quando estiver l� dentro, voc� encontrar� meu outro eu. Derrote-o e traga o #b#t4031059##k para mim." ); 
 	} 
 	else if ( val == "p2" ) { 
 		if ( inventory.itemCount( 4031057 ) <= 0 ) { 
 			self.say( "Ahh! Voc� perdeu #b#t4031057##k, hein? Eu disse que deveria tomar cuidado... Pelo amor de Deus, vou te dar outro... DE NOVO. Por favor, tenha cuidado desta vez. Sem isto, voc� n�o poder� fazer o teste para o 3� n�vel de classe." ); 
 			ret = inventory.exchange( 0, 4031057, 1 ); 
 			if ( ret == 0 ) self.say( "Hum... que estranho. Certifique-se de que possui um slot vazio na guia de itens." ); 
 		} 
 		else self.say( "Entregue este colar a #bTylus#k de Ossyria e poder� fazer um segundo teste para o 3� n�vel de classe. Boa sorte~!" ); 
 	} 
 	else { 
 		if ( target.nJob == 100 ) { 
 			if ( target.nLevel >= 30 ) { 
 				if ( inventory.itemCount( 4031008 ) >= 1 ) self.say( "Ainda n�o encontrou a pessoa? Encontre o #b#p1072000##k que est� perto de #b#m102020300##k pr�ximo a #m102000000#. Entregue a carta para ele e talvez ele te diga o que voc� precisa fazer." ); 
 				else if ( inventory.itemCount( 4031012 ) >= 1 ) { 
 						self.say( "Ahh! Voc� voltou sem nenhum arranh�o! Eu sabia que voc� iria tirar de letra... admito que voc� � um Guerreiro forte e formid�vel... certo, agora te tornarei um Guerreiro ainda mais forte do que j� �... MAS, antes disso, voc� ter� de escolher um dos tr�s caminhos que te ser�o oferecidos... n�o vai ser f�cil, por isso, se tiver alguma pergunta, manda ver!" ); 
 						v1 = self.askMenu( "Certo, quando tomar sua decis�o, clique em [Quero escolher minha classe!] na parte inferior.\r\n#b#L0#Explique-me o papel do Soldado.#k#l\r\n#b#L1#Explique-me o papel do Escudeiro.#k#l\r\n#b#L2#Explique-me o papel do Lanceiro.#k#l\r\n#b#L3#Quero escolher minha classe!#k#l" ); 
 					if ( v1 == 0 ) { 
 							self.say( "Deixe-me explicar o papel do Soldado. Ele � o tipo mais comum de Guerreiro. As armas utilizadas s�o a #b espada #k e o #b machado #k, pois existem habilidades avan�adas que poder�o ser adquiridas mais tarde. N�o utilize as duas armas ao mesmo tempo. Fique apenas com aquela que te agradar mais..." ); 
 							self.say( "Al�m disso, tamb�m existem habilidades como #b#q1101006##k e #b#q1101007##k dispon�veis para os soldados. #b#q1101006##k � o tipo de habilidade que permite que voc� e seu grupo aprimorem suas armas. Com ela, voc� poder� derrubar seus inimigos com uma carga repentina de poder, o que a torna muito �til. A desvantagem � que sua habilidade de prote��o (defesa) ficar� um pouco reduzida." ); 
 							self.say( "#b#q1101007##k � a habilidade que permite que voc� devolva uma por��o do dano causado pela arma do inimigo. Quanto maior for o ataque, pior ser� o dano que sofrer�o de volta. Isso ajudar� aqueles que preferem combates de perto. O que voc� acha? N�o � legal ser um Soldado?" ); 
 					} 
 					else if ( v1 == 1 ) { 
 							self.say( "Deixe-me explicar o papel do Escudeiro. O Escudeiro � um aprendiz de cavaleiro dando seus primeiros passos. Ele costuma usar #bespadas#k e/ou #bma�as#k. N�o � uma boa id�ia usar as duas armas, ent�o � melhor voc� escolher uma e permanecer com ela." ); 
 							self.say( "Al�m disso, tamb�m existem habilidades como #b#q1201006##k e #b#q1101007##k para voc� aprender. #b#q1201006##k faz qualquer oponente ao seu redor perder algumas habilidades de ataque e defesa por um certo tempo. Ela � muito �til contra monstros poderosos com boas habilidades de ataque. Tamb�m funciona bem em jogos cooperativos." ); 
 							self.say( "#b#q1101007##k � uma habilidade que te permite devolver por um certo tempo uma determinada quantidade do dano causado pelos monstros. Quanto maior for o dano que voc� receber, mais dano voc� tamb�m causa ao inimigo. � a habilidade perfeita para os Guerreiros que est�o se especializando em combates corpo a corpo. O que voc� acha? N�o � legal ser um Escudeiro?" ); 
 					} 
 					else if ( v1 == 2 ) { 
 							self.say( "Deixe-me explicar o papel do Lanceiro. � uma classeque se especializa no uso de armas longas, como #blan�as#k e #blan�as de batalha#k. Existem muitas habilidades �teis para serem adquiridas com ambas as armas, mas recomendo que voc� escolha uma e permane�a com ela." ); 
 							self.say( "Al�m disso, tamb�m existem habilidades como #b#q1301006##k e #b#q1301007##k para voc� aprender. #b#q1301006##k permite que voc� e os membros do seu grupo aprimorem a defesa de ataque e magia por um certo tempo. � uma habilidade bastante �til para os Lanceiros com armas que exigem as duas m�os e n�o conseguem se defender ao mesmo tempo." ); 
 							self.say( "#b#q1301007##k � uma habilidade que permite que voc� e seu grupo aprimorem temporariamente o HP e MP m�ximos. Voc� poder� realizar um aumento de at� 160%, logo a habilidade ajudar� voc� e seu grupo principalmente quando estiverem partindo para cima de oponentes realmente poderosos. O que voc� acha? Voc� n�o acha legal ser um Lanceiro?" ); 
 					} 
 					else if ( v1 == 3 ) { 
 							v2 = self.askMenu( "Hummm, j� se decidiu? Escolha o 2� n�vel na classe de sua prefer�ncia.\r\n#b#L0#Soldado#k#l\r\n#b#L1#Escudeiro#k#l\r\n#b#L2#Lanceiro#k#l" ); 
 							if ( v2 == 0 ) { 
 								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bSoldado#k? Depois que tomar sua decis�o, voc� n�o poder� voltar atr�s e escolher outra carreira... ainda quer isso?" ); 
 								if ( mJob == 0 ) self.say( "Mesmo? Ent�o voc� precisa pensar um pouco mais. N�o h� pressa... n�o � algo que se deva fazer de qualquer jeito... me informe quando tomar sua decis�o, certo?" ); 
 								else if ( mJob == 1 ) { 
 									nPSP = ( target.nLevel - 30 ) * 3; 
 									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #bSP#k demais... voc� n�o pode subir para o 2� n�velde classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
 									else { 
 										ret = inventory.exchange( 0, 4031012, -1 ); 
 										if ( ret == 0 ) self.say( "Humm... Tem certeza de que possui #b#t4031012##k do #p1072000#? N�o posso permitir subir um n�vel de classe sem isso." ); 
 									//job adv. - warrior 
 									else { 
 										target.nJob = 110; 
 										target.incSP( 1, 0 ); 
 										incval = random( 300, 350 ); 
 										target.incMHP( incval, 0 );     
 										inventory.incSlotCount( 2, 4 ); 
 										inventory.incSlotCount( 4, 4 ); 

 											self.say( "Certo! Voc� agora se tornou um #bSoldado#k! Um soldado luta para ser o mais forte entre os fortes e nunca p�ra de lutar. Nunca perca sua vontade de lutar e sempre se esforce. Vou ajudar voc� a se tornar mais forte do que j� �." ); 
 											self.say( "Eu te entreguei um livro que cont�m a lista de habilidades que voc� pode adquirir como Soldado. Nesse livro, voc� vai encontrar v�rias habilidades que o Soldado pode aprender. Seus invent�rios de Uso e Etc. tamb�m foram expandidos com uma nova fileira de slots dispon�veis. Seu MP m�ximo tamb�m cresceu... pode conferir." ); 
 											self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
 											self.say( "Os soldados t�m de ser fortes. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante." ); 
 									} 
 								} 
 							}	 
 						} 
 						else if ( v2 == 1 ) { 
 							mJob = self.askYesNo( "Ent�o voc� quer fazer o 2� n�vel de classe como #bEscudeiro#k? Lembre que, quando tomar sua decis�o, voc� n�o poder� mais mudar de classe. Tem certeza de que quer fazer isso?" ); 
 							if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
 							else if ( mJob == 1 ) { 
 								nPSP = ( target.nLevel - 30 ) * 3; 
 								if ( target.nSP > nPSP ) self.say( "Hummm, acho que voc� tem #bSP#k demais. Voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
 								else { 
 									ret = inventory.exchange( 0, 4031012, -1 ); 
 									if ( ret == 0 ) self.say( "Hummm, tem certeza de que possui #b#t4031012##k do #p1072000#? � melhor ter certeza, pois n�o posso permitir subir um n�vel de classe sem isso." ); 
 									// Job Adv = Page 
 									else { 
 										target.nJob = 120; 
 										target.incSP( 1, 0 ); 
 										incval = random( 100, 150 ); 
 										target.incMMP( incval, 0 );     
 										inventory.incSlotCount( 2, 4 ); 
 										inventory.incSlotCount( 4, 4 ); 

 											self.say( "Certo! Voc� agora se tornou um #bEscudeiro#k! Os Escudeiros t�m a intelig�ncia e a bravura de um Guerreiro... espero que voc� siga o caminho certo com a mentalidade certa... vou ajudar voc� a se tornar mais forte do que j� �." ); 
 											self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Escudeiro. Nesse livro, voc� encontrar� v�rias habilidades que o Escudeiro poder� aprender. Seus invent�rios de Uso e Etc. tamb�m foram expandidos com uma nova fileira de slots dispon�veis. Seu MP m�ximo tamb�m aumentou... pode conferir." ); 
 											self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
 											self.say( "Os Escudeiros t�m de ser fortes. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante." ); 
 									} 
 								} 
 							}	 
 						} 
 						else if ( v2 == 2 ) { 
 								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bLanceiro#k? Quando tomar sua decis�o, voc� n�o poder� fazer avan�os em nenhuma outra classe. Tem certeza disso?" ); 
 								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor sobre isso? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
 							else if ( mJob == 1 ) { 
 								nPSP = ( target.nLevel - 30 ) * 3; 
 									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #bSP#k demais... voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
 								else { 
 									ret = inventory.exchange( 0, 4031012, -1 ); 
 										if ( ret == 0 ) self.say( "Hummm... tem certeza de que possui #b#t4031012##k do #p1072000#? � melhor ter certeza. Voc� n�o poder� subir para o pr�ximo n�vel de classe sem isso." ); 
 									// Job Adv = spearman 
 									else { 
 										target.nJob = 130; 
 										target.incSP( 1, 0 ); 
 										incval = random( 100, 150 ); 
 										target.incMMP( incval, 0 );      
 										inventory.incSlotCount( 2, 4 ); 
 										inventory.incSlotCount( 4, 4 ); 

 											self.say( "Certo! Voc� agora se tornou um #bLanceiro#k! O Lanceiro usa o poder da escurid�o para derrubar os inimigos, sempre nas sombras... acredite em si mesmo e em seu incr�vel poder durante a sua jornada... vou ajudar voc� a se tornar mais forte do que j� �." ); 
 											self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Lanceiro. Nesse livro, voc� encontrar� v�rias habilidades que o Lanceiro poder� aprender. Seus invent�rios de Uso e Etc. tamb�m foram expandidos com uma nova fileira de slots dispon�veis. Seu MP m�ximo tamb�m cresceu... pode conferir." ); 
 											self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
 											self.say( "Um Lanceiro precisa ser forte. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante. Estarei esperando voc�." ); 
 									} 
 								} 
 							}	 
 						} 
 					} 
 				} 
 				else { 
 						nSec = self.askYesNo( "Nossa, voc� realmente cresceu! N�o � mais #Gpequeno:pequena# e #Gfraco:fraca#... agora consigo notar seu porte de Guerreiro! Impressionante... ent�o, o que acha? Deseja se tornar mais forte do que j� �? � s� fazer um simples teste! Aceita?" ); 
 						if ( nSec == 0 ) self.say( "Mesmo? Tornar-se mais forte rapidamente te ajudar� muito durante sua jornada... se mudar de id�ia no futuro, poder� voltar aqui quando quiser. Lembre que eu tornarei voc� muito mais #Gpoderoso:poderosa# do que j� �." ); 
 						else if ( nSec == 1 ) { 
 							self.say( "Bem pensado. Voc� � forte, n�o me entenda mal, mas ainda existe a necessidade de testar sua for�a e ver se o seu poder � real. O teste n�o � muito dif�cil, voc� se sair� bem... Aqui, pegue esta carta. N�o a perca." ); 
 							ret = inventory.exchange( 0, 4031008, 1 ); 
 								if ( ret == 0 ) self.say( "Hummm... n�o posso te dar a carta porque voc� n�o tem espa�o suficiente no seu invent�rio de Etc. Volte depois de ter liberado um ou dois espa�os no seu invent�rio, pois a carta � o �nico jeito de voc� fazer o teste." ); 
 								else self.say( "Entregue esta carta ao #b#p1072000##k que pode estar perto de #b#m102020300##k pr�ximo a #m102000000#. Ele est� me substituindo como instrutor, pois ando ocupado por aqui. Entregue-lhe a carta e ele aplicar� o teste em meu lugar. Outras informa��es ser�o passadas diretamente por ele a voc�. Boa sorte para voc�." ); 
 					} 
 				} 
 			} 
 			else { 
 				v = self.askMenu( "Ah, voc� tem uma pergunta? \r\n#b#L0#Quais s�o as caracter�sticas gerais de um Guerreiro?#l\r\n#L1#Quais s�o as armas de um Guerreiro?#l\r\n#L2#Quais s�o as armaduras de um Guerreiro?#l\r\n#L3#Quais s�o as habilidades dispon�veis para um Guerreiro?#l" ); 
 				if ( v == 0 ) { 
 						self.say( "Deixe-me explicar o papel do Guerreiro. Os Guerreiros possuem for�a f�sica e poder incr�veis. Eles tamb�m sabem se defender de ataques de monstros, por isso s�o os melhores para lutar em combates corpo a corpo com os monstros. Com um alto n�vel de vigor, voc� n�o vai morrer f�cil." ); 
 						self.say( "Entretanto, para atacar o monstro com precis�o, voc� precisar� de uma boa dose de DES, ent�o n�o se concentre apenas em aprimorar sua FOR. Se quiser aprimorar-se rapidamente, recomendo que enfrente monstros mais fortes." ); 
 				} 
 				else if ( v == 1 ) { 
 						self.say( "Deixe-me explicar as armas que um Guerreiro utiliza. Ele usa armas que lhe permitem cortar, esfaquear e atacar. Voc� n�o poder� usar armas como arcos e armas de proj�teis. Muito menos cajados pequenos." ); 
 						self.say( "As armas mais comuns s�o espadas, ma�as, lan�as de batalha, lan�as, machados, etc... Toda arma tem suas vantagens e desvantagens, por isso examine-as bem antes de escolher uma delas. Por enquanto, tente usar aquelas com um n�vel elevado de ataque." ); 
 				} 
 				else if ( v == 2 ) { 
 						self.say( "Deixe-me explicar as armaduras que um Guerreiro utiliza. Os Guerreiros s�o fortes e t�m muito vigor, por isso conseguem usar armaduras pesadas e resistentes. Elas n�o s�o muito bonitas... mas servem bem a seu prop�sito: serem as melhores armaduras." ); 
 						self.say( "Os escudos, principalmente, s�o perfeitos para os Guerreiros.  Lembre-se, entretanto, de que voc� n�o poder� usar um escudo se estiver empunhando uma arma de duas m�os. Eu sei que ser� uma decis�o dif�cil..." ); 
 				} 
 				else if ( v == 3 ) { 
 						self.say( "As habilidades dispon�veis para os Guerreiros s�o destinadas a sua for�a f�sica e poder incr�veis. Aquelas que aprimoram o combate corpo a corpo s�o as que ajudar�o mais voc�. Tamb�m existe uma habilidade que permite recuperar seu HP. � melhor voc� se tornar um especialista nela." ); 
 						self.say( "As duas habilidades de ataque dispon�veis s�o #b#q1001004##k e #b#q1001005##k. #q1001004# � aquela que causa um grande dano em um �nico inimigo. Voc� poder� aprimorar essa habilidade desde o come�o." ); 
 						self.say( "Por sua vez, #q1001005# n�o causa muito dano, mas ataca v�rios inimigos em uma �rea de uma s� vez. Voc� poder� us�-la somente quando j� tiver aprimorado #q1001004# uma vez. Voc� decide." ); 
 				} 
 			} 
 		} 
 		else if ( target.nJob == 0 ) { 
 			self.say( "Voc� deseja se tornar um Guerreiro? Voc� precisa cumprir alguns crit�rios para isso. #bVoc� precisa ter no m�nimo n�vel 10, com pelo menos 35 de FOR#k. Vamos ver..." ); 
 			if ( target.nLevel > 9 and target.nSTR > 34 ) { 
 					nRet = self.askYesNo( "Voc� definitivamente tem o aspecto de um Guerreiro. Pode n�o ter chegado l� ainda, mas j� consigo ver um Guerreiro em voc�. O que voc� acha? Voc� deseja se tornar um Guerreiro?" ); 
 					if ( nRet == 0 ) self.say( "Mesmo? Precisa de mais tempo para pensar melhor sobre isso? Fique � vontade... n�o � algo que se deva fazer de qualquer jeito. Venha falar comigo quando tomar sua decis�o." ); 
 				else if ( nRet == 1 ) { 
 					inven = target.inventory; 
 					if ( inven.slotCount( 1 ) > inven.holdCount( 1 ) ) { 
 						self.say( "A partir de agora, voc� ser� um Guerreiro! Continue se esfor�ando... Vou melhorar um pouco suas habilidades, na esperan�a de que voc� continue treinando para ser mais forte do que j� �. Zaaaaaaz!!" ); 
 						ret = inven.exchange( 0, 1302077, 1 ); 
 						if ( ret == 0 ) self.say( "Humm. Verifique se voc� tem pelo menos um slot vazio na sua janela de Equip. Eu gostaria de te dar uma arma como recompensa pelo seu primeiro n�vel de classe." ); 
 						else { 
 					target.nJob = 100; 
 					incval = random( 200, 250 ); 
 					target.incMHP( incval, 0 );                                                                                                                                                         
 					target.incSP( 1, 0 ); 
 					inventory.incSlotCount( 1, 4 ); 
 					inventory.incSlotCount( 2, 4 ); 
 					inventory.incSlotCount( 3, 4 ); 
 					inventory.incSlotCount( 4, 4 ); 
 					self.say( "Voc� est� muito mais forte agora. Al�m disso, todos os seus invent�rios t�m slots a mais. Uma fileira inteira, para ser mais exato. Pode conferir. Eu apenas te dei um pouco de #bSP#k. Quando voc� abrir o #bmenu de habilidades#k no canto inferior esquerdo da tela, voc� ver� as habilidades que poder� aprender usando SP. Um aviso: Voc� n�o poder� aument�-las todas de uma vez. Existem tamb�m aquelas que ficar�o dispon�veis somente ap�s voc� aprender algumas habilidades primeiro." ); 
 					self.say( "Mais um aviso. Depois que escolher sua classe, tente continuar vivo pelo maior tempo que conseguir. Se voc� morrer, perder� o seu n�vel de experi�ncia. Voc� n�o quer perder seus pontos de experi�ncia que ganhou com tanto sacrif�cio, n�o �? Isso � tudo que posso te ensinar... daqui para frente, voc� ter� de se esfor�ar cada vez mais para se tornar cada vez melhor. Venha me ver quando perceber que est� se sentindo com mais poder do que agora." ); 
 					self.say( "Ah, e... e se tiver alguma d�vida sobre ser um Guerreiro, � s� vir me perguntar. Eu n�o sei TUDO, mas vou ajudar voc� com tudo o que sei. At� l�..." ); 
 				} 
 					} else self.say( "Humm... Verifique se existe um slot vazio na sua janela de Equip. Estou tentando te dar uma arma como recompensa pelo seu desempenho." ); 
 				} 
 			} 
 			else self.say( "N�o acredito que voc� j� tenha as qualidades para ser um Guerreiro ainda. Voc� precisa treinar muito para se tornar um ou n�o conseguir� lidar com a situa��o. Torne-se bem mais forte e ent�o venha me procurar." ); 
 		} 
 		else if ( target.nJob == 110 ) self.say( "Ahhh! � voc�! O que voc� acha? Como � a vida de um Soldado? Voc�... parece bem mais forte do que antes! Espero que continue se aprimorando." ); 
 		else if ( target.nJob == 120 ) self.say( "Ahhh... � voc�! O que voc� acha? Como � a vida de um Escudeiro? Sei que voc� ainda � um aprendiz, mas em breve o treinamento se encerrar� e voc� ser� chamado de cavaleiro!" ); 
 		else if ( target.nJob == 130 ) self.say( "Ahhh... � voc�! O que voc� acha? Como � a vida de um Lanceiro? Continue treinando com dedica��o, pois um dia voc� se tornar� um cavaleiro inigual�vel..." ); 
 		else if ( target.nJob == 111 ) self.say( "Ahhh... Voc� finalmente se tornou um #bTempl�rio#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Templ�rio? Por favor, dedique-se e treine ainda mais." ); 
 		else if ( target.nJob == 121 ) self.say( "Ahhh... Voc� finalmente se tornou um #bCavaleiro#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Cavaleiro? Por favor, dedique-se e treine ainda mais." ); 
 		else if ( target.nJob == 131 ) self.say( "Ahhh... Voc� finalmente se tornou um #bCavaleiro Draconiano#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Cavaleiro Draconiano? Por favor, dedique-se e treine ainda mais." ); 
 		else if ( target.nJob == 112 ) self.say( "Ahhh... Voc� finalmente se tornou um #bHer�i#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Her�i? Por favor, dedique-se e treine ainda mais." ); 
 		else if ( target.nJob == 122 ) self.say( "Ahhh... Voc� finalmente se tornou um #bPaladino#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Paladino? Por favor, dedique-se e treine ainda mais." ); 
 		else if ( target.nJob == 132 ) self.say( "Ahhh... Voc� finalmente se tornou um #bCavaleiro Negro#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Cavaleiro Negro? Por favor, dedique-se e treine ainda mais." ); 
 		else self.say( "Que f�sico magn�fico! Que poder incr�vel! Guerreiros s�o os melhores!!!! O que voc� acha? Deseja subir de classe como guerreiro??" ); 
 	} 
 } 

 function fighter_lv200( integer rank ) {				 
 	qr = target.questRecord;			 
 	info = qr.get( 7530 );			 
 	if ( info == "" ) {			 
 		self.say( "You�� you�� is it really you? Wow�� I remember when you were level 1, it seems like yesterday�� and now you're the warrior of all warriors, a bona-fide hero of the Maple World." );		 
 		v0 = self.askYesNo( "You are more than good enough to become the face of all warriors here. What do you think? Are you interested in leaving your other self here to show the other warriors what greatness is all about?" );		 
 		if ( v0 == 0 ) self.say( "I can't believe you said no to that. Let me know if you ever change your mind." );		 
 		else {		 
 			code = 9901000 + rank - 1;	 
 			ret = target.registerImitatedNPC( code );	 
 			if ( ret == 0 ) self.say( "I don't think you are worthy of leaving your other self here." );	 
 			else {	 
 				qr.set( 7530, "1" ); 
 				self.say( "What do you think? Your other self is now established at the temple of all warriors here! Here's hoping other warriors will be inspired for greatness whenever they look at this.." ); 
 			}	 
 		}		 
 	} else if ( info == "1" ) self.say( "Numerous adventurers stop by and get inspired by your likeness. Your every move is being watched by others, so set an example of strength, honor, and dedication to everyone that crosses your path. May the wisdom of the elders grant you insight!" );			 
 }				 


 // �̻��ϰ� ���� 
 script "fighter" { 
 	qr = target.questRecord; 
 	/*if ( target.nLevel >= 200 ) { 
 		if ( target.nJob >= 100 and target.nJob < 200 ) { 
 			info = qr.get( 7530 ); 
 			if ( info == "" ) { 
 				rank = target.getRanking; 
 				if ( rank > 0 and rank <= 20 ) { 
 					fighter_lv200( rank );	 
 					end; 
 				} 
 			} 
 		} 
 	} 
 */ 
 	// 2�� 8�Ϻ��� 2�� 11�ϱ��� ���� �̺�Ʈ 

 	inventory = target.inventory; 
 	cTime = currentTime; 
 	esTime = compareTime( cTime, "05/01/09/00/00" ); 
 	eeTime = compareTime( "05/02/11/12/00", cTime ); 

 	if ( esTime >= 0 and eeTime >= 0 ) { 
 		v = self.askMenu( "���� �̰� �丮�¿��� ������� ���� ���� ���� ���� �� �ְ� �ִ� #b#p1022000##k���. ã�� �̵��� ���� �׻� �ٻ���. �׷��� ������ ���� ���ΰ�?\r\n#b#L0# ���� ���� �λ縦 �帮�� �;��.#l\r\n#L1# ����� �����ϰų� ����Ʈ�� �����ϰ� �;��.#k#l" ); 
 		if ( v == 0 ) { 
 			val = qr.get( 9000500 ); 
 			if ( val == "" ) self.say( "���� �λ��... ���� ���� ������� ���� �� ���� �����ÿ�ڸ� ã�ư� ���°� ���?" ); 
 			else if ( val == "s" ) { 
 				self.say( "�׷���... ���ظ� �����ؼ� ���� �λ縦 �Ϸ� �Դٴ� ���ΰ�? �̷��� �ݰ��ﶧ��...! ���򿡵� �ڳ�ó�� ����� �����ϴ� �����̰� �ִٴ� �����. ����... �׷� �̰� ������ �����Ͼ��� #b#p1032001##k�� ã�ư� ���� �ְԳ�. �ֱ� �ҽ��� ���� ������ �� �Ǿ��ŵ�. ã�ư��� �Ƹ� ��ô �ڳ׸� �ݰ��� ���ϼ�." ); 
 				ret1 = inventory.exchangeEx( 0, "4031075,DateExpire:2005021112", 1 ); 
 				if ( ret1 == 0 ) self.say( "�̷�... �ڳ��� ������ â�� �� �������� ���� ������ ���� �� ���� �׷�. �������� ��Ÿâ�� �� ĭ�� �ϳ� �̻� ���� �� �ٽ� ������ ���� �ɾ� �ְԳ�." ); 
 				else { 
 					target.incEXP( 450, 0 ); 
 					qr.set( 9000500, "1" ); 
 				} 
 			} 
 			else if ( val == "1" ) { 
 				if ( inventory.itemCount( 4031075 ) >= 1 ) self.say( "�̷��� �� ������ ���� �λ縦 �Ϸ� ã�ƿ� �༭ ���� ������. ���򿡵� �ڳ�ó�� ����� �����ϴ� �̰� �ִٴ� ����� ����... ���� ���起 �ް�. ��, �̹����� �����Ͼ��� #b#p1032001##k�� ã�ư� ���� �� �������� ���� �ְԳ�. �Ƹ� ��ô �⻵�� �ž�." ); 
 				else { 
 					self.say( "����... �ڳ� ���� �� �������� �Ҿ���� �� ���� �׷�. �ֽ� �����µ� ������ �ȵ���~ �̹����� Ư���� �ٽ� ��� ���״� �� �������� �����Ͼ��� #b#p1032001##k���� ���� �ְ� ���� �λ縦 �� �ְԳ�. �Ƹ� ��ô �ڳ׸� �ݰ��� ���ϼ�." ); 
 					ret2 = inventory.exchangeEx( 800, "4031075,DateExpire:2005021112", 1 ); 
 					if ( ret2 == 0 ) self.say( "�̷�... �ڳ��� ������ â�� �� �������� ���� ������ ���� �� ���� �׷�. �������� ��Ÿâ�� �� ĭ�� �ϳ� �̻� ���� �� �ٽ� ������ ���� �ɾ� �ְԳ�." ); 
 				} 
 			} 
 			else if ( val == "e" ) self.say( "�ڳ״� ���� ������ ���� ���� �λ縦 �Ϸ� ���� �����̷α�. �׶��� ���� �ݰ�����. ���򿡴� �̰� �ش޶�, ���� �ش޶�� �༮�鸸 ���� �ڳ�ó�� �λ縦 �Ϸ� ���� �̵��� ���� ���ŵ�. �����ε� ���� ������ �鷯 �̰� ���� �̾߱⵵ �� �ְ� �ϰԳ�." ); 
 			else self.say( "�ڳ״� �̹� ������ ���� �λ縦 �߳�. ���丮�� ���Ϸ��忡�� �� �ܿ��� �� ���� ���ڰ� �� �ִٳ�. �׵��� ��� ã�ư� ���� �λ縦 �� ���°� ���? �׷� ������ �ְԳ�~" ); 
 		} 
 		else if ( v == 1 ) fighterAction; 
 	} 
 	else fighterAction; 
 } 

 function magicianAction { 
 	qr = target.questRecord; 
 	val = qr.get( 7500 ); 
 	cJob = target.nJob; 
 	inventory = target.inventory; 

 	if ( val == "s" and ( cJob == 210 or cJob == 220 or cJob == 230 ) ) { 
 		qr.set( 7500, "p1"); 
 		self.say( "Estava esperando voc�. Alguns dias atr�s, #bRobeira#k de Ossyria me falou de voc�. Bem... Eu gostaria de testar sua for�a. Existe uma passagem secreta perto da floresta de Ellinia. S� voc� poder� atravess�-la. Quando estiver l� dentro, voc� encontrar� meu outro eu. Derrote-o e traga o #b#t4031059##k para mim." ); 
 		self.say( "Meu outro eu � bastante forte. Ele usa muitas habilidades especiais e voc� dever� travar uma luta corpo a corpo com ele. Entretanto, n�o � poss�vel permanecer muito tempo na passagem secreta. � essencial que voc� o derrote o mais r�pido poss�vel. Bem... Boa sorte! Fico aguardando voc� trazer o #b#t4031059##k para mim." ); 
 	} 
 	else if ( val == "p1" ) { 
 		if ( inventory.itemCount( 4031059 ) >= 1 ) { 
 			self.say( "Uau... Voc� derrotou meu outro eu e trouxe o #b#t4031059##k para mim. Muito bom! Isso certamente prova sua for�a. Em termos de for�a, voc� est� #Gpronto:pronta# para o 3� n�vel de classe. Conforme prometido, darei #b#t4031057##k a voc�. Entregue este colar a #bRobeira#k de Ossyria e poder� fazer um segundo teste para o 3� n�vel de classe. Boa sorte~." ); 
 			ret = inventory.exchange( 0, 4031059, -1, 4031057, 1 ); 
 			if ( ret == 0 ) self.say( "Hum... que estranho. Tem certeza de que est� com o #b#t4031059##k? Se estiver, certifique-se de que possui um slot vazio na guia de itens." ); 
 			else qr.set( 7500, "p2"); 
 		} 
 		else self.say( "Existe uma passagem secreta perto da floresta de Ellinia. S� voc� poder� atravess�-la. Quando estiver l� dentro, voc� encontrar� meu outro eu. Derrote-o e traga o #b#t4031059##k para mim. Meu outro eu � bastante forte. Ele usa muitas habilidades especiais e voc� dever� travar uma luta corpo a corpo com ele. Entretanto, n�o � poss�vel permanecer muito tempo na passagem secreta. � essencial que voc� o derrote o mais r�pido poss�vel. Bem... Boa sorte! Fico aguardando voc� trazer o #b#t4031059##k para mim." ); 
 	} 
 	else if ( val == "p2" ) { 
 		if ( inventory.itemCount( 4031057 ) <= 0 ) { 
 			self.say( "Ahh... voc� perdeu #b#t4031057##k, hein? Eu disse que deveria tomar cuidado... Pelo amor de Deus, vou te dar outro... DE NOVO. Por favor, tenha cuidado desta vez. Sem isto, voc� n�o poder� fazer o teste para o 3� n�vel de classe." ); 
 			ret = inventory.exchange( 0, 4031057, 1 ); 
 			if ( ret == 0 ) self.say( "Hum... que estranho. Certifique-se de que possui um slot vazio na guia de itens." ); 
 		} 
 		else self.say( "Entregue este colar a #bRobeira#k de Ossyria e poder� fazer um segundo teste para o 3� n�vel de classe. Boa sorte~!" ); 
 	} 
 	else { 
 		if ( target.nJob == 200 ) { 
 			if ( target.nLevel >= 30 ) { 
 				if ( inventory.itemCount( 4031009 ) >= 1 ) self.say( "Ainda n�o o viu? V� encontrar o #b#p1072001##k que est� perto de #b#m101020000##k pr�ximo a #m101000000#... entregue-lhe esta carta e ele vai te dizer o que voc� ter� que fazer..." ); 
 				else if ( inventory.itemCount( 4031012 ) >= 1 ) { 
 						self.say( "Voc� voltou inteiro. Muito bem. Eu sabia que voc� passaria nos testes com facilidade... certo, agora vou tornar voc� ainda mais forte. Mas antes disso... voc� ter� de escolher um dos tr�s caminhos que te ser�o oferecidos. N�o vai ser uma decis�o f�cil, mas... se tiver alguma pergunta, manda ver." ); 
 						v1 = self.askMenu( "Certo, quando tomar sua decis�o, clique em [Quero escolher minha classe!] na parte inferior...\r\n#b#L0#Explique-me as caracter�sticas do Feiticeiro do Fogo e Veneno.#k#l\r\n#b#L1#Explique-me as caracter�sticas do Feiticeiro do Gelo e Luz.#k#l\r\n#b#L2#Explique-me as caracter�sticas do Cl�rigo.#k#l\r\n#b#L3#Quero escolher minha classe!#k#l" ); 
 					if ( v1 == 0 ) { 
 							self.say( "Permita-me explicar sobre o Feiticeiro do Fogo e Veneno. Ele se especializa em m�gicas de fogo e veneno. habilidades como #b#q2101001##k, que permite que a sua magia e a de todo o seu grupo seja melhorada por um certo tempo, e #b#q2100000##k, que concede a voc� uma certa probabilidade de absorver um pouco do MP do inimigo, s�o essenciais para os Bruxos encarregados do ataque." ); 
 							self.say( "Vou explicar a voc� um ataque m�gico chamado #b#q2101004##k. Ele dispara flechas em chamas contra os inimigos, o que torna esse ataque a mais poderosa habilidade dispon�vel entre as habilidades de 2� n�vel. Ele funcionar� melhor contra os inimigos que s�o imunes a fogo no geral, pois o dano ser� bem maior. Por outro lado, se utiliz�-lo contra inimigos que s�o resistentes a fogo, o dano ser� reduzido pela metade. N�o se esque�a disso." ); 
 							self.say( "Vou explicar a voc� um ataque m�gico chamado #b#q2101005##k. Ele dispara bolhas venenosas contra os inimigos, e assim eles ficam envenenados. Depois disso, o HP do inimigo se reduzir� cada vez mais com o passar do tempo. Se a m�gica n�o funcionar muito bem ou se o monstro tiver HP elevado, poder� ser uma boa id�ia disparar quantas vezes for necess�rio para mat�-lo com uma overdose de veneno..." ); 
 					} 
 					else if ( v1 == 1 ) { 
 							self.say( "Permita-me explicar sobre o Feiticeiro do Gelo e Luz. Ele se especializa em m�gicas de gelo e Luz. habilidades como #b#q2101001##k, que permite que a sua magia e a de todo o seu grupo seja melhorada por um certo tempo, e #b#q2100000##k, que concede a voc� uma certa probabilidade de absorver um pouco do MP do inimigo, s�o essenciais para os Bruxos encarregados do ataque." ); 
 							self.say( "Vou explicar a voc� um ataque m�gico chamado #b#q2201004##k. Ele dispara estilha�os de gelo contra os inimigos e, embora n�o seja t�o poderoso quanto #q2101004#, aqueles que forem atingidos pelo ataque ficar�o congelados por um breve per�odo de tempo. O dano ser� muito maior se o inimigo for imune a gelo. O oposto tamb�m vale, ou seja, se o inimigo estiver acostumado com gelo, o dano n�o ser� t�o grande. N�o se esque�a disso." ); 
 							self.say( "Vou explicar a voc� um ataque m�gico chamado #b#q2201005##k. � a �nica habilidade de 2� n�vel para Bruxos que pode ser considerado um Feiti�o Completo e afeta v�rios monstros de uma vez. Pode n�o causar muito dano, mas a vantagem � causar dano a v�rios monstros ao seu redor. Entretanto, voc� pode atacar somente seis monstros de uma vez. Mesmo assim, � um ataque incr�vel." ); 
 					} 
 					else if ( v1 == 2 ) { 
 							self.say( "Permita-me explicar sobre o Cl�rigo. Os Cl�rigos usam m�gicas religiosas contra os monstros atrav�s de rezas e encantamentos. habilidades como #b#q2301004##k, que aprimora temporariamente a defesa de arma, a defesa de magia, precis�o e esquiva, e #b#q2301003##k, que reduz uma certa quantidade do dano com arma, ajudam os Bruxos a compensarem suas fraquezas..." ); 
 							self.say( "O Cl�rigo � o �nico Feiticeiro capaz de realizar magias de recupera��o. Os Cl�rigos s�o os �nicos capazes de realizar magias de recupera��o. Ela � chamada de #b#q2301002##k e, quanto maior for o valor de MP, INT e o n�vel desta habilidade, mais HP voc� ir� recuperar. Ela tamb�m afeta os membros do seu grupo que est�o pr�ximos a voc�, portanto, � uma habilidade bastante �til, permitindo que voc� continue ca�ando sem a ajuda de uma po��o." ); 
 							self.say( "Os Cl�rigos tamb�m possuem um ataque m�gico chamado #b#q2301005##k. � um feiti�o que permite que o Cl�rigo dispare flechas fantasmas contra monstros. O efeito n�o � muito grande, mas pode causar um dano enorme em zumbis e outros monstros malignos. Esses monstros s�o totalmente imunes a ataques sagrados. O que voc� acha? N�o � interessante?" ); 
 					} 
 					else if ( v1 == 3 ) { 
 							v2 = self.askMenu( "Bom, j� se decidiu? Escolha a classe para a sua 2� mudan�a de classe.\r\n#b#L0#O Feiticeiro do Fogo e Veneno#k#l\r\n#b#L1#O Feiticeiro do Gelo e Luz#k#l\r\n#b#L2#Cl�rigo#k#l" ); 
 						if ( v2 == 0 ) { 
 								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bFeiticeiro do Fogo e Veneno#k? Depois de tomar sua decis�o, voc� n�o poder� voltar atr�s e mudar sua classe. Est� certo sobre sua decis�o?" ); 
 								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o..." ); 
 							else if ( mJob == 1 ) { 
 								nPSP = ( target.nLevel - 30 ) * 3; 
 									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #bSP#k demais... voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde..." ); 
 								else { 
 									ret = inventory.exchange( 0, 4031012, -1 ); 
 										if ( ret == 0 ) self.say( "Hummm... tem certeza de que possui #b#t4031012##k do #p1072001#? � melhor ter certeza... pois voc� n�o pode subir para o 2� n�vel de classe sem isso..." ); 
 									else { 
 										target.nJob = 210; 
 										target.incSP( 1, 0 ); 
 										incval = random( 450, 500 ); 
 										target.incMMP( incval, 0 ); 
 										inventory.incSlotCount( 4, 4 ); 

 										self.say( "A partir de agora, voc� se tornou um #bFeiticeiro do Fogo e Veneno#k... Os Feiticeiros usam sua elevada intelig�ncia e a for�a da natureza ao nosso redor para derrubar os inimigos... continue com os seus estudos, pois um dia eu o tornarei muito mais poderoso com o meu pr�prio poder..." ); 
 										self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Feiticeiro do Fogo e Veneno...Tamb�m expandi seu invent�rio de Etc., acrescentando uma fileira inteira, e seu MP m�ximo... pode conferir." ); 
 										self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
 										self.say( "Os Feiticeiros t�m de ser fortes. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante..." ); 
 									} 
 								} 
 							}	 
 						} 
 						else if ( v2 == 1 ) { 
 								mJob = self.askYesNo( "Ent�o voc� quer fazer o 2� avan�o de carreira como #bFeiticeiro do Gelo e Luz#k? Depois de tomar sua decis�o, voc� n�o poder� voltar atr�s e mudar sua carreira... est� certo sobre sua decis�o?" ); 
 								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
 							else if ( mJob == 1 ) { 
 								nPSP = ( target.nLevel - 30 ) * 3; 
 									if ( target.nSP > nPSP ) self.say( "Hummm, voc� tem #bSP#k demais. Voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde..." ); 
 								else { 
 									ret = inventory.exchange( 0, 4031012, -1 ); 
 										if ( ret == 0 ) self.say( "Tem certeza de que possui a #b#t4031012##k do #p1072001#? � melhor ter certeza, pois n�o posso permitir que voc� suba de n�vel de classe sem isso..." ); 
 									else { 
 										target.nJob = 220; 
 										target.incSP( 1, 0 ); 
 										incval = random( 450, 500 ); 
 										target.incMMP( incval, 0 ); 
 										inventory.incSlotCount( 4, 4 ); 

 										self.say( "Certo, agora voc� se tornou um #bFeiticeiro do Gelo e Luz#k... Os Feiticeiros usam sua elevada intelig�ncia e a for�a da natureza ao nosso redor para derrubar os inimigos... continue com os seus estudos, pois um dia eu vou te tornar muito mais #Gpoderoso:poderosa# com o meu pr�prio poder..." ); 
 										self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Feiticeiro do Gelo e Luz...Tamb�m expandi seu invent�rio de Etc. acrescentando uma nova fileira. Seu MP m�ximo tamb�m aumentou. Pode conferir." ); 
 										self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
 										self.say( "Os Feiticeiros t�m de ser fortes. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante. Estarei esperando voc�..." ); 
 									} 
 								} 
 							}	 
 						} 
 						else if ( v2 == 2 ) { 
 								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bCl�rigo#k? Depois que tomar sua decis�o, voc� n�o poder� voltar atr�s e escolher outra classe... tem certeza disso?" ); 
 								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o..." ); 
 							else if ( mJob == 1 ) { 
 								nPSP = ( target.nLevel - 30 ) * 3; 
 									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #bSP#k demais. Voc� n�o poder� subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde..." ); 
 								else { 
 									ret = inventory.exchange( 0, 4031012, -1 ); 
 										if ( ret == 0 ) self.say( "Tem certeza de que possui a #b#t4031012##k do #p1072001#? � melhor ter certeza... pois voc� n�o pode subir para o n�vel de classe sem isso..." ); 
 									else { 
 										target.nJob = 230; 
 										target.incSP( 1, 0 ); 
 										incval = random( 450, 500 ); 
 										target.incMMP( incval, 0 ); 
 										inventory.incSlotCount( 4, 4 ); 
 										self.say( "Certo, voc� ser� um #bCl�rigo#k a partir de agora. Os Cl�rigos sopram vida em cada organismo com uma f� inabal�vel em Deus. Nunca deixe de aprimorar sua f�... um dia, eu vou te ajudar a se tornar muito mais #Gpoderoso:poderosa#..." ); 
 										self.say( "Eu te entreguei um livro que cont�m a lista de habilidades que voc� pode adquirir como Cl�rigo...Tamb�m expandi uma fileira do seu invent�rio de Etc. e seu MP m�ximo... pode conferir..." ); 
 										self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
 										self.say( "O Cl�rigo precisa de f� mais do que qualquer outra coisa. Mantenha sua f� em Deus e trate todos os indiv�duos com o respeito e a dignidade que eles merecem. Continue se esfor�ando e um dia voc� ter� ainda mais poder m�gico e religioso... certo... me procure depois de ter feito mais peregrina��es. Estarei esperando voc�..." ); 
 									} 
 								} 
 							}	 
 						} 
 					} 
 				} 
 				else { 
 					nSec = self.askYesNo( "Hummm... voc� cresceu bastante desde a �ltima vez. Voc� est� bastante diferente, mais #Galto:alta# e forte... agora consigo notar seu porte de Bruxo... ent�o... o que voc� acha? Deseja se tornar mais forte do que j� �? � s� fazer um simples teste... quer tentar?" ); 
 					if ( nSec == 0 ) self.say( "Mesmo? Tornar-se mais forte rapidamente te ajudar� muito durante sua jornada... se mudar de id�ia no futuro, poder� voltar aqui quando quiser. Lembre que eu tornarei voc� muito mais #Gpoderoso:poderosa# do que j� �..." ); 
 					else if ( nSec == 1 ) { 
 						self.say( "Bom... voc� parece ser forte, � verdade, mas preciso ver se seu poder � real. O teste n�o ser� dif�cil e acho que voc� � capaz de passar por ele. Aqui, pegue esta carta. N�o a perca." ); 
 						ret = inventory.exchange( 0, 4031009, 1 ); 
 							if ( ret == 0 ) self.say( "Creio que voc� n�o tenha espa�o no seu invent�rio para receber minha carta. Libere espa�o no seu invent�rio de Etc. e volte a falar comigo. Afinal, voc� poder� fazer o teste somente com a carta." ); 
 							else self.say( "Leve esta carta ao #b#p1072001##k que est� perto de #b#m101020000##k pr�ximo a #m101000000#. Ele est� me substituindo como instrutor... Entregue-lhe a carta e ele aplicar� o teste em meu lugar. Ele lhe dar� todas as informa��es necess�rias. Boa sorte para voc�..." ); 
 					} 
 				} 
 			} 
 			else { 
 					v = self.askMenu( "Alguma pergunta sobre como ser um Bruxo?\r\n#b#L0#Quais s�o as caracter�sticas b�sicas de um Bruxo?#l\r\n#L1#Quais s�o as armas de um Bruxo?#l\r\n#L2#Quais s�o as armaduras de um Bruxo?#l\r\n#L3#Quais s�o as habilidades dispon�veis para um Bruxo?#l" ); 
 				if ( v == 0 ) { 
 						self.say( "Vou te falar mais sobre ser um Bruxo. Os Bruxos usam bem altos n�veis de magia e intelig�ncia. Eles podem usar o poder da natureza ao nosso redor para matar inimigos, mas s�o muito fracos em combates corpo a corpo. Seu vigor tamb�m n�o � elevado, portanto, tome cuidado e evite ser #Gmorto:morta# de qualquer maneira." ); 
 						self.say( "O fato de voc� ser capaz de atacar monstros a dist�ncia o ajudar� bastante. Tente aprimorar o n�vel de INT se quiser atacar seus inimigos com magias precisas. Quanto maior for sua intelig�ncia, melhor voc� ser� em lidar com a sua magia..." ); 
 				} 
 				else if ( v == 1 ) { 
 						self.say( "Vou te falar mais sobre as armas de um Bruxo. Na verdade, n�o significa muito para um Bruxo atacar seus oponentes com armas. Os Bruxos n�o t�m for�a e destreza, ent�o voc� poder� ter dificuldade para derrotar at� mesmo uma lesma." ); 
 						self.say( "J� os poderes m�gicos s�o uma OUTRA hist�ria. Os Bruxos usam ma�as, cajados e varinhas. As ma�as s�o boas para, bem, ataques de for�a, mas... eu n�o recomendaria isso para um Bruxo, ponto final." ); 
 						self.say( "Na verdade, cajados e varinhas s�o as armas preferenciais. Elas possuem poderes m�gicos especiais e, por isso, melhoram o desempenho do Bruxo. � uma boa id�ia carregar uma arma com muito poder m�gico..." ); 
 				} 
 				else if ( v == 2 ) { 
 						self.say( "Vou te falar mais sobre as armaduras de um Bruxo. Honestamente, os Bruxos n�o possuem muitas armaduras, j� que t�m pouca for�a f�sica e pouco vigor. Suas habilidades de defesa tamb�m n�o s�o boas, ent�o n�o sei se vai ajudar em alguma coisa..." ); 
 						self.say( "Algumas armaduras, entretanto, t�m a habilidade de eliminar poder m�gico, ent�o podem proteger voc� contra ataques m�gicos. Elas n�o v�o ajudar muito, mas ainda � melhor do que n�o usar nada... ent�o, n�o deixe de compr�-las se der tempo..." ); 
 				} 
 				else if ( v == 3 ) { 
 						self.say( "As habilidades dispon�veis para os Bruxos usam os altos n�veis de intelig�ncia e magia que os Bruxos possuem. Tamb�m est�o dispon�veis Prote��o Arcana e Armadura Arcana, que evitam a morte de Bruxos com pouco vigor." ); 
 						self.say( "As habilidades de ataque s�o #b#q2001004##k e #b#q2001005##k. Primeiramente, #q2001004# � uma habilidade que causa muito dano no oponente com um uso m�nimo de MP." ); 
 						self.say( "#q2001005#, por sua vez, usa muito MP para atacar o oponente DUAS VEZES. Mas voc� pode usar #q2001004# somente quando essa habilidade tiver mais que uma melhoria. N�o se esque�a disso. Voc� decide o que fazer..." ); 
 				} 
 			} 
 		} 
 		else if ( target.nJob == 0 ) { 
 				self.say( "Voc� deseja ser um Bruxo? Voc� precisa cumprir alguns requisitos para isso. Voc� deve estar pelo menos no #bN�vel 8, com INT 20#k. Vamos ver se voc� tem o necess�rio para se tornar um Bruxo..." ); 
 			if ( target.nLevel > 7 and target.nINT > 19 ) { 
 					nRet = self.askYesNo( "Voc� definitivamente tem o aspecto de um Bruxo. Pode n�o ter chegado l� ainda, mas j� consigo ver um Bruxo em voc�... o que voc� acha? Voc� deseja se tornar um Bruxo?" ); 
 					if ( nRet == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o..." ); 
 				else if ( nRet == 1 ) { 
 						inven = target.inventory; 
 					if ( inven.slotCount( 1 ) > inven.holdCount( 1 ) ) { 
 						self.say( "Certo, agora voc� � um Bruxo, j� que eu, #p1032001#, o l�der dos Bruxos, estou te autorizando. N�o � muito, mas vou te dar um pouco do que tenho..." ); 
 						ret = inven.exchange( 0, 1372043, 1 ); 
 						if ( ret == 0 ) self.say( "Humm... Verifique se existe um slot vazio na sua janela de Equip. Gostaria de te dar uma arma para voc� treinar como recompensa por seu primeiro n�vel de classe." ); 
 						else { 
 					target.nJob = 200; 
 					incval = random( 100, 150 ); 
 					target.incMMP( incval, 0 ); 
 					target.incSP( 1, 0 ); 
 					self.say( "Voc� acabou de se equipar com muito mais poder m�gico. Continue treinando e se torne cada dia melhor... vou observar voc� de vez em quando..." ); 
 					self.say( "Eu apenas te dei um pouco de #bSP#k. Quando voc� abrir o #bmenu de habilidades#k no canto inferior esquerdo da tela, voc� ver� as habilidades que poder� aprender usando SP. Um aviso: Voc� n�o poder� aument�-las todas de uma vez. Existem tamb�m aquelas que ficar�o dispon�veis somente ap�s voc� aprender algumas habilidades primeiro." ); 
 					self.say( "Mais um aviso. Depois que escolher sua carreira, tente continuar vivo pelo maior tempo que conseguir. Se voc� morrer, perder� todo o seu n�vel de experi�ncia. Voc� n�o quer perder seus pontos de experi�ncia ganhos com tanto sacrif�cio, n�o �?" ); 
 					self.say( "OK! Isso � tudo que posso te ensinar. V� aos lugares, treine e se torne ainda melhor. Procure-me quando achar que j� fez tudo o que podia e precisar de algo interessante. Estarei esperando voc� aqui..." ); 
 					self.say( "Ah, e... se tiver alguma d�vida sobre ser um Bruxo, � s� perguntar. Eu n�o sei TUDO, para falar a verdade, mas vou ajudar voc� com tudo o que sei. At� l�..." ); 
 					} 
 					} else self.say( "Humm... Verifique se existe um slot vazio no seu invent�rio de EQUIP, pois gostaria de te dar uma arma para voc� treinar como recompensa por seu primeiro n�vel de classe." ); 
 				}						 
 			} 
 			else self.say( "Voc� precisa treinar mais para ser um Bruxo. Por isso, voc� tem de se esfor�ar para se tornar mais #Gpoderoso:poderosa# do que j� �. Volte quando estiver mais forte." ); 
 		} 
 			else if ( target.nJob == 210 ) self.say( "Ahhh... � voc�... o que voc� acha da vida como Feiticeiro? Voc�... parece bem � vontade com essas flechas em chamas agora... por favor, dedique-se e treine ainda mais." ); 
 			else if ( target.nJob == 220 ) self.say( "Ahhh... � voc�... o que voc� acha da vida como Feiticeiro? Voc�... parece ser capaz de lidar com o gelo e o luz com facilidade... por favor, dedique-se e treine ainda mais." ); 
 			else if ( target.nJob == 230 ) self.say( "Ahhh... � voc�... o que voc� acha da vida como Cl�rigo? Voc�... parece ser capaz de lidar com magia sagrada com facilidade... por favor, dedique-se e treine ainda mais." ); 
 			else if ( target.nJob == 211 or target.nJob == 221 ) self.say( "Ahhh... Voc� finalmente se tornou um #bMago#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Mago? Por favor, dedique-se e treine ainda mais." ); 
 			else if ( target.nJob == 231 ) self.say( "Ahhh... Voc� finalmente se tornou um #bSacerdote#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Sacerdote? Por favor, dedique-se e treine ainda mais." ); 
 			else self.say( "Voc� gostaria de ter em m�os o poder da pr�pria natureza? Poder� ser uma longa e dif�cil estrada, mas voc� certamente receber� uma recompensa no final, alcan�ando o �pice da arte dos feiticeiros..." ); 
 	} 
 } 

 function magician_lv200( integer rank ) {				 
 	qr = target.questRecord;			 
 	info = qr.get( 7530 );			 
 	if ( info == "" ) {			 
 		self.say( "You�� you�� is it really you? Wow�� I remember when you were level 1, it seems like yesterday�� and now you're the grand wizard of all magicians, a bona-fide hero of the Maple World." );		 
 		v0 = self.askYesNo( "You are more than good enough to become the face of all magicians here. What do you think? Are you interested in leaving your other self here to show the other magicians what greatness is all about?" );		 
 		if ( v0 == 0 ) self.say( "I can't believe you said no to that. Let me know if you ever change your mind." );		 
 		else {		 
 			code = 9901100 + rank - 1;	 
 			ret = target.registerImitatedNPC( code );	 
 			if ( ret == 0 ) self.say( "I don't think you are worthy of leaving your other self here." );	 
 			else {	 
 				qr.set( 7530, "1" ); 
 				self.say( "What do you think? Your other self is now established at the temple of all magicians here! Here's hoping other warriors will be inspired for greatness whenever they look at this.." ); 
 			}	 
 		}		 
 	} else if ( info == "1" ) self.say( "Numerous adventurers stop by and get inspired by your likeness. Your every move is being watched by others, so set an example of strength, honor, and dedication to everyone that crosses your path. May the wisdom of the elders grant you insight!" );			 
 }				 


 // ������ ���� 
 script "magician" { 
 	qr = target.questRecord; 
 	/*if ( target.nLevel >= 200 ) { 
 		if ( target.nJob >= 200 and target.nJob < 300 ) { 
 			info = qr.get( 7530 ); 
 			if ( info == "" ) { 
 				rank = target.getRanking; 
 				if ( rank > 0 and rank <= 20 ) { 
 					magician_lv200( rank );	 
 					end; 
 				} 
 			} 
 		} 
 	} 
 */ 
 	// 2�� 8�Ϻ��� 2�� 11�ϱ��� ���� �̺�Ʈ 
 	inventory = target.inventory; 
 	cTime = currentTime; 
 	esTime = compareTime( cTime, "05/01/09/00/00" ); 
 	eeTime = compareTime( "05/02/11/12/00", cTime ); 

 	if ( esTime >= 0 and eeTime >= 0 ) { 
 		v = self.askMenu( "���� �̰� �����Ͼƿ��� ��������� ���� ���� ���� ���� �� �ְ� �ִ� #b#p1032001##k���. ã�� �̵��� ���� �׻� �ٻ���. �׷��� ������ ���� ���ΰ�?\r\n#b#L0# ���� ���� �λ縦 �帮�� �;��.#l\r\n#L1# ������� �����ϰų� ����Ʈ�� �����ϰ� �;��.#k#l" ); 
 		if ( v == 0 ) { 
 			val = qr.get( 9000500 ); 
 			if ( val == "" ) self.say( "���� �λ��... ���� ���� ������� ���� �� ���� �����ÿ�ڸ� ã�ư� ���°� ���?" ); 
 			else if ( val == "s" ) self.say( "���� ���� �λ��... ���� ��Ư�� �����̷α���...! ������ ���� �丮���� #b#p1022000##k�� ã�ư� ���Գ�. ������ �λ��ϴ� �� �� �ڶ� ���� �ʾ�. �׷� �ڳװ� ���⸸�� ��ٸ��� �ְڳ�..." ); 
 			else if ( val == "1" ) { 
 				self.say( "�׷���... ���ظ� �����ؼ� ���� �λ縦 �Ϸ� �Դٴ� ���ΰ�? �̷��� �ݰ��ﶧ��...! ���򿡵� �ڳ�ó�� ����� �����ϴ� �����̰� �ִٴ� �����. �Դٰ� �̰� #b#p1022000##k�� �������̷α�. ����... ���� ���起 �ް�. �׷� �̰� ������ ��׽ý��� #b#p1012100##k�� ã�ư� ���� �ְԳ�. �ֱ� �ҽ��� ���� ������ �� �Ǿ��ŵ�. ã�ư��� �Ƹ� ��ô �ڳ׸� �ݰ��� ���ϼ�." ); 
 				ret1 = inventory.exchangeEx( 800, "4031075", -1, "4031076,DateExpire:2005021112", 1 ); 
 				if ( ret1 == 0 ) self.say( "�̷�... �ڳ��� ������ â�� �� �������� ���� ������ ���� �� ���� �׷�. �������� ��Ÿâ�� �� ĭ�� �ϳ� �̻� ���� �� �ٽ� ������ ���� �ɾ� �ְԳ�." ); 
 				else { 
 					target.incEXP( 450, 0 ); 
 					qr.set( 9000500, "2" ); 
 				} 
 			} 
 			else if ( val == "2" ) { 
 				if ( inventory.itemCount( 4031076 ) >= 1 ) self.say( "�̷��� �� ������ ���� �λ縦 �Ϸ� ã�ƿ� �༭ ���� ������. ���򿡵� �ڳ�ó�� ����� �����ϴ� �̰� �ִٴ� ����� ����... ��, �̹����� ��׽ý��� #b#p1012100##k�� ã�ư� ���� �� �������� ���� �ְԳ�. �Ƹ� ��ô �⻵�� �ž�." ); 
 				else { 
 					self.say( "����... �ڳ� ���� �� �������� �Ҿ���� �� ���� �׷�. �ֽ� �����µ� ������ �ȵ���~ �̹����� Ư���� �ٽ� ��� ���״� �� �������� ��׽ý��� #b#p1012100##k���� ���� �ְ� ���� �λ縦 �� �ְԳ�. �Ƹ� ��ô �ڳ׸� �ݰ��� ���ϼ�." ); 
 					ret2 = inventory.exchangeEx( 0, "4031076,DateExpire:2005021112", 1 ); 
 					if ( ret2 == 0 ) self.say( "�̷�... �ڳ��� ������ â�� �� �������� ���� ������ ���� �� ���� �׷�. �������� ��Ÿâ�� �� ĭ�� �ϳ� �̻� ���� �� �ٽ� ������ ���� �ɾ� �ְԳ�." ); 
 				} 
 			} 
 			else if ( val == "e" ) self.say( "�ڳ״� ���� ������ ���� ���� �λ縦 �Ϸ� ���� �����̷α�. �׶��� ���� �ݰ�����. ���򿡴� �̰� �ش޶�, ���� �ش޶�� �༮�鸸 ���� �ڳ�ó�� �λ縦 �Ϸ� ���� �̵��� ���� ���ŵ�. �����ε� ���� ������ �鷯 �̰� ���� �̾߱⵵ �� �ְ� �ϰԳ�." ); 
 			else self.say( "�ڳ״� �̹� ������ ���� �λ縦 �߳�. ���丮�� ���Ϸ��忡�� �� �ܿ��� �� ���� ���ڰ� �� �ִٳ�. �׵��� ��� ã�ư� ���� �λ縦 �� ���°� ���? �׷� ������ �ְԳ�~" ); 
 		} 
 		else if ( v == 1 ) magicianAction; 
 	} 
 	else magicianAction; 
 } 
