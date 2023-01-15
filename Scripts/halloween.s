// halloween quest with Cody
module "standard.s";

script "halloween_" {
cTime = currentTime;
eeTime = compareTime( "06/11/01/23/59", cTime );

if ( eeTime < 0 ) self.say( "Desculpe, mas o evento de Halloween acabou. Te aviso quando um novo evento aparecer, t� certo? Te vejo por a�!" );
else {
	qr = target.questRecord;
	val = qr.get( 8820 );

	inventory = target.inventory;
	
	if (( val == "")) {
		nRet = self.askYesNo( "Travessuras ou gostosuras? O que est� acontecendo? Sou eu, Cody, e, claro, � hora de um novo evento! O Halloween tem sido uma das minhas �pocas favoritas do ano e eu tenho algo especial dispon�vel para todos aqui! S� quero que voc� me fa�a uma coisa em troca. Topa?" );
		if(nRet==0) self.say( "Ah, � mesmo? Bem, s� para voc� saber, esta cesta est� dispon�vel por tempo limitado. Pegue a sua antes que seja tarde!");
    		else{
	    	self.say( "� muito simples, na verdade. Tudo que preciso de voc� � uma por��o de #b Balas de Halloween.#k  Uma #bcentena#k, para ser exato! Agora, mergulhe no esp�rito do Halloween e pegue os doces! Estarei aqui esperando voc�!" );
		    	qr.set( 8820, "ing" );
			}
	}
			  
	else if (( val == "ing" )) {
		if (inventory.itemCount(4031203) >= 100){
		nRet1 = self.askYesNo( "Ah, nossa! Trouxe um monte de doces. �timo trabalho, colega! Agora, quer trocar seus doces pela cesta?" );
		if(nRet1!=0){
			ret = inventory.exchange(0, 1302062, 1, 4031203, -100);
			if(ret==1){
		      		qr.set( 8820, "end" );
			      	self.say( "Aqui est� a cesta! O que voc� acha? Parece legal, n�? Nunca encontrar� uma cesta de ab�bora como esta em lugar algum!" );
			    	}
			    	else self.say( "N�o acho que tenha algum slot aberto para esta Cesta de Ab�bora em seu invent�rio. Voc� precisa de, no m�nimo, um slot dispon�vel no invent�rio de equipamentos para poder receber isso!");
			  }
			  else self.say( "Ah, � mesmo? Bem, s� para voc� saber, esta cesta est� dispon�vel por tempo limitado. Pegue a sua antes que seja tarde!" );
		  }
		else self.say( "N�o acho que conseguiu #b 100 Balas de Halloween#k.  Esta cesta estar� dispon�vel por tempo limitado, ent�o continue procurando!");
	}
	
	else if(val=="end") {
		self.say( "J� te dei a cesta! S� tenho o bastante para uma pessoa. N�o seja ego�sta!" );		
		}
	}
}

