  module "standard.s";  

  // 4/0 : ȹ��!!  
  // 5/0 : ? �ڽ�  
  // 6/0 : �α⵵  
  // 7/0 : �޼�  
  // 8/0 : ����ġ  
  // 8/0 : ģ�е�  

  //������ ���  
  script "q1021s" {  
  	inven = target.inventory;  
  	qr = target.questRecord;  

  	if ( target.nGender == 0 ) {  
  		self.say( "E a�, cara~ Tudo legal? Haha! Eu sou #p2000# e passo para voc�s, novos viajantes, um mont�o de informa��es." );  
  		self.say( "Voc� t� perguntando quem me fez fazer isto? Hahahaha! Eu mesmo! Eu quis fazer isto e simplesmente ser gentil com voc�s, novos viajantes." );  
  	}  
  	else if ( target.nGender == 1 ) {  
  		self.say( "Oi, pessoal~ Eu sou #p2000# e passo pra voc�s, pessoas novas em Maple, um mont�o de informa��es." );  
  		self.say( "Sei que t� #Gocupado:ocupada#! Fica um tempo aqui comigo~ Posso te dar informa��es muito �teis! Hahahaha!" );  
  	}  

  	v0 = self.askAccept( "Ent�o..... Deixa eu animar as coisas um pouco! Abracadabra~!");  
  	if ( v0 == 0 ) self.say( "N�o acredito que voc� acabou de recusar um cara simp�tico como eu!" );  
  	else {  
  		if ( inven.itemCount( 2010007 ) >= 1 ) {  
  			val3 = target.nHP / 2;  
  			target.incHP( -val3, 0 );  
  			qr.setState( 1021, 1 );  
  			self.say( "#GSurpreso:Surpresa#? Se o HP for para 0, voc� ter� um problema. Agora vou dar para voc� a #r#t2010007##k. Pode pegar. Voc� vai se sentir mais forte. Abra a Janela de Itens e d� dois cliques para usar.  Ei, � muito simples abrir a Janela de Itens. Simplesmente aperte #bI#k no seu teclado.#I" );  
  			self.say( "Pegue todas as #t2010007#s que eu te dei. Voc� poder� ver a barra de HP aumentando. Fale de novo comigo quando voc� recuperar 100% do HP#I" );  
  		} else {  
  			ret = inven.exchange( 0, 2010007, 1 );  
  			if ( ret == 0 ) self.say( "Ei, voc� t� carregando muitas coisas." );  
  			else {  
  				val2 = target.nHP / 2;  
  				target.incHP( -val2, 0 );  
  				qr.setState( 1021, 1 );  
  				self.say( "#GSurpreso:Surpresa#? Se o HP for para 0, voc� ter� um problema. Agora vou dar para voc� a #r#t2010007##k. Pode pegar. Voc� vai se sentir mais forte. Abra a Janela de Itens e d� dois cliques para usar.  Ei, � muito simples abrir a Janela de Itens. Simplesmente aperte #bI#k no seu teclado.#I" );  
  				self.say( "Pegue cada #t2010007# que eu te dei. Voc� poder� ver a barra de HP aumentando. Fale de novo comigo quando voc� recuperar 100% do HP#I" );  
  			}  
  		}  
  	}  
  }  

  script "q1021e" {  
  	inven = target.inventory;  
  	qr = target.questRecord;  
  	if ( inven.itemCount( 2010007 ) == 0 ) {  
  		if ( target.nHP == target.nMHP ) {  
  			file = "#fUI/UIWindow.img/QuestIcon/";  
  			self.say( "Se � f�cil usar o item? Simples, certo? Voc� pode configurar um #batalho#k no slot inferior direito. Haha, voc� n�o sabia disso, n�? Ah, e se voc� � #Gum:uma# aprendiz, o HP ir� automaticamente se recuperar com o passar do tempo. Bem, isso toma tempo, mas � uma das estrat�gias para aprendizes." );  
  			self.say( "Certo! Agora que voc� aprendeu bastante, vou te dar um presente. Voc� tem que ter para poder viajar no Mundo Maple, ent�o me agrade�a! Por favor, use em casos de emerg�ncia!" );  
  			self.say( "Certo, isso � tudo o que posso te ensinar. Sei que � triste, mas � hora de dizer adeus. Bem, se cuida e boa sorte #Gmeu:minha# #Gamigo:amiga#!\r\n\r\n" + file + "4/0#\r\n#v2010000# 3 #t2010000#\r\n#v2010009# 3 #t2010009#\r\n\r\n" + file + "8/0# 10 exp" );  

  			ret = inven.exchange( 0, 2010000, 3, 2010009, 3 );  
  			if ( ret == 0 ) self.say( "Puxa! Muitos itens no seu invent�rio....." );  
  			else {  
  				target.incEXP( 10, 0 );  
  				qr.setState( 1021, 2 );  
  				target.questEndEffect;  
  			}  
  		} else self.say( "Ei, seu HP ainda n�o se recuperou totalmente. Voc� pegou cada #t2010007# que eu te dei? Tem certeza?" );  
  	} else self.say( "Veja... Eu disse para voc� pegar cada #r#t2010007##k que eu te dei. Abra a Janela de Itens e clique na #baba USO#b. L� voc� ver� a #t2010007#, d� dois cliques para usar." );  
  }  

  script "q1028s" {  
  	qr = target.questRecord;  
	
  	self.say( "Ei, se voc� quiser ir para Ilha Victoria, eu posso te indicar o caminho a qualquer hora! � claro, s� se voc� puder pagar #b150 mesos#k. O qu�? Voc� tem a mensagem de #b#p12000##k??? Ah, voc� � a pessoa de quem ele falou. Certo, ent�o. Uma vez que voc� est� fazendo um favor para a Ilha Maple, eu te darei o caminho de gra�a." );  
  	v0 = self.askAccept( "E voc� sabe que, uma vez que voc� saia da Ilha Maple, voc� nunca mais poder� voltar para este lugar. Voc� chegar� em #b#m104000000##kde Victoria Island. � mais cheio de gente do que em Porto Sul, ent�o procure manter a cabe�a no jogo. N�o se preocupe, ser� muito f�cil para voc� encontrar.#b#p1002101##k" );  
  	if ( v0 == 0 ) self.say( "Oh, voc� precisa de mais tempo? Certo... Estarei esperando aqui at� voc� fazer tudo o que precisa na Ilha Maple." );  
  	else {  
  		qr.setState( 1028, 1 );  
  		registerTransferField( 104000000, "maple00" );  
  	}  
  }  

  //����۽��� �ܰ����?  
  script "q3452e" {  
  	inven = target.inventory;  
  	qr = target.questRecord;  
  	if ( inven.itemCount( 4000099 ) >= 1 ) {  
  		if ( inven.itemCount( 4001125 ) >= 1 ) {  
  			file = "#fUI/UIWindow.img/QuestIcon/";  
  			self.say( "���� ������� ���� �Դ°�? ����... �Ϳ��� ���� �����̱�. ������ �̰� �ٷ� ������ �����ϴ� �ܰ����� ��ü�� ���� �߿��� ����...���!" );  
  			self.say( "�ڳװ� ������ �ִ� �� ����! �װ� �� �����ְ�. �ڳ� �տ� ��� �ִ� �ٷ� �� ���赵 ���ϼ�. ��~ �̷� ������ ��� ���Ѱǰ�? �̰͸� ������ ����۽��� ���� ������ �� ���� �����ų �� �ְھ�." );  
  			self.say( "����� ��Ȯ�ΰ�. ����. �ڳ׿��� Ư���� ������ �ϵ��� ����. �и� ������ �ɰž�. ������~\r\n\r\n" + file + "4/0#\r\n#v2040701# #t2040701# 1��\r\n\r\n" + file + "8/0# 16000 exp" );  

  			res = inven.exchange( 0, 4000099, -1, 4001125, -1, 2040701, 1 );  
  			if ( res == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  			else {  
  				target.incEXP( 16000, 0 );  
  				qr.setState( 3452, 2 );  
  				target.questEndEffect;  
  				self.say( "����۽��� �ܰ���... �ƹ��� �����ص� ���� ����ϴ� ���̾�. �ƴ�, ����� �ܰ����� ����� ������... ����. �̰͵� ���ο� �̷��̱�." );  
  			}  
  		} else {   
  			file = "#fUI/UIWindow.img/QuestIcon/";  
  			self.say( "���� ������� ���� �Դ°�? ����... �Ϳ��� ���� �����̱�. ������ �̰� �ٷ� ������ �����ϴ� �ܰ����� ��ü�� ���� �߿��� ��������. ���� ����.\r\n\r\n" + file + "4/0#\r\n#v2000011# #t2000011# 50��\r\n\r\n" + file + "8/0# 8000 exp" );  
		
  			ret = inven.exchange(0, 4000099, -1, 2000011, 50 );  
  			if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  			else {  
  				target.incEXP( 8000, 0 );  
  				qr.setState( 3452, 2 );  
  				target.questEndEffect;  
  				self.say( "����۽��� �ܰ���... �ƹ��� �����ص� ���� ����ϴ� ���̾�. �ƴ�, ����� �ܰ����� ����� ������... ����. �̰͵� ���ο� �̷��̱�." );  
  			}  
  		}  
  	} else self.say( "���� ���� ������� ������ ���� ����̱�. �װ� ����۽����� ������ �ִٳ�." );  
  }  

  //�պ��� ��� ���ѱ�  
  script "q3941s" {  
  	qr = target.questRecord;  
  	morphID = target.getMorphState;  
  	if ( morphID == 6 ) {  
  		self.askMenu( "...#p2101004#�� �ƴϽʴϱ�? �������Դϴ�. �̹��� �պ�Բ��� ��Ÿ�� ã���ô� ����� ������ ���س����ϴ�. �׻� �׷����� ������ �ְ��... �׷��� �� �̷��� ���� �긮�ʴϱ�?\r\n#L0##b(��������)�ƴ�, �׳� �¾��� ������...#l" );  
  		self.askMenu( "�Ƹ���Ʈ�� ������ �� ���� ���̾����ϱ�? �׻� �̷����� #p2101004#���� ������ �� Ÿ�ô� �� �˾ҽ��ϴٸ�... �ƴ� ���� ���� �������� ��ʴϴ�. �������ʴϱ�?\r\n#L0##b(��������)��, ������. �������� ����...#l" );  
  		self.askMenu( "���� �������� �̴ϱ�? �� �׷��� #p2101004#���� ���ü�� �����ŵ�, ���� ���̶� �� ��ž� �ϴ� �� �ƴմϱ�? ������ �ʿ��� ����, ������� �ִµ� �ϳ� ��ðڽ��ϱ�? �ΰ� �帮��.\r\n#L0##b��, �����ٴϱ� �׷���!#l" );  
  		silk = self.askAccept( "�������ôٰ��? �׷��� #p2101004#�� ��Ҹ��� ����ϰ� ���� ���� �ٸ��ϴ�? ���� ���⿡ �ɸ��� �� �ƴմϱ�? ������ ����� #p2101004#�� ���� �����ʴϴ�. ��ҿ��� �׻� #t4010007#�� �ΰ� �޶�� �ϼ̴µ�... �̻��ϱ���. ���� #p2101004#���̽ʴϱ�?" );  
		
  		if ( silk == 0 ) self.say( "#p2101004#���� �ƴ϶���? �ƴ� ��� ���� #p2101004#���̽ŵ� ����ü ���� ���� �Ͻô� ����... ���� ���� ������ ����̱���. ����� ������ ���� �帱 �״�, �ٽ� ã�ƿ�����." );  
  		else {  
  			qr.setState( 3941, 1 );  
  			self.say( "����� #p2101004#�� ���� �����ʴϴ�. ���� #p2101004#���� �̷��� ���� ���� ���� �ƴϽ� �ɷ� �ƴµ�... ���� ���̶� ������ �̴ϱ�? ��. ���� ���� �Ӿ����ô� �� �ƹ����� ȭ�� ���� ����̱���. �˼��մϴ�. � ���� ����� �������ڽ��ϴ�. ��ø� ��ٷ� �ּ���." );  
  		}  
  	} else self.say( "������ ���� ����? ������ �� ������ ��¥ �縷�̶�� �� �� ���� �ʰھ��? �׳����� #p2101004#���� ���� ���÷���?" );  
  }  

  script "q3941e" {  
  	qr = target.questRecord;  
  	inven = target.inventory;  
  	morphID = target.getMorphState;  
  	file = "#fUI/UIWindow.img/QuestIcon/";  
  	if ( morphID == 6 ) {  
  		self.say( "�� ���� �ֽ��ϴ�. �����ؼ� �������ʽÿ�. �� ���, ���ϱ� ��ô ���� �����Դϴ�. Ȥ�� �����̶� ������ ���� ������ ���� �պ�Բ��� #p2101004#���� ������ ���ΰ� �� ���Դϴ�.\r\n\r\n" + file + "4/0#\r\n#v4031571# #t4031571# 1��\r\n\r\n" );  

  		ros = inven.exchange( 0, 4031571, 1 );  
  		if ( ros == 0 ) self.say( "�κ��丮�� ���� ���Ƽ� ����� �����帱 ���� ���°ɿ�? �߿��� ������ ����Ͻôµ� ���ݸ� �ڸ��� ���������." );  
  		else {  
  			qr.setState( 3941, 2 );  
  			target.questEndEffect;  
  		}  
  	} else self.say( "������ ���� ���� �ʾƿ�? ���� ��¦��¦ Ÿ�� ����." );  
  }  

  //�Ƶ��� �𷡱׸���  
  script "q3933s" {  
  	qr = target.questRecord;  
  	quest = FieldSet( "Adin" );  

  	self.say( "�װ� �̷��� ���� �� ������. �� ������ �𷡱׸��ܿ��� �� �� �������� �𸣰ڴٴ� ������ ��°�? �𷡱׸��ܿ����� ���� �߿��� �� �����̰�, �� ����� ���� �� ���ŵ�. ������ ���� �� ���� �� ������ �غ��� ������, �? �����ھ�? " );  
  	adin1 = self.askAccept( "��¥ ���� ������ Ȯ���Ϸ��� ���� ������ �ε��� ���� ���ۿ� ������? �ʿ� ����� �غ��� �;�. ���� ����. �ʸ� ��ġ�� ������ �ʾ�. �� �н����� �� ���������. ���� ���� ��ÿ� ���� �����ھ�?" );  
  	if ( adin1 == 0 ) self.say( "������ �غ� �ʿ��Ѱǰ�? �ʹ� ���������� ����." );  
  	else {  
  		self.say( "����. �ڽŸ����ϱ�." );  
  		setParty = FieldSet( "Adin" );  
  		adin2 = setParty.enter( target.nCharacterID, 0 );  
  		qr.setState( 3933, 1 );  

  		if ( adin2 != 0 ) self.say( "��... ��ø� ��ٷ� �ְ�. ���� �������� ������� ���� �ִ� �� ����. ��� �Ŀ� �ٽ� ã�ƿ� �ְ�." );  
  	}  
  }  

  // �縷����... : �Ƹ���Ʈ�� 5ȸ �����ֱ�  
  script "q2127e" {  
  	qr = target.questRecord;  
  	info = qr.get( 7060 );  
  	if ( info == "" ) {  
  		qr.set( 7060, "0" );  
  		info = qr.get( 7060 );  
  	}  

  	lv =  target.nLevel;  

  	if ( info == "0" ) {  
  		a1 = self.askAccept( "���� �غ�� �� �Ǿ���? ó�� ���� �Ŷ� ������ �� �� ����. ��������. �ڳ״� �� �� �� ���� �ž�. �� �ɷ����� ������ �ټ� ���� �װ����� ���� �� �� �ֳ�. ���� �̵��ϰڳ�?" );  
  		if ( a1 == 0 ) self.say( "�غ� �Ǹ� �ٽ� ã�ƿ���." );  
  		else {  
  			self.say( "�� �ٳ����." );  
  			registerTransferField( 260000200, "" );  
  			qr.set( 7060, "1" );  
  		}  
  	} else if ( info == "1" ) {  
  		a1 = self.askAccept( "�� ������ �Ʊ�. ���� ���� ���� ���� ���? �ٽ� ���� ���� ���� �� ������ �ϴ� ���� �ֳ�����? �ڳ׿��� �� ���� ��ȸ�� ���� �ֳ�. ���� �̵��ϰڳ�?" );  
  		if ( a1 == 0 ) self.say( "�غ� �Ǹ� �ٽ� ã�ƿ���." );  
  		else {  
  			self.say( "�� �ٳ����." );  
  			registerTransferField( 260000200, "" );  
  			qr.set( 7060, "2" );  
  		}  
  	} else if ( info == "2" ) {  
  		a1 = self.askAccept( "���� ���� �Ǵ±�. ��ô �ٻ� ����̾�? �ڳ׿��� �� ���� ��ȸ�� ���� �ֳ�. ���� �̵� �ϰڳ�?" );  
  		if ( a1 == 0 ) self.say( "�غ� �Ǹ� �ٽ� ã�ƿ���." );  
  		else {  
  			self.say( "�� �ٳ����." );  
  			registerTransferField( 260000200, "" );  
  			qr.set( 7060, "3" );  
  		}  
  	} else if ( info == "3" ) {  
  		a1 = self.askAccept( "�縷�� �ŷ����� ���ΰ� ����? �׷��� ���� �󱼵� �˰� ������ �� ����. �ڳ׿��� �� ���� ��ȸ�� ���� �ֳ�. ���� �̵� �ϰڳ�?" );  
  		if ( a1 == 0 ) self.say( "�غ� �Ǹ� �ٽ� ã�ƿ���." );  
  		else {  
  			self.say( "�� �ٳ����." );  
  			registerTransferField( 260000200, "" );  
  			qr.set( 7060, "4" );  
  		}  
  	} else if ( info == "4" ) {  
  		a1 = self.askAccept( "���õ� �װ����� ���°ǰ�? �̸��� ����� ����? �Ƹ���Ʈ��� �߾���? �ڳ׸� ���� ���� �� ���� ������ �;����±�. �ڳ׿��� �� ���� ��ȸ�� ���� �ֳ�. ���� �̵��ϰڳ�?" );  
  		if ( a1 == 0 ) self.say( "�غ� �Ǹ� �ٽ� ã�ƿ���." );  
  		else {  
  			self.say( "�� �ٳ����." );  
  			registerTransferField( 260000200, "" );  
  			qr.set( 7060, "5" );  
  			qr.setState( 2127, 2 );  
  			target.questEndEffect;  
  		}  
  	}  
  }  

  // �𷡱׸����� ����ǰ : 18�� �̻� 29�� ����  
  script "q2124e" {  
  	qr = target.questRecord;  
  	inven = target.inventory;  
  	val = qr.getState( 3937 );  
  	file = "#fUI/UIWindow.img/QuestIcon/";  

  	if ( val == 2 ) {  
  		self.say( "��! ������ �ߴ��� �������̾�. �̹��� ����ǰ ����� �þҳ�����? �� �߿��� �ӹ����µ�. �����߾�.\r\n\r\n" + file + "4/0#\r\n#v2030000# #t2030000# 5��\r\n#v2022155# #t2022155# 5��\r\n\r\n" + file + "8/0#\r\n2000 exp" );  

  		s1 = inven.exchange( 0, 4031619, -1, 2030000, 5, 2022155, 5 );  
  		if ( s1 == 0 ) self.say( "�Һ�â�� �� ĭ�� �ִ��� Ȯ���� �ּ���." );  
  		target.incEXP( 2000, 0 );  
  		qr.setState( 2124, 2 );  
  		target.questEndEffect;  
  	}  
  	else if ( val == 0 or val == 1 ) {  
  		self.say( "�����߾��. ���� ���� �����ϱ� �׸� ���������ؿ�.\r\n\r\n" + file + "4/0#\r\n#v2030000# #t2030000# 5��\r\n#v2022155# #t2022155# 5��\r\n\r\n" + file + "8/0#\r\n2000 exp" );  

  		s1 = inven.exchange( 0, 4031619, -1, 2030000, 10 );  
  		if ( s1 == 0 ) self.say( "�Һ�â�� �� ĭ�� �ִ��� Ȯ���� �ּ���." );  
  		target.incEXP( 2000, 0 );  
  		qr.setState( 2124, 2 );  
  		target.questEndEffect;  
  	}  
  }  

  // �𷡱׸����� ����ǰ :  30�� �̻�  
  script "q2126e" {  
  	qr = target.questRecord;  
  	inven = target.inventory;  
  	val = qr.getState( 3937 );  
  	file = "#fUI/UIWindow.img/QuestIcon/";  

  	if ( val == 2 ) {  
  		self.say( "��! ������ �ߴ��� �������̾�. �̹��� ����ǰ ����� �þҳ�����? �� �߿��� �ӹ����µ�. �����߾�.\r\n\r\n" + file + "4/0#\r\n#v2030000# #t2030000# 5��\r\n#v2022155# #t2022155# 5��\r\n\r\n" + file + "8/0#\r\n2000 exp" );  

  		s1 = inven.exchange( 0, 4031624, -1, 2030000, 5, 2022155, 5 );  
  		if ( s1 == 0 ) self.say( "�Һ�â�� �� ĭ�� �ִ��� Ȯ���� �ּ���." );  
  		else {  
  			target.incEXP( 2000, 0 );  
  			qr.setState( 2126, 2 );  
  			target.questEndEffect;  
  		}  
  	}  
  	else if ( val == 0 or val == 1 ) {  
  		self.say( "�����߾��. ���� ���� �����ϱ� �׸� ���������ؿ�.\r\n\r\n" + file + "4/0#\r\n#v2030000# #t2030000# 10��\r\n\r\n" + file + "8/0#\r\n2000 exp" );  

  		s1 = inven.exchange( 0, 4031624, -1, 2030000, 10 );  
  		if ( s1 == 0 ) self.say( "�Һ�â�� �� ĭ�� �ִ��� Ȯ���� �ּ���." );  
  		else {  
  			target.incEXP( 2000, 0 );  
  			qr.setState( 2126, 2 );  
  			target.questEndEffect;  
  		}  
  	}  
  }  

  script "thief_in1" {  
  	field = Field( 260010401 );  
	
  	target.enforceNpcChat( 2103008 );  
  }  

  script "thief_in2" {  
  	answer = self.askText( "������ ���� ���� �ʹٸ� ��ȣ�� ���ض�...", "", 0, 11 );  
  	if ( answer == "������ ����" or answer == "����������" ) {  
  		target.message( "��ȣ�� ������ �ź��� ���� ���� ������ �ε��Ѵ�." );  
  		registerTransferField( 260010402, "center00" );  
  	} else target.message ( "���� ���� ��½�� ���� �ʴ´�." );  
  }  

  //���� ������ ������  
  script "q3833e" {  
  	inven = target.inventory;  
  	qr = target.questRecord;  
  	nItem = inven.itemCount( 4000294 );  
  	if ( nItem >= 1000 ) {  
  		file = "#fUI/UIWindow.img/QuestIcon/";  
  		self.say( "��... ��������. �ڳ״� �ΰ��ΰ�?! �̷��� ���� ���� ���ٴ�, ����ü ���� �������� �� ������ �л��� �հ�...?! ��. �ƹ�ư ����. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n" + file + "8/0# 54000 exp" );  
  		res = inven.exchange( 0, 4000294, -nItem, 2000005, 50, 2040501, 1 );  
  		if ( res == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  		else {  
  			target.incEXP( 54000, 0 );  
  			qr.setState( 3833, 2 );  
  			target.questEndEffect;  
  			self.say( "�� ������ �»��� �������� ������..." );  
  		}  
  	}  
  	else  if ( nItem >= 900 and nItem < 1000 ) 	{  
  		file = "#fUI/UIWindow.img/QuestIcon/";  
  		self.say( "�ƴ�... ���� �̰� ��� �ڳװ� ���� ���ΰ�? ��, �����ϱ�... �� �������� ���ϴٴ�... �ڳ״� ���� ������ ���谡�ϼ�. ���� �Ǹ���! �� ������ �̷� �� �൵ �Ʊ��� ����. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n" + file + "8/0# 54000 exp" );  
  		ret = inven.exchange(0, 4000294, - nItem, 2020013, 50, 2040502, 1 );  
  		if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  		else {  
  			target.incEXP( 54000 , 0 );  
  			qr.setState( 3833, 2 );  
  			target.questEndEffect;  
  			self.say( "�̷��� ���� �� ���� ���� �������� ��������...?" );  
  		}  
  	}  
  	else  if ( nItem >= 700 and nItem < 900 ) 	{  
  		file = "#fUI/UIWindow.img/QuestIcon/";  
  		self.say( "ȣ��... ���� �����ϱ�. ������� ������ �� ���� �ʾ��� �ٵ�. ���� ����. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n" + file + "8/0# 54000 exp" );  
  		ret = inven.exchange(0, 4000294, - nItem, 2000004, 50, 2040500, 1 );  
  		if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  		else {  
  			target.incEXP( 54000 , 0 );  
  			qr.setState( 3833, 2 );  
  			target.questEndEffect;  
  			self.say( "��. �߸��ϴٰ� �������� �迡 ��� �Ʊ⵵ ��ưڴ°�." );  
  		}  
  	}  
  	else  if ( nItem >= 500 and nItem < 700 ) 	{  
  		file = "#fUI/UIWindow.img/QuestIcon/";  
  		self.say( "����... ����. �� ������ �»� �� �� ������. �ڳ� ���⺸�� �����̱�. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n" + file + "8/0# 54000 exp" );  
  		ret = inven.exchange(0, 4000294, - nItem, 2020013, 50 );  
  		if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  		else {  
  			target.incEXP( 54000 , 0 );  
  			qr.setState( 3833, 2 );  
  			target.questEndEffect;  
  			self.say( "�������� ����� �ű�� �͵� ���� �ʰڴ°�. Ȳ���忡�� �Űܴ޶�� ��Ź�ؾ߰ڱ�..." );  
  		}  
  	}  
  	else  if ( nItem >= 300 and nItem < 500 ) 	{  
  		file = "#fUI/UIWindow.img/QuestIcon/";  
  		self.say( "��... �� �� ������ ��а� �»� �� �� �ʰ���. ����. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n" + file + "8/0# 51000 exp" );  
  		ret = inven.exchange(0, 4000294, - nItem, 2020012, 50 );  
  		if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  		else {  
  			target.incEXP( 51000 , 0 );  
  			qr.setState( 3833, 2 );  
  			target.questEndEffect;  
  			self.say( "�� ������ �»��� �����ϰ���." );  
  		}  
  	}  
  	else  if ( nItem >= 200 and nItem < 300 ) 	{  
  		file = "#fUI/UIWindow.img/QuestIcon/";  
  		self.say( "����. �� ������ �׷����� �»��� �޷����� �� ���� �� ����. ��������. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n" + file + "8/0# 48000 exp" );  
  		ret = inven.exchange(0, 4000294, - nItem, 2001001, 50 );  
  		if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  		else {  
  			target.incEXP( 48000 , 0 );  
  			qr.setState( 3833, 2 );  
  			target.questEndEffect;  
  			self.say( "�ھ�, �׷� �������� �� �������߰ڱ�. ����� ������ ������ �͵� �߿�����." );  
  		}  
  	}  
  	else  if ( nItem >= 100 and nItem < 200 ) 	{  
  	file = "#fUI/UIWindow.img/QuestIcon/";  
  	self.say( "����. �� ���ڶ�� ������ ��, ���� ���� �� �����̴� ��¿ �� ����. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n" + file + "8/0# 45000 exp" );  
  	ret = inven.exchange(0, 4000294, - nItem, 2020008, 50 );  
  	if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  	else {  
  		target.incEXP( 45000 , 0 );  
  		qr.setState( 3833, 2 );  
  		target.questEndEffect;  
  		self.say( "��. �»��� �ѵ��� ������ڱ�.." );  
  		}  
  	}  
  	else  if ( nItem >= 50 and nItem < 100 ) 	{  
  	file = "#fUI/UIWindow.img/QuestIcon/";  
  	self.say( "����. �ܿ� �� �����ΰ�? ���� ���� �� �ƴ����� ���������� �ʱ�. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n"  + file + "8/0# 10000 exp" );  
  	ret = inven.exchange(0, 4000294, - nItem, 2020007, 50 );  
  	if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  	else {  
  		target.incEXP( 10000 , 0 );  
  		qr.setState( 3833, 2 );  
  		target.questEndEffect;  
  		self.say( "��Ż�� �ƴϾ�����... �̷� ������ ���� �ʿ� ���� �ٵ�." );  
  		}  
  	}  
  	else  if ( nItem >= 10 and nItem < 50 ) 	{  
  	file = "#fUI/UIWindow.img/QuestIcon/";  
  	self.say( "�ܿ� �̰� �ܰ�? ����... �ڳ� �ɷ��� �̰ͻ��� �� �ȴٴ� ���� �� ���� ��������... ������. �����̰� �̷����� ��. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n" + file + "8/0# 1000 exp" );  
  	ret = inven.exchange(0, 4000294, - nItem, 2022144, 10 );  
  	if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  	else {  
  		target.incEXP( 1000 , 0 );  
  		qr.setState( 3833, 2 );  
  		target.questEndEffect;  
  		self.say( "�̷�������� �»��� �� ����� ����..." );  
  		}  
  	}  
  	else  if ( nItem >= 1 and nItem < 10 ) 	{  
  	file = "#fUI/UIWindow.img/QuestIcon/";  
  	self.say( "...��, �׷�. ��·�� ������ �ֱ� �ϴ±���. �ڳװ� ���� #b#t4000294# " + nItem + "��#k�� � ������ �ְ�.\r\n\r\n" + file + "4/0#\r\n" + file + "5/0#\r\n\r\n"  + file + "8/0# 10 exp" );  
  	ret = inven.exchange(0, 4000294, - nItem, 2000000, 1 );  
  	if ( ret == 0 ) self.say( "�� �׷��� ���� ��� �ٴϴ°ǰ�? �κ��丮�� �� ĭ�� �ִ��� Ȯ���� �ְ�." );  
  	else {  
  		target.incEXP( 10 , 0 );  
  		qr.setState( 3833, 2 );  
  		target.questEndEffect;  
  		self.say( "�ѵ��� �»�� ������ ���� �ʴ� �� ���� �� �ϱ�..." );  
  		}							  
  	} else self.say( "���� 100�� ���� �������� ������ ���� ����̱�. �װ� ���� �������� ��� ���� �� �ִٳ�." );  
  }  

  //��������, �׸��� ������ ���ݼ���  
  script "q3314e" {  
  	inven = target.inventory;  
  	qr = target.questRecord;  
  	ret = target.checkCondition;  
  	len = length( ret );  
  	file = "#fUI/UIWindow.img/QuestIcon/";  

  	for ( i = 0..len ) {  
  		con = integer( substring( ret, i, 1 ));  
  		if ( con == 6 ) {  
  			a1 = self.askMenu( "����������.... �Ȼ��� â������ �� ���� ���� ȿ���� �ֱ�. �̹� ������ �����̾�! ��������! ���� ���̵带 ��ġ�� ������ ưư�� �༮���Դ� �ᵵ ������!\r\n#L0##b(���� ��ü�����̾���!)#k#l" );  

  			if ( a1 == 0 ) {  
  				a2 = self.askMenu( "��ô ��� ǥ���ΰ�? �׷��� ������ �� ����. �׸� ������ ���� �ƴϾ�... �ƴ�, ������ �������� �ص����� �����ϱ�... ��������....\r\n#L0##b(�� �ְ� �� ����� �ҿ� ����!)#k#l" );  

  				if ( a2 == 0 ) {  
  					a3 = self.askMenu( "�̰����� ���Ƿ� ��ü�� ���¸� ������ �� �ְ� �Ǿ���. ���� ���� �������� ������ �ž�. �̰ɷ�, ���� �� �༮�� �ٷ��� �̷��� �� �������� �𸣰ڱ�...\r\n#L0##b�� �༮�̿�?#k#l" );  

  					if ( a3 == 0 ) {  
  						self.say( "�׷�... �� �༮. ������ �ʿ����� �ְ��� �༮�̾���. �������� �Ǹ��� �Ƿ��� ���� �༮�̾��µ�... �༮�� �ִٸ� �̷� ������ �ݹ� �ذ��߰���. ������ ��¿ �� ����... �༮�� �̹� �����Ǿ� �������ϱ�...\r\n\r\n" + file + "5/0#\r\n\r\n" + file + "8/0# 40300 exp" );  

  						a = random( 0, 20 );  
  						if ( a == 0 ) nItem = 2022199;  
  						else if ( a >= 1 and a < 6 ) nItem = 2022224;  
  						else if ( a >= 6 and a < 11 ) nItem = 2022225;  
  						else if ( a >= 11 and a < 16 ) nItem = 2022226;  
  						else if ( a >= 16 and a <= 20 ) nItem = 2022227;  

  						rat = inven.exchange( 0, 2050004, 10, nItem, 20 );  

  						if ( rat == 0 ) self.say( "�Һ�â�� ������ ���� �ƴѰ�? Ȯ���� ����." );  
  						else {  
  							target.incEXP( 12500, 0 );  
  							qr.setState( 3314, 2 );  
  							target.questEndEffect;  

  							self.say( "�༮�� �� �����Ǿ������� �ƹ��� ����. �������ϰ� �༮�� �������߰�, ����� ���� �� �� ���� ������ �ϱ� �����߾�. �ƹ��� ��� � �������� ������ �ʾҾ�. �༮�� ���� ��ģ ������. ����, ����, ����... �������� ������ ����. �����ݿ� ����... �׸��� �ᱹ, #b�� ���#k�� ��������..." );  
  							self.say( "���ݼ������ �����̶�� ����Ƽ�ƿ�����, �� ������ ���� ������ �� �� ���� ������... �༮�� � ������ �ߴ���, �������� ���� �ʾ�. ����ü � ���ù����� ���� ������ ���ϱ�... �༮�� ���� ���������� ��ȸ���� ���� �˰� ���� �ٵ� �ƹ� �͵� �������� �ʾ�..." );  
  							self.say( "�� ������ ó������ �༮�� ������ ���̾���. ������ �� �༮�� ������� �� �̻� ������ �����ϱ�� ���������. �࿡�� �ڽ��� �ִ� �������� �׷��� ���� ���� �ʾ�. �༮�� �ϴ� ���̴� ��� �ϰ� �ֱ�� ������... �༮�� ����ü �� ��ü�� ���¸� �����ϴ� ������ �� ���ϱ�...?" );  
  							self.say( "�༮�� ���� ������� �ž�. �� �༮���Դ�, �׷��� �� ������ �����ϱ�." );  
  							end;  
  						}  
  					}  
  				}  
  			}  
  		}  
  	} self.say( "...������ ���� ���� ���� ����̱�. �� �������� ���� ���Ѵٴ� �ǰ�? ��ī��� ����μ� �ڳ׿��� ������� �����ٰ� ������ �Դµ�...." );  
  }  

  //��ī����� ���� �ٽ� �ޱ�  
  script "q3306s" {  
  	qr = target.questRecord;  
  	inven = target.inventory;  
  	wear = target.isWear( 1102136 );  
  	val1 = qr.getState( 3347 );  
  	val2 = qr.getState( 3348 );  
  	val3 = qr.getState( 3349 );  

  	if ( val1 == 2 or val2 == 2 or val3 == 2 ) self.say( "��ī���ν� ���� �� �ִ� ������ �̹� �� ���� �ʾҳ�. ���������� �� �̻� ��ī����� ���並 �������� �� �� ����." );  
  	else {  
  		if ( wear == 0 ) {  
  			a1 = self.askAccept( "�� ����� �ִ� ���� �� ���� �ڳ״� �и� ��ī��� �Ҽ��� ���ݼ����� ����ε�... �� ��ī����� ���並 �ϰ� ���� ���� �ǰ�? ��ī��� �Ҽ��̶�� ������ �ϰ� �־�� �Ѵٰ� ���ߴµ�... ��? ���並 �Ҿ���ȴٰ�...? �� �̻� ��ī��밡 �ǰ� ���� �ʴٴ� ���ΰ�? ����... �װ� �ƴ� ����̱�. �׷� ���並 �ٽ� ������ �״� ���並 ���� �ٰ�?" );  

  			if ( a1 == 0 ) self.say( "�ȴٸ� �� �� ����. ���䰡 ���ٰ� ��ī��� �Ҽ��� �ƴϰ� �Ǵ� ���� �ƴ�����... ������ �ڳ׸� ��ī���� �������� ���� ���̴� ����ϰ�." );  
  			else {  
  				qr.setState( 3306, 1 );  
  				self.say( "��ī��뿡 ó�� ���� ���� ���並 �׳� ����������, �������� ���� ���� ��Ḧ ��ƿ;� �ϳ�. ���� #b#t4000021# 10��#k�� #b#t4021006# 5��#k, �����ϴ� ������� ������ #b10000�޼�#k���. �׷� ���� ���� ��������." );  
  			}  
  		} else self.say( "��ī����� ���並 �̹� ������ �ִ°� ���� ���ο� ���䰡 �ʿ����� �ʰڱ�." );  
  	}  
  }  

  //�����̽�Ʈ�� ���� �ٽ� �ޱ�  
  script "q3305s" {  
  	qr = target.questRecord;  
  	inven = target.inventory;  
  	wear = target.isWear( 1102135 );  
  	val1 = qr.getState( 3347 );  
  	val2 = qr.getState( 3348 );  
  	val3 = qr.getState( 3349 );  

  	if ( val1 == 2 or val2 == 2 or val3 == 2 ) self.say( "�����̽�Ʈ�ν� ���� �� �ִ� ������ �̹� �� ���� �� ������... ���������� �� �̻� �����̽�Ʈ�� ���並 �������� �� �� ����." );  
  	else {  
  		if ( wear == 0 ) {  
  			a1 = self.askAccept( "����? �ڳ״� �� ���� �����̽�Ʈ �Ҽ��� �� ���ݼ��� �ƴѰ�? �׷��� �����̽�Ʈ�� ����� ���... �̷�. ���並 �Ҿ���� ����̱�. ����� �ڶ������� �����̽�Ʈ �������� �����ϴ� ������ ��. �׷��� �׷� ���� �Ҿ�����ٴ�... ������ �ִ� �հ�? �ſ� �����ϱ�. �ڳ� ���� ������Դ� �ٽ� ���並 �ְ� ���� ������... ��¿ �� ����. ���並 �ٽ� �ްڴ°�?" );  

  			if ( a1 == 0 ) self.say( "�ȴٸ� �ϴ� �� ����. �ڳ״� �� �̻� �����̽�Ʈ �Ҽ��� �ƴҼ�." );  
  			else {  
  				qr.setState( 3305 , 1 );  
  				self.say( "�� �� �� ��ȸ�� �ֵ��� ����. �����̽�Ʈ�� ���並 ����� �ʹٸ�, #b#t4000021# 10��#k�� #b#t4021003##k 5��, �����ϴ� ����� ���� ����� #b10000�޼�#k�� ��������." );  
  			}  
  		} else self.say( "��ī����� ���並 �̹� ������ �ִ°� ���� ���ο� ���䰡 �ʿ����� �ʰڱ�." );  
  	}  
  }  

  // ������ �˰� �ִ� ��  
  script "q3320s" {  
  	qr = target.questRecord;  
  	self.say( "����! �ڳ� �Ա�! �ݰ���, �ݰ���! �ڳ� ���п� ������ �ɽ����� �ʴٳ�~ ...��? �����? ���⼭ �����ϴ� ���ݼ��簡 �����İ�? ��... ���� �̸��� �˱�� �ߴµ�...  " );  
  	self.say( "������? ������... �������... �ƾ�! ������ �������� �ʴ±�. Ȥ�� �� ��� �ڳ׿��� �߿��� ����ΰ�? �����ϸ� �׳� �ؾ������... �ȵȴٰ�? �׷� ��¾�پ�... " );  
  	v0 = self.askAccept( "����! �𸣰ڴ�. �׳� �ڳװ� ���� ����!" );  
  	if ( v0 == 0 ) self.say( "��? ������? �ڳװ� �ȴٸ� �ϴ� �� ������... �׷� ���⼭ �����ϴ� ���ݼ���� �˷��� ���� ���µ�?" );  
  	else {  
  		qr.setState( 3320, 1 );  
  		registerTransferField( 926120200, "out00" );  
  	}  
  }  

  // ������ ���ݼ���, �巩  
  script "q3321s" {  
  	qr = target.questRecord;  
  	self.say( "...��°�� �̷� ���� ���� ���� ������... ���ݼ����� ������� �׸� ��ſ� ���� �ƴմϴ�. ���ݼ��簡 �ƴ� ����� ������ ��ô �����ϴٴ�����. �ϱ�... �׳�� �����̴� �� ��̾��� �������� �𸣰ڱ���...  " );  
  	self.say( "�׳డ �����İ��? �׳��... �� �Ƴ��Դϴ�. �׷��� ���� �׳��� ���� �� ������ �� ���� �Ǿ�����... �� ������ ���� ���������� �����̴�... �׳డ ��ô ȭ�� ���ڱ���. ���� ����� �׳�� �� �뼭�� �� ��������... " );  
  	self.say( "...������ ��¿ �� ������. �� ������ ��ġ�� ������ �׳��� ���� ���� �ʰڴٰ� ��������ϱ��. ��ô ���� ������... ������ ��ġ�� ��������... ������ ��ġ�� ������ #b#p2111004##k�� ���� �� �� ���� �̴ϴ�." );  
  	self.say( "�׷��� ���� #b���Ʈ#k�� ������ �׳࿡�� �������� ���߱���. �׳࿡�� ��ų��� #b���� ��#k�� ���� ������� �߾��µ�... �׳��� ���� �� �� ������ �������� �� �� ���׿�. �������̸� �׳ฦ �� �� �������... " );  
  	v0 = self.askAccept( "...�������� �̾߱Ⱑ �ʹ� ���������. �˼��մϴٸ�, ������ ��� �ؾ� �ؼ�... �׸� �� �����ǿ��� �����ֽʽÿ�." );  
  	if ( v0 == 0 ) self.say( "�����Ͻ� ���̱���..." );  
  	else {  
  		qr.setState( 3321, 1 );  
  		registerTransferField( 261020401, "" );  
  	}  
  }  

  //�����̽�Ʈ ��ȸ���� ����  
  script "q3301e" {  
  	qr = target.questRecord;  
  	inven = target.inventory;  

  	j1 = 0; j2 = 0; j3 = 0; j4 = 0; j5 = 0; j6 = 0; j7 = 0; j8 = 0; j9 = 0; j10 = 0; j11 = 0;  

  	if ( inven.itemCount( 4020000 ) >= 2 ) j1 = 1;  
  	if ( inven.itemCount( 4020001 ) >= 2 ) j2 = 1;  
  	if ( inven.itemCount( 4020002 ) >= 2 ) j3 = 1;  
  	if ( inven.itemCount( 4020003 ) >= 2 ) j4 = 1;  
  	if ( inven.itemCount( 4020004 ) >= 2 ) j5 = 1;  
  	if ( inven.itemCount( 4020005 ) >= 2 ) j6 = 1;  
  	if ( inven.itemCount( 4020006 ) >= 2 ) j7 = 1;  
  	if ( inven.itemCount( 4020007 ) >= 2 ) j8 = 1;  
  	if ( inven.itemCount( 4020008 ) >= 2 ) j9 = 1;  
  	if ( inven.itemCount( 4010004 ) >= 2 ) j10 = 1;  
  	if ( inven.itemCount( 4010006 ) >= 2 ) j11 = 1;  

  	str = "";  
  	if ( j1 == 1 ) str = str + "\r\n#L0##b #t4020000##k#l";  
  	if ( j2 == 1 ) str = str + "\r\n#L1##b #t4020001##k#l";  
  	if ( j3 == 1 ) str = str + "\r\n#L2##b #t4020002##k#l";  
  	if ( j4 == 1 ) str = str + "\r\n#L3##b #t4020003##k#l";  
  	if ( j5 == 1 ) str = str + "\r\n#L4##b #t4020004##k#l";  
  	if ( j6 == 1 ) str = str + "\r\n#L5##b #t4020005##k#l";  
  	if ( j7 == 1 ) str = str + "\r\n#L6##b #t4020006##k#l";  
  	if ( j8 == 1 ) str = str + "\r\n#L7##b #t4020007##k#l";  
  	if ( j9 == 1 ) str = str + "\r\n#L8##b #t4020008##k#l";  
  	if ( j10 == 1 ) str = str + "\r\n#L9##b #t4010004##k#l";  
  	if ( j11 == 1 ) str = str + "\r\n#L10##b #t4010006##k#l";  

  	if ( str == "" ) {  
  		self.say( "����, �񰡷� �ٸ��� ������ ������ ���� ���ݾ�? �񰡰� ������ �ŷ��� ����." );  
  		end;  
  	}  

  	ret = self.askMenu( "��ȣ... ǥ���� �����ϴ� �ŷ��� �غ� �� ����̱�. �׷��Ա��� �ؼ� �����̽�Ʈ�� �����ϰ� �ʹٴ�... ������ �� ������, �� ����. �񰡷� ������ �ְھ�?\r\n" + str );  
  	if ( ret == 0 ) {  
  		res = inven.exchange( 0, 4020000, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020000# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 1 ) {  
  		res = inven.exchange( 0, 4020001, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020001# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 2 ) {  
  		res = inven.exchange( 0, 4020002, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020002# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 3 ) {  
  		res = inven.exchange( 0, 4020003, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020003# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 4 ) {  
  		res = inven.exchange( 0, 4020004, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020004# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 5 ) {  
  		res = inven.exchange( 0, 4020005, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020005# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 6 ) {  
  		res = inven.exchange( 0, 4020006, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020006# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 7 ) {  
  		res = inven.exchange( 0, 4020007, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020007# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 8 ) {  
  	res = inven.exchange( 0, 4020008, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020008# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 9 ) {  
  		res = inven.exchange( 0, 4010004, -2 );  

  		if ( res == 0 ) self.say( "����! #t4010004# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 10 ) {  
  		res = inven.exchange( 0, 4010006, -2 );  

  		if ( res == 0 ) self.say( "����! #t4010006# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3301, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� �����̽�Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	}  
  }  

  //��ī��� ��ȸ���� ����  
  script "q3303e" {  
  	qr = target.questRecord;  
  	inven = target.inventory;  
	
  	j1 = 0; j2 = 0; j3 = 0; j4 = 0; j5 = 0; j6 = 0; j7 = 0; j8 = 0; j9 = 0; j10 = 0; j11 = 0;  

  	if ( inven.itemCount( 4020000 ) >= 2 ) j1 = 1;  
  	if ( inven.itemCount( 4020001 ) >= 2 ) j2 = 1;  
  	if ( inven.itemCount( 4020002 ) >= 2 ) j3 = 1;  
  	if ( inven.itemCount( 4020003 ) >= 2 ) j4 = 1;  
  	if ( inven.itemCount( 4020004 ) >= 2 ) j5 = 1;  
  	if ( inven.itemCount( 4020005 ) >= 2 ) j6 = 1;  
  	if ( inven.itemCount( 4020006 ) >= 2 ) j7 = 1;  
  	if ( inven.itemCount( 4020007 ) >= 2 ) j8 = 1;  
  	if ( inven.itemCount( 4020008 ) >= 2 ) j9 = 1;  
  	if ( inven.itemCount( 4010004 ) >= 2 ) j10 = 1;  
  	if ( inven.itemCount( 4010006 ) >= 2 ) j11 = 1;  

  	str = "";  
  	if ( j1 == 1 ) str = str + "\r\n#L0##b #t4020000##k#l";  
  	if ( j2 == 1 ) str = str + "\r\n#L1##b #t4020001##k#l";  
  	if ( j3 == 1 ) str = str + "\r\n#L2##b #t4020002##k#l";  
  	if ( j4 == 1 ) str = str + "\r\n#L3##b #t4020003##k#l";  
  	if ( j5 == 1 ) str = str + "\r\n#L4##b #t4020004##k#l";  
  	if ( j6 == 1 ) str = str + "\r\n#L5##b #t4020005##k#l";  
  	if ( j7 == 1 ) str = str + "\r\n#L6##b #t4020006##k#l";  
  	if ( j8 == 1 ) str = str + "\r\n#L7##b #t4020007##k#l";  
  	if ( j9 == 1 ) str = str + "\r\n#L8##b #t4020008##k#l";  
  	if ( j10 == 1 ) str = str + "\r\n#L9##b #t4010004##k#l";  
  	if ( j11 == 1 ) str = str + "\r\n#L10##b #t4010006##k#l";  

  	if ( str == "" ) {  
  		self.say( "����, �񰡷� �ٸ��� ������ ������ ���� ���ݾ�? �񰡰� ������ �ŷ��� ����." );  
  		end;  
  	}  

  	ret = self.askMenu( "��ȣ... ǥ���� �����ϴ� �ŷ��� �غ� �� ����̱�. �׷��Ա��� �ؼ� ��ī��뿡 �����ϰ� �ʹٴ�... ������ �� ������, �� ����. �񰡷� ������ �ְھ�?\r\n" + str );  
  	if ( ret == 0 ) {  
  		res = inven.exchange( 0, 4020000, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020000# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 1 ) {  
  		res = inven.exchange( 0, 4020001, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020001# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 2 ) {  
  		res = inven.exchange( 0, 4020002, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020002# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 3 ) {  
  		res = inven.exchange( 0, 4020003, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020003# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 4 ) {  
  		res = inven.exchange( 0, 4020004, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020004# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 5 ) {  
  		res = inven.exchange( 0, 4020005, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020005# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 6 ) {  
  		res = inven.exchange( 0, 4020006, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020006# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 7 ) {  
  		res = inven.exchange( 0, 4020007, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020007# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 8 ) {  
  	res = inven.exchange( 0, 4020008, -2 );  

  		if ( res == 0 ) self.say( "����! #t4020008# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī���Ʈ ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 9 ) {  
  		res = inven.exchange( 0, 4010004, -2 );  

  		if ( res == 0 ) self.say( "����! #t4010004# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	} else if ( ret == 10 ) {  
  		res = inven.exchange( 0, 4010006, -2 );  

  		if ( res == 0 ) self.say( "����! #t4010006# 2����  �غ����� �����ݾ�? �̺�. �ŷ��� �ϰ� �ʹٸ� �غ� ����� �ؾ���!" );  
  		else {  
  			qr.setState( 3303, 2 );  
  			target.questEndEffect;  
  			self.say( "�׷� ��ø� ��ٷ�. �װ� ��ī��� ��ȸ���� ������ ����ϵ��� �������, �� ������ ���� ���� �״�." );  
  		}  
  	}  
  }  

  //ȭ������  
  script "q6700e" {  
  	inven = target.inventory;  
  	qr = target.questRecord;  
  	file = "#fUI/UIWindow.img/QuestIcon/";  
  	if ( qr.getState( 6700 ) == 1 ) {  
  		ret = self.askMenu( "Eu preparei um presente para voc�. Isto ajudar� na sua viagem. Escolha as flechas que voc� deseja ter.\r\n" + file + "4/0\r\n\r\n#b#L0# #v2060000##t2060000# 6000 ea.#l\r\n#L1# #v2061000##t2061000# 6000 ea#l" );  
  		if ( ret == 0 ) {  
  			res = inven.exchange( 0, 2060000, 6000 );  
  			if ( res == 0 ) self.say( "Voc� precisa ter pelo menos 3 slots vazios em seu invent�rio de Uso." );  
  			else {  
  				qr.setState( 6700, 2 );  
  				target.questEndEffect;  
  				self.say( "Acabei de te dar 6000 itens do tipo #b#t2060000##k. Agora, melhor treinar para ser o melhor arqueiro do Mundo Maple." );  
  			}  
  		} else {  
  			res = inven.exchange( 0, 2061000, 6000 );  
  			if ( res == 0 ) self.say( "Voc� precisa ter pelo menos 3 slots vazios em seu invent�rio de Uso." );  
  			else {	  
  				qr.setState( 6700, 2 );  
  				target.questEndEffect;  
  				self.say( "Acabei de te dar 6000 itens do tipo #b#t2061000##k. Agora, melhor treinar para ser o melhor arqueiro do Mundo Maple." );		  
  			}  
  		}  
  	}  
  }  

  // �巩�� �ٶ�� ��  
  script "q3353s" {  
  	qr = target.questRecord;  
  	self.say( "ȣ��~ ģ���� ���谡 ģ��! �Դ°�? ����������? �ڳװ� �������� ���� �;��ٳ�! �ֳİ�? ��������... ���� �ڳװ� ����ô� �Ϳ� ���� �˾Ƴ°ŵ�! ��, �� ��������. �� ���� ��ο� ���ݼ����� ��� ���̾�." );  
  	v0 = self.askAccept( "�� ����� �� �ٸ� ����� ������ �˾Ƴ°ŵ�. �ڳװ� ������ �ִ� �� ���Ƽ� ������ ã�ƺ���. ������... ��, �׷� � �׿��� �׿��� ������" );  
  	if ( v0 == 0 ) self.say( "��? ������? �ڳװ� �ȴٸ� �ϴ� �� ������... �ڳװ� ���� �־� �ϴ� �� ���Ƽ� �Ϻη� �������ؼ� �˾Ƴ��µ� ������ ȣ�Ǹ� �̸��� �����ϴٴ�... ��½��½." );  
  	else {  
  		qr.setState( 3353, 1 );  
  		registerTransferField( 926120200, "out00" );  
  	}  
  }  

  // �巩�� ��  
  script "q3354s" {  
  	qr = target.questRecord;  
  	self.say( "�޿�... �� �̻� ������ ��ô�� �����ϴ�. ��ǻ� ������ ������ ���̳� �ٸ� ������. �ƹ��� �����ص� ������ ����� �� ���� ä�� �ΰ��� ��ü�� ���� �ٲٴ� ���� �Ұ����ϴ� �� �˰� �Ǿ��ŵ��... ������... ��� �� ���� �� �������ϴ�. " );  
  	self.say( "�װ� �ٸ� �ƴ�... ���� Ű�ϸ� ���� ��������. Ű�ϴ� ��õ������ ���� ���ϴ�ϴ�. ���� ���� �׷� ���̶� �����ߴµ�... ��� �װ� ������ �ΰ��� ȥ���̱⿡ ��¿ �� ���� ���̶������. �׷��� �� �ָ� ���� ���� �����߽��ϴ�. " );  
  	v0 = self.askAccept( "����.. ���� �ѵ��ϱ���. �ΰ��� ���� ����� ������ �ø��� ������ ������ ��������... ����ó�� ������ ������ ���ϴ��� �� �̻��� �ູ�� ã�� �� �������� ������ ��ϴ�... ��, �̸� ������ �������ؾ߰ڱ���. ���߹��� ���� �����ϴ� ����� �� �����ǿ��� �߹��ϰڽ��ϴ�" );  
  	if ( v0 == 0 ) self.say( "���� ������ ������ ���� ���� �ƴմϴ�. ������ ���� ������ ������ �ڸ��� ���� �ֽʽÿ�." );  
  	else {  
  		qr.setState( 3354, 1 );  
  		registerTransferField( 261020401, "" );  
  	}  
  }  

  //��й�ȣ ����  
  script "q3360s" {  
  	qr = target.questRecord;  
	
  	self.say( "��! �ڳ� �Դ°�? ��ħ �� �Գ�. �ڳ׸� ���� �� ������ �����θ� ������ �� �ְ� ���� ������Ű�� �˾Ƴ´ٳ�! ��������! �������� ������? � �����ϴٰ� ���ϰ�!" );  
  	v1 = self.askAccept( "�ھ�. Ű�� ������ ��� �����ϴ� �� ����� �α� �ٶ�ڳ�. �� ���� ���� �״� ��򰡿� ���� �ζ��. �غ� �Ǿ���?" );  

  	if ( v1 == 0 ) self.say( "���� ����. �ܿ��ڽ��� ������ ���̶� �������!" );  
  	else {  
  		str = shuffle( 1, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ" );  
  		pass2 = substring( str, 0, 10 );  
  		qr.set( 7061, pass2 );  
  		qr.set( 7062, "00" );  
  		qr.set( 3360, "0" );  
  		qr.setState( 3360, 1 );  
  		self.say( "Ű��ȣ�� #b" + pass2 + "#k�̳�. ���� �ʾҰ���? �� Ű�� ������ �Ա��� �Է��ϸ� �����θ� �����Ӱ� �̿��� �� ���� �ž�. " );  
  	}  
  }  
  /*  
  //�������� ���� �⸣��  
  script "q2147s" {  
  	inven = target.inventory;  
  	qr = target.questRecord;  

  	self.say( "�ٽ� ������ �Ǵ±�. ���鼭 #m102000000#�� ���¸� ���ҳ�? ���� �� �ڳ���Ȱ������ #o3220000#�� ����Ʈ���� ���� ��� ���� �ذ�ƴٰ� ����������, �װ� ���� �����̾���. #m102000000#�� ���� ��ó�� �������� �ξ� �Ǿ�." );  
  	self.say( "�̰��� �������� �˰ڳ�? �ٷ� �ڳװ� ���� #o3220000#�� ��񿡼� ���Ƴ� � �����̶��. �ڳװ� �� ���������� ǥ���� �������� �˰����� ��������. �� � ������� ����� Ű��ٸ� #o3220000#�� �ڶ󳪴� ���� �����ž�." );  
  	v1 = self.askAccept( "���� �����ϱ⿡�� �ڳװ� ������ ������ ������ �ڳ� ������ ���?" );  
	
  	if ( v1 == 0 ) self.say( "�ڳ׸���� ���� �����ڰ� �������� �ʴµ�... �ڳװ� ����Ѵٴ� �̰� �� �����ϱ�." );  
  	else {  
  		a1 = inven.exchange( 0, 4220020, 1 );  

  		if ( a1 == 0 ) self.say( "�ڳ� ���� �ʹ� ���Ƽ� ������ �ǳ� �� ���� ���� �� ����. ��Ÿ �κ��丮�� �� ĭ�̻� ���� �ٽ� ����." );  
  		else {  
  			qr.setState( 2147, 1 );  
  			self.say( "�� � ������ #m102000000#�� �޸��� ���� �Űܽ��� �� ���� �����θ� Ű���ְ�. ������ �ʹ� ����� �ɴ´ٰ� �ص� �ݹ� �׾������ ���ž�. � ������ �� Ű���� #m102000000#�� �ɴ� ���� Ȳ�������� �ִ� #m102000000#�� ���ؼ� ���� ���̶�� �� �ϳ�." );  
  		}  
  	}  
  }  

  script "q2147e" {  
  	inven = target.inventory;  
  	qr = target.questRecord;  
  	exp = qr.get( 7603 );  
  	lv = exp/1000;  


  	if ( itemCount( 4220020 ) <= 0 ) {  
  		self.say( "������ �Ҿ������ ����. ������ �۰� ��� ������ �Ű�Ἥ ������ �Ѵٴ°� ���� ����. ���� ���ο� ������ �� �� �� �ֵ��� ����." );  
  		a1 = inven.exchange( 0, 4220020, 1 );  

  		if ( a1 == 0 ) self.say( "�ڳ� ���� �ʹ� ���Ƽ� ������ �ǳ� �� ���� ���� �� ����. ��Ÿ �κ��丮�� �� ĭ�̻� ���� �ٽ� ����." );  
  	} else {  
  		if ( lv < 0 ) {  
  	}  
  }  
  */  

  //�ҹ��� ����_������ �Բ� ����  
  script "q2148s" {  
  	qr = target.questRecord;  

  	am1 = self.askMenu( "���� ������?\r\n#b#L0#�ͽų����� ���� ���� ���� �ֳ���?#l" );  
	
  	if ( am1 == 0 ) {  
  		am2 = self.askMenu( "�ͽų���? ��, ���� ���� ������� �� �Ŵ��� �������� ���ϴ� �ǰ�? �ƹ����� �ƹ����� � ���� �׷� ������ �־��ٴ� �̾߱⸦ ���� ���� �־��ٳ�. ������ ���� �ҹ����� �������� ���� õ�� �޷��ִµ� ȥ���� �Ƿ� �������Ŷ�� �ϴ���. ������ ���� ������ �� ���� �� ���� ���ٳ�. �׷��� ���������� �� �� ����.\r\n#b#L0#�ٸ� �ҹ��� ���� ���߳���?#l" );  

  		if ( am2 == 0 ) {  
  			self.say( "�ּ��ϰԵ� ���� �ҹ��� ���� ����� �ƴ϶��." );  
  			target.incEXP( 100, 0 );  
  			qr.setState( 2148, 1 );  
  			qr.setState( 2148, 2 );  
  			target.questEndEffect;  
  		}  
  	}  
  }  

  //�ҹ��� ����_����  
  script "q2149s" {  
  	qr = target.questRecord;  

  	am1 = self.askMenu( "...���� ������?\r\n#b#L0#�ͽų����� ���� ���� ���� �ֳ���?#l" );  

  	if ( am1 == 0 ) {  
  		am2 = self.askMenu( "�����̵��� �̾߱⸦ ���� ����̱�. �ͽų������ �׷��� ���� ���� ����. �������� �丮���� �������� ���ƴٴϸ� ������ ������, �׷� ������ �� ���� ���� ���� ����.\r\n#b#L0#�� �׷�����?...#l" );  

  		if ( am2 == 0 ) {  
  			self.say( "���� ���� ���� �����꿡�� �ǹ��� ������ �޴� ���� �þ�ٰ� �ϴµ�, ���� �Ű��� ���̴±�..." );  
  			target.incEXP( 100, 0 );  
  			qr.setState( 2149, 1 );  
  			qr.setState( 2149, 2 );  
  			target.questEndEffect;  
  		}  
  	}  
  }  

  //�ҹ��� ����_�̾�  
  script "q2150s" {  
  	qr = target.questRecord;  

  	am1 = self.askMenu( "�ȳ��ϼ��� �����ڴ� ������ ���� �Ϸ� ���̳���?\r\n#b#L0#�ͽų����� ���� �˰� �ִ�?#l" );  

  	if ( am1 == 0 ) {  
  		am2 = self.askMenu( "���! �� �ҹ��� �����Űſ���? �� ���� ��׽ý��� ī�ж� ���� �ɺθ����� �丮�¿� �Դٰ� ���ư��� �濡 �ͽ��� �ô��.\r\n#b#L0#�����̴�?#l" );  

  		if ( am2 == 0 ) {  
  			self.say( "�� �ʰ� ��׽ý��� ���ư��� ���̾��µ� ��Ҽӿ��� �����ٱ⸦ ���� �� ���Ƽ� ������ �ѷ����µ� ������Ÿ��� ���� ī�ж� ��Ƹ��� ��ó�� �Ĵٺôٰ� �ϴ��󱸿�." );  
  			self.say( "ī�ж�� �ʹ� �������� �״�� �����ϰ� ���Ҵ��. ���� ���� �ڿ� ����� �� �ڸ��� �ٽ� ���ôµ� �ƹ� �͵� �������. �ͽ��� �и��� �� ���ƿ�. ��¼��? ���� �������� ���� �ۿ� ���� ���� ���� �� ���ƿ�." );  
  			target.incEXP( 100, 0 );  
  			qr.setState( 2150, 1 );  
  			qr.setState( 2150, 2 );  
  			target.questEndEffect;  
  		}  
  	}  
  }  

  //�ҹ��� ����_�ָ� ��� �Ͼ  
  script "q2151s" {  
  	qr = target.questRecord;  

  	am1 = self.askMenu( "���� �Ϸ� ���� ã�ƿ°ǰ�?\r\n#b#L0#�ͽų����� ���� �ƽô� ���� �ֳ���?#l" );  

  	if ( am1 == 0 ) {  
  		am2 = self.askMenu( "�ͽų�����... �Ƹ��� �����Ǹ� ���ϴ� �� ����.\r\n#b#L0#�����ǰ� ������?#l" );  

  		if ( am2 == 0 ) {  
  			am3 = self.askMenu( "�丮���� ���� Ǫ�� ���̾��������� ���ݱ��� ��Ƴ��� ���� ������ ������. ������ ���� ������ ������ ���� ������ �г��ϱ� ��������. ���� �ı��ϴ� �ΰ��� ���鼭 �г��߰�, �޸��󰡴� ���� ���鼭 �г�����\r\n#b#L0#�׷��� ��� �Ǿ�����?#l" );  

  			if ( am3 == 0 ) {  
  				self.say( "�ᱹ ������ �г�� ������ ���ͷ� �ٲپ� ���� ���Ұ�, ������ ��ġ�� ��� ���� ����� ���ƸԴ� �ѳ� ������ �Ǿ������. �ʹ� ���� �˷��� ���� ����. �ڳ��� ȣ����� ����������, �״� ��� ���������� ���̾�. ���� ���� �����ϸ� �ȵȴٳ�." );  
  				target.incEXP( 100, 0 );  
  				qr.setState( 2151, 1 );  
  				qr.setState( 2151, 2 );  
  				target.questEndEffect;  
  			}  
  		}  
  	}  
  }  

  //�ҹ��� ����_��Ƽ  
  script "q2152s" {  
  	qr = target.questRecord;  

  	am1 = self.askMenu( "��Ϳ�. ����� ����?\r\n#b#L0#�ͽų����� ���� �ƽô� ���� �ֳ���?#l" );  

  	if ( am1 == 0 ) {  
  		am2 = self.askMenu( "������ �ڻ���� ������ ���� �ְ� �ֳ� ������? �۽��. ���� �ڻ���� ��Ź�� �ް� ���縦 �� �غôµ� �˾Ƴ� ���� �����. ���� ���� �丮�°��� �������뿡 �ִ� �����Ͼ��� ���� �޼ӵ��� �޸��󰡱� �����ߴٴ� ���� �˾Ƴ���. ����ӵ��� �������� ����ؾ� �� ���̿���.\r\n#b#L0#��. �ð��� ���ּż� �����մϴ�.#l" );  

  		if ( am2 == 0 ) {  
  			self.say( "���� ������ ���� ���� �� ���Ƽ� �̾��ϱ���." );  
  			target.incEXP( 200, 0 );  
  			qr.setState( 2152, 1 );  
  			qr.setState( 2152, 2 );  
  			target.questEndEffect;  
  		}  
  	}  
  }  

  //�������� �г�-�ܼ� �߰�  
  script "q3108s" {  
  	qr = target.questRecord;  

  	self.say( "(�������� �� ���� ���� ���� �ν������� �Ƹ����. �������� ������� �� ���� ���������� ������ �ƴ� �� ����. ������ ������ ���� �ڼ��� ���캸�Ҵ�.)" );  
  	self.say( "(�������� ������ �μ��� �ִ�. �������� Ŀ�ٶ� ���ڱ��� �� �� ���δ�." );  
  	target.incEXP( 200, 0 );  
  	qr.setState( 3108, 1 );  
  	qr.setState( 3108, 2 );  
  	target.questEndEffect;  
  }  

  //�������� ������  
  script "q2156e" {  
  	qr = target.questRecord;  
  	inven = target.inventory;  
  	file = "#fUI/UIWindow.img/QuestIcon/";  

  	if ( inven.itemCount( 2210006 ) >= 1 ) {  
  		self.say( "����. �̰� �ٷ� �������� ������ �����̶� �̰���? \r\n\r\n" + file + "4/0#\r\n\r\n\r\n" + file + "8/0# 7500 exp" );  
  		ret = inven.exchange( 30000, 2210006, -1 );  
		
  		if ( ret == 0 ) self.say( "��Ÿâ�� �Һ�â�� �� ĭ�� �ִ��� Ȯ���ϼ���." );  
  		else {  
  			self.setSpecialAction( "act2156" );  
  			target.incEXP( 7500, 0 );  
  			pop = target.incPOP( 3, 0 );  
  			qr.setState( 2156, 2 );  
  			target.questEndEffect;  
  			self.say( "�������� ������ ������ ������� ���� �ʾҳİ�? ������ �̰� ������ �����ٰ��� ȿ���� ���������� ���ݾ�? ���� ������ �� �� �� ���̴ϱ�, �翬�� ���� ��������! ����!" );  
  		}  
  	} else {  
  		morphID = target.getMorphState;  

  		if ( morphID == 7 ){  
  			self.say( "��, ���� �� �����? �� �����̰� �Ǿ �� �ž�?! ��? �������� ������ ������ ���ϱ� �̷��� �Ǿ��ٰ�? �׷��� ���� ������ ���������� ������ ���迡 ���� ����ϴ� ���� �־���.. �޿�. �����̴�. �� �Ծ. ����� �θ��ϱ� �׷� ���� �� �Ŷ��." );  
  			target.incEXP( 10000, 0 );  
  			pop = target.incPOP( -1, 0 );  
  			qr.setState( 2156, 2 );  
  			target.questEndEffect;  
  		}  
  		else self.say( "��... #b#t2210006##k�� ���� ������ ���� �ž�? �ؾȰ� Ǯ������ ���� #b#o2220000##k�� ��� ����ϱ�?" );  
  	}  
  }  
