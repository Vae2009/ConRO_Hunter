ConRO.Hunter = {};
ConRO.Hunter.CheckTalents = function()
end
ConRO.Hunter.CheckPvPTalents = function()
end
local ConRO_Hunter, ids = ...;
local Ability, Buff, Debuff, PvP_Talent, Pet_Ability = _, _, _, _, _;

function ConRO:EnableRotationModule(mode)
	mode = mode or 0;
	self.ModuleOnEnable = ConRO.Hunter.CheckTalents;
	self.ModuleOnEnable = ConRO.Hunter.CheckPvPTalents;
	if mode == 0 then
		self.Description = "Hunter [No Specialization Under 10]";
		self.NextSpell = ConRO.Hunter.Disabled;
		self.NextDef = ConRO.Hunter.Disabled;
		self.ToggleHealer();
	end;
	if mode == 1 then
		self.Description = 'Hunter [Beast Mastery - Ranged]';
		if ConRO.db.profile._Spec_1_Enabled then
			Ability, Buff, Debuff, PvPTalent, Pet_Ability = ids.beast_mastery.ability, ids.beast_mastery.buff, ids.beast_mastery.debuff, ids.beast_mastery.pvp_talent, ids.beast_mastery.pet_ability;
			self.NextSpell = ConRO.Hunter.BeastMastery;
			self.NextDef = ConRO.Hunter.BeastMasteryDef;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Hunter.Disabled;
			self.NextDef = ConRO.Hunter.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);
		end
	end;
	if mode == 2 then
		self.Description = 'Hunter [Marksmanship - Ranged]';
		if ConRO.db.profile._Spec_2_Enabled then
			Ability, Buff, Debuff, PvPTalent, Pet_Ability = ids.marksmanship.ability, ids.marksmanship.buff, ids.marksmanship.debuff, ids.marksmanship.pvp_talent, ids.marksmanship.pet_ability;
			self.NextSpell = ConRO.Hunter.Marksmanship;
			self.NextDef = ConRO.Hunter.MarksmanshipDef;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Hunter.Disabled;
			self.NextDef = ConRO.Hunter.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);
		end
	end;
	if mode == 3 then
		self.Description = 'Hunter [Survival - Melee]';
		if ConRO.db.profile._Spec_3_Enabled then
			Ability, Buff, Debuff, PvPTalent, Pet_Ability = ids.survival.ability, ids.survival.buff, ids.survival.debuff, ids.survival.pvp_talent, ids.survival.pet_ability;
			self.NextSpell = ConRO.Hunter.Survival;
			self.NextDef = ConRO.Hunter.SurvivalDef;
			self.ToggleDamage();
			ConROWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
			ConRODefenseWindow:SetAlpha(ConRO.db.profile.transparencyWindow);
		else
			self.NextSpell = ConRO.Hunter.Disabled;
			self.NextDef = ConRO.Hunter.Disabled;
			self.ToggleHealer();
			ConROWindow:SetAlpha(0);
			ConRODefenseWindow:SetAlpha(0);
		end
	end;
	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;
end

function ConRO:EnableDefenseModule(mode)

end

function ConRO:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' and spellID ~= 75 then
		self.lastSpellId = spellID;
	end
end

