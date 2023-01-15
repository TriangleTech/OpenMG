module "standard.s";

// Henesys VIP plastic surgery
script "face_henesys1" {
  teye = ( target.nFace / 100 ) % 10 * 100;
	if ( target.nGender == 0 ) 
	{
	  changeFace1 = 20000 + teye;
	  changeFace2 = 20001 + teye;
	  changeFace3 = 20002 + teye;
	  changeFace4 = 20003 + teye;
	  changeFace5 = 20004 + teye;
	  changeFace6 = 20005 + teye;
	  changeFace7 = 20006 + teye;
	  changeFace8 = 20007 + teye;
 	  changeFace9 = 20008 + teye;
    	  changeFace10 = 20012 + teye;
    	  changeFace11 = 20014 + teye;
	  mFace = self.askAvatar( "Vamos ver... Posso transformar sua cara em algo totalmente novo. Voc� n�o quer tentar? Por #b#t5152001##k, pode ganhar uma cara do seu gosto. Escolha com calma um rosto de sua prefer�ncia...", 5152001, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
	}
	else if ( target.nGender == 1 ) 
	{
	  changeFace1 = 21000 + teye;
	  changeFace2 = 21001 + teye;
	  changeFace3 = 21002 + teye;
	  changeFace4 = 21003 + teye;
	  changeFace5 = 21004 + teye;
	  changeFace6 = 21005 + teye;
	  changeFace7 = 21006 + teye;
	  changeFace8 = 21007 + teye;
    	  changeFace9 = 21008 + teye;
	  changeFace10 = 21012 + teye;
	  changeFace11 = 21014 + teye;
	  mFace = self.askAvatar( "Vamos ver... Posso transformar sua cara em algo totalmente novo. Voc� n�o quer tentar? Por #b#t5152001##k, pode ganhar uma cara do seu gosto. Escolha com calma um rosto de sua prefer�ncia...", 5152001, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
	}
	
	if ( mFace == 1 ) self.say( "Certo, o procedimento acabou. Olhe, aqui tem um espelho. O que voc� acha? At� eu admito que isso � uma obra-de-arte... haha, bem, me liga quando enjoar desse novo visual, t�?" );
	else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico para este lugar... Desculpe dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
	else if ( mFace == -3 ) self.say( "Hum... Parece que temos um problema aqui no hospital, e sinto que n�o posso continuar o procedimento imediatamente. Por favor, volte depois." );
	else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, volte depois." );
}

// Henesys regular plastic surgery
script "face_henesys2" {
	nRet = self.askYesNo( "Se usar o cupom comum, seu rosto pode se transformar em qualquer um... Ainda quer fazer isso usando #b#t5152000##k?" );
	if ( nRet == 0 ) self.say( "Percebo... Pense um pouco e veja se � realmente isso que quer. Quando decidir, me avise." );
	else if ( nRet == 1 ) {
    teye = ( target.nFace / 100 ) % 10 * 100;
		if ( target.nGender == 0 ) 
		{
  	  changeFace1 = 20000 + teye;
  	  changeFace2 = 20001 + teye;
  	  changeFace3 = 20002 + teye;
  	  changeFace4 = 20003 + teye;
  	  changeFace5 = 20004 + teye;
  	  changeFace6 = 20005 + teye;
  	  changeFace7 = 20006 + teye;
  	  changeFace8 = 20007 + teye;
	  changeFace9 = 20008 + teye;
	  changeFace10 = 20012 + teye;
	  changeFace11 = 20014 + teye;
		  mFace = self.makeRandAvatar( 5152000, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
		}
		else if ( target.nGender == 1 ) 
		{
  	  changeFace1 = 21000 + teye;
  	  changeFace2 = 21001 + teye;
  	  changeFace3 = 21002 + teye;
  	  changeFace4 = 21003 + teye;
  	  changeFace5 = 21004 + teye;
  	  changeFace6 = 21005 + teye;
  	  changeFace7 = 21006 + teye;
  	  changeFace8 = 21007 + teye;
	  changeFace9 = 21008 + teye;
	  changeFace10 = 21012 + teye;
	  changeFace11 = 21014 + teye;
		  mFace = self.makeRandAvatar( 5152000, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
		}

		if ( mFace == 1 ) self.say( "Ok, a cirurgia acabou. Veja voc� mesmo. Aqui tem um espelho... O que acha? Eu acho que isso � uma obra-de-arte... hahahaha, por favor, volte quando enjoar desse novo visual, t�?" );
		else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico deste lugar. Desculpa dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
		else if ( mFace == -3 ) self.say( "Desculpe, mas h� um problema aqui no hospital e temo que tenha que parar a cirurgia imediatamente. Por favor, volte depois." );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, volte depois." );
	}
}

// Orbis VIP plastic surgery
script "face_orbis1" {
  teye = ( target.nFace / 100 ) % 10 * 100;
	if ( target.nGender == 0 ) 
	{
	  changeFace1 = 20000 + teye;
	  changeFace2 = 20001 + teye;
	  changeFace3 = 20002 + teye;
	  changeFace4 = 20003 + teye;
	  changeFace5 = 20004 + teye;
	  changeFace6 = 20005 + teye;
	  changeFace7 = 20006 + teye;
	  changeFace8 = 20007 + teye;
    	  changeFace9 = 20008 + teye;
	  changeFace10 = 20012 + teye;
	  changeFace11 = 20014 + teye;
    mFace = self.askAvatar( "Bem, bem, bem, #Gbem-vindo:bem-vinda#!! Eu posso transformar seu rosto numa coisa totalmente nova... Que tal nos dar uma chance? Por #b#t5152005##k, pode ter um rosto do seu gosto... Leve o tempo que precisar para escolher um da sua prefer�ncia...", 5152005, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
  }
	else if ( target.nGender == 1 )	{
	  changeFace1 = 21000 + teye;
	  changeFace2 = 21001 + teye;
	  changeFace3 = 21002 + teye;
	  changeFace4 = 21003 + teye;
	  changeFace5 = 21004 + teye;
	  changeFace6 = 21005 + teye;
	  changeFace7 = 21006 + teye;
	  changeFace8 = 21007 + teye;
    	  changeFace9 = 21008 + teye;
    	  changeFace10 = 21012 + teye;
    	  changeFace11 = 21014 + teye;
	  mFace = self.askAvatar( "Bem, bem, bem, #Gbem-vindo:bem-vinda#!! Eu posso transformar seu rosto numa coisa totalmente nova... Que tal nos dar uma chance? Por #b#t5152005##k, pode ter um rosto do seu gosto... Leve o tempo que precisar para escolher um da sua prefer�ncia...", 5152005, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
	}
	
	if ( mFace == 1 ) self.say( "�timo, o procedimento terminou... Aqui est� um espelho para voc� ver... Ent�o? O que voc� acha? Eu certamente posso dizer que isso � uma obra-de-arte... Hahaha, bem, volte quando se cansar deste novo visual, t�?" );
	else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico para este lugar... Desculpe dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
	else if ( mFace == -3 ) self.say( "Hum... Parece que temos um problema aqui no hospital e sinto que n�o posso continuar o procedimento imediatamente. Por favor, volte depois." );
	else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, volte depois." );
}

// Orbis regular plastic surgery
script "face_orbis2" {
	nRet = self.askYesNo( "Se usar o cupom comum, seu rosto pode se transformar em qualquer um... Ainda quer fazer isso usando #b#t5152004##k?" );
	if ( nRet == 0 ) self.say( "Percebo... Pense um pouco e veja se � realmente isso que quer. Quando decidir, me avise.");
	else if ( nRet == 1 ) {
    teye = ( target.nFace / 100 ) % 10 * 100;
		if ( target.nGender == 0 ) 
		{
  	  changeFace1 = 20000 + teye;
  	  changeFace2 = 20001 + teye;
  	  changeFace3 = 20002 + teye;
  	  changeFace4 = 20003 + teye;
  	  changeFace5 = 20004 + teye;
  	  changeFace6 = 20005 + teye;
  	  changeFace7 = 20006 + teye;
  	  changeFace8 = 20007 + teye;
      	  changeFace9 = 20008 + teye;
	  changeFace10 = 20012 + teye;
	  changeFace11 = 20014 + teye;
		  mFace = self.makeRandAvatar( 5152004, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
		}
		else if ( target.nGender == 1 ) 
		{
  	  changeFace1 = 21000 + teye;
  	  changeFace2 = 21001 + teye;
  	  changeFace3 = 21002 + teye;
  	  changeFace4 = 21003 + teye;
  	  changeFace5 = 21004 + teye;
  	  changeFace6 = 21005 + teye;
  	  changeFace7 = 21006 + teye;
  	  changeFace8 = 21007 + teye;
	  changeFace9 = 21008 + teye;
	  changeFace10 = 21012 + teye;
	  changeFace11 = 21014 + teye;
		  mFace = self.makeRandAvatar( 5152004, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
		}

		if ( mFace == 1 ) self.say( "Agora que o procedimento acabou... D� uma olhada, aqui est� um espelho... O que voc� acha? At� eu admito que isso � uma obra-de-arte... haha, bem, me liga quando enjoar desse novo visual, t�?" );
		else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico para este lugar... Desculpe-me dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
		else if ( mFace == -3 ) self.say( "Hum... Parece que temos um problema aqui no hospital e sinto que n�o posso continuar o procedimento imediatamente. Por favor, volte depois." );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, volte depois." );
	}
}

// Ludibrium VIP plastic surgery
script "face_ludi1" {
  teye = ( target.nFace / 100 ) % 10 * 100;
	if ( target.nGender == 0 ) 
	{
	  changeFace1 = 20000 + teye;
	  changeFace2 = 20001 + teye;
	  changeFace3 = 20002 + teye;
	  changeFace4 = 20003 + teye;
	  changeFace5 = 20004 + teye;
	  changeFace6 = 20005 + teye;
	  changeFace7 = 20006 + teye;
	  changeFace8 = 20007 + teye;
  	  changeFace9 = 20008 + teye;
  	  changeFace10 = 20012 + teye;
	  changeFace11 = 20014 + teye;
    mFace = self.askAvatar( "Vamos ver... Posso transformar sua cara em algo totalmente novo. Voc� n�o quer tentar? Por #b#t5152007##k, pode ganhar uma cara do seu gosto. Escolha com calma um rosto de sua prefer�ncia...", 5152007, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
  }
	else if ( target.nGender == 1 )	{
	  changeFace1 = 21000 + teye;
	  changeFace2 = 21001 + teye;
	  changeFace3 = 21002 + teye;
	  changeFace4 = 21003 + teye;
	  changeFace5 = 21004 + teye;
	  changeFace6 = 21005 + teye;
	  changeFace7 = 21006 + teye;
	  changeFace8 = 21007 + teye;
	  changeFace9 = 21008 + teye;
	  changeFace10 = 21012 + teye;
	  changeFace11 = 21014 + teye;
	  mFace = self.askAvatar( "Vamos ver... Posso transformar sua cara em algo totalmente novo. Voc� n�o quer tentar? Por #b#t5152007##k, pode ganhar uma cara do seu gosto. Escolha com calma um rosto de sua prefer�ncia...", 5152007, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
	}
	
	if ( mFace == 1 ) self.say( "Certo, o procedimento acabou. Olhe, aqui tem um espelho. O que voc� acha? At� eu admito que isso � uma obra-de-arte... haha, bem, me liga quando enjoar desse novo visual, t�?" );
	else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico para este lugar... Desculpe-me dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
	else if ( mFace == -3 ) self.say( "Hum... Parece que temos um problema aqui no hospital e sinto que n�o posso continuar o procedimento imediatamente. Por favor, volte depois." );
	else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, volte depois." );
}

// Ludibrium regular plastic surgery
script "face_ludi2" {
	nRet = self.askYesNo( "Se usar o cupom comum, seu rosto pode se transformar em qualquer um... Ainda quer fazer isso usando #b#t5152006##k?" );
	if ( nRet == 0 ) self.say( "Eu entendo. Pense um pouco e, se ainda quiser isso, me avise, certo?");
	else if ( nRet == 1 ) {
    teye = ( target.nFace / 100 ) % 10 * 100;
		if ( target.nGender == 0 ) 
		{
  	  changeFace1 = 20000 + teye;
  	  changeFace2 = 20001 + teye;
  	  changeFace3 = 20002 + teye;
  	  changeFace4 = 20003 + teye;
  	  changeFace5 = 20004 + teye;
  	  changeFace6 = 20005 + teye;
  	  changeFace7 = 20006 + teye;
  	  changeFace8 = 20007 + teye;
      	  changeFace9 = 20008 + teye;
      	  changeFace10 = 20012 + teye;
	  changeFace11 = 20014 + teye;
		  mFace = self.makeRandAvatar( 5152006, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
		}
		else if ( target.nGender == 1 ) 
		{
  	  changeFace1 = 21000 + teye;
  	  changeFace2 = 21001 + teye;
  	  changeFace3 = 21002 + teye;
  	  changeFace4 = 21003 + teye;
  	  changeFace5 = 21004 + teye;
  	  changeFace6 = 21005 + teye;
  	  changeFace7 = 21006 + teye;
  	  changeFace8 = 21007 + teye;
	  changeFace9 = 21008 + teye;
	  changeFace10 = 21012 + teye;
	  changeFace11 = 21014 + teye;
		  mFace = self.makeRandAvatar( 5152006, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
		}


		if ( mFace == 1 ) self.say( "Agora que o procedimento acabou... D� uma olhada, aqui est� um espelho... O que voc� acha? At� eu admito que isso � uma obra-de-arte... haha, bem, me liga quando enjoar desse novo visual, t�?" );
		else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico para este lugar... Desculpe dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
		else if ( mFace == -3 ) self.say( "Desculpe pela inconveni�ncia, mas parece que temos um problema aqui no hospital e sinto que n�o posso continuar o procedimento imediatamente. Por favor, volte depois." );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Sinto muito, mas parece haver um problema com o procedimento aqui. Por favor, volte depois." );
	}
}
//****** Wedding : Plastic Surgery - Dr. 90212 - VIP			18
script "face_wedding1" {
 
		teye = ( target.nFace / 100 ) % 10 * 100;

		if ( target.nGender == 0 ) 	{

			  changeFace1 = 20018 + teye;
			  changeFace2 = 20019 + teye;

			  changeFace3 = 20000 + teye;
			  changeFace4 = 20001 + teye;
			  changeFace5 = 20003 + teye;
			  changeFace6 = 20004 + teye;
			  changeFace7 = 20005 + teye;
			  changeFace8 = 20006 + teye;
			  changeFace9 = 20007 + teye;  
			  changeFace10 = 20008 + teye;  

			  mFace = self.askAvatar( "Tudo pronto para parecer-se com um milh�o de mesos? Por #b#t5152022##k, posso garantir que vai parecer uma nova pessoa quando eu terminar!", 5152022, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10);
		}
		else if ( target.nGender == 1 ) {

			  changeFace1 = 21018 + teye;
			  changeFace2 = 21019 + teye;

			  changeFace3 = 21001 + teye;
			  changeFace4 = 21002 + teye;
			  changeFace5 = 21003 + teye;
			  changeFace6 = 21004 + teye;
			  changeFace7 = 21005 + teye;
			  changeFace8 = 21006 + teye;
			  changeFace9 = 21007 + teye;
			  changeFace10 = 21012 + teye;
	
			 mFace = self.askAvatar( "Tudo pronto para parecer-se com um milh�o de mesos? Por #b#t5152022##k, posso garantir que vai parecer uma nova pessoa quando eu terminar!", 5152022, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10);
		}
	
		if ( mFace == 1 ) self.say( "Sua cara nova � um verdadeiro trabalho de arte... Que bom que veio ao melhor! Volte sempre que quiser um novo visual!" );
		else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico para este lugar... Desculpe-me dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
		else if ( mFace == -3 ) self.say( "Hum... Parece que temos um problema aqui no hospital e sinto que n�o posso continuar o procedimento imediatamente. Por favor, volte depois." );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, volte depois." );

}


//****** Wedding : Script: Plastic Surgery - Intern Shakihands - REG	19
script "face_wedding2" {

		nRet = self.askYesNo( "Eu posso te dar um toque excelente, usando #b#t5152021##k que far� seu #Gcompanheiro:companheira# sorrir." );

		if ( nRet == 0 ) self.say( "Percebo... Pense um pouco e veja se � realmente isso que quer. Quando decidir, me avise." );
		else if ( nRet == 1 ) {
			teye = ( target.nFace / 100 ) % 10 * 100;
			if ( target.nGender == 0 ) 	{
			  changeFace1 = 20018 + teye;
			  changeFace2 = 20019 + teye;

			  changeFace3 = 20000 + teye;
			  changeFace4 = 20001 + teye;
			  changeFace5 = 20003 + teye;
			  changeFace6 = 20004 + teye;
			  changeFace7 = 20005 + teye;
			  changeFace8 = 20006 + teye;
			  changeFace9 = 20007 + teye;  
			  changeFace10 = 20008 + teye;  

		  mFace = self.makeRandAvatar( 5152021, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10 );
		}
		else if ( target.nGender == 1 ) {
			  changeFace1 = 21018 + teye;
			  changeFace2 = 21019 + teye;

			  changeFace3 = 21001 + teye;
			  changeFace4 = 21002 + teye;
			  changeFace5 = 21003 + teye;
			  changeFace6 = 21004 + teye;
			  changeFace7 = 21005 + teye;
			  changeFace8 = 21006 + teye;
			  changeFace9 = 21007 + teye;
			  changeFace10 = 21012 + teye;

		  mFace = self.makeRandAvatar( 5152021, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10 );
		}

		if ( mFace == 1 ) self.say( "Agora, n�o estava t�o mau... Eu diria que seu rosto novo est� muito bom! Volte sempre que quiser um novo visual excitante!" );
		else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico para este lugar... Desculpe-me dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
		else if ( mFace == -3 ) self.say( "Desculpe, mas h� um problema aqui no hospital e temo que tenha que parar a cirurgia imediatamente. Por favor, volte depois." );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, volte depois." );
	}
}

script "lens_henesys1"
{
  nRet = self.askMenu( "Oi, voc� a�! Sou Dr. Lenu, respons�vel pelas lentes cosm�ticas aqui na Loja de Cirurgia Pl�stica Henesys! Com #b#t5152010##k ou #b#t5152013##k, voc� pode nos deixar tomar conta do resto e ter o lindo olhar que sempre quis! Lembre-se de que a primeira coisa que todos notam em voc� s�o os olhos, e n�s o ajudaremos a encontrar as lentes de contato que fiquem melhor em voc�! Agora, o que voc� gostaria de usar?\r\n#b#L0# Cupom de Lentes de Contato em Henesys#l\r\n#L1# Cupom de Lentes de Contato VIP em Henesys#l" ); 
  if ( nRet == 0 )
  {
    nRet1 = self.askYesNo( "Se usar o cupom comum, voc� ser� recompensado com um par de lentes. Vai usar #b#t5152010##k e realmente fazer a diferen�a dos seus olhos?" );
    if ( nRet1 == 0 ) self.say( "Entendo. Isso � compreens�vel, desde que n�o tenha certeza se quer ter as lentes de contato do seu gosto. De qualquer modo, n�o estamos na correria, ent�o pense um pouco!  Me avise quando decidir fazer a mudan�a!" );
    else if ( nRet1 == 1 ) 
    {
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
      changeEye1 = tface;
      changeEye2 = tface + 100;
      changeEye3 = tface + 400;
      changeEye4 = tface + 500;
      changeEye5 = tface + 600;
      changeEye6 = tface + 700;

			mFace = self.makeRandAvatar( 5152010, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6 );

			if ( mFace == 1 ) self.say( "Ta-da! �, saca o visual!! O que voc� acha? Eu realmente acho que seus olhos est�o fant�sticos agora! Por favor, volte novamente." );
			else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
			else if ( mFace == -3 ) self.say( "Desculpe-me, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
			else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
    }
  } else if ( nRet == 1 )
  {
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
      changeEye1 = tface;
      changeEye2 = tface + 100;
      changeEye3 = tface + 400;
      changeEye4 = tface + 500;
      changeEye5 = tface + 600;
      changeEye6 = tface + 700;

  	  mFace = self.askAvatar( "Com nossa m�quina especial, voc� pode ver antes como ficar� depois do tratamento. Que tipo de lentes gostaria de usar? Escolha o estilo de acordo com seu gosto...", 5152013, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6 );

			if ( mFace == 1 ) self.say( "Ta-da! �, saca o visual!! O que voc� acha? Eu realmente acho que seus olhos est�o fant�sticos agora! Por favor, volte novamente." );
			else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
			else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
			else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
  }
}

script "lens_orbis1"
{
  nRet = self.askMenu( "Ol�, sou o Dr. Rhome, o cabe�a do departamento de lentes de contato aqui na Loja de Cirurgia Pl�stica de Orbis. Minha meta aqui � dar personalidade para os olhos de todos por meio das maravilhas das lentes cosm�ticas e, com #b#t5152011##k ou #b#t5150104##k, tamb�m posso fazer o mesmo por voc�! Agora, o que voc� gostaria de usar?\r\n#b#L0# Cupom de Lentes de Contato em Orbis#l\r\n#L1# Cupom de Lentes de Contato VIP em Orbis#l" );
  if ( nRet == 0 )
  {
    nRet1 = self.askYesNo( "Saiba que, usando o cupom normal, ganhar� um par aleat�rio de lentes de contato. Vai usar #b#t5152011##k e realmente fazer a diferen�a dos seus olhos?" );
    if ( nRet1 == 0 ) self.say( "Entendo sua d�vida. Tem bastante tempo para pensar sobre o assunto. Fale comigo quando decidir fazer a mudan�a!" );
    else if ( nRet1 == 1 ) 
    {
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
      changeEye1 = tface;
      changeEye2 = tface + 100;
      changeEye3 = tface + 200;
      changeEye4 = tface + 400;
      changeEye5 = tface + 600;
      changeEye6 = tface + 700;

			mFace = self.makeRandAvatar( 5152011, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6 );

			if ( mFace == 1 ) self.say( "Certo, olhe-se no espelho! O que voc� acha? As lentes ca�ram como uma luva em voc�! Parecem t�o naturais em voc�! Espero v�-lo novamente!" );
			else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
			else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
			else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
    }
  } else if ( nRet == 1 )
  {
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
      changeEye1 = tface;
      changeEye2 = tface + 100;
      changeEye3 = tface + 200;
      changeEye4 = tface + 400;
      changeEye5 = tface + 600;
      changeEye6 = tface + 700;

  	  mFace = self.askAvatar( "Com nossa m�quina especial, voc� pode ver antes como ficar� depois do tratamento. Que tipo de lentes gostaria de usar? Escolha o estilo de acordo com seu gosto...", 5152014, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6 );

			if ( mFace == 1 ) self.say( "Certo, olhe-se no espelho! O que voc� acha? As lentes ca�ram como uma luva em voc�! Parecem t�o naturais em voc�! Espero v�-lo novamente!" );
			else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
			else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
			else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
  }
}

script "lens_ludi1"
{
  nRet = self.askMenu( "Hum... Oi, sou o Dr. Bosch e sou o especialista em lentes aqui na Loja de Cirurgia Pl�stica de Ludibrium. Acredito que seus olhos s�o as coisas mais importantes em seu corpo e, com #b#t5152012##k ou #b#t5152015##k, posso prescrerver as lentes certas para voc�. Agora, o que voc� gostaria de usar?\r\n#b#L0# Cupom de Lentes de Contato em Ludibrium#l\r\n#L1# Cupom de Lentes de Contato VIP em Ludibrium#l" );
  if ( nRet == 0 )
  {
    nRet1 = self.askYesNo( "Tenho que avisar que, se usar o cupom comum, voc� ser� recompensado com um par de lentes. Vai usar #b#t5152012##k e realmente fazer a diferen�a dos seus olhos?" );
    if ( nRet1 == 0 ) self.say( "� compreens�vel, desde que haja uma chance de voc� n�o receber o tipo de lentes que estava procurando. Se ainda as quiser, ent�o fale comigo." );
    else if ( nRet1 == 1 ) 
    {
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
      changeEye1 = tface;
      changeEye2 = tface + 100;
      changeEye3 = tface + 300;
      changeEye4 = tface + 400;
      changeEye5 = tface + 600;
      changeEye6 = tface + 700;

			mFace = self.makeRandAvatar( 5152012, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6 );

			if ( mFace == 1 ) self.say( "Aqui est� o espelho. O que voc� acha? Acho que est�o sob medida para voc�. Tenho que dizer: est� fabuloso. Por favor, volte novamente." );
			else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�. Desculpe." );
			else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
			else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
    }
  } else if ( nRet == 1 )
  {
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
      changeEye1 = tface;
      changeEye2 = tface + 100;
      changeEye3 = tface + 300;
      changeEye4 = tface + 400;
      changeEye5 = tface + 600;
      changeEye6 = tface + 700;

  	  mFace = self.askAvatar( "Com nossa m�quina especial, voc� pode ver antes como ficar� depois do tratamento. Que tipo de lentes gostaria de usar? Escolha o estilo de acordo com seu gosto...", 5152015, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6 );

			if ( mFace == 1 ) self.say( "Aqui est� o espelho. O que voc� acha? Acho que est�o sob medida para voc�. Tenho que dizer: est� fabuloso. Por favor, volte novamente." );
			else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�. Desculpe." );
			else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
			else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
 }
}

script "lens_wedding1"	{
  nRet = self.askMenu( "Hum... Oi, sou o Dr. Roberts e sou o especialista em lentes aqui na Loja de Cirurgia Pl�stica de Amoria. Acredito que seus olhos s�o as coisas mais importantes em seu corpo e, com #b#t5152025##k ou #b#t5152026##k, posso prescrerver as lentes certas para voc�. Agora, o que voc� gostaria de usar?\r\n#b#L0# Lentes de contato em Amoria (Cupom Normal)#l\r\n#L1# Lentes de Contato em Amoria (cupom VIP)#l" );
  if ( nRet == 0 )
  {
    nRet1 = self.askYesNo( "Tenho que avisar que, se usar o cupom comum, voc� ser� recompensado com um par de lentes. Vai usar #b#t5152025##k e realmente fazer a diferen�a dos seus olhos?" );
    if ( nRet1 == 0 ) self.say( "� compreens�vel, desde que haja uma chance de voc� n�o receber o tipo de lentes que estava procurando. Se ainda as quiser, ent�o fale comigo." );
    else if ( nRet1 == 1 ) 
    {
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
      changeEye1 = tface;
      changeEye2 = tface + 100;
      changeEye3 = tface + 300;
      changeEye4 = tface + 400;
      changeEye5 = tface + 600;
      changeEye6 = tface + 700;

			mFace = self.makeRandAvatar( 5152025, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6 );

			if ( mFace == 1 ) self.say( "Aqui est� o espelho. O que voc� acha? Acho que est�o sob medida para voc�. Tenho que dizer: est� fabuloso. Por favor, volte novamente." );
			else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�. Desculpe." );
			else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
			else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
    }
  } else if ( nRet == 1 )
  {
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
      changeEye1 = tface;
      changeEye2 = tface + 100;
      changeEye3 = tface + 300;
      changeEye4 = tface + 400;
      changeEye5 = tface + 600;
      changeEye6 = tface + 700;

  	  mFace = self.askAvatar( "Com nossa m�quina especial, voc� pode ver antes como ficar� depois do tratamento. Que tipo de lentes gostaria de usar? Escolha o estilo de acordo com seu gosto...", 5152026, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6 );

			if ( mFace == 1 ) self.say( "Aqui est� o espelho. O que voc� acha? Acho que est�o sob medida para voc�. Tenho que dizer: est� fabuloso. Por favor, volte novamente." );
			else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�. Desculpe." );
			else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
			else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
 }
}

// NLC VIP plastic surgery
script "NLC_FaceVip" {
  teye = ( target.nFace / 100 ) % 10 * 100;
	if ( target.nGender == 0 )  {
	  //changeFace1 = 20023 + teye;
	  changeFace2 = 20012 + teye;
	  changeFace3 = 20000 + teye;
	  changeFace4 = 20001 + teye;
	  changeFace5 = 20002 + teye;
	  changeFace6 = 20003 + teye;
	  changeFace7 = 20004 + teye;
	  changeFace8 = 20005 + teye;
	  changeFace9 = 20006 + teye;
	  changeFace10 = 20008 + teye;
    	
	  mFace = self.askAvatar( "Vamos ver... Posso transformar sua cara em algo totalmente novo. Voc� n�o quer tentar? Por #b#t5152034##k, pode ganhar uma cara do seu gosto. Escolha com calma um rosto de sua prefer�ncia...", 5152034, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10 );
	}
	else if ( target.nGender == 1 ) 	{
	  //changeFace1 = 21022 + teye;
	  changeFace2 = 21016 + teye;
	  changeFace3 = 21001 + teye;
	  changeFace4 = 21002 + teye;
	  changeFace5 = 21003 + teye;
	  changeFace6 = 21004 + teye;
	  changeFace7 = 21005 + teye;
	  changeFace8 = 21006 + teye;
	  changeFace9 = 21008 + teye;
      changeFace10 = 21012 + teye;
	  
	  mFace = self.askAvatar( "Vamos ver... Posso transformar sua cara em algo totalmente novo. Voc� n�o quer tentar? Por #b#t5152034##k, pode ganhar uma cara do seu gosto. Escolha com calma um rosto de sua prefer�ncia...", 5152034, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10 );
	}
	
	if ( mFace == 1 ) self.say( "Certo, o procedimento acabou. Olhe, aqui tem um espelho. O que voc� acha? At� eu admito que isso � uma obra-de-arte... haha, bem, me liga quando enjoar desse novo visual, t�?" );
	else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico para este lugar... Desculpe dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
	else if ( mFace == -3 ) self.say( "Hum... Parece que temos um problema aqui no hospital e sinto que n�o posso continuar o procedimento imediatamente. Por favor, volte depois." );
	else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, volte depois." );
}

// NLC regular plastic surgery
script "NLC_FaceExp" {
	nRet = self.askYesNo( "Se usar o cupom comum, seu rosto pode se transformar em qualquer um... Ainda quer fazer isso usando #b#t5152033##k?" );
	if ( nRet == 0 ) self.say( "Percebo... Pense um pouco e veja se � realmente isso que quer. Quando decidir, me avise." );
	else if ( nRet == 1 ) {
    teye = ( target.nFace / 100 ) % 10 * 100;
		if ( target.nGender == 0 ) {
		
	  	  changeFace1 = 20023 + teye;
		  //changeFace2 = 20012 + teye;
		  changeFace3 = 20000 + teye;
		  changeFace4 = 20001 + teye;
		  changeFace5 = 20002 + teye;
		  changeFace6 = 20003 + teye;
		  changeFace7 = 20004 + teye;
		  changeFace8 = 20005 + teye;
		  changeFace9 = 20006 + teye;
		  changeFace10 = 20008 + teye;
		  
		  mFace = self.makeRandAvatar( 5152033, changeFace1, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10 );
		}
		else if ( target.nGender == 1 ) {
		  
		  changeFace1 = 21022 + teye;
		  ///changeFace2 = 21016 + teye;
		  changeFace3 = 21001 + teye;
		  changeFace4 = 21002 + teye;
		  changeFace5 = 21003 + teye;
		  changeFace6 = 21004 + teye;
		  changeFace7 = 21005 + teye;
		  changeFace8 = 21006 + teye;
		  changeFace9 = 21008 + teye;
	      changeFace10 = 21012 + teye;
	  
		  mFace = self.makeRandAvatar( 5152033, changeFace1, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10);
		}

		if ( mFace == 1 ) self.say( "Ok, a cirurgia acabou. Veja voc� mesmo. Aqui tem um espelho... O que acha? Eu acho que isso � uma obra-de-arte... hahahaha, por favor, volte quando enjoar desse novo visual, t�?" );
		else if ( mFace == -1 ) self.say( "Hum... Parece que voc� n�o tem o cupom espec�fico deste lugar. Desculpa dizer isso, mas, sem o cupom, nada de cirurgia pl�stica para voc�." );
		else if ( mFace == -3 ) self.say( "Desculpe, mas h� um problema aqui no hospital e temo que tenha que parar a cirurgia neste minuto. Por favor, volte depois." );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Hum... Parece haver um problema com o procedimento aqui. Por favor, volte depois." );
	}
}

script "NLC_LensVip"{

	  tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
	  
	  changeEye1 = tface;
	  changeEye2 = tface + 100;
	  changeEye3 = tface + 200;
	  changeEye4 = tface + 300;
	  changeEye5 = tface + 400;
	  changeEye6 = tface + 500;
	  changeEye7 = tface + 600;
	  changeEye8 = tface + 700;

  	  mFace = self.askAvatar( "Oi, voc� a�! Sou JJ, respons�vel pelo departamento de Lentes de Contato aqui na Loja de CNF! Com nossa m�quina especial, voc� pode ver antes como ficar� depois do tratamento. Que tipo de lentes gostaria de usar? Escolha o estilo de acordo com seu gosto...", 5152036, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6, changeEye7, changeEye8 );

	if ( mFace == 1 ) self.say( "Ta-da! �, saca o visual!! O que voc� acha? Eu realmente acho que seus olhos est�o fant�sticos agora! Por favor, volte novamente." );
	else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
	else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
	else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
 
}

script "NLC_LensExp"{

    nRet1 = self.askYesNo( "Oi, voc� a�! Sou Bomack. Se usar o cupom comum, voc� ser� recompensado com um par de lentes. Vai usar #b#t5152035##k e realmente fazer a diferen�a dos seus olhos?" );
    if ( nRet1 == 0 ) self.say( "Entendo. Isso � compreens�vel, desde que n�o tenha certeza se quer ter as lentes de contato do seu gosto. De qualquer modo, n�o estamos com pressa, ent�o pense um pouco!  Me avise quando decidir fazer a mudan�a!" );
    else if ( nRet1 == 1 )     {
	
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
	  
      changeEye1 = tface;
	  changeEye2 = tface + 100;
	  changeEye3 = tface + 200;
	  changeEye4 = tface + 300;
	  changeEye5 = tface + 400;
	  changeEye6 = tface + 500;
	  changeEye7 = tface + 600;
	  changeEye8 = tface + 700;

		mFace = self.makeRandAvatar( 5152035, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6, changeEye7, changeEye8 );

		if ( mFace == 1 ) self.say( "Ta-da! �, saca o visual!! O que voc� acha? Eu realmente acho que seus olhos est�o fant�sticos agora! Por favor, volte novamente." );
		else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
		else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
    }
  
}

//���� ��� �����ܰ�
script "face_mureung1" {

	nRet = self.askMenu( "Sou respons�vel por Cirurgia Pl�stica aqui na loja de Mu Lung! Acredito que seus olhos s�o as coisas mais importantes em seu corpo e, com #b#t5152028##k ou #b#t5152041##k, posso prescrerver as lentes certas para voc�. Agora, o que voc� gostaria de usar?\r\n#b#L0# Cupom de Lentes de Contato em Mu Lung#l\r\n#L1# Cupom de Lentes de Contato VIP em Mu Lung#l" );
  if ( nRet == 0 )  {
  
  teye = ( target.nFace / 100 ) % 10 * 100;
	if ( target.nGender == 0 ) 
	{
	  changeFace1 = 20010 + teye;
	  changeFace2 = 20000 + teye;
	  changeFace3 = 20002 + teye;
	  changeFace4 = 20004 + teye;
	  changeFace5 = 20005 + teye;
	  changeFace6 = 20006 + teye;
	  changeFace7 = 20007 + teye;
	  changeFace8 = 20012 + teye;
	  changeFace9 = 20009 + teye;

	  mFace = self.askAvatar( "Com nossa m�quina especial, voc� pode ver antes como ficar� depois do tratamento. Que tipo de lentes gostaria de usar? Escolha o estilo de acordo com seu gosto...", 5152028, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9 );
	}
	else if ( target.nGender == 1 ) 
	{
	  changeFace1 = 21011 + teye;
	  changeFace2 = 21000 + teye;
	  changeFace3 = 21002 + teye;
	  changeFace4 = 21003 + teye;
	  changeFace5 = 21005 + teye;
	  changeFace6 = 21006 + teye;
	  changeFace7 = 21008 + teye;
	  changeFace8 = 21012 + teye;
	  changeFace9 = 21009 + teye;
    	  
	 mFace = self.askAvatar( "Com nossa m�quina especial, voc� pode ver antes como ficar� depois do tratamento. Que tipo de lentes gostaria de usar? Escolha o estilo de acordo com seu gosto...", 5152028, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9 );
	}
	
		if ( mFace == 1 ) self.say( "Ta-da! �, saca o visual!! O que voc� acha? Eu realmente acho que seus olhos est�o fant�sticos agora! Por favor, volte novamente." );
		else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
		else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
    }
	
	  if ( nRet == 1 )  {
	 tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
	  
	  changeEye1 = tface;
	  changeEye2 = tface + 100;
	  changeEye3 = tface + 200;
	  changeEye4 = tface + 300;
	  changeEye5 = tface + 400;
	  changeEye6 = tface + 500;
	  changeEye7 = tface + 600;
	  changeEye8 = tface + 700;

  	  mFace = self.askAvatar( "Com nossa m�quina especial, voc� pode ver antes como ficar� depois do tratamento. Que tipo de lentes gostaria de usar? Escolha o estilo de acordo com seu gosto...", 5152041, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6, changeEye7, changeEye8 );

	if ( mFace == 1 ) self.say( "Ta-da! �, saca o visual!! O que voc� acha? Eu realmente acho que seus olhos est�o fant�sticos agora! Por favor, volte novamente." );
	else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
	else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
	else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
	
	}
}

// ���� �Ϲ� �����ܰ�
script "face_mureung2" {
	nRet = self.askMenu( "Sou Noma, assistente da Cirurgia Pl�stica aqui! Com #b#t5152027##k ou #b#t5152042##k, voc� ser� recompensado com uma cirurgia pl�stica de resultado aleat�rio e um par aleat�rio de lentes de contato. Agora, o que voc� gostaria?\r\n#b#L0# Cupom de Cirurgia Pl�stica em Mu Lung#l\r\n#L1# Cupom de Lentes de Contato em Mu Lung#l" );
  if ( nRet == 0 ) 	{
	nRet1 = self.askYesNo( "Se usar o cupom comum, voc� ser� recompensado com um par de lentes. Vai usar #b#t5152027##k e realmente fazer a diferen�a dos seus olhos?" );
	if ( nRet1 == 0 ) self.say( "Entendo. Isso � compreens�vel, desde que n�o tenha certeza se quer ter as lentes de contato do seu gosto. De qualquer modo, n�o estamos na correria, ent�o pense um pouco!  Me avise quando decidir fazer a mudan�a!");
	else if ( nRet1 == 1 ) {
		teye = ( target.nFace / 100 ) % 10 * 100;
		if ( target.nGender == 0 ) 
		{
  		  changeFace1 = 20009 + teye;
		  changeFace2 = 20000 + teye;
		  changeFace3 = 20002 + teye;
		  changeFace4 = 20004 + teye;
		  changeFace5 = 20005 + teye;
		  changeFace6 = 20006 + teye;
		  changeFace7 = 20007 + teye;
		  changeFace8 = 20012 + teye;
	  
		  mFace = self.makeRandAvatar( 5152027, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8 );
		}
		else if ( target.nGender == 1 ) 
		{
		  changeFace1 = 21009 + teye;
		  changeFace2 = 21000 + teye;
		  changeFace3 = 21002 + teye;
		  changeFace4 = 21003 + teye;
		  changeFace5 = 21005 + teye;
		  changeFace6 = 21006 + teye;
		  changeFace7 = 21008 + teye;
		  changeFace8 = 21012 + teye;
	  
		  mFace = self.makeRandAvatar( 5152027, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8 );
		}
			
		if ( mFace == 1 ) self.say( "Ta-da! �, saca o visual!! O que voc� acha? Eu realmente acho que seus olhos est�o fant�sticos agora! Por favor, volte novamente." );
		else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
		else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
    }
	
	}
	
	if ( nRet == 1 ) {	
	nRet1 = self.askYesNo( "Se usar o cupom comum, voc� ser� recompensado com um par de lentes. Vai usar #b#t5152042##k e realmente fazer a diferen�a dos seus olhos?" );
    if ( nRet1 == 0 ) self.say( "Entendo. Isso � compreens�vel, desde que n�o tenha certeza se quer ter as lentes de contato do seu gosto. De qualquer modo, n�o estamos com pressa, ent�o pense um pouco!  Me avise quando decidir fazer a mudan�a!" );
    else if ( nRet1 == 1 )     {
	
      tface = target.nFace - ( target.nFace / 100 ) % 10 * 100;
	  
      changeEye1 = tface;
	  changeEye2 = tface + 100;
	  changeEye3 = tface + 200;
	  changeEye4 = tface + 300;
	  changeEye5 = tface + 400;
	  changeEye6 = tface + 500;
	  changeEye7 = tface + 600;
	  changeEye8 = tface + 700;

		mFace = self.makeRandAvatar( 5152042, changeEye1, changeEye2, changeEye3, changeEye4, changeEye5, changeEye6, changeEye7, changeEye8 );

		if ( mFace == 1 ) self.say( "Ta-da! �, saca o visual!! O que voc� acha? Eu realmente acho que seus olhos est�o fant�sticos agora! Por favor, volte novamente." );
		else if ( mFace == -1 ) self.say( "Desculpe, mas acho que agora voc� n�o tem o cupom de nossas lentes de contato. Sem o cupom, sinto muito, mas n�o posso fazer isso para voc�." );
		else if ( mFace == -3 ) self.say( "Desculpe, mas parece que nossa m�quina de fazer lentes de contato n�o est� funcionando agora. Por favor, volte depois. Me desculpe, de verdade!" );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Desculpe, mas parece haver um problema com o procedimento aqui. Por favor, confirme comigo mais tarde." );
    }
	}
}
// ��� ��� ��������
script "face_shouwa1" {
  teye = ( target.nFace / 100 ) % 10 * 100;
	if ( target.nGender == 0 ) 
      {
  	  changeFace1 = 20002 + teye;
	  changeFace2 = 20003 + teye;
	  changeFace3 = 20004 + teye;
	  changeFace4 = 20007 + teye;
	  changeFace5 = 20008 + teye;
	  changeFace6 = 20009 + teye;
	  changeFace7 = 20010 + teye;
	  changeFace8 = 20011 + teye;
  	  changeFace9 = 20013 + teye;
	  changeFace10 = 20016 + teye;
	  changeFace11 = 20017 + teye;
      mFace = self.askAvatar( "With the magic of plastic surgery, I can totally transform your face into something new. Don't you want to sport a beautiful, healthy face, complete with the admirations of those around you? For #b#t5152009##k, I'll make that come true. Choose the face of your liking.", 5152009, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
}
	else if ( target.nGender == 1 ) 
  {
	  changeFace1 = 21003 + teye;
	  changeFace2 = 21003 + teye;
	  changeFace3 = 21004 + teye;
	  changeFace4 = 21005 + teye;
	  changeFace5 = 21008 + teye;
	  changeFace6 = 21009 + teye;
	  changeFace7 = 21010 + teye;
	  changeFace8 = 21011 + teye;
  	  changeFace9 = 21013 + teye;
	  changeFace10 = 21016 + teye;
	  changeFace11 = 21017 + teye;
	  mFace = self.askAvatar( "With the magic of plastic surgery, I can totally transform your face into something new. Don't you want to sport a beautiful, healthy face, complete with the admirations of those around you? For #b#t5152009##k, I'll make that come true. Choose the face of your liking.", 5152009, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
}
	if ( mFace == 1 ) self.say( "Alright, the procedure's done. Check it out, here's the mirror for you. What do you think? Even I admit this looks like a masterpiece. Now, once you get sick of that new look, please drop by, alright? " );
	else if ( mFace == -1 ) self.say( "I'm afraid you don't have our designated plastic surgery coupon. I'm sorry, but without the coupon, there's no plastic surgery for you." );
	else if ( mFace == -3 ) self.say( "I'm afraid we have a problem here at the hospital and I can't go on with the procedure right this minute. Please come back later." );
	else if ( mFace == 0 or mFace == -2 ) self.say( "Sorry to say this, but there seems to be a problem here with the procedure. Please come back later." );
}

// ��� �Ϲ� ��������
script "face_shouwa2" {
	nRet = self.askYesNo( "If you use the regular coupon, your face may transform into a random new look; How you'll look after the procedure is all ... pure luck. Do you still want to do it using #b#t5152008##k? " );
	if ( nRet == 0 ) self.say( "I understand. Please take your time, and if you still want it, let me know alright?" );
	else if ( nRet == 1 ) {
    teye = ( target.nFace / 100 ) % 10 * 100;
		if ( target.nGender == 0 ) 
	  {
  	  changeFace1 = 20002 + teye;
	  changeFace2 = 20003 + teye;
	  changeFace3 = 20004 + teye;
	  changeFace4 = 20007 + teye;
	  changeFace5 = 20008 + teye;
	  changeFace6 = 20009 + teye;
	  changeFace7 = 20010 + teye;
	  changeFace8 = 20011 + teye;
  	  changeFace9 = 20013 + teye;	
	  changeFace10 = 20016 + teye;
	  changeFace11 = 20017 + teye;
      mFace = self.makeRandAvatar( 5152008, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
}
		else if ( target.nGender == 1 ) 
      {
	  changeFace1 = 21003 + teye;
	  changeFace2 = 21003 + teye;
	  changeFace3 = 21004 + teye;
	  changeFace4 = 21005 + teye;
	  changeFace5 = 21008 + teye;
	  changeFace6 = 21009 + teye;
	  changeFace7 = 21010 + teye;
	  changeFace8 = 21011 + teye;
  	  changeFace9 = 21013 + teye;
	  changeFace10 = 21016 + teye;
	  changeFace11 = 21017 + teye;
	  mFace = self.makeRandAvatar( 5152008, changeFace1, changeFace2, changeFace3, changeFace4, changeFace5, changeFace6, changeFace7, changeFace8, changeFace9, changeFace10, changeFace11 );
}
		if ( mFace == 1 ) self.say( "The surgery's complete. Here's the mirror for you. Not bad, right? If you ever get sick of that new look, please drop by. " );
		else if ( mFace == -1 ) self.say( "I'm afraid you don't have our designated regular plastic surgery coupon. I'm sorry, but without the regular coupon, there's no plastic surgery for you." );
		else if ( mFace == -3 ) self.say( "I'm afraid we have a problem here at the hospital and I can't go on with the procedure right this minute. Please come back later." );
		else if ( mFace == 0 or mFace == -2 ) self.say( "Sorry to say this, but there seems to be a problem here with the procedure. Please come back later." );
	}
 }
