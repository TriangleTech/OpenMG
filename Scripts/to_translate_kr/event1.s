module "standard.s";

//�ֹ��� ��ȯ �̺�Ʈ 07�� 3�� 5�� ���� �Ѵް� ���� ������
function( integer ) scroll_today {
	qr = target.questRecord;
	today = substring( currentTime, 0, 8 );
	qs1 = qr.getState( 9682 ); //3�� 5��
	qs2 = qr.getState( 9683 ); //3�� 12��
	qs3 = qr.getState( 9684 ); //3�� 19��
	qs4 = qr.getState( 9685 ); //3�� 26��
	add = 0;

	for ( i=0..3 ) {
		r1 = qr.getState( 9682 + i );
		if ( r1 == 1 ) add ++;
	}

	if ( add > 1 ) {
		self.say( "3�� 5��, 12��, 19��, 26���� ���ϸ��� �̺�Ʈ�� �ѹ��� �ϳ��� �������̾�� �ϴϱ�, ������ ����Ʈ�� ������ ��." );
		end;
	}

//	if ( serverType == 1 ) { //���߼��� �׽�Ʈ
	if ( serverType == 2 ) {
		if ( today == "07/02/07" ) {
			if ( qs1 == 1 and qs2 != 1 and qs3 != 1 and qs4 != 1 ) return 0;
		} else if ( today == "07/02/08" ) {
			if ( qs1 != 1 and qs2 == 1 and qs3 != 1 and qs4 != 1) return 1;
		} else if ( today == "07/02/09" ) {
			if ( qs1 != 1 and qs2 != 1 and qs3 == 1 and qs4 != 1 ) return 2;
		} else if ( today == "07/02/10" ) {
			if ( qs1 != 1 and qs2 != 1 and qs3 != 1 and qs4 == 1 ) return 3;
		}
	} else {
		if ( today == "07/03/05" ) {
			if ( qs1 == 1 and qs2 != 1 and qs3 != 1 and qs4 != 1 ) return 0;
		} else if ( today == "07/03/12" ) {
			if ( qs1 != 1 and qs2 == 1 and qs3 != 1 and qs4 != 1) return 1;
		} else if ( today == "07/03/19" ) {
			if ( qs1 != 1 and qs2 != 1 and qs3 == 1 and qs4 != 1 ) return 2;
		} else if ( today == "07/03/26" ) {
			if ( qs1 != 1 and qs2 != 1 and qs3 != 1 and qs4 == 1 ) return 3;
		}
	}
	return -1;
}

function scroll_tCheck {
	ret = scroll_today;
	if ( ret == -1 ) {
		self.say( "�ֹ��� ��ȯ �̺�Ʈ ������ Ȩ������ ���� Ȯ���� ��." );
		end;
	}
	return;
}

function( integer ) scroll( integer code ) {
	scroll_tCheck;

	qr = target.questRecord;
	inven = target.inventory;
	//����
	//������1
	if ( code == 2043001 ) code_chg = 2043011;
	if ( code == 2043002 ) code_chg = 2043012;
	if ( code == 2043101 ) code_chg = 2043106;
	if ( code == 2043102 ) code_chg = 2043107;
	if ( code == 2043201 ) code_chg = 2043206;
	if ( code == 2043202 ) code_chg = 2043207;
	if ( code == 2043301 ) code_chg = 2043306;
	if ( code == 2043302 ) code_chg = 2043307;
	if ( code == 2043701 ) code_chg = 2043706;
	if ( code == 2043702 ) code_chg = 2043707;
	//������2
	if ( code == 2043801 ) code_chg = 2043806;
	if ( code == 2043802 ) code_chg = 2043807;
	if ( code == 2044001 ) code_chg = 2044006;
	if ( code == 2044002 ) code_chg = 2044007;
	if ( code == 2044101 ) code_chg = 2044106;
	if ( code == 2044102 ) code_chg = 2044107;
	if ( code == 2044201 ) code_chg = 2044206;
	if ( code == 2044202 ) code_chg = 2044207;
	if ( code == 2044301 ) code_chg = 2044306;
	if ( code == 2044302 ) code_chg = 2044307;
	//������3
	if ( code == 2044401 ) code_chg = 2044406;
	if ( code == 2044402 ) code_chg = 2044407;
	if ( code == 2044501 ) code_chg = 2044506;
	if ( code == 2044502 ) code_chg = 2044507;
	if ( code == 2044601 ) code_chg = 2044606;
	if ( code == 2044602 ) code_chg = 2044607;
	if ( code == 2044701 ) code_chg = 2044706;
	if ( code == 2044702 ) code_chg = 2044707;
	//�����
	if ( code == 2048001 ) code_chg = 2048006;
	if ( code == 2048002 ) code_chg = 2048007;
	if ( code == 2048004 ) code_chg = 2048008;
	if ( code == 2048005 ) code_chg = 2048009;
	
	//��
	if ( code == 2040001 ) code_chg = 2040019;
	if ( code == 2040002 ) code_chg = 2040020;
	if ( code == 2040004 ) code_chg = 2040021;
	if ( code == 2040005 ) code_chg = 2040022;
	if ( code == 2040301 ) code_chg = 2040313;
	if ( code == 2040302 ) code_chg = 2040314;
	if ( code == 2040401 ) code_chg = 2040415;
	if ( code == 2040402 ) code_chg = 2040416;
	if ( code == 2040501 ) code_chg = 2040522;
	if ( code == 2040502 ) code_chg = 2040523;
	//������2
	if ( code == 2040504 ) code_chg = 2040524;
	if ( code == 2040505 ) code_chg = 2040525;
	if ( code == 2040513 ) code_chg = 2040526;
	if ( code == 2040514 ) code_chg = 2040527;
	if ( code == 2040516 ) code_chg = 2040528;
	if ( code == 2040517 ) code_chg = 2040529;
	if ( code == 2040601 ) code_chg = 2040615;
	if ( code == 2040602 ) code_chg = 2040616;
	if ( code == 2040701 ) code_chg = 2040718;
	if ( code == 2040702 ) code_chg = 2040719;
	//������3
	if ( code == 2040704 ) code_chg = 2040720;
	if ( code == 2040705 ) code_chg = 2040721;
	if ( code == 2040707 ) code_chg = 2040722;
	if ( code == 2040708 ) code_chg = 2040723;
	if ( code == 2040801 ) code_chg = 2040819;
	if ( code == 2040802 ) code_chg = 2040820;
	if ( code == 2040804 ) code_chg = 2040821;
	if ( code == 2040805 ) code_chg = 2040822;
	if ( code == 2040901 ) code_chg = 2040910;
	if ( code == 2040902 ) code_chg = 2040911;
	//������4
	if ( code == 2041001 ) code_chg = 2041042;
	if ( code == 2041002 ) code_chg = 2041043;
	if ( code == 2041004 ) code_chg = 2041044;
	if ( code == 2041005 ) code_chg = 2041045;
	if ( code == 2041007 ) code_chg = 2041046;
	if ( code == 2041008 ) code_chg = 2041047;
	if ( code == 2041010 ) code_chg = 2041048;
	if ( code == 2041011 ) code_chg = 2041049;
	if ( code == 2041013 ) code_chg = 2041050;
	if ( code == 2041014 ) code_chg = 2041051;
	//������5
	if ( code == 2041016 ) code_chg = 2041052;
	if ( code == 2041017 ) code_chg = 2041053;
	if ( code == 2041019 ) code_chg = 2041054;
	if ( code == 2041020 ) code_chg = 2041055;
	if ( code == 2041022 ) code_chg = 2041056;
	if ( code == 2041023 ) code_chg = 2041057;		

	yn = self.askYesNo( "������ #b#z" + code + "##k�� ��ȯ�ϰھ�?" );
	scroll_tCheck;
	if ( yn == 0 ) self.say( "�ٽ� �� ������ ���� ���� �ɾ���." );
	else {
		ret = inven.exchange( 0, code, -1, code_chg, 1 );
		if ( ret == 0 ) {
			self.say( "��ȯ�� �ֹ����� ������ �ִ���, �Һ�â�� �� ĭ�� �ִ��� Ȯ���� ��." );
			end;
		} else {
			tNum = scroll_today;
			if ( tNum == -1 ) {
				self.say( "�ֹ��� ��ȯ �̺�Ʈ ������ Ȩ���������� Ȯ���� ��." );
				end;
			}

			db = qr.get( 7720 );
			num = integer( substring( db, tNum, 1 )) + 1;
			if ( tNum == 0 ) {
				result = string( num ) + substring( db, 1, 3 );
			} else if ( tNum == 1 ) {
				result = substring( db, 0, 1 ) + string( num ) + substring( db, 2, 2 );
			} else if ( tNum == 2 ) {
				result = substring( db, 0, 2 ) + string( num ) + substring( db, 3, 1 );
			} else {
				result = substring( db, 0, 3 ) + string( num );
			}
			
			qr.set( 7720, result );
			a = qr.get( 7720 );
//			target.message( a );

			if ( num >= 5 ) {
				result2 = scroll_today;
				if ( tNum == 0 ) {
					if ( qr.getState( 9682 ) == 1 ) {
						qr.setComplete( 9682 );
						target.questEndEffect;
					}
				} else if ( tNum == 1 ) {
					if ( qr.getState( 9683 ) == 1 ) {
						qr.setComplete( 9683 );
						target.questEndEffect;
					}
				} else if ( tNum == 2 ) {
					if ( qr.getState( 9684 ) == 1 ) {
						qr.setComplete( 9684 );
						target.questEndEffect;
					}
				} else if ( tNum == 3 ) {
					if ( qr.getState( 9685 ) == 1 ) {
						qr.setComplete( 9685 );
						target.questEndEffect;
					}
				}
				if ( result2 < 4 ) self.say( "¥��. � �ֹ����� ������ �ɷ� #b����Ȯ���� 5%#k �� ��������? ���� �� �̻� ������ �� �� ���ھ�. ���� �����Ͽ� ���� ã�ƿ�." );
				else self.say( "¥��. � �ֹ����� ������ �ɷ� ����Ȯ���� 5% �� ��������? ���� �� �̻� ������ �� �� ���ھ�. �׷� �߰�." );
			} else self.say( "¥��. � �ֹ����� ������ �ɷ� ����Ȯ���� 5% �� ��������? ���� ������#b " +  ( 5 - num ) + " ȸ#k �� ������ �ɾ� �� �� �־�. �� �ʿ��ϸ� ���� ã�ƿ�." );		
		}
	}
	return 1;
}

