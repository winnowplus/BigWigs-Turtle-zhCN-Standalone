local module, L = BigWigs:ModuleDeclaration("Heigan the Unclean", "Naxxramas")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30038
module.enabletrigger = module.translatedName
module.toggleoptions = {"disease", "manaBurn", "teleport", "erruption", -1, "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Heigan",

    disease_cmd = "disease",
    disease_name = "衰弱瘟疫警报",
    disease_desc = "衰弱瘟疫出现时进行警告",
    
    manaBurn_cmd = "manaBurn",
    manaBurn_name = "法力燃烧警报",
    manaBurn_desc = "法力燃烧出现时进行警告",
    
    teleport_cmd = "teleport",
    teleport_name = "传送警报",
    teleport_desc = "传送出现时进行警告",

    erruption_cmd = "erruption",
    erruption_name = "爆发警报",
    erruption_desc = "爆发出现时进行警告",

    trigger_engage1 = "You are mine now!",--CHAT_MSG_MONSTER_YELL
    trigger_engage2 = "You...are next!",--CHAT_MSG_MONSTER_YELL
    trigger_engage3 = "I see you!",--CHAT_MSG_MONSTER_YELL
    
    trigger_die = "takes his last breath.",--to be confirmed
    
    trigger_disease = "afflicted by Decrepit Fever.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_disease = "衰弱瘟疫冷却",
    msg_disease = "衰弱瘟疫",
    
    trigger_manaBurn = "Heigan the Unclean's Mana Burn",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_manaBurn = "法力燃烧冷却",
    
    trigger_manaBurnYou = "Heigan the Unclean's Mana Burn hits you for",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_manaBurnYou = "法力燃烧命中你！",

    trigger_danceStart = "The end is upon you.",--CHAT_MSG_MONSTER_YELL
    msg_danceStart = "传送！",
    bar_dancing = "跳舞结束",
    bar_dancingSoon = "即将跳舞",
    
    msg_fightStart = "战斗开始！",
    bar_fighting = "开始跳舞",
    
    bar_erruption = "爆发",	

    ["Eye Stalk"] = true,
    ["Rotting Maggot"] = true,
    ["Eye Stalk"] = "眼柄",
    ["Rotting Maggot"] = "腐烂的蛆虫",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Heigan",

    disease_cmd = "disease",
    disease_name = "衰弱瘟疫警报",
    disease_desc = "衰弱瘟疫出现时进行警告",
    
    manaBurn_cmd = "manaBurn",
    manaBurn_name = "法力燃烧警报",
    manaBurn_desc = "法力燃烧出现时进行警告",
    
    teleport_cmd = "teleport",
    teleport_name = "传送警报",
    teleport_desc = "传送出现时进行警告",

    erruption_cmd = "erruption",
    erruption_name = "爆发警报",
    erruption_desc = "爆发出现时进行警告",

    trigger_engage1 = "你现在是我的了！",--CHAT_MSG_MONSTER_YELL
    trigger_engage2 = "你是下一个！",--CHAT_MSG_MONSTER_YELL
    trigger_engage3 = "我看见你！",--CHAT_MSG_MONSTER_YELL
    
    trigger_die = "takes his last breath.",--to be confirmed
    
    trigger_disease = "受到了衰弱瘟疫效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_disease = "衰弱瘟疫冷却",
    msg_disease = "衰弱瘟疫",
    
    trigger_manaBurn = "肮脏的希尔盖的法力燃烧",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_manaBurn = "法力燃烧冷却",
    
    trigger_manaBurnYou = "肮脏的希尔盖的法力燃烧击中你",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_manaBurnYou = "法力燃烧命中你！",

    trigger_danceStart = "末日就在你身上。",--CHAT_MSG_MONSTER_YELL
    msg_danceStart = "传送！",
    bar_dancing = "跳舞结束",
    bar_dancingSoon = "即将跳舞",
    
    msg_fightStart = "战斗开始！",
    bar_fighting = "开始跳舞",
    
    bar_erruption = "爆发",	

    ["Eye Stalk"] = "眼柄",
    ["Rotting Maggot"] = "腐烂的蛆虫",
} end )