function ConRO.Hunter.Disabled(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	return nil;
end

--Info
local _Player_Level = UnitLevel("player");
local _Player_Percent_Health = ConRO:PercentHealth('player');
local _is_PvP = ConRO:IsPvP();
local _in_combat = UnitAffectingCombat('player');
local _party_size = GetNumGroupMembers();
local _is_PC = UnitPlayerControlled("target");
local _is_Enemy = ConRO:TarHostile();
local _Target_Health = UnitHealth('target');
local _Target_Percent_Health = ConRO:PercentHealth('target');

--Resources
local _Focus, _Focus_Max = ConRO:PlayerPower('Focus');
local _Heroism_BUFF, _Sated_DEBUFF = ConRO:Heroism();

--Conditions
local _Queue = 0;
local _is_moving = ConRO:PlayerSpeed();
local _enemies_in_melee, _target_in_melee = ConRO:Targets("Melee");
local _enemies_in_10yrds, _target_in_10yrds = ConRO:Targets("10");
local _enemies_in_25yrds, _target_in_25yrds = ConRO:Targets("25");
local _enemies_in_40yrds, _target_in_40yrds = ConRO:Targets("40");
local _can_Execute = _Target_Percent_Health < 20;

--Racials
local _AncestralCall, _AncestralCall_RDY = _, _;
local _ArcanePulse, _ArcanePulse_RDY = _, _;
local _ArcaneTorrent, _ArcaneTorrent_RDY = _, _;
local _Berserking, _Berserking_RDY = _, _;

local HeroSpec, Racial = ids.hero_spec, ids.racial;

function ConRO:Stats()
	_Player_Level = UnitLevel("player");
	_Player_Percent_Health = ConRO:PercentHealth('player');
	_is_PvP = ConRO:IsPvP();
	_in_combat = UnitAffectingCombat('player');
	_party_size = GetNumGroupMembers();
	_is_PC = UnitPlayerControlled("target");
	_is_Enemy = ConRO:TarHostile();
	_Target_Health = UnitHealth('target');
	_Target_Percent_Health = ConRO:PercentHealth('target');

	_Focus, _Focus_Max = ConRO:PlayerPower('Focus');
	_Heroism_BUFF, _Sated_DEBUFF = ConRO:Heroism();

	_Queue = 0;
	_is_moving = ConRO:PlayerSpeed();
	_enemies_in_melee, _target_in_melee = ConRO:Targets("Melee");
	_enemies_in_10yrds, _target_in_10yrds = ConRO:Targets("10");
	_enemies_in_25yrds, _target_in_25yrds = ConRO:Targets("25");
	_enemies_in_40yrds, _target_in_40yrds = ConRO:Targets("40");
	_can_Execute = _Target_Percent_Health < 20;

	_AncestralCall, _AncestralCall_RDY = ConRO:AbilityReady(Racial.AncestralCall, timeShift);
	_ArcanePulse, _ArcanePulse_RDY = ConRO:AbilityReady(Racial.ArcanePulse, timeShift);
	_ArcaneTorrent, _ArcaneTorrent_RDY = ConRO:AbilityReady(Racial.ArcaneTorrent, timeShift);
	_Berserking, _Berserking_RDY = ConRO:AbilityReady(Racial.Berserking, timeShift);
end

function ConRO.Hunter.BeastMastery(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells);
	ConRO:Stats();

--Abilities
	local _ArcaneShot, _ArcaneShot_RDY = ConRO:AbilityReady(Ability.ArcaneShot, timeShift);
	local _BarbedShot, _BarbedShot_RDY, _BarbedShot_CD = ConRO:AbilityReady(Ability.BarbedShot, timeShift);
		local _BarbedShot_CHARGES, _BarbedShot_MaxCHARGES, _BarbedShot_CCD = ConRO:SpellCharges(_BarbedShot);
		local _Frenzy_BUFF, _Frenzy_COUNT, _Frenzy_DUR = ConRO:UnitAura(Buff.Frenzy, timeShift, 'pet');
	local _Barrage, _Barrage_RDY = ConRO:AbilityReady(Ability.Barrage, timeShift);
	local _BestialWrath, _BestialWrath_RDY, _BestialWrath_CD = ConRO:AbilityReady(Ability.BestialWrath, timeShift);
		local _BestialWrath_BUFF = ConRO:Aura(Buff.BestialWrath, timeShift);
	local _Bloodshed, _Bloodshed_RDY = ConRO:AbilityReady(Ability.Bloodshed, timeShift);
	local _CalloftheWild, _CalloftheWild_RDY, _CalloftheWild_CD = ConRO:AbilityReady(Ability.CalloftheWild, timeShift);
		local _CalloftheWild_BUFF= ConRO:Aura(Buff.CalloftheWild, timeShift);
	local _CallPet, _CallPet_RDY = ConRO:AbilityReady(Ability.CallPet.One, timeShift);
	local _CounterShot, _CounterShot_RDY = ConRO:AbilityReady(Ability.CounterShot, timeShift);
	local _DireBeast, _DireBeast_RDY, _DireBeast_CD = ConRO:AbilityReady(Ability.DireBeast, timeShift);
	local _ExplosiveShot, _ExplosiveShot_RDY = ConRO:AbilityReady(Ability.ExplosiveShot, timeShift);
		local _, _Hogstrider_COUNT = ConRO:Aura(Buff.hogstrider, timeShift);
	local _HuntersMark, _HuntersMark_RDY = ConRO:AbilityReady(Ability.HuntersMark, timeShift);
		local _HuntersMark_DEBUFF = ConRO:PersistentDebuff(Debuff.HuntersMark);
	local _KillCommand, _KillCommand_RDY, _KillCommand_CD = ConRO:AbilityReady(Ability.KillCommand, timeShift);
		local _KillCommand_CHARGES, _KillCommand_MaxCHARGES = ConRO:SpellCharges(_KillCommand);
	local _KillShot, _KillShot_RDY = ConRO:AbilityReady(Ability.KillShot, timeShift);
		local _Deathblow_BUFF = ConRO:Aura(Buff.Deathblow, timeShift);
	local _MultiShot, _MultiShot_RDY = ConRO:AbilityReady(Ability.MultiShot, timeShift);
		local _BeastCleave_BUFF, _, _BeastCleave_DUR = ConRO:Aura(Buff.BeastCleave, timeShift);
	local _PrimalRageCR = ConRO:AbilityReady(Ability.CommandPet.PrimalRage, timeShift);
	local _PrimalRage, _PrimalRage_RDY = ConRO:AbilityReady(Pet_Ability.PrimalRage, timeShift, 'pet');
	local _SteadyShot, _SteadyShot_RDY = ConRO:AbilityReady(Ability.SteadyShot, timeShift);
		local _SerpentSting_DEBUFF, _, _SerpentSting_DUR = ConRO:Aura(Debuff.SerpentSting, timeShift);
	local _TranquilizingShot, _TranquilizingShot_RDY = ConRO:AbilityReady(Ability.TranquilizingShot, timeShift);

--Conditions
	local _Pet_summoned = ConRO:CallPet();
	local _Pet_assist = ConRO:PetAssist();
	local _Pet_Percent_Health = ConRO:PercentHealth('pet');

	if tChosen[Ability.CobraShot.talentID] then
		_ArcaneShot, _ArcaneShot_RDY = ConRO:AbilityReady(Ability.CobraShot, timeShift);
	end

	if tChosen[Ability.PackTactics.talentID] then
		_SteadyShot_RDY = false;
	end

	local _CAN_KillShot = _Target_Percent_Health <= 20;
	if ConRO:HeroSpec(HeroSpec.DarkRanger) then
		_KillShot, _KillShot_RDY = ConRO:AbilityReady(Ability.BlackArrow, timeShift);
		_CAN_KillShot = _Target_Percent_Health <= 20 or _Target_Percent_Health >= 80;
	end

--Indicators
	ConRO:AbilityInterrupt(_CounterShot, _CounterShot_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());
	ConRO:AbilityPurge(_TranquilizingShot, _TranquilizingShot_RDY and ConRO:Purgable());

	ConRO:AbilityBurst(_BestialWrath, _BestialWrath_RDY and _in_combat and ConRO:BurstMode(_BestialWrath));
	ConRO:AbilityBurst(_Bloodshed, _Bloodshed_RDY and _in_combat and ConRO:BurstMode(_Bloodshed));
	ConRO:AbilityBurst(_CalloftheWild, _CalloftheWild_RDY and _in_combat and ConRO:BurstMode(_CalloftheWild));
	ConRO:AbilityBurst(_PrimalRage, _PrimalRage_RDY and ConRO:IsSolo() and _in_combat and not _Heroism_BUFF and not _Sated_DEBUFF);
	ConRO:AbilityBurst(_PrimalRageCR, _PrimalRage_RDY and ConRO:IsSolo() and _in_combat and not _Heroism_BUFF and not _Sated_DEBUFF);
	ConRO:AbilityBurst(_HuntersMark, _HuntersMark_RDY and not _HuntersMark_DEBUFF and _Target_Percent_Health > 80);

--Warnings
	ConRO:Warnings("Call your pet!", _CallPet_RDY and not _Pet_summoned);

--Rotations
	repeat
		while(true) do
			if not _in_combat then
				if _HuntersMark_RDY and not _HuntersMark_DEBUFF then
					tinsert(ConRO.SuggestedSpells, _HuntersMark);
					_HuntersMark_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if _BarbedShot_RDY and _BarbedShot_CHARGES >= 1 then
					tinsert(ConRO.SuggestedSpells, _BarbedShot);
					_BarbedShot_CHARGES = _BarbedShot_CHARGES - 1;
					_Frenzy_BUFF = true;
					_Frenzy_DUR = 14;
					_Frenzy_COUNT = _Frenzy_COUNT + 1;
					_Queue = _Queue + 1;
					break;
				end
			end

			if _BestialWrath_RDY and ConRO:FullMode(_BestialWrath) then
				tinsert(ConRO.SuggestedSpells, _BestialWrath);
				_BestialWrath_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _BarbedShot_RDY and ((_Frenzy_BUFF and _Frenzy_DUR < 1.5 and _Frenzy_DUR > .25) or (_BarbedShot_CHARGES >= _BarbedShot_MaxCHARGES - 1 and _BarbedShot_CCD <= 3 and not _Frenzy_BUFF) or (_Frenzy_COUNT < 3 and _BarbedShot_CHARGES >= 1 and (_CalloftheWild_CD < 3 or _CalloftheWild_RDY) and tChosen[Ability.CalloftheWild.talentID])) then
				tinsert(ConRO.SuggestedSpells, _BarbedShot);
				_BarbedShot_CHARGES = _BarbedShot_CHARGES - 1;
				_Frenzy_BUFF = true;
				_Frenzy_DUR = 14;
				_Frenzy_COUNT = _Frenzy_COUNT + 1;
				_Queue = _Queue + 1;
				break;
			end

			if _Barrage_RDY and _Focus >= 60 and tChosen[Ability.BeastCleave.talentID] and _BeastCleave_DUR < 1.5 and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 3) or ConRO_AoEButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _Barrage);
				_Barrage_RDY = false;
				_Focus = _Focus - 60;
				_Queue = _Queue + 1;
				break;
			end

			if _MultiShot_RDY and _Focus >= 40 and tChosen[Ability.BeastCleave.talentID] and _BeastCleave_DUR < 1.5 and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 3) or ConRO_AoEButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _MultiShot);
				_BeastCleave_BUFF = true;
				_BeastCleave_DUR = 6;
				_Focus = _Focus - 40;
				_Queue = _Queue + 1;
				break;
			end

			if _KillShot_RDY and (_CAN_KillShot or _Deathblow_BUFF) and _BeastCleave_BUFF and ConRO:HeroSpec(HeroSpec.DarkRanger) and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 3) or ConRO_AoEButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _KillShot);
				_KillShot_RDY = false;
				_Deathblow_BUFF = false;
				_Queue = _Queue + 1;
				break;
			end

			if _DireBeast_RDY and tChosen[Ability.HuntmastersCall.talentID] and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds <= 1) or ConRO_SingleButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _DireBeast);
				_DireBeast_RDY = false;
				_Focus = _Focus + 20;
				_Queue = _Queue + 1;
				break;
			end

			if _KillCommand_RDY and _Focus >= 30 and _KillCommand_CHARGES >= 1 and (_CalloftheWild_CD < 3 or _CalloftheWild_RDY) and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds <= 1) or ConRO_SingleButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _KillCommand);
				_KillCommand_CHARGES = _KillCommand_CHARGES - 1;
				_Focus = _Focus - 30;
				_Queue = _Queue + 1;
				break;
			end

			if _CalloftheWild_RDY and ConRO:FullMode(_CalloftheWild) then
				tinsert(ConRO.SuggestedSpells, _CalloftheWild);
				_CalloftheWild_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _Bloodshed_RDY and ConRO:FullMode(_Bloodshed) then
				tinsert(ConRO.SuggestedSpells, _Bloodshed);
				_Bloodshed_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _DireBeast_RDY and _BeastCleave_BUFF and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 3) or ConRO_AoEButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _DireBeast);
				_DireBeast_RDY = false;
				_Focus = _Focus + 20;
				_Queue = _Queue + 1;
				break;
			end

			if _BarbedShot_RDY and _BarbedShot_CHARGES >= 1 and _BarbedShot_CCD <= 3 and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 3) or ConRO_AoEButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _BarbedShot);
				_BarbedShot_CHARGES = _BarbedShot_CHARGES - 1;
				_Frenzy_BUFF = true;
				_Frenzy_DUR = 14;
				_Frenzy_COUNT = _Frenzy_COUNT + 1;
				_Queue = _Queue + 1;
				break;
			end

			if _KillShot_RDY and (_CAN_KillShot or _Deathblow_BUFF) and ConRO:HeroSpec(HeroSpec.DarkRanger) and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds <= 1) or ConRO_SingleButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _KillShot);
				_KillShot_RDY = false;
				_Deathblow_BUFF = false;
				_Queue = _Queue + 1;
				break;
			end

			if _KillCommand_RDY and _Focus >= 30 and _KillCommand_CHARGES >= 1 then
				tinsert(ConRO.SuggestedSpells, _KillCommand);
				_KillCommand_CHARGES = _KillCommand_CHARGES - 1;
				_Focus = _Focus - 30;
				_Queue = _Queue + 1;
				break;
			end

			if _BarbedShot_RDY and _BarbedShot_CHARGES >= 1 then
				tinsert(ConRO.SuggestedSpells, _BarbedShot);
				_BarbedShot_CHARGES = _BarbedShot_CHARGES - 1;
				_Frenzy_BUFF = true;
				_Frenzy_DUR = 14;
				_Frenzy_COUNT = _Frenzy_COUNT + 1;
				_Queue = _Queue + 1;
				break;
			end

			if _ExplosiveShot_RDY and _Focus >= 20 and tChosen[Ability.thundering_hooves.talentID] then
				tinsert(ConRO.SuggestedSpells, _ExplosiveShot);
				_ExplosiveShot_RDY = false;
				_Focus = _Focus - 20;
				_Queue = _Queue + 1;
				break;
			end

			if _ArcaneShot_RDY and _Focus >= 35 and (_Hogstrider_COUNT >= 4 or (ConRO_AutoButton:IsVisible() and _enemies_in_40yrds <= 1) or ConRO_SingleButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _ArcaneShot);
				_Focus = _Focus - 35;
				_Queue = _Queue + 1;
				break;
			end

			if _DireBeast_RDY then
				tinsert(ConRO.SuggestedSpells, _DireBeast);
				_DireBeast_RDY = false;
				_Focus = _Focus + 20;
				_Queue = _Queue + 1;
				break;
			end

			if _ArcaneShot_RDY and _Focus >= 35 and _Focus >= _Focus_Max - 20 and ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 3) or ConRO_AoEButton:IsVisible()) then
				tinsert(ConRO.SuggestedSpells, _ArcaneShot);
				_Focus = _Focus - 35;
				_Queue = _Queue + 1;
				break;
			end

			tinsert(ConRO.SuggestedSpells, 75); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
