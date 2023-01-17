module "standard.s";


//GM
function pigmy_master {
	if ( target.nJob == 900 ) {
		ret = self.askMenu( "How can i help you? \r\n#b#L0# Initializing recieved today data #l\r\n#L1# Initializing  recieved recently dates #l\r\n#L2# Going next step#l" );
		if ( ret == 0 ) {
			qr = target.questRecord;
			qr.setComplete( 9461 );
		} else if ( ret == 1 ) {
			qr = target.questRecord;
			qr.setComplete( 9460 );
		}
	}

	return;
}

//������ ����� ó��
function pigmy_reinit {
	qr = target.questRecord;
	num = length( qr.get( 9461 ));
	if ( num == 8 ) {
		result = qr.get( 9461 ) + "0";
		qr.set( 9461, result );
	}

	return;
}


//�� ��ȯ
function( integer ) egg_Code( integer tCode ) {
	if ( tCode == 0 ) return 4170000;
	if ( tCode == 1 ) return 4170001;
	if ( tCode == 2 ) return 4170002;
	if ( tCode == 3 ) return 4170003;
	if ( tCode == 4 ) return 4170004;
//	if ( tCode == 5 ) return 4170005;	blocked by JK 2008.08.18
//	if ( tCode == 6 ) return 4170006;	blocked by JK 2008.08.18
	return 4170000;
//	if ( tCode == 9 ) return 4170009;	blocked by JK 2008.08.13
//	return 4170007;			blocked by JK 2008.08.13
}

function( string ) pigmytownName( integer tCode ) {
	if ( tCode == 4170000 ) return "Henesys";	//henesys
	if ( tCode == 4170001 ) return "Ellinia";	//ellinia
	if ( tCode == 4170002 ) return "Cidade de Kerning";	//cerning city
	if ( tCode == 4170003 ) return "Perion";		// perion
	if ( tCode == 4170004 ) return "El Nath";		//el nath
//	if ( tCode == 4170005 ) return "Ludibrium";		blocked by JK 2008.08.18
//	if ( tCode == 4170006 ) return "Orbis";			blocked by JK 2008.08.18
	return "Henesys";
//	if ( tCode == 4170009 ) return "��ƿ����";	              blocked by JK 2008.08.13
//	return "����Ƹ���";				blocked by JK 2008.08.13
}

function (integer) pigmytown_Code( integer mapCode ){
	if (mapCode == 100000000) code = 0;
	else if (mapCode == 101000000 ) code = 1;
	else if (mapCode == 103000000 ) code = 2;
	else if (mapCode == 102000000 ) code = 3;
	else if (mapCode == 211000000 ) code = 4;
//	else if (mapCode == 220000000 ) code = 5;	blocked by JK 2008.08.18
//	else if (mapCode == 200000000 ) code = 6;	blocked by JK 2008.08.18
//	else if (mapCode == 230000000 ) code = 7;	����Ƹ��� blocked by JK 2008.08.13
//	else if (mapCode == 120000000 ) code = 9;	��ƿ���� blocked by JK 2008.08.13
	else code = 0;	
	
	return code;
}