local timer = {
	firstDiseaseCD = 30,
	firstDiseaseAfterDanceCD = 5,
	diseaseCD = {20,25},
	
	firstManaBurnCD = 15,
	firstManaBurnAfterDanceCD = 10,
	manaBurnCD = 3,
	
	fightDuration = 90,
	danceDuration = 45,
	
	firstErruption = 15,
	firstDanceErruption = 4,
	erruption = 0, -- will be changed during the encounter
	erruptionSlow = 10,
	erruptionFast = 3,
	dancingSoon = 10,
}
local icon = {
	disease = "Ability_Creature_Disease_03",
	manaBurn = "Spell_Shadow_ManaBurn",
	fightDuration = "Spell_Magic_LesserInvisibilty",
	danceDuration = "Spell_Arcane_Blink",
	erruption = "spell_fire_selfdestruct",
	dancing = "INV_Gizmo_RocketBoot_01",
}
local syncName = {
	disease = "HeiganDisease"..module.revision,
	manaBurn = "HeiganManaBurn"..module.revision,
	danceStart = "HeiganToPlatform"..module.revision,
	fightStart = "HeiganToFloor"..module.revision,
}

local eruption_count = 1
local eruption_dir = 1
bwHeiganTimeFloorStarted = 0
bwHeiganTimePlatformStarted = 0

module:RegisterYellEngage(L["trigger_engage1"])
module:RegisterYellEngage(L["trigger_engage2"])
module:RegisterYellEngage(L["trigger_engage3"])

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "Event")--heiganDies
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--decrepitFever
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--decrepitFever
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--decrepitFever
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--manaBurn
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--manaBurn
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--manaBurn
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL", "Event")--DanceStart(Teleport)
	
	self:ThrottleSync(5, syncName.disease)
	self:ThrottleSync(1, syncName.manaBurn)
	self:ThrottleSync(10, syncName.danceStart)
	self:ThrottleSync(10, syncName.fightStart)
end

function module:OnSetup()
end

function module:OnEngage()
	bwHeiganTimeFloorStarted = GetTime()
	
	if self.db.profile.disease then
		self:Bar(L["bar_disease"], timer.firstDiseaseCD, icon.disease, true, "Green")
	end
	if self.db.profile.manaBurn then
		self:Bar(L["bar_manaBurn"], timer.firstManaBurnCD, icon.manaBurn, true, "Blue")
	end
	if self.db.profile.teleport then
		self:Bar(L["bar_fighting"], timer.fightDuration, icon.fightDuration, true, "White")
		self:DelayedBar(timer.fightDuration - 10, L["bar_dancingSoon"], timer.dancingSoon, icon.dancing, true, "Cyan")
	end
	
	eruption_count = 1
	eruption_dir = 1
	timer.erruption = timer.erruptionSlow
	self:ScheduleEvent("HeiganErruption", self.Erruption, timer.firstErruption, self)
	if self.db.profile.erruption then
		self:Bar(L["bar_erruption"] .. eruption_help(eruption_count), timer.firstErruption, icon.erruption, true, "Red")
	end
end

function module:OnDisengage()
end

function module:Event(msg)
	if string.find(msg, L["trigger_manaBurnYou"]) then
		if self.db.profile.manaBurn then
			if UnitClass("Player") ~= BC["Rogue"] and UnitClass("Player") ~= BC["Warrior"] then
				self:Message(L["msg_manaBurnYou"], "Important", nil, "Info")
				self:WarningSign(icon.manaBurn, 0.7)
			end
		end
	end
	if string.find(msg, L["trigger_die"]) then
		self:SendBossDeathSync()
	elseif string.find(msg, L["trigger_disease"]) then
		self:Sync(syncName.disease)
	elseif string.find(msg, L["trigger_manaBurn"]) then
		self:Sync(syncName.manaBurn)
	elseif string.find(msg, L["trigger_danceStart"]) then
		self:Sync(syncName.danceStart)
	end
end




function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.disease and self.db.profile.disease then
		self:Disease()
	elseif sync == syncName.manaBurn and self.db.profile.manaBurn then
		self:ManaBurn()
	elseif sync == syncName.danceStart then
		self:DanceStart()
	elseif sync == syncName.fightStart then
		self:FightStart()
	end
end



