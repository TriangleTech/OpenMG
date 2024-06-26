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
	system function(string)		askBoxText( string, string, integer, integer ); // AskMsg, DefaultAnswer, Column, Line : askText의 멀티라인 버전
	system function(integer)	askNumber( string, integer, integer, integer );
	system function(integer)	askMenu( string );

	// 리턴값 : 성공시 pet의 serial#, 죽은 펫이 없으면 ""
	system function(string)		askPet( string );
	system function(string)		askPetAllExcept( string, string );

	// 리턴값
	// 1 : 성공
	// 0 : 실패
	// -1 : 쿠폰 아이템이 없음
	// -2 : 잘못된 머리, 얼굴 코드
	// -3 : 잠시뒤에 다시하세요
	system function(integer)	askAvatar( string, integer, ... );
	system function(integer)	askMembershopAvatar( string, integer, ... );
	system function(integer)	makeRandAvatar( integer, ... );
	system function(integer)	makeRandAvatarNormal( integer, ... );
	system function(integer)	dealWithGuildQuest(integer);
	system function(string)	registerEventItem(integer);
}

// !! 주의 !! 
//  incXXX 함수로 전달되는 첫번째 인자는 delta 이고 이 값은 음수일 수 있다
// 두번째 인자는 참(1) 또는 거짓(0) 인 값이고 참 인 경우에는 delta 량 만큼 변동을 줄 수 있는
// 경우에만 적용시키고(이 경우 참을 리턴 그렇지 않으면 거짓을 리턴), 거짓인 경우에는 
// delta 범위 내에서 변동을 줄 수 있는 만큼만 적용시킨 후 참을 리턴한다

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

	system function(integer)		getPartyMemberLevel( integer ); // 0,1,2,3,4,5가 입력인자이며, 해당 레벨이 출력, 에러시 0 
	system function(integer)		getPartyMemberJob( integer ); // 0,1,2,3,4,5가 입력인자이며, 해당 직업코드가 출력, 에러시 0
	system function(integer)		getPartyMemberID(integer);	// 0,1,2,3,4,5가 입력인자이며, 해당 ID가 출력, 에러시 -1
	system function(string)		         getPartyMemberName(integer); // 0,1,2,3,4,5가 입력인자이며, 해당 캐릭터 이름이 출력, 에러시 -1
	system function				givePartyBuff( integer );
	system function				cancelPartyBuff( integer );
	system function				effectSound( string );
	system function				playPortalSE;
	system function(integer)    	        getMorphState;
	system function(integer)	        isWear( integer );
	system function				enforceNpcChat( integer ); // NPC id
	system function				undoMorph; // 변신상태 풀어주는 함수
	system function				questEndEffect; // Quest 완료시 이펙트를 보여주도록 함. (주로 퀘스트-스크립트 연동 퀘스트시 사용)
	system function(integer)	        transferParty( integer, string, integer ); 
											// MapID, PortalName, Option - [0:다른맵에 있어도 무조건 이동] 
											//							   [1:같은맵에 있을때만 이동. 같은맵에 없어서 이동못했다면 리턴값 1]
											//							   [2:같은맵에 있는 파티원들에 한해서 이동.]
											//							   리턴값2: 코드에서 파티원정보를 얻는데 실패했을 경우 에러. (파티를 안맺고 있다던지)
	
	system function(integer)	callOtherParty(integer,integer); // Party Represent CharacterID, FieldID
	system function(integer)	remoteNpcChatUser( integer, integer, integer ); // FieldID, UserID, NpcID
	system function(integer)	getTeamForMCarnival; //0-red 1-blue
	system function(integer)	resetTeamForMCarnival; 

	system function(integer)  getRanking; //현재 자기 직업별 랭킹 가져오기. 20이 넘거나  0보다 작거나 같으면 에러-(만들어 주면 안됨)
	system function(integer)  registerImitatedNPC( integer );  //대체할 npcID
	system function(string)			checkCondition; // 현재 상태이상에 대한 값을 리턴한다.
	system function(integer)		getXPos;
	system function(integer)		getYPos;
	//system function(integer)		smsIsCertified; // 핸드폰 인증이 된 상태면 1, 아니면 0
	//system function(integer)		smsRequestCertifyNumber( integer, string, string );
	// CompanyType, PhoneNumber, SSN :  핸드폰 인증번호 요청. 리턴값은 에러코드 참조
	//system function(integer)		smsCheckCertifyNumber( integer, string, string, string );
	// CompanyType, PhoneNumber, SSN, AuthoCode :  핸드폰 인증번호 체크. 리턴값은 에러코드 참조
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
	//system function(integer)		smsGetTP; // 남은 TP : TP가 없거나 실패시 0
	
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
	system function(string)			getQuizInfo( string, integer ); // QuizID, Category( 0: Question, 1: Hint, 2: Solution ) [return Value : "" 일 경우에는 정보얻어오는것 실패]
	system function				setSpecialAction( string ); // ActionName
	system function(string)			getName;
	system function(integer)		getTemplateID;
	system function(integer)		getXPos;
	system function(integer)		getYPos;
	system function(integer)		getFieldInstanceIndex;
	//system function(integer)		smsCheckReceiptNumber( string ); // 상대방 폰 체크. 실패 : 0, sms : 1, mate : 2
	//system function(integer)		smsSend( string, string ); // PhoneNumber, Msg : 메세지 전송 실패 : 0, 성공 : 1
	
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
	system function(integer)		getMobHP( integer ); // MobID : Mob의 HP를 리턴한다. 특정 ID의 Mob이 한마리만 있을 때만 유효함. Mob이 없을 경우엔 -1 리턴
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
	system function(integer)		transferFieldAll( integer, string ); // MapCode, PortalName (필드셋내부->외부, 외부->필드셋내부로의 이동은 사용금지)
	system function					setNpcVar( integer, string, string ); // NpcID, key, var : var의 경우 integer 값일지라도 따옴표로 묶어야 한다. (예: "1")
	system function(string)			getNpcStrVar(integer,string); // NpcID, Varname
	system function(integer)		getNpcIntVar(integer,string); // NpcID, Varname
	system function(integer)		setProtectMobDamagedByMob(integer);	// Set or Reset
	system function					removeAllMob;
	system function					setMobGen( integer, integer );	// On or Off
	
	system function					removeMob( integer );
	system function(integer)		snowOn(integer);	// Set or Reset