script "halloweenTrick_" {

qr = target.questRecord;
val = qr.get( 8819 );
inventory = target.inventory;

cTime = currentTime;
eeTime = compareTime( "06/11/01/23/59", cTime );	

if ( eeTime < 0 ) 
	self.say( "�timo. O Halloween acabou, mas ainda n�o gosto disso nem um pouco, e agora as pessoas est�o cientes dos meus planos. Tudo bem. Por�m, minha gangue far� o m�ximo para causar no ano que vem tamb�m. Eu continuarei em cima de voc� para nos ajudar a conseguir mais  Balas de Halloween dos outros. Paz..." );

else {
	nRet1  = self.askYesNo ( "Truque ou travessura? Esta � a �poca do ano em que eu posso mostrar minha cole��o de doces! Eu os fiz com ingredientes especiais e estou oferecendo-os por tempo limitado! Eles v�m em 3 cores e, se quiser um, me d� #b 10 Balas de Halloween #k eu te darei um doce de qualquer cor, dependendo do que diz o cart�o. Tenho quatro cart�es aqui, cada um representando um doce que voc� dever� receber, e eu pegarei um na sorte. Por favor, saiba que UM destes cart�es diz \"NO CANDY FOR YOU,\"Que quer dizer que n�o ganhar� nada, ent�o cuidado com ele. E a�? Quer fazer o neg�cio?" );
	if ( nRet1 != 0 )	{	// answer : Yes		
	
		if ( inventory.itemCount( 4031203 ) < 10 )	// the candies are not enough
		self.say ( "N�o creio que tenha o suficiente, crian�a. Preciso de pelo menos 10! � claro que quer meus doces..." );
		else {
			if ( inventory.slotCount( 2 ) > inventory.holdCount( 2 ) ){
				rn1 = random( 1, 10000 );
				if (1 <= rn1 and rn1 <= 5000) {
				ret = inventory.exchange( 0, 4031203, -10 );
				self.say ( "Hoje n�o deve ser o seu dia de sorte, porque seu cart�o diz \"NO CANDY FOR YOU!\"Me desculpe, #Gquerido:querida#. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe aonde ir. Ningu�m resiste ao sabor delicioso do MEU doce!" );
				}
				if (5000 < rn1 and rn1 <= 9000)	 {
				  ret = inventory.exchange( 0, 4031203, -10, 2022105, 1 );
				  if ( ret == 0 ) self.say("Desculpe, mas n�o posso entregar-lhe meu doce se seu invent�rio estiver cheio! Confira seu invent�rio e fa�a os ajustes necess�rios.");
				  else self.say ( "Tch�tch�tch�tc�! Feliz Halloween! Espero que goste do que eu te dei. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe aonde ir. Ningu�m resiste ao grande sabor do MEU doce!");
				}
				if (9000 < rn1 and rn1 <= 9900)	 {
				  ret = inventory.exchange( 0, 4031203, -10, 2022106, 1 );
				  if ( ret == 0 ) self.say("Desculpe, mas n�o posso entregar-lhe meu doce se seu invent�rio estiver cheio! Confira seu invent�rio e fa�a os ajustes necess�rios.");
				  else self.say ( "Tch�tch�tch�tc�! Feliz Halloween! Espero que goste do que eu te dei. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe aonde ir. Ningu�m resiste ao grande sabor do MEU doce!");
				}
				if (9900 < rn1 and rn1 <= 10000) {
				  ret = inventory.exchange( 0, 4031203, -10, 2022107, 1 );
				  if ( ret == 0 ) self.say("Desculpe, mas n�o posso entregar-lhe meu doce se seu invent�rio estiver cheio! Confira seu invent�rio e fa�a os ajustes necess�rios.");
				  else self.say ( "Tch�tch�tch�tc�! Feliz Halloween! Espero que goste do que eu te dei. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe onde ir. Ningu�m resiste ao grande sabor do MEU doce!");
				}			
			} 
			else{ // there's no empty slot.
				self.say("Desculpe, mas n�o posso entregar-lhe meu doce se seu invent�rio estiver cheio! Confira seu invent�rio e fa�a os ajustes necess�rios."); 
			}
		}
	}	
	else // answer : No
		self.say ( "Ai, � mesmo? Estou disponibilizando meus doces por tempo limitado. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe aonde ir. Ningu�m resiste ao grande sabor do MEU doce!" );
	}	
	
}