function scrollchange {
	qr = target.questRecord;
	if ( qr.get( 7720 ) == "" ) {
		qr.set( 7720, "0000" );
	}

	result = scroll_today;
	inven = target.inventory;
	ret = 0;
	
	if ( result == -1 ) {
		self.say( "����Ʈ�� ���� �ʾҰų�, �̺�Ʈ ������ �������� �ƴϾ�. " );
		end;
	} else {
		text = substring( qr.get( 7720 ), result, 1);
		num = integer( text ); //�ֹ��� �ٲ� Ƚ��
		if ( num < 5 ) {
			val1 = self.askYesNo( "#b���ϸ��� �̺�Ʈ!#k 3�� �� �޵��� ���� �����Ͽ��� �� ī������� �ֹ����� ������ �ɾ� ����Ȯ���� 5% �� ���� �ֹ����� ����� �ְ� �־�. ��� ������ �� �ֹ����� ��ȯ�� �� �� ���� ��. � �ѹ� �غ���?" );
			if ( val1 == 0 ) {
				self.say( "�ֹ����� ������ �Ŵ� ���� ���� ���� �����. �׷��� 3�� �� ���� �����Ͽ��� ������. ������ �ٲ�� ������ ���� �� ã�ƿ�." );
				end;
			}  else {
				v0 = self.askMenu( "� ������ �ֹ����� ��ȯ���׾�?\r\n#b#L0# ����� �ֹ��� ��ȯ#l\r\n#L1# ���� �ֹ��� ��ȯ#l\r\n#L2# ������ �ֹ��� ��ȯ#l" );
				if ( v0 == 0 ) {
					while (1) {
						menu0 = self.askMenu( "��ȯ�� �ֹ����� ��������.\r\b#b#L0# #z2043001##l\r\n#L1# #z2043002##l\r\n#L2# #z2043101##l\r\n#L3# #z2043102##l\r\n#L4# #z2043201##l\r\n#L5# #z2043202##l\r\n#L6# #z2043301##l\r\n#L7# #z2043302##l\r\n#L8# #z2043701##l\r\n#L9# #z2043702##l\r\n#k#L10# ���� ��������(1/3)#l" );
						result2 = scroll_today;
						if( result2 != result ) {
							self.say( "�̹� �ð��� ������ �ֹ����� ��ȯ�� �� �� ����." );
							end;
						} else {
							if ( menu0 == 0 ) ret = scroll( 2043001 );
							else if ( menu0 == 1 ) ret = scroll( 2043002 );
							else if ( menu0 == 2 ) ret = scroll( 2043101 );
							else if ( menu0 == 3 ) ret = scroll( 2043102 );
							else if ( menu0 == 4 ) ret = scroll( 2043201 );
							else if ( menu0 == 5 ) ret = scroll( 2043202 );
							else if ( menu0 == 6 ) ret = scroll( 2043301 );
							else if ( menu0 == 7 ) ret = scroll( 2043302 );
							else if ( menu0 == 8 ) ret = scroll( 2043701 );
							else if ( menu0 == 9 ) ret = scroll( 2043702 );
							//2��°
							else if ( menu0 == 10 ) {
								menu1 = self.askMenu( "��ȯ�� �ֹ����� ��������.\r\b#b#L0# #z2043801##l\r\n#L1# #z2043802##l\r\n#L2# #z2044001##l\r\n#L3# #z2044002##l\r\n#L4# #z2044101##l\r\n#L5# #z2044102##l\r\n#L6# #z2044201##l\r\n#L7# #z2044202##l\r\n#L8# #z2044301##l\r\n#L9# #z2044302##l\r\n#k#L10# ���� ��������(2/3)#l" );
								if ( menu1 == 0 ) ret = scroll( 2043801 );
								else if ( menu1 == 1 ) ret = scroll( 2043802 );
								else if ( menu1 == 2 ) ret = scroll( 2044001 );
								else if ( menu1 == 3 ) ret = scroll( 2044002 );
								else if ( menu1 == 4 ) ret = scroll( 2044101 );
								else if ( menu1 == 5 ) ret = scroll( 2044102 );
								else if ( menu1 == 6 ) ret = scroll( 2044201 );
								else if ( menu1 == 7 ) ret = scroll( 2044202 );
								else if ( menu1 == 8 ) ret = scroll( 2044301 );
								else if ( menu1 == 9 ) ret = scroll( 2044302 );
								//3��°
								else if ( menu1 == 10 ) {
									menu2 = self.askMenu( "��ȯ�� �ֹ����� ��������.\r\b#b#L0# #z2044401##l\r\n#L1# #z2044402##l\r\n#L2# #z2044501##l\r\n#L3# #z2044502##l\r\n#L4# #z2044601##l\r\n#L5# #z2044602##l\r\n#L6# #z2044701##l\r\n#L7# #z2044702##l\r\n#k#L8# ù��������(3/3)#l" );
									if ( menu2 == 0 ) ret = scroll( 2044401 );
									else if ( menu2 == 1 ) ret = scroll( 2044402 );
									else if ( menu2 == 2 ) ret = scroll( 2044501 );
									else if ( menu2 == 3 ) ret = scroll( 2044502 );
									else if ( menu2 == 4 ) ret = scroll( 2044601 );
									else if ( menu2 == 5 ) ret = scroll( 2044602 );
									else if ( menu2 == 6 ) ret = scroll( 2044701 );
									else if ( menu2 == 7 ) ret = scroll( 2044702 );
								}
							}
							if ( ret == 1 ) break;
						}

					}
				} else if ( v0 == 1 ) {
					while (1) {
						menu0 = self.askMenu( "��ȯ�� �ֹ����� ��������.\r\b#b#L0# #z2040001##l\r\n#L1# #z2040002##l\r\n#L2# #z2040004##l\r\n#L3# #z2040005##l\r\n#L4# #z2040301##l\r\n#L5# #z2040302##l\r\n#L6# #z2040401##l\r\n#L7# #z2040402##l\r\n#L8# #z2040501##l\r\n#L9# #z2040502##l\r\n#k#L10# ���� ��������(1/5)#l" );
						result2 = scroll_today;
						if( result2 != result ) {
							self.say( "�̹� �ð��� ������ �ֹ����� ��ȯ�� �� �� ����." );
							end;
						} else {
							if ( menu0 == 0 ) ret = scroll( 2040001 );
							else if ( menu0 == 1 ) ret = scroll( 2040002 );
							else if ( menu0 == 2 ) ret = scroll( 2040004 );
							else if ( menu0 == 3 ) ret = scroll( 2040005 );
							else if ( menu0 == 4 ) ret = scroll( 2040301 );
							else if ( menu0 == 5 ) ret = scroll( 2040302 );
							else if ( menu0 == 6 ) ret = scroll( 2040401 );
							else if ( menu0 == 7 ) ret = scroll( 2040402 );
							else if ( menu0 == 8 ) ret = scroll( 2040501 );
							else if ( menu0 == 9 ) ret = scroll( 2040502 );
							//2��°
							else if ( menu0 == 10 ) {
								menu1 = self.askMenu( "��ȯ�� �ֹ����� ��������.\r\b#b#L0# #z2040504##l\r\n#L1# #z2040505##l\r\n#L2# #z2040513##l\r\n#L3# #z2040514##l\r\n#L4# #z2040516##l\r\n#L5# #z2040517##l\r\n#L6# #z2040601##l\r\n#L7# #z2040602##l\r\n#L8# #z2040701##l\r\n#L9# #z2040702##l\r\n#k#L10# ���� ��������(2/5)#l" );
								if ( menu1 == 0 ) ret = scroll(  2040504 );
								else if ( menu1 == 1 ) ret = scroll( 2040505 );
								else if ( menu1 == 2 ) ret = scroll( 2040513 );
								else if ( menu1 == 3 ) ret = scroll( 2040514 );
								else if ( menu1 == 4 ) ret = scroll( 2040516 );
								else if ( menu1 == 5 ) ret = scroll( 2040517 );
								else if ( menu1 == 6 ) ret = scroll( 2040601 );
								else if ( menu1 == 7 ) ret = scroll( 2040602 );
								else if ( menu1 == 8 ) ret = scroll( 2040701 );
								else if ( menu1 == 9 ) ret = scroll( 2040702 );
								//3��°
								else if ( menu1 == 10 ) {
									menu2 = self.askMenu( "��ȯ�� �ֹ����� ��������.\r\b#b#L0# #z2040704##l\r\n#L1# #z2040705##l\r\n#L2# #z2040707##l\r\n#L3# #z2040708##l\r\n#L4# #z2040801##l\r\n#L5# #z2040802##l\r\n#L6# #z2040804##l\r\n#L7# #z2040805##l\r\n#L8# #z2040901##l\r\n#L9# #z2040902##l\r\n#k#L10# ���� ��������(3/5)#l" );
									if ( menu2 == 0 ) ret = scroll( 2040704 );
									else if ( menu2 == 1 ) ret = scroll( 2040705 );
									else if ( menu2 == 2 ) ret = scroll( 2040707 );
									else if ( menu2 == 3 ) ret = scroll( 2040708 );
									else if ( menu2 == 4 ) ret = scroll( 2040801 );
									else if ( menu2 == 5 ) ret = scroll( 2040802 );
									else if ( menu2 == 6 ) ret = scroll( 2040804 );
									else if ( menu2 == 7 ) ret = scroll( 2040805 );
									else if ( menu2 == 8 ) ret = scroll( 2040901 );
									else if ( menu2 == 9 ) ret = scroll( 2040902 );
									//3��°
									else if ( menu2 == 10 ) {
										menu3 = self.askMenu( "��ȯ�� �ֹ����� ��������.\r\b#b#L0# #z2041001##l\r\n#L1# #z2041002##l\r\n#L2# #z2041004##l\r\n#L3# #z2041005##l\r\n#L4# #z2041007##l\r\n#L5# #z2041008##l\r\n#L6# #z2041010##l\r\n#L7# #z2041011##l\r\n#L8# #z2041013##l\r\n#L9# #z2041014##l\r\n#k#L10# ���� ��������(4/5)#l" );
										if ( menu3 == 0 ) ret = scroll( 2041001 );
										else if ( menu3 == 1 ) ret = scroll( 2041002 );
										else if ( menu3 == 2 ) ret = scroll( 2041004 );
										else if ( menu3 == 3 ) ret = scroll( 2041005 );
										else if ( menu3 == 4 ) ret = scroll( 2041007 );
										else if ( menu3 == 5 ) ret = scroll( 2041008 );
										else if ( menu3 == 6 ) ret = scroll( 2041010 );
										else if ( menu3 == 7 ) ret = scroll( 2041011 );
										else if ( menu3 == 8 ) ret = scroll( 2041013 );
										else if ( menu3 == 9 ) ret = scroll( 2041014 );
										//4��°
										else if ( menu3 == 10 ) {
											menu4 = self.askMenu( "��ȯ�� �ֹ����� ��������.\r\b#b#L0# #z2041016##l\r\n#L1# #z2041017##l\r\n#L2# #z2041019##l\r\n#L3# #z2041020##l\r\n#L4# #z2041022##l\r\n#L5# #z2041023##l\r\n#k#L6# ù ��������(5/5)#l" );
											if ( menu4 == 0 ) ret = scroll( 2041016 );
											else if ( menu4 == 1 ) ret = scroll( 2041017 );
											else if ( menu4 == 2 ) ret = scroll( 2041019 );
											else if ( menu4 == 3 ) ret = scroll( 2041020 );
											else if ( menu4 == 4 ) ret = scroll( 2041022 );
											else if ( menu4 == 5 ) ret = scroll( 2041023 );
										}
									}
								}
							}
							if ( ret == 1 ) break;
						}
					}
				} else if ( v0 == 2) {
					menu0 = self.askMenu( "��ȯ �� �ֹ����� ��������.\r\b#b#L0# #z2048001##l\r\n#L1# #z2048002##l\r\n#L2# #z2048004##l\r\n#L3# #z2048005##l" );
					result2 = scroll_today;
					if( result2 != result ) {
						self.say( "�̹� �ð��� ������ �ֹ����� ��ȯ�� �� �� ����." );
						end;
					} else {
						if ( menu0 == 0 ) ret = scroll( 2048001 );
						if ( menu0 == 1 ) ret = scroll( 2048002 );
						if ( menu0 == 2 ) ret = scroll( 2048004 );
						if ( menu0 == 3 ) ret = scroll( 2048005 );
					}
				}
			}
		} else {
			self.say( "������ �ֹ����� ��� ��ȯ�߾�." );
		}
	}
	return;
}

script "scrollchange1" {
	today = substring( currentTime, 0, 8 );
	if ( today != "07/03/05" ) {
		self.say( "����Ʈ�� ���� �ʾҰų�, �̺�Ʈ ������ �������� �ƴϾ�." );
		end;
	} else {
		scrollchange;
	}
}

script "scrollchange2" {
	today = substring( currentTime, 0, 8 );
	if ( today != "07/03/12" ) {
		self.say( "����Ʈ�� ���� �ʾҰų�, �̺�Ʈ ������ �������� �ƴϾ�." );
		end;
	} else {
		scrollchange;
	}
}

script "scrollchange3" {
	today = substring( currentTime, 0, 8 );
	if ( today != "07/03/19" ) {
		self.say( "����Ʈ�� ���� �ʾҰų�, �̺�Ʈ ������ �������� �ƴϾ�." );
		end;
	} else {
		scrollchange;
	}
}

script "scrollchange4" {
	today = substring( currentTime, 0, 8 );
	if ( today != "07/03/26" ) {
		self.say( "����Ʈ�� ���� �ʾҰų�, �̺�Ʈ ������ �������� �ƴϾ�." );
		end;
	} else {
		scrollchange;
	}
}


//���丮��
function( integer ) selectedMob_LevelList1( integer level ) {
	if ( level <= 10 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o130100##l\r\n#L1# #o130101##l\r\n#L2# #o210100##l\r\n#L3# #o1210100##l\r\n#L4# #o1210102##l\r\n#L5# #o1110101##l\r\n#L6# #o1210101##l\r\n#k#L11# ���� ����#l" );
		if ( v0 == 0 ) return 130100;
		else if ( v0 == 1 ) return 130101;
		else if ( v0 == 2 ) return 210100;
		else if ( v0 == 3 ) return 1210100;
		else if ( v0 == 4 ) return 1210102;
		else if ( v0 == 5 ) return 1110101;
		else if ( v0 == 6 ) return 1210101;
	} else if ( level > 10 and level <= 20 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o1120100##l\r\n#L1# #o1110100##l\r\n#L2# #o1210103##l\r\n#L3# #o1130100##l\r\n#L4# #o1140100##l\r\n#L5# #o2220100##l\r\n#L6# #o2300100##l\r\n#k#L11# ���� ����#l" );
		if ( v0 == 0 ) return 1120100;
		else if ( v0 == 1 ) return 1110100;
		else if ( v0 == 2 ) return 1210103;
		else if ( v0 == 3 ) return 1130100;
		else if ( v0 == 4 ) return 1140100;
		else if ( v0 == 5 ) return 2220100;
		else if ( v0 == 6 ) return 2300100;
	} else if ( level > 20 and level <= 30 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o2110200##l\r\n#L1# #o2130100##l\r\n#L2# #o2230110##l\r\n#L3# #o2230101##l\r\n#L4# #o2230111##l\r\n#L5# #o2230102##l\r\n#L6# #o2230100##l\r\n#k#L11# ���� ����#l" );
		if ( v0 == 0 ) return 2110200;
		else if ( v0 == 1 ) return 2130100;
		else if ( v0 == 2 ) return 2230110;
		else if ( v0 == 3 ) return 2230101;
		else if ( v0 == 4 ) return 2230111;
		else if ( v0 == 5 ) return 2230102;
		else if ( v0 == 6 ) return 2230100;
	} else if ( level > 30 and level <= 40 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3110100##l\r\n#L1# #o3210100##l\r\n#L2# #o3230100##l\r\n#L3# #o3230101##l\r\n#L4# #o3210800##l\r\n#L5# #o3230102##l\r\n#L6# #o4230100##l\r\n#L7# #o4230101##l\r\n#k#L11# ���� ����#l" );
		if ( v0 == 0 ) return 3110100;
		else if ( v0 == 1 ) return 3210100;
		else if ( v0 == 2 ) return 3230100;
		else if ( v0 == 3 ) return 3230101;
		else if ( v0 == 4 ) return 3210800;
		else if ( v0 == 5 ) return 3230102;
		else if ( v0 == 6 ) return 4230100;
		else if ( v0 == 7 ) return 4230101;
	} else if ( level > 40 and level <= 50 ) {
//		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o4230107##l\r\n#L1# #o4230103##l\r\n#L2# #o4230125##l\r\n#L3# #o4130100##l\r\n#L4# #o4230400##l\r\n#L5# #o4230126##l" + 
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L1# #o4230103##l\r\n#L2# #o4230125##l\r\n#L3# #o4130100##l\r\n#L4# #o4230400##l\r\n#L5# #o4230126##l" + 
		"\r\n#L6# #o4230102##l\r\n#L7# #o4230104##l\r\n#L8# #o5130100##l\r\n#L9# #o4130101##l\r\n#k#L11# ���� ����#l" );
//		"\r\n#L6# #o4230102##l\r\n#L7# #o4230104##l\r\n#L8# #o5130100##l\r\n#L9# #o5100000##l\r\n#k#L11# ���� ����#l" );
//		if ( v0 == 0 ) return 4230107;
		if ( v0 == 1 ) return 4230103;
		else if ( v0 == 2 ) return 4230125;
		else if ( v0 == 3 ) return 4130100;
		else if ( v0 == 4 ) return 4230400;
		else if ( v0 == 5 ) return 4230126;
		else if ( v0 == 6 ) return 4230102;
		else if ( v0 == 7 ) return 4230104;
		else if ( v0 == 8 ) return 5130100;
		else if ( v0 == 9 ) return 4130101;
//		else if ( v0 == 9 ) return 5100000;
	} else if ( level > 50 and level <= 60 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o5130103##l\r\n#L1# #o5300100##l\r\n#L2# #o5130101##l\r\n#L3# #o5150001##l\r\n#L4# #o5130102##l\r\n#L5# #o5150000##l\r\n#L6# #o6130100##l\r\n#k#L11# ���� ����#l" );
		if ( v0 == 0 ) return 5130103;
		else if ( v0 == 1 ) return 5300100;
		else if ( v0 == 2 ) return 5130101;
		else if ( v0 == 3 ) return 5150001;
		else if ( v0 == 4 ) return 5130102;
		else if ( v0 == 5 ) return 5150000;
		else if ( v0 == 6 ) return 6130100;
	} else if ( level > 60 and level <= 70 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o6230100##l\r\n#L1# #o6230602##l\r\n#L2# #o6230600##l\r\n#L3# #o6230601##l\r\n#L4# #o7130100##l\r\n#L5# #o7130103##l\r\n#L6# #o7130101##l\r\n#k#L11# ���� ����#l" );
		if ( v0 == 0 ) return 6230100;
		else if ( v0 == 1 ) return 6230602;
		else if ( v0 == 2 ) return 6230600;
		else if ( v0 == 3 ) return 6230601;
		else if ( v0 == 4 ) return 7130100;
		else if ( v0 == 5 ) return 7130103;
		else if ( v0 == 6 ) return 7130101;
	}
	return -1;
}

