module "standard.s";

function party_check {
	for( i = 0 .. 5 ) {
		nLevel = target.getPartyMemberLevel( i );
		if ( nLevel == 0 ) {
			self.say( "Seu grupo n�o possui 6 membros ou nem todos est�o presentes. Desse jeito n�o d�." );
			end;
		}
	}
}

function party3_takeawayitem {
	inven = target.inventory;

	nItem = inven.itemCount( 4001044 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001044, -nItem );

	nItem = inven.itemCount( 4001045 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001045, -nItem );

	nItem = inven.itemCount( 4001046 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001046, -nItem );

	nItem = inven.itemCount( 4001047 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001047, -nItem );

	nItem = inven.itemCount( 4001048 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001048, -nItem );

	nItem = inven.itemCount( 4001049 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001049, -nItem );

	nItem = inven.itemCount( 4001050 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001050, -nItem );

	nItem = inven.itemCount( 4001051 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001051, -nItem );

	nItem = inven.itemCount( 4001052 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001052, -nItem );

	nItem = inven.itemCount( 4001053 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001053, -nItem );

	nItem = inven.itemCount( 4001054 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001054, -nItem );

	nItem = inven.itemCount( 4001055 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001055, -nItem );

	nItem = inven.itemCount( 4001056 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001056, -nItem );

	nItem = inven.itemCount( 4001057 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001057, -nItem );

	nItem = inven.itemCount( 4001058 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001058, -nItem );

	nItem = inven.itemCount( 4001059 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001059, -nItem );

	nItem = inven.itemCount( 4001060 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001060, -nItem );

	nItem = inven.itemCount( 4001061 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001061, -nItem );

	nItem = inven.itemCount( 4001062 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001062, -nItem );

	nItem = inven.itemCount( 4001063 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001063, -nItem );

	nItem = inven.itemCount( 4001074 );
	if ( nItem > 0 ) ret = inven.exchange( 0, 4001074, -nItem );

	return;
}

function( integer ) premission {
//	party_check;

	wJob = 0;
	mJob = 0;
	aJob = 0;
	tJob = 0;

	for( i = 0 .. 5 ) {
		nJob = target.getPartyMemberJob( i );

		if ( nJob >= 100 and nJob < 200 ) {
			wJob++;
		} else if ( nJob >= 200 and nJob < 300 ) {
			mJob++;
		} else if ( nJob >= 300 and nJob < 400 ) {
			aJob++;
		} else if ( nJob >= 400 and nJob < 500 ) {
			tJob++;
		}
	}

	if ( wJob > 0 and mJob > 0 and aJob > 0 and tJob > 0 ) {
		return random( 1, 4 );
	}
	return 0;
}

/*
function( integer )  premission_decision( integer mCode ) {
	party_check;

	if ( mCode >= 10 and mCode <= 13 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 110 ) {
				if ( mCode == 10 ) {
					if( nLevel >= 51 and nLevel <= 55 ) return 1;
				}
				else if ( mCode == 11 ) {
					if( nLevel >= 56 and nLevel <= 60 ) return 1;
				}
				else if ( mCode == 12 ) {
					if( nLevel >= 61 and nLevel <= 65 ) return 1;
				}
				else if ( mCode == 13 ) {
					if( nLevel >= 66 and nLevel <= 70 ) return 1;
				}
			}
		}
	} else if ( mCode >= 14 and mCode <= 17 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 120 ) {
				if ( mCode == 14 ) {
					if( nLevel >= 51 and nLevel <= 55 ) {
						return 1;
					}
				}
				else if ( mCode == 15 ) {
					if( nLevel >= 56 and nLevel <= 60 ) {
						return 1;
					}
				}
				else if ( mCode == 16 ) {
					if( nLevel >= 61 and nLevel <= 65 ) {
						return 1;
					}
				}
				else if ( mCode == 17 ) {
					if( nLevel >= 66 and nLevel <= 70 ) {
						return 1;
					}
				}
			} 
		}
	}
	else if ( mCode >= 18 and mCode <= 21 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 130 ) {
				if ( mCode == 18 ) {
					if( nLevel >= 51 and nLevel <= 55 ) {
						return 1;
					}
				}
				else if ( mCode == 19 ) {
					if( nLevel >= 56 and nLevel <= 60 ) {
						return 1;
					}
				}
				else if ( mCode == 20 ) {
					if( nLevel >= 61 and nLevel <= 65 ) {
						return 1;
					}
				}
				else if ( mCode == 21 ) {
					if( nLevel >= 66 and nLevel <= 70 ) {
						return 1;
					}
				}
			}
		}
	}
	else if ( mCode >= 22 and mCode <= 25 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 210 ) {
				if ( mCode == 22 ) {
					if( nLevel >= 51 and nLevel <= 55 ) {
						return 1;
					}
				}
				else if ( mCode == 23 ) {
					if( nLevel >= 56 and nLevel <= 60 ) {
						return 1;
					}
				}
				else if ( mCode == 24 ) {
					if( nLevel >= 61 and nLevel <= 65 ) {
						return 1;
					}
				}
				else if ( mCode == 25 ) {
					if( nLevel >= 66 and nLevel <= 70 ) {
						return 1;
					}
				}
			}
		}
	}
	else if ( mCode >= 26 and mCode <= 29 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 220 ) {
				if ( mCode == 26 ) {
					if( nLevel >= 51 and nLevel <= 55 ) {
						return 1;
					}
				}
				else if ( mCode == 27 ) {
					if( nLevel >= 56 and nLevel <= 60 ) {
						return 1;
					}
				}
				else if ( mCode == 28 ) {
					if( nLevel >= 61 and nLevel <= 65 ) {
						return 1;
					}
				}
				else if ( mCode == 29 ) {
					if( nLevel >= 66 and nLevel <= 70 ) {
						return 1;
					}
				}
			}
		}
	}
	else if ( mCode >= 30 and mCode <= 33 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 230 ) {
				if ( mCode == 30 ) {
					if( nLevel >= 51 and nLevel <= 55 ) {
						return 1;
					}
				}
				else if ( mCode == 31 ) {
					if( nLevel >= 56 and nLevel <= 60 ) {
						return 1;
					}
				}
				else if ( mCode == 32 ) {
					if( nLevel >= 61 and nLevel <= 65 ) {
						return 1;
					}
				}
				else if ( mCode == 33 ) {
					if( nLevel >= 66 and nLevel <= 70 ) {
						return 1;
					}
				}
			}
		}
	}
	else if ( mCode >= 34 and mCode <= 37 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 310 ) {
				if ( mCode == 34 ) {
					if( nLevel >= 51 and nLevel <= 55 ) {
						return 1;
					}
				}
				else if ( mCode == 35 ) {
					if( nLevel >= 56 and nLevel <= 60 ) {
						return 1;
					}
				}
				else if ( mCode == 36 ) {
					if( nLevel >= 61 and nLevel <= 65 ) {
						return 1;
					}
				}
				else if ( mCode == 37 ) {
					if( nLevel >= 66 and nLevel <= 70 ) {
						return 1;
					}
				}
			}
		}
	}
	else if ( mCode >= 38 and mCode <= 41 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 320 ) {
				if ( mCode == 38 ) {
					if( nLevel >= 51 and nLevel <= 55 ) {
						return 1;
					}
				}
				else if ( mCode == 39 ) {
					if( nLevel >= 56 and nLevel <= 60 ) {
						return 1;
					}
				}
				else if ( mCode == 40 ) {
					if( nLevel >= 61 and nLevel <= 65 ) {
						return 1;
					}
				}
				else if ( mCode == 41 ) {
					if( nLevel >= 66 and nLevel <= 70 ) {
						return 1;
					}
				}
			}
		}
	}
	else if ( mCode >= 42 and mCode <= 45 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 410 ) {
				if ( mCode == 42 ) {
					if( nLevel >= 51 and nLevel <= 55 ) {
						return 1;
					}
				}
				else if ( mCode == 43 ) {
					if( nLevel >= 56 and nLevel <= 60 ) {
						return 1;
					}
				}
				else if ( mCode == 44 ) {
					if( nLevel >= 61 and nLevel <= 65 ) {
						return 1;
					}
				}
				else if ( mCode == 45 ) {
					if( nLevel >= 66 and nLevel <= 70 ) {
						return 1;
					}
				}
			}
		}
	}
	else if ( mCode >= 46 and mCode <= 49 ) {
		for( i = 0 .. 5 ) {
			nLevel = target.getPartyMemberLevel( i );
			nJob = target.getPartyMemberJob( i );

			if ( nJob == 420 ) {
				if ( mCode == 46 ) {
					if( nLevel >= 51 and nLevel <= 55 ) {
						return 1;
					}
				}
				else if ( mCode == 47 ) {
					if( nLevel >= 56 and nLevel <= 60 ) {
						return 1;
					}
				}
				else if ( mCode == 48 ) {
					if( nLevel >= 61 and nLevel <= 65 ) {
						return 1;
					}
				}
				else if ( mCode == 49 ) {
					if( nLevel >= 66 and nLevel <= 70 ) {
						return 1;
					}
				}
			}
		}
	}
	return 2;
}

//�����̼�����
function( integer ) premission( integer nNum ) {
	if ( nNum == 10 ) {
		job = "������";
		level = "51~55";
	} else if ( nNum == 11 ) {
		job = "������";
		level = "56~60";
	} else if ( nNum == 12 ) {
		job = "������";
		level = "61~65";
	} else if ( nNum == 13 ) {
		job = "������";
		level = "66~70";
	}
	else if ( nNum == 14 ) {
		job = "������";
		level = "51~55";
	} else if ( nNum == 15 ) {
		job ="������";
		level = "56~60";
	} else if ( nNum == 16 ) {
		job ="������";
		level = "61~65";
	} else if ( nNum == 17 ) {
		job = "������";
		level = "66~70";
	}
	else if ( nNum == 18 ) {
		job = "���Ǿ��";
		level = "51~55";
	} else if ( nNum == 19 ) {
		job = "���Ǿ��";
		level = "56~60";
	} else if ( nNum == 20 ) {
		job = "���Ǿ��";
		level = "61~65";
	} else if ( nNum == 21 ) {
		job = "���Ǿ��";
		level = "66~70";
	}
	else if ( nNum == 22 ) {
		job = "���ڵ�(��/��)";
		level = "51~55";
	} else if ( nNum == 23 ) {
		job = "���ڵ�(��/��)";
		level = "56~60";
	} else if ( nNum == 24 ) {
		job = "���ڵ�(��/��)";
		level = "61~65";
	} else if ( nNum == 25 ) {
		job = "���ڵ�(��/��)";
		level = "66~70";
	}
	else if ( nNum == 26 ) {
		job = "���ڵ�(����/����)";
		level = "51~55";
	} else if ( nNum == 27 ) {
		job = "���ڵ�(����/����)";
		level = "56~60";
	} else if ( nNum == 28 ) {
		job = "���ڵ�(����/����)";
		level = "61~65";
	} else if ( nNum == 29 ) {
		job = "���ڵ�(����/����)";
		level = "66~70";
	}
	else if ( nNum == 30 ) {
		job = "Ŭ����";
		level = "51~55";
	} else if ( nNum == 31 ) {
		job = "Ŭ����";
		level = "56~60";
	} else if ( nNum == 32 ) {
		job = "Ŭ����";
		level = "61~65";
	} else if ( nNum == 33 ) {
		job = "Ŭ����";
		level = "66~70";
	}
	else if ( nNum == 34 ) {
		job = "����";
		level = "51~55";
	} else if ( nNum == 35 ) {
		job = "����";
		level = "56~60";
	} else if ( nNum == 36 ) {
		job = "����";
		level = "61~65";
	} else if ( nNum == 37 ) {
		job = "����";
		level = "66~70";
	}
	else if ( nNum == 38 ) {
		job = "���";
		level = "51~55";
	} else if ( nNum == 39 ) {
		job = "���";
		level = "56~60";
	} else if ( nNum == 40 ) {
		job = "���";
		level = "61~65";
	} else if ( nNum == 41 ) {
		job = "���";
		level = "66~70";
	}
	else if ( nNum == 42 ) {
		job = "��ؽ�";
		level = "51~55";
	} else if ( nNum == 43 ) {
		job = "��ؽ�";
		level = "56~60";
	} else if ( nNum == 44 ) {
		job = "��ؽ�";
		level = "61~65";
	} else if ( nNum == 45 ) {
		job = "��ؽ�";
		level = "66~70";
	}
	else if ( nNum == 46 ) {
		job = "����";
		level = "51~55";
	} else if ( nNum == 47 ) {
		job = "����";
		level = "56~60";
	} else if ( nNum == 48 ) {
		job = "����";
		level = "61~65";
	} else if ( nNum == 49 ) {
		job = "����";
		level = "66~70";
	}
	v0 = self.askYesNo( "������ #b" + job + "#k, ������ #b" + level + "#k �� ģ���� ��Ƽ�� �������Ѻ��ھ�? ���� ���� ���� �������� ����.\r\n������ ������ ���̴ϱ� �� �� �ʿ�� ����. ���� �׳� �����ϰ� �ʹٸ� �ƴϿ��� �����ϸ� ��." );
	if ( v0 == 0 ) {
		return 0;
	} else {
		result = premission_decision( nNum );
		if  ( result == 0 ) {
			return 0;
		} else if ( result == 1 ) {
			rNum = random( 0, 3 );
			if ( rNum == 0 ) {
//				self.say( "�Ϳ�~ ����ѵ�? ���� ���� ��� �� �����. #b������ �� 30�а� ���ݷ�, ���� ��� ����#k�� �ɾ��ٰ�. ������ ������ ã�µ� ������ �ɰž�." );
				return 1;
			} else if ( rNum == 1 ) {
//				self.say( "�Ϳ�~ ����ѵ�? ���� ���� ��� �� �����. #b������ �� 30�а� ��������, �������� ��� ����#k�� �ɾ��ٰ�. ������ ������ ã�µ� ������ �ɰž�." );
				return 2;
			} else if ( rNum == 2 ) {
//				self.say( "�Ϳ�~ ����ѵ�? ���� ���� ��� �� �����. #b������ �� 30�а� �̵��ӵ�, ������ ��� ����#k�� �ɾ��ٰ�. ������ ������ ã�µ� ������ �ɰž�." );
				return 3;
			} else if ( rNum == 3 ) {
//				self.say( "�Ϳ�~ ����ѵ�? ���� ���� ��� �� �����. #b������ �� 30�а� ������, ȸ���� ��� ����#k�� �ɾ��ٰ�. ������ ������ ã�µ� ������ �ɰž�." );
				return 4;
			} 
		} else if ( result == 2 ) {
			self.say( "�̼��� �������� ���߰ų�, ��Ƽ���� ��� �̰��� ���� �ʾ�. ������ #b" + job + "#k,  ������ #b" + level + "#k ��." );
			end;
		}
	}
	return -1;
}
*/

