local module, L = BigWigs:ModuleDeclaration("Ley-Watcher Incantagos", "Karazhan")

-- module variables
module.revision = 30001
module.enabletrigger = module.translatedName
module.toggleoptions = { "leyline", "summonseeker", "summonwhelps", "affinity", "beam", "cursewarning", "proximity", "bosskill" }
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Tower of Karazhan"],
	AceLibrary("Babble-Zone-2.2")["Tower of Karazhan"],
}

-- module defaults
module.defaultDB = {
	leyline = true,
	summonseeker = true,
	summonwhelps = true,
	affinity = true,
	beam = true,
	cursewarning = true,
	proximity = true,
}

-- localization
L:RegisterTranslations("enUS", function()
	return {
		cmd = "Incantagos",

		leyline_cmd = "leyline",
		leyline_name = "Ley-Line Disturbance Alert",
		leyline_desc = "Warns when Ley-Watcher Incantagos casts Ley-Line Disturbance",

		summonseeker_cmd = "summonseeker",
		summonseeker_name = "Summon Ley-Seeker Alert",
		summonseeker_desc = "Warns when Ley-Watcher Incantagos summons Manascale Ley-Seeker",

		summonwhelps_cmd = "summonwhelps",
		summonwhelps_name = "Summon Whelps Alert",
		summonwhelps_desc = "Warns when Ley-Watcher Incantagos summons Manascale Whelps",

		affinity_cmd = "affinity",
		affinity_name = "Affinity Alert",
		affinity_desc = "Warns when players get an affinity that requires action",

		beam_cmd = "beam",
		beam_name = "Guided Ley-Beam Alert",
		beam_desc = "Warns when players are affected by Guided Ley-Beam",

		cursewarning_cmd = "cursewarning",
		cursewarning_name = "Curse of Manascale Warning",
		cursewarning_desc = "Warns when boss reaches 38%, as Curse of Manascale comes at 33%",

		proximity_cmd = "proximity",
		proximity_name = "Proximity Warning",
		proximity_desc = "Show Proximity Warning Frame",

		trigger_summonSeekerCast = "Watcher Incantagos begins to cast Summon Manascale Ley",
		bar_summonSeekerCast = "Ley-Seeker Summoning",
		msg_summonSeeker = "Manascale Ley-Seeker spawning in 2 sec!",

		trigger_summonWhelpsCast = "Watcher Incantagos begins to cast Summon Manascale Whelps",
		bar_summonWhelpsCast = "Whelps Summoning",
		msg_summonWhelps = "Manascale Whelps spawning in 2 sec!",

		trigger_leyLineCast = "Watcher Incantagos begins to cast (.+)Line Disturbance",
		bar_leyLineCast = "Ley-Line Disturbance casting",
		bar_leyLineCD = "Next Possible Ley-Line Disturbance",
		msg_leyLine = "Ley-Line Disturbance casting!",

		trigger_greenAffinity = "gains Green Affinity",
		trigger_blackAffinity = "gains Black Affinity",
		trigger_redAffinity = "gains Red Affinity",
		trigger_blueAffinity = "gains Blue Affinity",
		trigger_manaAffinity = "gains Mana Affinity",
		trigger_crystalAffinity = "gains Crystal Affinity",

		msg_greenAffinity = "GREEN AFFINITY - Shamans and Druids handle this!",
		msg_blackAffinity = "BLACK AFFINITY - Priests and Warlocks handle this!",
		msg_redAffinity = "RED AFFINITY - Mages and Warlocks handle this!",
		msg_blueAffinity = "BLUE AFFINITY - Mages handle this!",
		msg_manaAffinity = "MANA AFFINITY - Mages and Druids handle this!",
		msg_crystalAffinity = "CRYSTAL AFFINITY - Warriors, Rogues, Paladins and Hunters handle this!",

		bar_greenAffinity = "Green Affinity (Shamans/Druids)",
		bar_blackAffinity = "Black Affinity (Priests/Warlocks)",
		bar_redAffinity = "Red Affinity (Mages/Warlocks)",
		bar_blueAffinity = "Blue Affinity (Mages)",
		bar_manaAffinity = "Mana Affinity (Mages/Druids)",
		bar_crystalAffinity = "Crystal Affinity (Melee/Hunters)",

		trigger_leyBeamGain = "(.*) gains Guided Ley",
		trigger_leyBeamAfflicted = "afflicted by Guided Ley",
		msg_leyBeam = "LEY-BEAM on %s - AVOID THEM!",
		msg_leyBeamYou = "LEY-BEAM on YOU - GET AWAY FROM OTHERS!",
		msg_leyBeamSay = "Guided Ley-Beam on me! STAY AWAY!",

		msg_curseWarning = "38% - CURSE OF MANASCALE coming at 33%!",

		warningSign_beam = "IN BEAM, MOVE",
	}
end)