//���ø���
function( integer ) selectedMob_LevelList2( integer level ) {
	if ( level <= 10 ) {

	} else if ( level > 10 and level <= 20 ) {

	} else if ( level > 20 and level <= 30 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o2230108##l\r\n#L1# #o2230103##l\r\n#L2# #o5200000##l\r\n#L3# #o2230105##l\r\n#L4# #o2230107##l\r\n#L5# #o2230106##l\r\n" + 
			"#L6# #o2230109##l\r\n#L7# #o2230104##l\r\n#L8# #o2230200##l\r\n#L9# #o3000000##l\r\n#k#L10# ���� ������(1/3)#l" );
			if ( v0 == 0 ) return 2230108;
			else if ( v0 == 1 ) return 2230103;
			else if ( v0 == 2 ) return 5200000;
			else if ( v0 == 3 ) return 2230105;
			else if ( v0 == 4 ) return 2230107;
			else if ( v0 == 5 ) return 2230106;
			else if ( v0 == 6 ) return 2230109;
			else if ( v0 == 7 ) return 2230104;
			else if ( v0 == 8 ) return 2230200;
			else if ( v0 == 9 ) return 3000000;
			else if ( v0 == 10 ) {			
				v1 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3000005##l\r\n#L1# #o3000006##l\r\n#L2# #o5200001##l\r\n#L3# #o5200002##l\r\n#L4# #o2100100##l\r\n#L5# #o2100101##l\r\n#L6# #o2100102##l\r\n#L7# #o2100105##l\r\n#L8# #o2100106##l\r\n#L9# #o2100103##l\r\n#k#L10# ���� ������(2/3)#l" );
				if ( v1 == 0 ) return 3000005;
				else if ( v1 == 1 ) return 3000006;
				else if ( v1 == 2 ) return 5200001;
				else if ( v1 == 3 ) return 5200002;
				else if ( v1 == 4 ) return 2100100;
				else if ( v1 == 5 ) return 2100101;
				else if ( v1 == 6 ) return 2100102;
				else if ( v1 == 7 ) return 2100105;
				else if ( v1 == 8 ) return 2100106;
				else if ( v1 == 9 ) return 2100103;
				else if ( v1 == 10 ) {
					v2 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o2100107##l\r\n#L1# #o2100104##l\r\n#L2# #o2100108##l\r\n#L3# #o3100102##l\r\n#L4# #o2110300##l\r\n#L5# #o2110301##l\r\n#k#L10# ó�� ������(1/3)#l\r\n#L11# ���� ����#l" );
					if ( v2 == 0 ) return 2100107;
					else if ( v2 == 1 ) return 2100104;
					else if ( v2 == 2 ) return 2100108;
					else if ( v2 == 3 ) return 3100102;
					else if ( v2 == 4 ) return 2110300;//�𷡵δ���
					else if ( v2 == 5 ) return 2110301;//�����Ǿ�
					else if ( v2 == 11 ) break;
				}
			} 
		}
	} else if ( level > 30 and level <= 35 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3230307##l\r\n#L1# #o3230400##l\r\n#L2# #o3110101##l\r\n#L3# #o3110102##l\r\n#L4# #o5300000##l\r\n#L5# #o3230104##l\r\n" + 
			"#L6# #o3210200##l\r\n#L7# #o3210201##l\r\n#L8# #o3210202##l\r\n#L9# #o5300001##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return 3230307;
			else if ( v0 == 1 ) return 3230400;
			else if ( v0 == 2 ) return 3110101;
			else if ( v0 == 3 ) return 3110102;
			else if ( v0 == 4 ) return 5300000;
			else if ( v0 == 5 ) return 3230104;
			else if ( v0 == 6 ) return 3210200;
			else if ( v0 == 7 ) return 3210201;
			else if ( v0 == 8 ) return 3210202;
			else if ( v0 == 9 ) return 5300001;
			else if ( v0 == 10 ) {
				v1 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3210204##l\r\n#L1# #o3210205##l\r\n#L2# #o3210207##l\r\n#L3# #o3230200##l\r\n#L4# #o3230302##l\r\n#L5# #o5400000##l\r\n#L6# #o3100101##l\r\n#L7# #o3110300##l\r\n#L8# #o3110301##l\r\n#L9# #o3110302##l\r\n#k#L10# �� ������(2/2)#l\r\n#L11# ���� ����#l" );
				if ( v1 == 0 ) return 3210204;
				else if ( v1 == 1 ) return 3210205;
				else if ( v1 == 2 ) return 3210207;
				else if ( v1 == 3 ) return 3230200;
				else if ( v1 == 4 ) return 3230302;
				else if ( v1 == 5 ) return 5400000;
				else if ( v1 == 6 ) return 3100101;
				else if ( v1 == 7 ) return 3110300;//ť�꽽����
				else if ( v1 == 8 ) return 3110301;//�����𷡳�����
				else if ( v1 == 9 ) return 3110302;//���
				else if ( v1 == 11 ) break;
			}
		}
	} else if ( level > 35 and level <= 40 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3210203##l\r\n#L1# #o3210206##l\r\n#L2# #o3210450##l\r\n#L3# #o3210208##l\r\n#L4# #o3230303##l\r\n#L5# #o3230306##l\r\n" + 
			"#L6# #o3230103##l\r\n#L7# #o3230304##l\r\n#L8# #o3230405##l\r\n#L9# #o3230308##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return 3210203;
			else if ( v0 == 1 ) return 3210206;
			else if ( v0 == 2 ) return 3210450;
			else if ( v0 == 3 ) return 3210208;
			else if ( v0 == 4 ) return 3230303;
			else if ( v0 == 5 ) return 3230306;
			else if ( v0 == 6 ) return 3230103;
			else if ( v0 == 7 ) return 3230304;
			else if ( v0 == 8 ) return 3230405;
			else if ( v0 == 9 ) return 3230308;	
			else if ( v0 == 10 ) {
				v1 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3230305##l\r\n#L1# #o4230113##l\r\n#L2# #o4230116##l\r\n#L3# #o4230200##l\r\n#L4# #o4230201##l\r\n#L5# #o4230500##l\r\n#L6# #o4230600##l\r\n#L7# #o3110303##l\r\n#k#L10# �� ������(2/2)#l\r\n#L11# ���� ����#l" );
				if ( v1 == 0 ) return 3230305;
				else if ( v1 == 1 ) return 4230113;
				else if ( v1 == 2 ) return 4230116;
				else if ( v1 == 3 ) return 4230200;
				else if ( v1 == 4 ) return 4230201;
				else if ( v1 == 5 ) return 4230500;
				else if ( v1 == 6 ) return 4230600;
				else if ( v1 == 7 ) return 3110303;//Ʈ���÷��
				else if ( v1 == 11 ) break;
			}
		}
	} else if ( level > 40 and level <= 45 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o4230111##l\r\n#L1# #o4230114##l\r\n#L2# #o4230119##l\r\n#L3# #o4230501##l\r\n#L4# #o4230109##l\r\n#L5# #o4230117##l\r\n" + 
			"#L6# #o4230124##l\r\n#L7# #o4230108##l\r\n#L8# #o4230123##l\r\n#L9# #o4230502##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return 4230111;
			else if ( v0 == 1 ) return 4230114;
			else if ( v0 == 2 ) return 4230119;
			else if ( v0 == 3 ) return 4230501;
			else if ( v0 == 4 ) return 4230109;
			else if ( v0 == 5 ) return 4230117;
			else if ( v0 == 6 ) return 4230124;
			else if ( v0 == 7 ) return 4230108;
			else if ( v0 == 8 ) return 4230123;
			else if ( v0 == 9 ) return 4230502;	
			else if ( v0 == 10 ) {
				v1 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o4230120##l\r\n#L1# #o4230112##l\r\n#L2# #o4230106##l\r\n#L3# #o4230110##l\r\n#L4# #o4230118##l\r\n#L5# #o4230300##l\r\n#L6# #o4230503##l\r\n#L7# #o4230504##l\r\n#L8# #o4110300##l\r\n#L9# #o4110301##l\r\n#L10# #o4230107##l\r\n#k#L11# �� ������(2/2)#l\r\n#L12# ���� ����#l" );
				if ( v1 == 0 ) return 4230120;
				else if ( v1 == 1 ) return 4230112;
				else if ( v1 == 2 ) return 4230106;
				else if ( v1 == 3 ) return 4230110;
				else if ( v1 == 4 ) return 4230118;
				else if ( v1 == 5 ) return 4230300;
				else if ( v1 == 6 ) return 4230503;
				else if ( v1 == 7 ) return 4230504;
				else if ( v1 == 8 ) return 4110300; //���̾����
				else if ( v1 == 9 ) return 4110301; //��ȭ ���̾� ����
				else if ( v1 == 10 ) return 4230107; //�ö��� ����
				else if ( v1 == 12 ) break;
			}
		}
	} else if ( level > 45 and level <= 50 ) {
//		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o4230121##l\r\n#L1# #o4130101##l\r\n#L2# #o4230115##l\r\n#L3# #o4230505##l\r\n#L4# #o4230506##l\r\n#L5# #o4240000##l\r\n#L6# #o5100003##l\r\n#L7# #o5120503##l\r\n#L8# #o5100000##l\r\n#L9# #o4110302##l\r\n#L10# #o5110300##l\r\n#k#L11# ���� ����#l" );
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o4230121##l\r\n#L2# #o4230115##l\r\n#L3# #o4230505##l\r\n#L4# #o4230506##l\r\n#L5# #o4240000##l\r\n#L6# #o5100003##l\r\n#L7# #o5120503##l\r\n#L8# #o5100000##l\r\n#L9# #o4110302##l\r\n#L10# #o5110300##l\r\n#k#L11# ���� ����#l" );
		if ( v0 == 0 ) return 4230121;
//		else if ( v0 == 1 ) return 4130101;
		else if ( v0 == 2 ) return 4230115;
		else if ( v0 == 3 ) return 4230505;
		else if ( v0 == 4 ) return 4230506;
		else if ( v0 == 5 ) return 4240000;
		else if ( v0 == 6 ) return 5100003;
		else if ( v0 == 7 ) return 5120503;
		else if ( v0 == 8 ) return 5100000;
		else if ( v0 == 9 ) return 4110302; //�̽��� ����
		else if ( v0 == 10 ) return 5110300; //��ȭ�̽�������
	} else if ( level > 50 and level <= 60 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o5100002##l\r\n#L1# #o5120504##l\r\n#L2# #o5120000##l\r\n#L3# #o5120001##l\r\n#L4# #o5120002##l\r\n#L5# #o5120003##l\r\n" + 
			"#L6# #o5100005##l\r\n#L7# #o5120501##l\r\n#L8# #o5120502##l\r\n#L9# #o5130104##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return 5100002;
			else if ( v0 == 1 ) return 5120504;
			else if ( v0 == 2 ) return 5120000;
			else if ( v0 == 3 ) return 5120001;
			else if ( v0 == 4 ) return 5120002;
			else if ( v0 == 5 ) return 5120003;
			else if ( v0 == 6 ) return 5100005;
			else if ( v0 == 7 ) return 5120501;
			else if ( v0 == 8 ) return 5120502;
			else if ( v0 == 9 ) return 5130104;
			else if ( v0 == 10 ) {
				v1 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o5120506##l\r\n#L1# #o5130105##l\r\n#L2# #o5100004##l\r\n#L3# #o5120500##l\r\n#L4# #o5130107##l\r\n#L5# #o5130108##l\r\n#L6# #o5140000##l\r\n#L7# #o5120505##l\r\n#L8# #o6130103##l\r\n#L9# #o6130203##l\r\n#L10# #o5110301##l\r\n#L11# #o5110302##l\r\n#k#L12# �� ������(2/2)#l\r\n#L13# ���� ����#l" );
				if ( v1 == 0 ) return 5120506;
				else if ( v1 == 1 ) return 5130105;
				else if ( v1 == 2 ) return 5100004;
				else if ( v1 == 3 ) return 5120500;
				else if ( v1 == 4 ) return 5130107;
				else if ( v1 == 5 ) return 5130108;
				else if ( v1 == 6 ) return 5140000;
				else if ( v1 == 7 ) return 5120505;
				else if ( v1 == 8 ) return 6130103;
				else if ( v1 == 9 ) return 6130203;
				else if ( v1 == 10 ) return 5110301; //���̵�
				else if ( v1 == 11 ) return 5110302; //�׿� �޷��̵�
				else if ( v1 == 13 ) break;
			}
		}
	} else if ( level > 60 and level <= 70 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o6130200##l\r\n#L1# #o6130207##l\r\n#L2# #o6230400##l\r\n#L3# #o6230200##l\r\n#L4# #o6130204##l\r\n#L5# #o6300000##l\r\n" + 
			"#L6# #o6230300##l\r\n#L7# #o6130209##l\r\n#L8# #o6230500##l\r\n#L9# #o6400000##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return 6130200;
			else if ( v0 == 1 ) return 6130207;
			else if ( v0 == 2 ) return 6230400;
			else if ( v0 == 3 ) return 6230200;
			else if ( v0 == 4 ) return 6130204;
			else if ( v0 == 5 ) return 6300000;
			else if ( v0 == 6 ) return 6230300;
			else if ( v0 == 7 ) return 6130209;
			else if ( v0 == 8 ) return 6230500;
			else if ( v0 == 9 ) return 6400000;		
			else if ( v0 == 10 ) {			
				v1 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o6130208##l\r\n#L1# #o8140200##l\r\n#L2# #o7130500##l\r\n#L3# #o7130104##l\r\n#L4# #o6110300##l\r\n#L5# #o6110301##l\r\n#k#L10# �� ������(2/2)#l\r\n#L11# ���� ����#l" );
				if ( v1 == 0 ) return 6130208;
				else if ( v1 == 1 ) return 8140200;
				else if ( v1 == 2 ) return 7130500;
				else if ( v1 == 3 ) return 7130104;
				else if ( v1 == 4 ) return 6110300; //ȣ��
				else if ( v1 == 5 ) return 6110301; //����Ƽ
				else if ( v1 == 11 ) break;
			}
		}
	} else if ( level > 70 and level <= 80 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o7130001##l\r\n#L1# #o7130002##l\r\n#L2# #o7130600##l\r\n#L3# #o7130000##l\r\n#L4# #o6300100##l\r\n#L5# #o7130501##l\r\n" + 
			"#L6# #o7130200##l\r\n#L7# #o8140300##l\r\n#L8# #o7130003##l\r\n#L9# #o7130601##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return 7130001;
			else if ( v0 == 1 ) return 7130002;
			else if ( v0 == 2 ) return 7130600;
			else if ( v0 == 3 ) return 7130000;
			else if ( v0 == 4 ) return 6300100;
			else if ( v0 == 5 ) return 7130501;
			else if ( v0 == 6 ) return 7130200;
			else if ( v0 == 7 ) return 8140300;
			else if ( v0 == 8 ) return 7130003;
			else if ( v0 == 9 ) return 7130601;		
			else if ( v0 == 10 ) {			
				v1 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o6400100##l\r\n#L1# #o7130004##l\r\n#L2# #o8140000##l\r\n#L3# #o8140001##l\r\n#L4# #o7110301##l\r\n#k#L10# �� ������(2/2)#l\r\n#L11# ���� ����#l" );
				if ( v1 == 0 ) return 6400100;
				else if ( v1 == 1 ) return 7130004;
				else if ( v1 == 2 ) return 8140000;
				else if ( v1 == 3 ) return 8140001;
				else if ( v1 == 4 ) return 7110301;
				else if ( v1 == 11 ) break;
			}
		}
	} else if ( level > 80 and level <= 90 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o7140000##l\r\n#L1# #o8140002##l\r\n#L2# #o7130010##l\r\n#L3# #o7130020##l\r\n#L4# #o8140110##l\r\n#L5# #o7160000##l\r\n" + 
			"#L6# #o8140101##l\r\n#L7# #o8140102##l\r\n#L8# #o8140103##l\r\n#L9# #o8140111##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return 7140000;
			else if ( v0 == 1 ) return 8140002;
			else if ( v0 == 2 ) return 7130010;
			else if ( v0 == 3 ) return 7130020;
			else if ( v0 == 4 ) return 8140110;
			else if ( v0 == 5 ) return 7160000;
			else if ( v0 == 6 ) return 8140101;
			else if ( v0 == 7 ) return 8140102;
			else if ( v0 == 8 ) return 8140103;
			else if ( v0 == 9 ) return 8140111;		
			else if ( v0 == 10 ) {				
				v1 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o7130300##l\r\n#L1# #o8140500##l\r\n#L2# #o8140700##l\r\n#k#L10# �� ������(2/2)#l\r\n#L11# ���� ����#l" );
				if ( v1 == 0 ) return 7130300;
				else if ( v1 == 1 ) return 8140500;
				else if ( v1 == 2 ) return 8140700;
				else if ( v1 == 11 ) break;
			}
		}
	} else if ( level > 90 and level <= 100 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o8140600##l\r\n#L1# #o8140701##l\r\n#L2# #o8141000##l\r\n#L3# #o8141300##l\r\n#L4# #o8142000##l\r\n#L5# #o8140702##l\r\n" + 
			"#L6# #o8140703##l\r\n#L7# #o8142100##l\r\n#L8# #o8150300##l\r\n#L9# #o8141100##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return 8140600;
			else if ( v0 == 1 ) return 8140701;
			else if ( v0 == 2 ) return 8141000;
			else if ( v0 == 3 ) return 8141300;
			else if ( v0 == 4 ) return 8142000;
			else if ( v0 == 5 ) return 8140702;
			else if ( v0 == 6 ) return 8140703;
			else if ( v0 == 7 ) return 8142100;
			else if ( v0 == 8 ) return 8150300;
			else if ( v0 == 9 ) return 8141100;		
			else if ( v0 == 10 ) {			
				v1 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o8143000##l\r\n#L1# #o8150200##l\r\n#L2# #o8150100##l\r\n#k#L10# �� ������(2/2)#l\r\n#L11# ���� ����#l" );
				if ( v1 == 0 ) return 8143000;
				else if ( v1 == 1 ) return 8150200;
				else if ( v1 == 2 ) return 8150100;
				else if ( v1 == 11 ) break;
			}
		}
	} else if ( level > 100 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o8150301##l\r\n#L1# #o8150101##l\r\n#L2# #o8150302##l\r\n#L3# #o8150201##l\r\n#L4# #o8190000##l\r\n#L5# #o8160000##l\r\n" + 
		"#L6# #o8170000##l\r\n#L7# #o8190003##l\r\n#L8# #o8190004##l\r\n#k#L11# ���� ����#l" );
		if ( v0 == 0 ) return 8150301;
		else if ( v0 == 1 ) return 8150101;
		else if ( v0 == 2 ) return 8150302;
		else if ( v0 == 3 ) return 8150201;
		else if ( v0 == 4 ) return 8190000;
		else if ( v0 == 5 ) return 8160000;
		else if ( v0 == 6 ) return 8170000;
		else if ( v0 == 7 ) return 8190003;
		else if ( v0 == 8 ) return 8190004;
	}

	return -1;
}