function( integer ) eggChg( integer eggCode ) {
	inventory = target.inventory;
	eggNum = inventory.itemCount( eggCode );
	tName = pigmytownName( eggCode );

	if ( eggNum > 0 ) {
//		v1 = self.askMenu( "#b" + tName + " �Ǳ׹� ����#k�� ��� ���� �Ǳ׹� ���׷� ��ȯ�Ͻðڽ��ϱ�?\r\n#b#L0# ��׽ý�#l\r\n#L1# �����Ͼ�#l\r\n#L2# Ŀ�׽�Ƽ#l\r\n#L3# �丮��#l\r\n#L4# ������#l\r\n#L5# ���긮��#l\r\n#L6# ������#l\r\n#L7# ����Ƹ���#l\r\n#L9# ��ƿ����#l  " );		// modified by JK 2008.08.13
		v1 = self.askMenu( "#b" + tName + " : #kVoc� gostaria de trocar seu Ovo de Pigmy com o de qual cidade?\r\n#b#L0# Henesys#l\r\n#L1# Ellinia#l\r\n#L2# Cidade de Kerning#l\r\n#L3# Perion#l\r\n#L4# El Nath#l  " );
//		v1 = self.askMenu( "#b" + tName + " �Ǳ׹� ����#k�� ��� ���� �Ǳ׹� ���׷� ��ȯ�Ͻðڽ��ϱ�?\r\n#b#L5# ���긮��#l\r\n#L7# ����Ƹ���#l\r\n#L9# ��ƿ����#l  " );
		chgedNum = egg_Code( v1 );
		if ( chgedNum == eggCode ) {
			self.say( "Voc� n�o pode trocar ovos da mesma cidade." );
			end;
		}
//		eggchgNum = self.askNumber( "#b" + target.sCharacterName + "��#k�� " + tName + " �Ǳ׹� ���׸� #b" + eggNum + "��#k ������ �ֽ��ϴ�.  �� ���� ��ȯ�Ͻ� �ڽ��ϱ�?\r\n#b< �� : 3 >#k", 0, 0, eggNum );
//		eggchgNum = self.askNumber( "#b" + target.sCharacterName + "��#k�� " + tName + " �Ǳ׹� ���׸� #b" + eggNum + "��#k ������ �ֽ��ϴ�.  Quantos voce gostaria de trocar?\r\n#b< �� : 3 >#k", 0, 0, eggNum );
		eggchgNum = self.askNumber( "#b" + target.sCharacterName + " #kpossui#b " + eggNum + " #kOvo(s) de Pigmy de#b " + tName + ".Quantos voc� gostaria de trocar?\r\n#b< ex : 3 >#k", 0, 0, eggNum );

		if ( eggchgNum == 0 ) {
			self.say( "Voc� n�o pode trocar 0." );
			return 0;
		}
		ret = inventory.exchange( 0, eggCode, -eggchgNum, chgedNum, eggchgNum );
		if ( ret == 0 ) return -1;
		return 0;
	} else {
//		self.say( "#b" + target.sCharacterName + "��#k�� " + tName + " �Ǳ׹� ���׸� ������ ���� �ʽ��ϴ�." );
		self.say( "#b" + target.sCharacterName + " #kn�o possui Ovos de Pigmy de " + tName + "." );

		return 0;
	}
	return -2;
}

function pigmy_exchange {
//	v0 = self.askMenu( "�Ǳ׹̰� �ڽ��� ���� ���� �ٸ� ������ �˰� �ٲپ� �ְڴٰ� �մϴ�. ��� ���� �Ǳ׹� ���׸� ��ȯ�Ͻðڽ��ϱ�?\r\n#b#L0# ��׽ý�#l\r\n#b#L1# �����Ͼ�#l\r\n#b#L2# Ŀ�׽�Ƽ#l\r\n#b#L3# �丮��#l\r\n#b#L4# ������#l\r\n#b#L5# ���긮��#l\r\n#b#L6# ������#l\r\n#b#L7# ����Ƹ���#l\r\n#b#L9# ��ƿ����#l " );	// modified by JK 2008.08.13
	v0 = self.askMenu( "O Pigmy permite que seus ovos sejam trocados por ovos de outra cidade. Voc� gostaria de trocar seu Ovo de Pigmy com o de qual cidade?\r\n#b#L0# Henesys#l\r\n#b#L1# Ellinia#l\r\n#b#L2# Cidade de Kerning#l\r\n#b#L3# Perion#l\r\n#b#L4# El Nath#l " );
//	v0 = self.askMenu( "�Ǳ׹̰� �ڽ��� ���� ���� �ٸ� ������ �˰� �ٲپ� �ְڴٰ� �մϴ�. ��� ���� �Ǳ׹� ���׸� ��ȯ�Ͻðڽ��ϱ�?\r\n#b#L5# ���긮��#l\r\n#b#L7# ����Ƹ���#l\r\n#b#L9# ��ƿ����#l " );
	if ( v0 == 0 ) {
		ret = eggChg( 4170000 );
	} else if ( v0 == 1 ) {
		ret = eggChg( 4170001 );
	} else if ( v0 == 2 ) {
		ret = eggChg( 4170002 );
	} else if ( v0 == 3 ) {
		ret = eggChg( 4170003 );
	} else if ( v0 == 4 ) {
		ret = eggChg( 4170004 );
	} 

	/* blocked by JK 2008.08.13
	   else if ( v0 == 5 ) {
		ret = eggChg( 4170005 );
	} else if ( v0 == 6 ) {
		ret = eggChg( 4170006 );
	} 
	  else if ( v0 == 7 ) {
		ret = eggChg( 4170007 );
	} else if ( v0 == 9 ) {
		ret = eggChg( 4170009 );
	} 
	*/ 
	  else {
		self.say( "Um erro ocorreu. Por favor tente novamente mais tarde." );
		return;
	}

	if ( ret == -1 ) self.say( "Por favor, verifique se seu inventario possui slots vazios." );
	if ( ret == -2 ) self.say( "Um erro ocorreu. Por favor tente novamente mais tarde." );
	return;
}