system function					nuffMob( integer, integer, integer );
	system function					isUserExist( integer ); // UserID [Return]: Exist : 1, Not Exist: 0
	system function					startEvent;//몬스터카니발 시작
	system function					summonNpc( integer, integer, integer ); // templateId, x, y : NPC 소환 
	system function					vanishNpc( integer ); // templateId : NPC 제거 
}

structure FieldSet {
	string name;
	function FieldSet( string );

	system function(string)			getVar( string ); // name
	system function					setVar( string, string ); // name, value
	system function(integer)		getUserCount;
	system function(integer)		enter( integer, integer ); // CharacterID, Field Info
	system function(integer)		incExpAll( integer, ... ); // incExp, 퀘스트 반복 횟수
	system function(integer)		getReactorState( integer, string ); // fieldindex, name 에러발생시 -1 리턴
	system function				setReactorState( integer, string, integer, integer ); // fieldindex, name, state, delay
	system function(integer)		getQuestTime;
	system function					resetQuestTime;
	system function				transferFieldAll( integer, string );
	system function				broadcastMsg( integer, string, ... ); // Type(  0 : normal, 1 : alert, 4 : slide, 7 : NPCSay ), Message, NPCID(Only type=7)
	system function(integer)		startManually; // return [0]: 아직 필드셋이 동작하고 있음. 재시작 실패. [1]: 재시작 성공.
	system function(integer)	resetTimeOut(integer); // return [0] : 리셋실패 [1]: 리셋성공. resetQuestTime 이 필요한 경우에는 사용금지. 어떤 일이 일어날지 보장할 수 없음.
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
	system function(integer)	exchangeEx( integer, ... ); // Money, "ID do item, (Per�odo: n, Data de Expira豫o: n), Contagem: n", Count * n
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
	// !! 주의 !! 
	// 1. key 값은 4byte정수
	// 2. value 값의 최대 길이는 16글자(한글 8글자)이다
	integer		useroid;
	// 수행전인 퀘스트를 시작하거나 수행중인 퀘스트 부가정보를 수정한다.
	system function(integer)	set( integer, string ); // Key, Value
	// 퀘스트를 완료시킨다
	system function(integer)	setComplete( integer ); // Keyㅣ
	// set과 setComplete 의 통합버젼. [ Key : 퀘스트 ID ] [ State : 1 -> 퀘스트를 진행중으로 변경 / 2-> 퀘스트를 완료상태로 변경. ]
	// 리턴값이 0이면 제대로 동작하지 못했음을 의미한다.
	system function(integer)	setState( integer, integer ); // Key, State
	// 수행 중인 퀘스트의 부가정보를 가지고 온다. 실패한 경우에는 ""이 리턴되고, 성공한 경우에도 리턴되는 스트링이 ""일 수 있음에 주의해야 한다
	system function(string)		get( integer ); // Key
	// 퀘스트 상태를 가져온다.
	system function(integer)	getState( integer ); // Key
	// 퀘스트 완료 가능 여부를 리턴한다. [ Return Value : -1 -> 퀘스트가 없거나 기타 오류 / 0 -> 완료 불가 / 1 -> 완료 가능 ]
	system function(integer)	canComplete( integer ); // Key
	// 성공 여부를 리턴 ( 단 실패한 경우는 주어진 key 값의 entry 가 없던 경우이다 )
	system function(integer)	remove( integer ); // Key
	// 퀘스트 id, 몹 id, 경험치 타입 (0이면 퍼센트 아니면 절대값), 보너스 경험치
	system function(integer)	selectedMob( integer, integer, integer, integer );
}