//�ؿ�
function( string ) selectedMob_LevelList3( integer place ) {
	//�Ϻ�
	if ( place == 1 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o9400000##l\r\n#L1# #o9400001##l\r\n#L2# #o9400002##l\r\n#L3# #o9400003##l\r\n#L4# #o9400004##l\r\n#L5# #o9400011##l\r\n#L6# #o9400012##l" );
		if ( v0 == 0 ) return "940000012";
		else if ( v0 == 1 ) return "940000112";
		else if ( v0 == 2 ) return "940000212";
		else if ( v0 == 3 ) return "940000312";
		else if ( v0 == 4 ) return "940000410";
		else if ( v0 == 5 ) return "940001110";
		else if ( v0 == 6 ) return "940001212";
	//�븸
	} else if ( place == 2 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o9410000##l\r\n#L1# #o9410001##l\r\n#L2# #o9410002##l\r\n#L3# #o9410003##l\r\n#L4# #o9410004##l\r\n#L5# #o9410005##l\r\n#L6# #o9410006##l\r\n#L7# #o9410007##l\r\n#L8# #o9410009##l\r\n#L9# #o9410011##l" );
		if ( v0 == 0 ) return "941000012";
		else if ( v0 == 1 ) return "941000112";
		else if ( v0 == 2 ) return "941000210";
		else if ( v0 == 3 ) return "941000310";
		else if ( v0 == 4 ) return "941000410";
		else if ( v0 == 5 ) return "941000510";
		else if ( v0 == 6 ) return "941000610";
		else if ( v0 == 7 ) return "941000710";
		else if ( v0 == 8 ) return "941000910";
		else if ( v0 == 9 ) return "941001110";
	//�±�
	} else if ( place == 3 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o9420000##l\r\n#L1# #o9420001##l\r\n#L2# #o9420002##l\r\n#L3# #o9420003##l\r\n#L4# #o9420004##l\r\n#L5# #o9420005##l" );
		if ( v0 == 0 ) return "942000012";
		else if ( v0 == 1 ) return "942000120";
		else if ( v0 == 2 ) return "942000220";
		else if ( v0 == 3 ) return "942000310";
		else if ( v0 == 4 ) return "942000412";
		else if ( v0 == 5 ) return "942000515";
	//�߱�
	} else {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o9600001##l\r\n#L1# #o9600002##l\r\n#L2# #o9600003##l\r\n#L3# #o9600004##l\r\n#L4# #o9600005##l\r\n#L5# #o9600006##l\r\n#L6# #o9600007##l\r\n#L7# #o9600008##l" );
		if ( v0 == 0 ) return "960000115";
		else if ( v0 == 1 ) return "960000212";
		else if ( v0 == 2 ) return "960000312";
		else if ( v0 == 3 ) return "960000412";
		else if ( v0 == 4 ) return "960000510";
		else if ( v0 == 5 ) return "960000610";
		else if ( v0 == 6 ) return "960000710";
		else if ( v0 == 7 ) return "960000810";
	}

	return "-1";
}

//������ ���Ϸ���
function( integer ) selectedMob_LevelList4 {
	v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o130100##l\r\n#L1# #o130101##l\r\n#L2# #o210100##l\r\n#L3# #o1210100##l\r\n#L4# #o1210102##l" );
//	v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# ������#l\r\n#L1# ����������#l\r\n#L2# ������#l\r\n#L3# ����#l\r\n#L4# ��Ȳ����#l" );
	if ( v0 == 0 ) return 130100;
	else if ( v0 == 1 ) return 130101;
	else if ( v0 == 2 ) return 210100;
	else if ( v0 == 3 ) return 1210100;
	else if ( v0 == 4 ) return 1210102;

	return -1;
}

//���丮�� ��õ����Ʈ
function( string ) recom_list1 {
	level = target.nLevel;
	if ( level <= 10 ) {	
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o130100##l\r\n#L1# #o130101##l\r\n#L2# #o210100##l\r\n#L3# #o1210100##l\r\n#L4# #o1210102##l" );
		if ( v0 == 0 ) return "013010020"; //������
		else if ( v0 == 1 ) return "013010120"; //����������
		else if ( v0 == 2 ) return "021010020"; //������
		else if ( v0 == 3 ) return "121010020"; //����
		else if ( v0 == 4 ) return "121010220"; //��Ȳ����
	} else if ( level >10 and level <= 20 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o210100##l\r\n#L1# #o1210100##l\r\n#L2# #o1110101##l\r\n#L3# #o1210101##l\r\n#L4# #o1120100##l\r\n#L5# #o1110100##l\r\n#L6# #o1210103##l\r\n#L7# #o1130100##l\r\n#L8# #o1140100##l" );
		if ( v0 == 0 ) return "021010020";
		else if ( v0 == 1 ) return "121010020";
		else if ( v0 == 2 ) return "111010120";
		else if ( v0 == 3 ) return "121010120";
		else if ( v0 == 4 ) return "112010015";
		else if ( v0 == 5 ) return "111010015";
		else if ( v0 == 6 ) return "121010315";
		else if ( v0 == 7 ) return "113010015";
		else if ( v0 == 8 ) return "114010015";
	} else if ( level >20 and level <= 30 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o1110100##l\r\n#L1# #o1210103##l\r\n#L2# #o1130100##l\r\n#L3# #o1140100##l\r\n#L4# #o2220100##l\r\n#L5# #o2110200##l\r\n#L6# #o2130100##l\r\n#L7# #o2230110##l\r\n#L8# #o2230101##l\r\n#L9# #o2230111##l" );
		if ( v0 == 0 ) return "111010015";
		else if ( v0 == 1 ) return "121010315";
		else if ( v0 == 2 ) return "113010015";
		else if ( v0 == 3 ) return "114010015";
		else if ( v0 == 4 ) return "222010015";
		else if ( v0 == 5 ) return "211020012";
		else if ( v0 == 6 ) return "213010012";
		else if ( v0 == 7 ) return "223011012";
		else if ( v0 == 8 ) return "223010112";
		else if ( v0 == 9 ) return "223011112";
	} else if ( level >30 and level <= 40 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o2230102##l\r\n#L1# #o2230100##l\r\n#L2# #o3210100##l\r\n#L3# #o3230100##l\r\n#L4# #o3230101##l\r\n#L5# #o3210800##l\r\n#L6# #o3230102##l\r\n#L7# #o4230101##l" );
		if ( v0 == 0 ) return "223010212";
		else if ( v0 == 1 ) return "223010012";
		else if ( v0 == 2 ) return "321010010";
		else if ( v0 == 3 ) return "323010010";
		else if ( v0 == 4 ) return "323010110";
		else if ( v0 == 5 ) return "321080010";
		else if ( v0 == 6 ) return "323010210";
		else if ( v0 == 7 ) return "423010110";
	} else if ( level >40 and level <= 50 ) {
//		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3230100##l\r\n#L1# #o3230101##l\r\n#L2# #o4230100##l\r\n#L3# #o4230101##l\r\n#L4# #o4230107##l\r\n#L5# #o4230125##l\r\n#L6# #o4230400##l\r\n#L7# #o4230126##l\r\n#L8# #o4230102##l\r\n#L9# #o4230104##l" );
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3230100##l\r\n#L1# #o3230101##l\r\n#L2# #o4230100##l\r\n#L3# #o4230101##l\r\n#L5# #o4230125##l\r\n#L6# #o4230400##l\r\n#L7# #o4230126##l\r\n#L8# #o4230102##l\r\n#L9# #o4230104##l" );
		if ( v0 == 0 ) return "323010010";
		else if ( v0 == 1 ) return "323010110";
		else if ( v0 == 2 ) return "423010010";
		else if ( v0 == 3 ) return "423010110";
//		else if ( v0 == 4 ) return "423010710";
		else if ( v0 == 5 ) return "423012510";
		else if ( v0 == 6 ) return "423040010";
		else if ( v0 == 7 ) return "423012610";
		else if ( v0 == 8 ) return "423010210";
		else if ( v0 == 9 ) return "423010410";
	} else if ( level >50 and level <= 60 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o5130103##l\r\n#L1# #o5300100##l\r\n#L2# #o5130101##l\r\n#L3# #o5150001##l\r\n#L4# #o5130102##l\r\n#L5# #o5150000##l\r\n#L6# #o6130100##l" );
		if ( v0 == 0 ) return "513010312";
		else if ( v0 == 1 ) return "530010012";
		else if ( v0 == 2 ) return "513010112";
		else if ( v0 == 3 ) return "515000112";
		else if ( v0 == 4 ) return "513010212";
		else if ( v0 == 5 ) return "515000012";
		else if ( v0 == 6 ) return "613010012";
	} else if ( level >60 and level <= 70 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o5130101##l\r\n#L1# #o5150001##l\r\n#L2# #o5130102##l\r\n#L3# #o5150000##l\r\n#L4# #o6130100##l\r\n#L5# #o6230100##l\r\n#L6# #o6230602##l\r\n#L7# #o6230600##l\r\n#L8# #o6230601##l" );
		if ( v0 == 0 ) return "513010110";
		else if ( v0 == 1 ) return "515000112";
		else if ( v0 == 2 ) return "513010212";
		else if ( v0 == 3 ) return "515000012";
		else if ( v0 == 4 ) return "613010012";
		else if ( v0 == 5 ) return "623010012";
		else if ( v0 == 6 ) return "623060212";
		else if ( v0 == 7 ) return "623060012";
		else if ( v0 == 8 ) return "623060112";
	} else if ( level >70 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o6230601##l\r\n#L1# #o7130100##l\r\n#L2# #o7130103##l\r\n#L3# #o7130101##l" );
		if ( v0 == 0 ) return "623060112";
		else if ( v0 == 1 ) return "713010012";
		else if ( v0 == 2 ) return "713010310";
		else if ( v0 == 3 ) return "713010110";
	}

	return "x";
}