script "pigmy"{
/*	field = self.field;
	id = field.id;
	code = pigmytown_Code(id);
	
	v0 = self.askMenu( "O que voc� gostaria de fazer com o Pigmy? \r\n#b#L0# Dar Ra��o..#l\r\n#L1# Parece que o Pigmy quer dizer algo.#l" );	
	if ( v0 == 0 ){
		inventory = target.inventory;
		if ( inventory.itemCount( 2120008 ) >= 1 ) {
			ret1 = self.askYesNo( "O Pigmy parece com fome. Voce gostaria de dar #bRa��o #kpara o Pigmy?" );
			if ( ret1 != 0 ) {
				nSlot = inventory.slotCount( 4 );
				nHold = inventory.holdCount( 4 );
				if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170000 + code ) % 100 > 0 ) ) {//�� ������ �ִ��� üũ or �� ������ ��� �������� �߰��� �� �ִ��� üũ
					ret2 = inventory.makePigmyEgg( 2120008, code );
					if ( ret2 >= 1 ) {
						self.say( "A Ra��o. melhorou o humor do Pigmy! Ele botou um ovo." );
					} else {
						self.say( "O Pigmy gostou da comida, mas n�o botou um ovo." );
					}
				} else self.say( "Por favor, verifique se seu slot etc. est� vazio." );
			} else self.say( "O Pigmy parece famindo... Por favor d� uma ra��o na pr�xima vez." );
		} else self.say( "O Pigmy � um gourmet. S� alimente-o com a #bRa��o." );
	}
	else {
		pigmy_exchange;
	}
*/
	pigmy_reinit;
	
	v0 = self.askMenu( "O que voc� gostaria de fazer com o Pigmy? \r\n#b#L0# Dar Ra��o..#l\r\n#L1# Parece que o Pigmy quer dizer algo.#l" );
	if ( v0 == 0 ) {
		//time check
		qr = target.questRecord;
		con = qr.get( 9460); //�ð�
		con2 = qr.get( 9461); //�������ڵ�
		wTime = currentTime;

//		self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 0,1 ) != "5" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "O Pigmy parece com fome. Voce gostaria de dar #bRa��o #kpara o Pigmy?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170000 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 0 );
								if ( ret2 >= 1 ) {
									pigsubA = substring( con2, 0, 1 );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = pigstr + substring( con2, 1, 8 );
									qr.set( 9461, con3 );
									self.say( "A Ra��o. melhorou o humor do Pigmy! Ele botou um ovo." );
								} else {
									pigsubA = substring( con2, 0, 1 );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = pigstr + substring( con2, 1, 8 );
									qr.set( 9461, con3 );	
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}									
									self.say( "O Pigmy gostou da comida, mas n�o botou um ovo." );
								}
							} else self.say( "Por favor, verifique se seu slot etc. est� vazio." );
						} else self.say( "O Pigmy parece famindo... Por favor d� uma ra��o na pr�xima vez." );
					} else self.say( "O Pigmy � um gourmet. S� alimente-o com a #bRa��o." );
				} else {
					self.say( "O Pigmy est� satisfeito e n�o comer� mais." );
					end;
				}
			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}



// Henesys
script "pigmy0" {
	pigmy_reinit;
	
	v0 = self.askMenu( "O que voc� gostaria de fazer com o Pigmy? \r\n#b#L0# Dar Ra��o..#l\r\n#L1# Parece que o Pigmy quer dizer algo.#l" );
	if ( v0 == 0 ) {
		//time check
		qr = target.questRecord;
		con = qr.get( 9460); //�ð�
		con2 = qr.get( 9461); //�������ڵ�
		wTime = currentTime;

//		self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 0,1 ) != "1" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "O Pigmy parece com fome. Voce gostaria de dar #bRa��o #kpara o Pigmy?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170000 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 0 );
								if ( ret2 >= 1 ) {
									con3 = "1" + substring( con2, 1, 8 );
									qr.set( 9461, con3 );
									self.say( "A Ra��o. melhorou o humor do Pigmy! Ele botou um ovo." );
								} else {
									con3 = "1" + substring( con2, 1, 8 );
									qr.set( 9461, con3 );		
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}									
									self.say( "O Pigmy gostou da comida, mas n�o botou um ovo." );
								}
							} else self.say( "Por favor, verifique se seu slot etc. est� vazio." );
						} else self.say( "O Pigmy parece famindo... Por favor d� uma ra��o na pr�xima vez." );
					} else self.say( "O Pigmy � um gourmet. S� alimente-o com a #bRa��o." );
				} else {
					self.say( "O Pigmy est� satisfeito e n�o comer� mais." );
					end;
				}
			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}