system function(integer)	random(integer,integer);
system function(string)		shuffle(integer,string);
system function(string)		format(string, ...);
system function(integer)	length(string);
system function(string)		substring(string, integer, integer);
system function(integer)	contain(string, string);
system function(integer)	dayofweek;

system function(string)		currentTime;			// "AA/MM/DD/HH/MM" (년월일시분) 형식
system function(string)		continentTime;			// "AA/MM/DD/HH/MM" (년월일시분) 형식 - Continent에 관련된 처리를 할 경우 이 함수를 사용하여 시간을 얻을 것.
system function(integer)	compareTime(string,string);	// 차이를 분단위로 반환
system function(integer)	serverType;			// 서버 종류 반환 1:정식 2:테스트
system function(integer)	channelID;			// Channel Number
system function(integer)	distance(integer,integer,integer,integer); // x1, y1, x2, y2 두 점사이의 거리
system function(string)		getUserInfo(integer,integer); // CharacterID, Category(0:Name, 1:직업, 2:레벨)  [리턴값]: 문자열 정보
system function(integer)	setPartyTeamForMCarnival( integer, integer ); // RepresentCharacterID, TeamNo(0 or 1) [Return]: 성공:1, 실패0
system function(integer)	getPartyMemberID( integer, integer ); // RepresentCharacterID, Index [Return] 성공: ID, 실패 : -1
system function(integer)	isPartyBoss( integer ); //id
//system function(integer)	isCelebrateEnd; // return - [1]: 주례사 종료되었음 / [0]: 주례사 종료되지 않은 상태
//system function			endNormalTypeWedding; // 조촐한 결혼식일경우 종료시킴
//system function			endPremiumTypeWedding; // 프리미엄 결혼식일경우 종료시킴

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