script "halloweenTrick" {

 qr = target.questRecord;
 inventory = target.inventory;
 
 cTime = currentTime;
 eeTime = compareTime( "07/10/31/23/59", cTime );

 menu = self.askMenu("O que voc� quer fazer??? \r\n#b#L0#Halloween � Miss�o Cesta de Ab�bora!\r\n#L1#Halloween � Travessuras ou gostosuras?#l#k");

	if (menu == 0) {
		if ( eeTime < 0 ) self.say( "Desculpe, mas o evento de Halloween acabou. Te vejo no ano que vem, meu bem!" );
		else {		
			val = qr.get( 4960 );
			
			if (( val == "")) {
				nRet = self.askYesNo( "Travessuras ou gostosuras? Sou eu, Malady, e, por ser uma bruxa, esta � minha �poca do ano favorita! Para este Halloween, eu tenho algo dispon�vel para todo mundo! S� quero que voc� me fa�a uma coisa em troca. Est� pronto para ajudar uma velha bruxa?" );
				if(nRet==0) self.say( "Tsc, tsc... Muito mau, t�o triste... esta cesta est� dispon�vel por tempo limitado!  Pegue a sua antes que o Halloween acabe!" );
					else{
					self.say( "� muito simples, na verdade. Tudo o que preciso de voc� � uma por��o de #bDoces de Halloween.#k  Uma #bcentena#k, para ser exata! Agora, mergulhe no esp�rito do Halloween e pegue os doces! Estarei aqui esperando voc�!" );
						qr.set( 4960, "ing" );
					}
			}
					  
			else if (( val == "ing" )) {
				if (inventory.itemCount(4031203) >= 100){
				nRet1 = self.askYesNo( "Nossa! � um monte de doces! �timo trabalho, colega! Agora, quer trocar seus doces pela cesta de ab�bora?" );
				if(nRet1!=0){
					ret = inventory.exchange(0, 1302062, 1, 4031203, -100);
					if(ret==1){
							qr.set( 4960, "end" );
							self.say( "Aqui est� a cesta! Sei o que est� pensando... Parece um acess�rio fin�ssimo, daqueles que se v�em na Revista Bruxa Moderna! Tenho que concordar! Nunca encontrar� uma cesta de ab�bora como esta em lugar algum!" );
							}
							else self.say( "Eu n�o creio que tenha espa�o o bastante em seu invent�rio para esta Cesta de Ab�bora. Voc� precisa de, no m�nimo, um slot dispon�vel no invent�rio de equipamentos para poder receber isso!");
					  }
					  else self.say( "Tsc, tsc... Muito mau, t�o triste... esta cesta est� dispon�vel por tempo limitado!  Pegue a sua antes que o Halloween acabe!" );
				  }
				else self.say( "N�o acho que conseguiu #b 100 Balas de Halloween#k.  Esta cesta estar� dispon�vel por tempo limitado, ent�o continue procurando!");
			}
			
			else if(val=="end") {
				self.say( "J� te dei a cesta! S� tenho o bastante para uma pessoa. Nunca tente fazer uma bruxa de boba!" );		
				}
		}
	}

	else if (menu == 1) {

	val = qr.get( 4961 );


	if ( eeTime < 0 ) 
			self.say( "Bem, o Halloween acabou e agora as pessoas conhecem meus planos. Tudo bem tamb�m. Darei o meu melhor para jogar um feiti�o sobre voc� no ano que vem tamb�m! Continuarei em cima de voc� para me ajudar!" );

	else {
			nRet1  = self.askYesNo ( "Truque ou travessura? Esta � a �poca do ano em que eu posso mostrar minha cole��o de doces! Eu os fiz com ingredientes especiais e estou oferecendo-os por tempo limitado! Eles v�m em 3 cores e, se quiser um, me d� #b 10 Balas de Halloween #k eu te darei um doce de qualquer cor, dependendo do que diz o cart�o. Tenho quatro cart�es aqui, cada um representando um doce que voc� dever� receber, e eu pegarei um na sorte. Por favor, saiba que UM destes cart�es diz \"NO CANDY FOR YOU,\"Que quer dizer que n�o ganhar� nada, ent�o cuidado com ele. E a�? Quer fazer o neg�cio?" );
			if ( nRet1 != 0 )	{	// answer : Yes		
			
				if ( inventory.itemCount( 4031203 ) < 10 )	// the candies are not enough
				self.say ( "N�o creio que tenha o suficiente, caro colega. Preciso de pelo menos 10! � claro que quer meus doces..." );
				else {
					if ( inventory.slotCount( 2 ) > inventory.holdCount( 2 ) ){
						rn1 = random( 1, 10000 );
						if (1 <= rn1 and rn1 <= 5000) {
						ret = inventory.exchange( 0, 4031203, -10 );
						self.say ( "Hoje n�o deve ser o seu dia de sorte, porque seu cart�o diz \"NO CANDY FOR YOU!\"Me desculpe, #Gquerido:querida#. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe aonde ir. Ningu�m resiste ao grande sabor do MEU doce!" );
						}
						if (5000 < rn1 and rn1 <= 9000)	 {
						  ret = inventory.exchange( 0, 4031203, -10, 2022105, 1 );
						  if ( ret == 0 ) self.say("Desculpe, mas n�o posso entregar-lhe meu doce se seu invent�rio estiver cheio! Confira seu invent�rio e fa�a os ajustes necess�rios.");
						  else self.say ( "Tch�tch�tch�tc�! Feliz Halloween! Espero que goste do que eu te dei. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe aonde ir. Ningu�m resiste ao sabor delicioso do MEU doce!");
						}
						if (9000 < rn1 and rn1 <= 9900)	 {
						  ret = inventory.exchange( 0, 4031203, -10, 2022106, 1 );
						  if ( ret == 0 ) self.say("Desculpe, mas n�o posso entregar-lhe meu doce se seu invent�rio estiver cheio! Confira seu invent�rio e fa�a os ajustes necess�rios.");
						  else self.say ( "Tch�tch�tch�tc�! Feliz Halloween! Espero que goste do que eu te dei. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe aonde ir. Ningu�m resiste ao grande sabor do MEU doce!");
						}
						if (9900 < rn1 and rn1 <= 10000) {
						  ret = inventory.exchange( 0, 4031203, -10, 2022107, 1 );
						  if ( ret == 0 ) self.say("Desculpe, mas n�o posso entregar-lhe meu doce se seu invent�rio estiver cheio! Confira seu invent�rio e fa�a os ajustes necess�rios.");
						  else self.say ( "Tch�tch�tch�tc�! Feliz Halloween! Espero que goste do que eu te dei. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe aonde ir. Ningu�m resiste ao grande sabor do MEU doce!");
						}			
					} 
					else{ // there's no empty slot.
						self.say("Desculpe, mas n�o posso entregar-lhe meu doce se seu invent�rio estiver cheio! Confira seu invent�rio e fa�a os ajustes necess�rios."); 
					}
				}
			}	
			else // answer : No
				self.say ( "Ai, � mesmo? Estou disponibilizando meus doces por tempo limitado. Ficarei aqui s� um pouco, ent�o, se quiser trocar doces, sabe aonde ir. Ningu�m resiste ao grande sabor do MEU doce!" );
	}	
			

	}
}