return nil;
end

function ConRO.Hunter.BeastMasteryDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();

--Abilities
	local _Exhilaration, _Exhilaration_RDY = ConRO:AbilityReady(Ability.Exhilaration, timeShift);
	local _AspectoftheTurtle, _AspectoftheTurtle_RDY = ConRO:AbilityReady(Ability.AspectoftheTurtle, timeShift);
	local _MendPet, _MendPet_RDY = ConRO:AbilityReady(Ability.PetUtility.MendPet, timeShift);
	local _FeedPet, _FeedPet_RDY = ConRO:AbilityReady(Ability.PetUtility.FeedPet, timeShift);

--Conditions
	local _Pet_summoned = ConRO:CallPet();
	local _Pet_assist = ConRO:PetAssist();
	local _Pet_Percent_Health = ConRO:PercentHealth('pet');

--Rotations	
		if _FeedPet_RDY and not _in_combat and _Pet_summoned and _Pet_Percent_Health <= 60 then
			tinsert(ConRO.SuggestedDefSpells, _FeedPet);
		end

		if _Exhilaration_RDY and (_Player_Percent_Health <= 50 or _Pet_Percent_Health <= 20) then
			tinsert(ConRO.SuggestedDefSpells, _Exhilaration);
		end

		if _MendPet_RDY and _Pet_summoned and _Pet_Percent_Health <= 60 then
			tinsert(ConRO.SuggestedDefSpells, _MendPet);
		end

		if _AspectoftheTurtle_RDY then
			tinsert(ConRO.SuggestedDefSpells, _AspectoftheTurtle);
		end
	return nil;
end

function ConRO.Hunter.Marksmanship(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells);
	ConRO:Stats();