L:RegisterTranslations("zhCN", function()
	return {
		cmd = "Incantagos",

		leyline_cmd = "leyline",
		leyline_name = "魔线扰动警报",
		leyline_desc = "当魔网观察者因塔苟斯施放魔线扰动时发出警告",

		summonseeker_cmd = "summonseeker",
		summonseeker_name = "召唤魔鳞观察者警报",
		summonseeker_desc = "当魔网观察者因塔苟斯召唤魔鳞观察者时发出警告",

		summonwhelps_cmd = "summonwhelps",
		summonwhelps_name = "召唤幼龙警报",
		summonwhelps_desc = "当魔网观察者因塔苟斯召唤魔鳞幼龙时发出警告",

		affinity_cmd = "affinity",
		affinity_name = "亲和警报",
		affinity_desc = "当玩家获得需要行动的亲和时发出警告",

		beam_cmd = "beam",
		beam_name = "魔能光束警报",
		beam_desc = "当魔能光束施放时进行警告",

		cursewarning_cmd = "cursewarning",
		cursewarning_name = "魔鳞诅咒警报",
		cursewarning_desc = "BOSS血量38%开始警告，魔鳞诅咒将在33%开始。",

		proximity_cmd = "proximity",
		proximity_name = "近距离警告",
		proximity_desc = "显示近距离警告框架",

		trigger_summonSeekerCast = "魔网观察者因塔苟斯开始施放召唤魔鳞观察者",
		bar_summonSeekerCast = "中龙召唤中",
		msg_summonSeeker = "中龙将在2秒后出现！",

		trigger_summonWhelpsCast = "魔网观察者因塔苟斯开始施放召唤魔鳞幼龙",
		bar_summonWhelpsCast = "幼龙召唤中",
		msg_summonWhelps = "幼龙将在2秒后出现！",

		trigger_leyLineCast = "魔网观察者因塔苟斯开始施放魔线扰动",
		bar_leyLineCast = "魔线扰动施放中",
		bar_leyLineCD = "下一次可能的魔线扰动",
		msg_leyLine = "魔线扰动施放中！",

		trigger_greenAffinity = "受到了绿色亲和",
		trigger_blackAffinity = "受到了黑色亲和",
		trigger_redAffinity = "受到了红色亲和",
		trigger_blueAffinity = "受到了蓝色亲和",
		trigger_manaAffinity = "受到了魔力亲和",
		trigger_crystalAffinity = "受到了水晶亲和",

		msg_greenAffinity = "绿色亲和 - 萨满和德鲁伊处理！",
		msg_blackAffinity = "黑色亲和 - 牧师和术士处理！",
		msg_redAffinity = "红色亲和 - 法师和术士处理！",
		msg_blueAffinity = "蓝色亲和 - 法师处理！",
		msg_manaAffinity = "魔力亲和 - 法师和德鲁伊处理！",
		msg_crystalAffinity = "水晶亲和 - 战士、盗贼、圣骑士和猎人处理！",
		
		bar_greenAffinity = "绿色亲和(Shamans/Druids)",
		bar_blackAffinity = "黑色亲和(Priests/Warlocks)",
		bar_redAffinity = "红色亲和(Mages/Warlocks)",
		bar_blueAffinity = "蓝色亲和(Mages)",
		bar_manaAffinity = "魔力亲和(Mages/Druids)",
		bar_crystalAffinity = "水晶亲和(Melee/Hunters)",

		trigger_leyBeamGain = "(.*)获得了魔能光束",
		trigger_leyBeamAfflicted = "受到了引导魔能光束效果的影响",
		msg_leyBeam = "%s中了魔能光束 - 远离他！",
		msg_leyBeamYou = "你中了魔能光束，远离人群！",
		msg_leyBeamSay = "我中了魔能光束！救我！！！",

		msg_curseWarning = "38% - 准备魔鳞诅咒(33%开始，增加耗蓝)!",

		warningSign_beam = "在魔能光束内，快跑",
	}
end)

-- timer and icon variables
local timer = {
	firstLeyLine = { 70, 80 }, -- 1:10 to 1:20
	leyLineCD = { 53, 63 },
	leyLineCast = 3,
	summonSeekerCast = 2,
	summonWhelpsCast = 2,
	affinity = 15,
	beam = 13, -- 10 sec duration, starts 3 sec after initial targeting buff
}