script "NLC_Taxi" {

	field = self.field;
	if (field.id == 600000000 ) {	
		nRet = self.askYesNo( "Ol�! Quer fazer uma viagem ao fundo da Selva dos Mestres? Muito deste continente ainda � desconhecido e indomado... Ent�o, n�o h� muito o que ver nas vias. �timo termos conseguido este beb�... Podemos p�r o p� na estrada e em alto estilo! Agora, posso levar voc� at� a #b Floresta dos Fantasmas#k.  A velha #bMans�o Prendergast#k � ali. Algumas pessoas dizem que este lugar � mal-assombrado! O que voc� diz... Quer ir at� l�?" );
		if(nRet==0) self.say( "Mesmo? N�o te culpo... Me parece um lugar bem assustador tamb�m! Se mudar de id�ia, estarei bem aqui.");
    	else{
	    	self.say( "Certo! Aperte seu sinto de seguran�a e vamos para a Mans�o! Ser� uma viagem turbulenta!" );
		    registerTransferField ( 682000000, "st00" );
		}
	}
	else if (field.id == 682000000 ) {
		nRet = self.askYesNo( "Ol�! Espero que tenha se divertido aqui. Vamos voltar para CNF?" );
		if(nRet==0) self.say( "Ah, quer ficar aqui e dar mais uma olhada ao redor? � compreens�vel. Se quiser voltar para CNF, sabe com quem tem que falar!");
    	else{
	    	self.say( "De volta � civiliza��o! Entre e fique confort�vel a� atr�s... Voltar� � cidade num piscar de olhos!" ); 
		    registerTransferField ( 600000000, "st00" );
		}
	}	
}