//ȣ���� ������
function feellike_reward( integer like ) {
	inven = target.inventory;

	self.say( "Fico imensamente grato por voc� me dar tanta comida deliciosa. N�o � muito, mas, como n�o preciso mesmo, pode pegar. Tenha certeza de que seu invent�rio possui pelo menos um slot livre!" );

	if ( like >= 100 and like < 200 ) {
		num = random( 1, 100 );
		if  ( num >= 1 and num <= 20 ) {
			ret = inven.exchange( 0, 2020013, 1 );
		} else if ( num >= 21 and num <= 40 ) {
			ret = inven.exchange( 0, 2020014, 1 );
		} else if ( num >= 41 and num <= 42 ) {
			ret = inven.exchange( 0, 2040708, 1 );//���̼�10
		} else if ( num >= 43 and num <= 60 ) {
			ret = inven.exchange( 0, 2020015, 1 ); //Ȳȥ�̽�
		} else if ( num >= 61 and num <= 80 ) {
			ret = inven.exchange( 0, 2000002, 5 );
		} else {
			ret = inven.exchange( 0, 2000002, 10 );
		}
		if ( ret == 0 ) {
			self.say( "Infelizmente, seu invent�rio de uso est� cheio e n�o pode receber a recompensa. Libere espa�o da pr�xima vez." );
			end;
		}
	}
	else if ( like >= 200 and like < 300 ) {
		num = random( 1, 50 );
		if  ( num >= 1 and num <= 10 ) {
			ret = inven.exchange( 0, 2020013, 1 ); //�ŷ�
		} else if ( num >= 11 and num <= 20 ) {
			ret = inven.exchange( 0, 2020014, 1 );
		} else if ( num == 21  ) {
			ret = inven.exchange( 0, 2040708, 1 ); // ���̼� 10
		} else if ( num == 22 ) {
			ret = inven.exchange( 0, 2040707, 1 ); // ���̼� 60
		} else if ( num >= 23 and num <= 30 ) {
			ret = inven.exchange( 0, 2020015, 1 );
		} else if ( num >= 31 ) {
			ret = inven.exchange( 0, 2000002, 10 );
		}
		if ( ret == 0 ) {
			self.say( "Infelizmente, seu invent�rio de uso est� cheio e n�o pode receber a recompensa. Libere espa�o da pr�xima vez." );
			end;
		}
	}
	else if ( like >= 300 and like <= 400 ) {
		num = random( 1, 100 );
		if  ( num >= 1 and num <= 20 ) {
			ret = inven.exchange( 0, 2020013, 1 ); //�ŷ��� ����
		} else if ( num >= 20 and num <= 40 ) {
			ret = inven.exchange( 0, 2020014, 1 ); //������ �̽�
		} else if ( num >= 21 and num <= 22 ) {
			ret = inven.exchange( 0, 2040707, 1 ); //���̼� 60
		} else if ( num >= 22 and num <= 24 ) {
			ret = inven.exchange( 0, 2040708, 1 ); //���̼� 10
		} else if ( num >= 25 and num <= 50 ) {
			ret = inven.exchange( 0, 2020015, 15 );
		} else {
			ret = inven.exchange( 0, 2000002, 10 );
		}
		if ( ret == 0 ) {
			self.say( "Infelizmente, seu invent�rio de uso est� cheio e n�o pode receber a recompensa. Libere espa�o da pr�xima vez." );
			end;
		}
	}
	return;
}

function( integer ) food_code( integer code ) {
	if ( code == 2 ) return 2022001;
	if ( code == 3 ) return 2020004;
	if ( code == 4 ) return 2022003;
	if ( code == 5 ) return 2001001;
	if ( code == 6 ) return 2020028;
	if ( code == 7 ) return 2001002;	
	return 2020001;
}

//���� ���� ������ ������
function( integer ) ate_food( integer code ) {
	qr = target.questRecord;
	val = qr.get( 7522 );

	food1 = integer( substring( val, 3, 1 ));
	food2 = integer( substring( val, 4, 1 ));
	food3 = integer( substring( val, 5, 1 ));
	food4 = integer( substring( val, 6, 1 ));

	val2 = substring( val, 0, 3) + substring( val, 4, 3 ) + string( code );
	qr.set( 7522, val2 );

	if ( food1 == code and food2 == code and food3 == code and food4 == code ) {
		self.say( "#b#t" + food_code( code ) + "##k, de novo? Adoro comer isto, mas j� estou come�ando a enjoar..." );
		return 2;
	} else if ( food2 == code and food3 == code and food4 == code ) {
		self.say( "#b#t" + food_code( code ) + "##k � uma del�cia, mas agora quero comer outra coisa." );
		if ( code == 1 ) return 1;
		if ( code == 2 ) return 3;
		if ( code == 3 ) return 3;
		if ( code == 4 ) return 7;
		if ( code == 5 ) return 20;
		if ( code == 6 ) return 26;
		if ( code == 7 ) return 30;
	} else if ( food3 == code and food4 == code ) {
		self.say( "Oh~... Eu sabia, isto #b#t" + food_code( code ) + "##k � mesmo muito bom!" );
		if ( code == 1 ) return 2;
		if ( code == 2 ) return 4;
		if ( code == 3 ) return 4;
		if ( code == 4 ) return 10;
		if ( code == 5 ) return 27;
		if ( code == 6 ) return 32;
		if ( code == 7 ) return 40;
	} else if ( food4 == code ) {
		self.say( "Oh~... Eu sabia, isto #b#t" + food_code( code ) + "##k � mesmo muito bom!" );
		if ( code == 1 ) return 2;
		if ( code == 2 ) return 5;
		if ( code == 3 ) return 5;
		if ( code == 4 ) return 13;
		if ( code == 5 ) return 30;
		if ( code == 6 ) return 40;
		if ( code == 7 ) return 50;
	} else if ( food1 != code and food2 != code and food3 != code and food4 != code ) {
		self.say( "Uau, isto n�o � #b#t" + food_code( code ) + "##k ??? Comida nova: Sempre � bem-vinda!" );
		if ( code == 1 ) return 4;
		if ( code == 2 ) return 8;
		if ( code == 3 ) return 8;
		if ( code == 4 ) return 19;
		if ( code == 5 ) return 39;
		if ( code == 6 ) return 50;
		if ( code == 7 ) return 69;
	}	
	else {
		if ( code == 1 ) {
			self.say( "Oba!~ #bGalinha#k!! N�o h� nada como uma galinha frita, crocante por fora e macia por dentro." );
			return 3;
		} else if ( code == 2 ) {
			self.say( "Oba!~ #b#t2022001##k!!! T�o doce e delicioso! Fico radiante comendo isto." );
			return 6;
		} else if ( code == 3 ) {
			self.say( "Oba!~ Meu favorito, #bHamb�rguer#k! Olhe estes hamb�rgueres!  Eles n�o parecem ser fant�sticos?" );
			return 6;
		} else if ( code == 4 ) {
			self.say( "Oba!~ #bUnagi#k!! Unagi com molho doce... mmm... experimente~" );
			return 16;
		} else if ( code == 5 ) {
			self.say( "Oba!~ Um destes #bSorvetes Pop#k com certeza vai congelar o calor do ver�o! Muito frio!!" );
			return 36;
		} else if ( code == 6 ) {
			self.say( "Oba!~ � o #bChocolate#k com toda a do�ura que invade meu corpo. Demais! Prove um voc� tamb�m!" );
			return 47;
		} else if ( code == 7 ) {
			self.say( "Oba! � o delicioso #bSundae de Feij�o Vermelho#k! Um bloco de gelo picado com feij�es vermelhos e frutas em cima... mmmm... t�o gelado que minha boca est� quase congelando!!" );
			return 65;
		}
	}
	return 0;
}

//ȣ����ó��
function feellike( integer item ) {
	qr = target.questRecord;
	cTime = currentTime;

	if ( qr.get( 7523 ) == "" ) {
		lTime = cTime;
		qr.set( 7523, lTime );
	} else lTime = qr.get( 7523 );

//	say = lTime;
//	target.message( say );

	val2 = qr.get( 7522 );

	if ( val2 == "" ) {
		val2 = "1000000";
		qr.set( 7522, val2 );
	}
	
	like = integer( substring( val2, 0, 3 ) );

	if ( lTime != cTime ) {
		tTime = compareTime( cTime, lTime );
		if ( tTime > 5040 ) {
			if ( like >= 130 ) {
				like = like - 30;
			} else {
				like = 100;
			}
		}
	}

	qr.set( 7523, cTime );

	if ( item == 1 ) {
		v0 = random( 1, 100 );
		v1 = ate_food( 1 );
		if ( v0 >= 1 and v0 <= v1 ) {
			target.message( "Wonky est� se sentindo �timo depois de ter comido uma galinha." );
			if ( random( 1, 20 ) == 1 ) {
				feellike_reward( like );
			}
			like = like + 5;
		} else {
			target.message( "Wonky se delicia comendo a galinha." );
			like = like + 1;
		}
	} else if ( item == 2 ) {
		v1 = ate_food( 2 );
		v0 = random( 1, 100 );
		if ( v0 >= 1 and v0 <= v1 ) {
			target.message( "Wnky est� se sentindo �timo depois de ter comido uma tigela de mingau vermelho." );
			if ( random( 1, 20 ) == 1 ) {
				feellike_reward( like );
			}
			like = like + 5;
		} else {
			target.message( "Wonky se delicia comendo uma tigela de mingau vermelho." );
			like = like + 1;
		}
	} else if ( item == 3 ) {
		v1 = ate_food( 3 );
		v0 = random( 1, 100 );
		if ( v0 >= 1 and v0 <= v1 ) {
			target.message( "Wonky est� se sentindo �timo depois de ter comido um hamb�rguer." );
			if ( random( 1, 20 ) == 1 ) {
				feellike_reward( like );
			}
			like = like + 5;
		} else {
			target.message( "Wonky se delicia comendo um hamb�rguer." );
			like = like + 1;
		}
	} else if ( item == 4 ) {
		v1 = ate_food( 4 );
		v0 = random( 1, 100 );
		if ( v0 >= 1 and v0 <= v1 ) {
			target.message( "Wonky est� se sentindo �timo depois de ter comido uma Unagi." );
			if ( random( 1, 20 ) == 1 ) {
				feellike_reward( like );
			}
			like = like + 5;
		} else {
			target.message( "Wonky se delicia comendo uma Unagi." );
			like = like + 2;
		}
	} else if ( item == 5 ) {
		v1 = ate_food( 5 );
		v0 = random( 1, 100 );
		if ( v0 >= 1 and v0 <= v1 ) {
			target.message( "Wonky est� se sentindo �timo depois de ter chupado um Sorvete Pop." );
			if ( random( 1, 20 ) == 1 ) {
				feellike_reward( like );
			}
			like = like + 5;
		} else {
			target.message( "Wonky se delicia chupando um Sorvete Pop." );
			like = like + 2;
		}
	} else if ( item == 6 ) {
		v1 = ate_food( 6 );
		v0 = random( 1, 100 );
		if ( v0 >= 1 and v0 <= v1 ) {
			target.message( "Wonky est� se sentindo �timo depois de ter comido um Chocolate." );
			if ( random( 1, 20 ) == 1 ) {
				feellike_reward( like );
			}
			like = like + 5;
		} else {
			target.message( "Wonky se delicia comendo um Chocolate." );
			like = like + 2;
		}
	} else if ( item == 7 ) {
		v1 = ate_food( 7 );
		v0 = random( 1, 100 );
		if ( v0 >= 1 and v0 <= v1 ) {
			target.message( "Wonky est� se sentindo �timo depois de ter comido um Sundae de Feij�es vermelhos gelado." );
			if ( random( 1, 20 ) == 1 ) {
				feellike_reward( like );
			}
			like = like + 5;
		} else {
			target.message( "Wonky se delicia comendo um Sundae de Feij�es vermelhos gelado." );
			like = like + 3;
		}
	} 
	else if ( item == -1 ) {
		if ( like >= 103 ) {
			target.message( "O humor de Wonky azedou." );
			like = like - 3 ;
		} else {
			target.message( "O humor de Wonky azedou." );
			like = 100;
		}
	}

	if ( like > 500 ) {
		like = 500;
	} else if ( like < 100 ) {
		like = 100;
	}

	if ( item != -1 ) {
		food = substring( val2, 4, 3) + string( item );
		result = string( like ) + food;
		qr.set( 7522, result );
	} else {
		food = substring( val2, 3, 4 );
		result = string( like ) + food;
		qr.set( 7522, result );
	}

//	say = qr.get( 7522 );
//	target.message( say );
}