local icon = {
	leyLine = "Spell_Arcane_PortalIronForge",
	greenAffinity = "Spell_Nature_AbolishMagic",
	blackAffinity = "Spell_Shadow_ShadowBolt",
	redAffinity = "Spell_Fire_FlameBolt",
	blueAffinity = "Spell_Frost_FrostBolt02",
	manaAffinity = "Spell_Nature_StarFall",
	crystalAffinity = "INV_Sword_04",
	beam = "Spell_Arcane_StarFire",
}

local color = {
	leyLine = "Blue",
	summonSeeker = "Yellow",
	summonWhelps = "Orange",
}

local syncName = {
	summonSeeker = "IncantagosSummonSeeker" .. module.revision,
	summonWhelps = "IncantagosSummonWhelps" .. module.revision,
	leyLine = "IncantagosLeyLine" .. module.revision,
	greenAffinity = "IncantagosGreenAffinity" .. module.revision,
	blackAffinity = "IncantagosBlackAffinity" .. module.revision,
	redAffinity = "IncantagosRedAffinity" .. module.revision,
	blueAffinity = "IncantagosBlueAffinity" .. module.revision,
	manaAffinity = "IncantagosManaAffinity" .. module.revision,
	crystalAffinity = "IncantagosCrystalAffinity" .. module.revision,
	beam = "IncantagosLeyBeam" .. module.revision,
}

-- Proximity Plugin
module.proximityCheck = function(unit)
	return CheckInteractDistance(unit, 2)
end
module.proximitySilent = true

-- module functions
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "BeginsCastEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "BeginsCastEvent")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS_BUFFS", "BuffEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS", "BuffEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "BuffEvent")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")

	if SUPERWOW_VERSION then
		self:RegisterCastEventsForUnitName("Ley-Watcher Incantagos", "IncantagosCastEvent")
	end

	self:ThrottleSync(5, syncName.summonSeeker)
	self:ThrottleSync(5, syncName.summonWhelps)
	self:ThrottleSync(5, syncName.leyLine)
	self:ThrottleSync(2, syncName.greenAffinity)
	self:ThrottleSync(2, syncName.blackAffinity)
	self:ThrottleSync(2, syncName.redAffinity)
	self:ThrottleSync(2, syncName.blueAffinity)
	self:ThrottleSync(2, syncName.manaAffinity)
	self:ThrottleSync(2, syncName.crystalAffinity)
	self:ThrottleSync(2, syncName.beam)
end

function module:OnSetup()
	self.started = nil
	self.curseWarned = nil
	self.bossHealth = 100
end

function module:OnEngage()
	if self.db.profile.leyline then
		self:IntervalBar(L["bar_leyLineCD"], timer.firstLeyLine[1], timer.firstLeyLine[2], icon.leyLine, true, color.leyLine)
	end

	if self.db.profile.proximity then
		self:Proximity()
	end

	self.curseWarned = nil
	self.bossHealth = 100

	-- Start health monitoring
	if self.db.profile.cursewarning then
		self:ScheduleRepeatingEvent("CheckBossHealth", self.CheckBossHealth, 1, self)
	end
end

function module:OnDisengage()
	self:RemoveProximity()

	if self:IsEventScheduled("CheckBossHealth") then
		self:CancelScheduledEvent("CheckBossHealth")
	end
end

function module:IncantagosCastEvent(casterGuid, targetGuid, eventType, spellId, castTime)
	if eventType == "CHANNEL" and spellId == 51187 then
		if IsRaidLeader() or IsRaidOfficer() then
			SetRaidTarget(targetGuid, 8)
		end
	end
end

function module:CheckBossHealth()
	for i = 1, GetNumRaidMembers() do
		local targetString = "raid" .. i .. "target"
		local targetName = UnitName(targetString)

		if targetName == module.translatedName then
			local health = UnitHealth(targetString)
			local healthMax = UnitHealthMax(targetString)

			if health > 0 and healthMax > 0 then
				self.bossHealth = math.ceil((health / healthMax) * 100)

				if self.bossHealth <= 38 and not self.curseWarned then
					self:Message(L["msg_curseWarning"], "Important", nil, "Alarm")
					self.curseWarned = true
				end
				break
			end
		end
	end
end

function module:BeginsCastEvent(msg)
	if string.find(msg, L["trigger_summonSeekerCast"]) then
		self:Sync(syncName.summonSeeker)
	elseif string.find(msg, L["trigger_summonWhelpsCast"]) then
		self:Sync(syncName.summonWhelps)
	elseif string.find(msg, L["trigger_leyLineCast"]) then
		self:Sync(syncName.leyLine)
	end