--Abilities	
	local _AimedShot, _AimedShot_RDY = ConRO:AbilityReady(Ability.AimedShot, timeShift);
		local _AimedShot_CHARGES = ConRO:SpellCharges(_AimedShot);
	local _ArcaneShot, _ArcaneShot_RDY = ConRO:AbilityReady(Ability.ArcaneShot, timeShift);
	local _CounterShot, _CounterShot_RDY = ConRO:AbilityReady(Ability.CounterShot, timeShift);
	local _Disengage, _Disengage_RDY = ConRO:AbilityReady(Ability.Disengage, timeShift);
	local _ExplosiveShot, _ExplosiveShot_RDY = ConRO:AbilityReady(Ability.ExplosiveShot, timeShift);
	local _HuntersMark, _HuntersMark_RDY = ConRO:AbilityReady(Ability.HuntersMark, timeShift);
	local _KillShot, _KillShot_RDY = ConRO:AbilityReady(Ability.KillShot, timeShift);
		local _KillShot_CHARGES = ConRO:SpellCharges(_KillShot);
	local _MultiShot, _MultiShot_RDY = ConRO:AbilityReady(Ability.MultiShot, timeShift);
	local _PrimalRageCR = ConRO:AbilityReady(Ability.CommandPet.PrimalRage, timeShift);
	local _PrimalRage, _PrimalRage_RDY = ConRO:AbilityReady(Pet_Ability.PrimalRage, timeShift, 'pet');
	local _RapidFire, _RapidFire_RDY = ConRO:AbilityReady(Ability.RapidFire, timeShift);
	local _SteadyShot, _SteadyShot_RDY = ConRO:AbilityReady(Ability.SteadyShot, timeShift);
	local _TranquilizingShot, _TranquilizingShot_RDY = ConRO:AbilityReady(Ability.TranquilizingShot, timeShift);
	local _Trueshot, _Trueshot_RDY = ConRO:AbilityReady(Ability.Trueshot, timeShift);
	local _Volley, _Volley_RDY = ConRO:AbilityReady(Ability.Volley, timeShift);

--Auras
	local bulletstorm_BUFF = ConRO:Aura(Buff.bulletstorm, timeShift);
	local _Deathblow_BUFF = ConRO:Aura(Buff.Deathblow, timeShift);
	local double_tap_BUFF = ConRO:Aura(Buff.double_tap);
	local _LockandLoad_BUFF = ConRO:Aura(Buff.LockandLoad, timeShift);
	local _PreciseShot_BUFF = ConRO:Aura(Buff.PreciseShot, timeShift);
	local _RazorFragments_BUFF = ConRO:Aura(Buff.RazorFragments, timeShift);
	local streamline_BUFF, streamline_COUNT = ConRO:Aura(Buff.streamline, timeShift);
	local _TrickShots_BUFF = ConRO:Aura(Buff.TrickShots, timeShift);
	local _Trueshot_BUFF = ConRO:Aura(Buff.Trueshot, timeShift);
	local volley_BUFF = ConRO:Aura(Buff.volley, timeShift);

	local lunar_storm_DEBUFF, _, lunar_storm_DUR = ConRO:Aura(Debuff.lunar_storm, timeShift, 'HARMFUL');

	local _ExplosiveShot_DEBUFF = ConRO:TargetAura(Debuff.ExplosiveShot, timeShift);
	local _HuntersMark_DEBUFF = ConRO:PersistentDebuff(Debuff.HuntersMark);
	local _SerpentSting_DEBUFF = ConRO:TargetAura(Debuff.SerpentSting, timeShift);

--Conditions
	local _Pet_summoned = ConRO:CallPet();
	local _Pet_assist = ConRO:PetAssist();
	local _Pet_Percent_Health = ConRO:PercentHealth('pet');

	local _ArcaneShot_COST = 40;
	local _MultiShot_COST = 30;
	local _AimedShot_COST = 35;

	local _CAN_KillShot = _Target_Percent_Health <= 20;
	if ConRO:HeroSpec(HeroSpec.DarkRanger) then
		_KillShot, _KillShot_RDY = ConRO:AbilityReady(Ability.BlackArrow, timeShift);
		_CAN_KillShot = _Target_Percent_Health <= 20 or _Target_Percent_Health >= 80;
	end

	if currentSpell == _AimedShot then
		_TrickShots_BUFF = false;
		_Focus = _Focus - _AimedShot_COST;
		_AimedShot_CHARGES = _AimedShot_CHARGES - 1;
	end

	if select(2, ConRO:EndChannel()) == _RapidFire then
		_TrickShots_BUFF = false;
	end

--Indicators
	ConRO:AbilityInterrupt(_CounterShot, _CounterShot_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());
	ConRO:AbilityPurge(_TranquilizingShot, _TranquilizingShot_RDY and ConRO:Purgable());
	ConRO:AbilityMovement(_Disengage, _Disengage_RDY and _target_in_melee);

	ConRO:AbilityBurst(_Trueshot, _Trueshot_RDY and _AimedShot_CHARGES >= 1 and ConRO:BurstMode(_Trueshot));
	ConRO:AbilityBurst(_Volley, _Volley_RDY and (_RapidFire_RDY or _AimedShot_RDY) and ConRO:BurstMode(_Volley));
	ConRO:AbilityBurst(_PrimalRage, _PrimalRage_RDY and _party_size <= 1 and _in_combat and not _Heroism_BUFF and not _Sated_DEBUFF);
	ConRO:AbilityBurst(_PrimalRageCR, _PrimalRage_RDY and _party_size <= 1 and _in_combat and not _Heroism_BUFF and not _Sated_DEBUFF);
	ConRO:AbilityBurst(_HuntersMark, _HuntersMark_RDY and not _HuntersMark_DEBUFF and _Target_Percent_Health > 80);

--Warnings

