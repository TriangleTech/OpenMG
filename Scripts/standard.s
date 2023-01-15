// standard definitions

structure Object, User, Npc, Portal, Field;
structure EquipItem, UInventory, UQuestRecord;

structure Object {
	integer						oid;
	system function				say( string );
	system function(integer)	askYesNo( string );
	system function(integer)	askAccept( string );
	system function(integer)	askAcceptNoESC( string );
	system function(string)		askQuiz( string, string, string, integer, integer, integer ); // Title, Problem, Hint, InputMin, InputMax, LimitTime
	system function(string)		askText( string, string, integer, integer );
	system function(string)		askBoxText( string, string, integer, integer ); // AskMsg, DefaultAnswer, Column, Line : askText�� ��Ƽ���� ����
	system function(integer)	askNumber( string, integer, integer, integer );
	system function(integer)	askMenu( string );

	// ���ϰ� : ������ pet�� serial#, ���� ���� ������ ""
	system function(string)		askPet( string );
	system function(string)		askPetAllExcept( string, string );

	// ���ϰ�
	// 1 : ����
	// 0 : ����
	// -1 : ���� �������� ����
	// -2 : �߸��� �Ӹ�, �� �ڵ�
	// -3 : ��õڿ� �ٽ��ϼ���
	system function(integer)	askAvatar( string, integer, ... );
	system function(integer)	askMembershopAvatar( string, integer, ... );
	system function(integer)	makeRandAvatar( integer, ... );
	system function(integer)	makeRandAvatarNormal( integer, ... );
	system function(integer)	dealWithGuildQuest(integer);
	system function(string)	registerEventItem(integer);
}

// !! ���� !! 
//  incXXX �Լ��� ���޵Ǵ� ù��° ���ڴ� delta �̰� �� ���� ������ �� �ִ�
// �ι�° ���ڴ� ��(1) �Ǵ� ����(0) �� ���̰� �� �� ��쿡�� delta �� ��ŭ ������ �� �� �ִ�
// ��쿡�� �����Ű��(�� ��� ���� ���� �׷��� ������ ������ ����), ������ ��쿡�� 
// delta ���� ������ ������ �� �� �ִ� ��ŭ�� �����Ų �� ���� �����Ѵ�

