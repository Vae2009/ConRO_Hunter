local ConRO_Hunter, ids = ...;

--General
ids.racial = {
	AncestralCall = {spellID = 274738},
	ArcanePulse = {spellID = 260364},
	ArcaneTorrent = {spellID = 50613},
	Berserking = {spellID = 26297},
	Cannibalize = {spellID = 20577},
	GiftoftheNaaru = {spellID = 59548},
	Shadowmeld = {spellID = 58984},
}
ids.hero_spec = {
	Sentinel = 42,
	PackLeader = 43,
	DarkRanger = 44,
}

ids.beast_mastery = {
	ability = {
	--Baseline
		ArcaneShot = {spellID = 185358},
		AspectoftheCheetah = {spellID = 186257},
		AspectoftheTurtle = {spellID = 186265};
		CallPet = {
			One = {spellID = 883},
			Two = {spellID = 83242},
			Three = {spellID = 83243},
			Four = {spellID = 83244},
			Five = {spellID = 83245},
		},
		CommandPet = {
			PrimalRage = {spellID = 272678},
			FortitudeoftheBear = {spellID = 272679},
			MastersCall = {spellID = 272682},
		},
		Disengage = {spellID = 781},
		EagleEye = {spellID = 6197},
		Exhilaration = {spellID = 109304},
		EyesoftheBeast = {spellID = 321297},
		FeignDeath = {spellID = 5384},
		Flare = {spellID = 1543},
		FreezingTrap = {spellID = 187650},
		HuntersMark = {spellID = 257284},
		PetUtility = {
			BeastLore = {spellID = 1462},
			DismissPet = {spellID = 2641},
			FeedPet = {spellID = 6991},
			RevivePet = {spellID = 982},
			MendPet = {spellID = 136},
			TameBeast = {spellID = 1515},
		},
		SteadyShot = {spellID = 56641},
		WingClip = {spellID = 195645},
	--Passive
		ExoticBeasts = {spellID = 53270},
		MasteryMasterofBeasts = {spellID = 76657},
	--Hunter Talents
		NaturalMending = {spellID = 270581, talentID = 126465},
		Posthaste = {spellID = 109215, talentID = 126475},
		KillShot = {spellID = 53351, talentID = 126441},
		RejuvenatingWind = {spellID = 385539, talentID = 126444},
		HuntersAvoidance = {spellID = 384799, talentID = 126489},
		Deathblow = {spellID = 343248, talentID = 126474},
		WildernessMedicine = {spellID = 343242, talentID = 126446},
		TarTrap = {spellID = 187698, talentID = 126457},
		TranquilizingShot = {spellID = 19801, talentID = 126443},
		ConcussiveShot = {spellID = 5116, talentID = 126471},
		SurvivaloftheFittest = {spellID = 264735, talentID = 126488},
		Entrapment = {spellID = 393344, talentID = 126467},
		CounterShot = {spellID = 147362, talentID = 126352},
		KodoTranquilizer = {spellID = 459983, talentID = 126480},
		DevilsaurTranquilizer = {spellID = 459991, talentID = 126479},
		Misdirection = {spellID = 34477, talentID = 126484},
		ScoutsInstincts = {spellID = 459455, talentID = 126490},
		PaddedArmor = {spellID = 459450, talentID = 126470},
		LoneSurvivor = {spellID = 388039, talentID = 126454},
		SpecializedArsenal = {spellID = 459542, talentID = 126453},
		DisruptiveRounds = {spellID = 343244, talentID = 126459},
		NoHardFeelings = {spellID = 459546, talentID = 126476},
		ScareBeast = {spellID = 1513, talentID = 126445},
		Intimidation = {spellID = 19577, talentID = 126461},
		ExplosiveShot = {spellID = 212431, talentID = 126485},
		BindingShot = {spellID = 109248, talentID = 126449},
		BurstingShot = {spellID = 186387, talentID = 126487},
		ScatterShot = {spellID = 213691, talentID = 126486},
		TerritorialInstincts = {spellID = 459507, talentID = 126458},
		TriggerFinger = {spellID = 459534, talentID = 126460},
		BlackrockMunitions = {spellID = 462036, talentID = 126456},
		KeenEyesight = {spellID = 378004, talentID = 126473},
		TarCoatedBindings = {spellID = 459460, talentID = 126482},
		Scrappy = {spellID = 459533, talentID = 126472},
		QuickLoad = {spellID = 378771, talentID = 126477},
		Pathfinding = {spellID = 378002, talentID = 126468},
		BindingShackles = {spellID = 321468, talentID = 126451},
		Camouflage = {spellID = 199483, talentID = 126478},
		KindlingFlare = {spellID = 459506, talentID = 126491},
		Trailblazer = {spellID = 199921, talentID = 126464},
		RoarofSacrifice = {spellID = 53480, talentID = 126469},
		SerratedTips = {spellID = 459502, talentID = 126447},
		MomentofOpportunity = {spellID = 459488, talentID = 126492},
		BornToBeWild = {spellID = 266921, talentID = 126481},
		GhillieSuit = {spellID = 459466, talentID = 126448},
		ImprovedTraps = {spellID = 343247, talentID = 126483},
		EmergencySalve = {spellID = 459517, talentID = 126452},
		HighExplosiveTrap = {spellID = 236776, talentID = 126830},
		ImplosiveTrap = {spellID = 462031, talentID = 126829},
		UnnaturalCauses = {spellID = 459527, talentID = 126450},
	--Beast Mastery Talents
		KillCommand = {spellID = 34026, talentID = 126408},
		CobraShot = {spellID = 193455, talentID = 126416},
		AnimalCompanion = {spellID = 267116, talentID = 126423},
		solitary_companion = {
			passiveID = 474746,
			talentID = 128415
		},
		BarbedShot = {spellID = 217200, talentID = 126440},
		PackTactics = {spellID = 321014, talentID = 126437},
		AspectoftheBeast = {spellID = 191384, talentID = 126413},
		WarOrders = {spellID = 393933, talentID = 126405},
		ThrilloftheHunt = {spellID = 257944, talentID = 126407},
		GofortheThroat = {spellID = 459550, talentID = 126419},
		MultiShot = {spellID = 2643, talentID = 126425},
		Laceration = {spellID = 459552, talentID = 126432},
		BarbedScales = {spellID = 469880, talentID = 126418},
		AlphaPredator = {spellID = 269737, talentID = 126431},
		SnakeskinQuiver = {spellID = 468695, talentID = 126406},
		CobraSenses = {spellID = 378244, talentID = 128265},
		BeastCleave = {spellID = 115939, talentID = 126403},
		WildCall = {spellID = 185789, talentID = 126399},
		HuntersPrey = {spellID = 378210, talentID = 126422},
		poisoned_barbs = {
			passiveID = 1217535,
			talentID = 126420
		},
		Stomp = {spellID = 199530, talentID = 126409},
		SerpentineRhythm = {spellID = 468701, talentID = 126421},
		KillCleave = {spellID = 378207, talentID = 126417},
		TrainingExpert = {spellID = 378209, talentID = 126410},
		DireBeast = {spellID = 120679, talentID = 126439},
		AMurderofCrows = {spellID = 459760, talentID = 126414},
		Barrage = {spellID = 120360, talentID = 126396},
		Savagery = {spellID = 424557, talentID = 126415},
		BestialWrath = {spellID = 19574, talentID = 126402},
		DireCommand = {spellID = 378743, talentID = 126427},
		HuntmastersCall = {spellID = 459730, talentID = 126411},
		dire_cleave = {
			passiveID = 1217524,
			talentID = 126398
		},
		KillerInstinct = {spellID = 273887, talentID = 126426},
		MasterHandler = {spellID = 424558, talentID = 126435},
		BarbedWrath = {spellID = 231548, talentID = 126436},
		thundering_hooves = {
			passiveID = 459693,
			talentID = 126433
		},
		dire_frenzy = {
			passiveID = 385810,
			talentID = 126430
		},
		CalloftheWild = {spellID = 359844, talentID = 126397},
		KillerCobra = {spellID = 199532, talentID = 126438},
		ScentofBlood = {spellID = 193532, talentID = 126404},
		BrutalCompanion = {spellID = 386870, talentID = 126412},
		Bloodshed = {spellID = 321530, talentID = 126424},
		WildInstincts = {spellID = 378442, talentID = 126401},
		BloodyFrenzy = {spellID = 407412, talentID = 126400},
		PiercingFangs = {spellID = 392053, talentID = 126434},
		VenomousBite = {spellID = 459667, talentID = 126429},
		ShowerofBlood = {spellID = 459729, talentID = 126428},
	--Hero Talents
	--Dark Ranger
		BlackArrow = {passiveID = 466932, spellID = 466930, talentID = 117584},
		BleakArrows = {spellID = 467749, talentID = 117558},
		ShadowHounds = {spellID = 430707, talentID = 117580},
		SoulDrinker = {spellID = 469638, talentID = 128238},
		TheBellTolls = {spellID = 467644, talentID = 117565},
		PhantomPain = {spellID = 467941, talentID = 117583},
		EbonBowstring = {spellID = 467897, talentID = 123780},
		EmbracetheShadows = {spellID = 430704, talentID = 117556},
		SmokeScreen = {spellID = 430709, talentID = 123779},
		DarkChains = {spellID = 430712, talentID = 117557},
		ShadowDagger = {spellID = 467741, talentID = 128219},
		BansheesMark = {spellID = 467902, talentID = 117554},
		ShadowSurge = {spellID = 467936, talentID = 117579},
		BleakPowder = {spellID = 467911, talentID = 117571},
		WitheringFire = {spellID = 466990, talentID = 117590},
	--Pack Leader
		howl_of_the_pack_leader = {
			passiveID = 471876,
			talentID = 117588
		},
		pack_mentality = {
			passiveID = 472358,
			talentID = 117582
		},
		dire_summons = {
			passiveID = 472352,
			talentID = 117589,
		},
		better_together = {
			passiveID = 472357,
			talentID = 117559
		},
		ursine_fury = {
			passiveID = 472476,
			talentID = 117569
		},
		envenomed_fangs = {
			passiveID = 472524,
			talentID = 128358
		},
		fury_of_the_wyvern = {
			passiveID = 472550,
			talentID = 117581
		},
		hogstrider = {
			passiveID = 472639,
			talentID = 117585
		},
		no_mercy = {
			passiveID = 472660,
			talentID = 117566
		},
		shell_cover = {
			passiveID = 472707,
			talentID = 117564
		},
		slicked_shoes = {
			passiveID = 472719,
			talentID = 117576
		},
		horsehair_tether = {
			passiveID = 472729,
			talentID = 123781
		},
		lead_from_the_front = {
			passiveID = 472741,
			talentID = 117563
		}
	},
	pvp_talent = {

	},
	buff = {
		AspectoftheWild = 193530,
		BestialWrath = 19574,
		BeastCleave = 268877,
		CalloftheWild = 359844,
		Deathblow = 378770,
		Frenzy = 272790,
		hogstrider = 472640,
		HuntersPrey = 378215,
	},
	debuff = {
		HuntersMark = 257284,
		SerpentSting = 271788,
		TarTrap = 135299,
	},
	pet_ability = {
		Bite = {spellID = 17253},
		Claw = {spellID = 16827},
		Smack = {spellID = 49966},
		ChiJisTranquility = {spellID = 264028},
		NaturesGrace = {spellID = 264266},
		NetherShock = {spellID = 264264},
		PrimalRage = {spellID = 264667},
		SerenityDust = {spellID = 264055},
		SonicBlast = {spellID = 264263},
		SporeCloud = {spellID = 264056},
		SoothingWater = {spellID = 264262},
		SpiritShock = {spellID = 264265},
	},
}