//Ŭ����̼� ����
function clearmission2( integer nNum ) {
	quest = FieldSet( "Party5" );
	if ( nNum == 1 ) {
		v0 = self.askYesNo( "Voc� pode me fazer um favor? Tente completar a #bMiss�o do Grupo<Tra�os da Deusa>#k em menos de 25 minutos. Estou faminto, sabe. Se puder fazer isto, eu vou dar a voc� algum EXP extra." );
		if( v0 == 0 ) {
			self.say( "AH, entendo. Azar meu, mas entendo. Pe�o uma outra hora~" );
			quest.setVar( "cMission", "0" );			
		} else {
			quest.setVar( "cMission", "1" );
			say = "Voc� precisa terminar <Miss�o> Miss�o do Grupo <Tra�os da Deusa> em menos de 25 minutos!";
			quest.broadcastMsg( 6, say );
			self.say( "Certo! O tempo est� passando enquanto falamos. Complete a miss�o!" );
		} 
	} else if ( nNum == 2 ) {
		v0 = self.askYesNo( "Voc� pode me fazer um favor? Fa�a a #bMiss�o do Grupo<Tra�os da Deusa>#k e consiga para mim 8 #bSementes Estranhas#k?\r\nAinda n�o encontrei uma comida que nunca tenha experimentado, mas realmente n�o fa�o id�ia do gosto destas #bSementes Estranhas#k ~ Quero muito provar isso. E lembre-se de que � o l�der do grupo quem deve me entregar." );
		if ( v0 == 0 ) {
			self.say( "AH, entendo. Azar meu, mas entendo. Pe�o uma outra hora~" );
			quest.setVar( "cMission", "0" );			
		} else {
			quest.setVar( "cMission", "2" );
			say = "<Miss�o> Junte pelo menos 8 Sementes Estranhas!";
			quest.broadcastMsg( 6, say );
			self.say( "Certo, a� est�o as 8 #bSementes Estranhas#k~ Certifique-se de que o l�der do grupo entregue todas!" );
		}
	} else if ( nNum == 3 ) {
		v0 = self.askYesNo( "Voc� pode me fazer um favor? Fa�a a #bMiss�o do Grupo<Tra�os da Deusa>#k e consiga para mim os #bLP's#k? Eu preciso de apenas 6. E lembre-se de que � o l�der do grupo quem deve me entregar." );
		if ( v0 == 0 ) {
			self.say( "AH, entendo. Azar meu, mas entendo. Pe�o uma outra hora~" );
			quest.setVar( "cMission", "0" );			
		} else {
			quest.setVar( "cMission", "3" );
			say = "<Miss�o> Junte 6 LP�s de m�sicas variadas!";
			quest.broadcastMsg( 6, say );
			self.say( "Certo, aqui est�o os 6 #bLP's#k~ Eu n�o ligo para o tipo, mas o l�der do grupo precisa me entregar todos!" );
		}
	} else if ( nNum == 4 ) {
		v0 = self.askYesNo( "Voc� pode me fazer um favor? Voc� poderia eliminar #bLuinels#k na Torre da Deusa?" );
		if ( v0 == 0 ) {
			self.say( "AH, entendo. Azar meu, mas entendo. Pe�o uma outra hora~" );
			quest.setVar( "cMission", "0" );			
		} else {
			quest.setVar( "cMission", "4" );
			say = "<Miss�o> Elimine os Luinels!";
			quest.broadcastMsg( 6, say );
			self.say( "Certo! Voc� precisa eliminar CADA UM DELES!" );
		}
	} else if ( nNum == 5 ) {
		v0 = self.askYesNo( "Voc� pode me fazer um favor? Voc� poderia eliminar #bCellion, Lioner Jr. e Grupin Jr.#k na Torre da Deusa?" );
		if ( v0 == 0 ) {
			self.say( "AH, entendo. Azar meu, mas entendo. Pe�o uma outra hora~" );
			quest.setVar( "cMission", "0" );			
		} else {
			quest.setVar( "cMission", "5" );
			say = "<Miss�o> Por favor, elimine Cellion Jr., Lioner Jr. e Grupin Jr!";
			quest.broadcastMsg( 6, say );
			self.say( "Certo! Voc� precisa eliminar CADA UM DELES!" );
		}
	} 
	return;
}

//Ŭ����̼� ������
function cMission_reward( integer code ) {
	quest = FieldSet( "Party5" );

	if ( code == 1 ) {
		cleartime = quest.getQuestTime;
//		say = " dd " + string ( cleartime );
//		target.message( say );
		if ( cleartime < 1504 ) {
			say = "<Miss�o Completa> EXP adicional como recompensa por completar a miss�o dentro de 25 minutos.";
			quest.broadcastMsg( 6, say );
			quest.incExpAll( 10000 );
		}
	} else if ( code == 2 ) {
		inven = target.inventory;
		nItem = inven.itemCount( 4001053 );
		if (  nItem >= 8 ) {
//			ret = inven.exchange( 0, 4001053, -nItem );
			say = "<Miss�o Completa> EXP adicional como recompensa por coletar as 8 Sementes Estranhas com sucesso.";
			quest.broadcastMsg( 6, say );
			quest.incExpAll( 5000 );
		}
	} else if ( code == 3 ) {
		inven = target.inventory;
		nItem = inven.itemCount( 4001056 ) + inven.itemCount( 4001057 ) + inven.itemCount( 4001058 )+ inven.itemCount( 4001059 ) + inven.itemCount( 4001060 ) +  inven.itemCount( 4001061 ) + inven.itemCount( 4001062 );
		if ( nItem >= 6 ) {
			say = "<Miss�o Completa> EXP adicional como recompensa por coletar os 6 LP�s.";
			quest.broadcastMsg( 6, say );
			quest.incExpAll( 6000 );
		}
	} else if ( code == 4 ) {
		mNum =  Field( 920010910 ).getMobCount( 9300044 ) + Field( 920010920 ).getMobCount( 9300044 ) + Field( 920010930 ).getMobCount( 9300044 );
		if ( mNum == 0 ) {
			say = "<Miss�o Completa> EXP adicional como recompensa por eliminar Luinel com sucesso.";
			quest.broadcastMsg( 6, say );
			quest.incExpAll( 8000 );
		}
	} else if ( code == 5 ) {
		mNum =  Field( 920011000 ).getMobCount( 9300051 ) + Field( 920011000 ).getMobCount( 9300052 ) + Field( 920011000 ).getMobCount( 9300053 );
		if ( mNum == 0 ) {
			say = "<Miss�o Completa> EXP adicional como recompensa por eliminar Cellion Jr., Grupon Jr. e Lioner Jr. com sucesso!";
			quest.broadcastMsg( 6, say );
			quest.incExpAll( 5000 );
		}
	}
	return;
}

//Ŭ���� �̼� �ߵ�
function clearmission {
	qr = target.questRecord;
	quest = FieldSet( "Party5" );
	val = qr.get( 7522 );
	
	if ( quest.getVar( "cMission" ) == "" ) {
		like = integer( substring( val, 0, 3 ) );
		v0 = random( 1, 15 );
		if ( like >= 100 and like < 200 ) {
			if ( v0 >= 1 and v0 <= 3 ) {
				v1 = random( 1, 5 );
				clearmission2( v1 );
			}
		}
		else if ( like >= 200 and like < 300 ) {
			if ( v0 >= 1 and v0 <= 5 ) {
				v1 = random( 1, 5 );
				clearmission2( v1 );
			}
		}
		else if ( like >= 300 and like <= 400 ) {
			if ( v0 >= 1 and v0 <= 8 ) {
				v1 = random( 1, 5 );
				clearmission2( v1 );
			}
		}
	}
	return;
}

//��Ű
script "party3_enter" {
/* blocked by jk 20080730
	field = self.field;
	qr = target.questRecord;
//	val = qr.get( 7521 );
	val2 = qr.get( 7522 );

	if ( val2 == "" ) {
		val2 = "1000000";
		val3 = currentTime;
		qr.set( 7522, val2 );
		qr.set( 7523, val3 );
	}

	//�����
	if ( field.id == 200080101 ) {
		while (1) {
//			v0 = self.askMenu( "�ȳ�? �� ���� ��Ű��� ��. ������ ž�� �����ϰ� ������ ������ �̾߱� �϶��~ \r\n#b#L0# ������ ��û�Ѵ�.#l\r\n#L1# ������ ž�� ���� ���´�.\r\n#L2# ��Ű���� ���� ���� �ش�.#l" );
			if ( integer( substring( val2, 0, 3)) >= 100 and integer( substring( val2, 0, 3 ) ) < 200 ) {
			v0 = self.askMenu( "Ol�! Sou a Fada Wonky. Voc� quer explorar a Torre da Deusa? Ali�s, se seu grupo tiver pelo menos um guerreiro, bruxo, arqueiro e gatuno, eu vou dar a voc� um pouco da B�n��o de Wonky.\r\n#b#L0# Registrar-se para Entrar.#l\r\n#L1# Perguntar sobre a Torre da Deusa.\r\n#L2# Dar a Wonky alguma coisa para comer.#l" );
			} else if ( integer( substring( val2, 0, 3)) >= 200 and integer( substring( val2, 0, 3 ) ) < 300 ) {
				v0 = self.askMenu( "Ei~~~ Bom te ver! Voc� quer explorar a Torre da Deusa? Ali�s, se seu grupo tiver pelo menos um guerreiro, bruxo, arqueiro e gatuno, eu vou dar a voc� um pouco da B�n��o de Wonky.\r\n#b#L0# Registrar-se para Entrar.#l\r\n#L1# Perguntar sobre a Torre da Deusa.\r\n#L2# Dar a Wonky alguma coisa para comer.#l" );
			} else if ( integer( substring( val2, 0, 3 ) ) >= 300 and integer( substring( val2, 0, 3 ) ) <= 400) {
				v0 = self.askMenu( "Ei, #b" + target.sCharacterName + "#k. Como est�? Ali�s, se seu grupo tiver pelo menos um guerreiro, bruxo, arqueiro e gatuno, eu vou dar a voc� um pouco da B�n��o de Wonky.\r\n#b#L0# Registrar-se para Entrar.#l\r\n#L1# Perguntar sobre a Torre da Deusa.\r\n#L2# Dar a Wonky alguma coisa para comer.#l" );
			} else {
				v0 = self.askMenu( "Ol�! Sou a Fada Wonky. Se voc� tiver interesse em explorar a Torre da Deusa, avise...#l\r\n#L1# Perguntar sobre a Torre da Deusa.\r\n#L2# Dar a Wonky alguma coisa para comer.#l" );
			}
			if ( v0 == 0 ) {
				if ( target.isPartyBoss != 1 ) {
					self.say( "Ei, preciso que o l�der do seu grupo fale comigo, ningu�m mais." );
					end;
				}
				
				mis = premission;
*/
// blocked by jk 20080730

/*
				mis = 0;
				cTime = currentTime;
				if ( val != "" ) {
					//�ð��� �ٲ�� ���ο� �̼� ����
					eTime = compareTime( cTime ,substring( val, 2, 14 ) );
					if ( eTime >= 60 ) {
						rNum = random( 10, 95 );
						result = string( rNum ) + cTime;
//						target.message( result );
						qr.set( 7521, result  );
						if ( rNum >= 10 and rNum <= 49 ) {
							mis = premission( rNum );
						} 
					//���� �̼� �缳�� �� ����
					} else {
						rNum = integer( substring( qr.get( 7521 ), 0, 2 ));
//						k = qr.get( 7521 );
//						target.message( k );
						if ( rNum >= 10 and rNum <= 49 ) {
							mis = premission( rNum );
						}
					}
				}
				//�ʱ�ȭ
				else {
					rNum = random( 10, 95 );
					result = string( rNum ) + cTime;
//					target.message( result );
					qr.set( 7521,  result );
					if ( rNum >= 10 and rNum <= 49 ) {
						mis = premission( rNum );
					} 
				}
*/		
/*blocked by jk 20080730
		
				setParty = FieldSet( "Party5" );
				res = setParty.enter( target.nCharacterID, 0 );
				if ( res == -1 ) self.say( "Tenho motivos para n�o deixar voc� entrar. Tente de novo mais tarde." );
				else if ( res == 1 ) self.say( "Voc� n�o est� no grupo. Voc� precisa estar em um grupo para fazer isto!" );
				else if ( res == 2 ) self.say( "Seu grupo n�o possui 6 membros! Preciso de 6!!" );
				else if ( res == 3 ) self.say( "Algu�m no seu grupo n�o est� entre N�veis 51 ~70. Deixe seu grupo dentro do n�vel!" );
				else if ( res == 4 ) self.say( "Um outro grupo j� entrou para completar a miss�o. Tente de novo mais tarde." );
				else {
					if ( mis == 1 ) {
						target.givePartyBuff( 2022090 );
						say = "Por realizar o pedido de Wonky, seu ATAQUE M�GICO E DE ARMA foram aumentados em 30 minutos.";
						setParty.broadcastMsg( 6, say );
					} else if ( mis == 2 ) {
						target.givePartyBuff( 2022091 );
						say = "Por realizar o pedido de Wonky, sua DEFESA M�GICA E DE ARMA foram aumentadas em 30 minutos.";
						setParty.broadcastMsg( 6, say );
					} else if ( mis == 3 ) {
						target.givePartyBuff( 2022092 );
						say = "Por realizar o pedido de Wonky, sua PRECIS�O M�GICA E DE ARMA foram aumentadas em 30 minutos.";
						setParty.broadcastMsg( 6, say );
					} else if ( mis == 4 ) {
						target.givePartyBuff( 2022093 );
						say = "Por realizar o pedido de Wonky, sua VELOCIDADE E PULO foram aumentados em 30 minutos.";
						setParty.broadcastMsg( 6, say );
					}
					
					rand_a1 = random( 1, 10 );
					rand_a2 = random( 1, 10 );
					rand_a3 = random( 1, 10 );

					if ( rand_a1 == 1 or rand_a1 == 2 ) {
						setParty.setReactorState( 16, "party3_box01", 1, 0 );
					}
					if ( rand_a2 == 3 or rand_a2 == 4 ) {
						setParty.setReactorState( 19, "party3_box02", 1, 0 );
					}
					if ( rand_a3 == 5 or rand_a3 == 6 ) {
						setParty.setReactorState( 22, "party3_box03", 1, 0 );
					}

					party3_takeawayitem;
				}
				end;
			} else if ( v0 == 1 ) {
				self.say( "H� alguns dias atr�s, depois de uma grande tempestade, um novo caminho nublado surgiu no alto da Torre de Orbis, atr�s da #best�tua da Deusa Minerva#k. As nuvens se dissiparam e uma nova e misteriosa torre surgiu." ); 
				self.say( "Conclu�mos que a torre que estamos procurando � aquela de um ser que fica por tr�s, controlando Orbis. #bDeusa Minerva#k. Tenho toda a certeza de que a #bDeusa Minerva#k est� presa em algum lugar da torre. O que voc� acha? Voc� gostaria de explorar a torre e encontrar os restos da Deusa?" );
			} else if ( v0 == 2 ) {
				inven = target.inventory;
				v1 = self.askMenu( "Ei, voc� tem algo para comer?!\r\n#b#L0# #t2020001##l\r\n#b#L1# #t2022001##l\r\n#b#L2# #t2020004##l\r\n#b#L3# #t2022003##l\r\n#b#L4# #t2001001##l\r\n#b#L5# #t2020028##l\r\n#b#L6# #t2001002##l" );
				if ( v1 == 0 ) {
					nItem = inven.itemCount( 2020001 );
					if ( nItem > 0 ) {
						ret = inven.exchange( 0, 2020001, -1 );
						if ( ret != 0 ) target.effectSound( "Grupo3/Comer" );
						else {
							target.message( "Imposs�vel comer, n�o tem galinha." );
							end;
						}
						feellike( 1 );
						end;
					} else {
						feellike( -1 );
						self.say( "O qu�? Como quer que eu coma #t2020001# se voc� n�o trouxe? Est� tentando me desafiar?" );
						end;
					}
				} else if ( v1 == 1 ) {
					nItem = inven.itemCount( 2022001 );
					if ( nItem > 0 ) {
						ret = inven.exchange( 0, 2022001, -1 );
						if ( ret != 0 ) target.effectSound( "Grupo3/Comer" );
						else {
							target.message( "Imposs�vel comer, n�o tem mingau vermelho." );
							end;
						}
						feellike( 2 );
						end;
					} else {
						feellike( -1 );
						self.say( "O qu�? Como quer que eu coma #t2022001# se voc� n�o trouxe? Est� tentando me desafiar?" );
						end;
					}
				}
				else if ( v1 == 2 ) {
					nItem = inven.itemCount( 2020004 );
					if ( nItem > 0 ) {
						ret = inven.exchange( 0, 2020004, -1 );
						if ( ret != 0 ) target.effectSound( "Grupo3/Comer" );
						else {
							target.message( "Imposs�vel comer, n�o tem hamb�rguer." );
							end;
						}
						feellike( 3 );			
						end;
					} else {
						feellike( -1 );
						self.say( "O qu�? Como quer que eu coma #t2020004# se voc� n�o trouxe? Est� tentando me desafiar?" );
						end;
					}
				}
				else if ( v1 == 3 ) {
					nItem = inven.itemCount( 2022003 );
					if ( nItem > 0 ) {
						ret = inven.exchange( 0, 2022003, -1 );
						if ( ret != 0 ) target.effectSound( "Grupo3/Comer" );
						else {
							target.message( "Imposs�vel comer, n�o tem Unagi." );
							end;
						}
						feellike( 4 );
						end;
					} else {
						feellike( -1 );
						self.say( "O qu�? Como quer que eu coma #t2022003# se voc� n�o trouxe? Est� tentando me desafiar?" );
						end;
					}
				}
				else if ( v1 == 4 ) {
					nItem = inven.itemCount( 2001001 );
					if ( nItem > 0 ) {
						ret = inven.exchange( 0, 2001001, -1 );
						if ( ret != 0 ) target.effectSound( "Grupo3/Comer" );
						else {
							target.message( "Imposs�vel comer, n�o tem Sorvete Pop." );
							end;
						}
						feellike( 5 );
						end;
					} else {
						feellike( -1 );
						self.say( "O qu�? Como quer que eu coma #t2022001# se voc� n�o trouxe? Est� tentando me desafiar?" );
						end;
					}
				}
				else if ( v1 == 5 ) {
					nItem = inven.itemCount( 2020028 );
					if ( nItem > 0 ) {
						ret = inven.exchange( 0, 2020028, -1 );
						if ( ret != 0 ) target.effectSound( "Grupo3/Comer" );
						else {
							target.message( "Imposs�vel comer, n�o tem Chocolate." );
							end;
						}
						feellike( 6 );
						end;
					} else {
						feellike( -1 );
						self.say( "O qu�? Como quer que eu coma #t2020028# se voc� n�o trouxe? Est� tentando me desafiar?" );
						end;
					}
				}
				else if ( v1 == 6 ) {
					nItem = inven.itemCount( 2001002 );
					if ( nItem > 0 ) {
						ret = inven.exchange( 0, 2001002, -1 );
						if ( ret != 0 ) target.effectSound( "Grupo3/Comer" );
						else {
							target.message( "Imposs�vel comer, n�o tem Sundae de Feij�es vermelhos." );
							end;
						}
						feellike( 7 );
						end;
					} else {
						feellike( -1 );
						self.say( "O qu�? Como quer que eu coma #t2001002# se voc� n�o trouxe? Est� tentando me desafiar?" );
						end;
					}
				}
			}
		}
	} else if ( field.id == 920010000) {
		quest = FieldSet( "Party5" );
		if ( target.isPartyBoss == 1 ) {
			if ( quest.getVar( "cm" ) != "1" ) {
				quest.setVar( "cm", "1" );
				clearmission;
			} 
			v0 = self.askYesNo( "Voc� quer sair da Miss�o do Grupo no meio e deixar este lugar? Se sair, voc� vai ter de come�ar tudo de novo..." );
		}
		if ( v0 == 0 ) self.say( "Pense bem na sua escolha e fale comigo quando tiver decidido." );
		else {
			self.say( "Tente novamente~" );
			registerTransferField( 920011200, "st00" );
		}
	}
*/ 
//blocked by jk 20080730
}