end

function module:BuffEvent(msg)
	if string.find(msg, L["trigger_greenAffinity"]) then
		self:Sync(syncName.greenAffinity)
	elseif string.find(msg, L["trigger_blackAffinity"]) then
		self:Sync(syncName.blackAffinity)
	elseif string.find(msg, L["trigger_redAffinity"]) then
		self:Sync(syncName.redAffinity)
	elseif string.find(msg, L["trigger_blueAffinity"]) then
		self:Sync(syncName.blueAffinity)
	elseif string.find(msg, L["trigger_manaAffinity"]) then
		self:Sync(syncName.manaAffinity)
	elseif string.find(msg, L["trigger_crystalAffinity"]) then
		self:Sync(syncName.crystalAffinity)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS(msg)
	local _, _, player = string.find(msg, L["trigger_leyBeamGain"])
	if player then
		self:Sync(syncName.beam .. " " .. player)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE(msg)
	if string.find(msg, L["trigger_leyBeamAfflicted"]) then
		self:WarningSign(icon.beam, 5, true, L["warningSign_beam"])
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.summonSeeker then
		self:SummonSeeker()
	elseif sync == syncName.summonWhelps then
		self:SummonWhelps()
	elseif sync == syncName.leyLine then
		self:LeyLine()
	elseif sync == syncName.greenAffinity and self.db.profile.affinity then
		self:GreenAffinity()
	elseif sync == syncName.blackAffinity and self.db.profile.affinity then
		self:BlackAffinity()
	elseif sync == syncName.redAffinity and self.db.profile.affinity then
		self:RedAffinity()
	elseif sync == syncName.blueAffinity and self.db.profile.affinity then
		self:BlueAffinity()
	elseif sync == syncName.manaAffinity and self.db.profile.affinity then
		self:ManaAffinity()
	elseif sync == syncName.crystalAffinity and self.db.profile.affinity then
		self:CrystalAffinity()
	elseif sync == syncName.beam and self.db.profile.beam then
		self:LeyBeamStarted(rest)
	end
end

function module:SummonSeeker()
	if self.db.profile.summonseeker then
		self:Message(L["msg_summonSeeker"], "Attention")
	end
end

function module:SummonWhelps()
	if self.db.profile.summonwhelps then
		self:Message(L["msg_summonWhelps"], "Attention")
	end
end

function module:LeyLine()
	if self.db.profile.leyline then
		self:Message(L["msg_leyLine"], "Important")
		self:RemoveBar(L["bar_leyLineCD"])
		self:Bar(L["bar_leyLineCast"], timer.leyLineCast, icon.leyLine, true, color.leyLine)
		self:IntervalBar(L["bar_leyLineCD"], timer.leyLineCD[1], timer.leyLineCD[2], icon.leyLine, true, color.leyLine)
	end
end

function module:GreenAffinity()
	self:Message(L["msg_greenAffinity"], "Important", true, "Alarm")
	self:WarningSign(icon.greenAffinity, 5, true, "SHAMAN/DRUID")
	self:Bar(L["bar_greenAffinity"], timer.affinity, icon.greenAffinity)
end

function module:BlackAffinity()
	self:Message(L["msg_blackAffinity"], "Important", true, "Alarm")
	self:WarningSign(icon.blackAffinity, 5, true, "PRIEST/WARLOCK")
	self:Bar(L["bar_blackAffinity"], timer.affinity, icon.blackAffinity)
end

function module:RedAffinity()
	self:Message(L["msg_redAffinity"], "Important", true, "Alarm")
	self:WarningSign(icon.redAffinity, 5, true, "MAGE/WARLOCK")
	self:Bar(L["bar_redAffinity"], timer.affinity, icon.redAffinity)
end

function module:BlueAffinity()
	self:Message(L["msg_blueAffinity"], "Important", true, "Alarm")
	self:WarningSign(icon.blueAffinity, 5, true, "MAGE")
	self:Bar(L["bar_blueAffinity"], timer.affinity, icon.blueAffinity)
end

function module:ManaAffinity()
	self:Message(L["msg_manaAffinity"], "Important", true, "Alarm")
	self:WarningSign(icon.manaAffinity, 5, true, "MAGE/DRUID")
	self:Bar(L["bar_manaAffinity"], timer.affinity, icon.manaAffinity)
end