structure User : Object {
	system function(integer)		nCharacterID;
	system function(string)			sCharacterName;
	system function(integer)		nGender;
	system function(integer)		nFace;
	system function(integer)		nHair;
	system function(string)			sPetName;
	system function(integer)		nLevel;
	system integer					nJob;
	system function(integer)		nSTR;
	system function(integer)		incSTR( integer, integer );
	system function(integer)		nDEX;
	system function(integer)		incDEX( integer, integer );
	system function(integer)		nINT;
	system function(integer)		incINT( integer, integer );
	system function(integer)		nLUK;
	system function(integer)		incLUK( integer, integer );
	system function(integer)		nHP;
	system function(integer)		incHP( integer, integer );
	system function(integer)		nMP;
	system function(integer)		incMP( integer, integer );
	system function(integer)		nMHP;
	system function(integer)		incMHP( integer, integer );
	system function(integer)		nMMP;
	system function(integer)		incMMP( integer, integer );
	system function(integer)		nAP;
	system function(integer)		incAP( integer, integer );
	system function(integer)		nSP;
	system function(integer)		incSP( integer, integer );
	system function(integer)		incEXP( integer, integer );
	system function(integer)		nPOP;
	system function(integer)		incPOP( integer, integer );
	system function(integer)		nMoney;
	system function(integer)		incMoney( integer, integer );
	system function(integer)		effect( string, integer );
	system function(integer)		incPetTame( integer );
	system function(integer)		incFriendMax( integer, integer );
	system function(integer)		message( string );
	system function(integer)		giveBuff( integer );
	system function(integer)		learnSkill( integer );

	system function(integer)		isMaster;
//diff_s bluesky44 : SuperGM
	system function(integer)                isSuperGM;
//diff_e
// diff_s tpark : for global
	system function(integer)                hasRequestedTransferWorld;
// diff_e tpark
	system function(integer)		isPremium;
	system function(integer)		isPartyBoss;
	system function(integer)		isInParty;	
	system function(integer)		isEquipHalloweenItem;
	system function(integer)		isWear( integer );
	system function(integer)		IsClosedBetaTester;

	system function(integer)		isGuildMember;
	system function(integer)		isGuildMaster;
	system function(integer)		isGuildSubMaster;
	system function(integer)		removeGuild( integer );
	system function(integer)		getGuildCountMax;
	system function(integer)		incGuildCountMax( integer, integer );
	system function(integer)		isCreateGuildPossible( integer );
	system function(integer)		createNewGuild( integer );
	system function(integer)		setGuildMark( integer );
	system function(integer)		isGuildMarkExist;
	system function(integer)		removeGuildMark( integer );
	system function(integer)		isGuildQuestRegistered;
	system function(integer)		canEnterGuildQuest;
	system function				clearGuildQuest;
	system function				incGuildPoint( integer );

	system function				playPortalSE;

	system function(integer)		makeReservation( integer );
	system function(integer)		isWeddingCouple;
	system function(integer)		IsMarried;
	system function(integer)		startWedding;
	system function(integer)		divorce;
	system function(integer)		openWishList( integer, integer );
	system function(string)			getMateName;

	system function(integer)		getPartyMemberLevel( integer ); // 0,1,2,3,4,5�� �Է������̸�, �ش� ������ ���, ������ 0 
	system function(integer)		getPartyMemberJob( integer ); // 0,1,2,3,4,5�� �Է������̸�, �ش� �����ڵ尡 ���, ������ 0
	system function(integer)		getPartyMemberID(integer);	// 0,1,2,3,4,5�� �Է������̸�, �ش� ID�� ���, ������ -1
	system function(string)		         getPartyMemberName(integer); // 0,1,2,3,4,5�� �Է������̸�, �ش� ĳ���� �̸��� ���, ������ -1
	system function				givePartyBuff( integer );
	system function				cancelPartyBuff( integer );
	system function				effectSound( string );
	system function				playPortalSE;
	system function(integer)    	        getMorphState;
	system function(integer)	        isWear( integer );
	system function				enforceNpcChat( integer ); // NPC id
	system function				undoMorph; // ���Ż��� Ǯ���ִ� �Լ�
	system function				questEndEffect; // Quest �Ϸ�� ����Ʈ�� �����ֵ��� ��. (�ַ� ����Ʈ-��ũ��Ʈ ���� ����Ʈ�� ���)
	system function(integer)	        transferParty( integer, string, integer ); 
											// MapID, PortalName, Option - [0:�ٸ��ʿ� �־ ������ �̵�] 
											//							   [1:�����ʿ� �������� �̵�. �����ʿ� ��� �̵����ߴٸ� ���ϰ� 1]
											//							   [2:�����ʿ� �ִ� ��Ƽ���鿡 ���ؼ� �̵�.]
											//							   ���ϰ�2: �ڵ忡�� ��Ƽ�������� ��µ� �������� ��� ����. (��Ƽ�� �ȸΰ� �ִٴ���)
	
	system function(integer)	callOtherParty(integer,integer); // Party Represent CharacterID, FieldID
	system function(integer)	remoteNpcChatUser( integer, integer, integer ); // FieldID, UserID, NpcID
	system function(integer)	getTeamForMCarnival; //0-red 1-blue
	system function(integer)	resetTeamForMCarnival; 

	system function(integer)  getRanking; //���� �ڱ� ������ ��ŷ ��������. 20�� �Ѱų�  0���� �۰ų� ������ ����-(����� �ָ� �ȵ�)
	system function(integer)  registerImitatedNPC( integer );  //��ü�� npcID
	system function(string)			checkCondition; // ���� �����̻� ���� ���� �����Ѵ�.
	system function(integer)		getXPos;
	system function(integer)		getYPos;
	//system function(integer)		smsIsCertified; // �ڵ��� ������ �� ���¸� 1, �ƴϸ� 0
	//system function(integer)		smsRequestCertifyNumber( integer, string, string );
	// CompanyType, PhoneNumber, SSN :  �ڵ��� ������ȣ ��û. ���ϰ��� �����ڵ� ����
	//system function(integer)		smsCheckCertifyNumber( integer, string, string, string );
	// CompanyType, PhoneNumber, SSN, AuthoCode :  �ڵ��� ������ȣ üũ. ���ϰ��� �����ڵ� ����
	// CompanyType, MC_SKT = 1, MC_KTF = 2, MC_LGT = 3
	// fail reason
	// MemberShopFailReason_Unknown = 6,
	// MemberShopFailReason_Timeout = 7,
	// MemberShopFailReason_SvrDisconnected = 8,
	// MemberShopFailReason_IncorrectCellNumber = 9,
	// MemberShopFailReason_AuthenticationFailed = 10,
	// MemberShopFailReason_ExternalSystemErr = 11,
	// MemberShopFailReason_TryOnDuplicatedJoin = 12,
	// MemberShopFailReason_IncorrectAuthCode = 13,
	//system function(integer)		smsGetTP; // ���� TP : TP�� ���ų� ���н� 0
	
	function(UInventory)			inventory;
	function(UQuestRecord)			questRecord;
	function(integer)			distanceOfNpc;
}

