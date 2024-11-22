
local module, L = BigWigs:ModuleDeclaration("Sapphiron", "Naxxramas")
local BC = AceLibrary("Babble-Class-2.2")
local bzkelthuzadchamber = AceLibrary("Babble-Zone-2.2")["Kel'Thuzad Chamber"]
local bzeasternplaguelands = AceLibrary("Babble-Zone-2.2")["Eastern Plaguelands"]
local bzsapphironslair = AceLibrary("Babble-Zone-2.2")["Sapphiron's Lair"]
local bbsapphiron = AceLibrary("Babble-Boss-2.2")["Sapphiron"]

module.revision = 30085
module.enabletrigger = module.translatedName
module.toggleoptions = {"frostbreath", "lifedrain", "block", "enrage", "blizzard", "tailsweep", "phase", -1, "proximity", -1, "parry", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Sapphiron",

	frostbreath_cmd = "frostbreath",
    frostbreath_name = "深呼吸警报",
    frostbreath_desc = "当萨菲隆开始施放深呼吸时进行警告。",

	lifedrain_cmd = "lifedrain",
    lifedrain_name = "生命吸取警报",
    lifedrain_desc = "生命吸取诅咒出现时进行警告",
	
	block_cmd = "block",
    block_name = "冰块警报",
    block_desc = "冰块出现时进行警告",
	
	enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒状态出现时进行警告",

	blizzard_cmd = "blizzard",
    blizzard_name = "暴风雪警报",
    blizzard_desc = "暴风雪出现时进行警告",
	
	tailsweep_cmd = "tailsweep",
    tailsweep_name = "龙尾扫击警报",
    tailsweep_desc = "龙尾扫击出现时进行警告",
	
	phase_cmd = "phase",
    phase_name = "阶段转换警报",
    phase_desc = "警告地面/空中阶段",
	
	proximity_cmd = "proximity",
    proximity_name = "近距离警告",
    proximity_desc = "显示近距离警告框架",
	
	parry_cmd = "parry",
    parry_name = "招架警报",
    parry_desc = "招架出现时进行警告",
	
	
	trigger_frostBreath = "begins to cast Frost Breath.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_frostBreath = "冰霜吐息爆炸！",
    msg_frostBreath = "即将遭受冰霜炸弹 - 躲避！",
	
	trigger_lifeDrain = "afflicted by Life Drain", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_lifeDrainResist = "Life Drain was resisted by", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    msg_lifeDrain = "生命吸取，快驱散！",
    bar_lifeDrain = "生命吸取",
	
	trigger_iceboltYou = "You are afflicted by Icebolt.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_iceboltOther = "(.+) is afflicted by Icebolt.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    msg_iceBlock = "冰冻术在 ",
	
		--unused
	trigger_iceboltFade = "Icebolt fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	
	trigger_iceboltHits = "Icebolt hits", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    --bar_iceBlock1 = "冰块 1",
    bar_iceBlock2 = "冰块 2",
    bar_iceBlock3 = "冰块 3",
    bar_iceBlock4 = "冰块 4",
    bar_iceBlock5 = "冰块 5",
	
	trigger_enrage = "Sapphiron gains Enrage", --to be confirmed
    bar_enrage = "激怒",
    msg_enrage60 = "距离激怒还有60秒！",
    msg_enrage10 = "距离激怒还有10秒！",
	
	
	trigger_blizzardYou = "你受到了寒冷效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_blizzardYouFade = "寒冷效果从你身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_tailSweepYou = "Sapphiron's Tail Sweep hits you", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_tailSweep = "尾部横扫在首领后方30码内造成伤害。",
	
    bar_timeToAirPhase = "下一空中阶段 CD",
    --msg_airPhase = "空中阶段 - 分散！",
    msg_airPhaseSoon = "空中阶段即将来临 - 准备分散！",
    bar_timeToGroundPhase = "下一地面阶段",
    msg_groundPhase = "地面阶段！",
	
    msg_lowHp = "萨菲隆血量低于10% - 不再有空中阶段！",
	
	trigger_parryYou = "You attack. Sapphiron parries.", --CHAT_MSG_COMBAT_SELF_MISSES
    msg_parryYou = "你的攻击被萨菲隆招架了 - 别再打坦克了，笨蛋！",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Sapphiron",

	frostbreath_cmd = "frostbreath",
    frostbreath_name = "深呼吸警报",
    frostbreath_desc = "当萨菲隆开始施放深呼吸时进行警告。",

	lifedrain_cmd = "lifedrain",
    lifedrain_name = "生命吸取警报",
    lifedrain_desc = "生命吸取诅咒出现时进行警告",
	
	block_cmd = "block",
    block_name = "冰块警报",
    block_desc = "冰块出现时进行警告",
	
	enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒状态出现时进行警告",

	blizzard_cmd = "blizzard",
    blizzard_name = "暴风雪警报",
    blizzard_desc = "暴风雪出现时进行警告",
	
	tailsweep_cmd = "tailsweep",
    tailsweep_name = "龙尾扫击警报",
    tailsweep_desc = "龙尾扫击出现时进行警告",
	
	phase_cmd = "phase",
    phase_name = "阶段转换警报",
    phase_desc = "警告地面/空中阶段",
	
	proximity_cmd = "proximity",
    proximity_name = "近距离警告",
    proximity_desc = "显示近距离警告框架",
	
	parry_cmd = "parry",
    parry_name = "招架警报",
    parry_desc = "招架出现时进行警告",
	
	
	trigger_frostBreath = "萨菲隆开始施放冰霜吐息。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_frostBreath = "核弹爆炸！",
    msg_frostBreath = "即将遭受冰霜核弹 - 躲避！",
	
	trigger_lifeDrain = "受到了生命吸取效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_lifeDrainResist = "Life Drain was resisted by", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    msg_lifeDrain = "生命吸取，快驱散！",
    bar_lifeDrain = "生命吸取",
	
	trigger_iceboltYou = "你受到了寒冰箭效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_iceboltOther = "(.+)受到了寒冰箭效果的影响。", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    msg_iceBlock = "冰冻术在 ",
	
		--unused
	trigger_iceboltFade = "寒冰箭效果从(.+)身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	
	trigger_iceboltHits = "萨菲隆的寒冰箭击中", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    --bar_iceBlock1 = "冰块 1",
    bar_iceBlock2 = "冰块 2",
    bar_iceBlock3 = "冰块 3",
    bar_iceBlock4 = "冰块 4",
    bar_iceBlock5 = "冰块 5",
	
	trigger_enrage = "萨菲隆获得了狂暴的效果。", --to be confirmed
    bar_enrage = "狂暴",
    msg_enrage60 = "距离狂暴还有60秒！",
    msg_enrage10 = "距离狂暴还有10秒！",
	
	
	trigger_blizzardYou = "你受到了寒冷效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_blizzardYouFade = "寒冷效果从你身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_tailSweepYou = "萨菲隆的龙尾扫击击中你", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_tailSweep = "离开尾部的30码区域！",
	
    bar_timeToAirPhase = "下一空中阶段 CD",
    --msg_airPhase = "空中阶段 - 分散！",
    msg_airPhaseSoon = "空中阶段即将来临 - 准备分散！",
    bar_timeToGroundPhase = "下一地面阶段",
    msg_groundPhase = "地面阶段！",
	
    msg_lowHp = "萨菲隆血量低于10% - 不再有空中阶段！",
	
	trigger_parryYou = "你发起了攻击。萨菲隆招架住了。", --CHAT_MSG_COMBAT_SELF_MISSES
    msg_parryYou = "你的攻击被萨菲隆招架了 - 别再打坦克了，笨蛋！",
} end )

