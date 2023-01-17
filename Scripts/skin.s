module "standard.s";

// Henesys Skin-care
script "skin_henesys1" {
	self.say( "Bem, ol�! #GBem-vindo:Bem-vinda# � Cl�nica de Henesys! Voc� gostaria de ter uma pele firme e de apar�ncia saud�vel como a minha? Com #b#t5153000##k, voc� pode deixar a gente cuidar de tudo e ter a pele que sempre desejou~!" );

	mHair = self.askAvatar( "Com nossa m�quina especializada, voc� pode ver antecipadamente como ficar� depois do tratamento. Qual tipo de tratamento de pele voc� gostaria de fazer? Escolha o estilo da sua prefer�ncia...", 5153000, 0, 1, 2, 3, 4 );
	
	if ( mHair == 1 ) self.say( "Aqui est� o espelho, pode olhar!  O que voc� acha? Sua pele n�o est� linda e resplandecente como a minha? Hehehehe~ Tenho certeza de que voc� est� gostando. Volte outras vezes~" );
	else if ( mHair == -1 ) self.say( "Hum... voc� n�o tem o cupom de tratamento de pele que precisa para receber o tratamento. Desculpe, mas n�o podemos fazer." );
	else if ( mHair == -3 ) self.say( "Me desculpe. Parece que nossa m�quina de tratamento de pele n�o est� funcionando no momento. Por favor, volte mais tarde." );
	else if ( mHair == 0 or mHair == -2 ) self.say( "Desculpe, parece haver um problema com o procedimento. Por favor, volte mais tarde." );
}

// Orbis Skin-care
script "skin_orbis1" {
	self.say( "Bem, ol�! #GBem-vindo:Bem-vinda# � Cl�nica de Orbis~! Voc� gostaria de ter uma pele firme e de apar�ncia saud�vel como a minha? Com #b#t5153001##k, voc� pode deixar a gente cuidar de tudo e ter a pele que sempre desejou~!" );

	mHair = self.askAvatar( "Com nossa m�quina especializada, voc� pode ver antecipadamente como ficar� depois do tratamento. Qual tipo de tratamento de pele voc� gostaria de fazer? Escolha o estilo da sua prefer�ncia...", 5153001, 0, 1, 2, 3, 4 );
	
	if ( mHair == 1 ) self.say( "Legal, comprove o resultado! O que voc� acha? Ficou do jeito que voc� queria? Acredito que ficou realmente como voc� queria. Volte outras vezes~" );
	else if ( mHair == -1 ) self.say( "Parece que voc� n�o tem o cupom que precisa para receber o tratamento. Sinto muito, mas parece que n�o poderemos fazer." );
	else if ( mHair == -3 ) self.say( "Parece que nossa m�quina de tratamento de pele n�o est� funcionando no momento. Por favor, volte daqui a pouquinho." );
	else if ( mHair == 0 or mHair == -2 ) self.say( "Desculpe, houve um leve erro com o procedimento. Por favor, volte daqui a pouquinho." );
}

// Ludibrium Skin-care
script "skin_ludi1" {
	self.say( "Ah, oi! #GBem-vindo:Bem-vinda# � Cl�nica de Ludibrium! Interessado em ficar bronzeado e com apar�ncia sexy? Que tal uma pele linda e branquinha? Com #b#t5153002##k, voc� pode deixar a gente cuidar de tudo e ter a pele com a qual sempre sonhou~!" );

	mHair = self.askAvatar( "Com nossa m�quina especializada, voc� pode ver, ANTES do procedimento, como ficar� depois do tratamento. Que tipo de apar�ncia voc� deseja? V� em frente e escolha o estilo de sua prefer�ncia~", 5153002, 0, 1, 2, 3, 4 );
	
	if ( mHair == 1 ) self.say( "Certo, v� se olhar no espelho! O que voc� acha? Gosta do que v�? Tenho certeza de que saiu como voc� queria. Volte outras vezes~" );
	else if ( mHair == -1 ) self.say( "Humm... Acho que voc� n�o tem nosso cupom de tratamento de pele no momento. Sem o cupom, desculpe, n�o poderei fazer." );
	else if ( mHair == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de tratamento de pele n�o est� funcionando no momento. Por favor, volte mais tarde. Me desculpe, de verdade!" );
	else if ( mHair == 0 or mHair == -2 ) self.say( "Desculpe, parece haver um problema com o procedimento. Por favor, veja comigo mais tarde." );
}

// NLC Skin-care
script "NLC_Skin" {
	self.say( "Bem, oi! #GBem-vindo:Bem-vinda# � Cl�nica de CFN! Voc� gostaria de ter uma pele firme e de apar�ncia saud�vel como a minha? Com #b#t5153009##k, voc� pode deixar a gente cuidar de tudo e ter a pele que sempre desejou~!" );

	mHair = self.askAvatar( "Com nossa m�quina especializada, voc� pode ver antecipadamente como ficar� depois do tratamento. Qual tipo de tratamento de pele voc� gostaria de fazer? Escolha o estilo da sua prefer�ncia...", 5153009, 0, 1, 2, 3, 4 );
	
	if ( mHair == 1 ) self.say( "Aqui est� o espelho, pode olhar!  O que voc� acha? Sua pele n�o est� linda e resplandecente como a minha? Hehehehe~ Tenho certeza de que voc� est� gostando. Volte outras vezes~" );
	else if ( mHair == -1 ) self.say( "Hum... voc� n�o tem o cupom de tratamento de pele que precisa para receber o tratamento. Desculpe, mas n�o podemos fazer." );
	else if ( mHair == -3 ) self.say( "Me desculpe. Parece que nossa m�quina de tratamento de pele n�o est� funcionando no momento. Por favor, volte mais tarde." );
	else if ( mHair == 0 or mHair == -2 ) self.say( "Desculpe, parece haver um problema com o procedimento. Por favor, volte mais tarde." );
}


//���� �Ǻΰ��� ��
script "skin_mureung1" {
	self.say( "Bem, oi! #GBem-vindo:Bem-vinda# � Cl�nica de Mu Lung! Voc� gostaria de ter uma pele firme e de apar�ncia saud�vel como a minha? Com #b#t5153006##k, voc� pode deixar a gente cuidar de tudo e ter a pele que sempre desejou~!" );

	mHair = self.askAvatar( "Com nossa m�quina especializada, voc� pode ver antecipadamente como ficar� depois do tratamento. Qual tipo de tratamento de pele voc� gostaria de fazer? Escolha o estilo da sua prefer�ncia...", 5153006, 0, 1, 2, 3, 4 );
	
	if ( mHair == 1 ) self.say( "Aqui est� o espelho, pode olhar!  O que voc� acha? Sua pele n�o est� linda e resplandecente como a minha? Hehehehe~ Tenho certeza de que voc� est� gostando. Volte outras vezes~" );
	else if ( mHair == -1 ) self.say( "Hum... voc� n�o tem o cupom de tratamento de pele que precisa para receber o tratamento. Desculpe, mas n�o podemos fazer." );
	else if ( mHair == -3 ) self.say( "Me desculpe. Parece que nossa m�quina de tratamento de pele n�o est� funcionando no momento. Por favor, volte mais tarde." );
	else if ( mHair == 0 or mHair == -2 ) self.say( "Desculpe, parece haver um problema com o procedimento. Por favor, volte mais tarde." );
}