function party3_help {
	field = self.field;
	if ( field.id == 920010000 ) self.say( "N�o sei o que dizer. Obrigado por juntar meu corpo. Eu sou Eak, o camareiro de confian�a da Deusa Minerva. Voc�s est�o aqui para resgatar Minerva, n�o �? Eu vou tentar ajudar. Certo, vou levar voc�s at� a entrada da torre." );
	else if ( field.id == 920010100 ) {
		self.say( "Sim, a est�tua quebrada ao meu lado � onde #bMinerva#k est� presa no momento. Para resgatar #bMinerva#k, voc� vai precisar juntar #b6 peda�os da est�tua #k para consertar a parte quebrada e trazer o #b#t4001055##k para aplicar o poder m�stico na est�tua." );
		self.say( "Procure pela torre com cuidado para encontrar o #bPeda�o da Est�tua da Deusa#k e a #bErva da Vida#k para resgatar a Deusa Minerva!" );
	}
	else if ( field.id == 920010200 ) self.say( "Esta � a alameda para a Torre da Deusa. Os duendes quebraram #b#t4001044# em 30 peda�os#k e levaram cada um deles. Por favor, acabe com os Duendes e traga de volta o #b#t4001050##k; em troca, eu vou fazer #b#t4001044##k com eles. Os Duendes se fortaleceram com o poder da est�tua da Deusa, por isso, tenha cuidado~" );
	else if ( field.id == 920010300 ) self.say( "Este era o antigo dep�sito da Torre da Deusa, mas agora virou o lar dos Cellions. Um Cellion pegou #b#t4001045##k e escondeu. Voc� deve derrot�-lo e trazer #b#t4001045##k de volta." );
	else if ( field.id == 920010400 ) {
		self.say( "Esta � a sala da Torre da Deusa. � aqui que a Deusa Minerva gosta de ouvir m�sica. Ela adorava ouvir v�rios tipos de m�sica, dependendo do dia da semana." );
		self.say( "A Deusa gostava de ouvir diferentes tipos de m�sica, dependendo do dia.\r\n #bNa segunda-feira, ela gosta de m�sica bonitinha; algo encantador e ador�vel\r\nNa ter�a, m�sicas assustadoras, que, meu Deus, tiravam qualquer um do s�rio\r\nNa quarta, m�sica divertida, algo para dan�ar;\r\nNa quinta, m�sica triste;\r\nNa sexta, ela gosta de m�sica que d� frio na espinha\r\nNo s�bado, ela preferia ouvir m�sica r�pida, com arranjos curtos\r\nE, no domingo, �pera para combinar com o humor#k\r\na Deusa mudava de gosto todo dia. Ela estudava de verdade a m�sica." );
		self.say( "Se voc� tocar a m�sica de antes, o esp�rito da Deusa Minerva pode reagir e... alguma coisa pode acontecer." );
	}
	else if ( field.id == 920010500 ) {
		self.say( "Esta � a Sala lacrada da Torre da Deusa. � a sala onde a Deusa Minerva se sentia segura o bastante para manter suas posses valiosas." );
		self.say( "Os tr�s degraus ao lado funcionam como travas que podem liberar a maldi��o e todos eles precisam sustentar o mesmo peso. Vamos ver... isso vai exigir que cinco de voc�s fiquem em cima para chegar ao peso ideal. Al�m disso, voc�s v�o precisar resolver o problema em at� 7 tentativas e n�o mudar a resposta, ou ser�o banidos da sala lacrada." );
	}
	else if ( field.id == 920010600 ) self.say( "Esta � o sagu�o da Torre da Deusa, onde os convidados ficam por algumas noites. #b#t4001048##k se quebrou em 40 peda�os espalhados por todo o local. Por favor, encontre e junte os peda�os de #b#t4001052##k." );
	else if ( field.id == 920010700 ) self.say( "Este � o caminho para o alto da Torre da Deusa. No alto, existem 5 alavancas que controlam a porta para o cume. Seu dever � identificar as duas alavancas que precisam ser movidas corretamente. Feito isso, avise-me para que eu possa dizer se as alavancas corretas foram movidas ou n�o." );
	else if ( field.id == 920010800 ) self.say( "Este � o jardim da Torre da Deusa. A #bErva da Vida#k s� pode crescer neste vaso de flores. Basta cultivar a erva para obter a semente... ah, falando nisso, tenha cuidado. Voc�s podem se encontrar com #bDuende-Papai#k, o pr�prio que prendeu a Deusa na est�tua." );
	else if ( field.id == 920010900 ) self.say( "Esta � a Sala da Culpa da Torre da Deusa. A Deusa Minerva costumava manter presos neste lugar os monstros mais sinistros e que cometiam os piores crimes. Felizmente, nenhuma parte da est�tua se encontra neste local, por isso, voltem pela ladeira � direita desta sala. Digo mais uma vez... algo pode estar escondido..." );
	else if ( field.id == 920011000 ) self.say( "Argh, est� t�o escuro aqui. Voc� agora se encontra na Sala da Escurid�o da Torre da Deusa. Ei, como voc�s chegaram aqui? Voc� n�o vai encontrar nenhuma parte da est�tua da deusa aqui. Sugiro que voc� procure nos outros quartos." );

	if ( target.isPartyBoss != 1 ) self.say( "Agora continue, por favor, com o l�der do seu grupo mostrando o caminho." );
	return;
}

//���� ��ũ��Ʈ
function party3_out {
	field = self.field;

	if ( field.id != 920011200 ) { 
		v0 = self.askMenu( "O que vai fazer? \r\n#b#L0#Obedecer a Eak.#l\r\n#b#L1# Abandonar a Miss�o do Grupo e ir embora.#l" );
		if ( v0 == 0 ) {
			party3_help;
			end;
		} else if ( v0 == 1 ) {
			v1 = self.askYesNo( "Quer realmente sair?" );
			if ( v1 == 0 ) self.say( "Pense bem nas suas op��es e converse comigo." );
			else registerTransferField( 920011200, "st00" );
		}
	} else {
		//self.say( "Indo embora..." );
		//������ ����
		party3_takeawayitem;
		//����ĵ��
		target.cancelPartyBuff( 2022090 );
		target.cancelPartyBuff( 2022091 );
		target.cancelPartyBuff( 2022092 );
		target.cancelPartyBuff( 2022093 );
		registerTransferField( 200080101, "st00" );
	}
	return;
}

