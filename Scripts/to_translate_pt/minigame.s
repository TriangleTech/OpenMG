module "standard.s";

// Making the Omok-Set item for the minigame
function makeItem( integer setID, integer needItem1, integer needItem2, integer needItem3 ) {
	self.say( "#bVoc� deseja fazer #t" + setID + "##k? Hmm... consiga alguns materiais que eu posso fazer. Ou�a com aten��o, os materiais que voc� vai precisar s�o: #r 99 #t" + needItem1 + "#, 99 #t" + needItem2 + "#, 1 #t" + needItem3 + "##k. Os monstros provavelmente v�o deixar cair esses materiais de vez em quando..." );

	inventory = target.inventory;

	if ( inventory.itemCount( needItem1 ) >= 99 and inventory.itemCount( needItem2 ) >= 99 and inventory.itemCount( needItem3 ) >= 1 ) {
		self.say( "Uau, Voc� conseguiu mesmo #r#t" + needItem1 + "#, #t" + needItem2 + "#, #t" + needItem3 + "##k! Bom... voc� trouxe mesmo todos os itens necess�rios. Certo, espere um segundo que j� vou fazer." );
		ret = inventory.exchange( 0, needItem1, -99, needItem2, -99, needItem3, -1, setID, 1 );
		if ( ret == 0 ) self.say( "Tem certeza de que coletou #b#t" + needItem1 + "#, #t" + needItem2 + "#, #t" + needItem3 + "##k? Se sim, verifique se seu invent�rio de etc. est� cheio." );
		else {
			self.say( "Aqui est� #b#t" + setID + "##k! Voc� pode abrir a Sala Omok em qualquer lugar do jogo e se divertir jogando contra outros usu�rios Maple. Se voc� terminar com um recorde admir�vel, algo de bom pode acontecer. Vou ficar torcendo, ent�o v� jogar!" );
			self.say( "Oh, se voc� tiver alguma d�vida sobre o jogo de Omok, sinta-se � vontade para perguntar. Vou ficar aqui por um tempo. Bem, pratique jogando com outros usu�rios at� sentir que pode me derrotar nos minijogos. Mas claro que isso nunca acontecer� hahaha. Certo, estou fora~" );
		}
	}
}