structure Npc : Object {
	system function(integer)		getFieldID;
	system function(integer)		getIntReg( string );
	system function				setIntReg( string, integer );
	system function(integer)		incIntReg( string, integer );
	system function(string)			getStrReg( string );
	system function				setStrReg( string, string );
	system function				sendMessage( string, string ); // CharacterName, Msg
	system function(string)			getQuizInfo( string, integer ); // QuizID, Category( 0: Question, 1: Hint, 2: Solution ) [return Value : "" �� ��쿡�� ���������°� ����]
	system function				setSpecialAction( string ); // ActionName
	system function(string)			getName;
	system function(integer)		getTemplateID;
	system function(integer)		getXPos;
	system function(integer)		getYPos;
	system function(integer)		getFieldInstanceIndex;
	//system function(integer)		smsCheckReceiptNumber( string ); // ���� �� üũ. ���� : 0, sms : 1, mate : 2
	//system function(integer)		smsSend( string, string ); // PhoneNumber, Msg : �޼��� ���� ���� : 0, ���� : 1
	
	function(Field)					field;
}

structure Portal : Object {
	system function(integer)		getPortalID;
	system function(integer)		getFieldID;
	
	function(Field)					field;
}

structure Field {
	integer	id;
	function Field( integer );

	system function(integer)		getUserCount;
	system function(integer)		getMobCount( integer ); // MobID 
	system function(integer)		getMobHP( integer ); // MobID : Mob�� HP�� �����Ѵ�. Ư�� ID�� Mob�� �Ѹ����� ���� ���� ��ȿ��. Mob�� ���� ��쿣 -1 ����
	system function(integer)		countUserInArea( string ); // AreaName
// diff_s tpark
	system function(integer)		countMaleInArea( string );
	system function(integer)		countFemaleInArea( string );
// diff_e tpark
	system function					enablePortal( string, integer ); // PortalName, Open:1,Close:0
	system function					effectObject( string ); // ObjName
	system function					effectScreen( string ); // Name
	system function					effectSound( string );
	system function					effectTremble( integer, integer ); // Type( 0:Light&Long 1 : Heavy&Short ), Delay( millisecond)
	system function					notice( integer, string, ... ); // Type(  0 : normal, 1 : alert, 4 : slide, 7 : NPCSay ), Message, NPCID(Only type=7)
	system function(integer)		isItemInArea( string, integer ); // AreaName, ItemID
	system function				summonMob( integer, integer, integer );	// x, y, ItemID
	system function(integer)		transferFieldAll( integer, string ); // MapCode, PortalName (�ʵ�³���->�ܺ�, �ܺ�->�ʵ�³��η��� �̵��� ������)
	system function					setNpcVar( integer, string, string ); // NpcID, key, var : var�� ��� integer �������� ����ǥ�� ����� �Ѵ�. (��: "1")
	system function(string)			getNpcStrVar(integer,string); // NpcID, Varname
	system function(integer)		getNpcIntVar(integer,string); // NpcID, Varname
	system function(integer)		setProtectMobDamagedByMob(integer);	// Set or Reset
	system function					removeAllMob;
	system function					setMobGen( integer, integer );	// On or Off
	
	system function					removeMob( integer );
	system function(integer)		snowOn(integer);	// Set or Reset
system function					nuffMob( integer, integer, integer );
	system function					isUserExist( integer ); // UserID [Return]: Exist : 1, Not Exist: 0
	system function					startEvent;//����ī�Ϲ� ����
	system function					summonNpc( integer, integer, integer ); // templateId, x, y : NPC ��ȯ 
	system function					vanishNpc( integer ); // templateId : NPC ���� 
}