//���ø��� ��õ����Ʈ
function( string ) recom_list2 {
	level = target.nLevel;
	if ( level > 20 and level <= 30 ) {	
		while( 1 ) {
//			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o2230103##l\r\n#L1# #o5200000##l\r\n#L2# #o2230109##l\r\n#L3# #o2230104##l\r\n#L4# #o2230200##l\r\n#L5# #o3000000##l\r\n#L6# #o3000005##l\r\n#L7# #o3000006##l\r\n#L8# #o5200001##l\r\n#L9# #o5200002##l\r\n#k#L10# ���� ������(1/2)#l" );
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o2230103##l\r\n#L1# #o5200000##l\r\n#L2# #o2230109##l\r\n#L3# #o2230104##l\r\n#L4# #o2110301##l\r\n#L5# #o3000000##l\r\n#L6# #o3000005##l\r\n#L7# #o3000006##l\r\n#L8# #o5200001##l\r\n#L9# #o5200002##l\r\n#k#L10# ���� ������(1/2)#l" ); //�ö���ǽ� ����
			if ( v0 == 0 ) return "223010312";
			else if ( v0 == 1 ) return "520000012";
			else if ( v0 == 2 ) return "223010912";
			else if ( v0 == 3 ) return "223010412";
//			else if ( v0 == 4 ) return "223020012"; //�ö���ǽ� ����
			else if ( v0 == 4 ) return "211030112"; //�����Ǿ� �߰�
			else if ( v0 == 5 ) return "300000012";
			else if ( v0 == 6 ) return "300000512";
			else if ( v0 == 7 ) return "300000612";
			else if ( v0 == 8 ) return "520000112";
			else if ( v0 == 9 ) return "520000212";
			else if ( v0 == 10 ) {
				v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o2100100##l\r\n#L1# #o2100105##l\r\n#L2# #o2100106##l\r\n#L3# #o2100103##l\r\n#k#L7# �� ������(2/2)#l" );
				if ( v0 == 0 ) return "210010012";
				else if ( v0 == 1 ) return "210010512";
				else if ( v0 == 2 ) return "210010612";
				else if ( v0 == 3 ) return "210010312";
			}
		}
	} else if ( level > 30 and level <= 35 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3000005##l\r\n#L1# #o3230400##l\r\n#L2# #o3110101##l\r\n#L3# #o3110102##l\r\n#L4# #o5300000##l\r\n#L5# #o3210200##l\r\n#L6# #o3210201##l\r\n#L7# #o3210202##l\r\n#L8# #o3210205##l\r\n#L9# #o5400000##l\r\n#L10# #o3100101##l\r\n#L11# #o3110302##l" );
		if ( v0 == 0 ) return "300000512";
		else if ( v0 == 1 ) return "323040010";
		else if ( v0 == 2 ) return "311010110";
		else if ( v0 == 3 ) return "311010210";
		else if ( v0 == 4 ) return "530000010";
		else if ( v0 == 5 ) return "321020010";
		else if ( v0 == 6 ) return "321020110";
		else if ( v0 == 7 ) return "321020210";
		else if ( v0 == 8 ) return "321020510";
		else if ( v0 == 9 ) return "540000010";
		else if ( v0 == 10 ) return "310010110"; //�Ƹ���Ʈ
		else if ( v0 == 11 ) return "311030210"; //��� �߰�

	} else if ( level > 35 and level <= 40 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3210200##l\r\n#L1# #o3210201##l\r\n#L2# #o3210202##l\r\n#L3# #o3210203##l\r\n#L4# #o3210450##l\r\n#L5# #o3210208##l\r\n#L6# #o3230306##l\r\n#L7# #o3230305##l\r\n#L8# #o4230113##l\r\n#L9# #o4230500##l\r\n#L10# #o4230600##l\r\n#L11# #o3110303##l" );
		if ( v0 == 0 ) return "321020010";
		else if ( v0 == 1 ) return "321020110";
		else if ( v0 == 2 ) return "321020210";
		else if ( v0 == 3 ) return "321020310";
		else if ( v0 == 4 ) return "321045010";
		else if ( v0 == 5 ) return "321020810";
		else if ( v0 == 6 ) return "323030610";
		else if ( v0 == 7 ) return "323030510";
		else if ( v0 == 8 ) return "423011310";
		else if ( v0 == 9 ) return "423050010";
		else if ( v0 == 10 ) return "423060010"; //�Ƹ���Ʈ
		else if ( v0 == 11 ) return "311030310"; //Ʈ���÷��
	} else if ( level > 40 and level <= 45 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o3230200##l\r\n#L1# #o5400000##l\r\n#L2# #o3210208##l\r\n#L3# #o3230306##l\r\n#L4# #o4230113##l\r\n#L5# #o4230114##l\r\n#L6# #o4230119##l\r\n#L7# #o4230109##l\r\n#L8# #o4230106##l\r\n#L9# #o4110300##l\r\n#L10# #o4110301##l\r\n#L11# #o4230107##l" );
		if ( v0 == 0 ) return "323020010";
		else if ( v0 == 1 ) return "540000010";
		else if ( v0 == 2 ) return "321020810";
		else if ( v0 == 3 ) return "323030610";
		else if ( v0 == 4 ) return "423011310";
		else if ( v0 == 5 ) return "423011410";
		else if ( v0 == 6 ) return "423011910";
		else if ( v0 == 7 ) return "423010910";
		else if ( v0 == 8 ) return "423010610";
		else if ( v0 == 9 ) return "411030010"; //���̾����
		else if ( v0 == 10 ) return "411030110"; //��ȭ���̾����
		else if ( v0 == 11 ) return "423010710"; //�ö��̾���
	} else if ( level > 45 and level <= 50 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o4230109##l\r\n#L1# #o4230106##l\r\n#L2# #o4230110##l\r\n#L3# #o4230118##l\r\n#L4# #o4230121##l\r\n#L5# #o4230115##l\r\n#L6# #o4230505##l\r\n#L7# #o4230506##l\r\n#L8# #o5100000##l\r\n#L9# #o5120503##l\r\n#L10# #o4110302##l\r\n#L11# #o5110300##l" );
		if ( v0 == 0 ) return "423010910";
		else if ( v0 == 1 ) return "423010610";
		else if ( v0 == 2 ) return "423011010";
		else if ( v0 == 3 ) return "423011810";
		else if ( v0 == 4 ) return "423012110";
		else if ( v0 == 5 ) return "423011510";
		else if ( v0 == 6 ) return "423050510";
		else if ( v0 == 7 ) return "423050610";
		else if ( v0 == 8 ) return "510000010";
		else if ( v0 == 9 ) return "512050310";
		else if ( v0 == 10 ) return "411030210"; //�̽�������
		else if ( v0 == 11 ) return "511030010";	//��ȭ �̽��� ����
	} else if ( level > 50 and level <= 55 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o4230120##l\r\n#L1# #o4230106##l\r\n#L2# #o4230110##l\r\n#L3# #o4230115##l\r\n#L4# #o4230505##l\r\n#L5# #o4230506##l\r\n#L6# #o5100000##l\r\n#L7# #o5120503##l\r\n#L8# #o5120504##l\r\n#L9# #o5120000##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return "423012010";
			else if ( v0 == 1 ) return "423010610";
			else if ( v0 == 2 ) return "423011010";
			else if ( v0 == 3 ) return "423011510";
			else if ( v0 == 4 ) return "423050510";
			else if ( v0 == 5 ) return "423050610";
			else if ( v0 == 6 ) return "510000010";
			else if ( v0 == 7 ) return "512050310";
			else if ( v0 == 8 ) return "512050412";
			else if ( v0 == 9 ) return "512000012";
			else if ( v0 == 10 ) {
				v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o5120001##l\r\n#L1# #o5120002##l\r\n#L2# #o5120003##l\r\n#L3# #o5120501##l\r\n#L4# #o5120502##l\r\n#L5# #o5130104##l\r\n#L6# #o5120506##l\r\n#L7# #o5110301##l\r\n#k#L8# �� ������(2/2)#l" );
				if ( v0 == 0 ) return "512000112";
				else if ( v0 == 1 ) return "512000212";
				else if ( v0 == 2 ) return "512000312";
				else if ( v0 == 3 ) return "512050112";
				else if ( v0 == 4 ) return "512050212";
				else if ( v0 == 5 ) return "513010412";
				else if ( v0 == 6 ) return "512050612";
				else if ( v0 == 7 ) return "511030112"; //���̵�
			}
		}
	} else if ( level > 55 and level <= 60 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o5120504##l\r\n#L1# #o5120000##l\r\n#L2# #o5120001##l\r\n#L3# #o5120002##l\r\n#L4# #o5120003##l\r\n#L5# #o5120501##l\r\n#L6# #o5120502##l\r\n#L7# #o5130104##l\r\n#L8# #o5120506##l\r\n#L9# #o5130107##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return "512050412";
			else if ( v0 == 1 ) return "512000012";
			else if ( v0 == 2 ) return "512000112";
			else if ( v0 == 3 ) return "512000212";
			else if ( v0 == 4 ) return "512000312";
			else if ( v0 == 5 ) return "512050112";
			else if ( v0 == 6 ) return "512050212";
			else if ( v0 == 7 ) return "513010412";
			else if ( v0 == 8 ) return "512050612";
			else if ( v0 == 9 ) return "513010712";
			else if ( v0 == 10 ) {
				v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o5130108##l\r\n#L1# #o5140000##l\r\n#L2# #o5120505##l\r\n#L3# #o6130103##l\r\n#L4# #o6130203##l\r\n#L5# #o5110302##l\r\n#k#L6# �� ������(2/2)#l" );
				if ( v0 == 0 ) return "513010812";
				else if ( v0 == 1 ) return "514000012";
				else if ( v0 == 2 ) return "512050512";
				else if ( v0 == 3 ) return "613010312";
				else if ( v0 == 4 ) return "613020312";
				else if ( v0 == 5 ) return "511030212"; //�׿��޷��̵�
			}
		}
	} else if ( level > 60 and level <= 65 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o5130105##l\r\n#L1# #o5130107##l\r\n#L2# #o5130108##l\r\n#L3# #o5140000##l\r\n#L4# #o6130103##l\r\n#L5# #o6130207##l\r\n#L6# #o6230400##l\r\n#L7# #o6230200##l\r\n#L8# #o6130204##l\r\n#L9# #o6300000##l\r\n#L10# #o6110300##l" );
		if ( v0 == 0 ) return "513010512";
		else if ( v0 == 1 ) return "513010712";
		else if ( v0 == 2 ) return "513010812";
		else if ( v0 == 3 ) return "514000012";
		else if ( v0 == 4 ) return "613010312";
		else if ( v0 == 5 ) return "613020712";
		else if ( v0 == 6 ) return "623040012";
		else if ( v0 == 7 ) return "623020012";
		else if ( v0 == 8 ) return "613020412";
		else if ( v0 == 9 ) return "630000012";
		else if ( v0 == 10 ) return "611030012"; //ȣ��
	} else if ( level > 65 and level <= 70 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o6230400##l\r\n#L1# #o6230200##l\r\n#L2# #o6300000##l\r\n#L3# #o6230300##l\r\n#L4# #o6230500##l\r\n#L5# #o6400000##l\r\n#L6# #o6130208##l\r\n#L7# #o8140200##l\r\n#L8# #o7130500##l\r\n#L9# #o7130104##l\r\n#L10# #o6110301##l" );
		if ( v0 == 0 ) return "623040012";
		else if ( v0 == 1 ) return "623020012";
		else if ( v0 == 2 ) return "630000012";
		else if ( v0 == 3 ) return "623030012";
		else if ( v0 == 4 ) return "623050012";
		else if ( v0 == 5 ) return "640000012";
		else if ( v0 == 6 ) return "613020812";
		else if ( v0 == 7 ) return "814020012";
		else if ( v0 == 8 ) return "713050012";
		else if ( v0 == 9 ) return "713010412";
		else if ( v0 == 10 ) return "611030112"; //����Ƽ
	} else if ( level > 70 and level <= 75 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o6300000##l\r\n#L1# #o6230300##l\r\n#L2# #o6130209##l\r\n#L3# #o6230500##l\r\n#L4# #o6230601##l\r\n#L5# #o6400000##l\r\n#L6# #o8140200##l\r\n#L7# #o7130500##l\r\n#L8# #o7130001##l\r\n#L9# #o7130002##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return "630000012";
			else if ( v0 == 1 ) return "623030012";
			else if ( v0 == 2 ) return "613020912";
			else if ( v0 == 3 ) return "623050012";
			else if ( v0 == 4 ) return "623060112";
			else if ( v0 == 5 ) return "640000012";
			else if ( v0 == 6 ) return "814020012";
			else if ( v0 == 7 ) return "713050012";
			else if ( v0 == 8 ) return "713000110";
			else if ( v0 == 9 ) return "713000210";
			else if ( v0 == 10 ) {
				v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o7130600##l\r\n#L1# #o7130000##l\r\n#L2# #o6300100##l\r\n#L3# #o7130501##l\r\n#L4# #o7130200##l\r\n#L5# #o7110301##l\r\n#k#L6# �� ������(2/2)#l" );
				if ( v0 == 0 ) return "713060010";
				else if ( v0 == 1 ) return "713000010";
				else if ( v0 == 2 ) return "630010010";
				else if ( v0 == 3 ) return "713050110";
				else if ( v0 == 4 ) return "713020010";
				else if ( v0 == 5 ) return "711030110";
			}
		}
	} else if ( level > 75 and level <= 80 ) {
		v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o6300100##l\r\n#L1# #o7130501##l\r\n#L2# #o7130200##l\r\n#L3# #o8140300##l\r\n#L4# #o7130003##l\r\n#L5# #o7130601##l\r\n#L6# #o6400100##l\r\n#L7# #o7130004##l\r\n#L8# #o8140000##l\r\n#L9# #o8140001##l" );
		if ( v0 == 0 ) return "630010010";
		else if ( v0 == 1 ) return "713050110";
		else if ( v0 == 2 ) return "713020010";
		else if ( v0 == 3 ) return "814030010";
		else if ( v0 == 4 ) return "713000310";
		else if ( v0 == 5 ) return "713060110";
		else if ( v0 == 6 ) return "640010010";
		else if ( v0 == 7 ) return "713000410";
		else if ( v0 == 8 ) return "814000010";
		else if ( v0 == 9 ) return "814000110";
	} else if ( level > 80 and level <= 90 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o7130200##l\r\n#L1# #o7130101##l\r\n#L2# #o8140300##l\r\n#L3# #o7130003##l\r\n#L4# #o7130601##l\r\n#L5# #o6400100##l\r\n#L6# #o7130004##l\r\n#L7# #o8140000##l\r\n#L8# #o8140001##l\r\n#L9# #o7140000##l\r\n#k#L10# ���� ������(1/3)#l" );
			if ( v0 == 0 ) return "713020010";
			else if ( v0 == 1 ) return "713010110";
			else if ( v0 == 2 ) return "814030010";
			else if ( v0 == 3 ) return "713000310";
			else if ( v0 == 4 ) return "713060110";
			else if ( v0 == 5 ) return "640010010";
			else if ( v0 == 6 ) return "713000410";
			else if ( v0 == 7 ) return "814000010";
			else if ( v0 == 8 ) return "814000110";
			else if ( v0 == 9 ) return "714000010";
			else if ( v0 == 10 ) {
				v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o8140002##l\r\n#L1# #o7130010##l\r\n#L2# #o7130020##l\r\n#L3# #o8140110##l\r\n#L4# #o7160000##l\r\n#L5# #o8140101##l\r\n#L6# #o8140102##l\r\n#L7# #o8140103##l\r\n#L8# #o8140111##l\r\n#L9# #o7130300##l\r\n#k#L10# ���� ������(2/3)#l" );
				if ( v0 == 0 ) return "814000210";
				else if ( v0 == 1 ) return "713001010";
				else if ( v0 == 2 ) return "713002010";
				else if ( v0 == 3 ) return "814011010";
				else if ( v0 == 4 ) return "716000010";
				else if ( v0 == 5 ) return "814010110";
				else if ( v0 == 6 ) return "814010210";
				else if ( v0 == 7 ) return "814010310";
				else if ( v0 == 8 ) return "814011110";
				else if ( v0 == 9 ) return "713030010";
				else if ( v0 == 10 ) {
					v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o8140500##l\r\n#L1# #o8140700##l\r\n#k#L2# ó�� ������(1/3)#l" );
					if ( v0 == 0 ) return "814050010";
					else if ( v0 == 1 ) return "814070010";
				}
			}
		}
	} else if ( level > 90 and level <= 100 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o7130010##l\r\n#L1# #o7130020##l\r\n#L2# #o8140110##l\r\n#L3# #o7160000##l\r\n#L4# #o8140101##l\r\n#L5# #o8140102##l\r\n#L6# #o8140103##l\r\n#L7# #o8140111##l\r\n#L8# #o7130300##l\r\n#L9# #o8140500##l\r\n#k#L10# ���� ������(1/3)#l" );
			if ( v0 == 0 ) return "713001010";
			else if ( v0 == 1 ) return "713002010";
			else if ( v0 == 2 ) return "814011010";
			else if ( v0 == 3 ) return "716000010";
			else if ( v0 == 4 ) return "814010110";
			else if ( v0 == 5 ) return "814010210";
			else if ( v0 == 6 ) return "814010310";
			else if ( v0 == 7 ) return "814011110";
			else if ( v0 == 8 ) return "713030010";
			else if ( v0 == 9 ) return "814050010";
			else if ( v0 == 10 ) {
				v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o8140700##l\r\n#L1# #o8140600##l\r\n#L2# #o8140701##l\r\n#L3# #o8141000##l\r\n#L4# #o8141300##l\r\n#L5# #o8142000##l\r\n#L6# #o8140702##l\r\n#L7# #o8140703##l\r\n#L8# #o8142100##l\r\n#L9# #o8150300##l\r\n#k#L10# ���� ������(2/3)#l" );
				if ( v0 == 0 ) return "814070010";
				else if ( v0 == 1 ) return "814060010";
				else if ( v0 == 2 ) return "814070110";
				else if ( v0 == 3 ) return "814100010";
				else if ( v0 == 4 ) return "814130010";
				else if ( v0 == 5 ) return "814200010";
				else if ( v0 == 6 ) return "814070210";
				else if ( v0 == 7 ) return "814070310";
				else if ( v0 == 8 ) return "814210010";
				else if ( v0 == 9 ) return "815030010";
				else if ( v0 == 10 ) {
					v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o8141100##l\r\n#L1# #o8143000##l\r\n#L2# #o8150200##l\r\n#L3# #o8150100##l\r\n#k#L4# ó�� ������(3/3)#l" );
					if ( v0 == 0 ) return "814110010";
					else if ( v0 == 1 ) return "814300010";
					else if ( v0 == 2 ) return "815020010";
					else if ( v0 == 3 ) return "815010010";
				}
			}
		}
	} else if ( level > 100 ) {
		while ( 1 ) {
			v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o8142000##l\r\n#L1# #o8140702##l\r\n#L2# #o8140703##l\r\n#L3# #o8142100##l\r\n#L4# #o8150300##l\r\n#L5# #o8141100##l\r\n#L6# #o8143000##l\r\n#L7# #o8150200##l\r\n#L8# #o8150100##l\r\n#L9# #o8150301##l\r\n#k#L10# ���� ������(1/2)#l" );
			if ( v0 == 0 ) return "814200010";
			else if ( v0 == 1 ) return "814070210";
			else if ( v0 == 2 ) return "814070310";
			else if ( v0 == 3 ) return "814210010";
			else if ( v0 == 4 ) return "815030010";
			else if ( v0 == 5 ) return "814110010";
			else if ( v0 == 6 ) return "814300010";
			else if ( v0 == 7 ) return "815020010";
			else if ( v0 == 8 ) return "815010010";
			else if ( v0 == 9 ) return "815030110";
			else if ( v0 == 10 ) {
				v0 = self.askMenu( "�װ� ����ϰ� ���� ���͸� ������ ��.\r\n#b#L0# #o8150101##l\r\n#L1# #o8150302##l\r\n#L2# #o8150201##l\r\n#L3# #o8190000##l\r\n#L4# #o8160000##l\r\n#L5# #o8170000##l\r\n#L6# #o8190003##l\r\n#L7# #o8190004##l\r\n#k#L9# �� ������(2/2)#l" );
				if ( v0 == 0 ) return "815010110";
				else if ( v0 == 1 ) return "815030210";
				else if ( v0 == 2 ) return "815020110";
				else if ( v0 == 3 ) return "819000010";
				else if ( v0 == 4 ) return "816000010";
				else if ( v0 == 5 ) return "817000010";
				else if ( v0 == 6 ) return "819000310";
				else if ( v0 == 7 ) return "819000410";
			}
		}
	} else {
		self.say( "���ø��ƿ��� 20 ���� ������ ������ ���� ��õ ����Ʈ�� ����. ���丮�ƿ��� ���� �ɾ��ִ� �� �?" );
		end;
	}

	return "-1";
}