// In relation to the minigames
script "minigame00" {
	field = self.field;
	nField = field.id;

	if ( nField == 100000203 ) v1 = self.askMenu( "Ei, parece que voc� precisa descansar um pouco da ca�ada. Voc� devia estar aproveitando a vida como eu. Bem, se tiver alguns itens, eu posso fazer uma troca com voc� por algum item usado para jogar minijogos. Ent�o... o que posso fazer para voc�?\r\n#b#L0# Crie um item de minijogo#l\r\n#b#L1# Explique mais sobre os minijogos#l" );
	else if ( nField == 220000300 ) v1 = self.askMenu( "Bem, ol�! Eu sou #b#p2040014##k e estou aqui respons�vel por tudo que envolve os minijogos. Parece que voc� tem um certo interesse por minijogos... Com certeza posso ajudar voc�! Certo... ent�o, o que posso fazer por voc�? Crie um item de minijogo#l\r\n#b#L1# Explique mais sobre os minijogos#l" );

	if ( v1 == 0 ) {
		v2 = self.askMenu( "Voc� quer fazer o item do minijogo? Minijogos n�o s�o algo que voc� possa simplesmente sair jogando do nada. Voc� vai precisar de alguns itens espec�ficos para minijogos espec�ficos. Qual item de minijogo voc� gostaria de fazer?\r\n#b#L0#Conjunto Omok#l\r\n#b#L1#A Conjunto de Cartas Combinadas #l" );
		inventory = target.inventory;
		if ( v2 == 0 ) { 
			self.say( "Voc� quer jogar #bOmok#k, hein? Para jogar, voc� precisa do Conjunto Omok. Apenas os que possuem este item podem abrir a sala para o jogo de Omok. Voc� pode jogar em praticamente todos os lugares, a n�o ser em alguns lugares no Mercado." );
			
			if ( nField == 100000203 ) {
				v4 = self.askMenu( "O conjunto tamb�m � diferente, dependendo de que partes voc� queira usar para o jogo. Qual conjunto voc� gostaria de fazer?\r\n#b#L0##t4080000##l\r\n#b#L1##t4080001##l\r\n#b#L2##t4080002##l\r\n#b#L3##t4080003##l\r\n#b#L4##t4080004##l\r\n#b#L5##t4080005##l" );
				if ( v4 == 0 ) makeItem( 4080000, 4030000, 4030001, 4030009 );
				else if ( v4 == 1 ) makeItem( 4080001, 4030000, 4030010, 4030009 );
				else if ( v4 == 2 ) makeItem( 4080002, 4030000, 4030011, 4030009 );
				else if ( v4 == 3 ) makeItem( 4080003, 4030010, 4030001, 4030009 );
				else if ( v4 == 4 ) makeItem( 4080004, 4030011, 4030010, 4030009 );
				else if ( v4 == 5 ) makeItem( 4080005, 4030011, 4030001, 4030009 );
			}
			else {
				v4 = self.askMenu( "O Conjunto Omok tamb�m � diferente dependendo de que rochas voc� queira usar para o jogo. Qual conjunto voc� gostaria de fazer?\r\n#b#L0# #t4080006##l\r\n#b#L1# #t4080007##l\r\n#b#L2# #t4080008##l\r\n#b#L3# #t4080009##l\r\n#b#L4# #t4080010##l\r\n#b#L5# #t4080011##l" );
				if ( v4 == 0 ) makeItem( 4080006, 4030013, 4030014, 4030009 );
				else if ( v4 == 1 ) makeItem( 4080007, 4030013, 4030016, 4030009 );
				else if ( v4 == 2 ) makeItem( 4080008, 4030014, 4030016, 4030009 );
				else if ( v4 == 3 ) makeItem( 4080009, 4030015, 4030013, 4030009 );
				else if ( v4 == 4 ) makeItem( 4080010, 4030015, 4030014, 4030009 );
				else if ( v4 == 5 ) makeItem( 4080011, 4030015, 4030016, 4030009 );
			}
		}
		else if ( v2 == 1 ) {
			self.say( "Voc� quer #b#t4080100##k? Hmmm... para fazer #t4080100#, voc� vai precisar de alguns #b#t4030012#s#k. #t4030012# pode ser obtido derrotando os monstros pela ilha. Colete 99 #t4030012#s e voc� vai poder fazer um conjunto de #t4080100#." ); 
			if ( inventory.itemCount( 4030012 ) >= 99 ) {
				self.say( "Uau, voc� conseguiu mesmo #r99 #t4030012#s#k!! �timo... Certo, isto vai ser divertido. Espere um segundo~ Eu vou fazer #r#t4080100##k rapidamente." );
				ret = inventory.exchange( 0, 4030012, -99, 4080100, 1 );
				if ( ret == 0 ) self.say( "Tem certeza de que coletou #r99 #t4030012#s#k? Se sim, verifique se seu invent�rio de etc. est� cheio." );
				else {
					self.say( "Aqui est�, #b#t4080100##k! O \"Match Cards\"Sala pode ser jogada quase em todos os lugares do jogo. Abra uma sala aqui e jogue com muitos outros usu�rios. Se voc� terminar com um recorde brilhante, algo de bom pode acontecer. Vou ficar torcendo, ent�o v� jogar!" );
					self.say( "Oh, se voc� tiver alguma d�vida sobre o jogo de Cartas Combinadas, sinta-se � vontade para perguntar. Vou ficar aqui por um tempo. Bem, pratique jogando com outros usu�rios at� sentir que pode me derrotar nos minijogos. Mas claro que isso nunca acontecer�, haha... Certo, estou fora~" );
				}
			}
		}
	}
	else if ( v1 == 1 ) {
		v3 = self.askMenu( "Voc� quer aprender mais sobre os minijogos? Demais! Pergunte o que quiser. Sobre qual minijogo voc� quer saber mais?\r\n#b#L0#Omok#l\r\n#b#L1#Cartas Combinadas#" );
		if ( v3 == 0 ) {
			self.say( "Estas s�o as regras do jogo de Omok. Ou�a com aten��o. Omok � um jogo em que voc� e seu oponente v�o, um de cada vez, colocar uma pe�a no tabuleiro at� algu�m encontrar uma maneira de colocar 5 pe�as em uma linha horizontal, diagonal ou vertical. Quem conseguir ser� o vencedor. Para iniciantes, apenas aqueles com o #bConjunto Omok#k podem abrir uma sala de jogo." );
			self.say( "Cada jogo de Omok vai custar #r100 mesos#k. Mesmo se voc� n�o tiver o #bConjunto Omok#k, pode entrar na sala e jogar. Mas se voc� n�o tiver 100 mesos, n�o poder� entrar na sala e ponto final. A pessoa que abrir a sala tamb�m precisar� ter 100 mesos para isto ou n�o tem jogo. Se voc� ficar sem mesos durante o jogo, voc� ser� automaticamente #Gexpulso:expulsa# da sala!" );
			self.say( "Entre na sala e, quando estiver #Gpronto:pronta# para jogar, clique em #bPronto#k. Quando o visitante clicar em #bPronto#k,o dono da sala pode apertar #bIniciar#k para come�ar o jogo. Se voc� receber algum visitante n�o desejado, o dono da sala tem o direito de expuls�-lo. Existe um quadrado com um x escrito � direita da pessoa. Clique nele para um simples adeus, ok?" );
			self.say( "Quando come�ar o jogo, #bo dono da sala joga primeiro#k. Lembre-se de que voc� ter� um tempo limite e poder� perder sua vez se n�o jogar a tempo. Geralmente 3x3 n�o � permitido, mas, se chegar a um ponto em que seja absolutamente necess�rio colocar sua pe�a l� ou perder, voc� pode. 3 x3 � permitido como �ltima linha de defesa! Ah e #r6 ou 7 direto#k n�o conta. Apenas 5!" );
			self.say( "Se voc� se encontrar contra a parede, pode pedir uma #bRepetir#k. Se o oponente aceitar o pedido, ent�o as �ltimas jogadas sua e dele ser�o canceladas. Se voc� sentir que precisa ir ao banheiro ou parar por mais tempo, voc� pode pedir um #bempate#k. O jogo vai terminar empatado se o oponente aceitar o pedido. Essa pode ser uma boa maneira de manter intacta a amizade." );
			self.say( "Quando o jogo terminar, um novo come�ar�, o perdedor joga primeiro. Ah, e voc� n�o pode sair no meio do jogo. Se fizer isto, voc� precisa pedir uma #bderrota ou um empate#k. Claro que, se voc� pedir derrota, voc� perder� o jogo. Por isso, tenha cuidado. E se voc� clicar em \"Leave\"durante a partida e pedir para sair do jogo, voc� vai sair assim que o jogo terminar. Por isso, essa � uma maneira bem mais �til para sair." );
		}
		else if ( v3 == 1 ) {
			self.say( "Estas s�o as regras do jogo de Cartas Combinadas. Ou�a com aten��o. O jogo de Cartas Combinadas � exatamente como diz o nome: encontre um par entre as cartas colocadas na mesa. Quando todos os pares combinados forem encontrados, a pessoa com o maior n�mero de pares ganha o jogo. Igual a Omok, voc� precisa de #b#t4080100##k para abrir a sala de jogo." );
			self.say( "Cada jogo de Cartas Combinadas vai custar #r100 mesos#k. Mesmo se n�o tiver #b#t4080100##k, voc� pode entrar na sala e jogar. Mas, se voc� n�o tiver 100 mesos, n�o poder� entrar na sala e ponto final. A pessoa que abrir a sala tamb�m precisar� ter 100 mesos para isso ou n�o tem jogo. Se ficar sem mesos durante o jogo, voc� ser� automaticamente #Gexpulso:expulsa# da sala!" );
			self.say( "Entre na sala e, quando estiver #Gpronto:pronta# para jogar, clique em #bPronto#k. Quando o visitante clicar em #bPronto#k, o dono da sala pode apertar #bIniciar#k para come�ar o jogo. Se voc� receber algum visitante n�o desejado, o dono da sala tem o direito de expuls�-lo. Existe um quadrado com um x escrito � direita da pessoa. Clique nele para um simples adeus, ok?" );
			self.say( "Ah, e, diferente de Omok, no Cartas Combinadas, quando voc� cria uma sala de jogo, precisa acertar o n�mero de caras que vai usar no jogo. Existem 3 modos dispon�veis, 3x4, 4x5 e 5x6, que v�o exigir 12, 20 e 30 cartas respectivamente. Lembre-se de que voc� n�o pode trocar uma vez que a sala esteja aberta. Por isto, se realmente desejar trocar, voc� precisa fechar a sala e abrir uma nova." );
			self.say( "Quando come�ar o jogo, #bo dono da sala joga primeiro#k. Lembre-se de que voc� ter� um tempo limite e poder� perder seu turno se n�o jogar a tempo. Quando encontrar um par combinando na sua vez, voc� joga de novo, enquanto continuar encontrando as cartas combinadas. Use sua mem�ria para um combo devastador de turnos." );
			self.say( "Se voc� e seu oponente tiverem o mesmo n�mero de cartas combinadas, aquele que possuir um intervalo maior ser� o vencedor. Se voc� sentir que precisa ir ao banheiro ou parar por mais tempo, voc� pode pedir um #bempate#k. O jogo vai terminar empatado se o oponente aceitar o pedido. Essa pode ser uma boa maneira de manter intacta a amizade." );
			self.say( "Quando o jogo terminar, um novo come�ar�, o perdedor joga primeiro. Ah, e voc� n�o pode sair no meio do jogo. Se fizer isso, voc� precisa pedir uma #bderrota ou um empate#k. Claro que, se voc� pedir derrota, voc� perder� o jogo. Por isso, tenha cuidado. E, se voc� clicar em \"Leave\"durante a partida e pedir para sair do jogo, voc� vai sair assim que o jogo terminar. Por isso, essa � uma maneira bem mais �til de sair." );
		}
	}
}