function module:Disease()
	--start a bar only if enough time left before dancing
	if timer.diseaseCD[1] < (timer.fightDuration - (GetTime() - bwHeiganTimeFloorStarted)) then
		self:IntervalBar(L["bar_disease"], timer.diseaseCD[1], timer.diseaseCD[2], icon.disease, true, "Green")
	end
	if UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Priest"] then
		self:Message(L["msg_disease"], "Important", nil, "Info")
		self:WarningSign(icon.disease, 0.7)
	end
end

function module:ManaBurn()
	--start a bar only if enough time left before dancing
	if timer.manaBurnCD < (timer.fightDuration - (GetTime() - bwHeiganTimeFloorStarted)) then
		self:Bar(L["bar_manaBurn"], timer.manaBurnCD, icon.manaBurn, true, "Blue")
	end
end

function module:DanceStart()
	self:CancelScheduledEvent("HeiganErruption")
	self:RemoveBar(L["bar_disease"])
	self:RemoveBar(L["bar_manaBurn"])
	self:RemoveBar(L["bar_fighting"])
	self:RemoveBar(L["bar_dancingSoon"])
	
	eruption_count = 1
	timer.erruption = timer.erruptionFast
	
	self:ScheduleEvent("HeiganErruption", self.Erruption, timer.firstDanceErruption, self)
	self:ScheduleEvent("bwHeiganToFloor",  self.FightStart, timer.danceDuration, self)
	
	if self.db.profile.teleport then
		self:Message(string.format(L["msg_danceStart"], timer.danceDuration), "Attention")
		self:Bar(L["bar_dancing"], timer.danceDuration, icon.danceDuration, true, "White")
	end
	if self.db.profile.erruption then
		self:Bar(L["bar_erruption"] .. eruption_help(eruption_count), timer.firstDanceErruption, icon.erruption, true, "Red")
	end
end

function module:FightStart()
	self:CancelScheduledEvent("bwHeiganToFloor")
	self:CancelScheduledEvent("HeiganErruption")
	
	eruption_count = 1
	timer.erruption = timer.erruptionSlow
	self:ScheduleEvent("HeiganErruption", self.Erruption, timer.erruption, self)
	
	if self.db.profile.teleport then
		self:Message(L["msg_fightStart"], "Attention")
		self:Bar(L["bar_fighting"], timer.fightDuration, icon.fightDuration, true, "White")
		self:DelayedBar(timer.fightDuration - 10, L["bar_dancingSoon"], timer.dancingSoon, icon.dancing, true, "Cyan")
	end
	if self.db.profile.disease then
		self:Bar(L["bar_disease"], timer.firstDiseaseAfterDanceCD, icon.disease, true, "Green")
	end
	if self.db.profile.manaBurn then
		self:Bar(L["bar_manaBurn"], timer.firstManaBurnAfterDanceCD, icon.manaBurn, true, "Blue")
	end
	if self.db.profile.erruption then
		self:Bar(L["bar_erruption"] .. eruption_help(eruption_count), timer.erruption, icon.erruption, true, "Red")
	end
end

function module:Erruption()
	eruption_count = eruption_count + 1 * eruption_dir
	if eruption_count == 4 then
		eruption_dir = -1
	end
	if eruption_count == 1 then
		eruption_dir = 1
	end
		
	
	local registered, time, elapsed = self:BarStatus(L["bar_fighting"])
	if registered and timer and elapsed then
		local remaining = time - elapsed
		if timer.erruption + 1 < remaining then
			if self.db.profile.erruption then
				self:Bar(L["bar_erruption"] .. eruption_help(eruption_count), timer.erruption, icon.erruption, true, "Red")
			end
			self:ScheduleEvent("HeiganErruption", self.Erruption, timer.erruption, self)
		else
			if self.db.profile.teleport then
				self:Sound("Beware")
				self:Bar(L["bar_dancingSoon"], timer.dancingSoon, icon.dancing, true, "Blue")
			end
		end
	else
		if self.db.profile.erruption then
			self:Bar(L["bar_erruption"] .. eruption_help(eruption_count), timer.erruption, icon.erruption, true, "Red")
			if UnitName("Player") == "Relar" then DEFAULT_CHAT_FRAME:AddMessage("debugHeigan, here") end
		end
		self:ScheduleEvent("HeiganErruption", self.Erruption, timer.erruption, self)
	end
end

function eruption_help(inp)
	return ' '..inp
end