--Rotations
	repeat
		while(true) do
			if volley_BUFF then
				_TrickShots_BUFF = true;
			end

			if _PreciseShot_BUFF then
				_ArcaneShot_COST = _ArcaneShot_COST * 0.6;
				_MultiShot_COST = _MultiShot_COST * 0.6;
			end

			if streamline_BUFF then
				if tChosen[Ability.tensile_bowstring.talentID] and _Trueshot_BUFF then
					if streamline_COUNT == 2 then
						_AimedShot_COST = _AimedShot_COST * 0.4;
					else
						_AimedShot_COST = _AimedShot_COST * 0.7;
					end
				else
					if streamline_COUNT == 2 then
						_AimedShot_COST = _AimedShot_COST * 0.6;
					else
						_AimedShot_COST = _AimedShot_COST * 0.8;
					end
				end
			end

			if _LockandLoad_BUFF then
				_AimedShot_COST = 0;
			end
		--Opener
			if not _in_combat then
				if _HuntersMark_RDY and not _HuntersMark_DEBUFF and _Target_Percent_Health > 80 then
					tinsert(ConRO.SuggestedSpells, _HuntersMark);
					_HuntersMark_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 3) or ConRO_AoEButton:IsVisible()) then
					if _SteadyShot_RDY and currentSpell ~= _SteadyShot then
						tinsert(ConRO.SuggestedSpells, _SteadyShot);
						_SteadyShot_RDY = false;
						_Focus = _Focus + 20;
						_Queue = _Queue + 1;
						break;
					end

					if _MultiShot_RDY and _Focus >= _MultiShot_COST and not _TrickShots_BUFF and ConRO:HeroSpec(HeroSpec.DarkRanger) then
						tinsert(ConRO.SuggestedSpells, _MultiShot);
						_TrickShots_BUFF = true;
						_PreciseShot_BUFF = false;
						_Focus = _Focus - _MultiShot_COST;
						_Queue = _Queue + 1;
						break;
					end

					if _KillShot_RDY and _Focus >= 10 and _KillShot_CHARGES >= 1 and (_CAN_KillShot or _Deathblow_BUFF) and ConRO:HeroSpec(HeroSpec.DarkRanger) then
						tinsert(ConRO.SuggestedSpells, _KillShot);
						_KillShot_CHARGES = _KillShot_CHARGES - 1;
						_Deathblow_BUFF = false;
						_TrickShots_BUFF = false;
						if tChosen[Ability.headshot.talentID] then
							_PreciseShot_BUFF = false;
						end
						_Focus = _Focus - 10;
						_Queue = _Queue + 1;
						break;
					end

					if _ExplosiveShot_RDY and _Focus >= 20 and not _ExplosiveShot_DEBUFF and not tChosen[Ability.precision_detonation.talentID] then
						tinsert(ConRO.SuggestedSpells, _ExplosiveShot);
						_ExplosiveShot_RDY = false;
						_ExplosiveShot_DEBUFF = true;
						_Focus = _Focus - 20;
						_Queue = _Queue + 1;
						break;
					end

					if _Volley_RDY and not double_tap_BUFF and ConRO:FullMode(_Volley) then
						tinsert(ConRO.SuggestedSpells, _Volley);
						_Volley_RDY = false;
						volley_BUFF = true;
						_TrickShots_BUFF = true;
						if tChosen[Ability.double_tap.talentID] then
							double_tap_BUFF = true;
						end
						_Queue = _Queue + 1;
						break;
					end

					if _MultiShot_RDY and _Focus >= _MultiShot_COST and not _TrickShots_BUFF then
						tinsert(ConRO.SuggestedSpells, _MultiShot);
						_TrickShots_BUFF = true;
						_PreciseShot_BUFF = false;
						_Focus = _Focus - _MultiShot_COST;
						_Queue = _Queue + 1;
						break;
					end

					if _RapidFire_RDY then
						tinsert(ConRO.SuggestedSpells, _RapidFire);
						_RapidFire_RDY = false;
						_TrickShots_BUFF = false;
						lunar_storm_DEBUFF = true;
						streamline_BUFF = true;
						streamline_COUNT = streamline_COUNT + 1;
						if tChosen[Ability.no_scope.talentID] then
							_PreciseShot_BUFF = true;
						end
						_Queue = _Queue + 1;
						break;
					end

					if _ExplosiveShot_RDY and _Focus >= 20 and not _ExplosiveShot_DEBUFF and tChosen[Ability.precision_detonation.talentID] then
						tinsert(ConRO.SuggestedSpells, _ExplosiveShot);
						_ExplosiveShot_RDY = false;
						_ExplosiveShot_DEBUFF = true;
						streamline_BUFF = true;
						_Focus = _Focus - 20;
						_Queue = _Queue + 1;
						break;
					end

					if _AimedShot_RDY and _Focus >= _AimedShot_COST and _AimedShot_CHARGES >= 1 and currentSpell ~= _AimedShot then
						tinsert(ConRO.SuggestedSpells, _AimedShot);
						_AimedShot_CHARGES = _AimedShot_CHARGES - 1;
						_PreciseShot_BUFF = true;
						if _LockandLoad_BUFF then
							_LockandLoad_BUFF = false;
						else
							streamline_BUFF = false;
						end
						_Focus = _Focus - _AimedShot_COST;
						_Queue = _Queue + 1;
						break;
					end
				else
					if _AimedShot_RDY and _Focus >= _AimedShot_COST and _AimedShot_CHARGES >= 1 and currentSpell ~= _AimedShot then
						tinsert(ConRO.SuggestedSpells, _AimedShot);
						_AimedShot_CHARGES = _AimedShot_CHARGES - 1;
						_PreciseShot_BUFF = true;
						if _LockandLoad_BUFF then
							_LockandLoad_BUFF = false;
						else
							streamline_BUFF = false;
						end
						_Focus = _Focus - _AimedShot_COST;
						_Queue = _Queue + 1;
						break;
					end

					if _KillShot_RDY and _Focus >= 10 and _KillShot_CHARGES >= 1 and (_CAN_KillShot or _Deathblow_BUFF) and ConRO:HeroSpec(HeroSpec.DarkRanger) then
						tinsert(ConRO.SuggestedSpells, _KillShot);
						_KillShot_CHARGES = _KillShot_CHARGES - 1;
						_Deathblow_BUFF = false;
						_TrickShots_BUFF = false;
						if tChosen[Ability.headshot.talentID] then
							_PreciseShot_BUFF = false;
						end
						_Focus = _Focus - 10;
						_Queue = _Queue + 1;
						break;
					end

					if _RapidFire_RDY then
						tinsert(ConRO.SuggestedSpells, _RapidFire);
						_RapidFire_RDY = false;
						_TrickShots_BUFF = false;
						lunar_storm_DEBUFF = true;
						streamline_BUFF = true;
						streamline_COUNT = streamline_COUNT + 1;
						if tChosen[Ability.no_scope.talentID] then
							_PreciseShot_BUFF = true;
						end
						_Queue = _Queue + 1;
						break;
					end

					if _ExplosiveShot_RDY and _Focus >= 20 and not _ExplosiveShot_DEBUFF and not tChosen[Ability.precision_detonation.talentID] then
						tinsert(ConRO.SuggestedSpells, _ExplosiveShot);
						_ExplosiveShot_RDY = false;
						_ExplosiveShot_DEBUFF = true;
						_Focus = _Focus - 20;
						_Queue = _Queue + 1;
						break;
					end
				end
			end
		--
			if _Volley_RDY and not double_tap_BUFF and ConRO:FullMode(_Volley) then
				tinsert(ConRO.SuggestedSpells, _Volley);
				_Volley_RDY = false;
				volley_BUFF = true;
				_TrickShots_BUFF = true;
				if tChosen[Ability.double_tap.talentID] then
					double_tap_BUFF = true;
				end
				_Queue = _Queue + 1;
				break;
			end

			if _RapidFire_RDY and ((tChosen[Ability.Bulletstorm.talentID] and not bulletstorm_BUFF) or (ConRO:HeroSpec(HeroSpec.Sentinel) and tChosen[Ability.LunarStorm.talentID] and not lunar_storm_DEBUFF)) then
				tinsert(ConRO.SuggestedSpells, _RapidFire);
				_RapidFire_RDY = false;
				_TrickShots_BUFF = false;
				lunar_storm_DEBUFF = true;
				streamline_BUFF = true;
				streamline_COUNT = streamline_COUNT + 1;
				if tChosen[Ability.no_scope.talentID] then
					_PreciseShot_BUFF = true;
				end
				_Queue = _Queue + 1;
				break;
			end

			if _Trueshot_RDY and not double_tap_BUFF and streamline_BUFF and ConRO:FullMode(_Trueshot) then
				tinsert(ConRO.SuggestedSpells, _Trueshot);
				_Trueshot_RDY = false;
				if tChosen[Ability.double_tap.talentID] then
					double_tap_BUFF = true;
				end
				_Queue = _Queue + 1;
				break;
			end

			if _KillShot_RDY and _Focus >= 10 and _KillShot_CHARGES >= 1 and ((_Deathblow_BUFF and tChosen[Ability.RazorFragments.talentID]) or (_PreciseShot_BUFF and tChosen[Ability.headshot.talentID])) then
				tinsert(ConRO.SuggestedSpells, _KillShot);
				_KillShot_CHARGES = _KillShot_CHARGES - 1;
				_Deathblow_BUFF = false;
				_TrickShots_BUFF = false;
				if tChosen[Ability.headshot.talentID] then
					_PreciseShot_BUFF = false;
				end
				_Focus = _Focus - 10;
				_Queue = _Queue + 1;
				break;
			end

			if ((ConRO_AutoButton:IsVisible() and _enemies_in_40yrds >= 3) or ConRO_AoEButton:IsVisible()) then
				if _MultiShot_RDY and _Focus >= _MultiShot_COST and not _TrickShots_BUFF then
					tinsert(ConRO.SuggestedSpells, _MultiShot);
					_TrickShots_BUFF = true;
					_PreciseShot_BUFF = false;
					_Focus = _Focus - _MultiShot_COST;
					_Queue = _Queue + 1;
					break;
				end
			else
				if _ArcaneShot_RDY and _Focus >= _ArcaneShot_COST and (_PreciseShot_BUFF or currentSpell == _AimedShot) then
					tinsert(ConRO.SuggestedSpells, _ArcaneShot);
					_Focus = _Focus - _ArcaneShot_COST;
					_PreciseShot_BUFF = false;
					if tChosen[Ability.moving_target.talentID] then
						streamline_BUFF = true;
						streamline_COUNT = streamline_COUNT + 1;
					end
					_Queue = _Queue + 1;
					break;
				end
			end

			if _RapidFire_RDY and (not ConRO:HeroSpec(HeroSpec.Sentinel) or (ConRO:HeroSpec(HeroSpec.Sentinel) and (not tChosen[Ability.LunarStorm.talentID] or (tChosen[Ability.LunarStorm.talentID] and lunar_storm_DUR > 7)))) then
				tinsert(ConRO.SuggestedSpells, _RapidFire);
				_RapidFire_RDY = false;
				_TrickShots_BUFF = false;
				lunar_storm_DEBUFF = true;
				streamline_BUFF = true;
				streamline_COUNT = streamline_COUNT + 1;
				if tChosen[Ability.no_scope.talentID] then
					_PreciseShot_BUFF = true;
				end
				_Queue = _Queue + 1;
				break;
			end

			if _ExplosiveShot_RDY and _Focus >= 20 and not _ExplosiveShot_DEBUFF and not _PreciseShot_BUFF and tChosen[Ability.precision_detonation.talentID] then
				tinsert(ConRO.SuggestedSpells, _ExplosiveShot);
				_ExplosiveShot_RDY = false;
				_ExplosiveShot_DEBUFF = true;
				streamline_BUFF = true;
				_Focus = _Focus - 20;
				_Queue = _Queue + 1;
				break;
			end

			if _AimedShot_RDY and _Focus >= _AimedShot_COST and _AimedShot_CHARGES >= 1 and currentSpell ~= _AimedShot and (streamline_COUNT >= 1 or _LockandLoad_BUFF) then
				tinsert(ConRO.SuggestedSpells, _AimedShot);
				_AimedShot_CHARGES = _AimedShot_CHARGES - 1;
				_PreciseShot_BUFF = true;
				if _LockandLoad_BUFF then
					_LockandLoad_BUFF = false;
				else
					streamline_BUFF = false;
				end
				_Focus = _Focus - _AimedShot_COST;
				_Queue = _Queue + 1;
				break;
			end

			if _ExplosiveShot_RDY and _Focus >= 20 and not _ExplosiveShot_DEBUFF and not _Trueshot_BUFF and not tChosen[Ability.precision_detonation.talentID] then
				tinsert(ConRO.SuggestedSpells, _ExplosiveShot);
				_ExplosiveShot_RDY = false;
				_ExplosiveShot_DEBUFF = true;
				_Focus = _Focus - 20;
				_Queue = _Queue + 1;
				break;
			end

			if _KillShot_RDY and _Focus >= 10 and _KillShot_CHARGES >= 1 and (_CAN_KillShot or _Deathblow_BUFF) then
				tinsert(ConRO.SuggestedSpells, _KillShot);
				_KillShot_CHARGES = _KillShot_CHARGES - 1;
				_Deathblow_BUFF = false;
				_Focus = _Focus - 10;
				_Queue = _Queue + 1;
				break;
			end

			if _SteadyShot_RDY and _Focus <= _Focus_Max - 20 then
				tinsert(ConRO.SuggestedSpells, _SteadyShot);
				_SteadyShot_RDY = false;
				_Focus = _Focus + 20;
				_Queue = _Queue + 1;
				break;
			end

			tinsert(ConRO.SuggestedSpells, 75); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
	return nil;