local timer = {
	frostBreath = 7,
	firstLifeDrain = 12,
	lifeDrain = 24,
	
	iceBlock1 = 7,
	iceBlock2 = 4,
	iceBlock3 = 4,
	iceBlock4 = 3.5,
	iceBlock5 = 3,
	
	enrage = 900,
	blizzard = 10,
	tailSweep = 1,
	
	firstGroundPhase = 40,
	groundPhase = 61, --70 was 8.7-9sec too long
	airPhase = 30,
}
local icon = {
	frostBreath = "spell_frost_frostward",
	lifeDrain = "Spell_Shadow_LifeDrain02",
	iceBlock = "spell_frost_frost",
	enrage = "Spell_Shadow_UnholyFrenzy",
	blizzard = "spell_frost_icestorm",
	tailSweep = "inv_misc_monsterscales_05",
	phase = "inv_misc_pocketwatch_01",
	parry = "ability_parry",
}
local color = {
	frostBreath = "Red",
	lifeDrain = "Green",
	iceBlock = "Blue",
	enrage = "Black",
	phase = "White",
}
local syncName = {
	frostBreath = "SapphironBreath"..module.revision,
	lifeDrain = "SapphironLifeDrain"..module.revision,
	iceBlock = "SapphironIceBlock"..module.revision,
	enrage = "SapphironEnrage"..module.revision,
	groundPhase = "SapphironGroundPhase"..module.revision,
	--airPhase = "SapphironAirPhase"..module.revision,
	iceboltHits = "SapphironIceboltHits"..module.revision,
	lowHp = "SapphironLowHp"..module.revision,
	enableProximity = "SapphironEnableProximity"..module.revision,
}

