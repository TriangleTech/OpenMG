module "standard.s"; 


script "fighter" { 
	qr = target.questRecord; 
	val = qr.get( 7500 ); 
	cJob = target.nJob;
	inventory = target.inventory; 

	if ( val == "s" and ( cJob == 110 or cJob == 120 or cJob == 130 ) ) { 
		qr.set( 7500, "p1"); 
		self.say( "I was waiting for you. Few days ago, I heard about you from #bTylus#k in Ossyria. Well... I'd like to test your strength. There is a secret passage near the ant tunnel. Nobody but you can go into that passage. If you go into the passage, you will meet my the other self. Beat him and bring #b#t4031059##k to me."); 
		self.say( "My the other self is quite strong. He uses many special skills and you should fight with him 1 on 1. However, people cannot stay long in the secret passage, so it is important to beat him ASAP. Well... Good luck! I will look forward to you bringing #b#t4031059##k to me.");
	} 
	else if ( val == "p1" ) { 
		if ( inventory.itemCount( 4031059 ) >= 1 ) { 
			self.say( "Wow... You beat my the other self and brought #b#t4031059##k to me. Good! This surely proves your strength. In terms of strength, you are ready to advance to 3rd job. As I promised, I will give #b#t4031057##k to you. Give this necklace to #bTylus#k in Ossyria and you will be able to take the second test of 3rd job advancement. Good luck~" ); 
			ret = inventory.exchange( 0, 4031059, -1, 4031057, 1 ); 
			if ( ret == 0 ) self.say( "hmmm... weird. Are you sure that you have #b#t4031059##k? If you do have it, make sure you have empty slot in item tab." ); 
			else qr.set( 7500, "p2"); 
		} 
		else self.say( "There is a secret passage near the ant tunnel. Nobody but you can go into that passage. If you go into the passage, you will meet my the other self. Beat him and bring #b#t4031059##k to me." ); 
	} 
	else if ( val == "p2" ) { 
		if ( inventory.itemCount( 4031057 ) <= 0 ) { 
			self.say( "Ahh! You lost #b#t4031057##k, huh? I said you should be careful... For God's sake, I'll give you another one... AGAIN. Please be careful this time. Without this, you will not be able to take the second test of 3rd job advancement.");
			ret = inventory.exchange( 0, 4031057, 1 ); 
			if (ret == 0) self.say("hmmm... weird. Make sure you have empty slot in item tab.");
		} 
		else self.say( "Give this necklace to #bTylus#k in Ossyria and you will be able to take the second test of 3rd job advancement. Good luck~" ); 
	} 
	else { 
		if ( target.nJob == 100 ) { 
			if ( target.nLevel >= 30 ) { 
				if ( inventory.itemCount( 4031008 ) >= 1 ) self.say( "Haven't found the person yet? Look for #b#p1072000##k who is located next to #b#m102020300##k near #m102000000#. Give him the letter and maybe he'll tell you what you need to do." ); 
				else if ( inventory.itemCount( 4031012 ) >= 1 ) { 
						self.say( "Ahh! You came back without a scratch! I knew you'd pull it off... I admit you're a strong and formidable Warrior... OK, now I'll make you an even stronger Warrior than you already are... BUT, before that, you'll have to choose one of the three paths that will be offered to you... it won't be easy, so if you have any questions, let me know!" ); 
						v1 = self.askMenu( "Okay, when you are ready to make your decision, click [I'm ready to select my class!] at the bottom.\r\n#b#L0#Explain to me the role of the Fighter.#k#l\r\n#b#L1#Explain to me the role of the Page.#k#l\r\n#b#L2#Explain to me the role of the Spearman.#k#l\r\n#b#L3#I'm ready to select my class!#k#l" ); 
					if ( v1 == 0 ) { 
							self.say( "Let me explain the role of the Fighter. They are the most common type of Warrior. The weapons used are the #bsword#k and the #baxe#k, as there are advanced skills that can be acquired later. Do not use both weapons at the same time. Just stick with the one you like the most..." ); 
							self.say( "In addition, there are also skills like #b#q1101006##k and #b#q1101007##k available for fighters. #b#q1101006##k is a skill that increases the weapon attack for you and your party. With it, you'll be able to take down your enemies with a sudden burst of power, which makes it very useful. The downside is that your weapon defense will be slightly reduced." ); 
							self.say( "#b#q1101007##k is a skill that allows you to return a portion of the physical damage done by the enemy. The more damage you take, the more damage you also deal to the enemy. This will help those who prefer close range combat. What do you think? Doesn't it sound cool to be a Fighter?" ); 
					} 
					else if ( v1 == 1 ) { 
							self.say( "Let me explain the role of the Page. The Page is an apprentice knight taking their first steps. They often use #bswords#k and/or #bmaces#k. It's not a good idea to use both weapons, so you're better off picking one and sticking with it." ); 
							self.say( "In addition, there are also skills like #b#q1201006##k and #b#q1101007##k for you to learn. #b#q1201006##k makes any opponent around you lose some attack and defense for a certain amount of time. It is very useful against powerful monsters with a high physical attack. It's also quite useful when partying with others." ); 
							self.say( "#b#q1101007##k is a skill that allows you to return a certain amount of damage done by monsters for a certain time. The more damage you take, the more damage you also deal to the enemy. It's the perfect skill for Warriors who are specializing in melee combat. What do you think? Doesn't it sound cool to be a Page?" ); 
					} 
					else if ( v1 == 2 ) { 
							self.say( "Let me explain the role of the Spearman. It is a class that specializes in the use of long weapons, such as #bspears#k and #bpolearms#k. There are many useful skills to be gained with both weapons, but I recommend picking one and sticking with it." ); 
							self.say( "In addition, there are also skills like #b#q1301006##k and #b#q1301007##k for you to learn. #b#q1301006##k increases the weapon and magic defense for you and your party for a certain amount of time. It's a very useful skill for Spearmen with weapons that require both hands and can't defend at the same time." ); 
							self.say( "#b#q1301007##k is a skill that temporarily increases the HP and MP for you and your party. You will be able to give a maximum increase of up to 160%, so the skill will help you and your party, especially when you are going after really powerful opponents. What do you think? Doesn't it sounds cool to be a Spearman?" ); 
					} 
					else if ( v1 == 3 ) { 
							v2 = self.askMenu( "Hummm, j� se decidiu? Escolha o 2� n�vel na classe de sua prefer�ncia.\r\n#b#L0#Soldado#k#l\r\n#b#L1#Escudeiro#k#l\r\n#b#L2#Lanceiro#k#l" ); 
							if ( v2 == 0 ) { 
								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bSoldado#k? Depois que tomar sua decis�o, voc� n�o poder� voltar atr�s e escolher outra carreira... ainda quer isso?" ); 
								if ( mJob == 0 ) self.say( "Mesmo? Ent�o voc� precisa pensar um pouco mais. N�o h� pressa... n�o � algo que se deva fazer de qualquer jeito... me informe quando tomar sua decis�o, certo?" ); 
								else if ( mJob == 1 ) { 
									nPSP = ( target.nLevel - 30 ) * 3; 
									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #bSP#k demais... voc� n�o pode subir para o 2� n�velde classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
									else { 
										ret = inventory.exchange( 0, 4031012, -1 ); 
										if ( ret == 0 ) self.say( "Humm... Tem certeza de que possui #b#t4031012##k do #p1072000#? N�o posso permitir subir um n�vel de classe sem isso." ); 
									//job adv. - warrior 
									else { 
										target.nJob = 110; 
										target.incSP( 1, 0 ); 
										incval = random( 300, 350 ); 
										target.incMHP( incval, 0 );     
										inventory.incSlotCount( 2, 4 ); 
										inventory.incSlotCount( 4, 4 ); 

											self.say( "Certo! Voc� agora se tornou um #bSoldado#k! Um soldado luta para ser o mais forte entre os fortes e nunca p�ra de lutar. Nunca perca sua vontade de lutar e sempre se esforce. Vou ajudar voc� a se tornar mais forte do que j� �." ); 
											self.say( "Eu te entreguei um livro que cont�m a lista de habilidades que voc� pode adquirir como Soldado. Nesse livro, voc� vai encontrar v�rias habilidades que o Soldado pode aprender. Seus invent�rios de Uso e Etc. tamb�m foram expandidos com uma nova fileira de slots dispon�veis. Seu MP m�ximo tamb�m cresceu... pode conferir." ); 
											self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
											self.say( "Os soldados t�m de ser fortes. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante." ); 
									} 
								} 
							}	 
						} 
						else if ( v2 == 1 ) { 
							mJob = self.askYesNo( "Ent�o voc� quer fazer o 2� n�vel de classe como #bEscudeiro#k? Lembre que, quando tomar sua decis�o, voc� n�o poder� mais mudar de classe. Tem certeza de que quer fazer isso?" ); 
							if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
							else if ( mJob == 1 ) { 
								nPSP = ( target.nLevel - 30 ) * 3; 
								if ( target.nSP > nPSP ) self.say( "Hummm, acho que voc� tem #bSP#k demais. Voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
								else { 
									ret = inventory.exchange( 0, 4031012, -1 ); 
									if ( ret == 0 ) self.say( "Hummm, tem certeza de que possui #b#t4031012##k do #p1072000#? � melhor ter certeza, pois n�o posso permitir subir um n�vel de classe sem isso." ); 
									// Job Adv = Page 
									else { 
										target.nJob = 120; 
										target.incSP( 1, 0 ); 
										incval = random( 100, 150 ); 
										target.incMMP( incval, 0 );     
										inventory.incSlotCount( 2, 4 ); 
										inventory.incSlotCount( 4, 4 ); 

											self.say( "Certo! Voc� agora se tornou um #bEscudeiro#k! Os Escudeiros t�m a intelig�ncia e a bravura de um Guerreiro... espero que voc� siga o caminho certo com a mentalidade certa... vou ajudar voc� a se tornar mais forte do que j� �." ); 
											self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Escudeiro. Nesse livro, voc� encontrar� v�rias habilidades que o Escudeiro poder� aprender. Seus invent�rios de Uso e Etc. tamb�m foram expandidos com uma nova fileira de slots dispon�veis. Seu MP m�ximo tamb�m aumentou... pode conferir." ); 
											self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
											self.say( "Os Escudeiros t�m de ser fortes. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante." ); 
									} 
								} 
							}	 
						} 
						else if ( v2 == 2 ) { 
								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bLanceiro#k? Quando tomar sua decis�o, voc� n�o poder� fazer avan�os em nenhuma outra classe. Tem certeza disso?" ); 
								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor sobre isso? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
							else if ( mJob == 1 ) { 
								nPSP = ( target.nLevel - 30 ) * 3; 
									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #bSP#k demais... voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde." ); 
								else { 
									ret = inventory.exchange( 0, 4031012, -1 ); 
										if ( ret == 0 ) self.say( "Hummm... tem certeza de que possui #b#t4031012##k do #p1072000#? � melhor ter certeza. Voc� n�o poder� subir para o pr�ximo n�vel de classe sem isso." ); 
									// Job Adv = spearman 
									else { 
										target.nJob = 130; 
										target.incSP( 1, 0 ); 
										incval = random( 100, 150 ); 
										target.incMMP( incval, 0 );      
										inventory.incSlotCount( 2, 4 ); 
										inventory.incSlotCount( 4, 4 ); 

											self.say( "Certo! Voc� agora se tornou um #bLanceiro#k! O Lanceiro usa o poder da escurid�o para derrubar os inimigos, sempre nas sombras... acredite em si mesmo e em seu incr�vel poder durante a sua jornada... vou ajudar voc� a se tornar mais forte do que j� �." ); 
											self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Lanceiro. Nesse livro, voc� encontrar� v�rias habilidades que o Lanceiro poder� aprender. Seus invent�rios de Uso e Etc. tamb�m foram expandidos com uma nova fileira de slots dispon�veis. Seu MP m�ximo tamb�m cresceu... pode conferir." ); 
											self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
											self.say( "Um Lanceiro precisa ser forte. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante. Estarei esperando voc�." ); 
									} 
								} 
							}	 
						} 
					} 
				} 
				else { 
						nSec = self.askYesNo( "Wow, you've really grown up! You're not small and weak anymore... Now I can see your Warrior bearing! Impressive... so what do you think? Do you want to become stronger than you already are? Just do a simple test! Accepted?" ); 
						if ( nSec == 0 ) self.say( "Really? Getting stronger quickly will help you a lot during your journey... If you change your mind in the future, you can come back here whenever you want. Remember that I will make you much more powerful than you already are." ); 
						else if ( nSec == 1 ) { 
							self.say( "Good thinking. You are strong, don't get me wrong, but there is still a need to test your strength and see if your power is real. The test isn't too hard, you'll do just fine... Here, take this letter. Don't lose it." ); 
							ret = inventory.exchange( 0, 4031008, 1 ); 
								if ( ret == 0 ) self.say( "Hmm... I can't give you the letter because you don't have enough space in your Etc inventory. Come back after you've cleared a space or two in your inventory, as you can only take the test with the letter." ); 
								else self.say( "Deliver this letter to #b#p1072000##k who may be close to #b#m102020300##k near #m102000000#. He's replacing me as instructor as I've been busy around here. Give him the letter and he will administer the test on my behalf. More information will be passed directly by him to you. Best of luck to you." ); 
					} 
				} 
			} 
			else { 
				v = self.askMenu( "Oh, you have a question? \r\n#b#L0#What are the general characteristics of a Warrior?#l\r\n#L1#What are the weapons of a Warrior?#l\r\n#L2#What are the armor of a Warrior?#l\r\n#L3#What skills are available for a Warrior?#l" ); 
				if ( v == 0 ) { 
						self.say( "Let me explain the role of the Warrior. Warriors possess incredible physical strength and power. They also know how to defend themselves against monster attacks, so they are the best to fight in close combat with monsters. With a high level of stamina, you won't die easily." ); 
						self.say( "However, to attack the monsters accurately, you'll need a good dose of DEX, so don't just focus on improving your STR. If you want to grow quickly, I recommend you face stronger monsters." ); 
				} 
				else if ( v == 1 ) { 
						self.say( "Let me explain the weapons a Warrior uses. The use weapons that allow them to slash, stab and attack. You will not be able to use weapons such as bows and projectile weapons. Much less small staves." ); 
						self.say( "The most common weapons are swords, maces, polearms, spears, axes, and so on... Every weapon has its advantages and disadvantages, so examine them well before choosing one of them. For now, try to use the ones with a high attack level." ); 
				} 
				else if ( v == 2 ) { 
						self.say( "Let me explain the armor a Warrior wears. Warriors are strong and have a lot of stamina, so they can wear heavy and resistant armor. They aren't very pretty... but they serve their purpose well: Being the best armor." ); 
						self.say( "Shields, in particular, are perfect for Warriors. Keep in mind, however, that you cannot use a shield if you are wielding a two-handed weapon. I know it will be a tough decision..." ); 
				} 
				else if ( v == 3 ) { 
						self.say( "The abilities available to Warriors are aimed at their incredible physical strength and power. The ones that improve melee combat are the ones that will help you the most. There is also a skill that allows you to recover your HP. You better become an expert on it." ); 
						self.say( "The two attack skills available are #b#q1001004##k and #b#q1001005##k. #q1001004# is the one that deals huge damage to a single enemy. You will be able to hone this skill right from the start." ); 
						self.say( "On the other hand, #q1001005# doesn't do much damage, but attacks multiple enemies in an area at once. You can use it only when you have already upgraded #q1001004# once. You decide." ); 
				} 
			} 
		} 
		else if ( target.nJob == 0 ) { 
			self.say( "Do you want to become a Warrior? You need to meet certain criteria for this. #bYou must be at least level 10, with at least 35 STR#k. We will see..." ); 
			if ( target.nLevel > 9 and target.nSTR > 34 ) { 
				nRet = self.askYesNo( "You definitely have the potential to be a Warrior. You may not be there yet, but I can already see a Warrior in you. What do you think? Do you want to become a Warrior?" ); 
				if ( nRet == 0 ) self.say( "Really? Need more time to think it through? Make yourself at home... it's not something you should do lightly anyway. Come talk to me when you make your decision." ); 
				else if ( nRet == 1 ) { 
					self.say( "From now on, you are a Warrior! Keep pushing... I'm going to improve your skills a little bit, in the hope that you'll keep training to be stronger than you already are. Zaaaaaaz!!" );
					target.nJob = 100; 
					incval = random( 200, 250 ); 
					target.incMHP( incval, 0 );
					target.incSP( 1, 0 ); 
					inventory.incSlotCount( 1, 4 ); 
					inventory.incSlotCount( 2, 4 ); 
					inventory.incSlotCount( 3, 4 ); 
					inventory.incSlotCount( 4, 4 ); 
					self.say( "You are much stronger now. Also, all your inventories have extra slots. A whole row, to be exact. You can check. I just gave you some #bSP#k. When you open the #bskills window#k in the lower right corner of the screen, you will see the skills you can learn using SP. One caveat: You won't be able to increase them all at once. There are also those that will become available only after you learn some skills first." ); 
					self.say( "One more warning. After choosing your class, try to stay alive as long as you can. If you die, you will lose experience points. You don't want to lose your hard-earned experience points, do you? That's all I can teach you... From now on, you'll have to try harder and harder to become better and better. Come see me when you realize you're feeling more empowered than you are now." ); 
					self.say( "Oh, and... If you have any questions about being a Warrior, just come and ask me. I don't know EVERYTHING, but I will help you with everything I know. Until then..." );
				}
			}
			else self.say( "I don't think you have what it takes to be a Warrior yet. You need to train a lot to become one or you won't be able to handle the situation. Become much stronger and then come find me." ); 
		} 
		else if ( target.nJob == 110 ) self.say( "Ahhh! It's you! What do you think? How is the life of a Fighter? You... look a lot stronger than before! I hope you keep getting stronger." ); 
		else if ( target.nJob == 120 ) self.say( "Ahhh... it's you! What do you think? How is the life of a Page? I know you are still an apprentice, but soon your training will end and you will be knighted!" ); 
		else if ( target.nJob == 130 ) self.say( "Ahhh... it's you! What do you think? How is the life of a Spearman? Keep training with dedication, because one day you will become an unparalleled knight..." ); 
		else if ( target.nJob == 111 ) self.say( "Ahhh... You finally became a #bCrusader#k... I knew you wouldn't let me down. So what do you think of life as a Crusader? Please dedicate yourself and train even more." ); 
		else if ( target.nJob == 121 ) self.say( "Ahhh... You finally became a #bKnight#k... I knew you wouldn't let me down. So what do you think of life as a Knight? Please dedicate yourself and train even more." ); 
		else if ( target.nJob == 131 ) self.say( "Ahhh... You finally became a #bDragon Knight#k... I knew you wouldn't let me down. So what do you think of life as a Dragon Knight? Please dedicate yourself and train even more." ); 
		else self.say( "What a magnificent physique! What incredible power! Warriors are the best!!!! What do you think? Do you want to rank up as a warrior??" ); 
	} 
} 

script "magician" { 
	qr = target.questRecord; 
	val = qr.get( 7500 ); 
	cJob = target.nJob; 
	inventory = target.inventory; 

	if ( val == "s" and ( cJob == 210 or cJob == 220 or cJob == 230 ) ) { 
		qr.set( 7500, "p1"); 
		self.say( "Estava esperando voc�. Alguns dias atr�s, #bRobeira#k de Ossyria me falou de voc�. Bem... Eu gostaria de testar sua for�a. Existe uma passagem secreta perto da floresta de Ellinia. S� voc� poder� atravess�-la. Quando estiver l� dentro, voc� encontrar� meu outro eu. Derrote-o e traga o #b#t4031059##k para mim." ); 
		self.say( "Meu outro eu � bastante forte. Ele usa muitas habilidades especiais e voc� dever� travar uma luta corpo a corpo com ele. Entretanto, n�o � poss�vel permanecer muito tempo na passagem secreta. � essencial que voc� o derrote o mais r�pido poss�vel. Bem... Boa sorte! Fico aguardando voc� trazer o #b#t4031059##k para mim." ); 
	} 
	else if ( val == "p1" ) { 
		if ( inventory.itemCount( 4031059 ) >= 1 ) { 
			self.say( "Uau... Voc� derrotou meu outro eu e trouxe o #b#t4031059##k para mim. Muito bom! Isso certamente prova sua for�a. Em termos de for�a, voc� est� #Gpronto:pronta# para o 3� n�vel de classe. Conforme prometido, darei #b#t4031057##k a voc�. Entregue este colar a #bRobeira#k de Ossyria e poder� fazer um segundo teste para o 3� n�vel de classe. Boa sorte~." ); 
			ret = inventory.exchange( 0, 4031059, -1, 4031057, 1 ); 
			if ( ret == 0 ) self.say( "Hum... que estranho. Tem certeza de que est� com o #b#t4031059##k? Se estiver, certifique-se de que possui um slot vazio na guia de itens." ); 
			else qr.set( 7500, "p2"); 
		} 
		else self.say( "Existe uma passagem secreta perto da floresta de Ellinia. S� voc� poder� atravess�-la. Quando estiver l� dentro, voc� encontrar� meu outro eu. Derrote-o e traga o #b#t4031059##k para mim. Meu outro eu � bastante forte. Ele usa muitas habilidades especiais e voc� dever� travar uma luta corpo a corpo com ele. Entretanto, n�o � poss�vel permanecer muito tempo na passagem secreta. � essencial que voc� o derrote o mais r�pido poss�vel. Bem... Boa sorte! Fico aguardando voc� trazer o #b#t4031059##k para mim." ); 
	} 
	else if ( val == "p2" ) { 
		if ( inventory.itemCount( 4031057 ) <= 0 ) { 
			self.say( "Ahh... voc� perdeu #b#t4031057##k, hein? Eu disse que deveria tomar cuidado... Pelo amor de Deus, vou te dar outro... DE NOVO. Por favor, tenha cuidado desta vez. Sem isto, voc� n�o poder� fazer o teste para o 3� n�vel de classe." ); 
			ret = inventory.exchange( 0, 4031057, 1 ); 
			if ( ret == 0 ) self.say( "Hum... que estranho. Certifique-se de que possui um slot vazio na guia de itens." ); 
		} 
		else self.say( "Entregue este colar a #bRobeira#k de Ossyria e poder� fazer um segundo teste para o 3� n�vel de classe. Boa sorte~!" ); 
	} 
	else { 
		if ( target.nJob == 200 ) { 
			if ( target.nLevel >= 30 ) { 
				if ( inventory.itemCount( 4031009 ) >= 1 ) self.say( "Ainda n�o o viu? V� encontrar o #b#p1072001##k que est� perto de #b#m101020000##k pr�ximo a #m101000000#... entregue-lhe esta carta e ele vai te dizer o que voc� ter� que fazer..." ); 
				else if ( inventory.itemCount( 4031012 ) >= 1 ) { 
						self.say( "Voc� voltou inteiro. Muito bem. Eu sabia que voc� passaria nos testes com facilidade... certo, agora vou tornar voc� ainda mais forte. Mas antes disso... voc� ter� de escolher um dos tr�s caminhos que te ser�o oferecidos. N�o vai ser uma decis�o f�cil, mas... se tiver alguma pergunta, manda ver." ); 
						v1 = self.askMenu( "Certo, quando tomar sua decis�o, clique em [Quero escolher minha classe!] na parte inferior...\r\n#b#L0#Explique-me as caracter�sticas do Feiticeiro do Fogo e Veneno.#k#l\r\n#b#L1#Explique-me as caracter�sticas do Feiticeiro do Gelo e Luz.#k#l\r\n#b#L2#Explique-me as caracter�sticas do Cl�rigo.#k#l\r\n#b#L3#Quero escolher minha classe!#k#l" ); 
					if ( v1 == 0 ) { 
							self.say( "Permita-me explicar sobre o Feiticeiro do Fogo e Veneno. Ele se especializa em m�gicas de fogo e veneno. habilidades como #b#q2101001##k, que permite que a sua magia e a de todo o seu grupo seja melhorada por um certo tempo, e #b#q2100000##k, que concede a voc� uma certa probabilidade de absorver um pouco do MP do inimigo, s�o essenciais para os Bruxos encarregados do ataque." ); 
							self.say( "Vou explicar a voc� um ataque m�gico chamado #b#q2101004##k. Ele dispara flechas em chamas contra os inimigos, o que torna esse ataque a mais poderosa habilidade dispon�vel entre as habilidades de 2� n�vel. Ele funcionar� melhor contra os inimigos que s�o imunes a fogo no geral, pois o dano ser� bem maior. Por outro lado, se utiliz�-lo contra inimigos que s�o resistentes a fogo, o dano ser� reduzido pela metade. N�o se esque�a disso." ); 
							self.say( "Vou explicar a voc� um ataque m�gico chamado #b#q2101005##k. Ele dispara bolhas venenosas contra os inimigos, e assim eles ficam envenenados. Depois disso, o HP do inimigo se reduzir� cada vez mais com o passar do tempo. Se a m�gica n�o funcionar muito bem ou se o monstro tiver HP elevado, poder� ser uma boa id�ia disparar quantas vezes for necess�rio para mat�-lo com uma overdose de veneno..." ); 
					} 
					else if ( v1 == 1 ) { 
							self.say( "Permita-me explicar sobre o Feiticeiro do Gelo e Luz. Ele se especializa em m�gicas de gelo e Luz. habilidades como #b#q2101001##k, que permite que a sua magia e a de todo o seu grupo seja melhorada por um certo tempo, e #b#q2100000##k, que concede a voc� uma certa probabilidade de absorver um pouco do MP do inimigo, s�o essenciais para os Bruxos encarregados do ataque." ); 
							self.say( "Vou explicar a voc� um ataque m�gico chamado #b#q2201004##k. Ele dispara estilha�os de gelo contra os inimigos e, embora n�o seja t�o poderoso quanto #q2101004#, aqueles que forem atingidos pelo ataque ficar�o congelados por um breve per�odo de tempo. O dano ser� muito maior se o inimigo for imune a gelo. O oposto tamb�m vale, ou seja, se o inimigo estiver acostumado com gelo, o dano n�o ser� t�o grande. N�o se esque�a disso." ); 
							self.say( "Vou explicar a voc� um ataque m�gico chamado #b#q2201005##k. � a �nica habilidade de 2� n�vel para Bruxos que pode ser considerado um Feiti�o Completo e afeta v�rios monstros de uma vez. Pode n�o causar muito dano, mas a vantagem � causar dano a v�rios monstros ao seu redor. Entretanto, voc� pode atacar somente seis monstros de uma vez. Mesmo assim, � um ataque incr�vel." ); 
					} 
					else if ( v1 == 2 ) { 
							self.say( "Permita-me explicar sobre o Cl�rigo. Os Cl�rigos usam m�gicas religiosas contra os monstros atrav�s de rezas e encantamentos. habilidades como #b#q2301004##k, que aprimora temporariamente a defesa de arma, a defesa de magia, precis�o e esquiva, e #b#q2301003##k, que reduz uma certa quantidade do dano com arma, ajudam os Bruxos a compensarem suas fraquezas..." ); 
							self.say( "O Cl�rigo � o �nico Feiticeiro capaz de realizar magias de recupera��o. Os Cl�rigos s�o os �nicos capazes de realizar magias de recupera��o. Ela � chamada de #b#q2301002##k e, quanto maior for o valor de MP, INT e o n�vel desta habilidade, mais HP voc� ir� recuperar. Ela tamb�m afeta os membros do seu grupo que est�o pr�ximos a voc�, portanto, � uma habilidade bastante �til, permitindo que voc� continue ca�ando sem a ajuda de uma po��o." ); 
							self.say( "Os Cl�rigos tamb�m possuem um ataque m�gico chamado #b#q2301005##k. � um feiti�o que permite que o Cl�rigo dispare flechas fantasmas contra monstros. O efeito n�o � muito grande, mas pode causar um dano enorme em zumbis e outros monstros malignos. Esses monstros s�o totalmente imunes a ataques sagrados. O que voc� acha? N�o � interessante?" ); 
					} 
					else if ( v1 == 3 ) { 
							v2 = self.askMenu( "Bom, j� se decidiu? Escolha a classe para a sua 2� mudan�a de classe.\r\n#b#L0#O Feiticeiro do Fogo e Veneno#k#l\r\n#b#L1#O Feiticeiro do Gelo e Luz#k#l\r\n#b#L2#Cl�rigo#k#l" ); 
						if ( v2 == 0 ) { 
								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bFeiticeiro do Fogo e Veneno#k? Depois de tomar sua decis�o, voc� n�o poder� voltar atr�s e mudar sua classe. Est� certo sobre sua decis�o?" ); 
								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o..." ); 
							else if ( mJob == 1 ) { 
								nPSP = ( target.nLevel - 30 ) * 3; 
									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #bSP#k demais... voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde..." ); 
								else { 
									ret = inventory.exchange( 0, 4031012, -1 ); 
										if ( ret == 0 ) self.say( "Hummm... tem certeza de que possui #b#t4031012##k do #p1072001#? � melhor ter certeza... pois voc� n�o pode subir para o 2� n�vel de classe sem isso..." ); 
									else { 
										target.nJob = 210; 
										target.incSP( 1, 0 ); 
										incval = random( 450, 500 ); 
										target.incMMP( incval, 0 ); 
										inventory.incSlotCount( 4, 4 ); 

										self.say( "A partir de agora, voc� se tornou um #bFeiticeiro do Fogo e Veneno#k... Os Feiticeiros usam sua elevada intelig�ncia e a for�a da natureza ao nosso redor para derrubar os inimigos... continue com os seus estudos, pois um dia eu o tornarei muito mais poderoso com o meu pr�prio poder..." ); 
										self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Feiticeiro do Fogo e Veneno...Tamb�m expandi seu invent�rio de Etc., acrescentando uma fileira inteira, e seu MP m�ximo... pode conferir." ); 
										self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
										self.say( "Os Feiticeiros t�m de ser fortes. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante..." ); 
									} 
								} 
							}	 
						} 
						else if ( v2 == 1 ) { 
								mJob = self.askYesNo( "Ent�o voc� quer fazer o 2� avan�o de carreira como #bFeiticeiro do Gelo e Luz#k? Depois de tomar sua decis�o, voc� n�o poder� voltar atr�s e mudar sua carreira... est� certo sobre sua decis�o?" ); 
								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o, certo?" ); 
							else if ( mJob == 1 ) { 
								nPSP = ( target.nLevel - 30 ) * 3; 
									if ( target.nSP > nPSP ) self.say( "Hummm, voc� tem #bSP#k demais. Voc� n�o pode subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde..." ); 
								else { 
									ret = inventory.exchange( 0, 4031012, -1 ); 
										if ( ret == 0 ) self.say( "Tem certeza de que possui a #b#t4031012##k do #p1072001#? � melhor ter certeza, pois n�o posso permitir que voc� suba de n�vel de classe sem isso..." ); 
									else { 
										target.nJob = 220; 
										target.incSP( 1, 0 ); 
										incval = random( 450, 500 ); 
										target.incMMP( incval, 0 ); 
										inventory.incSlotCount( 4, 4 ); 

										self.say( "Certo, agora voc� se tornou um #bFeiticeiro do Gelo e Luz#k... Os Feiticeiros usam sua elevada intelig�ncia e a for�a da natureza ao nosso redor para derrubar os inimigos... continue com os seus estudos, pois um dia eu vou te tornar muito mais #Gpoderoso:poderosa# com o meu pr�prio poder..." ); 
										self.say( "Entreguei-lhe um livro que cont�m a lista de habilidades que voc� pode adquirir como Feiticeiro do Gelo e Luz...Tamb�m expandi seu invent�rio de Etc. acrescentando uma nova fileira. Seu MP m�ximo tamb�m aumentou. Pode conferir." ); 
										self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
										self.say( "Os Feiticeiros t�m de ser fortes. Mas lembre que voc� n�o pode abusar desse poder e us�-lo contra um ser mais fraco. Use seu grande poder da maneira certa, pois... us�-lo da maneira certa � muito mais dif�cil que s� ficar mais forte. Procure-me depois que j� tiver avan�ado bastante. Estarei esperando voc�..." ); 
									} 
								} 
							}	 
						} 
						else if ( v2 == 2 ) { 
								mJob = self.askYesNo( "Ent�o voc� quer subir para o 2� n�vel de classe como #bCl�rigo#k? Depois que tomar sua decis�o, voc� n�o poder� voltar atr�s e escolher outra classe... tem certeza disso?" ); 
								if ( mJob == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o..." ); 
							else if ( mJob == 1 ) { 
								nPSP = ( target.nLevel - 30 ) * 3; 
									if ( target.nSP > nPSP ) self.say( "Hummm... voc� tem #bSP#k demais. Voc� n�o poder� subir para o 2� n�vel de classe com tanto SP guardado. Use mais SP nas habilidades do 1� n�vel e volte mais tarde..." ); 
								else { 
									ret = inventory.exchange( 0, 4031012, -1 ); 
										if ( ret == 0 ) self.say( "Tem certeza de que possui a #b#t4031012##k do #p1072001#? � melhor ter certeza... pois voc� n�o pode subir para o n�vel de classe sem isso..." ); 
									else { 
										target.nJob = 230; 
										target.incSP( 1, 0 ); 
										incval = random( 450, 500 ); 
										target.incMMP( incval, 0 ); 
										inventory.incSlotCount( 4, 4 ); 
										self.say( "Certo, voc� ser� um #bCl�rigo#k a partir de agora. Os Cl�rigos sopram vida em cada organismo com uma f� inabal�vel em Deus. Nunca deixe de aprimorar sua f�... um dia, eu vou te ajudar a se tornar muito mais #Gpoderoso:poderosa#..." ); 
										self.say( "Eu te entreguei um livro que cont�m a lista de habilidades que voc� pode adquirir como Cl�rigo...Tamb�m expandi uma fileira do seu invent�rio de Etc. e seu MP m�ximo... pode conferir..." ); 
										self.say( "Tamb�m te dei um pouco de #bSP#k. Abra o #bMenu de habilidades#k localizado no canto inferior esquerdo. Voc� poder� aprimorar as habilidades de 2� n�vel rec�m-adquiridas. Um aviso: N�o � poss�vel aprimor�-las todas de uma vez. Algumas delas ficar�o dispon�veis somente ap�s voc� aprender outras habilidades. N�o se esque�a disso." ); 
										self.say( "O Cl�rigo precisa de f� mais do que qualquer outra coisa. Mantenha sua f� em Deus e trate todos os indiv�duos com o respeito e a dignidade que eles merecem. Continue se esfor�ando e um dia voc� ter� ainda mais poder m�gico e religioso... certo... me procure depois de ter feito mais peregrina��es. Estarei esperando voc�..." ); 
									} 
								} 
							}	 
						} 
					} 
				} 
				else { 
					nSec = self.askYesNo( "Hummm... voc� cresceu bastante desde a �ltima vez. Voc� est� bastante diferente, mais #Galto:alta# e forte... agora consigo notar seu porte de Bruxo... ent�o... o que voc� acha? Deseja se tornar mais forte do que j� �? � s� fazer um simples teste... quer tentar?" ); 
					if ( nSec == 0 ) self.say( "Mesmo? Tornar-se mais forte rapidamente te ajudar� muito durante sua jornada... se mudar de id�ia no futuro, poder� voltar aqui quando quiser. Lembre que eu tornarei voc� muito mais #Gpoderoso:poderosa# do que j� �..." ); 
					else if ( nSec == 1 ) { 
						self.say( "Bom... voc� parece ser forte, � verdade, mas preciso ver se seu poder � real. O teste n�o ser� dif�cil e acho que voc� � capaz de passar por ele. Aqui, pegue esta carta. N�o a perca." ); 
						ret = inventory.exchange( 0, 4031009, 1 ); 
							if ( ret == 0 ) self.say( "Creio que voc� n�o tenha espa�o no seu invent�rio para receber minha carta. Libere espa�o no seu invent�rio de Etc. e volte a falar comigo. Afinal, voc� poder� fazer o teste somente com a carta." ); 
							else self.say( "Leve esta carta ao #b#p1072001##k que est� perto de #b#m101020000##k pr�ximo a #m101000000#. Ele est� me substituindo como instrutor... Entregue-lhe a carta e ele aplicar� o teste em meu lugar. Ele lhe dar� todas as informa��es necess�rias. Boa sorte para voc�..." ); 
					} 
				} 
			} 
			else { 
					v = self.askMenu( "Alguma pergunta sobre como ser um Bruxo?\r\n#b#L0#Quais s�o as caracter�sticas b�sicas de um Bruxo?#l\r\n#L1#Quais s�o as armas de um Bruxo?#l\r\n#L2#Quais s�o as armaduras de um Bruxo?#l\r\n#L3#Quais s�o as habilidades dispon�veis para um Bruxo?#l" ); 
				if ( v == 0 ) { 
						self.say( "Vou te falar mais sobre ser um Bruxo. Os Bruxos usam bem altos n�veis de magia e intelig�ncia. Eles podem usar o poder da natureza ao nosso redor para matar inimigos, mas s�o muito fracos em combates corpo a corpo. Seu vigor tamb�m n�o � elevado, portanto, tome cuidado e evite ser #Gmorto:morta# de qualquer maneira." ); 
						self.say( "O fato de voc� ser capaz de atacar monstros a dist�ncia o ajudar� bastante. Tente aprimorar o n�vel de INT se quiser atacar seus inimigos com magias precisas. Quanto maior for sua intelig�ncia, melhor voc� ser� em lidar com a sua magia..." ); 
				} 
				else if ( v == 1 ) { 
						self.say( "Vou te falar mais sobre as armas de um Bruxo. Na verdade, n�o significa muito para um Bruxo atacar seus oponentes com armas. Os Bruxos n�o t�m for�a e destreza, ent�o voc� poder� ter dificuldade para derrotar at� mesmo uma lesma." ); 
						self.say( "J� os poderes m�gicos s�o uma OUTRA hist�ria. Os Bruxos usam ma�as, cajados e varinhas. As ma�as s�o boas para, bem, ataques de for�a, mas... eu n�o recomendaria isso para um Bruxo, ponto final." ); 
						self.say( "Na verdade, cajados e varinhas s�o as armas preferenciais. Elas possuem poderes m�gicos especiais e, por isso, melhoram o desempenho do Bruxo. � uma boa id�ia carregar uma arma com muito poder m�gico..." ); 
				} 
				else if ( v == 2 ) { 
						self.say( "Vou te falar mais sobre as armaduras de um Bruxo. Honestamente, os Bruxos n�o possuem muitas armaduras, j� que t�m pouca for�a f�sica e pouco vigor. Suas habilidades de defesa tamb�m n�o s�o boas, ent�o n�o sei se vai ajudar em alguma coisa..." ); 
						self.say( "Algumas armaduras, entretanto, t�m a habilidade de eliminar poder m�gico, ent�o podem proteger voc� contra ataques m�gicos. Elas n�o v�o ajudar muito, mas ainda � melhor do que n�o usar nada... ent�o, n�o deixe de compr�-las se der tempo..." ); 
				} 
				else if ( v == 3 ) { 
						self.say( "As habilidades dispon�veis para os Bruxos usam os altos n�veis de intelig�ncia e magia que os Bruxos possuem. Tamb�m est�o dispon�veis Prote��o Arcana e Armadura Arcana, que evitam a morte de Bruxos com pouco vigor." ); 
						self.say( "As habilidades de ataque s�o #b#q2001004##k e #b#q2001005##k. Primeiramente, #q2001004# � uma habilidade que causa muito dano no oponente com um uso m�nimo de MP." ); 
						self.say( "#q2001005#, por sua vez, usa muito MP para atacar o oponente DUAS VEZES. Mas voc� pode usar #q2001004# somente quando essa habilidade tiver mais que uma melhoria. N�o se esque�a disso. Voc� decide o que fazer..." ); 
				} 
			} 
		} 
		else if ( target.nJob == 0 ) { 
				self.say( "Voc� deseja ser um Bruxo? Voc� precisa cumprir alguns requisitos para isso. Voc� deve estar pelo menos no #bN�vel 8, com INT 20#k. Vamos ver se voc� tem o necess�rio para se tornar um Bruxo..." ); 
			if ( target.nLevel > 7 and target.nINT > 19 ) { 
					nRet = self.askYesNo( "Voc� definitivamente tem o aspecto de um Bruxo. Pode n�o ter chegado l� ainda, mas j� consigo ver um Bruxo em voc�... o que voc� acha? Voc� deseja se tornar um Bruxo?" ); 
					if ( nRet == 0 ) self.say( "Mesmo? Precisa pensar melhor, n�? N�o se apresse, n�o se apresse. N�o � algo que se deva fazer de qualquer jeito... venha falar comigo quando tomar sua decis�o..." ); 
				else if ( nRet == 1 ) { 
						inven = target.inventory; 
					if ( inven.slotCount( 1 ) > inven.holdCount( 1 ) ) { 
						self.say( "Certo, agora voc� � um Bruxo, j� que eu, #p1032001#, o l�der dos Bruxos, estou te autorizando. N�o � muito, mas vou te dar um pouco do que tenho..." ); 
						ret = inven.exchange( 0, 1372043, 1 ); 
						if ( ret == 0 ) self.say( "Humm... Verifique se existe um slot vazio na sua janela de Equip. Gostaria de te dar uma arma para voc� treinar como recompensa por seu primeiro n�vel de classe." ); 
						else { 
					target.nJob = 200; 
					incval = random( 100, 150 ); 
					target.incMMP( incval, 0 ); 
					target.incSP( 1, 0 ); 
					self.say( "Voc� acabou de se equipar com muito mais poder m�gico. Continue treinando e se torne cada dia melhor... vou observar voc� de vez em quando..." ); 
					self.say( "Eu apenas te dei um pouco de #bSP#k. Quando voc� abrir o #bmenu de habilidades#k no canto inferior esquerdo da tela, voc� ver� as habilidades que poder� aprender usando SP. Um aviso: Voc� n�o poder� aument�-las todas de uma vez. Existem tamb�m aquelas que ficar�o dispon�veis somente ap�s voc� aprender algumas habilidades primeiro." ); 
					self.say( "Mais um aviso. Depois que escolher sua carreira, tente continuar vivo pelo maior tempo que conseguir. Se voc� morrer, perder� todo o seu n�vel de experi�ncia. Voc� n�o quer perder seus pontos de experi�ncia ganhos com tanto sacrif�cio, n�o �?" ); 
					self.say( "OK! Isso � tudo que posso te ensinar. V� aos lugares, treine e se torne ainda melhor. Procure-me quando achar que j� fez tudo o que podia e precisar de algo interessante. Estarei esperando voc� aqui..." ); 
					self.say( "Ah, e... se tiver alguma d�vida sobre ser um Bruxo, � s� perguntar. Eu n�o sei TUDO, para falar a verdade, mas vou ajudar voc� com tudo o que sei. At� l�..." ); 
					} 
					} else self.say( "Humm... Verifique se existe um slot vazio no seu invent�rio de EQUIP, pois gostaria de te dar uma arma para voc� treinar como recompensa por seu primeiro n�vel de classe." ); 
				}						 
			} 
			else self.say( "Voc� precisa treinar mais para ser um Bruxo. Por isso, voc� tem de se esfor�ar para se tornar mais #Gpoderoso:poderosa# do que j� �. Volte quando estiver mais forte." ); 
		} 
			else if ( target.nJob == 210 ) self.say( "Ahhh... � voc�... o que voc� acha da vida como Feiticeiro? Voc�... parece bem � vontade com essas flechas em chamas agora... por favor, dedique-se e treine ainda mais." ); 
			else if ( target.nJob == 220 ) self.say( "Ahhh... � voc�... o que voc� acha da vida como Feiticeiro? Voc�... parece ser capaz de lidar com o gelo e o luz com facilidade... por favor, dedique-se e treine ainda mais." ); 
			else if ( target.nJob == 230 ) self.say( "Ahhh... � voc�... o que voc� acha da vida como Cl�rigo? Voc�... parece ser capaz de lidar com magia sagrada com facilidade... por favor, dedique-se e treine ainda mais." ); 
			else if ( target.nJob == 211 or target.nJob == 221 ) self.say( "Ahhh... Voc� finalmente se tornou um #bMago#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Mago? Por favor, dedique-se e treine ainda mais." ); 
			else if ( target.nJob == 231 ) self.say( "Ahhh... Voc� finalmente se tornou um #bSacerdote#k... Eu sabia que voc� n�o iria me decepcionar. Ent�o, o que voc� acha da vida como Sacerdote? Por favor, dedique-se e treine ainda mais." ); 
			else self.say( "Voc� gostaria de ter em m�os o poder da pr�pria natureza? Poder� ser uma longa e dif�cil estrada, mas voc� certamente receber� uma recompensa no final, alcan�ando o �pice da arte dos feiticeiros..." ); 
	} 
} 