//Ellinia
script "pigmy1" {
	pigmy_reinit;

	v0 = self.askMenu( "O que voc� gostaria de fazer com o Pigmy? \r\n#b#L0# Dar Ra��o..#l\r\n#L1# Parece que o Pigmy quer dizer algo.#l" );
	if ( v0 == 0 ) {
		qr = target.questRecord;
		con = qr.get( 9460);
		con2 = qr.get( 9461);
		wTime = currentTime;

		//���� �ʱ�ȭ
		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

//		self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 1,1 ) != "5" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "O Pigmy parece com fome. Voce gostaria de dar #bRa��o #kpara o Pigmy?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170001 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 1 );
								if ( ret2 >= 1 ) {
									pigsubA = substring( con2, 1,1  );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = substring( con2, 0, 1 ) + pigstr + substring( con2, 2, 7 );
									qr.set( 9461, con3 );
									self.say( "A Ra��o. melhorou o humor do Pigmy! Ele botou um ovo." );
								} else {
									pigsubA = substring( con2, 1,1  );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = substring( con2, 0, 1 ) + pigstr + substring( con2, 2, 7 );
									qr.set( 9461, con3 );	
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}									
									self.say( "O Pigmy gostou da comida, mas n�o botou um ovo." );
								}			
							} else self.say( "Por favor, verifique se seu slot etc. est� vazio." );
						} else self.say( "O Pigmy parece famindo... Por favor d� uma ra��o na pr�xima vez." );
					} else self.say( "O Pigmy � um gourmet. S� alimente-o com a #bRa��o." );
				}  else {
					self.say( "O Pigmy est� satisfeito e n�o comer� mais." );
					end;
				}
			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}

//Cerning City
script "pigmy2" {
	pigmy_reinit;

	v0 = self.askMenu( "O que voc� gostaria de fazer com o Pigmy? \r\n#b#L0# Dar Ra��o..#l\r\n#L1# Parece que o Pigmy quer dizer algo.#l" );
	if ( v0 == 0 ) {
		qr = target.questRecord;
		con = qr.get( 9460);
		con2 = qr.get( 9461);
		wTime = currentTime;

	//	self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 2,1 ) != "5" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "O Pigmy parece com fome. Voce gostaria de dar #bRa��o #kpara o Pigmy?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170002 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 2 );
								if ( ret2 >= 1 ) {
									pigsubA = substring( con2, 2, 1 );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = substring( con2, 0, 2 ) + pigstr + substring( con2, 3, 6 );
									qr.set( 9461, con3 );
									self.say( "A Ra��o. melhorou o humor do Pigmy! Ele botou um ovo." );
								}
								else {
									pigsubA = substring( con2, 2, 1 );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = substring( con2, 0, 2 ) + pigstr + substring( con2, 3, 6 );
									qr.set( 9461, con3 );	
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}									
									self.say( "O Pigmy gostou da comida, mas n�o botou um ovo." );
								}
							}
							else self.say( "Por favor, verifique se seu slot etc. est� vazio." );
						} 
						else self.say( "O Pigmy parece famindo... Por favor d� uma ra��o na pr�xima vez." );
					}
					else self.say( "O Pigmy � um gourmet. S� alimente-o com a #bRa��o." );
				} else {
					self.say( "O Pigmy est� satisfeito e n�o comer� mais." );
					end;
				}
			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}

//Perion
script "pigmy3" {
	pigmy_reinit;

	v0 = self.askMenu( "O que voc� gostaria de fazer com o Pigmy? \r\n#b#L0# Dar Ra��o..#l\r\n#L1# Parece que o Pigmy quer dizer algo.#l" );
	if ( v0 == 0 ) {
		qr = target.questRecord;
		con = qr.get( 9460);
		con2 = qr.get( 9461);
		wTime = currentTime;

//		self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 3,1 ) != "5" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "O Pigmy parece com fome. Voce gostaria de dar #bRa��o #kpara o Pigmy?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170003 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 3 );
								if ( ret2 >= 1 ) {
									pigsubA = substring( con2, 3, 1 );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = substring( con2, 0, 3 ) + pigstr + substring( con2, 4, 5 );
									qr.set( 9461, con3 );	
									self.say( "A Ra��o. melhorou o humor do Pigmy! Ele botou um ovo." );
								}
								else {
									pigsubA = substring( con2, 3, 1 );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = substring( con2, 0, 3 ) + pigstr + substring( con2, 4, 5 );
									qr.set( 9461, con3 );	
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}									
									self.say( "O Pigmy gostou da comida, mas n�o botou um ovo." );
								}
							}
							else self.say( "Por favor, verifique se seu slot etc. est� vazio." );
						} 
						else self.say( "O Pigmy parece famindo... Por favor d� uma ra��o na pr�xima vez." );
					}
					else self.say( "O Pigmy � um gourmet. S� alimente-o com a #bRa��o." );
				} else {
					self.say( "O Pigmy est� satisfeito e n�o comer� mais." );
					end;
				}
			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}