//���� �� ���
function selectedMob( integer qcode ) {
	qr = target.questRecord;
	field = self.field;
	code = 0;

	self.say( "�� ��̳��� ������? ��ġ? �ʵ� ���� ��̳� ���� ����.... �ؼ� ���� ã������? �׷��ٸ� ���������� �� �����Ƿ��� �����غ���? ���������̳İ�? " );
	self.say( "�װ� �ٷ� �װ� ���� ����ϴ� ���� �ϳ��� �����ϸ� ���� �Ϸ絿���� ���ʽ� ����ġ�� �ް� ���ִ� �����̾�. ������? ��, �׷��ٸ� � ���͸� �������� ������ ���� ��Ͽ��� ��������." );
	//��콺�丮
	if ( field.id == 1010000 or field.id == 60000 ) {
		code = selectedMob_LevelList4;
		if ( code != -1 ) {
			qr.selectedMob( qcode, code, 0, 20 );
			self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
		} else self.say( "������ �߻��߾�. ��� �� �ٽ� �õ��� ��." );
	}
	//���丮��
	else if ( field.id == 100000000 or field.id == 104000000 or field.id == 105040300 or field.id == 102000000 ) {
		list1 = "";
		v0 = self.askMenu( "�켱 �װ� ����� ���� ���͸� ��õ�� �ٰ�. ���ϴ� ���Ͱ� ���ٸ� ��ü���⸦ �����ؼ� ���͸� �����ϸ� ��.\r\n#b#L0# ��õ ����Ʈ ����\r\n#L1# ��ü ����Ʈ ����#l\r\n#L2# �׸��α�#l" );
		if ( v0 == 0 ) {
			result = recom_list1;
			code = integer( substring( result, 0, 7 ));
			exp = integer( substring( result, 7, 2 ));
			qr.selectedMob( qcode, code, 0, exp );
			self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
		} else if ( v0 == 1 ) {
			while ( 1 ) {
				v1 = self.askMenu( "��� �������� ���͸� ����?\r\n#b#L0# ���� 1 ~ 10#l\r\n#L1# ���� 11 ~ 20#l\r\n#L2# ���� 21 ~ 30#l\r\n#L3# ���� 31 ~ 40#l\r\n#L4# ���� 41 ~ 50#l\r\n#L5# ���� 51 ~ 60#l\r\n#L6# ���� 61 ~ 70#l\r\n#L7# ������#l" );
				if ( v1 == 0 ) {
					code =  selectedMob_LevelList1( 1 );
					if ( code != -1 ) { 
						qr.selectedMob( qcode, code, 0, 20 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 1 ) {
					code =  selectedMob_LevelList1( 11 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 15 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 2 ) {
					code =  selectedMob_LevelList1( 21 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 12 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 3 ) {
					code =  selectedMob_LevelList1( 31 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 4 ) {
					code =  selectedMob_LevelList1( 41 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 5 ) {
					code =  selectedMob_LevelList1( 51 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 12 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 6 ) {
					code =  selectedMob_LevelList1( 61 );
					if ( code != -1 ) {
						exp_mob = 12;
						if ( code == 7130103 or code == 7130101 ) exp_mob = 10;

						qr.selectedMob( qcode, code, 0, exp_mob );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else end;			
			}
		} else if ( v0 == 2 ) self.say( "���� ���� ��� ������ ���ζ�� �����ϴ°ǰ�? ������ �ٲ�� �ٽ� ���� ���� �ɾ���." );
	} else if ( field.id == 200000000 or field.id == 211000000 or field.id == 220000000   or field.id == 221000000 or field.id == 222000000 or field.id == 230000001 or field.id == 240000000 or field.id == 250000000 or field.id == 251000000 or field.id == 260000000 or field.id == 261000000 ) {
	//���ø���
		v0 = self.askMenu( "�켱 �װ� ����� ���� ���͸� ��õ�� �ٰ�. ���ϴ� ���Ͱ� ���ٸ� ��ü���⸦ �����ؼ� ���͸� �����ϸ� ��.\r\n#b#L0# ��õ ����Ʈ ����\r\n#L1# ��ü ����Ʈ ����#l\r\n#L2# �׸� �α�#l" );
		if ( v0 == 0 ) {
			result = recom_list2;
			code = integer( substring( result, 0, 7 ));
			exp = integer( substring( result, 7, 2 ));
			qr.selectedMob( qcode, code, 0, exp );
			self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );		
		} else if ( v0 == 1 ) {
			while ( 1 ) {
				v1 = self.askMenu( "��� �������� ���͸� ����?\r\n#b#L0# ���� 21 ~ 30#l\r\n#L1# ���� 31 ~ 35#l\r\n#L2# ���� 36 ~ 40#l\r\n#L3# ���� 41 ~ 45#l\r\n#L4# ���� 46 ~ 50#l\r\n#L5# ���� 51 ~ 60#l\r\n#L6# ���� 61 ~ 70#l\r\n#L7# ���� 71 ~ 80#l\r\n#L8# ���� 81 ~ 90#l\r\n#L9# ���� 91 ~ 100#l\r\n#L10# ���� 101 �̻�#l\r\n#L11# ������#l" );
				if ( v1 == 0 ) {
					code =  selectedMob_LevelList2( 21 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 12 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 1 ) {
					code =  selectedMob_LevelList2( 31 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 2 ) {
					code =  selectedMob_LevelList2( 36 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 3 ) {
					code =  selectedMob_LevelList2( 41 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 4 ) {
					code =  selectedMob_LevelList2( 46 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 5 ) {
					code =  selectedMob_LevelList2( 51 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 12 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 6 ) {
					code =  selectedMob_LevelList2( 61 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 12 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 7 ) {
					code =  selectedMob_LevelList2( 71 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 8 ) {
					code =  selectedMob_LevelList2( 81 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 9 ) {
					code =  selectedMob_LevelList2( 91 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else if ( v1 == 10 ) {
					code =  selectedMob_LevelList2( 101 );
					if ( code != -1 ) {
						qr.selectedMob( qcode, code, 0, 10 );
						self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
						end;
					}
				} else end;
			}
		} else if ( v0 == 2 ) self.say( "���� ���� ��� ������ ���ζ�� �����ϴ°ǰ�? ������ �ٲ�� �ٽ� ���� ���� �ɾ���." );
	//�ؿ�
	} else if ( field.id == 800000000 ) { //�Ϻ�
		result = selectedMob_LevelList3( 1 );
		if ( result != "-1" ) {
			code = integer( substring( result, 0, 7 ));
			exp = integer( substring( result, 7, 2 ));
			qr.selectedMob( qcode, code, 0, exp );
			self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
		} else self.say( "������ �߻��߾�. ��� �� �ٽ� �õ��� ��." );
	} else if ( field.id == 740000000 ) { //�븸
		result = selectedMob_LevelList3( 2 );
		if ( result != "-1" ) {
			code = integer( substring( result, 0, 7 ));
			exp = integer( substring( result, 7, 2 ));
			qr.selectedMob( qcode, code, 0, exp );
			self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
		} else self.say( "������ �߻��߾�. ��� �� �ٽ� �õ��� ��." );
	} else if ( field.id == 500000000 ) { //�±�
		result = selectedMob_LevelList3( 3 );
		if ( result != "-1" ) {
			code = integer( substring( result, 0, 7 ));
			exp = integer( substring( result, 7, 2 ));
			qr.selectedMob( qcode, code, 0, exp );
			self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
		} else self.say( "������ �߻��߾�. ��� �� �ٽ� �õ��� ��." );
	} else if ( field.id == 701000000 ) { //�߱�
		result = selectedMob_LevelList3( 4 );
		if ( result != "-1" ) {
			code = integer( substring( result, 0, 7 ));
			exp = integer( substring( result, 7, 2 ));
			qr.selectedMob( qcode, code, 0, exp );
			self.say( "�װ� ������ ��� ���ʹ� #b#o" + code + "##k ����? ������ ����Ʈ�� �������� ���� ������ ���͸� ����ϸ� �߰� ����ġ�� �����ž�. �ٸ� ���͸� �����ϰ� �ʹٸ� ����Ʈ�� �����ϰ� �ٽ� ������ ��." );
		} else self.say( "������ �߻��߾�. ��� �� �ٽ� �õ��� ��." );
	} 

	return;
} 

script "selectedMob" {
	selectedMob( 9860 );
}

script "selectedMob1" {
	qr = target.questRecord;
	q1 = qr.getState( 9890 );
	q2 = qr.getState( 9891 );
	q3 = qr.getState( 9892 );
	q4 = qr.getState( 9893 );

	selectedMob( 9890 );
}

script "selectedMob2" {
	qr = target.questRecord;
	q1 = qr.getState( 9890 );
	q2 = qr.getState( 9891 );
	q3 = qr.getState( 9892 );
	q4 = qr.getState( 9893 );

	if ( q1 != 1 ) {
		selectedMob( 9891 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}

script "selectedMob3" {
	qr = target.questRecord;
	q1 = qr.getState( 9890 );
	q2 = qr.getState( 9891 );
	q3 = qr.getState( 9892 );
	q4 = qr.getState( 9893 );

	if ( q1 != 1 and q2 != 1 ) {
		selectedMob( 9892 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}

script "selectedMob4" {
	qr = target.questRecord;
	q1 = qr.getState( 9890 );
	q2 = qr.getState( 9891 );
	q3 = qr.getState( 9892 );
	q4 = qr.getState( 9893 );

	if ( q1 != 1 and q2 != 1 and q3 != 1  ) {
		selectedMob( 9893 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}

/*
//9810~9817
script "selectedMob1" {
	qr = target.questRecord;
	q1 = qr.getState( 9810 );
	q2 = qr.getState( 9811 );
	q3 = qr.getState( 9812 );
	q4 = qr.getState( 9813 );
	q5 = qr.getState( 9814 );
	q6 = qr.getState( 9815 );
	q7 = qr.getState( 9816 );
	q8 = qr.getState( 9817 );

	selectedMob( 9810 );
}

script "selectedMob2" {
	qr = target.questRecord;
	q1 = qr.getState( 9810 );
	q2 = qr.getState( 9811 );
	q3 = qr.getState( 9812 );
	q4 = qr.getState( 9813 );
	q5 = qr.getState( 9814 );
	q6 = qr.getState( 9815 );
	q7 = qr.getState( 9816 );
	q8 = qr.getState( 9817 );

	if ( q1 != 1 ) {
		selectedMob( 9811 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}

script "selectedMob3" {
	qr = target.questRecord;
	q1 = qr.getState( 9810 );
	q2 = qr.getState( 9811 );
	q3 = qr.getState( 9812 );
	q4 = qr.getState( 9813 );
	q5 = qr.getState( 9814 );
	q6 = qr.getState( 9815 );
	q7 = qr.getState( 9816 );
	q8 = qr.getState( 9817 );

	if ( q1 != 1 and q2 != 1 ) {
		selectedMob( 9812 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}

script "selectedMob4" {
	qr = target.questRecord;
	q1 = qr.getState( 9810 );
	q2 = qr.getState( 9811 );
	q3 = qr.getState( 9812 );
	q4 = qr.getState( 9813 );
	q5 = qr.getState( 9814 );
	q6 = qr.getState( 9815 );
	q7 = qr.getState( 9816 );
	q8 = qr.getState( 9817 );

	if ( q1 != 1 and q2 != 1 and q3 != 1  ) {
		selectedMob( 9813 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}

script "selectedMob5" {
	qr = target.questRecord;
	q1 = qr.getState( 9810 );
	q2 = qr.getState( 9811 );
	q3 = qr.getState( 9812 );
	q4 = qr.getState( 9813 );
	q5 = qr.getState( 9814 );
	q6 = qr.getState( 9815 );
	q7 = qr.getState( 9816 );
	q8 = qr.getState( 9817 );

	if ( q1 != 1 and q2 != 1 and q3 != 1 and q4 != 1 ) {
		selectedMob( 9814 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}

script "selectedMob6" {
	qr = target.questRecord;
	q1 = qr.getState( 9810 );
	q2 = qr.getState( 9811 );
	q3 = qr.getState( 9812 );
	q4 = qr.getState( 9813 );
	q5 = qr.getState( 9814 );
	q6 = qr.getState( 9815 );
	q7 = qr.getState( 9816 );
	q8 = qr.getState( 9817 );

	if ( q1 != 1 and q2 != 1 and q3 != 1 and q4 != 1 and q5 != 1) {
		selectedMob( 9815 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}

script "selectedMob7" {
	qr = target.questRecord;
	q1 = qr.getState( 9810 );
	q2 = qr.getState( 9811 );
	q3 = qr.getState( 9812 );
	q4 = qr.getState( 9813 );
	q5 = qr.getState( 9814 );
	q6 = qr.getState( 9815 );
	q7 = qr.getState( 9816 );
	q8 = qr.getState( 9817 );

	if ( q1 != 1 and q2 != 1 and q3 != 1 and q4 != 1 and q5 != 1 and q6 != 1 ) {
		selectedMob( 9816 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}

script "selectedMob8" {
	qr = target.questRecord;
	q1 = qr.getState( 9810 );
	q2 = qr.getState( 9811 );
	q3 = qr.getState( 9812 );
	q4 = qr.getState( 9813 );
	q5 = qr.getState( 9814 );
	q6 = qr.getState( 9815 );
	q7 = qr.getState( 9816 );
	q8 = qr.getState( 9817 );

	if ( q1 != 1 and q2 != 1 and q3 != 1 and q4 != 1 and q5 != 1 and q6 != 1 and q7 != 1 ) {
		selectedMob( 9817 );
	} else self.say( "����, ������ �������� ��� �̺�Ʈ�� �������ΰ� �ƴϾ�? �ѹ��� �ϳ��� ���͸� ������ �� ������ ���� �������� ����Ʈ�� ������ ��." );
}
*/
// 4�ֳ� : ī������ ��ġ�� ����
script "q9809e" {
	inven = target.inventory;
	qr = target.questRecord;
	file = "#fUI/UIWindow.img/QuestIcon/";

	rNum = random( 0, 9999 );
	if ( rNum <= 1 ) {
		self.say( "��~ ���� ������ ������ ���Ա���!\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#" );
		luk = inven.exchangeEx( 0, "4001126", -4, "4055000,DateExpire:2007052100", 1 );
		if ( luk == 0 ) self.say( "��Ÿâ�� �� ĭ�� �ִ��� Ȯ���� �ּ���." );
		else {
			self.say( "������ ������ �ϱ� ���� ���̶�� ����. �ѹ� ���ſ� ������ ���� �� ���ھ��." );
			qr.setState( 9809, 2 );
			target.questEndEffect;
		}
	} else if ( rNum == 2 ) {
		self.say( "��~ ���� ������ ������ ���Ա���!\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#" );
		luk = inven.exchangeEx( 0, "4001126", -4, "4055001,DateExpire:2007052100", 1 );
		if ( luk == 0 ) self.say( "��Ÿâ�� �� ĭ�� �ִ��� Ȯ���� �ּ���." );
		else {
			self.say( "���� ��� �ڿ� ���� ������ ����� ��������. �̿�ǿ� �ѹ� ������ ���� ���ڱ���." );
			qr.setState( 9809, 2 );
			target.questEndEffect;
		}
	} else if ( rNum > 2 and rNum <= 3001 ) {
		self.say( "��~ ���� ������ ������ ���Ա���!\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#" );
		luk = inven.exchange( 0, 4001126, -4  );
		target.giveBuff( 2022124 );
		qr.setState( 9809, 2 );
		target.questEndEffect;
		self.say( "������ �繰���� ���� ������. �޼Ҹ� ���� ���� ���ڽ��ϴ�." );

	} else if ( rNum > 3001 and rNum <= 8000 ) {
		self.say( "��~ ���� ������ ������ ���Ա���!\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#" );
		luk = inven.exchange( 0, 4001126, -4 );
		target.giveBuff( 2022151 );
		qr.setState( 9809, 2 );
		target.questEndEffect;
		self.say( "������ ���� �ǰ����� �����. �ǰ����� ������ ����� ��ܺ��°� ���ھ��." );

	} else if ( rNum > 8000 and rNum <= 9999 ) {
		self.say( "��~ ���� ������ ������ ���Ա���!\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#" );
		luk = inven.exchange( 0, 4001126, -4 );
		target.giveBuff( 2022152 );
		qr.setState( 9809, 2 );
		target.questEndEffect;
		self.say( "������ ���� �ǰ����� �����. �ǰ����� ������ ����� ��ܺ��°� ���ھ��." );
	}
}

// 4�ֳ� : ������ ���� ���� �� ���׷��̵�
script "4th_mapleWeapon" {
	// ���ⱳȯ ��¥����
	wTime = currentTime;
	if ( serverType == 2 ) {
		wsTime = compareTime( wTime, "07/04/17/00/00" );
		weTime = compareTime( "07/05/16/00/00", wTime );
	} else {
		wsTime = compareTime( wTime, "07/04/24/00/00" );
		weTime = compareTime( "07/05/21/00/00", wTime );
	}

	if ( wsTime < 0 or weTime < 0 ) {
		self.say( "�̺�Ʈ �Ⱓ�� ����Ǿ����ϴ�." );
		end;
	}

	inven = target.inventory;

	rat = self.askMenu( "�ȳ��ϼ���~ �Ͼ�������? #e#r�����ý��丮#k#n�� ���� #e#r4�ֳ�#k#n�� �Ǿ����. 4�� ���� ���Ծ��� ����� ���� �ֽ� ���谡 �������� ���ؼ� Ư���� ������ 4�ֳ� ���⸦ ������ �帮�� �ֽ��ϴ�.\r\n#b#L0#4�ֳ� ���⸦ ��� �;��#l\r\n#L1#������ ���ڸ� ��� �;��.#l\r\n#L2#4�ֳ� ������ �ǵ带 ��� �;��.#l\r\n#L3#������ �̾�� ��� �;��.#l\r\n#L4#4�ֳ� ���� �ֹ����� ��� �;��.#l#k" );
	// ��������
	if ( rat == 0 ) {
		v1 = self.askMenu( "4�ֳ� ���⸦ ��� ���ؼ��� #b������ ����#k�� #b��ǳ��#k�� �ʿ��ϴ�ϴ�. � ���⸦ �������̳���?\r\n#L0##v4001126# #b2000 ��#k + #v1302020##l\r\n#L1##v4001126# #b2000 ��#k + #v1382009##l\r\n#L2##v4001126# #b2000 ��#k + #v1452016##l\r\n#L3##v4001126# #b2000 ��#k + #v1462014##l\r\n#L4##v4001126# #b2000 ��#k + #v1472030##l\r\n#L5##v4001126# #b1500 ��#k + #v1302030##l\r\n#L6##v4001126# #b1500 ��#k + #v1332025##l\r\n#L7##v4001126# #b1500 ��#k + #v1382012##l\r\n#L8##v4001126# #b1500 ��#k + #v1412011##l\r\n#L9##v4001126# #b1500 ��#k + #v1422014##l\r\n#L10##v4001126# #b1500 ��#k + #v1432012##l\r\n#L11##v4001126# #b1500 ��#k + #v1442024##l\r\n#L12##v4001126# #b1500 ��#k + #v1452022##l\r\n#L13##v4001126# #b1500 ��#k + #v1462019##l\r\n#L14##v4001126# #b1500 ��#k + #v1472032##l" );
		if ( v1 == 0 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b2000 ��#k + #v1302020# = #v1302064:##l\r\n#L1##v4001126# #b2000 ��#k + #v1302020# = #v1402039:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1302020", -1, "4001126", -2000, "1302064,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			} else if ( v2 == 1 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1302020", -1, "4001126", -2000, "1402039,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 1 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b2000 ��#k + #v1382009# = #v1372034:##l\r\n#L1##v4001126# #b2000 ��#k + #v1382009# = #v1382039:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1382009", -1, "4001126", -2000, "1372034,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			} else if ( v2 == 1 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1382009", -1, "4001126", -2000, "1382039,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 2 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b2000 ��#k + #v1452016# = #v1452045:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1452016", -1, "4001126", -2000, "1452045,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 3 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b2000 ��#k + #v1462014# = #v1462040:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1462014", -1, "4001126", -2000, "1462040,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 4 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b2000 ��#k + #v1472030# = #v1472055:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1472030", -1, "4001126", -2000, "1472055,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 5 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1302030# = #v1302064:##l\r\n#L1##v4001126# #b1500 ��#k + #v1302030# = #v1402039:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1302030", -1, "4001126", -1500, "1302064,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			} else if ( v2 == 1 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1302030", -1, "4001126", -1500, "1402039,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 6 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1332025# = #v1332055:##l\r\n#L1##v4001126# #b1500 ��#k + #v1332025# = #v1332056:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1332025", -1, "4001126", -1500, "1332055,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			} else if ( v2 == 1 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1332025", -1, "4001126", -1500, "1332056,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 7 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1382012# = #v1372034:##l\r\n#L1##v4001126# #b1500 ��#k + #v1382012# = #v1382039:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1382012", -1, "4001126", -1500, "1372034,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			} else if ( v2 == 1 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1382012", -1, "4001126", -1500, "1382039,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 8 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1412011# = #v1412027:##l\r\n#L1##v4001126# #b1500 ��#k + #v1412011# = #v1312032:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1412011", -1, "4001126", -1500, "1412027,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			} else if ( v2 == 1 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1412011", -1, "4001126", -1500, "1312032,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 9 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1422014# = #v1422029:##l\r\n#L1##v4001126# #b1500 ��#k + #v1422014# = #v1322054:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1422014", -1, "4001126", -1500, "1422029,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			} else if ( v2 == 1 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1422014", -1, "4001126", -1500, "1322054,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 10 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1432012# = #v1432040:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1432012", -1, "4001126", -1500, "1432040,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 11 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1442024# = #v1442051:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1442024", -1, "4001126", -1500, "1442051,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 12 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1452022# = #v1452045:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1452022", -1, "4001126", -1500, "1452045,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 13 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1462019# = #v1462040:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1462019", -1, "4001126", -1500, "1462040,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		} else if ( v1 == 14 ) {
			v2 = self.askMenu( "��ȯ�Ͻ� ���⸦ ������ �ּ���.\r\n#L0##v4001126# #b1500 ��#k + #v1472032# = #v1472055:##l" );
			if ( v2 == 0 ) {
				v3 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. �׸��� ���� ��ȯ�Ͻ� ���⸦ 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���Ⱑ ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���. ���� ��ȯ�Ͻðھ��?" );
				if ( v3 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
				else {
					v4 = inven.exchangeEx( 0, "1472032", -1, "4001126", -1500, "1472055,Variation:2", 1 );
					if ( v4 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
					else self.say( "��ſ� �Ϸ� �Ǽ���~" );
				}
			}
		}
	// ������ ���� ����
	} else if ( rat == 1 ) {	
		v1 = self.askMenu( "� ���ڸ� ���Ͻó���? ���ϴ� ������ ���ڸ� �����ϼ���.\r\n#L0##b#v1002508:# #t1002508# ���#l\r\n#L1##v1002509:# 1�� ���׷��̵� �ϱ�#l\r\n#L2##v1002510:# 2�� ���׷��̵� �ϱ�#l\r\n#L3##v1002511:# 3�� ���׷��̵� �ϱ�#l" );
		if ( v1 == 0 ) {
			v2 = self.askYesNo( "#t1002508#�� ��� ���ؼ��� ������ ���� ��ᰡ �ʿ��մϴ�. ����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. ��ȯ�Ͻðھ��?\r\n\r\n#v4001126# 100 ��" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
			else {
				tak = target.isWear( 1002508 );
				tak1 = target.isWear( 1002509 );
				tak2 = target.isWear( 1002510 );
				tak3 = target.isWear( 1002511 );

				had = inven.itemCount( 1002508 );
				had1 = inven.itemCount( 1002509 );
				had2 = inven.itemCount( 1002510 );
				had3 = inven.itemCount( 1002511 );

				if ( tak == 0 and tak1 == 0 and tak2 == 0 and tak3 == 0 ) {
					if ( had == 0 and had1 == 0 and had2 == 0 and had3 == 0 ) {
						v3 = inven.exchangeEx( 0, "4001126", -100, "1002508,Variation:2", 1 );
						if ( v3 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
						else self.say( "��ſ� �Ϸ� �Ǽ���~" );
					} else self.say( "�̹� ������ ���ڸ� ������ ��ñ���? ������ ���ڴ� 2�� �̻� ������ �� ����ϴ�." );
				} else self.say( "�̹� ������ ���ڸ� �����ϰ� ��ñ���? ������ ���ڴ� 2�� �̻� ������ �� ����ϴ�." );
			}
		} else if ( v1 == 1 ) {
			v2 = self.askYesNo( "#t1002509#�� ��� ���ؼ��� ������ ���� ��ᰡ �ʿ��մϴ�. ����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. ��ȯ�Ͻðھ��?\r\n\r\n#v4001126# 200 �� + #v1002508#" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
			else {
				v3 = inven.exchangeEx( 0, "1002508", -1, "4001126", -200, "1002509,Variation:2", 1 );
				if ( v3 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 2 ) {
			v2 = self.askYesNo( "#t1002510#�� ��� ���ؼ��� ������ ���� ��ᰡ �ʿ��մϴ�. ����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. ��ȯ�Ͻðھ��?\r\n\r\n#v4001126# 300 �� + #v1002509#" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
			else {
				v3 = inven.exchangeEx( 0, "1002509", -1, "4001126", -300, "1002510,Variation:2", 1 );
				if ( v3 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 3 ) {
			v2 = self.askYesNo( "#t1002511#�� ��� ���ؼ��� ������ ���� ��ᰡ �ʿ��մϴ�. ����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�. ��ȯ�Ͻðھ��?\r\n\r\n#v4001126# 400 �� + #v1002510#" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
			else {
				v3 = inven.exchangeEx( 0, "1002510", -1, "4001126", -400, "1002511,Variation:2", 1 );
				if ( v3 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		}
	// ������ �ǵ� ����
	} else if ( rat == 2 ) {
		v1 = self.askMenu( "������ �ǵ�� ��ǳ�ٸ� �ִٸ� #b4�ֳ� ������ �ǵ�#k�� ��ȯ�Ͻ� �� �ִ�ϴ�. � ���з� ��ȯ�Ͻðھ��?\r\n#L0##v4001126# #b1000 ��#k + #v1092030# = #v1092045:##l\r\n#L1##v4001126# #b1000 ��#k + #v1092030# = #v1092046:##l\r\n#L2##v4001126# #b1000 ��#k + #v1092030# = #v1092047:##l" );
		if ( v1 == 0 ) {
			v2 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�.  �׸��� ���� ��ȯ�Ͻ� ���и� 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���а� ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���.���� ��ȯ�Ͻðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
			else {
				v3 = inven.exchangeEx( 0, "1092030", -1, "4001126", -1000, "1092045,Variation:2", 1 );
				if ( v3 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 1 ) {
			v2 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�.  �׸��� ���� ��ȯ�Ͻ� ���и� 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���а� ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���.���� ��ȯ�Ͻðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
			else {
				v3 = inven.exchangeEx( 0, "1092030", -1, "4001126", -1000, "1092046,Variation:2", 1 );
				if ( v3 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 2 ) {
			v2 = self.askYesNo( "����! ���ǻ����� �־��. ������ �ɷ�ġ�� �����ϰ� �����ȴ�ϴ�.  �׸��� ���� ��ȯ�Ͻ� ���и� 2�� �̻� ������ ��ôٸ� �κ��丮 ���� ���ʿ� �ִ� ���а� ��ȯ�ȴٴ� �͵� �˾� �νñ� �ٷ���.���� ��ȯ�Ͻðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? õõ�� �� ������ ���ð� �����ϼŵ� �������ϴ�." );
			else {
				v3 = inven.exchangeEx( 0, "1092030", -1, "4001126", -1000, "1092047,Variation:2", 1 );
				if ( v3 == 0 ) self.say( "��ᰡ ��� �غ�Ǿ����� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		}
	// ������ �Ͱ���
	} else if ( rat == 3 ) self.say( "������ �̾�̶�... �װ� �����ױ��� #b��#k���� ������ ���� ���ڱ���." );
	// ���� �ֹ���
	else if ( rat == 4 ) {
		v1 = self.askMenu( "#b#t4001126# 1000 ��#k�� �ִٸ� 4�ֳ� ���⿡ ����� �� �ִ� ���� �ֹ����� ���� �� �ִ�ϴ�. ��Ͽ��� ���ϴ� �ֹ����� �����غ�����.\r\n#L0##t2040315##l\r\n#L1##t2040912##l\r\n#L2##t2043013##l\r\n#L3##t2043108##l\r\n#L4##t2043208##l\r\n#L5##t2043308##l\r\n#L6##t2043708##l\r\n#L7##t2043808##l\r\n#L8##t2044008##l\r\n#L9##t2044108##l\r\n#L10##t2044208##l\r\n#L11##t2044308##l\r\n#L12##t2044408##l\r\n#L13##t2044508##l\r\n#L14##t2044608##l\r\n#L15##t2044708##l" );
		if ( v1 == 0 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2040315##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2040315, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 1 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2040912##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2040912, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 2 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2043013##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2043013, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 3 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2043108##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2043108, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 4 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2043208##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2043208, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 5 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2043308##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2043308, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 6 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2043708##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2043708, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 7 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2043808##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2043808, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 8 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2044008##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2044008, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 9 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2044108##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2044108, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 10 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2044208##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2044208, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 11 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2044308##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2044308, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 12 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2044408##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2044408, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 13 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2044508##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2044508, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 14 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2044608##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2044608, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		} else if ( v1 == 15 ) {
			v2 = self.askYesNo( "#t4001126# 1000 ���� #b#t2044708##k�� �ٲٽðھ��?" );
			if ( v2 == 0 ) self.say( "������ �ٲ�̳���? �ٽ� �ѹ� �� ������ ���ð� �����ϼ���." );
			else {
				v3 = inven.exchange( 0, 4001126, -1000, 2044708, 1 );
				if ( v3 == 0 ) self.say( "#t4001126#�� ����� �ִ��� Ȯ���ϼ̳���? �ƴϸ� �Һ�â�� �� ĭ�� �ִ��� �ٽ� �ѹ� Ȯ���� �ּ���." );
				else self.say( "��ſ� �Ϸ� �Ǽ���~" );
			}
		}
	}
}

// ������ �̺�Ʈ ���� ����
script "q9800e" {
	inven = target.inventory;
	qr = target.questRecord;
	reward = 0;
	file = "#fUI/UIWindow.img/QuestIcon/";

	level = target.nLevel;
	if ( level >= 2 and level <= 31 ) reward = level + 8;
	else if ( level >= 32 and level <= 41 ) reward = level + 9 + ( level - 32 );
	else if ( level >= 42 and level <= 61 ) reward = level + 20 + ( 2 * ( level - 42 ));
	else if ( level >= 62 and level <= 76 ) reward = level + 62 + ( 4 * ( level - 62 ));
	else if ( level >= 77 and level <= 91 ) reward = level + 123 + ( 5 * ( level - 77 ));
	else if ( level >= 92 and level <= 106 ) reward = level + 199 + ( 6 * ( level - 92 ));
	else if ( level >= 107 and level <= 121 ) reward = level + 290 + ( 7 * ( level - 107 ));
	else if ( level >= 122 and level <= 136 ) reward = level + 396 + ( 8 * ( level - 122 ));
	else if ( level >= 137 and level <= 151 ) reward = level + 517 + ( 9 * ( level - 137 ));
	else if ( level >= 152 and level <= 166 ) reward = level + 653 + ( 10 * ( level - 152 ));
	else if ( level >= 167 and level <= 181 ) reward = level + 804 + ( 11 * ( level - 167 ));
	else if ( level >= 182 and level <= 196 ) reward = level + 970 + ( 12 * ( level - 182 ));
	else if ( level >= 197 and level <= 200 ) reward = level + 1151 + ( 13 * ( level - 197 ));
	
	self.say( level +  "������ �ǽ� ���� �����մϴ�. ������ ���� ������� #t4001126#�� ������ �帮�� �ֽ��ϴ�. ���� �Ϸ絵 ��ſ� #r#e�����ý��丮#n#k�� �Բ��ϼ���~\r\n\r\n" + file + "4/0#\r\n#v4001126# #t4001126#" + reward + "��" );
	ret = inven.exchange( 0, 4001126, reward );
	if ( ret == 0 ) self.say( "��Ÿâ�� �� ĭ�� �ִ��� Ȯ���� �ּ���." );
	else {
		qr.setState( 9800, 2 );
		target.questEndEffect;
	}
}