script "halloween_enter" {

cTime = currentTime;
eeTime = compareTime( "07/10/31/23/59", cTime );

	if ( eeTime < 0 ) registerTransferField( 682000100, "st00" );			
	else {
		check = target.isEquipHalloweenItem;
		if ( check == 1 ) {
			qr = target.questRecord;
			pre_val = qr.getState( 4958 );
			if ( pre_val == 2 )	registerTransferField ( 682000100, "st00" );
			else {
				qr.set( 4958, "1" );				
				qr.setComplete( 4958 );
				registerTransferField ( 682000100, "st00" );
			}
		}
		else target.message( "Por alguma raz�o n�o consigo entrar na casa... H� alguma coisa bloqueando meu caminho." ); 
	}
}


function Random_Box0 {
	

	field = Field(682000700);

	field.summonMob( -1128, 305, 2101073 );
	field.summonMob( -856, 132, 2101072 );
	field.summonMob( -409, 665, 2101073 );
	field.summonMob( -844, 665, 2101072 );
	field.summonMob( -859, 486, 2101073 );
	field.summonMob( -409, 665, 2101073 );
	field.summonMob( -677, 841, 2101073 );
	field.summonMob( -217, 791, 2101072 );
	field.summonMob( -43, 910, 2101073 );
	field.summonMob( -130, 1088, 2101072 );
	field.summonMob( 327, 1086, 2101072 );
	field.summonMob( 318, 790, 2101073 );
	field.summonMob( 673, 1032, 2101072 );
	field.summonMob( 864, 547, 2101072 );
	field.summonMob( 1219, 671, 2101073 );
	field.summonMob( 1480, 432, 2101073 );
	field.summonMob( 1122, 428, 2101072 );
	field.summonMob( 1311, 131, 2101072 );
	field.summonMob( 1752, -113, 2101073 );
	field.summonMob( 1584, -291, 2101073 );

	return;

}
function Random_Box1 {

	field = Field(682000700);
	
	field.summonMob( -1128, 305, 2101072 );
	field.summonMob( -856, 132, 2101073 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -844, 665, 2101073 );
	field.summonMob( -859, 486, 2101072 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -677, 841, 2101072 );
	field.summonMob( -217, 791, 2101073 );
	field.summonMob( -43, 910, 2101072 );
	field.summonMob( -130, 1088, 2101073 );
	field.summonMob( 327, 1086, 2101073 );
	field.summonMob( 318, 790, 2101072 );
	field.summonMob( 673, 1032, 2101073 );
	field.summonMob( 864, 547, 2101073 );
	field.summonMob( 1219, 671, 2101072 );
	field.summonMob( 1480, 432, 2101072 );
	field.summonMob( 1122, 428, 2101073 );
	field.summonMob( 1311, 131, 2101073 );
	field.summonMob( 1752, -113, 2101072 );
	field.summonMob( 1584, -291, 2101072 );

	return;
}

function Random_Box2 {

	field = Field(682000700);
	
	field.summonMob( -1128, 305, 2101072 );
	field.summonMob( -856, 132, 2101073 );
	field.summonMob( -409, 665, 2101073 );
	field.summonMob( -844, 665, 2101072 );
	field.summonMob( -859, 486, 2101072 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -677, 841, 2101073 );
	field.summonMob( -217, 791, 2101072 );
	field.summonMob( -43, 910, 2101072 );
	field.summonMob( -130, 1088, 2101073 );
	field.summonMob( 327, 1086, 2101072 );
	field.summonMob( 318, 790, 2101072 );
	field.summonMob( 673, 1032, 2101072 );
	field.summonMob( 864, 547, 2101072 );
	field.summonMob( 1219, 671, 2101072 );
	field.summonMob( 1480, 432, 2101072 );
	field.summonMob( 1122, 428, 2101072 );
	field.summonMob( 1311, 131, 2101073 );
	field.summonMob( 1752, -113, 2101073 );
	field.summonMob( 1584, -291, 2101072 );

	return;
}

