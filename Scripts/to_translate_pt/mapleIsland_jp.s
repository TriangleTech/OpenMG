 module "standard.s"; 
	
 // sera(NPC  2100) 
 script "begin_jp1" { 
  
   qr = target.questRecord; 
   val = qr.getState(8141 ); 
   field = self.field; 
  
  
  
   if ( field.id == 0 ){ 
      
    nRet = self.askYesNo("#GBem-vindo:Bem-vinda# ao mundo de MapleStory. O objetivo deste campo de treinamento � ajudar os aprendizes. Voc� gostaria de entrar no campo de treinamento? Algumas pessoas come�am suas jornadas sem passar pelo programa de treinamento. Mas eu recomendo que voc� fa�a o programa de treinamento antes de tudo."); 
    if( nRet != 0){ 
       self.say("Certo, ent�o, eu vou deixar voc� entrar no programa de treinamento. Por favor, siga as instru��es do seu instrutor."); 
       registerTransferField( 1, "" );   
       qr.set( 8141, "enter" ); 
      
       } 
    else { 
     
       nRet2 = self.askYesNo("Voc� deseja mesmo j� dar in�cio � sua jornada?"); 
      
         if(nRet2 != 0){ 
         self.say("Parece que voc� deseja come�ar sua jornada sem passar pelo programa de treinamento. Por isso, vou deixar voc� seguir para o p�tio de treinamento. Tenha cuidado~"); 
         registerTransferField( 40000, "" ); 
         } 
        
         else self.say("Por favor, fale comigo depois que tomar sua decis�o."); 
      }   
   } 
  
   else if( field.id == 1 ){ 
     self.say("Esta � a sala das imagens, onde seu primeiro programa de treinamento come�a. Nessa sala, voc� ir� visualizar a carreira de sua escolha."); 
     self.say("Depois que tiver treinado bastante, voc� ter� permiss�o para escolher uma carreira. Voc� pode se tornar um Arqueiro em Henesys, um Bruxo em Ellinia, um Guerreiro em Perion e um Gatuno em Kerning..."); 
   } 
  
 } 


 // peter(NPC 9101001) 
 script "begin_jp2" { 
 	if ( target.nJob != 0 ) { 
 		self.say( "Essa � uma �rea de miss�es para aprendizes. Voc� n�o deveria estar aqui, n�o �?" ); 
 		registerTransferField( 104000000, "" ); 
 	} 
 	else { 
	  
 	qr = target.questRecord; 
 	val = qr.get(8141 ); 
		
 		if(val == "enter"){ 
 		self.say( "Voc� j� completou todos os seus treinamentos. Bom trabalho. Me parece que voc� est� #Gpronto:pronta# para come�ar sua jornada! Voc� pode ir ao pr�ximo local." ); 
 		self.say( "Mas lembre-se, depois que chegar l�, voc� estar� em uma vila cheia de monstros. � isso, adeus!" ); 
 		target.incEXP( 3, 0 ); 
 		registerTransferField( 40000, "" ); 
 		} 
 	} 
 } 

 // heena 2101 
 script "begin_jp3" { 
     nRet = self.askYesNo("Voc� j� terminou seu treinamento? Se quiser, eu posso tirar voc� desse campo de treinamento." ); 
		
 		if(nRet !=0) { 
 		self.say("Ent�o, eu vou te mandar para fora daqui. Bom trabalho."); 
 		registerTransferField( 3, "st00" ); 
     } 
    
     else self.say("Voc� ainda n�o terminou o seu programa de treinamento? Se voc� quiser sair deste lugar, por favor, n�o hesite em me contar."); 
 } 
  




