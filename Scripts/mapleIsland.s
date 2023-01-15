  module "standard.s";  
	
  // 2. use the items  
  script "begin2" {  
  	qr = target.questRecord;  
  	val = qr.getState( 1002 );  

  		inventory = target.inventory;  
  			if ( val == 0 ) {  
  			if ( target.nGender == 0 ) {  
  				self.say( "Ei, voc� a�! Posso falar com voc� por um minuto? Hahah! Eu sou #p2000#, um instrutor que ajuda novos viajantes como voc�." );  
  				self.say( "Quem te falou para fazer ISSO? HAHAHAH! Voc� � um viajante MUITO curioso! Bom, bom, bom... Eu fa�o isso porque quero. � isso." );  
  			}  
  			else if ( target.nGender == 1 ) {  
  				self.say( "Ei! Voc� a�! Voc� est� livre? Hehe... Eu sou #p2000#, o instrutor, e adoro bater papo com #Ggarotos:garotas# legais como voc� e, claro, ajudar durante o jogo.#I" );  
  				self.say( "Ei! Me d� um minuto do seu tempo. Eu vou lhe dar muitas informa��es valiosas. Qualquer coisa para uma belezinha como voc�. Hahaha!!!#I" );  
  			}  
  			self.say( "Certo! Vamos nos divertir! Yahh!" );  
  			val2 = target.nHP / 2;  
  			target.incHP( -val2, 0 );  
  			self.say( "#GSurpreso:Surpresa#? Voc� n�o pode ficar com o HP abaixo de 0, eu vou lhe dar uma #r#t2010007##k para comer. Voc� pode recuperar sua for�a assim. Abra seu invent�rio e clique duas vezes nele." );  
  			self.say( "Voc� ter� que comer cada #t2010007# que eu te dei, mas pode recuperar HP ficando a� quieto, ent�o, venha falar comigo quando tiver recuperado sua HP por completo." );  
  			ret = inventory.exchange( 0, 2010007, 1 );  
  			if ( ret == 0 ) self.say( "Voc� n�o comeu um pouquinho demais?" );  
  			else qr.set( 1002, "" );  
  		}  
  	else if ( val == 1 and inventory.itemCount( 2010007 ) == 0 and target.nHP == target.nMHP ) {  
  			self.say( "O que voc� faz se quiser pegar o item? � f�cil, certo? Voc� pode design�-lo como uma #bTecla de Atalho#k no canto inferior direito da tela. Voc� n�o sabia disso, sabia? Hahaha!" );  
  			self.say( "Certo! Voc� aprendeu muito, ent�o toma aqui um presentinho. Voc� n�o deveria me agradecer por aprender uma per�cia. Use-a quando necess�rio." );  
  			self.say( "Isto � tudo o que posso te ensinar. � triste, mas tenho que dizer adeus. E tome cuidado por a�. At� mais..." );  
  			target.incEXP( 2, 0 );  
  			ret = inventory.exchange( 0, 2000000, 3, 2000003, 3 );  
  			if ( ret == 0 ) self.say( "Voc� n�o comeu um pouquinho demais?" );  
  			qr.setComplete( 1002 );  
  	}  
  	else if ( inventory.itemCount( 2010007 ) > 0 ) self.say( "Venha, coma a #r#t2010007##k que eu te dei~ Abra o invent�rio e clique na guia #b'Usar'#k, depois clique duas vezes no #t2010000# para peg�-la." );  
  	else if ( target.nHP != target.nMHP ) self.say( "Voc� n�o recuperou totalmente sua for�a. Voc� comeu mesmo a #t2010007# que eu te dei? Tem certeza?" );  
  	else self.say( "O tempo est� �timo hoje!" );  
  }  

  // 4. Character control.  
  script "begin4" {  
  	if ( target.nJob != 0 ) {  
  		self.say( "Essa � a �rea de miss�es para aprendizes. Voc� n�o � um aprendiz, �?" );  
  		registerTransferField( 104000000, "" );  
  	}  
  	else {  
  		self.say( "Chegou t�o longe... incr�vel! Voc� pode come�ar a viajar por a� agora mesmo! Ok, eu te levo at� a pr�xima parada." );  
  		self.say( "Mas vou te dar um conselho: Depois que sair daqui, voc� estar� livre, em lugares com muitos monstros e sem meios para voltar. Bem, ent�o, at� depois!" );  
  		target.incEXP( 3, 0 );  
  		registerTransferField( 40000, "" );  
  	}  
  }  

  function HelpString {  
  	v = self.askMenu( "Agora... pode me perguntar qualquer coisa que quiser saber sobre viajar!!\r\n#b#L0#Como eu me movimento?#l\r\n#L1#Como eu elimino os monstros?#l\r\n#L2#Como eu posso pegar um item?#l\r\n#L3#O que acontece quando eu morro?#l\r\n#L4#Quando eu posso escolher uma carreira?#l\r\n#L5#Me diga mais sobre esta ilha!#l\r\n#L6# O que devo fazer para me tornar um Guerreiro?#l\r\n#L7# O que devo fazer para me tornar um Arqueiro?#l\r\n#L8# O que devo fazer para me tornar um Gatuno?#l\r\n#L9# O que devo fazer para me tornar um Bruxo?#l\r\n#L10# Como aumento os atributos do personagem? (S)#l\r\n#L11# Como eu fa�o para visualizar os itens que acabei de pegar?#l\r\n#L12# Como posso equipar um item?#l\r\n#L13# Como posso verificar os itens equipados?#l\r\n#L14# Quais s�o as per�cias?(K)#l\r\n#L15# Como chego na Ilha Victoria?#l\r\n#L16# O que s�o mesos?#l" );  
  	if ( v == 0 ) {  
  		self.say( "Muito bem! � assim que se movimenta. Use as #bsetas para esquerda e direita#k para se movimentar em terreno plano e estradas e aperte #bAlt#k para pular. Alguns tipos de sapatos fazem que voc� melhore suas habilidades de velocidade e de pulo." );  
  	}  
  	else if ( v == 1 ) {  
  		self.say( "Agora, como eliminar um monstro. Cada monstro possui seu pr�prio HP, e voc� pode acabar com eles ao atac�-los com uma arma ou com magias. Claro que, quanto mais forte eles s�o, mais dif�ceis para ser eliminados." );  
  		self.say( "Para poder atacar os monstros, voc� dever� estar equipado com armas. Quando a arma estiver equipada, aperte #bCtrl#k para us�-la. Com um pouco de treino, voc� poder� eliminar os monstros facilmente." );  
  		self.say( "Depois de ter avan�ado na carreira, voc� ir� obter diferentes tipos de per�cias e poder� designar teclas de atalho para elas, a fim de acess�-las mais facilmente. Se for uma habilidade de ataque, voc� n�o precisa apertar CTRL para atacar; basta apertar o bot�o designado como tecla de atalho para aquela arma." );  
  	}  
  	else if ( v == 2 ) {  
  		self.say( "� assim que se pega um item. Depois de ter eliminado um monstro, um item ser� largado. Quando isso acontecer, fique em frente ao item e aperte #bZ#k ou #b0 no teclado n�merico#k para peg�-lo." );  
  		self.say( "Lembre-se de que, se o seu invent�rio estiver cheio, voc� n�o poder� guardar novos itens. Ent�o, se voc� tiver um item que n�o precisar, voc� poder� vend�-lo ou fazer outra coisa com ele. Voc� poder� ganhar mais espa�os no invent�rio quando avan�ar na carreira." );  
  	}  
  	else if ( v == 3 ) {  
  		self.say( "Est� #Gcurioso:curiosa# para saber o que acontece quando voc� morre? Quando seu HP chegar a zero, voc� se tornar� um fantasma. Haver� uma l�pide nesse local e voc� n�o poder� se mover, mas ainda poder� bater papo." );  
  		self.say( "Voc� n�o perde muita coisa se morre quando � apenas um aprendiz. Quando voc� tiver uma carreira, a� � uma hist�ria totalmente diferente. Voc� perder� uma parte de seus pontos de EXP quando morrer, ent�o, tome cuidado para n�o morrer quando estiver em perigo." );  
  	}  
  	else if ( v == 4 ) {  
  		self.say( "Quando voc� pode escolher a sua carreira? Hahaha, v� com calma, colega. Cada carreira tem um conjunto de requisitos que voc� precisa preencher. Geralmente, um n�vel entre 8 e 10 � o ideal, por isso, trabalhe duro." );  
  		self.say( "O n�vel n�o � a �nica coisa que determina o seu avan�o na carreira. Voc� tamb�m deve aumentar os n�veis de uma habilidade em particular baseada na carreira. Por exemplo, para se tornar um Guerreiro, sua STR deve estar acima de 35, e assim por diante, entendeu? Certifique-se de aumentar as habilidades que estejam ligadas diretamente com sua carreira." );  
  	}  
  	else if ( v == 5 ) {  
  		self.say( "Quer saber mais sobre essa ilha? � chamada de Ilha Maple, e ela flutua no ar. Ela tem flutuado no c�u j� faz algum tempo, por isso aqueles monstros nojentos n�o costumam ficar por perto. � uma ilha muito tranq�ila! Perfeita para aprendizes!" );  
  		self.say( "Mas, se voc� quiser ser um jogador poderoso, � melhor n�o pensar em ficar s� aqui. Mesmo porque voc� n�o poder� conseguir uma carreira. Abaixo dessa ilha h� outra ilha enorme chamada de Ilha Victoria. Aquele lugar � t�o maior que esse aqui..." );  
  		self.say( "Como voc� chega � Ilha Victoria? Na parte leste desta ilha, h� um porto chamado #m60000#. L�, voc� encontrar� um navio voador. Na frente do navio fica o capit�o. Pergunte a ele." );  
  		self.say( "Ah, sim! Mais uma informa��o antes que voc� se v�. Se voc� n�o souber onde est�, basta apertar a tecla #bW#k. O mapa do mundo ir� aparecer com um indicador mostrando onde voc� est�. Com esse recurso, voc� n�o ter� que se preocupar se ficar #Gperdido:perdida#." );   
  	}  
  	else if ( v == 6 ) {  
  		self.say( "Voc� deseja se tornar #Gum guerreiro:uma guerreira#? Humm, ent�o eu sugiro que voc� v� para a Ilha Victoria. V� para a cidade-guerreira chamada #rPerion#k e fale com #bChefe Balrog#k. Ele ir� lhe ensinar como se tornar #Gum guerreiro:uma guerreira# de verdade. Ah! E tem mais uma coisa muito importante: Voc� ter� que estar no n�vel 10, no m�nimo, para se tornar #Gguerreiro:guerreira#!" );   
  	}  
  	else if ( v == 7 ) {  
  		self.say( "Voc� deseja se tornar #Gum arqueiro:uma arqueira#? Voc� ter� que ir para a Ilha Victoria para fazer o avan�o na carreira. V� para a cidade de arqueiros chamada #rHenesys#k e fale com a linda #bAthene Certeira#k e aprenda os altos e baixos de ser #Gum arqueiro:uma arqueira#. Ah! E tem mais uma coisa muito importante: Voc� ter� que estar no n�vel 10, no m�nimo, para se tornar #Gum arqueiro:uma arqueira#!!" );   
  	}  
  	else if ( v == 8 ) {  
  		self.say( "Voc� deseja se tornar #Gum gatuno:uma gatuna#? Para se tornar um, voc� ter� que ir para a Ilha Victoria. V� para a cidade de gatunos conhecida como #rKerning#k e, na parte mais escura da cidade, achar� um esconderijo de gatunos. L� voc� encontrar� o #bLorde Negro#k, que vai lhe ensinar sobre como ser #Gum gatuno:uma gatuna#. Ah! E tem mais uma coisa muito importante: Voc� ter� que estar no n�vel 10, no m�nimo, para se tornar #Gum gatuno:uma gatuna#!!" );   
  	}  
  	else if ( v == 9 ) {  
  		self.say( "Voc� deseja se tornar #Gum bruxo:uma bruxa#? Para fazer isso, voc� ter� que ir para a Ilha Victoria. V� para a cidade dos bruxos conhecida como #rEllinia#k e, l�, na parte mais alta dela, est� a Biblioteca M�gica. Dentro dela voc� encontrar� o chefe de todos os bruxos, #bGrendel, o Muito Velho#k, que vai lhe ensinar tudo sobre como se tornar um #Gum bruxo:uma bruxa#." );  
  		self.say( "Ah! A prop�sito, diferentemente das outras carreiras, para tornar-se um m�gico, voc� s� precisa estar no n�vel 8. Na verdade, a facilidade de poder tornar-se m�gico mais cedo � porque leva muito tempo para algu�m tornar-se um m�gico verdadeiramente poderoso. Pense bem e escolha seu caminho cuidadosamente." );  
  	}  
  	else if ( v == 10 ) {  
  		self.say( "Voc� deseja saber como aumentar os atributos de habilidade do seu personagem? Primeiro, aperte S para verificar a janela de habilidades. Todas as vezes que voc� sobir de n�vel, receber� 5 pontos de habilidade (tamb�m conhecidos como PH). Gaste esse pontos com a habilidade de sua prefer�ncia. � simples." );  
  		self.say( "Posicione o cursor de seu mouse sobre as habilidades para uma r�pida explica��o sobre elas. Por exemplo, FOR para guerreiros, DES para arqueiros, INT para m�gicos, e SOR para gatunos. Isso n�o � tudo o que voc� precisa saber, por isso, ter� que pensar muito sobre como distribuir os pontos de forma a enfatizar a for�a de seu personagem, de acordo com sua escolha." );  
  	}  
  	else if ( v == 11 ) {  
  		self.say( "Voc� deseja saber como visualizar os itens que voc� pegou, n�o �? Quando voc� derrota um monstro, ele deixar� cair um item no ch�o, e voc� pode pressionar Z para pegar aquele item. Aquele item ser� guardado no seu invent�rio, e voc� poder� visualiz�-lo pressionando a tecla I." );  
  	}  
  	else if ( v == 12 ) {  
  		self.say( "Voc� quer saber como equipar os itens, certo? Pressione a tecla I para abrir a janela de invent�rio. Posicione o cursor de seu mouse sobre um item e clique duas vezes nele para que ele seja equipado em seu personagem. Se voc� n�o conseguir usar um item, � bem prov�vel que seu personagem n�o atenda aos requisitos de estat�sticas e n�vel. Voc� tamb�m pode usar o item abrindo o invent�rio de equip. (E) e arrastando o item at� o personagem. Para desequipar um item, clique duas vezes no item no invent�rio de equip." );  
  	}  
  	else if ( v == 13 ) {  
  		self.say( "Voc� quer verificar os itens equipados, certo? Pressione a tecla E para abrir o invent�rio de equip., no qual voc� poder� ver exatamente o que voc� est� usando no momento. Para desequipar um item, clique duas vezes nele. O item ser� enviado ao invent�rio." );  
  	}  
  	else if ( v == 14 ) {  
  		self.say( "As habilidades especiais que voc� recebe depois de conseguir uma carreira s�o chamadas de 'per�cias'. Voc� ir� adquirir per�cias especificas de acordo com sua carreira. Voc� ainda n�o est� nesse est�gio, por isso, ainda n�o tem nenhuma per�cia. Mas lembre-se de que, para verificar suas per�cias, basta apertar K para abrir o Livro de Per�cias. Isso vai ajud�-lo no futuro." );  
  	}  
  	else if ( v == 15 ) {  
  		self.say( "Voc� pode ir para a Ilha Victoria em uma viagem de navio que zarpa de Porto Sul e atraca em Porto Lith. Pressione a tecla W para visualizar o mapa do mundo e ver� em que local da ilha voc� est�. Ache Porto Sul no mapa. � para l� que voc� deve ir. Voc� tamb�m precisar� de alguns mesos para a viagem, ent�o pode ser que precise eliminar alguns monstros nas redondezas." );  
  	}  
  	else if ( v == 16 ) {  
  		self.say( "Mesos � a moeda usada em MapleStory. Com mesos, voc� pode comprar itens. Para ganh�-los voc� pode derrotar monstros, vender itens na loja ou cumprir miss�es..." );  
  	}  
  	HelpString;  
  }  

  // 5. ����,�ױ�  
  script "begin5" {  
  	HelpString;  
  }  

  // 7. sending the character to victoria island.  
  script "begin7" {  
  	nRet = self.askYesNo( "Pegue esse navio e voc� partir� para um continente maior. Com #e150 mesos#n eu posso te levar para a #bIlha Victoria#k. O problema � que, depois de sair daqui, voc� n�o poder� voltar nunca mais. O que voc� acha? Voc� quer ir para a Ilha Victoria?" );  
  	if ( nRet == 0 ) self.say( "Humm... Suponho que voc� ainda tenha coisas a resolver aqui?");  
  	else if ( nRet == 1 ) {  
  		if ( target.nLevel < 7 )	self.say ( "Vamos ver... Eu n�o acho que voc� seja forte o suficiente. Voc� tem que estar no m�nimo no #bN�vel 7 #k para ir para a Ilha Victoria." );  
  		else {  
  			self.say( "Est� #Gcansado:cansada# deste lugar? Bem... primeiro, me d� #e150 mesos#n..." );  
  			ret = target.incMoney( -150, 1 );  
  			if ( ret == 0 ) self.say( "O qu�? Voc� est� querendo dizer que queria viajar sem dinheiro nenhum? Voc� � #Gesquisito:esquisita#..." );  
  			else {  
  				self.say( "Demais! #e150 mesos#n aceitos! Muito bem! Vamos para a #bIlha Victoria#k!" );  
  				registerTransferField( 104000000, "maple00" );  
  			}  
  		}  
  	}  
  }  

  // 8. Ambassador Bari  
  script "bari" {  
  	self.say( "Essa cidade � chamada de #b#m60000##k e fica ao leste da Ilha Maple. Voc� n�o quer avan�ar na carreira para poder lutar contra monstros muito mais fortes? Ent�o, embarque no navio e siga para a #bIlha Victoria#k." );  
  	self.say( "Voc� ir� precisar de 150 mesos, mas n�o � tanto dinheiro assim... voc� pode conseguir essa quantia eliminando os monstros espalhados pela ilha. Voc� pode at� mesmo vender itens nas lojas espalhadas pela cidade." );  
  }  

  // 10. Rain's lines  
  script "rein" {  
  	self.say( "Essa cidade � chamada de #b#m1010000##k e fica ao nordeste da Ilha Maple. Voc� sabia que a Ilha Maple � somente para aprendizes, n�o sabia? Fico feliz que s� existam monstros fracos por aqui." );  
  	self.say( "Se voc� quiser ficar mais forte, v� para #b#m60000##k onde h� um porto, e l� voc� poder� pegar um navio gigantesco e desembarcar em um lugar chamado #bIlha Victoria#k. Ela � muito maior que esta pequena ilhazinha." );  
  	self.say( "Em Ilha Victoria voc� poder� escolher sua carreira. � chamada de #b#m102000000##k...? Eu ouvi dizer que h� uma cidade desolada e ao ar livre, onde os guerreiros vivem. Que tipo de lugar seria esse?" );  
  }  

  // 11. Pio's lines  
  script "pio" {  
  	self.say( "Aqui em #m1010000#, h� lojas de armas e mantimentos, e em #m60000#, um porto com um navio imenso chamado Victoria, e � l� que voc� poder� encontar uma loja que vende escudos." );  
  	self.say( "H� alguns dias, eu peguei emprestado um martelo com #p11000# da loja de armas, e o martelo quebrou. O que devo fazer?" );  
  }  