function Random_Box3 {

	field = Field(682000700);
	
	field.summonMob( -1128, 305, 2101073 );
	field.summonMob( -856, 132, 2101072 );
	field.summonMob( -409, 665, 2101073 );
	field.summonMob( -844, 665, 2101072 );
	field.summonMob( -859, 486, 2101073 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -677, 841, 2101072 );
	field.summonMob( -217, 791, 2101073 );
	field.summonMob( -43, 910, 2101073 );
	field.summonMob( -130, 1088, 2101072 );
	field.summonMob( 327, 1086, 2101073 );
	field.summonMob( 318, 790, 2101073 );
	field.summonMob( 673, 1032, 2101072 );
	field.summonMob( 864, 547, 2101073 );
	field.summonMob( 1219, 671, 2101072 );
	field.summonMob( 1480, 432, 2101073 );
	field.summonMob( 1122, 428, 2101072 );
	field.summonMob( 1311, 131, 2101072 );
	field.summonMob( 1752, -113, 2101073 );
	field.summonMob( 1584, -291, 2101073 );

	return;
}

function Random_Box4 {

	field = Field(682000700);
	
	field.summonMob( -1128, 305, 2101072 );
	field.summonMob( -856, 132, 2101072 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -844, 665, 2101073 );
	field.summonMob( -859, 486, 2101072 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -677, 841, 2101073 );
	field.summonMob( -217, 791, 2101072 );
	field.summonMob( -43, 910, 2101072 );
	field.summonMob( -130, 1088, 2101072 );
	field.summonMob( 327, 1086, 2101072 );
	field.summonMob( 318, 790, 2101073 );
	field.summonMob( 673, 1032, 2101073 );
	field.summonMob( 864, 547, 2101073 );
	field.summonMob( 1219, 671, 2101073 );
	field.summonMob( 1480, 432, 2101073 );
	field.summonMob( 1122, 428, 2101073 );
	field.summonMob( 1311, 131, 2101072 );
	field.summonMob( 1752, -113, 2101072 );
	field.summonMob( 1584, -291, 2101072 );

	return;
}

function Random_Box5 {

	field = Field(682000700);
	
	field.summonMob( -1128, 305, 2101073 );
	field.summonMob( -856, 132, 2101072 );
	field.summonMob( -409, 665, 2101073 );
	field.summonMob( -844, 665, 2101072 );
	field.summonMob( -859, 486, 2101073 );
	field.summonMob( -409, 665, 2101073 );
	field.summonMob( -677, 841, 2101072 );
	field.summonMob( -217, 791, 2101073 );
	field.summonMob( -43, 910, 2101073 );
	field.summonMob( -130, 1088, 2101073 );
	field.summonMob( 327, 1086, 2101072 );
	field.summonMob( 318, 790, 2101072 );
	field.summonMob( 673, 1032, 2101072 );
	field.summonMob( 864, 547, 2101072 );
	field.summonMob( 1219, 671, 2101072 );
	field.summonMob( 1480, 432, 2101072 );
	field.summonMob( 1122, 428, 2101073 );
	field.summonMob( 1311, 131, 2101073 );
	field.summonMob( 1752, -113, 2101072 );
	field.summonMob( 1584, -291, 2101073 );

	return;
}

function Random_Box6 {

	field = Field(682000700);
	
	field.summonMob( -1128, 305, 2101072 );
	field.summonMob( -856, 132, 2101072 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -844, 665, 2101072 );
	field.summonMob( -859, 486, 2101072 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -677, 841, 2101072 );
	field.summonMob( -217, 791, 2101072 );
	field.summonMob( -43, 910, 2101072 );
	field.summonMob( -130, 1088, 2101072 );
	field.summonMob( 327, 1086, 2101072 );
	field.summonMob( 318, 790, 2101072 );
	field.summonMob( 673, 1032, 2101072 );
	field.summonMob( 864, 547, 2101072 );
	field.summonMob( 1219, 671, 2101072 );
	field.summonMob( 1480, 432, 2101072 );
	field.summonMob( 1122, 428, 2101072 );
	field.summonMob( 1311, 131, 2101072 );
	field.summonMob( 1752, -113, 2101072 );
	field.summonMob( 1584, -291, 2101072 );

	return;
}