end

function ConRO.Hunter.MarksmanshipDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();

--Abilities	
	local _Exhilaration, _Exhilaration_RDY = ConRO:AbilityReady(Ability.Exhilaration, timeShift);
	local _AspectoftheTurtle, _AspectoftheTurtle_RDY = ConRO:AbilityReady(Ability.AspectoftheTurtle, timeShift);
	local _SurvivaloftheFittest, _SurvivaloftheFittest_RDY = ConRO:AbilityReady(Ability.SurvivaloftheFittest, timeShift);

--Conditions

--Rotations	
	if _Exhilaration_RDY and _Player_Percent_Health <= 50 then
		tinsert(ConRO.SuggestedDefSpells, _Exhilaration);
	end

	if _AspectoftheTurtle_RDY then
		tinsert(ConRO.SuggestedDefSpells, _AspectoftheTurtle);
	end

	if _SurvivaloftheFittest_RDY and _LoneWolf_FORM and _in_combat then
		tinsert(ConRO.SuggestedDefSpells, _SurvivaloftheFittest);
	end
	return nil;
end

function ConRO.Hunter.Survival(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedSpells);
	ConRO:Stats();

--Abilities	
	local _AspectoftheEagle, _AspectoftheEagle_RDY = ConRO:AbilityReady(Ability.AspectoftheEagle, timeShift);
	local _Butchery, _Butchery_RDY = ConRO:AbilityReady(Ability.Butchery, timeShift);
	local _CallPet, _CallPet_RDY = ConRO:AbilityReady(Ability.CallPet.One, timeShift);
	local _CoordinatedAssault, _CoordinatedAssault_RDY = ConRO:AbilityReady(Ability.CoordinatedAssault, timeShift);
	local _ExplosiveShot, _ExplosiveShot_RDY = ConRO:AbilityReady(Ability.ExplosiveShot, timeShift);
	local _FlankingStrike, _FlankingStrike_RDY = ConRO:AbilityReady(Ability.FlankingStrike, timeShift);
	local _FuryoftheEagle, _FuryoftheEagle_RDY = ConRO:AbilityReady(Ability.FuryoftheEagle, timeShift);
	local _Harpoon, _Harpoon_RDY = ConRO:AbilityReady(Ability.Harpoon, timeShift);
		local _, _Harpoon_RANGE = ConRO:Targets(Ability.Harpoon);
	local _KillCommand, _KillCommand_RDY = ConRO:AbilityReady(Ability.KillCommand, timeShift);
		local _KillCommand_CHARGES, _, _KillCommand_CCD = ConRO:SpellCharges(_KillCommand);
	local _KillShot, _KillShot_RDY = ConRO:AbilityReady(Ability.KillShot, timeShift);
		local _Deathblow_BUFF = ConRO:Aura(Buff.Deathblow, timeShift);
	local _Muzzle, _Muzzle_RDY = ConRO:AbilityReady(Ability.Muzzle, timeShift);
	local _PrimalRageCR = ConRO:AbilityReady(Ability.CommandPet.PrimalRage, timeShift);
	local _PrimalRage, _PrimalRage_RDY = ConRO:AbilityReady(Pet_Ability.PrimalRage, timeShift, 'pet');
	local _RaptorStrike, _RaptorStrike_RDY = ConRO:AbilityReady(Ability.RaptorStrike, timeShift);
	local _TranquilizingShot, _TranquilizingShot_RDY = ConRO:AbilityReady(Ability.TranquilizingShot, timeShift);
	local _WildfireBomb, _WildfireBomb_RDY = ConRO:AbilityReady(Ability.WildfireBomb, timeShift);
		local _WildfireBomb_CHARGES, _WildfireBomb_MCHARGES, _WildfireBomb_CCD = ConRO:SpellCharges(_WildfireBomb);
	local _Spearhead, _Spearhead_RDY = ConRO:AbilityReady(Ability.Spearhead, timeShift);
		local _Spearhead_BUFF = ConRO:Aura(Buff.Spearhead, timeShift);