structure FieldSet {
	string name;
	function FieldSet( string );

	system function(string)			getVar( string ); // name
	system function					setVar( string, string ); // name, value
	system function(integer)		getUserCount;
	system function(integer)		enter( integer, integer ); // CharacterID, Field Info
	system function(integer)		incExpAll( integer, ... ); // incExp, ����Ʈ �ݺ� Ƚ��
	system function(integer)		getReactorState( integer, string ); // fieldindex, name �����߻��� -1 ����
	system function				setReactorState( integer, string, integer, integer ); // fieldindex, name, state, delay
	system function(integer)		getQuestTime;
	system function					resetQuestTime;
	system function				transferFieldAll( integer, string );
	system function				broadcastMsg( integer, string, ... ); // Type(  0 : normal, 1 : alert, 4 : slide, 7 : NPCSay ), Message, NPCID(Only type=7)
	system function(integer)		startManually; // return [0]: ���� �ʵ���� �����ϰ� ����. ����� ����. [1]: ����� ����.
	system function(integer)	resetTimeOut(integer); // return [0] : ���½��� [1]: ���¼���. resetQuestTime �� �ʿ��� ��쿡�� ������. � ���� �Ͼ�� ������ �� ����.
	system function				setTargetFieldID(integer);
}

structure EquipItem {
	integer nItemID;
	integer nrLevel; integer nrJob;
	integer nrSTR; integer nrDEX; integer nrINT; integer nrLUK;
	integer niSTR; integer niDEX; integer niINT; integer niLUK;
	integer niMaxHP; integer niMaxMP;
	integer niPAD; integer niMAD; integer niPDD; integer niMDD;
	integer niACC; integer niCraft; integer niSpeed; integer niJump;
}

structure UInventory {
	integer		useroid;
	system function(integer)	slotCount( integer ); // Type
	system function(integer)	holdCount( integer ); // Type
	system function				incSlotCount( integer, integer ); // Type, Count
	system function(integer)	itemCount( integer ); // Item ID
	system function(integer)	exchange( integer, ... ); // Money, ( ItemID, Count ) * n
	system function(integer)	exchangeEx( integer, ... ); // Money, "ID do item, (Per�odo: n, Data de Expira��o: n), Contagem: n", Count * n
	system function(integer)	setPetLife(string,integer,integer); // Pet serial#, CashItemID, NormalItemID
	system function(integer)	makePigmyEgg( integer,integer ); // FeedItemID, TownID
	system function(integer)	removeEquippedItem( integer ); // ItemID
	system function(integer)	movePetStat(string, string, integer); // Pet1 serial#, Pet2 serial#, ItemID
	// diff_s
	system function(string)		getItemTitle( integer, integer ); // ItemID
	// To Apply Gachapon
	system function(integer)	makeRandGachaponItem( integer, integer ); // Gachapon coupon, Town number
	// diff_e
	// diff_s
	system function(integer)	getAdditionalInvitation;
	// diff_e
	// diff_s pet evol 
	system function(integer)	requestPetEvol;
	// diff_e
	system function(integer)	hasThisItemInHisParty( integer ); // Item ID
}