script "party3_minerva" {
	quest = FieldSet( "Party5" );
	field = self.field;
	
	if ( field.id == 920010100 ) {
		self.say( "Obrigado por n�o apenas consertar a est�tua, mas tamb�m me tirar da armadilha. Que a b�n��o da Deusa esteja com voc� at� o fim..." );
		if ( target.isPartyBoss != 1 ) {
			self.say( "Agora continue, por favor, com o l�der do seu grupo mostrando o caminho." );
		} else {
			quest.incExpAll( 23000, 7020 );

			//����Ư������ġ
		/*	cTime = currentTime;
			if ( serverType == 2 ) {
				wsTime = compareTime( cTime, "07/01/09/00/00" );
				weTime =  compareTime( "07/02/04/23/59", cTime );
			} else {
				wsTime = compareTime( cTime, "07/01/16/00/00" );
				weTime =  compareTime( "07/02/04/23/59", cTime );
			}

			if ( wsTime >= 0 and weTime >= 0 ) {
				say = "<Evento Miss�o de Grupo 2007> Recompensa de EXP extra por completar a Miss�o do Grupo.";
				quest.broadcastMsg( 6, say );
				quest.incExpAll( 22200 );
			}*/
		        //�̼ǰ���ġ
			if ( quest.getVar( "cMission" ) != "" and quest.getVar( "cMission" ) != "0"  ) {
				v0 = integer( quest.getVar( "cMission" ));
				cMission_reward( v0 );
			}

		bonusmap = FieldSet( "Party6" );
	        res = bonusmap.enter( target.nCharacterID, 0 );
	        if ( res == 0 ) quest.transferFieldAll( 920011100, "st00" );
		end;
		}
	} else if ( field.id == 920011300 ) {
		inven = target.inventory;

		//�ϱ��� ���� ó��
		for ( i = 0 .. 9 ) {
			code = 4001064 + i;
			nItem = inven.itemCount( code );
			if ( nItem == 0 ) {
				diary = 0;
				break;
			} else {
				diary = 1;
			}
		}

		if ( diary == 1 ) {
			self.say( "Ei, esta n�o � uma p�gina solta do meu di�rio? Muito obrigado por encontr�-la! Quero dizer, escrevi isto e acabei presa na est�tua... h� algumas centenas de anos. Mal consigo lembrar." );
			v0 = self.askYesNo( "O di�rio diz como acabei presa na est�tua. Como sempre digo, n�o cometo o mesmo erro duas vezes. Vou fazer um registro disto e entregar a voc�." );
			if ( v0 == 0 ) {
				self.say( "Se foi feito um registro, muita coisa pode ser descoberta... hum..." );
			} else {
				nItem = inven.itemCount( 4161014 );
				if ( nItem > 0 ) {
					self.say( "Voc� j� tem #b#t4161014##k." );
				} else {
					ret = inven.exchange( 0, 4001064, -1, 4001065, -1, 4001066, -1, 4001067, -1, 4001068, -1, 4001069, -1, 4001070, -1, 4001071, -1, 4001072, -1, 4001073, -1, 4161014, 1 );
					if ( ret != 0 ) self.say( "Por favor, cuide bem do meu di�rio." );
					else {
						self.say( "Por acaso voc�... perdeu aquela p�gina do meu di�rio?" );
						end;
					} 
				}
			}	
			

	/*		if ( v0 == 0 ) {
				rNum = random( 0, 13 );
				if ( rNum == 0 ) itemid = 2043001;
				else if ( rNum == 1 ) itemid = 2043101;
				else if ( rNum == 2 ) itemid = 2043201;
				else if ( rNum == 3 ) itemid = 2043301;
				else if ( rNum == 4 ) itemid = 2043701;
				else if ( rNum == 5 ) itemid = 2043801;
				else if ( rNum == 6 ) itemid = 2044001;
				else if ( rNum == 7 ) itemid = 2044101;
				else if ( rNum == 8 ) itemid = 2044201;
				else if ( rNum == 9 ) itemid = 2044301;
				else if ( rNum == 10 ) itemid = 2044401;
				else if ( rNum == 11 ) itemid = 2044501;
				else if ( rNum == 12 ) itemid = 2044601;
				else itemid = 2044701;
				ret = inven.exchange( 0, 4001064, -1, 4001065, -1, 4001066, -1, 4001067, -1, 4001068, -1, 4001069, -1, 4001070, -1, 4001071, -1, 4001072, -1, 4001073, -1, itemid, 1 );
				if ( ret != 0 ) {
					self.say( "�ϱ����� ã���ֽð�, �Ժη� �о���� �����̴ٴ� ���� ģ���Ͻó׿�. ���� �����մϴ�." );
					end;
				} else self.say( "�Һ�â�� �� ĭ�� �ִ��� Ȯ���� �ּ���." );
			} else if ( v0 == 1 ) {
				rNum = random( 0, 16 );
				if ( rNum == 0 ) itemid = 2041001;
				else if ( rNum == 1 ) itemid = 2041004;
				else if ( rNum == 2 ) itemid = 2041004;
				else if ( rNum == 3 ) itemid = 2041007;
				else if ( rNum == 4 ) itemid = 2041010;
				else if ( rNum == 5 ) itemid = 2041013;
				else if ( rNum == 6 ) itemid = 2041016;
				else if ( rNum == 7 ) itemid = 2041019;
				else if ( rNum == 8 ) itemid = 2041022;
				else if ( rNum == 9 ) itemid = 2041002;
				else if ( rNum == 10 ) itemid = 2041005;
				else if ( rNum == 11 ) itemid = 2041010;
				else if ( rNum == 12 ) itemid = 2041014;
				else if ( rNum == 13 ) itemid = 2041017;
				else if ( rNum == 14 ) itemid = 2041020;
				else if ( rNum == 15 ) itemid = 2041023;
				else itemid = 2044701;
				ret = inven.exchange( 0, 4001064, -1, 4001065, -1, 4001066, -1, 4001067, -1, 4001068, -1, 4001069, -1, 4001070, -1, 4001071, -1, 4001072, -1, 4001073, -1, itemid, 1 );
				if ( ret != 0 ) {
					self.say( "�ϱ����� ã���ֽŰ� ������, ��� ���� �ϱ����� �Ժη� �о�Ǽ� �ֳ���? ��! ���� �Ǹ��̿���." );
					end;
				} else self.say( "�Һ�â�� �� ĭ�� �ִ��� Ȯ���� �ּ���." );
			}*/
		}

		//Ŭ���� ����
		self.say( "Muito obrigada por me resgatar. Eu tenho um presentinho como sinal da sua atitude her�ica. Aceite, por favor. Mas, antes, verifique se possui um slot livre no invent�rio de equip., de etc. e de uso." );
		if ( inven.slotCount( 2 ) > inven.holdCount( 2 ) and inven.slotCount( 4 ) > inven.holdCount( 4 ) ) {
			rnum = random( 0, 250 );
			nNewItemID = 0;
			nNewItemNum = 0;
			//�����
			if ( rnum == 0 ) { nNewItemID = 2000004; nNewItemNum = 10; }
			else if ( rnum == 1 ) { nNewItemID = 2000002; nNewItemNum = 100; }
			else if ( rnum == 2 ) { nNewItemID = 2000003; nNewItemNum = 100; }
			else if ( rnum == 3 ) { nNewItemID = 2000006; nNewItemNum = 50; }
			else if ( rnum == 4 ) { nNewItemID = 2022000; nNewItemNum = 50; }
			else if ( rnum == 5 ) { nNewItemID = 2022003; nNewItemNum = 50; }
			//10% �ֹ�����
			else if ( rnum == 6 ) { nNewItemID = 2040002; nNewItemNum = 1; }
			else if ( rnum == 7 ) { nNewItemID = 2040402; nNewItemNum = 1; }
			else if ( rnum == 8 ) { nNewItemID = 2040502; nNewItemNum = 1; }
			else if ( rnum == 9 ) { nNewItemID = 2040505; nNewItemNum = 1; }
			else if ( rnum == 10 ) { nNewItemID = 2040602; nNewItemNum = 1; }
			else if ( rnum == 11 ) { nNewItemID = 2040802; nNewItemNum = 1; }
			//������
			else if ( rnum == 12 ) { nNewItemID = 4003000; nNewItemNum = 70; }
			else if ( rnum == 13 ) { nNewItemID = 4010000; nNewItemNum = 20; }
			else if ( rnum == 14 ) { nNewItemID = 4010001; nNewItemNum = 20; }
			else if ( rnum == 15 ) { nNewItemID = 4010002; nNewItemNum = 20; }
			else if ( rnum == 16 ) { nNewItemID = 4010003; nNewItemNum = 20; }
			else if ( rnum == 17 ) { nNewItemID = 4010004; nNewItemNum = 20; }
			else if ( rnum == 18 ) { nNewItemID = 4010005; nNewItemNum = 20; }
			else if ( rnum == 19 ) { nNewItemID = 4010006; nNewItemNum = 15; }
			else if ( rnum == 20 ) { nNewItemID = 4020000; nNewItemNum = 20; }
			else if ( rnum == 21 ) { nNewItemID = 4020001; nNewItemNum = 20; }
			else if ( rnum == 22 ) { nNewItemID = 4020002; nNewItemNum = 20; }
			else if ( rnum == 23 ) { nNewItemID = 4020003; nNewItemNum = 20; }
			else if ( rnum == 24 ) { nNewItemID = 4020004; nNewItemNum = 20; }
			else if ( rnum == 25 ) { nNewItemID = 4020005; nNewItemNum = 20; }
			else if ( rnum == 26 ) { nNewItemID = 4020006; nNewItemNum = 20; }
			else if ( rnum == 27 ) { nNewItemID = 4020007; nNewItemNum = 10; }
			else if ( rnum == 28 ) { nNewItemID = 4020008; nNewItemNum = 10; }
			//�Ͱ���
			else if ( rnum == 29 ) { nNewItemID = 1032013; nNewItemNum = 1; }
			else if ( rnum == 30 ) { nNewItemID = 1032011; nNewItemNum = 1; }
			else if ( rnum == 31 ) { nNewItemID = 1032014; nNewItemNum = 1; }
			//���̾��� �����
			else if ( rnum == 32 ) { nNewItemID = 1102021; nNewItemNum = 1; }
			else if ( rnum == 33 ) { nNewItemID = 1102022; nNewItemNum = 1; }
			else if ( rnum == 34 ) { nNewItemID = 1102023; nNewItemNum = 1; }
			else if ( rnum == 35 ) { nNewItemID = 1102024; nNewItemNum = 1; }
			//�ֹ�����
			else if ( rnum == 36 ) { nNewItemID = 2040803; nNewItemNum = 1; }
			else if ( rnum == 37 ) { nNewItemID = 2070011; nNewItemNum = 1; }
			else if ( rnum == 38 ) { nNewItemID = 2043001; nNewItemNum = 1; }
			else if ( rnum == 39 ) { nNewItemID = 2043101; nNewItemNum = 1; }
			else if ( rnum == 40 ) { nNewItemID = 2043201; nNewItemNum = 1; }
			else if ( rnum == 41 ) { nNewItemID = 2043301; nNewItemNum = 1; }
			else if ( rnum == 42 ) { nNewItemID = 2043701; nNewItemNum = 1; }
			else if ( rnum == 43 ) { nNewItemID = 2043801; nNewItemNum = 1; }
			else if ( rnum == 44 ) { nNewItemID = 2044001; nNewItemNum = 1; }
			else if ( rnum == 45 ) { nNewItemID = 2044101; nNewItemNum = 1; }
			else if ( rnum == 46 ) { nNewItemID = 2044201; nNewItemNum = 1; }
			else if ( rnum == 47 ) { nNewItemID = 2044301; nNewItemNum = 1; }
			else if ( rnum == 48 ) { nNewItemID = 2044401; nNewItemNum = 1; }
			else if ( rnum == 49 ) { nNewItemID = 2044501; nNewItemNum = 1; }
			else if ( rnum == 50 ) { nNewItemID = 2044601; nNewItemNum = 1; }
			else if ( rnum == 51 ) { nNewItemID = 2044701; nNewItemNum = 1; }
			//����
			else if ( rnum == 52 ) { nNewItemID = 2000004; nNewItemNum = 35; }
			else if ( rnum == 53 ) { nNewItemID = 2000002; nNewItemNum = 80; }
			else if ( rnum == 54 ) { nNewItemID = 2000003; nNewItemNum = 80; }
			else if ( rnum == 55 ) { nNewItemID = 2000006; nNewItemNum = 35; }
			else if ( rnum == 56 ) { nNewItemID = 2022000; nNewItemNum = 35; }
			else if ( rnum == 57 ) { nNewItemID = 2022003; nNewItemNum = 35; }
			//��Ÿ��
			else if ( rnum == 58 ) { nNewItemID = 4003000; nNewItemNum = 75; }
			else if ( rnum == 59 ) { nNewItemID = 4010000; nNewItemNum = 18; }
			else if ( rnum == 60 ) { nNewItemID = 4010001; nNewItemNum = 18; }
			else if ( rnum == 61 ) { nNewItemID = 4010002; nNewItemNum = 18; }
			else if ( rnum == 62 ) { nNewItemID = 4010003; nNewItemNum = 18; }
			else if ( rnum == 63 ) { nNewItemID = 4010004; nNewItemNum = 18; }
			else if ( rnum == 64 ) { nNewItemID = 4010005; nNewItemNum = 18; }
			else if ( rnum == 65 ) { nNewItemID = 4010006; nNewItemNum = 12; }
			else if ( rnum == 66 ) { nNewItemID = 4020000; nNewItemNum = 18; }
			else if ( rnum == 67 ) { nNewItemID = 4020001; nNewItemNum = 18; }
			else if ( rnum == 68 ) { nNewItemID = 4020002; nNewItemNum = 18; }
			else if ( rnum == 69 ) { nNewItemID = 4020003; nNewItemNum = 18; }
			else if ( rnum == 70 ) { nNewItemID = 4020004; nNewItemNum = 18; }
			else if ( rnum == 71 ) { nNewItemID = 4020005; nNewItemNum = 18; }
			else if ( rnum == 72 ) { nNewItemID = 4020006; nNewItemNum = 18; }
			else if ( rnum == 73 ) { nNewItemID = 4020007; nNewItemNum = 7; }
			else if ( rnum == 74 ) { nNewItemID = 4020008; nNewItemNum = 7; }
			//�ֹ�����
			else if ( rnum == 75 ) { nNewItemID = 2040001; nNewItemNum = 1; }
			else if ( rnum == 76 ) { nNewItemID = 2040004; nNewItemNum = 1; }
			else if ( rnum == 77 ) { nNewItemID = 2040301; nNewItemNum = 1; }
			else if ( rnum == 78 ) { nNewItemID = 2040401; nNewItemNum = 1; }
			else if ( rnum == 79 ) { nNewItemID = 2040501; nNewItemNum = 1; }
			else if ( rnum == 80 ) { nNewItemID = 2040504; nNewItemNum = 1; }
			else if ( rnum == 81 ) { nNewItemID = 2040601; nNewItemNum = 1; }
			else if ( rnum == 82 ) { nNewItemID = 2040601; nNewItemNum = 1; }
			else if ( rnum == 83 ) { nNewItemID = 2040701; nNewItemNum = 1; }
			else if ( rnum == 84 ) { nNewItemID = 2040704; nNewItemNum = 1; }
			else if ( rnum == 85 ) { nNewItemID = 2040707; nNewItemNum = 1; }
			else if ( rnum == 86 ) { nNewItemID = 2040801; nNewItemNum = 1; }
			else if ( rnum == 87 ) { nNewItemID = 2040901; nNewItemNum = 1; }
			else if ( rnum == 88 ) { nNewItemID = 2041001; nNewItemNum = 1; }
			else if ( rnum == 89 ) { nNewItemID = 2041004; nNewItemNum = 1; }
			else if ( rnum == 90 ) { nNewItemID = 2041007; nNewItemNum = 1; }
			else if ( rnum == 91 ) { nNewItemID = 2041010; nNewItemNum = 1; }
			else if ( rnum == 92 ) { nNewItemID = 2041013; nNewItemNum = 1; }
			else if ( rnum == 93 ) { nNewItemID = 2041016; nNewItemNum = 1; }
			else if ( rnum == 94 ) { nNewItemID = 2041019; nNewItemNum = 1; }
			else if ( rnum == 95 ) { nNewItemID = 2041022; nNewItemNum = 1; }
			else if ( rnum >= 96 and rnum <= 130 ) { nNewItemID = 2000004; nNewItemNum = 20; }
			else if ( rnum >= 131 and rnum <= 150 ) { nNewItemID = 2000005; nNewItemNum = 10; }
			else if ( rnum >= 151 and rnum <= 180 ) { nNewItemID = 2000002; nNewItemNum = 100; }
			else if ( rnum >= 181 and rnum <= 200 ) { nNewItemID = 2000006; nNewItemNum = 50; }
			else { nNewItemID = 2000003; nNewItemNum = 100; }

			ret = inven.exchange( 0, nNewItemID, nNewItemNum );
			if ( ret == 0 ) self.say( "Tem certeza de que possui um slot dispon�vel no invent�rio de uso ou etc.? N�o posso recompensar voc� se o invent�rio estiver cheio." );
			else {
				party3_takeawayitem;
				qr = target.questRecord;
				qr.set( 7020, "1" );
				//2007 �̺�Ʈ�� ����Ʈ �Ϸ� ó��
				cTime = currentTime;
				if ( serverType == 2 ) {
					wsTime = compareTime( cTime, "07/01/09/00/00" );
					weTime =  compareTime( "07/02/04/23/59", cTime );
				} else {
					wsTime = compareTime( cTime, "07/01/16/00/00" );
					weTime =  compareTime( "07/02/04/23/59", cTime );
				}

				if ( wsTime >= 0 and weTime >= 0 ) {
					if ( qr.getState( 9663 ) == 1 ) {
						qr.setComplete( 9663 );
						target.message( "Voc� completou a miss�o de [Consolar a Deusa]." );
					}
				}
				//����
				registerTransferField( 920011200, "" );
			}
		}
		else self.say( "Tem certeza de que possui um slot dispon�vel no invent�rio de uso ou etc.? N�o posso recompensar voc� se o invent�rio estiver cheio." );
	} 	
}