--local lastLifeDrainTime = nil
--local airPhaseTime = nil
local remainingLifeDrainTimer = nil

local lowHp = nil
local phase = "ground"

module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = false

function module:OnRegister()
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("UNIT_HEALTH")
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_lifeDrain, trigger_iceboltYou, trigger_blizzardYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_lifeDrain, trigger_iceboltOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_lifeDrain, trigger_iceboltOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_lifeDrainResist, trigger_tailSweepYou
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_lifeDrainResist
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_frostBreath, trigger_lifeDrainResist
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_iceboltFade, trigger_blizzardYouFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_iceboltFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_iceboltFade
	
	self:RegisterEvent("CHAT_MSG_COMBAT_SELF_MISSES", "Event") --trigger_parryYou
	
	
	self:ThrottleSync(3, syncName.frostBreath)
	self:ThrottleSync(3, syncName.lifeDrain)
	self:ThrottleSync(3, syncName.iceBlock)
	self:ThrottleSync(3, syncName.enrage)
	self:ThrottleSync(3, syncName.groundPhase)
	--self:ThrottleSync(3, syncName.airPhase)
	self:ThrottleSync(30, syncName.iceboltHits)
	self:ThrottleSync(10, syncName.lowHp)
	self:ThrottleSync(10, syncName.enableProximity)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	--lastLifeDrainTime = GetTime()
	--airPhaseTime = GetTime()
	remainingLifeDrainTimer = 60
	
	lowHp = nil
	phase = "ground"
	
	if self.db.profile.enrage then
		self:Bar(L["bar_enrage"], timer.enrage, icon.enrage, true, color.enrage)
		self:DelayedMessage(timer.enrage - 60, L["msg_enrage60"], "Urgent", false, nil, false)
		self:DelayedMessage(timer.enrage - 10, L["msg_enrage10"], "Urgent", false, nil, false)
	end
	
	if self.db.profile.lifedrain then
		self:Bar(L["bar_lifeDrain"], timer.firstLifeDrain, icon.lifeDrain, true, color.lifeDrain)
	end
	
	if self.db.profile.phase then
		self:Bar(L["bar_timeToAirPhase"], timer.firstGroundPhase, icon.phase, true, color.phase)
		self:DelayedMessage(timer.firstGroundPhase, L["msg_airPhaseSoon"], "Important", false, nil, false)
	end
	
	self:DelayedSync(timer.firstGroundPhase, syncName.enableProximity)
end

function module:OnDisengage()
	self:CancelDelayedSync(syncName.enableProximity)
	self:CancelDelayedSync(syncName.groundPhase)
	self:RemoveProximity()
end

function module:MINIMAP_ZONE_CHANGED(msg)
	if GetMinimapZoneText() == bzkelthuzadchamber and self.core:IsModuleActive(module.translatedName) then
		self.core:DisableModule(module.translatedName)
	
	elseif GetMinimapZoneText() == bzeasternplaguelands and self.core:IsModuleActive(module.translatedName) then
		self:TriggerEvent("BigWigs_RebootModule", module.translatedName)
		self:ResetModule()
		DEFAULT_CHAT_FRAME:AddMessage("|cff7fff7f   [BigWigs]|r - 自动重启模块："..module.translatedName)
			
	elseif GetMinimapZoneText() == bzsapphironslair and not self.core:IsModuleActive(module.translatedName) then
		self.core:EnableModule(module.translatedName)
	end
end