function Random_Box7 {

	field = Field(682000700);
	
	field.summonMob( -1128, 305, 2101073 );
	field.summonMob( -856, 132, 2101072 );
	field.summonMob( -409, 665, 2101073 );
	field.summonMob( -844, 665, 2101072 );
	field.summonMob( -859, 486, 2101073 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -677, 841, 2101073 );
	field.summonMob( -217, 791, 2101072 );
	field.summonMob( -43, 910, 2101073 );
	field.summonMob( -130, 1088, 2101072 );
	field.summonMob( 327, 1086, 2101072 );
	field.summonMob( 318, 790, 2101072 );
	field.summonMob( 673, 1032, 2101073 );
	field.summonMob( 864, 547, 2101072 );
	field.summonMob( 1219, 671, 2101073 );
	field.summonMob( 1480, 432, 2101072 );
	field.summonMob( 1122, 428, 2101073 );
	field.summonMob( 1311, 131, 2101072 );
	field.summonMob( 1752, -113, 2101073 );
	field.summonMob( 1584, -291, 2101072 );

	return;
}

function Random_Box8 {

	field = Field(682000700);
	
	field.summonMob( -1128, 305, 2101072 );
	field.summonMob( -856, 132, 2101073 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -844, 665, 2101073 );
	field.summonMob( -859, 486, 2101072 );
	field.summonMob( -409, 665, 2101073 );
	field.summonMob( -677, 841, 2101072 );
	field.summonMob( -217, 791, 2101073 );
	field.summonMob( -43, 910, 2101072 );
	field.summonMob( -130, 1088, 2101073 );
	field.summonMob( 327, 1086, 2101072 );
	field.summonMob( 318, 790, 2101073 );
	field.summonMob( 673, 1032, 2101072 );
	field.summonMob( 864, 547, 2101073 );
	field.summonMob( 1219, 671, 2101072 );
	field.summonMob( 1480, 432, 2101073 );
	field.summonMob( 1122, 428, 2101072 );
	field.summonMob( 1311, 131, 2101073 );
	field.summonMob( 1752, -113, 2101072 );
	field.summonMob( 1584, -291, 2101073 );

	return;
}

function Random_Box9 {

	field = Field(682000700);
	
	field.summonMob( -1128, 305, 2101072 );
	field.summonMob( -856, 132, 2101072 );
	field.summonMob( -409, 665, 2101073 );
	field.summonMob( -844, 665, 2101073 );
	field.summonMob( -859, 486, 2101072 );
	field.summonMob( -409, 665, 2101072 );
	field.summonMob( -677, 841, 2101072 );
	field.summonMob( -217, 791, 2101072 );
	field.summonMob( -43, 910, 2101072 );
	field.summonMob( -130, 1088, 2101073 );
	field.summonMob( 327, 1086, 2101072 );
	field.summonMob( 318, 790, 2101073 );
	field.summonMob( 673, 1032, 2101072 );
	field.summonMob( 864, 547, 2101073 );
	field.summonMob( 1219, 671, 2101073 );
	field.summonMob( 1480, 432, 2101073 );
	field.summonMob( 1122, 428, 2101072 );
	field.summonMob( 1311, 131, 2101073 );
	field.summonMob( 1752, -113, 2101073 );
	field.summonMob( 1584, -291, 2101072 );

	return;
}

script "Halloween_Box" {	
	
	cTime = currentTime;
	eeTime = compareTime( "07/10/31/23/59", cTime );

	if ( eeTime < 0 ) rn = 10;
	else {
	field = Field(682000700);
		
	rn = random(0,9);
		
	if (rn == 0)  	Random_Box0;
		
	else if (rn == 1)	Random_Box1;
	
	else if (rn == 2) 	Random_Box2;
	
	else if (rn == 3) 	Random_Box3;
	
	else if (rn == 4) 	Random_Box4;
	
	else if (rn == 5) 	Random_Box5;
	
	else if (rn == 6) 	Random_Box6;
	
	else if (rn == 7) 	Random_Box7;
	
	else if (rn == 8) 	Random_Box8;
	
	else if (rn == 9) 	Random_Box9;
	}
}
script "Tomb_Hall" {	
	self.say ( "Precisando de dire��o, retornar� se n�o tiver sucesso. Cavaleiro Sem Cabe�a" );
}