//������ ��(920010500) �� ����
function party3_nQuizAns {
	quest = FieldSet( "Party5" );

	ans2_1 = random( 0, 5 );
	ans2_2 = random( 0, 5 - ans2_1 );
	ans2_3 = 5 - ans2_1 - ans2_2;

	rand_anw = random( 1, 6 );
	if ( rand_anw == 1 ) {
		quest.setVar( "ans1", string( ans2_1 ));
		quest.setVar( "ans2", string( ans2_2 ));
		quest.setVar( "ans3", string( ans2_3 ));
	} else if ( rand_anw == 2 ) {
		quest.setVar( "ans1", string( ans2_1 ));
		quest.setVar( "ans3", string( ans2_2 ));
		quest.setVar( "ans2", string( ans2_3 ));
	} else if ( rand_anw == 3 ) {
		quest.setVar( "ans2", string( ans2_1 ));
		quest.setVar( "ans1", string( ans2_2 ));
		quest.setVar( "ans3", string( ans2_3 ));
	} else if ( rand_anw == 4 ) {
		quest.setVar( "ans2", string( ans2_1 ));
		quest.setVar( "ans3", string( ans2_2 ));
		quest.setVar( "ans1", string( ans2_3 ));
	} else if ( rand_anw == 5 ) {
		quest.setVar( "ans3", string( ans2_1 ));
		quest.setVar( "ans1", string( ans2_2 ));
		quest.setVar( "ans2", string( ans2_3 ));
	} else {
		quest.setVar( "ans3", string( ans2_1 ));
		quest.setVar( "ans2", string( ans2_2 ));
		quest.setVar( "ans1", string( ans2_3 ));
	}
	return;
}

//���� ��ũ
script "party3_play" {
	field = self.field;
	quest = FieldSet( "Party5" );

	if ( field.id == 920010000 ) {
		if ( quest.getVar( "prestage_clear" ) != "1" ) {
			if ( target.isPartyBoss == 1 ) {
				field.effectScreen( "quest/party/clear" );
				field.effectSound( "Grupo1/Completado" );
				self.say( "Obrigado por erguer o meu corpo. Voc�s est�o todos aqui para resgatar a Deusa Minerva, n�o �? Vou ajudar o m�ximo que puder. Certo, vou levar voc�s at� a entrada da torre." );
				quest.setVar( "prestage_clear", "1" );
				quest.incExpAll( 6000, 7020 );
				quest.transferFieldAll( 920010000, "st00" );
			} else {
				self.say( "Obrigado por erguer o meu corpo. Voc�s est�o todos aqui para resgatar a Deusa Minerva, n�o �? Vou ajudar o m�ximo que puder. Agora continue, por favor, com o l�der do seu grupo mostrando o caminho." );
				end;
			}
		} else {
			self.say( "Certo, vou levar voc�s at� a entrada da torre." );
			registerTransferField( 920010000, "st00" );			
		}
	//�߾ӷ�
	} else if ( field.id == 920010100 ) {
		stage0 = quest.getVar( "stage0_clear" );
		mine = quest.getReactorState( 1, "minerva" );

		if ( target.isPartyBoss == 1 ) {
			if ( mine == 6 ) {
				self.say( "Ahhh! A Est�tua foi restaurada! Muito obrigado! Agora, s� precisamos da Erva da Vida para trazer de volta a #bDeusa Minerva#k. A Erva da Vida s� cresce no jardim da Torre da Deusa. Vou levar voc� at� l� agora mesmo." );
				quest.setVar( "stage0_clear", "1" );
				quest.transferFieldAll( 920010800, "in00" );	
				end;
			} else if ( mine == 7 ) {
				self.say( "Eu n�o sei como agradecer por salvar a Deusa Minerva!" );
				end;
			}
		}

		if ( target.isPartyBoss != 1 ) {
			if ( stage0 == ""  or stage0 == "s" ) {
				party3_out;
				end;
			} 
		} else {
			if ( stage0 == "" ) {
				party3_help;
				quest.setVar( "stage0_clear", "s" );
				end;
			} else if ( stage0 == "s" ) {
				party3_out;
				end;
			} else if ( stage0 == "1" ) {
				self.say( "Voc� conseguiu a Erva da Vida? Se conseguiu, coloque o item no centro da Est�tua da Deusa." );
				end;
			}
		}
	//��1-��å��
	} else if ( field.id == 920010200 ) {
		stage1 = quest.getVar( "stage1_clear" );

		if ( stage1 == "" ) {
			if ( target.isPartyBoss != 1 ) {
				party3_help;
				end;
			} else {
				party3_help;
				quest.setVar( "stage1_clear", "s" );
				end;
			}
		} else if ( stage1 == "s" ) {
			if ( target.isPartyBoss != 1 ) {
				party3_help;
				end;
			} else {
				inven = target.inventory;
				nItem =  inven.itemCount( 4001050 );
				if ( nItem >= 30 ) {
					self.say( "Ohhh! Voc� conseguiu juntar 30 #b#t4001050#s#k! Com isso posso fazer #b#t4001044##k. Pronto, vou fazer agora mesmo!" );
					ret = inven.exchange( 0, 4001050, -nItem, 4001044, 1 );

					if ( ret != 1 ) self.say ( "Por favor, verifique se seu invent�rio tem espa�o livre." );
					else {
						field.effectScreen( "quest/party/clear" );
						field.effectSound( "Grupo1/Completado" );
						quest.setVar( "stage1_clear", "1" );
						quest.incExpAll( 7500, 7020 );
						end;
					}
				} else {
					self.say( "Voc� coletou todos os #b#t4001050#s#k?" );
					end;
				}
			}
		} else {
			self.say( "Eu acho que n�o tem mais nada o que fazer nesta sala. Por favor, entre em outra sala." );
			end;
		}
	//��2-â��
	} else if ( field.id == 920010300 ) {
		stage2 = quest.getVar( "stage2_clear" );

		if ( stage2 == "" ) {
			if ( target.isPartyBoss != 1 ) {
				party3_help;
				end;
			} else {
				party3_help;
				quest.setVar( "stage2_clear", "s" );
				end;
			}
		} else if ( stage2 == "s") {
			 if ( target.isPartyBoss == 1 ) {
				inven = target.inventory;
//			nItem =  inven.itemCount( 4001051 );
				nItem =  inven.itemCount( 4001045 );
				if ( nItem >= 1 ) {
//					self.say( "Uau! Voc� encontrou #b#t4001045##k" );
//				ret = inven.exchange( 0, 4001051, -nItem, 4001045, 1 );
//				if ( ret != 1 ) self.say ( "�κ��丮�� ��ĭ�� �ִ��� Ȯ���� ������." );
//				else {
					field.effectScreen( "quest/party/clear" );
					field.effectSound( "Grupo1/Completado" );
					quest.setVar( "stage2_clear", "1" );
					quest.incExpAll( 7500, 7020 );
					end;
				} else {
					self.say( "Voc� coletou #b#t4001045##k?" );
					end;
				}
			}
		} else {
			self.say( "Eu acho que n�o tem mais nada o que fazer nesta sala. Por favor, entre em outra sala." );
			end;			
		}
	//��3-�ްԽ�
	} else if ( field.id == 920010400 ) {
		if ( target.isPartyBoss != 1 ) {
			party3_help;
			end;
		} else {
			if ( quest.getReactorState( 4, "music" ) == 0 ) {
				party3_help;
			} else {
				if ( quest.getVar( "stage3_clear" ) != "1" ) {
					day = dayofweek;
					if ( quest.getReactorState( 4, "music" ) == ( day+1 )) {
						self.say( "Sim! Esta � a m�sica! A Deusa adorava ouvir esta m�sica de vez em quando." );
						quest.setReactorState( 4, "stone3", 1, 0 );
						field.effectScreen( "quest/party/clear" );
						field.effectSound( "Grupo1/Completado" );
						quest.setVar( "stage3_clear", "1" );
						quest.incExpAll( 7500, 7020 );
					} else {
						self.say( "N�o � isto." );
					}
				} else {
					self.say( "Eu acho que n�o tem mais nada o que fazer nesta sala. Por favor, entre em outra sala." );
					end;
				}
			}
		}
	//��4-�������� ���εȹ�
	} else if ( field.id == 920010500 ) {
		//���ڸ��߱�
		stage4 = quest.getVar( "stage4_clear" );

		if ( target.isPartyBoss != 1 ) {
			if ( stage4 != "1" ) {			
				party3_help;
				end;
			} else {
				self.say( "Eu acho que n�o tem mais nada o que fazer nesta sala. Por favor, encontre o peda�o da est�tua da Deusa em outra sala." );
				end;
			}
		}

		if ( stage4 == "" ) {
			party3_help;
			party3_nQuizAns;
			quest.setVar( "try", "0" );
			quest.setVar( "stage4_clear", "s" );
			//����
//			say = quest.getVar( "ans1" ) + quest.getVar( "ans2" ) + quest.getVar( "ans3" );
//			target.message( say );
			end;
		} else if ( stage4 == "s" ) {
			//���� ����
			if ( quest.getVar( "ans1" ) == "" ) {
				party3_nQuizAns;
			}

			area1 = field.countUserInArea ( "1" );
			area2 = field.countUserInArea ( "2" );
			area3 = field.countUserInArea ( "3" );

			if ( area1 + area2 + area3 != 5 ) {
				self.say( "Voc� vai precisar de 5 pessoas no alto das plataformas." );
				end;
			} 

			co = 0;
			if ( area1 == integer( quest.getVar( "ans1" ))) co++;
			if ( area2 == integer( quest.getVar( "ans2" ))) co++;
			if ( area3 == integer( quest.getVar( "ans3" ))) co++;

			if ( co < 3 ) {
				nNum = integer( quest.getVar( "try" ) ) +1;
				tried = integer( quest.getVar( "try" ) );
				tried++;
				quest.setVar( "try", string( tried ) );
				if ( nNum == 6 ) {
					if ( co == 0 ) self.say ( "Esta � a sua tentativa n�mero" +string( nNum ) + ".\r\nTodas estas plataformas t�m pesos diferentes.\r\nVoc� s� tem mais uma tentativa, tenha cuidado!" );
					else self.say ( "Esta � a sua tentativa n�mero" +  string( nNum )  + ".\r\nO peso sobre" + string( co ) + "as plataformas est� correto.\r\nVoc� tem uma tentativa restante, tenha cuidado." );
				} else if ( nNum >= 7 ) {
					//self.say( "......... ............ ............ ................" );
					
					quest.broadcastMsg( 6, "Voc� falhou e ser� removido da sala." );
					quest.setVar( "try", "0" );
					quest.setVar( "stage4_clear", "" );
					field.transferFieldAll( 920010100, "in03" );
					end;
				} else {
					if ( co == 0 ) self.say ( "Esta � a sua tentativa n�mero" +  string( nNum )  + ".\r\nTodas as plataformas t�m pesos diferentes." );
					else self.say ( "Esta � a sua tentativa n�mero" +  string( nNum )  + ".\r\nO peso sobre" + string( co ) + "as plataformas est� correto." );
				}
				end;
			} else {
				self.say( "Resposta correta. Algo apareceu em cima do altar." );
				field.effectScreen( "quest/party/clear" );
				field.effectSound( "Grupo1/Completado" );
				quest.setReactorState( 5, "stone4", 1, 0 );
				quest.setVar( "stage4_clear", "1" );
				quest.incExpAll( 7500, 7020 );
				end;
			}
		} else if ( stage4 == "1" ) {
			self.say( "Eu acho que n�o tem mais nada o que fazer nesta sala. Por favor, encontre o peda�o da est�tua da Deusa em outra sala." );
			end;
		}
	//��5
	} else if ( field.id == 920010600 ) {
		stage5 = quest.getVar( "stage5_clear" );

		if ( target.isPartyBoss != 1 ) {
			if ( stage5 != "1" ) {			
				party3_help;
				end;
			} else {
				self.say( "Eu acho que n�o tem mais nada o que fazer nesta sala. Por favor, entre em outra sala." );
				end;
			}
		}

		if ( stage5 == "" ) {
			party3_help;
			quest.setVar( "stage5_clear", "s" );
			end;
		} else if ( stage5 == "s" ) {
			inven = target.inventory;
			nItem =  inven.itemCount( 4001052 );
			if ( nItem >= 40 ) {
				self.say( "Ohhh! Voc� conseguiu juntar 40 #b#t4001052#s#k! Com isto posso fazer #b#t4001048##k. Pronto, vou fazer agora mesmo!" );
				ret = inven.exchange( 0, 4001052, -nItem, 4001048, 1 );
				if ( ret != 1 ) self.say ( "Por favor, verifique se seu invent�rio tem espa�o livre." );
				else {
					field.effectScreen( "quest/party/clear" );
					field.effectSound( "Grupo1/Completado" );
					quest.setVar( "stage5_clear", "1" );
					quest.incExpAll( 7500, 7020 );
					end;
				}
			} else {
				self.say( "Voc� coletou o #b#t4001052#s#k?" );
			}
		} else if ( stage5 == "1" ) {
			self.say( "Eu acho que n�o tem mais nada o que fazer nesta sala. Por favor, entre em outra sala." );
			end;
		}
	//�ö󰡴±�
	} else if ( field.id == 920010700 ) {
		stage6 = quest.getVar( "stage6_clear" );

		if ( target.isPartyBoss != 1 ) {
			if ( stage6 != "1" ) {			
				party3_help;
				end;
			} else {
				self.say( "Eu acho que n�o tem mais nada o que fazer nesta sala. Por favor, entre em outra sala." );
				end;
			}
		}

		if ( stage6 == "" ) {
			party3_help;
			quest.setVar( "stage6_clear", "s" );
			end;
		} else if ( stage6 == "s" ) {
			ans1 =  quest.getVar( "stage6_ans1" );
			ans2 =  quest.getVar( "stage6_ans2" );
			wans1 = quest.getVar( "stage6_wans1" );
			wans2 = quest.getVar( "stage6_wans2" );
			wans3 = quest.getVar( "stage6_wans3" );

			if ( quest.getReactorState( 11, ans1 ) == 1 and quest.getReactorState( 11, ans1) == 1 and quest.getReactorState( 11, wans1 ) == 0 and quest.getReactorState( 11, wans2 ) == 0 and quest.getReactorState( 11, wans3 ) == 0 ) {
				self.say( "Voc� moveu a alavanca com sucesso. Algo apareceu em cima do altar." );
				field.effectScreen( "quest/party/clear" );
				field.effectSound( "Grupo1/Completado" );
				quest.setReactorState( 11, "stone6", 1, 0 );
				quest.setVar( "stage6_clear", "1" );
				quest.incExpAll( 7500, 7020 );
				end;
			} else {
				self.say( "Nada aconteceu, o que significa que voc� n�o deve ter movido a alavanca correta." );
				end;
			}
		} else if ( stage6 == "1" ) {
			self.say( "Eu acho que n�o tem mais nada o que fazer nesta sala. Por favor, entre em outra sala." );
			end;
		}
	} else if ( field.id == 920010800 ) {
		stageboss = quest.getVar( "stageboss_clear" );

		if ( target.isPartyBoss != 1 ) {
			party3_out;
		} else {
			inven = target.inventory;
			nItem = inven.itemCount( 4001055 );//������Ǯ
			if ( nItem > 0 ) {
				self.say( "Oh, voc� encontrou a Erva da Vida! Agora podemos salvar a Deusa! Por favor, volte para o Centro da Torre e salve a Deusa!" );
				end;
			} else {
				party3_out;
			}
		}
	} else if ( field.id == 920010900 ) {
		party3_help;
	} else if ( field.id == 920011000 ) {
		party3_help;
	} else if ( field.id == 920011100 ) {
		party3_out;
	} else if ( field.id == 920011200 ) {
		party3_out;
	} else if ( field.id == 920011200 ) {
		party3_out;
	}
}