function module:ResetModule()
	--lastLifeDrainTime = GetTime()
	--airPhaseTime = GetTime()
	remainingLifeDrainTimer = 60
	
	lowHp = nil
	phase = "ground"
	
	self:CancelDelayedSync(syncName.enableProximity)
	self:CancelDelayedSync(syncName.groundPhase)
	self:RemoveProximity()
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == module.translatedName then
		local healthPct = UnitHealth(msg) * 100 / UnitHealthMax(msg)
		if healthPct >= 10 and lowHp ~= nil then
			lowHp = nil
		elseif healthPct < 10 and lowHp == nil then
			self:Sync(syncName.lowHp)
		end
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_frostBreath"]) then
		self:Sync(syncName.frostBreath)
	
	
	elseif string.find(msg, L["trigger_lifeDrain"]) or string.find(msg, L["trigger_lifeDrainResist"]) then
		self:Sync(syncName.lifeDrain)
		
	elseif string.find(msg, L["trigger_iceboltHits"]) then
		self:Sync(syncName.iceboltHits)
	
	elseif msg == L["trigger_iceboltYou"] then
		self:Sync(syncName.iceBlock.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_iceboltOther"]) then
		local _,_, iceBlockPerson, _ = string.find(msg, L["trigger_iceboltOther"])
		self:Sync(syncName.iceBlock.." "..iceBlockPerson)
		
	elseif msg == L["trigger_blizzardYou"] and self.db.profile.blizzard then
		self:Blizzard()
	elseif msg == L["trigger_blizzardYouFade"] and self.db.profile.blizzard then
		self:BlizzardFade()
		
	elseif string.find(msg, L["trigger_tailSweepYou"]) and self.db.profile.tailsweep then
		self:TailSweep()
		
	elseif string.find(msg, L["trigger_parryYou"]) and self.db.profile.parry then
		if UnitName("Target") ~= nil and UnitName("TargetTarget") ~= nil then
			if UnitName("Target") == bbsapphiron and UnitName("TargetTarget") ~= UnitName("Player") then
				self:ParryYou()
			end
		end
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.frostBreath and self.db.profile.frostbreath then
		self:FrostBreath()
	elseif sync == syncName.lifeDrain and self.db.profile.lifedrain then
		self:LifeDrain()
	elseif sync == syncName.iceboltHits then
		self:IceboltHits()
	elseif sync == syncName.iceBlock and rest then
		self:IceBlock(rest)
	elseif sync == syncName.groundPhase then
		self:GroundPhase()
	--elseif sync == syncName.airPhase then
	--	self:AirPhase()
	elseif sync == syncName.lowHp and lowHp == nil then
		self:LowHp()
	elseif sync == syncName.enableProximity and self.db.profile.proximity then
		self:EnableProximity()
	end
end


function module:FrostBreath()
	self:RemoveBar(L["bar_timeToGroundPhase"])
	
	--self:RemoveBar(L["bar_iceBlock1"])
	self:RemoveBar(L["bar_iceBlock2"])
	self:RemoveBar(L["bar_iceBlock3"])
	self:RemoveBar(L["bar_iceBlock4"])
	self:RemoveBar(L["bar_iceBlock5"])
	
	self:CancelDelayedBar(L["bar_iceBlock3"])
	self:CancelDelayedBar(L["bar_iceBlock4"])
	self:CancelDelayedBar(L["bar_iceBlock5"])
	
	if self.db.profile.frostbreath then
		self:Bar(L["bar_frostBreath"], timer.frostBreath, icon.frostBreath, true, color.frostBreath)
		self:Message(L["msg_frostBreath"], "Urgent", false, nil, false)
		self:WarningSign(icon.frostBreath, 1)
		self:Sound("Beware")
	end
	
	if self.db.profile.phase then
		self:Bar(L["bar_timeToGroundPhase"], timer.frostBreath + 1, icon.phase, true, color.phase)
	end
	
	if self.db.profile.proximity then
		self:RemoveProximity()
	end
	
	self:DelayedSync(timer.frostBreath + 1, syncName.groundPhase)
end

function module:LifeDrain()
	--lastLifeDrainTime = GetTime()
	self:Bar(L["bar_lifeDrain"], timer.lifeDrain, icon.lifeDrain, true, color.lifeDrain)
	
	if UnitClass("Player") == BC["Mage"] or UnitClass("Player") == BC["Druid"] then
		self:Message(L["msg_lifeDrain"], "Personal", false, nil, false)
		self:WarningSign(icon.lifeDrain, 0.7)
		self:Sound("Long")
	end
end

function module:IceBlock(rest)
	if self.db.profile.block then
		self:Message(L["msg_iceBlock"]..rest, "Important", false, nil, false)
	end
	
	if rest == UnitName("Player") then
		SendChatMessage("寒冰屏障在 "..UnitName("Player").."!","YELL")
	end
end

function module:Enrage()
	self:RemoveBar(L["bar_enrage"])
	self:WarningSign(icon.enrage, 1)
	self:Sound("Beware")
end

function module:IceboltHits()
	if phase == "ground" then
		phase = "air"
		--airPhaseTime = GetTime() - 7
	end
	
	self:RemoveBar(L["bar_timeToGroundPhase"])
	self:RemoveBar(L["bar_lifeDrain"])
	self:RemoveBar(L["bar_timeToAirPhase"])
	
	if self.db.profile.proximity then
		self:TriggerEvent("BigWigs_ShowProximity")
	end
	
	if self.db.profile.phase then
		self:Bar(L["bar_timeToGroundPhase"], timer.airPhase - timer.iceBlock1, icon.phase, true, color.phase)
	end
	
	if self.db.profile.block then
		self:Bar(L["bar_iceBlock2"], timer.iceBlock2, icon.iceBlock, true, color.iceBlock)
		self:DelayedBar(timer.iceBlock2, L["bar_iceBlock3"], timer.iceBlock3, icon.iceBlock, true, color.iceBlock)
		self:DelayedBar(timer.iceBlock2 + timer.iceBlock3, L["bar_iceBlock4"], timer.iceBlock4, icon.iceBlock, true, color.iceBlock)
		self:DelayedBar(timer.iceBlock2 + timer.iceBlock3 + timer.iceBlock4, L["bar_iceBlock5"], timer.iceBlock5, icon.iceBlock, true, color.iceBlock)
	end
end

function module:Blizzard()
	self:WarningSign(icon.blizzard, timer.blizzard)
	self:Sound("Info")
end

function module:BlizzardFade()
	self:RemoveWarningSign(icon.blizzard)
end

function module:TailSweep()
	self:Message(L["msg_tailSweep"], "Personal", false, nil, false)
	self:WarningSign(icon.tailSweep, timer.tailSweep)
end

function module:GroundPhase()
	phase = "ground"
	
	self:RemoveBar(L["bar_timeToGroundPhase"])
	
	--self:RemoveBar(L["bar_iceBlock1"])
	self:RemoveBar(L["bar_iceBlock2"])
	self:RemoveBar(L["bar_iceBlock3"])
	self:RemoveBar(L["bar_iceBlock4"])
	self:RemoveBar(L["bar_iceBlock5"])
	
	self:CancelDelayedBar(L["bar_iceBlock2"])
	self:CancelDelayedBar(L["bar_iceBlock3"])
	self:CancelDelayedBar(L["bar_iceBlock4"])
	self:CancelDelayedBar(L["bar_iceBlock5"])
	
	self:RemoveBar(L["bar_frostBreath"])
	
	if self.db.profile.proximity then
		self:RemoveProximity()
		self:DelayedSync(timer.groundPhase, syncName.enableProximity)
	end
	
	self:CancelDelayedSync(syncName.groundPhase)
	
	if self.db.profile.lifedrain then
		--remainingLifeDrainTimer = timer.lifeDrain - (airPhaseTime - lastLifeDrainTime)
		self:Bar(L["bar_lifeDrain"], 6, icon.lifeDrain, true, color.lifeDrain)
	end
	
	if lowHp == nil then
		if self.db.profile.phase then
			self:Bar(L["bar_timeToAirPhase"], timer.groundPhase, icon.phase, true, color.phase)
			self:Message(L["msg_groundPhase"], "Important", false, nil, false)
		end
	end
end

function module:EnableProximity()
	self:TriggerEvent("BigWigs_ShowProximity")
end

function module:RemoveProximity()
	self:TriggerEvent("BigWigs_HideProximity")
end

function module:LowHp()
	lowHp = true
	
	if phase == "ground" then
		self:RemoveBar(L["bar_timeToAirPhase"])
	end
	
	self:Message(L["msg_lowHp"], "Important", false, nil, false)
end

function module:ParryYou()
	self:WarningSign(icon.parry, 0.7)
	self:Message(L["msg_parryYou"], "Personal", false, nil, false)
	self:Sound("Info")
end