structure UQuestRecord {
	// !! ���� !! 
	// 1. key ���� 4byte����
	// 2. value ���� �ִ� ���̴� 16����(�ѱ� 8����)�̴�
	integer		useroid;
	// �������� ����Ʈ�� �����ϰų� �������� ����Ʈ �ΰ������� �����Ѵ�.
	system function(integer)	set( integer, string ); // Key, Value
	// ����Ʈ�� �Ϸ��Ų��
	system function(integer)	setComplete( integer ); // Key��
	// set�� setComplete �� ���չ���. [ Key : ����Ʈ ID ] [ State : 1 -> ����Ʈ�� ���������� ���� / 2-> ����Ʈ�� �Ϸ���·� ����. ]
	// ���ϰ��� 0�̸� ����� �������� �������� �ǹ��Ѵ�.
	system function(integer)	setState( integer, integer ); // Key, State
	// ���� ���� ����Ʈ�� �ΰ������� ������ �´�. ������ ��쿡�� ""�� ���ϵǰ�, ������ ��쿡�� ���ϵǴ� ��Ʈ���� ""�� �� ������ �����ؾ� �Ѵ�
	system function(string)		get( integer ); // Key
	// ����Ʈ ���¸� �����´�.
	system function(integer)	getState( integer ); // Key
	// ����Ʈ �Ϸ� ���� ���θ� �����Ѵ�. [ Return Value : -1 -> ����Ʈ�� ���ų� ��Ÿ ���� / 0 -> �Ϸ� �Ұ� / 1 -> �Ϸ� ���� ]
	system function(integer)	canComplete( integer ); // Key
	// ���� ���θ� ���� ( �� ������ ���� �־��� key ���� entry �� ���� ����̴� )
	system function(integer)	remove( integer ); // Key
	// ����Ʈ id, �� id, ����ġ Ÿ�� (0�̸� �ۼ�Ʈ �ƴϸ� ���밪), ���ʽ� ����ġ
	system function(integer)	selectedMob( integer, integer, integer, integer );
}

system function(integer)	random(integer,integer);
system function(string)		shuffle(integer,string);
system function(string)		format(string, ...);
system function(integer)	length(string);
system function(string)		substring(string, integer, integer);
system function(integer)	contain(string, string);
system function(integer)	dayofweek;

system function(string)		currentTime;			// "AA/MM/DD/HH/MM" (����Ͻú�) ����
system function(string)		continentTime;			// "AA/MM/DD/HH/MM" (����Ͻú�) ���� - Continent�� ���õ� ó���� �� ��� �� �Լ��� ����Ͽ� �ð��� ���� ��.
system function(integer)	compareTime(string,string);	// ���̸� �д����� ��ȯ
system function(integer)	serverType;			// ���� ���� ��ȯ 1:���� 2:�׽�Ʈ
system function(integer)	channelID;			// Channel Number
system function(integer)	distance(integer,integer,integer,integer); // x1, y1, x2, y2 �� �������� �Ÿ�
system function(string)		getUserInfo(integer,integer); // CharacterID, Category(0:Name, 1:����, 2:����)  [���ϰ�]: ���ڿ� ����
system function(integer)	setPartyTeamForMCarnival( integer, integer ); // RepresentCharacterID, TeamNo(0 or 1) [Return]: ����:1, ����0
system function(integer)	getPartyMemberID( integer, integer ); // RepresentCharacterID, Index [Return] ����: ID, ���� : -1
system function(integer)	isPartyBoss( integer ); //id
//system function(integer)	isCelebrateEnd; // return - [1]: �ַʻ� ����Ǿ��� / [0]: �ַʻ� ������� ���� ����
//system function			endNormalTypeWedding; // ������ ��ȥ���ϰ�� �����Ŵ
//system function			endPremiumTypeWedding; // �����̾� ��ȥ���ϰ�� �����Ŵ

system function(Npc)		self;
system function(Portal)		portal;
system User					target;
system function				registerTransferField(integer,string);
system function				logEvent(string);
// diff_s tpark 
system function				broadcastMsg(string);
// diff_e tpark
system function(integer)	getCurrentWeddingState;

// end of standard definitions

function(UInventory) User.inventory {
    ret = UInventory;
    ret.useroid = oid;
    return ret;
}

function(UQuestRecord) User.questRecord {
	ret = UQuestRecord;
	ret.useroid = oid;
	return ret;
}

function(integer) User.distanceOfNpc {
	return distance( getXPos, getYPos, self.getXPos, self.getYPos );
}

function(Field) Npc.field {
	return Field( getFieldID );
}

function(Field) Portal.field {
	return Field( getFieldID );
}

function Field.Field( integer fieldid ) {
	id = fieldid;
}

function FieldSet.FieldSet( string setname ) {
	name = setname;
}