--Auras
	local _AspectoftheEagle_BUFF = ConRO:Aura(Buff.AspectoftheEagle, timeShift);
	local _CoordinatedAssault_BUFF = ConRO:Aura(Buff.CoordinatedAssault, timeShift);
	local _TermsofEngagement_BUFF = ConRO:Aura(Buff.TermsofEngagement, timeShift);
	local _, _TipoftheSpear_COUNT = ConRO:Aura(Buff.TipoftheSpear, timeShift);
	local _LunarStorm_DEBUFF = ConRO:Aura(Debuff.lunar_storm, timeShift, "HARMFUL");
	local _MongooseFury_BUFF, _MongooseFury_COUNT, _MongooseFury_DUR = ConRO:Aura(Buff.MongooseFury, timeShift);

	local _SerpentSting_DEBUFF = ConRO:TargetAura(Debuff.SerpentSting, timeShift);

--Conditions
	local _Pet_summoned = ConRO:CallPet();
	local _Pet_assist = ConRO:PetAssist();
	local _Pet_Percent_Health = ConRO:PercentHealth('pet');

	if _AspectoftheEagle_BUFF then
		_RaptorStrike = Ability.RaptorStrikeRanged.spellID;
		_MongooseBite = Ability.MongooseBiteRanged.spellID;
	end

	if tChosen[Ability.MongooseBite.talentID] then
		_RaptorStrike, _RaptorStrike_RDY = ConRO:AbilityReady(Ability.MongooseBite, timeShift);
	end

--Indicators	
	ConRO:AbilityInterrupt(_Muzzle, _Muzzle_RDY and ConRO:Interrupt());
	ConRO:AbilityPurge(_ArcaneTorrent, _ArcaneTorrent_RDY and _target_in_melee and ConRO:Purgable());
	ConRO:AbilityPurge(_TranquilizingShot, _TranquilizingShot_RDY and ConRO:Purgable());
	ConRO:AbilityMovement(_Harpoon, _Harpoon_RDY and _Harpoon_RANGE and not _target_in_melee);

	ConRO:AbilityBurst(_Harpoon, _Harpoon_RDY and tChosen[Ability.TermsofEngagement.talentID] and not _TermsofEngagement_BUFF);
	ConRO:AbilityBurst(_AspectoftheEagle, _AspectoftheEagle_RDY and not _target_in_melee);
	ConRO:AbilityBurst(_CoordinatedAssault, _CoordinatedAssault_RDY and ConRO:BurstMode(_CoordinatedAssault));
	ConRO:AbilityBurst(_PrimalRage, _PrimalRage_RDY and _party_size <= 1 and _in_combat and not _Heroism_BUFF and not _Sated_DEBUFF);
	ConRO:AbilityBurst(_PrimalRageCR, _PrimalRage_RDY and _party_size <= 1 and _in_combat and not _Heroism_BUFF and not _Sated_DEBUFF);

--Warnings	
	ConRO:Warnings("Call your pet!", _CallPet_RDY and not _Pet_summoned);