//El Nath
script "pigmy4" {
	pigmy_reinit;

	v0 = self.askMenu( "O que voc� gostaria de fazer com o Pigmy? \r\n#b#L0# Dar Ra��o..#l\r\n#L1# Parece que o Pigmy quer dizer algo.#l" );
	if ( v0 == 0 ) {
		qr = target.questRecord;
		con = qr.get( 9460);
		con2 = qr.get( 9461);
		wTime = currentTime;

	//	self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 4,1 ) != "5" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "O Pigmy parece com fome. Voce gostaria de dar #bRa��o #kpara o Pigmy?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170004 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 4 );
								if ( ret2 >= 1 ) {
									pigsubA = substring( con2, 4, 1 );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = substring( con2, 0, 4 ) + pigstr + substring( con2, 5, 4 );
									qr.set( 9461, con3 );
									self.say( "A Ra��o. melhorou o humor do Pigmy! Ele botou um ovo." );
								}
								else {
									pigsubA = substring( con2, 4, 1 );
									pigorg = integer( pigsubA );
									pigsum = pigorg + 1;
									pigstr = string(pigsum);
									con3 = substring( con2, 0, 4 ) + pigstr + substring( con2, 5, 4 );
									qr.set( 9461, con3 );
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}
									self.say( "O Pigmy gostou da comida, mas n�o botou um ovo." );
								}
							}
							else self.say( "Por favor, verifique se seu slot etc. est� vazio." );
						} 
						else self.say( "O Pigmy parece famindo... Por favor d� uma ra��o na pr�xima vez." );
					}
					else self.say( "O Pigmy � um gourmet. S� alimente-o com a #bRa��o." );
				} else {
					self.say( "O Pigmy est� satisfeito e n�o comer� mais." );
					end;
				}
			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}

/* blocked by JK 2008.08.18
//Ludiburium
script "pigmy5" {
	pigmy_reinit;

	v0 = self.askMenu( "O que voc� gostaria de fazer com o Pigmy? \r\n#b#L0# Dar Ra��o..#l\r\n#L1# Parece que o Pigmy quer dizer algo.#l" );
	if ( v0 == 0 ) {
		qr = target.questRecord;
		con = qr.get( 9460);
		con2 = qr.get( 9461);
		wTime = currentTime;

	//	self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 5,1 ) != "1" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "O Pigmy parece com fome. Voce gostaria de dar #bRa��o #kpara o Pigmy?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170005 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 5 );
								if ( ret2 >= 1 ) {
									con3 = substring( con2, 0, 5 ) + "1" + substring( con2, 6, 3 );
									qr.set( 9461, con3 );
									self.say( "A Ra��o. melhorou o humor do Pigmy! Ele botou um ovo." );
								}
								else {
									con3 = substring( con2, 0, 5 ) + "1" + substring( con2, 6, 3 );
									qr.set( 9461, con3 );
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}
									self.say( "O Pigmy gostou da comida, mas n�o botou um ovo." );
								}
							}
							else self.say( "Por favor, verifique se seu slot etc. est� vazio." );
						} 
						else self.say( "O Pigmy parece famindo... Por favor d� uma ra��o na pr�xima vez." );
					}
					else self.say( "O Pigmy � um gourmet. S� alimente-o com a #bRa��o." );
				} else {
					self.say( "O Pigmy est� satisfeito e n�o comer� mais." );
					end;
				}
			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}
*/