script "halloween_Omni6" {	
		
	qr = target.questRecord;
	pre_val = qr.getState( 4944 );	
	inven = target.inventory;
					
	if ( pre_val == 2 ) {
		if ( inven.itemCount ( 4031771 ) > 0 ) 	 registerTransferField ( 682000200, "rmD02" );
		else target.message( "Parece estar trancado." );
	}
	else target.message( "Parece estar trancado." );
}

script "halloween_Omni1" {	
	
	qr = target.questRecord;
	pre_val = qr.getState( 4944 );	
	inven = target.inventory;
					
	if ( pre_val == 2 ) {
		if ( inven.itemCount ( 4031771 ) > 0 ) 	 registerTransferField ( 682000200, "st00" );
		else target.message( "Parece estar trancado." );
	}
	else target.message( "Parece estar trancado." );
}

script "halloween_Omni9" {	
	
	qr = target.questRecord;
	pre_val = qr.getState( 4944 );	
	inven = target.inventory;
					
	if ( pre_val == 2 ) {
		if ( inven.itemCount ( 4031771 ) > 0 ) 	  registerTransferField ( 682000200, "rmW00" );
		else target.message( "Parece estar trancado." );
	}
	else target.message( "Parece estar trancado." );
}

script "halloween_Omni81" {	
	
	qr = target.questRecord;
	pre_val = qr.getState( 4944 );	
	inven = target.inventory;
					
	if ( pre_val == 2 ) {
		if ( inven.itemCount ( 4031771 ) > 0 ) 	 registerTransferField ( 682000200, "rmL00" );
		else target.message( "Parece estar trancado." );
	}	
	else target.message( "Parece estar trancado." );
}

script "halloween_Omni82" {	
	
	qr = target.questRecord;
	pre_val = qr.getState( 4944 );	
	inven = target.inventory;
					
	if ( pre_val == 2 ) {
		if ( inven.itemCount ( 4031771 ) > 0 ) 	 registerTransferField ( 682000200, "rmL01" );
		else target.message( "Parece estar trancado." );
	}
	else target.message( "Parece estar trancado." );
}

script "halloween_Omni83" {	
	
	qr = target.questRecord;
	pre_val = qr.getState( 4944 );	
	inven = target.inventory;
					
	if ( pre_val == 2 ) {
		if ( inven.itemCount ( 4031771 ) > 0 ) 	 registerTransferField ( 682000200, "rmL02" );
		else target.message( "Parece estar trancado." );
	}
	else target.message( "Parece estar trancado." );
}


script "halloween_Lud" {	
	qr = target.questRecord;
	pre_val = qr.getState( 4946 );	
	val = qr.getState( 4947 );	
	inven = target.inventory;
					
	if ( pre_val == 2 ) {
		if ( val == 1 ) {
			if ( inven.itemCount ( 4031767 ) < 1  )  {
				self.say( "Percebo que n�o tem cuidado com presentes. Sorte sua, eu achei. Fa�a o poss�vel para n�o perder novamente.");
				ret = inven.exchange(0, 4031767, 1);
				if ( ret == 1) self.say( "Pegue isso e n�o suje meu ch�o de novo!" );
				else self.say("Desculpe, mas estou tendo problemas em colocar itens no seu invent�rio. Por favor, confirme comigo mais tarde.");
			}
			else self.say( "Mal posso esperar. O baile vai ser t�o emocionante! Espero que os rapazes se comportem...");
		}
		else self.say( "Mal posso esperar. O baile vai ser t�o emocionante! Espero que os rapazes se comportem...");
	}
	else self.say( "Se deixou algo no ch�o, agora j� era. N�o suporto ch�o sujo!");
}