function module:CrystalAffinity()
	self:Message(L["msg_crystalAffinity"], "Important", true, "Alarm")
	self:WarningSign(icon.crystalAffinity, 5, true, "MELEE")
	self:Bar(L["bar_crystalAffinity"], timer.affinity, icon.crystalAffinity)
end

function module:LeyBeamStarted(player)
	-- Combined self and other beam handling into one function
	if player == UnitName("player") then
		self:Message(L["msg_leyBeamYou"], "Important", true, "Alarm")
		SendChatMessage(L["msg_leyBeamSay"], "SAY")
	else
		self:Message(string.format(L["msg_leyBeam"], player), "Important")
	end

	-- Add a timer bar for the beam duration
	self:Bar(player .. ": " .. L["beam_name"], timer.beam, icon.beam)
end

function module:Test()
	-- Initialize module state
	self:OnSetup()
	self:OnEngage()

	local events = {
		-- First Ley-Line around 1:15
		{ time = 4, func = function()
			print("Test: Ley-Watcher Incantagos begins to cast Ley-Line Disturbance")
			module:BeginsCastEvent("Ley-Watcher Incantagos begins to cast Ley-Line Disturbance.")
		end },
		{ time = 5, func = function()
			print("Test: You are afflicted by Guided Ley-Beam")
			module:CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE("You are afflicted by Guided Ley-Beam (1).")
		end },
		{ time = 6, func = function()
			print("Test: simulate cast event")
			if SUPERWOW_VERSION then
				local _, guid = UnitExists("player")
				module:IncantagosCastEvent(nil, guid, "CHANNEL", 51187, 0)
			end
		end },

		-- Summon Seeker
		{ time = 7, func = function()
			print("Test: Ley-Watcher Incantagos begins to cast Summon Manascale Ley-Seeker")
			module:BeginsCastEvent("Ley-Watcher Incantagos begins to cast Summon Manascale Ley-Seeker.")
		end },
		-- Ley-Beam
		{ time = 10, func = function()
			print("Test: " .. UnitName("player") .. " gains Guided Ley-Beam")
			module:CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS(UnitName("player") .. " gains Guided Ley-Beam (1).")

			-- clear skull
			if IsRaidLeader() or IsRaidOfficer() then
				SetRaidTarget("player", 0)
			end
		end },
		-- Summon Whelps
		{ time = 15, func = function()
			print("Test: Ley-Watcher Incantagos begins to cast Summon Manascale Whelps")
			module:BeginsCastEvent("Ley-Watcher Incantagos begins to cast Summon Manascale Whelps.")
		end },
		{ time = 18, func = function()
			print("Test: Stormhide gains Guided Ley-Beam")
			module:CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS("Stormhide gains Guided Ley-Beam (1).")
		end },

		-- Affinities
		{ time = 22, func = function()
			print("Test: Player1 gains Green Affinity")
			module:BuffEvent("Player1 gains Green Affinity (1).")
		end },
		{ time = 28, func = function()
			print("Test: Player1 gains Black Affinity")
			module:BuffEvent("Player1 gains Black Affinity (1).")
		end },
		{ time = 34, func = function()
			print("Test: Player1 gains Red Affinity")
			module:BuffEvent("Player1 gains Red Affinity (1).")
		end },
		{ time = 40, func = function()
			print("Test: Player1 gains Blue Affinity")
			module:BuffEvent("Player1 gains Blue Affinity (1).")
		end },
		{ time = 46, func = function()
			print("Test: Player1 gains Mana Affinity")
			module:BuffEvent("Player1 gains Mana Affinity (1).")
		end },
		{ time = 52, func = function()
			print("Test: Player1 gains Crystal Affinity")
			module:BuffEvent("Player1 gains Crystal Affinity (1).")
		end },

		-- Second Ley-Line about 55s after first one
		{ time = 60, func = function()
			print("Test: Ley-Watcher Incantagos begins to cast Ley-Line Disturbance")
			module:BeginsCastEvent("Ley-Watcher Incantagos begins to cast Ley-Line Disturbance.")
		end },

		{ time = 65, func = function()
			print("Test: Disengage")
			module:OnDisengage()
		end },
	}

	-- Schedule each event at its absolute time
	for i, event in ipairs(events) do
		self:ScheduleEvent("IncantagosTest" .. i, event.func, event.time)
	end

	self:Message("Ley-Watcher Incantagos test started", "Positive")
	return true
end

-- /run local m=BigWigs:GetModule("Ley-Watcher Incantagos"); BigWigs:SetupModule("Ley-Watcher Incantagos");m:Test();