--Rotations
	repeat
		while(true) do
			if not _in_combat then
				if _WildfireBomb_RDY and _Focus >= 10 and _WildfireBomb_CHARGES >= 1 then
					tinsert(ConRO.SuggestedSpells, _WildfireBomb);
					_WildfireBomb_RDY = false;
					_WildfireBomb_CHARGES = _WildfireBomb_CHARGES - 1;
					_Focus = _Focus - 10;
					_Queue = _Queue + 1;
					break;
				end

				if _Butchery_RDY and tChosen[Ability.MercilessBlows.talentID] then
					tinsert(ConRO.SuggestedSpells, _Butchery);
					_Butchery_RDY = false;
					_Queue = _Queue + 1;
					break;
				end
			end

			if _WildfireBomb_RDY and _WildfireBomb_CHARGES >= 1 and not _LunarStorm_DEBUFF then
				tinsert(ConRO.SuggestedSpells, _WildfireBomb);
				_WildfireBomb_RDY = false;
				_WildfireBomb_CHARGES = _WildfireBomb_CHARGES - 1;
				_LunarStorm_DEBUFF = true;
				_Queue = _Queue + 1;
				break;
			end

			if _KillCommand_RDY and tChosen[Ability.RelentlessPrimalFerocity.talentID] and _CoordinatedAssault_BUFF and _TipoftheSpear_COUNT <= 0 then
				tinsert(ConRO.SuggestedSpells, _KillCommand);
				_KillCommand_RDY = false;
				_Focus = _Focus + 15;
				_TipoftheSpear_COUNT = 3;
				_Queue = _Queue + 1;
				break;
			end

			if _Butchery_RDY and tChosen[Ability.MercilessBlows.talentID] then
				tinsert(ConRO.SuggestedSpells, _Butchery);
				_Butchery_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _Spearhead_RDY and not _CoordinatedAssault_BUFF and ConRO:FullMode(_Spearhead) and ConRO:HeroSpec(HeroSpec.Sentinel) then
				tinsert(ConRO.SuggestedSpells, _Spearhead);
				_Spearhead_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _RaptorStrike_RDY and _Focus >= 30 and tChosen[Ability.VipersVenom.talentID] and not _SerpentSting_DEBUFF then
				tinsert(ConRO.SuggestedSpells, _RaptorStrike);
				_Focus = _Focus - 30;
				_SerpentSting_DEBUFF = true;
				_Queue = _Queue + 1;
				break;
			end

			if _FlankingStrike_RDY and _Focus >= 15 and _TipoftheSpear_COUNT <= 2 then
				tinsert(ConRO.SuggestedSpells, _FlankingStrike);
				_FlankingStrike_RDY = false;
				_Focus = _Focus - 15;
				_TipoftheSpear_COUNT = _TipoftheSpear_COUNT + 2;
				_Queue = _Queue + 1;
				break;
			end

			if _WildfireBomb_RDY and _Focus >= 10 and _WildfireBomb_CHARGES >= 1 and _WildfireBomb_CCD >= 7 and _TipoftheSpear_COUNT >= 1 and ConRO:HeroSpec(HeroSpec.PackLeader) then
				tinsert(ConRO.SuggestedSpells, _WildfireBomb);
				_WildfireBomb_CHARGES = _WildfireBomb_CHARGES - 1;
				_Focus = _Focus - 10;
				_Queue = _Queue + 1;
				break;
			end

			if _Butchery_RDY and _Focus >= 30 and tChosen[Ability.MercilessBlows.talentID] then
				tinsert(ConRO.SuggestedSpells, _Butchery);
				_Butchery_RDY = false;
				_Focus = _Focus - 30;
				_Queue = _Queue + 1;
				break;
			end

			if _WildfireBomb_RDY and _Focus >= 10 and _WildfireBomb_CHARGES == _WildfireBomb_MCHARGES then
				tinsert(ConRO.SuggestedSpells, _WildfireBomb);
				_WildfireBomb_CHARGES = _WildfireBomb_CHARGES - 1;
				_Focus = _Focus - 10;
				_Queue = _Queue + 1;
				break;
			end

			if _Spearhead_RDY and not _CoordinatedAssault_BUFF and ConRO:FullMode(_Spearhead) then
				tinsert(ConRO.SuggestedSpells, _Spearhead);
				_Spearhead_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _FlankingStrike_RDY and _Focus >= 15 and _TipoftheSpear_COUNT <= 2 then
				tinsert(ConRO.SuggestedSpells, _FlankingStrike);
				_FlankingStrike_RDY = false;
				_Focus = _Focus - 15;
				_TipoftheSpear_COUNT = _TipoftheSpear_COUNT + 2;
				_Queue = _Queue + 1;
				break;
			end

			if _KillShot_RDY and _Focus >= 10 and (_can_Execute or _Deathblow_BUFF) and _TipoftheSpear_COUNT >= 1 then
				tinsert(ConRO.SuggestedSpells, _KillShot);
				_KillShot_RDY = false;
				_Focus = _Focus - 10;
				_Deathblow_BUFF = false;
				_Queue = _Queue + 1;
				break;
			end

			if _WildfireBomb_RDY and _Focus >= 10 and _WildfireBomb_CHARGES >= 1 and _WildfireBomb_CCD >= 7 and _TipoftheSpear_COUNT >= 1 then
				tinsert(ConRO.SuggestedSpells, _WildfireBomb);
				_WildfireBomb_CHARGES = _WildfireBomb_CHARGES - 1;
				_Focus = _Focus - 10;
				_Queue = _Queue + 1;
				break;
			end

			if _ExplosiveShot_RDY and _Focus >= 20 then
				tinsert(ConRO.SuggestedSpells, _ExplosiveShot);
				_ExplosiveShot_RDY = false;
				_Focus = _Focus - 20;
				_Queue = _Queue + 1;
				break;
			end

			if _CoordinatedAssault_RDY and not _Spearhead_BUFF and ConRO:FullMode(_CoordinatedAssault) then
				tinsert(ConRO.SuggestedSpells, _CoordinatedAssault);
				_CoordinatedAssault_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _FuryoftheEagle_RDY and _TipoftheSpear_COUNT >= 1 then
				tinsert(ConRO.SuggestedSpells, _FuryoftheEagle);
				_FuryoftheEagle_RDY = false;
				_Queue = _Queue + 1;
				break;
			end

			if _KillShot_RDY and _Focus >= 10 and (_can_Execute or _Deathblow_BUFF) then
				tinsert(ConRO.SuggestedSpells, _KillShot);
				_KillShot_RDY = false;
				_Focus = _Focus - 10;
				_Deathblow_BUFF = false;
				_Queue = _Queue + 1;
				break;
			end

			if _KillCommand_RDY and _Focus <= _Focus_Max - 15 then
				tinsert(ConRO.SuggestedSpells, _KillCommand);
				_KillCommand_RDY = false;
				_Focus = _Focus + 15;
				_Queue = _Queue + 1;
				break;
			end

			if _WildfireBomb_RDY and _Focus >= 10 and _WildfireBomb_CHARGES >= 1 and _TipoftheSpear_COUNT >= 1 then
				tinsert(ConRO.SuggestedSpells, _WildfireBomb);
				_WildfireBomb_CHARGES = _WildfireBomb_CHARGES - 1;
				_Focus = _Focus - 10;
				_Queue = _Queue + 1;
				break;
			end

			if _RaptorStrike_RDY and _Focus >= 30 then
				tinsert(ConRO.SuggestedSpells, _RaptorStrike);
				_Focus = _Focus - 30;
				_Queue = _Queue + 1;
				break;
			end

			tinsert(ConRO.SuggestedSpells, 6603); --Waiting Spell Icon
			_Queue = _Queue + 3;
			break;
		end
	until _Queue >= 3;
	return nil;
end

function ConRO.Hunter.SurvivalDef(_, timeShift, currentSpell, gcd, tChosen, pvpChosen)
	wipe(ConRO.SuggestedDefSpells);
	ConRO:Stats();

--Abilities
	local _Exhilaration, _Exhilaration_RDY = ConRO:AbilityReady(Ability.Exhilaration, timeShift);
	local _AspectoftheTurtle, _AspectoftheTurtle_RDY = ConRO:AbilityReady(Ability.AspectoftheTurtle, timeShift);
	local _MendPet, _MendPet_RDY = ConRO:AbilityReady(Ability.PetUtility.MendPet, timeShift);
	local _FeedPet, _FeedPet_RDY = ConRO:AbilityReady(Ability.PetUtility.FeedPet, timeShift);

--Conditions
	local _Pet_summoned = ConRO:CallPet();
	local _Pet_assist = ConRO:PetAssist();
	local _Pet_Percent_Health = ConRO:PercentHealth('pet');

--Rotations	
	if _FeedPet_RDY and _Pet_summoned and not _in_combat and _Pet_Percent_Health <= 60 then
		tinsert(ConRO.SuggestedDefSpells, _FeedPet);
	end

	if _Exhilaration_RDY and (_Player_Percent_Health <= 50 or _Pet_Percent_Health <= 20) then
		tinsert(ConRO.SuggestedDefSpells, _Exhilaration);
	end

	if _MendPet_RDY and _Pet_summoned and _Pet_Percent_Health <= 60 then
		tinsert(ConRO.SuggestedDefSpells, _MendPet);
	end

	if _AspectoftheTurtle_RDY then
		tinsert(ConRO.SuggestedDefSpells, _AspectoftheTurtle);
	end
	return nil;
end