local ExpectedArguments = {
	ArrivalCode = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	ReceiveInvites = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	RehosterReport = {
		expectedArgs = nil,
	},

	SetTilt = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	Chant = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	RegisterDeath = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	Killfeed = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	CombatSpyVictim = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	CombatSpyObserver = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	SetCompanyAccess = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	SetCompanyCap = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	CreateCompany = {
		usePlayerModel = true,
		expectedArgs = 6,
	},

	DisbandCompany = {
		usePlayerModel = true,
		expectedArgs = 1,
	},

	SetCompanyMarker = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	PaintToCompany = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	EditCompany = {
		usePlayerModel = true,
		expectedArgs = 6,
	},

	CompanyToSpawn = {
		usePlayerModel = true,
		expectedArgs = 1,
	},

	TeamCompany = {
		usePlayerModel = true,
		expectedArgs = 1,
	},

	CreateCompanyFlag = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	RecoverCompanySpawn = {
		usePlayerModel = true,
		expectedArgs = 1,
	},

	CreateCompanyCannon = {
		usePlayerModel = true,
		expectedArgs = 1,
	},

	RemoveCompanyCannon = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	ReportMorale = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	PingDrawLine = {
		usePlayerModel = true,
		ignoreRateLimit = true,
		expectedArgs = 5,
	},

	PingPlayer = {
		usePlayerModel = true,
		ignoreRateLimit = true,
		expectedArgs = 2,
	},

	PingPosition = {
		usePlayerModel = true,
		ignoreRateLimit = true,
		expectedArgs = 2,
	},

	MovePilotCannon = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	EquipCannonBox = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	EquipCannonWeapon = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	EquipCannonShot = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	ElevateCannon = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	SetElevation = {
		expectedArgs = 4,
	},

	OperateCannon = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	SpikeCannon = {
		expectedArgs = 2,
	},

	CannonPilotControl = {
		usePlayerModel = true,
		expectedArgs = nil,
	},

	StartOutroCinematic = {
		requiredPermission = 3,
		expectedArgs = nil,
	},

	StartPreload = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	StartRound = {
		requiredPermission = 3,
		expectedArgs = nil,
	},

	CancelRound = {
		requiredPermission = 3,
		expectedArgs = nil,
	},

	StartOutro = {
		requiredPermission = 3,
		expectedArgs = nil,
	},

	SetScore = {
		requiredPermission = 3,
		expectedArgs = nil,
	},

	SwitchGame = {
		requiredPermission = 3,
		expectedArgs = nil,
	},

	SwitchPreset = {
		requiredPermission = 3,
		expectedArgs = nil,
	},

	SetClock = {
		requiredPermission = 3,
		expectedArgs = nil,
	},

	ChangeGameRules = {
		requiredPermission = 3,
		expectedArgs = nil,
	},

	DeclareWinner = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	CompanyNotification = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	Broadcast = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	Notification = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	PlayerNotification = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	AdminActionNotification = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	VariableNotification = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	BlastNotification = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	ToggleInteract = {
		expectedArgs = 3,
	},

	TeamAndSpawnCompany = {
		usePlayerModel = true,
		requiredPermission = 4,
		expectedArgs = 2,
	},

	ChangePlayerPermission = {
		usePlayerModel = true,
		requiredPermission = 2,
		expectedArgs = 3,
	},

	ChangePlayerCompany = {
		usePlayerModel = true,
		requiredPermission = 1,
		expectedArgs = 3,
	},

	MovePlayerServer = {
		usePlayerModel = true,
		requiredPermission = 3,
		expectedArgs = 6,
	},

	MoveCompanyServer = {
		usePlayerModel = true,
		requiredPermission = 4,
		expectedArgs = 4,
	},

	ChangeHatAttribute = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	ChangeLoadout = {
		usePlayerModel = true,
		requiredPermission = 1,
		expectedArgs = 3,
	},

	ChangeFanion = {
		usePlayerModel = true,
		requiredPermission = 1,
		expectedArgs = 3,
	},

	ChangeUniform = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	ChangeBackpackEnabled = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	LiftLiftable = {
		expectedArgs = 2,
	},

	DamageTree = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	BuildConstruct = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	ChangeAppearance = {
		usePlayerModel = true,
		expectedArgs = nil,
	},

	ChangeOutfit = {
		expectedArgs = 2,
	},

	PublicJoinCompany = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	ChangeTeam = {
		expectedArgs = 2,
	},

	EnterBoardGame = {
		expectedArgs = 4,
	},

	PlayBoardGame = {
		expectedArgs = 4,
	},

	KillToSwitchTeams = {
		expectedArgs = 1,
	},

	PublicRespawn = {
		expectedArgs = 1,
	},

	Pilot = {
		expectedArgs = 1,
	},

	ChangeServerTeamName = {
		requiredPermission = 4,
		expectedArgs = 3,
	},

	ChangeTeamAppearance = {
		requiredPermission = 4,
		expectedArgs = 4,
	},

	ChangeTeamNation = {
		requiredPermission = 4,
		expectedArgs = 3,
	},

	ChangeTeamUseSecondary = {
		requiredPermission = 4,
		expectedArgs = 3,
	},

	SetVisitorsState = {
		requiredPermission = 4,
		expectedArgs = 3,
	},

	ChangeFrequency = {
		requiredPermission = 4,
		expectedArgs = 2,
	},

	SetControl = {
		requiredPermission = 4,
		expectedArgs = 2,
	},

	SelfReport = {
		ignoreRateLimit = true,
		expectedArgs = nil,
		clientDisabled = true,
	},

	DealShot = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	DealShotToHorse = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	DealMelee = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	DealMeleeCritical = {
		usePlayerModel = true,
		expectedArgs = nil,
	},

	DealMeleeToHorse = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	DealCannonShot = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	Equip = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	EquipFlag = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	EjectFlagHolder = {
		usePlayerModel = true,
		requiredPermission = 1,
		expectedArgs = 1,
	},

	ChangeFlagPosition = {
		expectedArgs = 2,
	},

	FireProjectile = {
		usePlayerModel = true,
		expectedArgs = nil,
	},

	FireCannon = {
		clientDisabled = true,
		expectedArgs = nil,
	},

	CreateTarget = {
		ignoreRateLimit = true,
		expectedArgs = 2,
	},

	ClearMyTargets = {
		expectedArgs = 1,
	},

	HitTarget = {
		usePlayerModel = true,
		expectedArgs = 3,
	},

	ToggleBayonet = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	PlaySound = {
		expectedArgs = 3,
	},

	PilotHorse = {
		usePlayerModel = true,
		expectedArgs = 2,
	},

	ReceiveTheatre = {
		usePlayerModel = true,
		expectedArgs = nil,
	},

	PlayInstrument = {
		expectedArgs = nil,
	},
}

return ExpectedArguments
