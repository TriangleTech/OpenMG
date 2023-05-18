module "standard.s"; 

//????? ??? ??? ?? 
function( integer ) check_kawi { 
	inven = target.inventory; 
	iCode = 4031332; 
	result = 0; 
	for ( i = 0 .. 9 ) { 
		code = iCode + i; 
		if ( inven.itemCount( code ) > 0 ) { 
			result = 1; 
			break; 
		} else { 
			result = 0; 
		} 
	} 
	return result; 
} 

// Paul : 9000000 
script "Event00" { 
	field = self.field; 
	cmap = field.id; 

	if ( target.isSuperGM == 1 ) { 
	v1 = self.askMenu( "Por favor, selecione a a��o de sua escolha.\r\n#b#L0# Escolha o Mapa de Eventos#l\r\n#L1# Verifique o n�mero de usu�rios no Mapa de Eventos#l#k" ); 
		if ( v1 == 0 ) { 
			v2 = self.askMenu( "Selecione o evento. \r\n#b#L0# Ola Ola 1 ( 109030001 )#l\r\n#L1# Ola Ola 2 ( 109030101 )#l\r\n#L2# Ola Ola 3 ( 109030201 )#l\r\n#L3# Ola Ola 4 ( 109030301 )#l\r\n#L4# Ola Ola 5 ( 109030401 )#l\r\n#L5# Teste F�sico MapleStory ( 109040000 )#l\r\n#L6# Teste do O e X ( 109020001 )#l\r\n#L7# Colheita dos Cocos 1 ( 109080000 )#l\r\n#L8# Colheita dos Cocos 2 ( 109080001 )#l\r\n#L9# Colheita dos Cocos 3 ( 109080002 )#l\r\n#L10# Bola de Neve ( 109060001 )#l\r\n#L11# Ca�a ao Tesouro ( 109010000 )#l\r\n#L12# Fechar a Entrada do Mapa de Eventos#l\r\n#k" ); 
			if ( v2 == 0 ) { 
				self.setIntReg( "map", 109030001 ); 
				self.setIntReg( "count", 80 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 1 ) { 
				self.setIntReg( "map", 109030101 ); 
				self.setIntReg( "count", 80 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 2 ) { 
				self.setIntReg( "map", 109030201 ); 
				self.setIntReg( "count", 80 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 3 ) { 
				self.setIntReg( "map", 109030301 ); 
				self.setIntReg( "count", 80 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 4 ) { 
				self.setIntReg( "map", 109030401 ); 
				self.setIntReg( "count", 80 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 5 ) { 
				self.setIntReg( "map", 109040000 ); 
				self.setIntReg( "count", 70 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 6 ) { 
				self.setIntReg( "map", 109020001 ); 
				self.setIntReg( "count", 90 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 7 ) { 
				self.setIntReg( "map", 109080000 ); 
				self.setIntReg( "count", 60 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 8 ) { 
				self.setIntReg( "map", 109080001 ); 
				self.setIntReg( "count", 60 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 9 ) { 
				self.setIntReg( "map", 109080002 ); 
				self.setIntReg( "count", 60 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 10 ) { 
				self.setIntReg( "map", 109060001 ); 
				self.setIntReg( "count", 80 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 11 ) { 
				self.setIntReg( "map", 109010000 ); 
				self.setIntReg( "count", 60 ); 
				field.notice( 0, "O evento est� aberto. Por favor, clique no Evento NPC para entrar no Mapa de Eventos." ); 
			} 
			else if ( v2 == 12 ) { 
				self.setIntReg( "map", -1 ); 
				self.setIntReg( "count", 0 ); 
			} 
		} 
		else if ( v1 == 1 ) { 
			v2 = self.askMenu( "Selecione o evento. \r\n#b#L0# Ola Ola 1 ( 109030001 )#l\r\n#L1# Ola Ola 2 ( 109030101 )#l\r\n#L2# Ola Ola 3 ( 109030201 )#l\r\n#L3# Ola Ola 4 ( 109030301 )#l\r\n#L4# Ola Ola 5 ( 109030401 )#l\r\n#L5# Teste F�sico MapleStory ( 109040000 )#l\r\n#L6# Teste do O e X ( 109020001 )#l\r\n#L7# Colheita dos Cocos 1 ( 109080000 )#l\r\n#L8# Colheita dos Cocos 2 ( 109080001 )#l\r\n#L9# Colheita dos Cocos 3 ( 109080002 )#l\r\n#L10# Bola de Neve ( 109060001 )#l\r\n#L11# Ca�a ao Tesouro ( 109010000 )#l#k" ); 
			uNum = self.getIntReg( "count" ); 
			uMap = self.getIntReg( "map" ); 
			if ( v2 == 0 ) { 
				field = Field( 109030001 ); 
				if ( uMap == 109030001 ) self.say( "Um total de 80 usu�rios pode entrar em Ola Ola 1 ( 109030001 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Ola Ola 1 ( 109030001 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 1 ) { 
				field = Field( 109030101 ); 
				if ( uMap == 109030101 ) self.say( "Um total de 80 usu�rios pode entrar em Ola Ola 2 ( 109030101 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Ola Ola 2 ( 109030101 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 2 ) { 
				field = Field( 109030201 ); 
				if ( uMap == 109030201 ) self.say( "Um total de 80 usu�rios pode entrar em Ola Ola 3 ( 109030201 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Ola Ola 3 ( 109030201 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 3 ) { 
				field = Field( 109030301 ); 
				if ( uMap == 109030301 ) self.say( "Um total de 80 usu�rios pode entrar em Ola Ola 4 ( 109030301 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Ola Ola 4 ( 109030301 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 4 ) { 
				field = Field( 109030401 ); 
				if ( uMap == 109030401 ) self.say( "Um total de 80 usu�rios pode entrar em Ola Ola 5 ( 109030401 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Ola Ola 5 ( 109030401 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 5 ) { 
				field = Field( 109040000 ); 
				if ( uMap == 109040000 ) self.say( "Um total de 70 usu�rios pode entrar no 'Teste F�sico MapleStory' ( 109040000 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Teste F�sico MapleStory ( 109040000 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 6 ) { 
				field = Field( 109020001 ); 
				if ( uMap == 109020001 ) self.say( "Um total de 90 usu�rios pode entrar no Teste O e X ( 109030001 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Teste O e X ( 109030001 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 7 ) { 
				field = Field( 109080000 ); 
				if ( uMap == 109080000 ) self.say( "Um total de 60 usu�rios pode entrar na Colheita do Coco 1 ( 109080000 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Colheita do Coco 1 ( 109080000 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 8 ) { 
				field = Field( 109080001 ); 
				if ( uMap == 109080001 ) self.say( "Um total de 60 usu�rios pode entrar na Colheita do Coco 2 ( 109080001 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Colheita do Coco 2 ( 109080001 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 9 ) { 
				field = Field( 109080002 ); 
				if ( uMap == 109080002 ) self.say( "Um total de 60 usu�rios pode entrar na Colheita do Coco 3 ( 109080002 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Colheita do Coco 3 ( 109080002 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 10 ) { 
				field = Field( 109060001 ); 
				if ( uMap == 109060001 ) self.say( "Um total de 80 usu�rios pode entrar em Bola de Neve ( 109060001 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Bola de Neve ( 109060001 ) Este evento n�o est� dispon�vel." ); 
			} 
			else if ( v2 == 11 ) { 
				field = Field( 109010000 ); 
				if ( uMap == 109010000 ) self.say( "Um total de 60 usu�rios pode entrar em Ca�a ao Tesouro ( 109010000 ) #r" + field.getUserCount + "#k usu�rios entraram no mapa de eventos." ); 
				else self.say( "Ca�a ao Tesouro ( 109010000 ) Este evento n�o est� dispon�vel." ); 
			} 
		} 
	} 
	else { // if user click 
		qr = target.questRecord; 
		val = qr.get( 9000 ); 
		val2 = qr.get( 9001 ); 
		proof = check_kawi; 

		if ( cmap == 60000 ) { 
		//	self.say( "Ei, sou #b#p9000000##k. Eu n�o queria ficar s� em casa num dia de ver�o t�o quente. Ent�o, trouxe aqui comigo meu irm�o, mas eu n�o sei onde ele est� agora e estou totalmente s�. Cara, estou ficando mais entediado agora que meu irm�o n�o est� aqui comigo." ); 
	 		self.say( "Ei, sou #b#p9000000##k, se n�o estiver ocupado agora ... Ent�o, posso ficar com voc�? Ouvi dizer que pessoas est�o se juntando por aqui para um #revento#k, mas n�o quero ir s�... Bem, quer ir l� comigo para dar uma espiada?" ); 
	 		if ( proof == 1 ) v1 = self.askMenu( "�h? Que tipo de evento? Bem, �... \r\n#L0##e1. #n#bQue tipo de evento � esse?#k#l\r\n#L1##e2. #n#bExplique o evento do jogo para mim.#k#l\r\n#L2##e3. #n#bEst� certo, vamos!#k#l\r\n#L3##e4. #k\n#bGostaria de trocar o Certificado de Ganhador em joquemp� por outro item.#l#k" ); 
			else v1 = self.askMenu(  "�h? Que tipo de evento? Bem, �... \r\n#L0##e1. #n#bQue tipo de evento � esse?#k#l\r\n#L1##e2. #n#bExplique o evento do jogo para mim.#k#l\r\n#L2##e3. #n#bEst� certo, vamos!#k#l" ); 
			
		} 
		else if ( cmap == 104000000 ) { 
			self.say( "Ei, sou #b#p9000001##k. Estou aqui esperando por meu irm�o #bPaul#k. Ele deveria estar aqui agora..." ); 
			self.say( "Humm... O que eu deveria fazer? O evento come�ar� logo... Muitas pessoas foram participar do evento, ent�o � melhor corrermos..." ); 
			if ( proof == 1 ) v1 = self.askMenu( "Ei... Por que n�o vai comigo? \r\n#L0##e1. #n#bQue tipo de evento � esse?#k#l\r\n#L1##e2. #n#bExplique o evento do jogo para mim.#k#l\r\n#L2##e3. #n#bEst� certo, vamos!#k#l\r\n#L3#IGostaria de trocar o Certificado de Ganhador em joquemp� por outro item.#l#k" ); 
			else v1 = self.askMenu( "Ei... Por que n�o vai comigo? Acho que meu irm�o vir� com outras pessoas.\r\n#L0##e1. #n#bQue tipo de evento � esse?#k#l\r\n#L1##e2. #n#bExplique o evento do jogo para mim.#k#l\r\n#L2##e3. #n#bEst� certo, vamos!#k#l" ); 
			
		} 
		else if ( cmap == 200000000 ) { 
			self.say( "Ei, sou #b#p9000011##k. Estou aqui esperando por meus irm�os... Por que est�o demorando tanto? Fiquei chateado agora... Se n�o chegarmos l� na hora, talvez n�o consigamos participar do evento..." ); 
			self.say( "Humm... O que eu deveria fazer? O evento come�ar� logo... Muitas pessoas foram participar do evento, ent�o � melhor corrermos..." ); 
			if ( proof == 1 ) v1 = self.askMenu( "Ei... Por que voc� n�o vem comigo, ent�o?\r\n#L0##e1. #n#bQue tipo de evento � esse?#k#l\r\n#L1##e2. #n#bExplique o evento do jogo para mim.#k#l\r\n#L2##e3. #n#bEst� certo, vamos!#k#l\r\n#L3#IGostaria de trocar o Certificado de Ganhador em joquemp� por outro item.#l#k" ); 
			else  v1 = self.askMenu( "Ei... Por que n�o vem comigo ent�o?\r\n#L0##e1. #n#bQue tipo de evento � esse?#k#l\r\n#L1##e2. #n#bExplique o evento do jogo para mim.#k#l\r\n#L2##e3. #n#bEst� certo, vamos!#k#l" ); 
		} 
		else if ( cmap == 220000000 ) { 
			self.say( "Ei, sou #b#p9000013##k. Por enquanto, estou esperando por meus irm�os, mas eles ainda n�o chegaram. Estou cheio e cansado de fazer as coisas por conta pr�pria. Pelo menos durante o evento, n�o me sinto t�o s� com tanta gente ao redor e tudo mais. Todos os eventos acontecem com um n�mero limitado de pessoas, ent�o, se n�o chegar logo l�, n�o poderei participar." ); 
			self.say( "Podemos ser primos e tudo mais, mas n�o paramos de sentir falta um do outro. Cara, o que devo fazer? O evento deve come�ar a qualquer minuto... Um monte de gente deve estar l� esperando e n�o deve ter espa�o para eles..." ); 
			
			if ( proof == 1 ) v1 = self.askMenu( "O que voc� acha? Voc� quer se juntar a mim e ir para o evento?\r\n#b#L0# Que tipo de evento?#l\r\n#L1# Explique para mim os jogos do evento.#l\r\n#L2# Est� certo, vamos!#l#k\r\n#L3# Gostaria de trocar o Certificado de Ganhador em joquemp� por outro item.#l#k" ); 
			
			else v1 = self.askMenu( "O que voc� acha? Voc� quer se juntar a mim e ir para o evento?\r\n#b#L0# Que tipo de evento?#l\r\n#L1# Explique para mim os jogos do evento.#l\r\n#L2# Est� certo, vamos!#l#k" ); 
		} 

		if ( v1 == 0 ) { 
			self.say( "MapleStory Global est� comemorando seu 1� aniversario durante todo este m�s! Os GMs realizar�o Eventos GM surpresas durante esse tempo. Ent�o, fique alerta e certifique-se de participar de, pelo menos, um dos eventos para conseguir bons pr�mios!" ); 
		} 
		else if ( v1 == 1 ) { 
			v2 = self.askMenu( "Haver� muitos jogos para este evento. Isso vai instru�-lo como conduzir o jogo antes de inici�-lo. Escolha o evento sobre o qual voc� quer mais informa��es!\r\n#b#L0# Ola Ola#l\r\n#L1# Teste F�sico MapleStory#l\r\n#L2# Bola de Neve#l\r\n#L3# Colheita do Coco#l\r\n#L4# Teste do O e X#l\r\n#L5# Ca�a ao Tesouro#l#k" ); 
			if ( v2 == 0 ) self.say( "#b[Ola Ola]#k � um jogo no qual os participantes sobem escadas para alcan�ar o topo. Suba e mude para o pr�ximo n�vel, escolhendo o portal correto entre os numerosos portais dispon�veis. \r\n\r\nO jogo consiste em tr�s n�veis, e o tempo limite � de #b6 MINUTOS#k. Durante o [Ola Ola], voc� #bn�o poder� saltar, teletransportar-se, correr ou aumentar sua velocidade com po��es ou itens#k.\n Tamb�m h� portais de truques, que o guiar�o a um lugar estranho, ent�o, por favor, tome cuidado com eles." ); 
			else if ( v2 == 1 ) self.say( "#b[Teste F�sico MapleStory] � uma corrida de obst�culo#k parecida com a Floresta da Paci�ncia. Voc� vence se superar os obst�culos e atingir o ponto de chegada dentro do limite de tempo.\r\n\r\nO jogo tem quatro n�veis, e o limite de tempo � #b15 MINUTOS#k. Durante [Teste F�sico MapleStory], voc� n�o poder� teletransportar-se ou correr." ); 
			else if ( v2 == 2 ) self.say( "#b[Bola de Neve]#kconsiste em dois times, Time Maple e Time Story, que disputam para ver #bquem empurrou mais longe a maior bola de neve dentro do limite de tempo#k. Se o jogo n�o for decidido dentro do limite de tempo, o time que empurrou a bola de neve mais longe ganha.\r\n\r\nPara empurrar a bola, aperte Ctrl. Os ataques de longa dist�ncia e o ataque baseado em per�cia n�o funcionam aqui; #bsomente os ataques de curta dist�ncia#k.\r\n\r\nSe um personagem tocar na bola, ele dever� voltar ao ponto de partida. Ataque o Boneco de Neve em frente ao ponto de partida para evitar que o time advers�rio avance com a bola de neve. � aqui que uma estrat�gia bem planejada funciona, quando o time decidir� se vai ao encontro da Bola de Neve ou do Boneco de Neve." ); 
			else if ( v2 == 3 ) self.say( "#b[Colheita do Coco]#k consiste em dois times, Time Maple e Time Story. Os dois times competem para ver #bqual deles apanha mais cocos#k. O limite de tempo � de #b5 MINUTOS#k. Se o jogo terminar empatado, ser� dada uma prorroga��o de 2 minutos para determinar o vencedor. Se, por alguma raz�o, o placar continuar empatado, o jogo terminar� em sorteio.\r\n\r\nTodos os ataques de longa dist�ncia e ataques baseados em per�cia n�o funcionar�o aqui; #bsomente os ataques de curta dist�ncia funcionar�o#k. Se voc� n�o tem uma arma de ataque a curta dist�ncia, voc� pode compr�-la por meio de um NPC dentro do mapa de eventos. N�o importa o n�vel do personagem, da arma ou da per�cia, todos os danos ser�o os mesmos.\r\n\r\nFique atento aos obst�culos e armadilhas presentes no mapa. Se o personagem morrer durante o jogo, ele ser� eliminado. Vencer� o jogador que atacar por �ltimo, antes do coco cair. S� os cocos que atingirem o ch�o ser�o contados. Entretanto, os que ca�rem do coqueiro ou que explodirem ocasionalmente N�O SER�O CONTADOS. Existe tamb�m um portal escondido em uma das conchas na parte de baixo do mapa, use-o sabiamente!" ); 
			else if ( v2 == 4 ) self.say( "#b[Teste O e X]#k � um jogo de MapleStory atrav�s de Xs and Os. Quando ingressar no jogo, ative o minimapa, apertando M, para ver onde est�o os Xs e os Os. Ser�o feitas #r10 perguntas#k, e o jogador que responder a todas corretamente ser� o vencedor.\r\n\r\nDepois que a pergunta for feita, use a escada para entrar na �rea onde poder� estar a resposta certa, seja X ou O. Se o personagem n�o escolher uma resposta ou ficar na escada al�m do tempo permitido, ele ser� eliminado. Mantenha sua posi��o at� que [CORRETO] apare�a na tela. Para evitar qualquer tipo de trapa�a, todos os tipos de conversas ser�o desligados durante o teste do O e X." ); 
			else self.say( "#b[Ca�a ao Tesouro]#k � um jogo no qual sua meta � achar, em 10 minutos, os #bpergaminhos do tesouro#k que est�o escondidos em todo o mapa #r #k. Haver� um n�mero de misteriosas arcas do tesouro escondidas, e, uma vez que voc� as quebre, muitos itens surgir�o da arca. Seu trabalho � separar o pergaminho do tesouro destes itens. \n\r\nArcas do Tesouro podem ser destru�das usando#bataques regulares#k, e tendo com voc� o pergaminho do tesouro, voc� pode troc�-lo pelo Pergaminho dos Segredos por meio de um NPC que seja encarregado por trocar itens. O NPC que troca itens pode ser encontrado no mapa da Ca�a ao Tesouro, mas voc� tamb�m pode trocar seu pergaminho por meio #b[Vikin]#k de Porto Lith.\r\n\r\nEste jogo tem alguns portais e pontos de teletransporte escondidos. Para us�-los, aperte #bseta para cima#k em um determinado ponto e ser� teletransportado para um lugar diferente. Tente pular aleatoriamente para voc� tamb�m poder chegar a escadas ou cordas escondidas. Tamb�m haver� uma arca do tesouro que o levar� a um local escondido, e uma arca secreta que s� poder� ser encontrada por meio do portal secreto. Ent�o, procure ao seu redor.\r\n\r\nDurante o jogo da Ca�a ao Tesouro, todas as per�cias de ataque estar�o #r desabilitadas#k, ent�o , por favor, quebre a arca com uma arma comum." ); 
		} 
		else if ( v1 == 2 ) { 
			inventory = target.inventory; 
			// Test sever 
			if ( serverType == 2 ) { 
				map = self.getIntReg( "map" ); 
				count = self.incIntReg( "count", -1 ); 

				if ( map >= 0 ) { 
					strMap = string( map ); 
					preMapNum = substring( strMap, 0, 3 ); 
				} 
				else preMapNum = ""; 

				if ( inventory.itemCount( 4031019 ) < 1 and count >= 0 and preMapNum == "109" ) { 
					ret = inventory.exchange( 0, 4000038, 1 ); 
					if ( ret != 0 ) { 
						if ( cmap == 60000 ) qr.set( 9000, "maple" ); 
						else if ( cmap == 104000000 ) qr.set( 9000, "victoria" ); 
						else if ( cmap == 200000000 ) qr.set( 9000, "ossyria" ); 
						else if ( cmap == 220000000 ) qr.set( 9000, "ludi" ); 
						registerTransferField( map, "" ); 
					} 
					else { 
						self.incIntReg( "count", 1 ); 
						self.say( "Voc� tem um slot vazio no seu invent�rio de etc.? Verifique novamente!" ); 
					} 
				} 
				else { 
					self.incIntReg( "count", 1 ); 
					self.say( "Ou o evento ainda n�o come�ou, ou voc� j� tem #t4031019#, ou j� participopu deste evento nas �ltimas 24 horas. Por favor, tente novamente mais tarde!" ); 
				} 
			} 
			// Real GL sever 
			else { 
				map = self.getIntReg( "map" ); 
				count = self.incIntReg( "count", -1 ); 

				if ( map >= 0 ) { 
					strMap = string( map ); 
					preMapNum = substring( strMap, 0, 3 ); 
				} 
				else preMapNum = ""; 

				cTime = currentTime; 
				if ( val2 == "" ) goEvent = 1; 
				else { 
					aTime = compareTime( cTime, val2 ); 
					if ( aTime >= 1440 ) goEvent = 1; 
					else goEvent = 0; 
				} 

				if ( goEvent == 1 and inventory.itemCount( 4031019 ) < 1 and count >= 0 and preMapNum == "109" ) { 
					ret = inventory.exchange( 0, 4000038, 1 ); 
					if ( ret != 0 ) { 
						if ( cmap == 60000 ) qr.set( 9000, "maple" ); 
						else if ( cmap == 104000000 ) qr.set( 9000, "victoria" ); 
						else if ( cmap == 200000000 ) qr.set( 9000, "ossyria" ); 
						else if ( cmap == 220000000 ) qr.set( 9000, "ludi" ); 
						qr.set( 9001, cTime ); 
						registerTransferField( map, "" ); 
					} 
					else { 
						self.incIntReg( "count", 1 ); 
						self.say( "Voc� tem um slot vazio no seu invent�rio de etc.? Verifique novamente!" ); 
					} 
				} 
				else { 
					self.incIntReg( "count", 1 ); 
					self.say( "Ou o evento ainda n�o come�ou, ou voc� j� tem #t4031019#, ou j� participopu deste evento nas �ltimas 24 horas. Por favor, tente novamente mais tarde!" ); 
				} 
			} 
		} 
		else if ( v1 == 3 ) { 
		// not ready... 
		
		} 
	} 
} 

// Pietro : 9000002 
script "Event02" {	 
	qr = target.questRecord; 
	valGstar = qr.get( 9200 ); 
	if ( valGstar == "1" ) { 
		registerTransferField( 109080003, "" ); 
	} 
	else { 
		val = qr.get( 9000 ); 
		inventory = target.inventory; 
	
	if ( val == "maple" or val == "victoria" or val == "ossyria" or val == "ludi" ) { 
		if ( inventory.itemCount( 4031019 ) < 1 ) { 
			self.say( "Bam bam bam bam!!! Voc� ganhou o jogo do #bEVENTO#k. Parab�ns por chegar t�o longe!" ); 
			self.say( "Como vencedor, voc� ser� recompensado com #b#t4031019##k. No pergaminho, h� uma informa��o secreta, escrita com caracteres antigos." ); 
			self.say( "O pergaminho dos Segredos pode ser decifrado por #r#p9000007##k ou #rGeanie#k em Ludibrium. Leve-o com voc� e algo bom acontecer�." ); 
			ret = inventory.exchangeEx( 0, "4031019,Period:43200", 1 ); 
			if ( ret == 0 ) self.say( "Acho que seu invent�rio est� cheio. Por favor, arranje espa�o e venha falar comigo." ); 
			else { 
			logEvent( target.sCharacterName + " / " + val ); 
				if ( val == "maple" ) { 
					qr.remove( 9000 ); 
					registerTransferField( 60000, "" ); 
				} 
				else if ( val == "victoria" ) { 
					qr.remove( 9000 ); 
					registerTransferField( 104000000, "" ); 
				} 
				else if ( val == "ossyria" ) { 
					qr.remove( 9000 ); 
					registerTransferField( 200000000, "" ); 
				} 
				else { 
					qr.remove( 9000 ); 
					registerTransferField( 220000000, "" ); 
				} 
			} 
		} 
		else { 
			self.say( "Voc� j� tem #r#t4031019##k. Este pergaminho est� cheio de um incr�vel poder m�gico, t�o poderoso que voc� deveria carreg�-lo sempre com voc�. V� e leve este pergaminho para #r#p9000007##k imediatamente." ); 
			if ( val == "maple" ) { 
				qr.remove( 9000 ); 
				registerTransferField( 60000, "" ); 
			} 
			else if ( val == "victoria" ) { 
				qr.remove( 9000 ); 
				registerTransferField( 104000000, "" ); 
			} 
			else if ( val == "ossyria" ) { 
				qr.remove( 9000 ); 
				registerTransferField( 200000000, "" ); 
			} 
			else { 
				qr.remove( 9000 ); 
				registerTransferField( 220000000, "" ); 
			} 
		} 
	} 
	else self.say( "N�o acho que encontrou #p9000001# ou #p9000000#. COMO chegou aqui em primeiro lugar??? Voc�... ?!?!" ); 
	} 
} 

// Pietra : 9000010 
script "Event06" {	 
	qr = target.questRecord; 
	valGstar = qr.get( 9200 ); 
	if ( valGstar == "1" ) { 
		registerTransferField( 109080003, "" ); 
	} 
	else { 
	val = qr.get( 9000 ); 
	inventory = target.inventory; 

	if ( inventory.itemCount( 4031018 ) >= 1 ) { 
    v = self.askMenu( "Ent�o voc� tem #b#t4031018##k Em vez de falar comigo, voc� deve querer falar com #p9000006# sobre trocar #t4031018# por um pr�mio.\r\n\r\n#b#L0# Que � #p9000006#?#l\r\n#b#L1# Por favor, me leve de volta onde estava antes.#l#k" ); 

		if ( v == 0 ) self.say( "#b#p9000006##k � a pessoa que ir� mand�-lo ao mapa onde pode trocar seu t4031018# por um pr�mio. Ele est� � esquerda de onde eu estou agora, ach�-lo ser� f�cil." ); 
		else if ( v == 1 ) { 
			nRet = self.askYesNo( "Eu recomendo trocar seu #b#t4031018##k por um pr�mio antes de retornar. Voc� ainda pode trocar em Porto Lith, por�m, se estiver muito ocupado, pode ir embora agora mesmo. Gostaria de voltar para casa agora mesmo?" ); 
			if ( nRet != 0 ) { 
				if ( val == "maple" ) { 
					qr.remove( 9000 ); 
					registerTransferField( 60000, "" ); 
				} 
				else if ( val == "victoria" ) { 
					qr.remove( 9000 ); 
					registerTransferField( 104000000, "" ); 
				} 
				else if ( val == "ossyria" ) { 
					qr.remove( 9000 ); 
					registerTransferField( 200000000, "" ); 
				} 
				else { 
					qr.remove( 9000 ); 
					registerTransferField( 220000000, "" ); 
				} 
			} 
		} 
	} 
	else { 
		self.say( "Sinto muito, infelizmente voc� n�o ganhou o evento. Tente novamente em outra ocasi�o. Voc� pode retornar para onde estava atrav�s de mim." ); 

		if ( val == "maple" ) { 
			qr.remove( 9000 ); 
			registerTransferField( 60000, "" ); 
		}	 
		else if ( val == "victoria" ) { 
			qr.remove( 9000 ); 
			registerTransferField( 104000000, "" ); 
		} 
		else if ( val == "ossyria" ) { 
			qr.remove( 9000 ); 
			registerTransferField( 200000000, "" ); 
		} 
		else { 
			qr.remove( 9000 ); 
			registerTransferField( 220000000, "" ); 
		} 
	} 
	} 
} 

// Vikin of Lith Harbor : 9000009 
script "Event03_1" { 
	qr = target.questRecord; 
	inventory = target.inventory; 

	if ( inventory.itemCount( 4031018 ) >= 1 ) { 
		if ( inventory.itemCount( 4031019 ) < 1 ) { 
			self.say( "Uau, voc� � incr�vel. Quer navegar com a gente? O qu�? Est� ocupado? Hum... N�o pode. Em vez disso te levarei para outro lugar interessante. Disponibilizarei o mapa para us�-lo � vontade." ); 
			ret = inventory.exchange( 0, 4031018, -1 ); 
			if ( ret == 0 ) self.say( "Ah, n�o... Tem certeza de que voc� tem um #t4031018#? Verifique de novo." ); 
			else { 
				qr.set( 9000, "victoria" ); 
				registerTransferField( 109050000, "" ); 
			} 
		} 
		else self.say( "Voc� j� tem #r#t4031019##k. Este pergaminho est� cheio de um incr�vel poder m�gico, t�o poderoso que voc� deveria carreg�-lo sempre com voc�. V� e leve este pergaminho para #r#p9000007##k imediatamente." ); 
	} 
	else self.say( "Ei, Ei!!! Ache #t4031018#! Perdi o mapa em algum lugar e n�o posso ir embora sem ele." ); 
} 

// Vikan : 9000003, Vikon : 9000004, Vikone : 9000005, Vikoon : 9000006 
script "Event03" { 
	inventory = target.inventory; 

	if ( inventory.itemCount( 4031018 ) >= 1 ) { 
		if ( inventory.itemCount( 4031019 ) < 1 ) { 
			self.say( "Uau, voc� � incr�vel. Quer navegar com a gente? O qu�? Est� ocupado? Hum... N�o pode. Em vez disso, te levarei para outro lugar interessante.  Disponibilizarei o mapa para us�-lo � vontade." ); 
			ret = inventory.exchange( 0, 4031018, -1 ); 
			if ( ret == 0 ) self.say( "Ah, n�o... Tem certeza de que voc� tem um #t4031018#? Verifique de novo." ); 
			else registerTransferField( 109050000, "" ); 
		} 
		else self.say( "Voc� j� tem #r#t4031019##k. Este pergaminho est� cheio de um incr�vel poder m�gico, t�o poderoso que voc� deveria carreg�-lo sempre com voc�. V� e leve este pergaminho para #r#p9000007##k imediatamente." ); 
	} 
	else self.say( "Ei, Ei!!! Ache #t4031018#! Perdi o mapa em algum lugar e n�o posso ir embora sem ele." ); 
} 

// Chun Ji : 9000007 
script "Event04" { 
	inventory = target.inventory; 

	if ( inventory.itemCount( 4031019 ) >= 1 ) { 
		self.say( "Ter algo t�o raro e precioso n�o � nada mal para um ningu�m como voc�. O qu�? Voc� quer que eu decifre o pergaminho para voc�? N�o. Nem os Supermagos podem lidar facilmente com o pergaminho que est� cheio de for�as secretas de tempos remotos." ); 
		self.say( "Mas, ei... Voc� me mostraria o pergaminho? Se eu decifr�-lo com seguran�a, ele pode me ajudar tremendamente na miss�o de acabar com os poderes malignos que est�o por todo o mundo." ); 
		self.say( "Para decifr�-lo com seguran�a, devo precisar de #b50 #t4000008##k. Pegue para mim os encantos e o pergaminho, ent�o, te darei o pai de todos os itens que eu juntei, ao derrotar as for�as do mal por todos estes anos." ); 
		if ( inventory.itemCount( 4000008 ) >= 50 ) { 
			self.say( "Est� bem, te darei o item precioso que lhe prometi. Isso chama-se o #r#t4031017##k e eu o obtive derrotando um dos piores monstros dos tempos antigos. N�O � um item f�cil de conseguir." ); 
			self.say( "Um item dif�cil de encontrar est� dentro da caixa. Infelizmente, perdi a chave, ent�o, n�o posso abri-la para voc�. Voc� talvez possa abri-la em #bCidade de Kerning#k onde h� um incr�vel #rchaveiro#k que talvez consiga para voc�.." ); 
			ret = inventory.exchangeEx( 0, "4031019", -1, "4000008", -50, "4031017,Period:21600", 1 ); 
			if ( ret == 0 ) self.say( "Eu n�o creio que tenha espa�o em seu invent�rio. Livre espa�o l� e venha falar comigo." ); 
		} 
	} 
	else self.say( "Um ningu�m... Deixe-me s�..." ); 
} 

// Mr.Pickall : 9000008 
script "Event05" { 
	self.say( "Bem-vindo. hah! Eu posso pegar tudo no mundo que possa ser pego. Hah! Se voc� n�o tem a chave para abrir algo que esteja trancado, traga para mim. Ha!" ); 
	inventory = target.inventory; 

	if ( inventory.itemCount( 4031017 ) >= 1 ) { 
		self.say( "Ah, que incr�vel. Hah! Como foi que conseguiu algo t�o raro como isto? h�h? Olha, mas isso est� trancado t�o bem, que eu talvez precise de v�rios materiais para abri-lo. Hah!" ); 
		v1 = self.askMenu( "Tenho todo o resto menos 1 #t4021005# e 5 #t4000010#s ... Pegue-os para mim e eu abrirei para voc� de gra�a. Hah! \r\n#L0##e1. #n#bPegue os materiais para ele.#k#l\r\n#L1##e2. #n#bPague-o.#k#l" ); 
		if ( inventory.slotCount( 1 ) > inventory.holdCount( 1 ) and inventory.slotCount( 2 ) > inventory.holdCount( 2 ) and inventory.slotCount( 4 ) > inventory.holdCount( 4 ) ) { 
			nNewItemSort = 0; 
			nNewItemID = 0; 
			rn1 = random( 1, 100 ); 

			if ( rn1 < 6 ) nNewItemSort = 1; 
			else if ( rn1 > 5 and rn1 < 11 ) nNewItemSort = 2; 
			else if ( rn1 > 10 and rn1 < 16 ) nNewItemSort = 3; 
			else if ( rn1 > 15 and rn1 < 21 ) nNewItemSort = 4; 
			else if ( rn1 > 20 and rn1 < 26 ) nNewItemSort = 5; 
			else if ( rn1 > 25 and rn1 < 31 ) nNewItemSort = 6; 
			else if ( rn1 > 30 and rn1 < 36 ) nNewItemSort = 7; 
			else if ( rn1 > 35 and rn1 < 40 ) nNewItemSort = 8; 
			else if ( rn1 > 40 and rn1 < 71 ) nNewItemSort = 9; 
			else if ( rn1 > 70 and rn1 < 101 ) nNewItemSort = 10; 

			if ( nNewItemSort == 1 ) { 
				nNewItemNum = 1; 
				rn2 = random( 1, 13 ); 
				if ( rn2 == 1 ) nNewItemID = 1002086; 
				else if ( rn2 == 2 ) nNewItemID = 1002218; 
				else if ( rn2 == 3 ) nNewItemID = 1002214; 
				else if ( rn2 == 4 ) nNewItemID = 1002210; 
				else if ( rn2 == 5 ) nNewItemID = 1032013; 
				else if ( rn2 == 6 ) nNewItemID = 1072135; 
				else if ( rn2 == 7 ) nNewItemID = 1072143; 
				else if ( rn2 == 8 ) nNewItemID = 1072125; 
				else if ( rn2 == 9 ) nNewItemID = 1072130; 
				else if ( rn2 == 10 ) nNewItemID = 1082009; 
				else if ( rn2 == 11 ) nNewItemID = 1082081; 
				else if ( rn2 == 12 ) nNewItemID = 1082084; 
				else if ( rn2 == 13 ) nNewItemID = 1082065; 
			} 
			else if ( nNewItemSort == 2 ) { 
				nNewItemNum = 1; 
				rn2 = random( 1, 18 ); 
				if ( rn2 == 1 ) nNewItemID = 1032015; 
				else if ( rn2 == 2 ) nNewItemID = 1092009; 
				else if ( rn2 == 3 ) nNewItemID = 1302011; 
				else if ( rn2 == 4 ) nNewItemID = 1312009; 
				else if ( rn2 == 5 ) nNewItemID = 1322018; 
				else if ( rn2 == 6 ) nNewItemID = 1332015; 
				else if ( rn2 == 7 ) nNewItemID = 1332017; 
				else if ( rn2 == 8 ) nNewItemID = 1372007; 
				else if ( rn2 == 9 ) nNewItemID = 1382006; 
				else if ( rn2 == 10 ) nNewItemID = 1402011; 
				else if ( rn2 == 11 ) nNewItemID = 1412007; 
				else if ( rn2 == 12 ) nNewItemID = 1422009; 
				else if ( rn2 == 13 ) nNewItemID = 1432006; 
				else if ( rn2 == 14 ) nNewItemID = 1442010; 
				else if ( rn2 == 15 ) nNewItemID = 1452004; 
				else if ( rn2 == 16 ) nNewItemID = 1462008; 
				else if ( rn2 == 17 ) nNewItemID = 1472022; 
				else if ( rn2 == 18 ) nNewItemID = 2070005; 
			} 
			else if ( nNewItemSort == 3 ) { 
				rn2 = random( 1, 4 ); 
				if ( rn2 >= 1 and rn2 <=3 ) { 
					nNewItemNum = 5; 
					nNewItemID = 4003000; 
				} else if ( rn2 == 4 ) { 
					nNewItemNum = 1; 
					nNewItemID = 2100000; 
				} 
			} 
			else if ( nNewItemSort == 4 ) { 
				nNewItemNum = 1; 
				rn2 = random( 1, 52 ); 
				if ( rn2 == 1 ) nNewItemID = 2040704; 
				else if ( rn2 == 2 ) nNewItemID = 2040501; 
				else if ( rn2 == 3 ) nNewItemID = 2040401; 
				else if ( rn2 == 4 ) nNewItemID = 2040601; 
				else if ( rn2 == 5 ) nNewItemID = 2040705; 
				else if ( rn2 == 6 ) nNewItemID = 2040502; 
				else if ( rn2 == 7 ) nNewItemID = 2040402; 
				else if ( rn2 == 8 ) nNewItemID = 2040602; 
				else if ( rn2 == 9 ) nNewItemID = 2040301; 
				else if ( rn2 == 10 ) nNewItemID = 2040302; 
				else if ( rn2 == 11 ) nNewItemID = 2040707; 
				else if ( rn2 == 12 ) nNewItemID = 2040708; 
				else if ( rn2 == 13 ) nNewItemID = 2040804; 
				else if ( rn2 == 14 ) nNewItemID = 2040805; 
				else if ( rn2 == 15 ) nNewItemID = 2040901; 
				else if ( rn2 == 16 ) nNewItemID = 2040902; 
				else if ( rn2 == 17 ) nNewItemID = 2041001; 
				else if ( rn2 == 18 ) nNewItemID = 2041002; 
				else if ( rn2 == 19 ) nNewItemID = 2041004; 
				else if ( rn2 == 20 ) nNewItemID = 2041005; 
				else if ( rn2 == 21 ) nNewItemID = 2041007; 
				else if ( rn2 == 22 ) nNewItemID = 2041008; 
				else if ( rn2 == 23 ) nNewItemID = 2041010; 
				else if ( rn2 == 24 ) nNewItemID = 2041011; 
				else if ( rn2 == 25 ) nNewItemID = 2043001; 
				else if ( rn2 == 26 ) nNewItemID = 2043002; 
				else if ( rn2 == 27 ) nNewItemID = 2043101; 
				else if ( rn2 == 28 ) nNewItemID = 2043102; 
				else if ( rn2 == 29 ) nNewItemID = 2043201; 
				else if ( rn2 == 30 ) nNewItemID = 2043202; 
				else if ( rn2 == 31 ) nNewItemID = 2043301; 
				else if ( rn2 == 32 ) nNewItemID = 2043302; 
				else if ( rn2 == 33 ) nNewItemID = 2043701; 
				else if ( rn2 == 34 ) nNewItemID = 2043702; 
				else if ( rn2 == 35 ) nNewItemID = 2043801; 
				else if ( rn2 == 36 ) nNewItemID = 2043802; 
				else if ( rn2 == 37 ) nNewItemID = 2044001; 
				else if ( rn2 == 38 ) nNewItemID = 2044002; 
				else if ( rn2 == 39 ) nNewItemID = 2044101; 
				else if ( rn2 == 40 ) nNewItemID = 2044102; 
				else if ( rn2 == 41 ) nNewItemID = 2044201; 
				else if ( rn2 == 42 ) nNewItemID = 2044202; 
				else if ( rn2 == 43 ) nNewItemID = 2044301; 
				else if ( rn2 == 44 ) nNewItemID = 2044302; 
				else if ( rn2 == 45 ) nNewItemID = 2044401; 
				else if ( rn2 == 46 ) nNewItemID = 2044402; 
				else if ( rn2 == 47 ) nNewItemID = 2044501; 
				else if ( rn2 == 48 ) nNewItemID = 2044502; 
				else if ( rn2 == 49 ) nNewItemID = 2044601; 
				else if ( rn2 == 50 ) nNewItemID = 2044602; 
				else if ( rn2 == 51 ) nNewItemID = 2044701; 
				else if ( rn2 == 52 ) nNewItemID = 2044702; 
			} 
			else if ( nNewItemSort == 5 ) { 
				nNewItemNum = 10; 
				rn2 = random( 1, 3 ); 
				if ( rn2 == 1 ) nNewItemID = 4010006; 
				else if ( rn2 == 2 ) nNewItemID = 4020007; 
				else if ( rn2 == 3 ) nNewItemID = 4020008; 
			} 
			else if ( nNewItemSort == 6 ) { 
				nNewItemNum = 4; 
				rn2 = random( 1, 3 ); 
				if ( rn2 == 1 ) nNewItemID = 4004000; 
				else if ( rn2 == 2 ) nNewItemID = 4004001; 
				else if ( rn2 == 3 ) nNewItemID = 4004002; 
				else if ( rn2 == 4 ) nNewItemID = 4004003; 
			} 
			else if ( nNewItemSort == 7 ) { 
				rn2 = random( 1, 4 ); 
				if ( rn2 ==1 ) { 
					nNewItemNum = 30; 
					nNewItemID = 2000004; 
				} else if ( rn2 >= 2 and rn2 <= 4 ) { 
					nNewItemNum = 100; 
					nNewItemID = 2022000; 
				} 
			} 
			else if ( nNewItemSort == 8 ) { 
				nNewItemNum = 50; 
				rn2 = random( 1, 4 ); 
				if ( rn2 == 1 ) nNewItemID = 2020012; 
				else if ( rn2 == 2 ) nNewItemID = 2020013; 
				else if ( rn2 == 3 ) nNewItemID = 2020014; 
				else if ( rn2 == 4 ) nNewItemID = 2020015; 
			} 
			else if ( nNewItemSort == 9 ) { 
				nNewItemNum = 15; 
				rn2 = random( 1, 13 ); 
				if ( rn2 == 1 ) nNewItemID = 4010000; 
				else if ( rn2 == 2 ) nNewItemID = 4010001; 
				else if ( rn2 == 3 ) nNewItemID = 4010002; 
				else if ( rn2 == 4 ) nNewItemID = 4010003; 
				else if ( rn2 == 5 ) nNewItemID = 4010004; 
				else if ( rn2 == 6 ) nNewItemID = 4010005; 
				else if ( rn2 == 7 ) nNewItemID = 4020000; 
				else if ( rn2 == 8 ) nNewItemID = 4020001; 
				else if ( rn2 == 9 ) nNewItemID = 4020002; 
				else if ( rn2 == 10 ) nNewItemID = 4020003; 
				else if ( rn2 == 11 ) nNewItemID = 4020004; 
				else if ( rn2 == 12 ) nNewItemID = 4020005; 
				else if ( rn2 == 13 ) nNewItemID = 4020006; 
			} 
			else if ( nNewItemSort == 10 ) { 
				nNewItemNum = 100; 
				rn2 = random( 1, 3 ); 
				if ( rn2 == 1 ) nNewItemID = 2001000; 
				else if ( rn2 == 2 ) nNewItemID = 2001002; 
				else if ( rn2 == 3 ) nNewItemID = 2001001; 
			} 
			
			if ( v1 == 0 ) { 
				if ( inventory.itemCount( 4021005 ) >= 1 and inventory.itemCount( 4000010 ) >= 5 ) { 
					ret = inventory.exchange( 0, 4031017, -1, 4021005, -1, 4000010, -5, nNewItemID, nNewItemNum ); 
					if ( ret == 0 ) self.say( "Voc� tem 100% de certeza que tem 1 #t4021005# e 5 #t4000010#s? Hah? Talvez voc� tenha que checar. Hah!" ); 
					else self.say( "Eu a abri de gra�a! hah! Te vejo por a�. hah!" ); 
				} 
				else self.say( "Agora consiga-me #b1 #t4021005##k e #b5 #t4000010#s#k. Hah! Eu a abri de gra�a! Hah!" ); 
			} 
			else if ( v1 == 1 ) { 
				nRet = self.askYesNo( "Preciso usar materiais caros para isso, isso vai lhe custar caro. Hah! #b10000 mesos#k! Ainda vai fazer isso? Hah??" ); 
				if ( nRet == 0 ) self.say( "10.000 mesos � muito eficiente. Hah! H� uma maneira de junt�-los, ent�o, volte novamente. Hah!" ); 
				else if ( nRet == 1 ) { 
					ret = inventory.exchange( -10000, 4031017, -1, nNewItemID, nNewItemNum ); 
					if ( ret == 0 ) self.say( "N�o tem mesos suficientes. Hah! #b10000 mesos#k. Hah!" ); 
					else self.say( "Peguei o dinheiro, eu a abri para voc�, verei voc� mais tarde. Hah!" ); 
				} 
			} 
		} 
		else self.say( "Voc� precisa de, pelo menos, um espa�o livre no seu invent�rio de etc. e no de equipamento. Hah! Livre espa�o e a� fale comigo, hah!" ); 
	} 
} 

// Mobile Maple Story : 9010001, 9010002, 9010003 
script "Event07" { 
	v1 = self.askMenu( "Voc� pode jogar MapleStory (- Feiticeiro) no seu celular! E se baixar MapleStory (- Feiticeiro), ganhar� 6 itens de dinheiro de gra�a! Onde pode baixar (-Wizet). hehe\r\n#b#L0# SKT(011, 017, 010) Usu�rio#l\r\n#b#L1# KTF(016, 018, 010) Usu�rio#l" ); 
	if ( v1 == 0 ) { 
		self.say( "Itens Comprados" ); 
	} 
	else if ( v1 == 1 ) { 
		self.say( "Itens Comprados" ); 
	} 
} 

// Harry : 9000012 
script "Event09" { 
	v1 = self.askMenu( "Cara... Isso � quente!!! Como posso te ajudar?\r\n#b#L0# Saia do evento do jogo#l\r\n#b#L1# Compre a arma.(#t1322005# 1 meso)#l" ); 
	if ( v1 == 0 ) { 
		nRet = self.askYesNo( "Se sair agora, n�o poder� participar neste evento nas pr�ximas 24 horas. Quer mesmo sair?" ); 
		if ( nRet == 0 ) self.say( "Bom. N�o desista e tente pra valer. Se tentar pra valer, ganhar� uma recompensa!" ); 
		else registerTransferField( 109050001, "" ); 
	} 
	else if ( v1 == 1 ) { 
		nRet = self.askYesNo( "#t1322005# para iniciantes � 1 meso. Que achou? Vai querer?" ); 
		if ( nRet == 0 ) self.say( "Arma com velocidade de ataque � mais importante que arma de dano. Se precisar delas, por favor, volte." ); 
		else { 
			inventory = target.inventory; 
			ret = inventory.exchange( -1, 1322005, 1 ); 
			if ( ret == 0 ) self.say( "Tem certeza de que tem um slot vazio? Ou tem 1 meso? Por favor, verifique." ); 
			else self.say( "Voc� pegou #t1322005#? Te desejo boa sorte!" ); 
		} 
	} 
} 

script "Event08" { 
} 

script "event_master" { 
	event = FieldSet( "Event1" ); 
	answer1 = shuffle( 1, "01234" ); 
	answer2 = shuffle( 1, "01234567" ); 
	answer3 = shuffle( 1, "0123456789abcdef" ); 

	event.setVar( "ola_ans1", answer1 ); 
	event.setVar( "ola_ans2", answer2 ); 
	event.setVar( "ola_ans3", answer3 ); 

	event.setVar( "decide_ans", "1" ); 

	say1 = " " + answer1 + ": 01-Resposta  23-Ponto de Partida  4-N�o Ativo"; 
	say2 = " " + answer2 + ": 01-Resposta  34-Ponto de Partida  5-Inferior 67-N�o Ativo"; 
	say3 = " " + answer3 + ": 01-Resposta  23456-Ponto de Partida 789-Portal Diferente abcdef-N�o Ativo"; 
	target.message( say1 ); 
	target.message( say2 ); 
	target.message( say3 ); 
} 

function ola_answer1( integer num ) { 
	event = FieldSet( "Event1" ); 
	answer1 = event.getVar( "ola_ans1" ); 

	if ( substring( answer1, num, 1 ) == "0" or substring( answer1, num, 1 ) == "1" ) { 
		target.playPortalSE; 
		registerTransferField( 109030002, "start00" ); 
	} else if ( substring( answer1, num, 1 ) == "2" or substring( answer1, num, 1 ) == "3" ) { 
		target.playPortalSE; 
		registerTransferField( -1, "np00" ); 
	} else if ( substring( answer1, num, 1 ) == "4" ) { 
	} 
	return; 
} 

function ola_answer2( integer num ) { 
	event = FieldSet( "Event1" ); 
	answer2 = event.getVar( "ola_ans2" ); 

	if ( substring( answer2, num, 1 ) == "0" or substring( answer2, num, 1 ) == "1" or substring( answer2, num, 1 ) == "2"  ) { 
		target.playPortalSE; 
		registerTransferField( 109030003, "start00" ); 
	} else if ( substring( answer2, num, 1 ) == "3" or substring( answer2, num, 1 ) == "4" ) { 
		target.playPortalSE; 
		registerTransferField( -1, "np01" ); 
	} else if ( substring( answer2, num, 1 ) == "5" ) { 
		target.playPortalSE; 
		registerTransferField( -1, "np02" ); 
	} else if ( substring( answer2, num, 1 ) == "6" or substring( answer2, num, 1 ) == "7" ) { 
	} 
	return; 
} 

function ola_answer3( integer num ) { 
	event = FieldSet( "Event1" ); 
	answer3 = event.getVar( "ola_ans3" ); 

	if ( substring( answer3, num, 1 ) == "0" or substring( answer3, num, 1 ) == "1" ) { 
		target.playPortalSE; 
		registerTransferField( 109050000, "start00" ); 
	} else if ( substring( answer3, num, 1 ) == "2" or substring( answer3, num, 1 ) == "3" or substring( answer3, num, 1 ) == "4" or substring( answer3, num, 1 ) == "5" or substring( answer3, num, 1 ) == "6" ) { 
		target.playPortalSE; 
		registerTransferField( -1, "np03" ); 
	} else if ( substring( answer3, num, 1 ) == "7" ) { 
		target.playPortalSE; 
		registerTransferField( -1, "np04" ); 
	} else if ( substring( answer3, num, 1 ) == "8" ) { 
		target.playPortalSE; 
		registerTransferField( -1, "np05" ); 
	} else if ( substring( answer3, num, 1 ) == "9" ) { 
		target.playPortalSE; 
		registerTransferField( -1, "np06" ); 
	} else if ( substring( answer3, num, 1 ) == "a" or substring( answer3, num, 1 ) == "b" or substring( answer3, num, 1 ) == "c" or substring( answer3, num, 1 ) == "d" or substring( answer3, num, 1 ) == "e" or substring( answer3, num, 1 ) == "f" ) { 
	} 
	return; 
} 

//�ö�ö� ����ȭ _ ��Ż 
script "rand_ola" { 
	field = portal.field; 
	event = FieldSet( "Event1" ); 
/* 
	if ( event.getVar( "decide_num" ) != "1" ) { 
		if ( event.getVar( "decide_ans" ) != "1" ) { 
			answer1 = "14302"; 
			answer2 = "74302561"; 
			answer3 = "f49e60a2d7c8b351"; 

			event.setVar( "ola_ans1", answer1 ); 
			event.setVar( "ola_ans2", answer2 ); 
			event.setVar( "ola_ans3", answer3 );		 
		} 
		event.setVar( "decide_num", "1" ); 
	} 
*/ 
	if ( field.id == 109030001 ) { 
		if ( portal.getPortalID == 19 ) { 
			ola_answer1( 0 ); 
		} else if ( portal.getPortalID == 20 ) { 
			ola_answer1( 1 ); 
		} else if ( portal.getPortalID == 21 ) { 
			ola_answer1( 2 ); 
		} else if ( portal.getPortalID == 22 ) { 
			ola_answer1( 3 ); 
		} else if ( portal.getPortalID == 23 ) { 
			ola_answer1( 4 ); 
		}  
		end; 
	} else if ( field.id == 109030002 ) { 
		if ( portal.getPortalID == 9 ) { 
			ola_answer2( 0 ); 
		} else if ( portal.getPortalID == 10 ) { 
			ola_answer2( 1 ); 
		} else if ( portal.getPortalID == 11 ) { 
			ola_answer2( 2 ); 
		} else if ( portal.getPortalID == 12 ) { 
			ola_answer2( 3 ); 
		} else if ( portal.getPortalID == 13 ) { 
			ola_answer2( 4 ); 
		} else if ( portal.getPortalID == 14 ) { 
			ola_answer2( 5 ); 
		} else if ( portal.getPortalID == 15 ) { 
			ola_answer2( 6 ); 
		} else if ( portal.getPortalID == 16 ) { 
			ola_answer2( 7 ); 
		}  
		end; 
	} else if ( field.id == 109030003 ) { 
		if ( portal.getPortalID == 11 ) { 
			ola_answer3( 0 ); 
		} else if ( portal.getPortalID == 12 ) { 
			ola_answer3( 1 ); 
		} else if ( portal.getPortalID == 13 ) { 
			ola_answer3( 2 ); 
		} else if ( portal.getPortalID == 14 ) { 
			ola_answer3( 3 ); 
		} else if ( portal.getPortalID == 15 ) { 
			ola_answer3( 4 ); 
		} else if ( portal.getPortalID == 16 ) { 
			ola_answer3( 5 ); 
		} else if ( portal.getPortalID == 17 ) { 
			ola_answer3( 6 ); 
		} else if ( portal.getPortalID == 18 ) { 
			ola_answer3( 7 ); 
		} else if ( portal.getPortalID == 19 ) { 
			ola_answer3( 8 ); 
		} else if ( portal.getPortalID == 20 ) { 
			ola_answer3( 9 ); 
		} else if ( portal.getPortalID == 21 ) { 
			ola_answer3( 10 ); 
		} else if ( portal.getPortalID == 22 ) { 
			ola_answer3( 11 ); 
		} else if ( portal.getPortalID == 23 ) { 
			ola_answer3( 12 ); 
		} else if ( portal.getPortalID == 24 ) { 
			ola_answer3( 13 ); 
		} else if ( portal.getPortalID == 25 ) { 
			ola_answer3( 14 ); 
		} else if ( portal.getPortalID == 26 ) { 
			ola_answer3( 15 ); 
		} 
		end; 
	} 
} 

//�Ƹ����� ���� �Ͷ߸��� 
script "firework" { 
	inven = target.inventory; 
	nItem = inven.itemCount( 4001128 ); 

	foreNum = target.registerEventItem( 0 ); 

	forePer = integer( substring( foreNum, 0, 3 ) ); 

	self.say( "Ol�, eu sou Aramia. Eu sei como fazer os fogos de artif�cio! Se conseguir pegar Barris de P�lvora e entregar para mim, teremos fogos de artif�cio! Por favor, pegue todos os barris de p�lvora dos monstros." ); 
	v0 = self.askMenu( "Cada vez que os usu�rios pegam os barris de p�lvora necess�rios, podemos montar fogos de artif�cio!\r\n#b#L0# Aqui, eu trouxe um barril de p�lvora.#l#k\r\n#b#L1# Por favor, me mostre o status atual em conseguir barris de p�lvora.#l#k" ); 
	if ( v0 == 0 ) { 
		v1 = self.askNumber( "Trouxe o barril de p�lvora com voc�? Ent�o, por favor me d� o #bBarril de P�lvora#k que tem. Farei um belo fogo de artif�cio. Quantos est� disposto a me dar?\r\n#b< N�mero de Barris de P�lvora no invent�rio:" + nItem + " >#k", nItem, 0, nItem ); 
		if ( v1 == 0 ) { 
			self.say( "T.T vou precisar do barril de p�lvora para come�ar os fogos... Por favor, pense novamente e fale comigo." ); 
			end; 
		} else { 
			nIncNum = inven.itemCount( 4001128 ); 
			if( nIncNum > 0 ) { 
				ret = inven.exchange( 0, 4001128, -v1 ); 
				if ( ret == 0 ) { 
					self.say( "Tem certeza de que tem o barril de p�lvora? Verifique de novo." ); 
					end; 
				} 
				
				afterNum = target.registerEventItem( v1 ); 
				afterPer = integer( substring( afterNum, 0, 3 )); 
				afterLength = length( afterNum ); 
//				afterPeople = integer( substring( afterNum, 3, afterLength - 3 )); 
				
				if ( afterPer >= 100 ) { 
					self.say( "Wala. Finalmente, juntamos todos os barris de p�lvora! Vamos come�ar os fogos!!!" ); 
				} 


//					self.say( "Se tiver e puder trazer o barril de p�lvora, poderemos acender os fogos a qualquer hora! Consiga o barril de p�lvora para mim sempre que quiser." + forePer + " " + foreLevel + " " + afterPer + " " +afterLevel + " " +afterPeople ); 
				self.say( "N�o se esque�a de me dar o barril de p�lvora quando arranjar um." ); 
			} else { 
				self.say( "Voc� n�o tem sequer um barril de p�lvora. T.T" ); 
				end; 
			} 
		} 
	} else if ( v0 == 1 ) { 
		self.say( "Status da Cole��o de Barris de P�lvora\r\n#B"+ forePer + "#\r\nSe conseguirmos juntar todos, podemos come�ar com os fogos." ); 
	} 
} 