/* blocked by JK 2008.08.13
//Orbis
script "pigmy6" {
	pigmy_reinit;

	//if ( serverType == 2 ) {
	//	self.say( "������ ��ƿ����, ���긮��, ����Ʒε��� �Ǳ׹̷κ��͸� ���� ���� �� �ֽ��ϴ�." );
	//	end;
	//}

	v0 = self.askMenu( "O que voc� gostaria de fazer com o Pigmy? \r\n#b#L0# Dar Ra��o..#l\r\n#L1# Parece que o Pigmy quer dizer algo.#l" );
	if ( v0 == 0 ) {
		qr = target.questRecord;
		con = qr.get( 9460);
		con2 = qr.get( 9461);
		wTime = currentTime;

	//	self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 6,1 ) != "1" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "O Pigmy parece com fome. Voce gostaria de dar #bRa��o #kpara o Pigmy?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170006 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 6 );
								if ( ret2 >= 1 ) {
									con3 = substring( con2, 0, 6 ) + "1" + substring( con2, 7, 2 );
									qr.set( 9461, con3 );
									self.say( "A Ra��o. melhorou o humor do Pigmy! Ele botou um ovo." );
								}
								else {
									con3 = substring( con2, 0, 6 ) + "1" + substring( con2, 7, 2 );
									qr.set( 9461, con3 );		
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}									
									self.say( "O Pigmy gostou da comida, mas n�o botou um ovo." );
								}
							}
							else self.say( "Por favor, verifique se seu slot etc. est� vazio." );
						} 
						else self.say( "O Pigmy parece famindo... Por favor d� uma ra��o na pr�xima vez." );
					}
					else self.say( "O Pigmy � um gourmet. S� alimente-o com a #bRa��o." );
				} else {
					self.say( "O Pigmy est� satisfeito e n�o comer� mais." );
					end;
				}
			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}
*/
/* Blocked by JK 2008.08.13
//����Ʒε�
script "pigmy7" {
	pigmy_reinit;

	v0 = self.askMenu( "�Ǳ׹̿��� � �ൿ�� �Ͻðڽ��ϱ�? \r\n#b#L0# ������ ��Ḧ �ش�.#l\r\n#L1# �Ǳ׹̰� �� ���� �ִ� �� �����ϴ�.#l" );
	if ( v0 == 0 ) {
		qr = target.questRecord;
		con = qr.get( 9460);
		con2 = qr.get( 9461);
		wTime = currentTime;

	//	self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 7,1 ) != "1" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170007 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 7 );
								if ( ret2 >= 1 ) {
									con3 = substring( con2, 0, 7 ) + "1" + substring( con2, 8, 1 );
									qr.set( 9461, con3 );
									self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
								}
								else {
									con3 = substring( con2, 0, 7 ) + "1" + substring( con2, 8, 1 );
									qr.set( 9461, con3 );								
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}
									self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
								}
							}
							else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
						} 
						else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
					}
					else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
				} else {
					self.say( "�Ǳ׹̴� ��ҷ��� �� �̻� ���� �ʽ��ϴ�." );
					end;
				}

			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}


//��ƿ����
script "pigmy8" {
	pigmy_reinit;

	v0 = self.askMenu( "�Ǳ׹̿��� � �ൿ�� �Ͻðڽ��ϱ�? \r\n#b#L0# ������ ��Ḧ �ش�.#l\r\n#L1# �Ǳ׹̰� �� ���� �ִ� �� �����ϴ�.#l" );
	if ( v0 == 0 ) {
		qr = target.questRecord;
		con = qr.get( 9460);
		con2 = qr.get( 9461);
		wTime = currentTime;

		if ( target.nJob == 900 ) pigmy_master;
	//	self.say(  "dd" + substring( wTime, 0, 8 ) + " " + con2 + " " + con );

		//����Ʈ �ʱ�ȭ
		if( con == "" or con2 == "" ) {
			qr.set( 9460, substring( wTime, 0, 8 ) );
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		} else if ( con != substring( wTime, 0, 8)) {
			qr.set( 9460, substring( wTime, 0, 8));
			qr.set( 9461, "000000000" );
			con = qr.get( 9460); //�ð�
			con2 = qr.get( 9461); //�������ڵ�
		}

		if ( con != "" ) {
			if (  con == substring( wTime, 0, 8 )) {
				if ( substring( con2, 8,1 ) != "1" ) {
					inventory = target.inventory;
					if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
						ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
						if ( ret1 != 0 ) {
							nSlot = inventory.slotCount( 4 );
							nHold = inventory.holdCount( 4 );
							if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170007 ) % 100 > 0 ) ) {
								ret2 = inventory.makePigmyEgg( 2120008, 9 ); //�ؿܰ� 8�� �����Ƿ� �츮�� 9����
								if ( ret2 >= 1 ) {
									con3 = substring( con2, 0, 8 ) + "1";
									qr.set( 9461, con3 );
									if ( serverType == 2 ) {
										if ( target.nJob == 900 ) target.message( con3 );
									}
									self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
								}
								else {
									con3 = substring( con2, 0, 8 ) + "1";
									qr.set( 9461, con3 );								
									self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
								}
							}
							else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
						} 
						else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
					}
					else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
				} else {
					self.say( "�Ǳ׹̴� ��ҷ��� �� �̻� ���� �ʽ��ϴ�." );
					end;
				}

			}
		}
	} else {
		pigmy_exchange;
		end;
	}
}
*/ 