//�� �� ����
script "party3_room1" {
	quest = FieldSet( "Party5" );

	if ( quest.getVar( "stage1_clear" ) == "1" ) {
		say = "Eu acho que n�o tem mais nada o que fazer nesta sala.";
		target.message( say );
		end;
	}

	if ( target.isPartyBoss != 1 ) {
		if ( Field( 920010200 ).getUserCount > 0 ) {
			target.playPortalSE;
			registerTransferField( 920010200, "st00" );
			end;
		} else {
			say = "Voc� s� pode entrar nos locais onde se encontra o l�der do seu grupo.";
			target.message( say );
			end;
		}
	} else {
		say = "O l�der do seu grupo entrou na <Alameda>.";
		quest.broadcastMsg( 6, say );
		target.playPortalSE;
		registerTransferField( 920010200, "st00" );
	}
}

script "party3_room2" {
	quest = FieldSet( "Party5" );

	if ( quest.getVar( "stage2_clear" ) == "1" ) {
		say = "N�o h� mais nada para fazer nesta sala.";
		target.message( say );
		end;
	}

	if ( target.isPartyBoss != 1 ) {
		if ( Field( 920010300 ).getUserCount > 0 ) {
			target.playPortalSE;
			registerTransferField( 920010300, "st00" );
			end;
		} else {
			say = "Voc� s� pode entrar nos locais onde se encontra o l�der do seu grupo.";
			target.message( say );
			end;
		}
	} else {
		say = "O l�der do seu grupo entrou no <Dep�sito>.";
		quest.broadcastMsg( 6, say );
		target.playPortalSE;
		registerTransferField( 920010300, "st00" );
	}
}

script "party3_room3" {
	quest = FieldSet( "Party5" );

	if ( quest.getVar( "stage3_clear" ) == "1" ) {
		say = "N�o h� mais nada para fazer nesta sala.";
		target.message( say );
		end;
	}

	if ( target.isPartyBoss != 1 ) {
		if ( Field( 920010400 ).getUserCount > 0 ) {
			target.playPortalSE;
			registerTransferField( 920010400, "st00" );
			end;
		} else {
			say = "Voc� s� pode entrar nos locais onde se encontra o l�der do seu grupo.";
			target.message( say );
			end;
		}
	} else {
		say = "O l�der do seu grupo entrou no <Sagu�o>.";
		quest.broadcastMsg( 6, say );
		target.playPortalSE;
		registerTransferField( 920010400, "st00" );
	}
}

//��Ż ��ũ��Ʈ
script "party3_room4" {
	quest = FieldSet( "Party5" );

	if ( quest.getVar( "stage4_clear" ) == "1" ) {
		say = "N�o h� mais nada para fazer nesta sala.";
		target.message( say );
		end;
	}

	if ( target.isPartyBoss != 1 ) {
		if ( Field( 920010500 ).getUserCount > 0 ) {
			target.playPortalSE;
			registerTransferField( 920010500, "st00" );
			end;
		} else {
			say = "Voc� s� pode entrar nos locais onde se encontra o l�der do seu grupo.";
			target.message( say );
			end;
		}
	} else {
		say = "O l�der do seu grupo entrou na <Sala Lacrada>.";
		quest.broadcastMsg( 6, say );
		target.playPortalSE;
		registerTransferField( 920010500, "st00" );
	}
}

script "party3_room5" {
	quest = FieldSet( "Party5" );

	if ( quest.getVar( "stage5_clear" ) == "1" ) {
		say = "N�o h� mais nada para fazer nesta sala.";
		target.message( say );
		end;
	}

	if ( target.isPartyBoss != 1 ) {
		nNum = Field( 920010600 ).getUserCount + Field( 920010601 ).getUserCount + Field( 920010602 ).getUserCount + Field( 920010603 ).getUserCount + Field( 920010604 ).getUserCount;
		if ( nNum > 0 ) {
			target.playPortalSE;
			registerTransferField( 920010600, "st00" );
			end;
		} else {
			say = "Voc� s� pode entrar nos locais onde se encontra o l�der do seu grupo.";
			target.message( say );
			end;
		}
	} else {
		say = "O l�der do seu grupo entrou no <Sal�o>.";
		quest.broadcastMsg( 6, say );
		target.playPortalSE;
		registerTransferField( 920010600, "st00" );
	}
}

script "party3_room6" {
	quest = FieldSet( "Party5" );

	if ( quest.getVar( "stage6_clear" ) == "1" ) {
		say = "N�o h� mais nada para fazer nesta sala.";
		target.message( say );
		end;
	}

	if ( quest.getVar( "room6_ans" ) != "1" ) {
		sh = shuffle( 1, "11000" );
		t = 0;
		k =0;
			
		for ( i = 0 .. 4 ) {
			st = substring( sh, i, 1 );
			if ( st == "1" ) {
				if ( t == 0 ) {
					quest.setVar( "stage6_ans1", string( i + 1) );
					t++;
				} else if ( t == 1 ) {
					quest.setVar( "stage6_ans2", string( i  + 1) );
					t++;
				}
			} else if ( st == "0" ) {
				if ( k == 0 ) {
					quest.setVar( "stage6_wans1", string( i + 1) );
					k++;
				} else if ( k == 1 ) {
					quest.setVar( "stage6_wans2", string( i + 1) );
					k++;
				} else if ( k == 2 ) {
					quest.setVar( "stage6_wans3", string( i + 1) );
					k++;
				}
			}
		}
		quest.setVar( "room6_ans", "1" );
	}



	if ( target.isPartyBoss != 1 ) {
		if ( Field( 920010700 ).getUserCount > 0 ) {
			target.playPortalSE;
			registerTransferField( 920010700, "st00" );
			end;
		} else {
			say = "Voc� s� pode entrar nos locais onde se encontra o l�der do seu grupo.";
			target.message( say );
			end;
		}
	} else {
		say = "O l�der do seu grupo entrou na <Sa�da para cima>.";
		quest.broadcastMsg( 6, say );
		target.playPortalSE;
		registerTransferField( 920010700, "st00" );
	}
}

script "party3_room8" {
	quest = FieldSet( "Party5" );

	if ( target.isPartyBoss != 1 ) {
		if ( Field( 920011000 ).getUserCount > 0 ) {
			registerTransferField( 920011000, "st00" );
			end;
		} else {
//			say = "Voc� s� pode entrar nos locais onde se encontra o l�der do seu grupo.";
//			target.message( say );
			end;
		}
	} else {
		say = "O l�der do seu grupo entrou na <Sala da Escurid�o>.";
		quest.broadcastMsg( 6, say );
		target.playPortalSE;
		registerTransferField( 920011000, "st00" );
	}
}

//��5(920010600) ���� ���� ��Ż
script "party3_r4pt" {
	quest = FieldSet( "Party5" );

	if (quest.getVar( "r4_rp" ) != "1") {
		quest.setVar( "r4way1", string( random( 1, 3 )));
		quest.setVar( "r4way2", string( random( 1, 3 )));

	//	say = quest.getVar( "r4way1" ) + quest.getVar( "r4way2" );
	//	target.message( say );
		quest.setVar( "r4_rp", "1" );
	}

	if ( portal.getPortalID == 11 ) {
		if ( quest.getVar( "r4way1" ) == "1") {
			registerTransferField( -1, "np00" );		
		} else registerTransferField(  -1, "np02" );		
		end;
	} else if ( portal.getPortalID == 12 ) {
		if (quest.getVar( "r4way1" ) == "2") {
			registerTransferField(  -1, "np00" );		
		} else registerTransferField( -1, "np02" );		
		end;
	} else if ( portal.getPortalID == 13 ) {
		if (quest.getVar( "r4way1" ) == "3") {
			registerTransferField(  -1, "np00" );		
		} else registerTransferField( -1, "np02" );		
		end;
	} else if ( portal.getPortalID == 14 ) {
		if (quest.getVar( "r4way2" ) == "1") {
			registerTransferField(  -1, "np01" );		
		} else registerTransferField( -1, "np02" );		
		end;
	} else if ( portal.getPortalID == 15 ) {
		if (quest.getVar( "r4way2" ) == "2") {
			registerTransferField(  -1, "np01" );		
		} else registerTransferField( -1, "np02" );		
		end;
	} else if ( portal.getPortalID == 16 ) {
		if (quest.getVar( "r4way2" ) == "3") {
			registerTransferField(  -1, "np01" );		
		} else registerTransferField( -1, "np02" );		
		end;
	}
}