ids.marksmanship = {
	ability = {
	--Baseline
		ArcaneShot = {spellID = 185358},
		AspectoftheCheetah = {spellID = 186257},
		AspectoftheTurtle = {spellID = 186265};
		CallPet = {
			One = {spellID = 883},
			Two = {spellID = 83242},
			Three = {spellID = 83243},
			Four = {spellID = 83244},
			Five = {spellID = 83245},
		},
		CommandPet = {
			PrimalRage = {spellID = 272678},
			FortitudeoftheBear = {spellID = 272679},
			MastersCall = {spellID = 272682},
		},
		Disengage = {spellID = 781},
		EagleEye = {spellID = 6197},
		Exhilaration = {spellID = 109304},
		FeignDeath = {spellID = 5384},
		Flare = {spellID = 1543},
		FreezingTrap = {spellID = 187650},
		harriers_cry = {
			spellID = 466904
		},
		HuntersMark = {spellID = 257284},
		MultiShot = {
			spellID = 257620,
		},
		PetUtility = {
			BeastLore = {spellID = 1462},
			DismissPet = {spellID = 2641},
			FeedPet = {spellID = 6991},
			RevivePet = {spellID = 982},
			MendPet = {spellID = 136},
			TameBeast = {spellID = 1515},
		},
		SteadyShot = {spellID = 56641},
		WingClip = {spellID = 195645},
	--Passive
		eyes_in_the_sky = {
			spellID = 1219616,
		},
		manhunter = {
			spellID = 1217788,
		},
		MasterySniperTraining = {spellID = 193468},
	--Hunter Talents
		NaturalMending = {spellID = 270581, talentID = 126465},
		Posthaste = {spellID = 109215, talentID = 126475},
		KillShot = {spellID = 53351, talentID = 126463},
		RejuvenatingWind = {spellID = 385539, talentID = 126444},
		HuntersAvoidance = {spellID = 384799, talentID = 126489},
		Deathblow = {spellID = 343248, talentID = 126474},
		WildernessMedicine = {spellID = 343242, talentID = 126446},
		TarTrap = {spellID = 187698, talentID = 126457},
		TranquilizingShot = {spellID = 19801, talentID = 126443},
		ConcussiveShot = {spellID = 5116, talentID = 126471},
		SurvivaloftheFittest = {spellID = 264735, talentID = 126488},
		Entrapment = {spellID = 393344, talentID = 126467},
		CounterShot = {spellID = 147362, talentID = 126466},
		KodoTranquilizer = {spellID = 459983, talentID = 126480},
		DevilsaurTranquilizer = {spellID = 459991, talentID = 126479},
		Misdirection = {spellID = 34477, talentID = 126484},
		ScoutsInstincts = {spellID = 459455, talentID = 126490},
		PaddedArmor = {spellID = 459450, talentID = 126470},
		LoneSurvivor = {spellID = 388039, talentID = 126454},
		SpecializedArsenal = {spellID = 459542, talentID = 126453},
		DisruptiveRounds = {spellID = 343244, talentID = 126459},
		NoHardFeelings = {spellID = 459546, talentID = 126476},
		ScareBeast = {spellID = 1513, talentID = 126445},
		Intimidation = {spellID = 474421, talentID = 128413},
		ExplosiveShot = {spellID = 212431, talentID = 126485},
		BindingShot = {spellID = 109248, talentID = 126449},
		BurstingShot = {spellID = 186387, talentID = 126487},
		ScatterShot = {spellID = 213691, talentID = 126486},
		TerritorialInstincts = {spellID = 459507, talentID = 126458},
		TriggerFinger = {spellID = 459534, talentID = 126460},
		BlackrockMunitions = {spellID = 462036, talentID = 126456},
		KeenEyesight = {spellID = 378004, talentID = 126473},
		TarCoatedBindings = {spellID = 459460, talentID = 126482},
		Scrappy = {spellID = 459533, talentID = 126472},
		QuickLoad = {spellID = 378771, talentID = 126477},
		Pathfinding = {spellID = 378002, talentID = 126468},
		BindingShackles = {spellID = 321468, talentID = 126451},
		Camouflage = {spellID = 199483, talentID = 126478},
		KindlingFlare = {spellID = 459506, talentID = 126491},
		Trailblazer = {spellID = 199921, talentID = 126464},
		RoarofSacrifice = {spellID = 53480, talentID = 126469},
		SerratedTips = {spellID = 459502, talentID = 126447},
		MomentofOpportunity = {spellID = 459488, talentID = 126492},
		BornToBeWild = {spellID = 266921, talentID = 126481},
		GhillieSuit = {spellID = 459466, talentID = 126448},
		ImprovedTraps = {spellID = 343247, talentID = 126483},
		EmergencySalve = {spellID = 459517, talentID = 126452},
		HighExplosiveTrap = {spellID = 236776, talentID = 126830},
		ImplosiveTrap = {spellID = 462031, talentID = 126829},
		UnnaturalCauses = {spellID = 459527, talentID = 126450},
	--Marksmanship Talents
		AimedShot = {
			spellID = 19434,
			talentID = 128404,
		},
		RapidFire = {
			spellID = 257044,
			talentID = 128383,
		},
		PreciseShot = {
			spellID = 260240,
			talentID = 128399,
		},
		Streamline = {
			spellID = 260367,
			talentID = 128405,
		},
		TrickShots = {
			spellID = 257621,
			talentID = 128378,
		},
		aspect_of_the_hydra = {
			passiveID = 470945,
			talentID = 128377,
		},
		ammo_conservation = {
			passiveID = 459794,
			talentID = 128397,
		},
		penetrating_shots = {
			passiveID = 459783,
			talentID = 128717,
		},
		improved_spotters_mark = {
			passiveID = 466867,
			talentID = 128710,
		},
		unbreakable_bond = {
			passiveID = 1223323,
			talentID = 129619,
		},
		LockandLoad = {
			passiveID = 194595,
			talentID = 128410,
		},
		IntheRhythm = {
			passiveID = 407404,
			talentID = 128368
		},
		SurgingShots = {
			passiveID = 391559,
			talentID = 128386,
		},
		tenacious = {
			passiveID = 474456,
			talentID = 128408,
		},
		cunning = {
			passiveID = 474440,
			talentID = 128411,
		},
		MasterMarksman = {
			spellID = 260309,
			talentID = 126356,
		},
		quickdraw = {
			passiveID = 473380,
			talentID = 128385,
		},
		ImprovedDeathblow = {
			spellID = 378769,
			talentID = 128391,
		},
		obsidian_arrowhead = {
			passiveID = 471350,
			talentID = 128380,
		},
		on_target = {
			passiveID = 471348,
			talentID = 128714,
		},
		Trueshot = {
			spellID = 288613,
			talentID = 128367,
		},
		moving_target = {
			passiveID = 474296,
			talentID = 128402,
		},
		precision_detonation = {
			passiveID = 471369,
			talentID = 128369,
		},
		RazorFragments = {
			passiveID = 384790,
			talentID = 128387,
		},
		headshot = {
			passiveID = 471363,
			talentID = 128394,
		},
		deadeye = {
			passiveID = 321460,
			talentID = 128715,
		},
		no_scope = {
			passiveID = 473385,
			talentID = 128375,
		},
		feathered_frenzy = {
			passiveID = 470943,
			talentID = 128406,
		},
		target_acquisition = {
			passiveID = 473379,
			talentID = 128390,
		},
		shrapnel_shot = {
			passiveID = 473520,
			talentID = 128709,
		},
		magnetic_gunpowder = {
			passiveID = 473522,
			talentID = 128403,
		},
		eagles_accuracy = {
			passiveID = 473369,
			talentID = 128395,
		},
		CallingtheShots = {
			spellID = 260404,
			talentID = 126372
		},
		Bullseye = {
			passiveID = 204089,
			talentID = 128370,
		},
		improved_streamline = {
			passiveID = 471427,
			talentID = 128409,
		},
		FocusedAim = {
			spellID = 378767,
			talentID = 128716,
		},
		killer_mark = {
			passiveID = 1215032,
			talentID = 128610,
		},
		Bulletstorm = {
			passiveID = 389019,
			talentID = 128384,
		},
		tensile_bowstring = {
			passiveID = 471366,
			talentID = 128388,
		},
		Volley = {
			spellID = 260243,
			talentID = 128376,
		},
		ohnahran_winds = {
			passiveID = 1215021,
			talentID = 128401,
		},
		SmallGameHunter = {
			passiveID = 459802,
			talentID = 128400,
		},
		windrunner_quiver = {
			passiveID = 473523,
			talentID = 128372,
		},
		incendiary_ammunition = {
			passiveID = 471428,
			talentID = 128407,
		},
		double_tap = {
			passiveID = 473370,
			talentID = 128373,
		},
		unerring_vision = {
			passiveID = 474738,
			talentID = 129294,
		},
		kill_zone = {
			passiveID = 459921,
			talentID = 128382,
		},
		salvo = {
			passiveID = 400456,
			talentID = 128381,
		},
		bullet_hell = {
			passiveID = 473378,
			talentID = 128609,
		},
	--Hero Talents
	--Dark Ranger
		BlackArrow = {passiveID = 466932, spellID = 466930, talentID = 117584},
		BleakArrows = {spellID = 467749, talentID = 117558},
		ShadowHounds = {spellID = 430707, talentID = 117580},
		SoulDrinker = {spellID = 469638, talentID = 128238},
		TheBellTolls = {spellID = 467644, talentID = 117565},
		PhantomPain = {spellID = 467941, talentID = 117583},
		EbonBowstring = {spellID = 467897, talentID = 123780},
		EmbracetheShadows = {spellID = 430704, talentID = 117556},
		SmokeScreen = {spellID = 430709, talentID = 123779},
		DarkChains = {spellID = 430712, talentID = 117557},
		ShadowDagger = {spellID = 467741, talentID = 128219},
		BansheesMark = {spellID = 467902, talentID = 117554},
		ShadowSurge = {spellID = 467936, talentID = 117579},
		BleakPowder = {spellID = 467911, talentID = 117571},
		WitheringFire = {spellID = 466990, talentID = 117590},
	--Sentinel
		Sentinel = {spellID = 450369, talentID = 117573},
		DontLookBack = {spellID = 450373, talentID = 117586},
		ExtrapolatedShots = {spellID = 450374, talentID = 117570},
		SentinelPrecision = {spellID = 450375, talentID = 117578},
		ReleaseandReload = {spellID = 450376, talentID = 117555},
		CatchOut = {spellID = 451516, talentID = 117587},
		Sideline = {spellID = 450378, talentID = 123869},
		InvigoratingPulse = {spellID = 450379, talentID = 117568},
		SentinelWatch = {spellID = 451546, talentID = 117567},
		EyesClosed = {spellID = 450381, talentID = 123871},
		SymphonicArsenal = {spellID = 450383, talentID = 117562},
		Overwatch = {spellID = 450384, talentID = 117577},
		CrescentSteel = {spellID = 451530, talentID = 123870},
		LunarStorm = {spellID = 450385, talentID = 117575},
	},
	pvp_talent = {

	},
	buff = {
		bulletstorm = 389020,
		Deathblow = 378770,
		double_tap = 260402,
		PreciseShots = 260242,
		TrickShots = 257622,
		Trueshot = 193526,
		LockandLoad = 194594,
		RazorFragments = 388998,
		streamline = 342076,
		volley = 260243,
	},
	debuff = {
		ExplosiveShot = 212431,
		HuntersMark = 257284,
		lunar_storm = 451803,
		SerpentSting = 271788,
		TarTrap = 135299,
	},
	pet_ability = {
		Bite = {spellID = 17253},
		Claw = {spellID = 16827},
		Smack = {spellID = 49966},
		ChiJisTranquility = {spellID = 264028},
		NaturesGrace = {spellID = 264266},
		NetherShock = {spellID = 264264},
		PrimalRage = {spellID = 264667},
		SerenityDust = {spellID = 264055},
		SonicBlast = {spellID = 264263},
		SporeCloud = {spellID = 264056},
		SoothingWater = {spellID = 264262},
		SpiritShock = {spellID = 264265},
	}
}

