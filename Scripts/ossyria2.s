module "standard.s"; 

// The Magic Rock @ Orbis 
script "ossyria3_1" { 
	inven = target.inventory; 

	if ( inven.itemCount( 4001019 ) >= 1 ) { 
		ret1 = self.askYesNo( "Voc� pode usar #b#t4001019##k para ativar #b#p2012014##k. Voc� vai se teletransportar para onde est� #b#p2012015##k?" ); 
		if ( ret1 != 0 ) { 
			ret2 = inven.exchange( 0, 4001019, -1 ); 
			if ( ret2 == 0 ) self.say( "Imposs�vel ativar #b#p2012014##k porque voc� n�o tem #b#t4001019##k." ); 
			else registerTransferField( 200082100, "sp" ); 
		} 
	} 
	else self.say( "Existe um #b#p2012014##k que permite que voc� se teletransporte para onde est� #b#p2012015##k, mas voc� n�o pode ativ�-lo sem o pergaminho." ); 
} 

// The Magic Rock @ El Nath 
script "ossyria3_2" { 
	inven = target.inventory; 

	if ( inven.itemCount( 4001019 ) >= 1 ) { 
		ret1 = self.askYesNo( "Voc� pode usar #b#t4001019##k para ativar #b#p2012015##k. Voc� vai se teletransportar para onde est� #b#p2012014##k?" ); 
		if ( ret1 != 0 ) { 
			ret2 = inven.exchange( 0, 4001019, -1 ); 
			if ( ret2 == 0 ) self.say( "Imposs�vel ativar #b#p2012015##k porque voc� n�o tem #b#t4001019##k." ); 
			else registerTransferField( 200080200, "sp" ); 
		} 
	} 
	else self.say( "Existe um #b#p2012015##k que permite que voc� se teletransporte para onde est� #b#p2012014##k, mas voc� n�o pode ativ�-lo sem o pergaminho." ); 
} 