script "party3_r6pt" {
	quest = FieldSet( "Party5" );

	if ( quest.getVar( "r6_rp" ) != "1") {
		quest.setVar( "r6way1", string( random( 1, 4 )));
		quest.setVar( "r6way2", string( random( 1, 4 )));
		quest.setVar( "r6way3", string( random( 1, 4 )));
		quest.setVar( "r6way4", string( random( 1, 4 )));
		quest.setVar( "r6way5", string( random( 1, 4 )));
		quest.setVar( "r6way6", string( random( 1, 4 )));
		quest.setVar( "r6way7", string( random( 1, 4 )));
		quest.setVar( "r6way8", string( random( 1, 4 )));
		quest.setVar( "r6way9", string( random( 1, 4 )));
		quest.setVar( "r6way10", string( random( 1, 4 )));
		quest.setVar( "r6way11", string( random( 1, 4 )));
		quest.setVar( "r6way12", string( random( 1, 4 )));
		quest.setVar( "r6way13", string( random( 1, 4 )));
		quest.setVar( "r6way14", string( random( 1, 4 )));
		quest.setVar( "r6way15", string( random( 1, 4 )));
		quest.setVar( "r6way16", string( random( 1, 4 )));

		//����ȳ�
	//	say = quest.getVar( "r6way1" ) + quest.getVar( "r6way2" ) + quest.getVar( "r6way3" ) + quest.getVar( "r6way4" ) + "-" + quest.getVar( "r6way5" ) + quest.getVar( "r6way6" ) + quest.getVar( "r6way7" ) + quest.getVar( "r6way8" ) + "-" + quest.getVar( "r6way9" ) + quest.getVar( "r6way10" ) + quest.getVar( "r6way11" ) + quest.getVar( "r6way12" ) + "-" + quest.getVar( "r6way13" ) + quest.getVar( "r6way14" ) + quest.getVar( "r6way15" ) + quest.getVar( "r6way16" );
	//	target.message( say );

		quest.setVar( "r6_rp", "1" );
	}

	target.playPortalSE;
	//��1
	if ( portal.getPortalID == 24 ) {
		if ( quest.getVar( "r6way1" ) == "1" ) registerTransferField( -1, "np00" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 25 ) {
		if ( quest.getVar( "r6way1" ) == "2") registerTransferField( -1, "np00" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 26 ) {
		if (quest.getVar( "r6way1" ) == "3") registerTransferField( -1, "np00" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 27 ) {
		if (quest.getVar( "r6way1" ) == "4") registerTransferField( -1, "np00" );		
		else registerTransferField( -1, "np16" );		
		end;
	//��2
	} else if ( portal.getPortalID == 28 ) {
		if (quest.getVar( "r6way2" ) == "1") registerTransferField( -1, "np01" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 29 ) {
		if (quest.getVar( "r6way2" ) == "2") registerTransferField( -1, "np01" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 30 ) {
		if (quest.getVar( "r6way2" ) == "3") registerTransferField( -1, "np01" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 31 ) {
		if (quest.getVar( "r6way2" ) == "4") registerTransferField( -1, "np01" );		
		else registerTransferField( -1, "np16" );		
		end;
	//��3
	} else if ( portal.getPortalID == 32 ) {
		if (quest.getVar( "r6way3" ) == "1") registerTransferField( -1, "np02" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 33 ) {
		if (quest.getVar( "r6way3" ) == "2") registerTransferField( -1, "np02" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 34 ) {
		if (quest.getVar( "r6way3" ) == "3") registerTransferField( -1, "np02" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 35 ) {
		if (quest.getVar( "r6way3" ) == "4") registerTransferField( -1, "np02" );		
		else registerTransferField( -1, "np16" );		
		end;
	//��4
	} else if ( portal.getPortalID == 36 ) {
		if (quest.getVar( "r6way4" ) == "1") registerTransferField( -1, "np03" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 37 ) {
		if (quest.getVar( "r6way4" ) == "2") registerTransferField( -1, "np03" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 38 ) {
		if (quest.getVar( "r6way4" ) == "3") registerTransferField( -1, "np03" );		
		else registerTransferField( -1, "np16" );		
		end;
	} else if ( portal.getPortalID == 39 ) {
		if (quest.getVar( "r6way4" ) == "4") registerTransferField( -1, "np03" );		
		else registerTransferField( -1, "np16" );		
		end;
	//��5
	} else if ( portal.getPortalID == 40 ) {
		if (quest.getVar( "r6way5" ) == "1") registerTransferField( -1, "np04" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 41 ) {
		if (quest.getVar( "r6way5" ) == "2") registerTransferField( -1, "np04" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 42 ) {
		if (quest.getVar( "r6way5" ) == "3") registerTransferField( -1, "np04" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 43 ) {
		if (quest.getVar( "r6way5" ) == "4") registerTransferField( -1, "np04" );		
		else registerTransferField( -1, "np03" );		
		end;
	//��6
	} else if ( portal.getPortalID == 44 ) {
		if (quest.getVar( "r6way6" ) == "1") registerTransferField( -1, "np05" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 45 ) {
		if (quest.getVar( "r6way6" ) == "2") registerTransferField( -1, "np05" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 46 ) {
		if (quest.getVar( "r6way6" ) == "3") registerTransferField( -1, "np05" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 47 ) {
		if (quest.getVar( "r6way6" ) == "4") registerTransferField( -1, "np05" );		
		else registerTransferField( -1, "np03" );		
		end;

	} else if ( portal.getPortalID == 48 ) {
		if (quest.getVar( "r6way7" ) == "1") registerTransferField( -1, "np06" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 49 ) {
		if (quest.getVar( "r6way7" ) == "2") registerTransferField( -1, "np06" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 50 ) {
		if (quest.getVar( "r6way7" ) == "3") registerTransferField( -1, "np06" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 51 ) {
		if (quest.getVar( "r6way7" ) == "4") registerTransferField( -1, "np06" );		
		else registerTransferField( -1, "np03" );		
		end;

	} else if ( portal.getPortalID == 52 ) {
		if (quest.getVar( "r6way8" ) == "1") registerTransferField( -1, "np07" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 53 ) {
		if (quest.getVar( "r6way8" ) == "2") registerTransferField( -1, "np07" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 54 ) {
		if (quest.getVar( "r6way8" ) == "3") registerTransferField( -1, "np07" );		
		else registerTransferField( -1, "np03" );		
		end;
	} else if ( portal.getPortalID == 55 ) {
		if (quest.getVar( "r6way8" ) == "4") registerTransferField( -1, "np07" );		
		else registerTransferField( -1, "np03" );		
		end;

	} else if ( portal.getPortalID == 56 ) {
		if (quest.getVar( "r6way9" ) == "1") registerTransferField( -1, "np08" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 57 ) {
		if (quest.getVar( "r6way9" ) == "2") registerTransferField( -1, "np08" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 58 ) {
		if (quest.getVar( "r6way9" ) == "3") registerTransferField( -1, "np08" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 59 ) {
		if (quest.getVar( "r6way9" ) == "4") registerTransferField( -1, "np08" );		
		else registerTransferField( -1, "np07" );		
		end;

	} else if ( portal.getPortalID == 60 ) {
		if (quest.getVar( "r6way10" ) == "1") registerTransferField( -1, "np09" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 61 ) {
		if (quest.getVar( "r6way10" ) == "2") registerTransferField( -1, "np09" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 62 ) {
		if (quest.getVar( "r6way10" ) == "3") registerTransferField( -1, "np09" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 63 ) {
		if (quest.getVar( "r6way10" ) == "4") registerTransferField( -1, "np09" );		
		else registerTransferField( -1, "np07" );		
		end;	
		
	} else if ( portal.getPortalID == 64 ) {
		if (quest.getVar( "r6way11" ) == "1") registerTransferField( -1, "np10" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 65 ) {
		if (quest.getVar( "r6way11" ) == "2") registerTransferField( -1, "np10" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 66 ) {
		if (quest.getVar( "r6way11" ) == "3") registerTransferField( -1, "np10" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 67 ) {
		if (quest.getVar( "r6way11" ) == "4") registerTransferField( -1, "np10" );		
		else registerTransferField( -1, "np07" );		
		end;

	} else if ( portal.getPortalID == 68 ) {
		if (quest.getVar( "r6way12" ) == "1") registerTransferField( -1, "np11" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 69 ) {
		if (quest.getVar( "r6way12" ) == "2") registerTransferField( -1, "np11" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 70 ) {
		if (quest.getVar( "r6way12" ) == "3") registerTransferField( -1, "np11" );		
		else registerTransferField( -1, "np07" );		
		end;
	} else if ( portal.getPortalID == 71 ) {
		if (quest.getVar( "r6way12" ) == "4") registerTransferField( -1, "np11" );		
		else registerTransferField( -1, "np07" );		
		end;

	} else if ( portal.getPortalID == 72 ) {
		if (quest.getVar( "r6way13" ) == "1") registerTransferField( -1, "np12" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 73) {
		if (quest.getVar( "r6way13" ) == "2") registerTransferField( -1, "np12" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 74 ) {
		if (quest.getVar( "r6way13" ) == "3") registerTransferField( -1, "np12" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 75 ) {
		if (quest.getVar( "r6way13" ) == "4") registerTransferField( -1, "np12" );		
		else registerTransferField( -1, "np11" );		
		end;

	} else if ( portal.getPortalID == 76 ) {
		if (quest.getVar( "r6way14" ) == "1") registerTransferField( -1, "np13" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 77 ) {
		if (quest.getVar( "r6way14" ) == "2") registerTransferField( -1, "np13" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 78 ) {
		if (quest.getVar( "r6way14" ) == "3") registerTransferField( -1, "np13" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 79 ) {
		if (quest.getVar( "r6way14" ) == "4") registerTransferField( -1, "np13" );		
		else registerTransferField( -1, "np11" );		
		end;

	} else if ( portal.getPortalID == 80 ) {
		if (quest.getVar( "r6way15" ) == "1") registerTransferField( -1, "np14" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 81 ) {
		if (quest.getVar( "r6way15" ) == "2") registerTransferField( -1, "np14" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 82 ) {
		if (quest.getVar( "r6way15" ) == "3") registerTransferField( -1, "np14" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 83 ) {
		if (quest.getVar( "r6way15" ) == "4") registerTransferField( -1, "np14" );		
		else registerTransferField( -1, "np11" );		
		end;
	//�����
	} else if ( portal.getPortalID == 84 ) {
		if (quest.getVar( "r6way16" ) == "1") registerTransferField( -1, "np15" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 85 ) {
		if (quest.getVar( "r6way16" ) == "2") registerTransferField( -1, "np15" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 86 ) {
		if (quest.getVar( "r6way16" ) == "3") registerTransferField( -1, "np15" );		
		else registerTransferField( -1, "np11" );		
		end;
	} else if ( portal.getPortalID == 87 ) {
		if (quest.getVar( "r6way16" ) == "4") registerTransferField( -1, "np15" );		
		else registerTransferField( -1, "np11" );		
		end;
	}
}

//���濡���� ����
script "party3_roomout" {
	quest = FieldSet( "Party5" );

	if ( target.isPartyBoss != 1 ) {
		say = "Apenas o l�der do grupo pode tomar a decis�o de sair desta sala ou n�o.";
		target.message( say );
		end;
	} else  {
		field = portal.field;
		if ( field.id == 920010200 ) {
			retportal = "in00"; 
			retst = "<Walkway>";
		} else if ( field.id == 920010300 ) {
			retportal = "in01";
			retst = "<Storage>";
		} else if ( field.id == 920010400 ) {
			retportal = "in02";
			retst = "<Lobby>";
		} else if ( field.id == 920010500 ) {
			retportal = "in03";
			retst = "<Sala Lacrada>";
		} else if ( field.id == 920010600 ) {
			retportal = "in04";
			retst= "<Sal�o>";
			if ( Field( 920010601 ).getUserCount != 0 or Field( 920010602 ).getUserCount != 0 or Field( 920010603 ).getUserCount != 0 or Field( 920010604 ).getUserCount != 0 ) {
				say = "Voc� n�o pode sair porque algu�m no seu grupo ainda est� na sala.";
				target.message( say );
				end;
			}
		} else if ( field.id == 920010700 ) {
			retportal = "in05";	
			retst = "<Para Cima>";
		} else if ( field.id == 920011000 ) {
			retportal = "in06";
			retst = "<Sala da Escurid�o>";
		}

		say = "O l�der do grupo saiu" + retst + ".";
		quest.broadcastMsg( 6, say );
		field.transferFieldAll( 920010100, retportal );
	}
}

script "party3_gardenin" {
	quest = FieldSet( "Party5" );
	if ( target.isPartyBoss != 1 ) {
		say = "Apenas o l�der do grupo pode tomar a decis�o de sair desta sala ou n�o.";
		target.message( say );
	} else {
		inven = target.inventory;
		if ( inven.itemCount( 4001055 ) > 0 ) {
			quest.transferFieldAll( 920010100, "st02" );
		} else {
			say = "Precisamos do poder da Erva da Vida.";
			target.message( say );
			end;
		}
	}
}

//����1~3
script "party3_jail1" {
	say = string( portal.getPortalID );
//	target.message( say );	
	
	uNum = Field( 920010910 ).getUserCount + Field( 920010911 ).getUserCount + Field( 920010912 ).getUserCount;
	if ( uNum > 0 ) {
		say = "Algu�m j� est� l� dentro.";
		target.message( say );
		end;
	} else registerTransferField( 920010910, "out00" );
}

script "party3_jail2" {
	say = string( portal.getPortalID );
//	target.message( say );	

	uNum = Field( 920010920 ).getUserCount + Field( 920010921 ).getUserCount + Field( 920010922 ).getUserCount;
	if ( uNum > 0 ) {
		say = "Algu�m j� est� l� dentro.";
		target.message( say );
		end;
	} else registerTransferField( 920010920, "out00" );
}

script "party3_jail3" {
	say = string( portal.getPortalID );
//	target.message( say );	
	
	uNum = Field( 920010930 ).getUserCount + Field( 920010931 ).getUserCount + Field( 920010932 ).getUserCount;
	if ( uNum > 0 ) {
		say = "Algu�m j� est� l� dentro.";
		target.message( say );
		end;
	} else registerTransferField( 920010930, "out00" );
}

script "party3_jailin" {
	field = portal.field;
	if ( field.id == 920010910 ) {
		if ( field.getMobCount( 9300044 ) == 0 ) {
			 registerTransferField( 920010912, "out00" );
		} else registerTransferField( 920010911, "out00" );
	} else if ( field.id == 920010920 ) {
		if ( field.getMobCount( 9300044 ) == 0 ) {
			 registerTransferField( 920010922, "out00" );
		} else registerTransferField( 920010921, "out00" );
	} else if ( field.id == 920010930 ) {
		if ( field.getMobCount( 9300044 ) == 0 ) {
			 registerTransferField( 920010932, "out00" );
		} else registerTransferField( 920010931, "out00" );
	} 
}