ids.survival = {
	ability = {
	--Hunter Baseline
		ArcaneShot = {spellID = 185358},
		AspectoftheCheetah = {spellID = 186257},
		AspectoftheTurtle = {spellID = 186265};
		CallPet = {
			One = {spellID = 883},
			Two = {spellID = 83242},
			Three = {spellID = 83243},
			Four = {spellID = 83244},
			Five = {spellID = 83245},
		},
		CommandPet = {
			PrimalRage = {spellID = 272678},
			FortitudeoftheBear = {spellID = 272679},
			MastersCall = {spellID = 272682},
		},
		Disengage = {spellID = 781},
		EagleEye = {spellID = 6197},
		Exhilaration = {spellID = 109304},
		EyesoftheBeast = {spellID = 321297},
		FeignDeath = {spellID = 5384},
		Flare = {spellID = 1543},
		FreezingTrap = {spellID = 187650},
		HuntersMark = {spellID = 257284},
		PetUtility = {
			BeastLore = {spellID = 1462},
			DismissPet = {spellID = 2641},
			FeedPet = {spellID = 6991},
			RevivePet = {spellID = 982},
			MendPet = {spellID = 136},
			TameBeast = {spellID = 1515},
		},
		SteadyShot = {spellID = 56641},
		WingClip = {spellID = 195645},
	--Survival Baseline
		AspectoftheEagle = {spellID = 186289},
		Harpoon = {spellID = 190925},
		MasterySpiritBond = {spellID = 263135},
	--Hunter
		NaturalMending = {spellID = 270581, talentID = 126465},
		Posthaste = {spellID = 109215, talentID = 126475},
		KillShot = {spellID = 320976, talentID = 126442},
		RejuvenatingWind = {spellID = 385539, talentID = 126444},
		HuntersAvoidance = {spellID = 384799, talentID = 126489},
		Deathblow = {spellID = 343248, talentID = 126474},
		WildernessMedicine = {spellID = 343242, talentID = 126446},
		TarTrap = {spellID = 187698, talentID = 126457},
		TranquilizingShot = {spellID = 19801, talentID = 126443},
		ConcussiveShot = {spellID = 5116, talentID = 126471},
		SurvivaloftheFittest = {spellID = 264735, talentID = 126488},
		Entrapment = {spellID = 393344, talentID = 126467},
		Muzzle = {spellID = 187707, talentID = 100543},
		KodoTranquilizer = {spellID = 459983, talentID = 126480},
		DevilsaurTranquilizer = {spellID = 459991, talentID = 126479},
		Misdirection = {spellID = 34477, talentID = 126484},
		ScoutsInstincts = {spellID = 459455, talentID = 126490},
		PaddedArmor = {spellID = 459450, talentID = 126470},
		LoneSurvivor = {spellID = 388039, talentID = 126454},
		SpecializedArsenal = {spellID = 459542, talentID = 126453},
		DisruptiveRounds = {spellID = 343244, talentID = 126459},
		NoHardFeelings = {spellID = 459546, talentID = 126476},
		ScareBeast = {spellID = 1513, talentID = 126445},
		Intimidation = {spellID = 19577, talentID = 126461},
		ExplosiveShot = {spellID = 212431, talentID = 126485},
		BindingShot = {spellID = 109248, talentID = 126449},
		BurstingShot = {spellID = 186387, talentID = 126487},
		ScatterShot = {spellID = 213691, talentID = 126486},
		TerritorialInstincts = {spellID = 459507, talentID = 126458},
		TriggerFinger = {spellID = 459534, talentID = 126460},
		BlackrockMunitions = {spellID = 462036, talentID = 126456},
		KeenEyesight = {spellID = 378004, talentID = 126473},
		TarCoatedBindings = {spellID = 459460, talentID = 126482},
		Scrappy = {spellID = 459533, talentID = 126472},
		QuickLoad = {spellID = 378771, talentID = 126477},
		Pathfinding = {spellID = 378002, talentID = 126468},
		BindingShackles = {spellID = 321468, talentID = 126451},
		Camouflage = {spellID = 199483, talentID = 126478},
		KindlingFlare = {spellID = 459506, talentID = 126491},
		Trailblazer = {spellID = 199921, talentID = 126464},
		RoarofSacrifice = {spellID = 53480, talentID = 126469},
		SerratedTips = {spellID = 459502, talentID = 126447},
		MomentofOpportunity = {spellID = 459488, talentID = 126492},
		BornToBeWild = {spellID = 266921, talentID = 126481},
		GhillieSuit = {spellID = 459466, talentID = 126448},
		ImprovedTraps = {spellID = 343247, talentID = 126483},
		EmergencySalve = {spellID = 459517, talentID = 126452},
		HighExplosiveTrap = {spellID = 236776, talentID = 126830},
		ImplosiveTrap = {spellID = 462031, talentID = 126829},
		UnnaturalCauses = {spellID = 459527, talentID = 126450},
	--Survival
		KillCommand = {spellID = 259489, talentID = 126314},
		WildfireBomb = {spellID = 259495, talentID = 126324},
		RaptorStrike = {spellID = 186270, talentID = 126322},
			RaptorStrikeRanged = {spellID = 265189, talentID = 126322},
		GuerillaTactics = {spellID = 264332, talentID = 126345},
		TipoftheSpear = {spellID = 260285, talentID = 126323},
		Lunge = {spellID = 378934, talentID = 126332},
		QuickShot = {spellID = 378940, talentID = 126339},
		MongooseBite = {spellID = 259387, talentID = 126316},
			MongooseBiteRanged = {spellID = 265888, talentID = 126316},
		FlankersAdvantage = {spellID = 459964, talentID = 126343},
		WildfireInfusion = {spellID = 460198, talentID = 126325},
		ImprovedWildfireBomb = {spellID = 321290, talentID = 126334},
		SulfurLinedPockets = {spellID = 459828, talentID = 126326},
		Butchery = {spellID = 212436, talentID = 126350},
		FlankingStrike = {spellID = 269751, talentID = 128690},
		BloodyClaws = {spellID = 385737, talentID = 126328},
		AlphaPredator = {spellID = 269737, talentID = 126319},
		Ranger = {spellID = 385695, talentID = 126315},
		GrenadeJuggler = {spellID = 459843, talentID = 126347},
		cull_the_herd = {
			passiveID = 1217429,
			talentID = 126338,
		},
		FrenzyStrikes = {spellID = 294029, talentID = 126346},
		MercilessBlows = {spellID = 459868, talentID = 126327},
		VipersVenom = {spellID = 268501, talentID = 126320},
		Bloodseeker = {spellID = 260248, talentID = 126330},
		TermsofEngagement = {spellID = 265895, talentID = 126348},
		born_to_kill = {
			passiveID = 1217434,
			talentID = 126331
		},
		TacticalAdvantage = {spellID = 378951, talentID = 126337},
		SicEm = {spellID = 459920, talentID = 126340},
		ContagiousReagents = {spellID = 459741, talentID = 126336},
		OutlandVenom = {spellID = 459939, talentID = 126329},
		ExplosivesExpert = {spellID = 378937, talentID = 126341},
		SweepingSpear = {spellID = 378950, talentID = 126349},
		KillerCompanion = {spellID = 378955, talentID = 126342},
		FuryoftheEagle = {spellID = 203415, talentID = 126335},
		CoordinatedAssault = {spellID = 360952, talentID = 126311},
		Spearhead = {spellID = 360966, talentID = 126351},
		RuthlessMarauder = {spellID = 470068, talentID = 126321},
		SymbioticAdrenaline = {spellID = 459875, talentID = 126318},
		RelentlessPrimalFerocity = {spellID = 459922, talentID = 126317},
		Bombardier = {spellID = 389880, talentID = 126333},
		DeadlyDuo = {spellID = 378962, talentID = 126344},
	--Hero
	--Pack Leader
		howl_of_the_pack_leader = {
			passiveID = 471876,
			talentID = 117588
		},
		pack_mentality = {
			passiveID = 472358,
			talentID = 117582
		},
		dire_summons = {
			passiveID = 472352,
			talentID = 117589,
		},
		better_together = {
			passiveID = 472357,
			talentID = 117559
		},
		ursine_fury = {
			passiveID = 472476,
			talentID = 117569
		},
		envenomed_fangs = {
			passiveID = 472524,
			talentID = 128358
		},
		fury_of_the_wyvern = {
			passiveID = 472550,
			talentID = 117581
		},
		hogstrider = {
			passiveID = 472639,
			talentID = 117585
		},
		no_mercy = {
			passiveID = 472660,
			talentID = 117566
		},
		shell_cover = {
			passiveID = 472707,
			talentID = 117564
		},
		slicked_shoes = {
			passiveID = 472719,
			talentID = 117576
		},
		horsehair_tether = {
			passiveID = 472729,
			talentID = 123781
		},
		lead_from_the_front = {
			passiveID = 472741,
			talentID = 117563
		},
	--Sentinel
		Sentinel = {spellID = 450369, talentID = 117573},
		DontLookBack = {spellID = 450373, talentID = 117586},
		ExtrapolatedShots = {spellID = 450374, talentID = 117570},
		SentinelPrecision = {spellID = 450375, talentID = 117578},
		ReleaseandReload = {spellID = 450376, talentID = 117555},
		CatchOut = {spellID = 451516, talentID = 117587},
		Sideline = {spellID = 450378, talentID = 123869},
		InvigoratingPulse = {spellID = 450379, talentID = 117568},
		SentinelWatch = {spellID = 451546, talentID = 117567},
		EyesClosed = {spellID = 450381, talentID = 123871},
		SymphonicArsenal = {spellID = 450383, talentID = 117562},
		Overwatch = {spellID = 450384, talentID = 117577},
		CrescentSteel = {spellID = 451530, talentID = 123870},
		LunarStorm = {spellID = 450385, talentID = 117575},
	},
	pvp_talent = {

	},
	buff = {
		AspectoftheEagle = 186289,
		CoordinatedAssault = 266779,
		DeadlyDuo = 397568,
		Deathblow = 378770,
		MongooseFury = 259388,
		Spearhead = 360966,
		TermsofEngagement = 262898,
		TipoftheSpear = 260286,
		VipersVenom = 268552,
	},
	debuff = {
		HuntersMark = 257284,
		InternalBleeding = 270343,
		lunar_storm = 451803,
		SerpentSting = 259491,
		TarTrap = 135299,
		WildfireBomb = 269747,
	},
	pet_ability = {
		Bite = {spellID = 17253},
		Claw = {spellID = 16827},
		Smack = {spellID = 49966},
		ChiJisTranquility = {spellID = 264028},
		NaturesGrace = {spellID = 264266},
		NetherShock = {spellID = 264264},
		PrimalRage = {spellID = 264667},
		SerenityDust = {spellID = 264055},
		SonicBlast = {spellID = 264263},
		SporeCloud = {spellID = 264056},
		SoothingWater = {spellID = 264262},
		SpiritShock = {spellID = 264265},
	}
}