//���߶��� �Ǳ׹� ���̵�
script "pigmy_guide" {
	while (1) {
		v0 = self.askMenu( "#b<Etran, o Especialista em Pigmy>#k \r  Eu preparei um guia com informa��es detalhadas sobre o Pigmy. Isso te ajudar� a conhecer melhor os Pigmys!\r\r\n#b#L0# O que � um Pigmy?#l \r\n#b#L1# O que um Pigmy come?#l \r\n#b#L2# O que � um Ovo de Pigmy?#l" );
		if ( v0 == 0 ) {
		self.say( "O Pigmy foi criado por acidente em um dos meus experimentos m�gicos.� um animal gentil. Mas ele come MUITO..." );
		}

		if ( v0 == 1 ) {
			self.say( "O Pigmy come apenas #b#t2120008##k da Loja. Voc� precisa comprar a ra��o da Loja e alimentar o Pigmy com ela. Ah, �! O Pigmy come apenas 5 vezes ao dia.Ent�o n�o tente aliment�-lo o tempo todo." );
		}

		if ( v0 == 2 ) {
			self.say( "#bO Ovo de Pigmy#k � um ovo que foi criado pelo Pigmy. #bAlimentar o Pigmy pode melhorar seu humor e faz�-lo botar ovos.#kExistem muitas coisas interessantes neste ovo. Mas voc� s� conseguir� quebrar a casca com um instrumento especial.Para abrir o Ovo de Pigmy, #bvoc� ter� que comprar uma incubadora#k da aba etc. na Loja de Itens." );
		}
	}
}







