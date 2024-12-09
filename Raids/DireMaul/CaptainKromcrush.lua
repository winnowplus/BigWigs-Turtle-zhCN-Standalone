local module, L = BigWigs:ModuleDeclaration("Captain Kromcrush", "Dire Maul")
local BC = AceLibrary("Babble-Class-2.2")
local bbcaptainkromcrush = AceLibrary("Babble-Boss-2.2")["Captain Kromcrush"]

module.revision = 30002
module.enabletrigger = module.translatedName
module.toggleoptions = {"retaliation", "adds", "fear", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Dire Maul"],
	AceLibrary("Babble-Zone-2.2")["Dire Maul"],
}

L:RegisterTranslations("enUS", function() return {
    cmd = "CaptainKromcrush",

    retaliation_cmd = "retaliation",
    retaliation_name = "反击风暴警告",
    retaliation_desc = "通报他的反击风暴技能",

    adds_cmd = "adds",
    adds_name = "增援警告",
    adds_desc = "通报增援被召唤时",

    fear_cmd = "fear",
    fear_name = "恐惧警告",
    fear_desc = "恐惧计时条",

    fearTrigger = "afflicted by Intimidating Shout",
    fearTrigger2 = "Intimidating Shout fail",
    fearMessage = "被恐惧",
    fearBar = "恐惧冷却",

    retaliationUpTrigger = "Captain Kromcrush gains Retaliation",
    retaliationUpMessage = "反击风暴！停止输出！",

    retaliationDownTrigger = "Retaliation fades from Captain Kromcrush",
    retaliationDownMessage = "反击风暴结束！上！",

    retaliationHurtTrigger = "Captain Kromcrush's Retaliation hits you for",
    retaliationHurtMessage = "我是个白痴，被反击风暴伤害到了",

    addsTrigger = "Help me crush these punys",
    addsUpMessage = "增援出现了！",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "CaptainKromcrush",

    retaliation_cmd = "retaliation",
    retaliation_name = "反击风暴警告",
    retaliation_desc = "通报他的反击风暴技能",

    adds_cmd = "adds",
    adds_name = "增援警告",
    adds_desc = "通报增援被召唤时",

    fear_cmd = "fear",
    fear_name = "恐惧警告",
    fear_desc = "恐惧计时条",

    fearTrigger = "afflicted by Intimidating Shout",
    fearTrigger2 = "Intimidating Shout fail",
    fearMessage = "被恐惧",
    fearBar = "恐惧冷却",

    retaliationUpTrigger = "Captain Kromcrush gains Retaliation",
    retaliationUpMessage = "反击风暴！停止输出！",

    retaliationDownTrigger = "Retaliation fades from Captain Kromcrush",
    retaliationDownMessage = "反击风暴结束！上！",

    retaliationHurtTrigger = "Captain Kromcrush's Retaliation hits you for",
    retaliationHurtMessage = "我是个白痴，被反击风暴伤害到了",

    addsTrigger = "Help me crush these punys",
    addsUpMessage = "增援出现了！",
} end)

local timer = {
	retaliation = 15,
	fear = 11.4,
}

local icon = {
	retaliation = "ability_warrior_challange",
	fear = "spell_shadow_possession",
	sheep = "spell_nature_polymorph",
	trap = "spell_frost_chainsofice",
	tremor = "spell_nature_tremortotem",
}

local syncName = {
}

local _, playerClass = UnitClass("player")

local lastFear = 0

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL", "Event")
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
end

function module:OnSetup()

end

function module:OnEngage()
	if playerClass == BC["Shaman"] then
		self:WarningSign(icon.tremor, 0.7)
		self:Sound("Beware")
	end
	self:Bar(L["fearBar"], timer.fear, icon.fear, true, "white")
	if klhtm and UnitName("target") == bbcaptainkromcrush and (IsRaidLeader() or IsRaidOfficer()) then
		klhtm.net.sendmessage("target " .. bbcaptainkromcrush)
	end
end

function module:OnDisengage()

end

function module:Event(msg)
	if string.find(msg, L["fearTrigger"]) or string.find(msg, L["fearTrigger2"]) then
		self:Fear()
	end
	if string.find(msg, L["addsTrigger"]) then
		self:AddsUp()
	end
	if string.find(msg, L["retaliationUpTrigger"]) then
		self:RetaliationUp()
	end
	if string.find(msg, L["retaliationDownTrigger"]) then
		self:RetaliationDown()
	end
	if string.find(msg, L["retaliationHurtTrigger"]) then
		self:RetaliationHurt()
	end
end

function module:AddsUp()
	if playerClass == BC["Priest"] or playerClass == BC["Warlock"] then
		self:WarningSign(icon.fear, 0.7)
	end
	if playerClass == BC["Mage"] then
		self:WarningSign(icon.sheep, 0.7)
	end
	if playerClass == BC["Hunter"] then
		self:WarningSign(icon.trap, 0.7)
	end
	self:Message(L["addsUpMessage"], "Urgent", false, "Beware", false)
end

function module:Fear()
	if GetTime() > lastFear + 2 then
		lastFear = GetTime()
		self:Message(L["fearMessage"], "Attention", false, "Long", false)
		self:Bar(L["fearBar"], timer.fear, icon.fear, true, "white")
	end
end

function module:RetaliationUp()
	if playerClass == BC["Warrior"] or playerClass == BC["Rogue"] then
		self:Message(L["retaliationUpMessage"], "Important", false, "Beware", false)
		self:WarningSign(icon.retaliation, 15)
	end
end

function module:RetaliationDown()
	if playerClass == BC["Warrior"] or playerClass == BC["Rogue"] then
		self:Message(L["retaliationDownMessage"], "Important", false, "gogogo", false)
		self:RemoveWarningSign(icon.retaliation)
	end
end

function module:RetaliationHurt()
	self:SendSay(L["retaliationHurtMessage"])
end