// Guild 
script "guild_proc"  
{ 
	isGuildMaster = target.isGuildMaster; 
	//isPartyBoss = target.isPartyBoss; 
	isGuildMember = target.isGuildMember; 
	if ( isGuildMember == 0 )  
	{ 
		self.say( "Ei... Por acaso voc� se interessa por CL�s?"); 

		v1 = self.askMenu( "#b#L0#O que � um cl�?#l\r\n#L1#O que eu fa�o para criar um cl�??#l\r\n#L2# Eu quero criar um cl�#l" ); 
		if ( v1 == 0 )  
		{ 
			self.say( "Um cl� �... bem, voc� pode pensar nele como um pequeno grupo cheio de pessoas com interesses e objetivos parecidos. Al�m disto, ele ser� cadastrado no nosso Quartel-General de Cl�s para ser validado." ); 
		} 
		else if ( v1 == 1 ) 
		{ 
			self.say( "Para fazer seu pr�prio cl�, voc� vai precisar estar, pelo menos, no n�vel 10. Voc� tamb�m vai precisar ter pelo menos 1.500.000 mesos com voc�. Este � o pre�o para registrar seu cl�." ); 
			self.say( "Para fazer um cl�, voc� vai precisar de 6 pessoas no total. Esses 6 devem estar no mesmo grupo e o l�der deve vir falar comigo. Fique ciente tamb�m de que o l�der do grupo tamb�m se torna o Mestre do Cl�. Uma vez designado o Mestre do Cl�, a posi��o permanece a mesma at� que o Cl� seja desfeito." ); 
  		self.say( "Uma vez que 6 pessoas estejam reunidas, voc� vai precisar de 1.500.000 mesos. Esse � o pre�o para registrar seu cl�." ); 
			self.say( "Certo, para registrar seu cl�, traga pessoas aqui~ Voc� n�o pode criar um sem todos os 6.\r\nAh, � claro, os 6 n�o podem fazer parte de outro cl�!"); 
		} 
		else if ( v1 == 2 ) 
		{ 
			nRet1 = self.askYesNo( "Certo, agora, voc� quer criar um cl�?" ); 

			if ( nRet1 == 1 )	{ 
			
				retPos = target.hasRequestedTransferWorld; 
			
				if ( retPos == 0 )	{ // 0 : okay (����) 
						nRet2 = target.isCreateGuildPossible( 1500000 ); 
						if ( nRet2 == 0 ) 
						{ 
							self.say( "Informe o nome de seu cl� e ele ser� criado. O Cl� tamb�m ser� cadastrado oficialmente no nosso Quartel-General de Cl�s. Por isto, boa sorte para voc� e seu cl�!" ); 
							fRet = target.createNewGuild( -1500000 ); 
						} 
						else if ( nRet2 == 1 ) self.say( "Humm... Eu n�o acho que voc� possua as qualifica��es para ser um Mestre do Cl�. Por favor, treine mais para se tornar Mestre do Cl�." ); 
						else if ( nRet2 == 2 ) self.say( "Eu n�o me importo com o qu�o forte voc� acha que seja... Para formar um cl�, voc� precisa estar em um grupo de 6. Crie um grupo e ent�o traga todos os membros aqui se realmente quiser criar um cl�." ); 
						else if ( nRet2 == 3 ) self.say( "Voc� n�o � o l�der de um grupo." ); 
						else if ( nRet2 == 4 ) self.say( "Parece que voc� n�o tem membros suficientes no seu grupo ou alguns dos membros n�o est�o presentes. Preciso de todos os 6 membros aqui para cadastrar seu cl�. Se seu grupo n�o consegue coordenar esta simples tarefa, voc� devia pensar duas vezes antes de formar um cl�." ); 
						else if ( nRet2 == 5 ) self.say( "Parece que h� um traidor entre n�s. Algu�m em seu grupo j� faz parte de outro cl�. Para formar um cl�, todos do seu grupo precisam estar sem cl�. Volte quando tiver resolvido o problema com o traidor." ); 
						else if ( nRet2 == 6 )  
						{ 
							self.say( "Voc� tem mesos ou pessoas suficientes para formar um cl�?... Por favor, verifique novamente e volte aqui." ); 
							self.say( "Verifique novamente. Voc� precisa pagar o custo do servi�o para criar um cl� e cadastr�-lo." ); 
						} 
				} 
				//1 : no (�Ұ���) 
				else self.say( "Desculpe, mas voc� n�o pode criar um cl�." ); 
				
			} 
			
			
		} 
	} 
	else 
	{ 
		v1 = self.askMenu( "Ent�o, como posso ajudar?\r\n#b#L0#I Eu quero aumentar meu cl�#l\r\n#L1#IEu quero desfazer meu cl�#l" ); 

		if ( isGuildMaster ) 
		{ 
			if ( v1 == 0 ) 
			{ 
				nCountMax = target.getGuildCountMax; 

				if ( nCountMax > 95 ) self.say( "Seu cl� parece ter crescido um pouco. Eu n�o posso mais aumentar seu cl�." );  
				else 
				{ 
					self.say( "Voc� est� aqui para aumentar seu cl�? Seu cl� deve ter crescido um pouco~ Para aumentar seu cl�, ele precisa ser recadastrado no nosso Quartel-General de Cl�s e isto vai exigir um pagamento pelo servi�o..." ); 
					if ( nCountMax <= 10 ) nRequiredMeso = 50; 
					else if ( nCountMax <= 15 ) nRequiredMeso = 150; 
					else if ( nCountMax <= 20 ) nRequiredMeso = 250; 
					else if ( nCountMax <= 25 ) nRequiredMeso = 350; 
					else if ( nCountMax <= 30 ) nRequiredMeso = 450; 
					else if ( nCountMax <= 35 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 40 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 45 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 50 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 55 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 60 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 65 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 70 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 75 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 80 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 85 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 90 ) nRequiredMeso = 500; 
					else if ( nCountMax <= 95 ) nRequiredMeso = 500; 

					nRet = self.askYesNo( "O custo do servi�o ser� apenas #r" + nRequiredMeso + "0000 mesos#k Voc� gostaria de aumentar seu cl�?" ); 
				
					if ( nRet == 1 ) 
					{ 
						fRet = target.incGuildCountMax( 5, -nRequiredMeso * 10000 ); 
						if ( fRet == 0 )  
						{ 
							self.say( "Voc� tem mesos ou pessoas suficientes para formar um cl�?... Por favor, verifique novamente e volte aqui." ); 
							self.say( "Verifique novamente. Voc� vai precisar pagar o custo do servi�o para aumentar e recadastrar seu cl�..." ); 
						} 
					} 
				} 
			} 
			else if ( v1 == 1 ) 
			{			 
				nRet = self.askYesNo( "Tem certeza de que deseja desfazer seu cl�? S�rio... lembre-se, se voc� desfizer o cl�, ele ser� eliminado para sempre. Ah, e mais uma coisa. Se voc� quiser desfazer seu cl�, vai precisar pagar 200.000 mesos pelo custo do servi�o. Ainda quer fazer isto?" ); 
				if ( nRet == 0 ) self.say( "Bem pensado. Eu n�o gostaria de desfazer meu cl� que j� est� t�o forte..." ); 
				else 
				{ 
					fRet = target.removeGuild(-200000); 
					if ( fRet == 0 ) self.say( "Ei, voc� n�o tem o dinheiro para o servi�o... tem certeza de que tem dinheiro suficiente a�?" ); 
				} 
			} 
		} 
		else self.say( "Ei, voc� n�o � o Mestre do Cl�!! Esta decis�o s� pode ser tomada pelo Mestre do Cl�." ); 
	} 
} 