/*
// ��׽ý�
script "pigmy0" {
	if ( compareTime( "06/05/11/09/00", currentTime ) >= 0 ) {
		inventory = target.inventory;
		if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
			ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
			if ( ret1 != 0 ) {
				nSlot = inventory.slotCount( 4 );
				nHold = inventory.holdCount( 4 );
				if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170000 ) % 100 > 0 ) ) {
					ret2 = inventory.makePigmyEgg( 2120008, 0 );
					if ( ret2 >= 1 ) self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
					else self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
				}
				else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
			} 
			else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
		}
		else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
	}
}

//�����Ͼ�
script "pigmy1" {
	if ( compareTime( "06/05/11/09/00", currentTime ) >= 0 ) {
		inventory = target.inventory;
		if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
			ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
			if ( ret1 != 0 ) {
				nSlot = inventory.slotCount( 4 );
				nHold = inventory.holdCount( 4 );
				if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170001 ) % 100 > 0 ) ) {
					ret2 = inventory.makePigmyEgg( 2120008, 1 );
					if ( ret2 >= 1 ) self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
					else self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
				}
				else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
			} 
			else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
		}
		else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
	}
}

//Ŀ�׽�Ƽ
script "pigmy2" {
	if ( compareTime( "06/05/11/09/00", currentTime ) >= 0 ) {
		inventory = target.inventory;
		if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
			ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
			if ( ret1 != 0 ) {
				nSlot = inventory.slotCount( 4 );
				nHold = inventory.holdCount( 4 );
				if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170002 ) % 100 > 0 ) ) {
					ret2 = inventory.makePigmyEgg( 2120008, 2 );
					if ( ret2 >= 1 ) self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
					else self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
				}
				else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
			} 
			else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
		}
		else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
	}
}

//�丮��
script "pigmy3" {
	if ( compareTime( "06/05/11/09/00", currentTime ) >= 0 ) {
		inventory = target.inventory;
		if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
			ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
			if ( ret1 != 0 ) {
				nSlot = inventory.slotCount( 4 );
				nHold = inventory.holdCount( 4 );
				if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170003 ) % 100 > 0 ) ) {
					ret2 = inventory.makePigmyEgg( 2120008, 3 );
					if ( ret2 >= 1 ) self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
					else self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
				}
				else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
			} 
			else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
		}
		else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
	}
}

//������
script "pigmy4" {
	if ( compareTime( "06/05/11/09/00", currentTime ) >= 0 ) {
		inventory = target.inventory;
		if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
			ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
			if ( ret1 != 0 ) {
				nSlot = inventory.slotCount( 4 );
				nHold = inventory.holdCount( 4 );
				if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170004 ) % 100 > 0 ) ) {
					ret2 = inventory.makePigmyEgg( 2120008, 4 );
					if ( ret2 >= 1 ) self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
					else self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
				}
				else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
			} 
			else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
		}
		else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
	}
}


//���긮��
script "pigmy5" {
	if ( compareTime( "06/05/11/09/00", currentTime ) >= 0 ) {
		inventory = target.inventory;
		if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
			ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
			if ( ret1 != 0 ) {
				nSlot = inventory.slotCount( 4 );
				nHold = inventory.holdCount( 4 );
				if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170005 ) % 100 > 0 ) ) {
					ret2 = inventory.makePigmyEgg( 2120008, 5 );
					if ( ret2 >= 1 ) self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
					else self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
				}
				else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
			} 
			else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
		}
		else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
	}
}

//������
script "pigmy6" {
	if ( compareTime( "06/05/11/09/00", currentTime ) >= 0 ) {
		inventory = target.inventory;
		if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
			ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
			if ( ret1 != 0 ) {
				nSlot = inventory.slotCount( 4 );
				nHold = inventory.holdCount( 4 );
				if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170006 ) % 100 > 0 ) ) {
					ret2 = inventory.makePigmyEgg( 2120008, 6 );
					if ( ret2 >= 1 ) self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
					else self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
				}
				else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
			} 
			else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
		}
		else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
	}
}

//����Ʒε�
script "pigmy7" {
	if ( compareTime( "06/05/11/09/00", currentTime ) >= 0 ) {
		inventory = target.inventory;
		if ( inventory.itemCount( 2120008 ) >= 1 ) {		// ���ִ� ��� ID
			ret1 = self.askYesNo( "�Ǳ׹̰� ����� �� �����ϴ�. �Ϳ��� �Ǳ׹̰� �����ϴ� #b������ ���#k�� �ְڽ��ϱ�?" );
			if ( ret1 != 0 ) {
				nSlot = inventory.slotCount( 4 );
				nHold = inventory.holdCount( 4 );
				if ( nSlot > nHold or ( nSlot == nHold and inventory.itemCount( 4170007 ) % 100 > 0 ) ) {
					ret2 = inventory.makePigmyEgg( 2120008, 7 );
					if ( ret2 >= 1 ) self.say( "�Ǳ׹̰� ���ִ� ���� �԰� ����� ���Ҵ��� ���� ���ҽ��ϴ�." );
					else self.say( "�Ǳ׹̰� ���ְ� ��Ḧ �Ծ����� ���� ���� �ʾҽ��ϴ�." );
				}
				else self.say( "��Ÿâ�� ��� �ִ��� Ȯ�����ּ���." );
			} 
			else self.say( "�Ǳ׹̰� ���� ����� �� �������� ������ �������� �� ���� ���� �ּ���." );
		}
		else self.say( "�Ǳ׹̴� �ƹ� ���̳� ���� �ʽ��ϴ�. #b�� ���� ���#k�� �ִ��� Ȯ�����ּ���." );
	}
}

//���߶��� �Ǳ׹� ���̵�
script "pigmy_guide" {
	if ( compareTime( "06/05/11/09/00", currentTime ) >= 0 ) {
		while (1) {
			v0 = self.askMenu( "#b<���߶��� �Ǳ׹� ���̵�>#k \r �ȳ�! ���� ���߶��̾�. �������� ���� �Ǳ׹̿� ���� �������� ������ �����߾�. �ñ��� ���� ������ �ѹ� õõ�� �о���~ \r\r\n#b#L0# ��ȯ�� �Ǳ׹̰� �����ΰ���?#l \r\n#b#L1# ��ȯ�� �Ǳ׹̴� ������ �Գ���?#l \r\n#b#L2# �Ǳ׹� ���״� �����ΰ���?#l" );

			if ( v0 == 0 ) {
				self.say( "��ȯ�� �Ǳ׹̴� ���� ���� ������ �ϴٰ� �Ǽ��� �¾ ��ȯ����. ���ϰ� �¼��� ����ü����. ������ �ʹ� ���� �Դ´ٴ� ���� �����̶���..." );
			}

			if ( v0 == 1 ) {
				self.say( "��ȯ�� �Ǳ׹̴� ��ȭ������ �Ȱ� �ִ� #b#t2120008##k���� �Ծ�. ��ȭ������ ���̸� �����ϰ� ��ȯ�� �Ǳ׹̿��� �ָ� ��." );
			}

			if ( v0 == 2 ) {
				self.say( "#b�Ǳ׹� ����#k�� �Ǳ׹̰� ���� ���̾�. ���� ���� �ָ� ���� ��� ���Ƽ� ���� ����. #b�� �� �ӿ��� �ű��� ���ǵ��� ���� �������.#k �׷��� �� ���� ������ ���� ���� �ʹ� �ܴ��ؼ� Ư���� ��ġ ���̴� ���� ����. �Ǳ׹� ���׸� ���� ���ؼ��� #bĳ�ü��� ���� ��Ÿ ���� ���ӿ� �ִ� ��ȭ��#k��� ���� �����ؼ� �� ��ġ�� ������ ����� ��." );
			}
		}
	}
}
*/
