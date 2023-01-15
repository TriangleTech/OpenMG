module "standard.s";

// Meteorite1 : 2050014
script "earth009" {
	qr = target.questRecord;
	val = qr.getState( 3421 );
	info = qr.get( 3421 );

	if ( val == 0 or val == 2 or info == "111111" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas est� t�o destru�do que nada �til pode ser encontrado nele." );
	else {
		nInvite = substring( info, 0, 1 );

		if ( nInvite == "1" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas uma amostra j� foi extra�da dele. Procure por amostras diferentes de meteoritos." );
		else {
			inven = target.inventory;
			ret = inven.exchange( 0, 4031117, 1 );
			if ( ret == 0 ) self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da, mas o item n�o pode ser colocado no invent�rio de etc. porque este estava cheio." );
			else {
				nInvite1 = substring( info, 1, 1 );
				nInvite2 = substring( info, 2, 1 );
				nInvite3 = substring( info, 3, 1 );
				nInvite4 = substring( info, 4, 1 );
				nInvite5 = substring( info, 5, 1 );

				nFInvite = "1" + nInvite1 + nInvite2 + nInvite3 + nInvite4 + nInvite5;
				qr.set( 3421, nFInvite );

				self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da.." );
			}
		}
	}
}

// Meteorite2 : 2050015
script "earth010" {
	qr = target.questRecord;
	val = qr.getState( 3421 );
	info = qr.get( 3421 );

	if ( val == 0 or val == 2 or info == "111111" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas est� t�o destru�do que nada �til pode ser encontrado nele." );
	else {
		nInvite = substring( info, 1, 1 );

		if ( nInvite == "1" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas uma amostra j� foi extra�da dele. Procure por amostras diferentes de meteoritos." );
		else {
			inven = target.inventory;
			ret = inven.exchange( 0, 4031117, 1 );
			if ( ret == 0 ) self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da, mas o item n�o pode ser colocado no invent�rio de etc. porque este estava cheio." );
			else {
				nInvite1 = substring( info, 0, 1 );
				nInvite2 = substring( info, 2, 1 );
				nInvite3 = substring( info, 3, 1 );
				nInvite4 = substring( info, 4, 1 );
				nInvite5 = substring( info, 5, 1 );

				nFInvite = nInvite1 + "1" + nInvite2 + nInvite3 + nInvite4 + nInvite5;
				qr.set( 3421, nFInvite );

				self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da.." );
			}
		}
	}
}

// Meteorite3 : 2050016
script "earth011" {
	qr = target.questRecord;
	val = qr.getState( 3421 );
	info = qr.get( 3421 );

	if ( val == 0 or val == 2 or info == "111111" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas est� t�o destru�do que nada �til pode ser encontrado nele." );
	else {
		nInvite = substring( info, 2, 1 );

		if ( nInvite == "1" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas uma amostra j� foi extra�da dele. Procure por amostras diferentes de meteoritos." );
		else {
			inven = target.inventory;
			ret = inven.exchange( 0, 4031117, 1 );
			if ( ret == 0 ) self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da, mas o item n�o pode ser colocado no invent�rio de etc. porque este estava cheio." );
			else {
				nInvite1 = substring( info, 0, 1 );
				nInvite2 = substring( info, 1, 1 );
				nInvite3 = substring( info, 3, 1 );
				nInvite4 = substring( info, 4, 1 );
				nInvite5 = substring( info, 5, 1 );

				nFInvite = nInvite1 + nInvite2 + "1" + nInvite3 + nInvite4 + nInvite5;
				qr.set( 3421, nFInvite );

				self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da.." );
			}
		}
	}
}

// Meteorite4 : 2050017
script "earth012" {
	qr = target.questRecord;
	val = qr.getState( 3421 );
	info = qr.get( 3421 );

	if ( val == 0 or val == 2 or info == "111111" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas est� t�o destru�do que nada �til pode ser encontrado nele." );
	else {
		nInvite = substring( info, 3, 1 );

		if ( nInvite == "1" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas uma amostra j� foi extra�da dele. Procure por amostras diferentes de meteoritos." );
		else {
			inven = target.inventory;
			ret = inven.exchange( 0, 4031117, 1 );
			if ( ret == 0 ) self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da, mas o item n�o pode ser colocado no invent�rio de etc. porque este estava cheio." );
			else {
				nInvite1 = substring( info, 0, 1 );
				nInvite2 = substring( info, 1, 1 );
				nInvite3 = substring( info, 2, 1 );
				nInvite4 = substring( info, 4, 1 );
				nInvite5 = substring( info, 5, 1 );

				nFInvite = nInvite1 + nInvite2 + nInvite3 + "1" + nInvite4 + nInvite5;
				qr.set( 3421, nFInvite );

				self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da.." );
			}
		}
	}
}

// Meteorite5 : 2050018
script "earth013" {
	qr = target.questRecord;
	val = qr.getState( 3421 );
	info = qr.get( 3421 );

	if ( val == 0 or val == 2 or info == "111111" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas est� t�o destru�do que nada �til pode ser encontrado nele." );
	else {
		nInvite = substring( info, 4, 1 );

		if ( nInvite == "1" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas uma amostra j� foi extra�da dele. Procure por amostras diferentes de meteoritos." );
		else {
			inven = target.inventory;
			ret = inven.exchange( 0, 4031117, 1 );
			if ( ret == 0 ) self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da, mas o item n�o pode ser colocado no invent�rio de etc. porque este estava cheio." );
			else {
				nInvite1 = substring( info, 0, 1 );
				nInvite2 = substring( info, 1, 1 );
				nInvite3 = substring( info, 2, 1 );
				nInvite4 = substring( info, 3, 1 );
				nInvite5 = substring( info, 5, 1 );

				nFInvite = nInvite1 + nInvite2 + nInvite3 + nInvite4 + "1" + nInvite5;
				qr.set( 3421, nFInvite );

				self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da.." );
			}
		}
	}
}

// Meteorite6 : 2050019
script "earth014" {
	qr = target.questRecord;
	val = qr.getState( 3421 );
	info = qr.get( 3421 );

	if ( val == 0 or val == 2 or info == "111111" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas est� t�o destru�do que nada �til pode ser encontrado nele." );
	else {
		nInvite = substring( info, 5, 1 );

		if ( nInvite == "1" ) self.say( "Parece ser um meteorito que foi jogado do espa�o, mas uma amostra j� foi extra�da dele. Procure por amostras diferentes de meteoritos." );
		else {
			inven = target.inventory;
			ret = inven.exchange( 0, 4031117, 1 );
			if ( ret == 0 ) self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da, mas o item n�o pode ser colocado no invent�rio de etc. porque este estava cheio." );
			else {
				nInvite1 = substring( info, 0, 1 );
				nInvite2 = substring( info, 1, 1 );
				nInvite3 = substring( info, 2, 1 );
				nInvite4 = substring( info, 3, 1 );
				nInvite5 = substring( info, 4, 1 );

				nFInvite = nInvite1 + nInvite2 + nInvite3 + nInvite4 + nInvite5 + "1";
				qr.set( 3421, nFInvite );

				self.say( "Parece ser um meteorito que foi jogado do espa�o. Depois de mais investiga��es, uma amostra em boas condi��es foi extra�da.." );
			}
		}
	}
}