script "guild_mark" 
{ 
	if ( target.isGuildMaster ) { 
		v1 = self.askMenu( "Oi? Meu nome � #bLea#k. Estou respons�vel pelo #bEmblema do Cl�#k.\r\n#b#L0#Eu gostaria de cadastrar o emblema de um cl�.#l\r\n#L1#Eu gostaria de excluir o emblema de um cl�.#l" ); 
		if ( v1 == 0 ) { 
			if ( target.isGuildMarkExist ) self.say( "O Emblema do Cl� j� foi feito. Por favor, exclua o emblema do cl� primeiro para refaz�-lo." ); 
			else { 
				nRet = self.askYesNo( "Voc� precisa de #r5.000.000 de Mesos#k para criar um emblema de cl�. Para explicar melhor, o emblema de um cl� � um modelo �nico para cada cl�. Ele ir� aparecer ao lado do nome do cl� no jogo.\nEnt�o, voc� vai criar um emblema de cl�?" ); 
				if ( nRet == 1 ) 
				{ 
					if ( target.nMoney >= 5000000 ) target.setGuildMark( -5000000 ); 
					else self.say ( "Voc� n�o tem Mesos suficientes. Voc� precisa de #b5.000.000 de Mesos#." ); 
				} 
				else self.say( "Oh... ok... O emblema deixaria o cl� mais unido. Voc� precisa de mais tempo para preparar o emblema do cl�? Por favor, volte quando quiser."); 
			} 
		} 
		else if ( v1 == 1 ) { 
			if ( target.isGuildMarkExist ) { 
				nRet = self.askYesNo( "Se voc� excluir o atual emblema do cl�, poder� criar um novo. Voc� precisa de #r1.000.000 de Mesos#k para excluir um emblema de cl�. Voc� gostaria de excluir?" ); 
				if ( nRet == 1 ) 
				{ 
					if ( target.nMoney >= 1000000 ) target.removeGuildMark( -1000000 ); 
					else self.say ( "Voc� n�o tem Mesos suficientes para excluir o emblema do cl�. Voc� precisa de #b1.000.000 de Mesos#k para excluir o emblema do cl�." ); 
				} 
				else self.say( "Por favor, volte quando quiser."); 
			} 
			else self.say( "H�? Estranho... voc� n�o tem um emblema de cl� para excluir." ); 
		} 
	} 
	else self.say( "Oh... Voc� n�o � o mestre do cl�. O Emblema do Cl� pode ser feito, exclu�do ou modificado apenas pelo #rMestre do Cl�#k." ); 
} 
