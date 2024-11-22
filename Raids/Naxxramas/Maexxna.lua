local module, L = BigWigs:ModuleDeclaration("Maexxna", "Naxxramas")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30071
module.enabletrigger = module.translatedName
module.toggleoptions = { "cocoon", "webspray", "poison", "enrage", "spiderlings", "bosskill" }

L:RegisterTranslations("enUS", function() return {
	cmd = "Maexxna",
	
	cocoon_cmd = "cocoon",
    cocoon_name = "蛛网之茧警报",
    cocoon_desc = "警告被蛛网之茧的玩家",

    webspray_cmd = "spray",
    webspray_name = "撒网警报",
    webspray_desc = "即将撒网时进行警告",

    poison_cmd = "Poison",
    poison_name = "死灵之毒警报",
    poison_desc = "死灵之毒出现时进行警告",

    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",

    spiderlings_cmd = "spiderlings",
    spiderlings_name = "小蜘蛛警报",
    spiderlings_desc = "小蜘蛛出现时进行警告",


	trigger_cocoonGain = "(.+) is afflicted by Web Wrap.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_cocoonGainYou = "You are afflicted by Web Wrap.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_cocoonFade = "Web Wrap fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
    bar_cocoonGain = "蛛网之茧 ",
    bar_cocoonCD = "蛛网之茧 CD",

	trigger_webSprayGain = "afflicted by Web Spray.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_webSprayGain = "撒网",
    bar_webSprayCD = "撒网 CD",
	
	trigger_webSprayFade = "Web Spray fades from",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF

	trigger_poisonGain = "afflicted by Necrotic Poison.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_poisonGain = "坦克身上的腐蚀！",
    bar_poisonCD = "死灵之毒 CD",
	
	trigger_poisonFade = "Necrotic Poison fades",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_enrageGain = "Maexxna gains Enrage.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrageGain = "迈克斯纳激怒了！",
    msg_enrageSoon = "迈克斯纳血量低于35% - 30%时会激怒！",
	
    bar_spiderlings = "小蜘蛛",
	
	--spray every 40sec
		--last for 8sec
	--cocoon after 20sec
	--lings after 35sec
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	cmd = "Maexxna",
	
	cocoon_cmd = "cocoon",
    cocoon_name = "蛛网之茧警报",
    cocoon_desc = "警告被蛛网之茧的玩家",

    webspray_cmd = "spray",
    webspray_name = "撒网警报",
    webspray_desc = "即将撒网时进行警告",

    poison_cmd = "Poison",
    poison_name = "死灵之毒警报",
    poison_desc = "死灵之毒出现时进行警告",

    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",

    spiderlings_cmd = "spiderlings",
    spiderlings_name = "小蜘蛛警报",
    spiderlings_desc = "小蜘蛛出现时进行警告",


	trigger_cocoonGain = "(.+)受到了蛛网之茧效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_cocoonGainYou = "你受到了蛛网之茧效果的影响。",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_cocoonFade = "蛛网之茧效果从(.+)身上消失了。",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
    bar_cocoonGain = "蛛网之茧",
    bar_cocoonCD = "蛛网之茧 CD",

	trigger_webSprayGain = "受到了蛛网喷射效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_webSprayGain = "群体被网",
    bar_webSprayCD = "群体蛛网 CD",
	
	trigger_webSprayFade = "蛛网喷射效果从",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF

	trigger_poisonGain = "受到了死灵之毒效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_poisonGain = "死灵之毒持续！",
    bar_poisonCD = "死灵之毒 CD",
	
	trigger_poisonFade = "死灵之毒效果从",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_enrageGain = "迈克斯纳获得了激怒的效果。",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrageGain = "迈克斯纳激怒了！",
    msg_enrageSoon = "迈克斯纳血量低于35% - 30%时会激怒！",
	
    bar_spiderlings = "小蜘蛛",
	
	--spray every 40sec
		--last for 8sec
	--cocoon after 20sec
	--lings after 35sec
} end )

local timer = {
	cocoonDuration = 600,
    cocoonCD = 20,
	websprayDuration = 10,
	websprayCD = 40,
	poisonDuration = 30,
    firstPoison = 15,--14.89
    spiderlings = 30,
}
local icon = {
	cocoon = "Spell_Nature_Web",
	webspray = "Ability_Ensnare",
	poison = "Ability_Creature_Poison_03",
	enrage = "Spell_shadow_unholyfrenzy",
    spiderlings = "INV_Misc_MonsterSpiderCarapace_01",
}
local color = {
	poison = "Green",
	cocoon = "Blue",
	spiderlings = "Red",
	webspray = "White",
}
local syncName = {
	cocoon = "MaexxnaCocoon" .. module.revision,
	cocoonFade = "MaexxnaCocoonFade" .. module.revision,
    webspray = "MaexxnaWebspray" .. module.revision,
	websprayFade = "MaexxnaWebsprayFade" .. module.revision,
    poison = "MaexxnaPoison" .. module.revision,
	poisonFade = "MaexxnaPoisonFade" .. module.revision,
    enrage = "MaexxnaEnrage" .. module.revision,
	lowHp = "MaexxnaLowHp" .. module.revision,
}

local lowHp = nil

function module:OnEnable()
	self:RegisterEvent("UNIT_HEALTH")
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_cocoonGainYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_cocoonGain
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_cocoonGain
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_webSprayFade, trigger_poisonFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_webSprayFade, trigger_poisonFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_webSprayFade, trigger_poisonFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_enrageGain
	
	
	self:ThrottleSync(0, syncName.cocoon)
	self:ThrottleSync(0, syncName.cocoonFade)
    self:ThrottleSync(8, syncName.webspray)
	self:ThrottleSync(8, syncName.websprayFade)
    self:ThrottleSync(2, syncName.poison)
	self:ThrottleSync(2, syncName.poisonFade)
	self:ThrottleSync(10, syncName.enrage)
	self:ThrottleSync(10, syncName.lowHp)
end

function module:OnSetup()
end

function module:OnEngage()
    lowHp = nil
	
	if self.db.profile.poison then
		self:Bar(L["bar_poisonCD"], timer.firstPoison, icon.poison, true, color.poison)
	end
	
	if self.db.profile.cocoon then
		self:Bar(L["bar_cocoonCD"], timer.cocoonCD, icon.cocoon, true, color.cocoon)
	end
	
	if self.db.profile.spiderlings then
		self:Bar(L["bar_spiderlings"], timer.spiderlings, icon.spiderlings, true, color.spiderlings)
	end
    
	if self.db.profile.webspray then
		self:Bar(L["bar_webSprayCD"], timer.websprayCD, icon.webspray, true, color.webspray)
	end
end

function module:OnDisengage()
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == module.translatedName then
		local healthPct = UnitHealth(msg) * 100 / UnitHealthMax(msg)
		if healthPct >= 35 and lowHp ~= nil then
			lowHp = nil
		elseif healthPct < 35 and lowHp == nil then
			self:Sync(syncName.lowHp)
		end
	end
end

function module:Event(msg)
    if string.find(msg, L["trigger_cocoonGain"]) then
		local _, _, cocoonedPlayer, _ = string.find(msg, L["trigger_cocoonGain"])
		self:Sync(syncName.cocoon .. " " .. cocoonedPlayer)
	elseif msg == L["trigger_cocoonGainYou"] then
		cocoonedPlayer = UnitName("Player")
		self:Sync(syncName.cocoon .. " " .. cocoonedPlayer)
	elseif string.find(msg, L["trigger_cocoonFade"]) then
		local _, _, cocoonedPlayerFade, _ = string.find(msg, L["trigger_cocoonFade"])
		self:Sync(syncName.cocoonFade .. " " .. cocoonedPlayerFade)
	
	
	elseif string.find(msg, L["trigger_webSprayGain"]) then
		self:Sync(syncName.webspray)
	elseif string.find(msg, L["trigger_webSprayFade"]) then
		self:Sync(syncName.websprayFade)
	
	elseif string.find(msg, L["trigger_poisonGain"]) then
		self:Sync(syncName.poison)
	elseif string.find(msg, L["trigger_poisonFade"]) then
		self:Sync(syncName.poisonFade)
	
	elseif msg == L["trigger_enrageGain"] then
		self:Sync(syncName.enrage)
	end
end


function module:BigWigs_RecvSync(sync, rest)
    if sync == syncName.cocoon and rest and self.db.profile.cocoon then
        self:Cocoon(rest)
	elseif sync == syncName.cocoonFade and rest and self.db.profile.cocoon then
        self:CocoonFade(rest)
	elseif sync == syncName.webspray and self.db.profile.webspray then
        self:Webspray()
	elseif sync == syncName.websprayFade then
        self:WebsprayFade()
    elseif sync == syncName.poison and self.db.profile.poison then
        self:Poison()
    elseif sync == syncName.poisonFade and self.db.profile.poison then
        self:PoisonFade()
    elseif sync == syncName.enrage and self.db.profile.enrage then
        self:Enrage()
	elseif sync == syncName.lowHp and self.db.profile.enrage then
        self:LowHp()
    end
end


function module:Cocoon(rest)
    self:RemoveBar(L["bar_cocoonCD"])
	self:Bar(L["bar_cocoonGain"]..rest, timer.cocoonDuration, icon.cocoon, true, color.cocoon)
end

function module:CocoonFade(rest)
	self:RemoveBar(L["bar_cocoonGain"]..rest)
end

function module:Webspray()
	self:RemoveBar(L["bar_webSprayCD"])
	self:RemoveBar(L["bar_spiderlings"])
	self:Bar(L["bar_webSprayGain"], timer.websprayDuration, icon.webspray, true, color.webspray)
end

function module:WebsprayFade()
	self:RemoveBar(L["bar_webSprayGain"])
	
	if self.db.profile.webspray then
		self:Bar(L["bar_webSprayCD"], timer.websprayCD - timer.websprayDuration, icon.webspray, true, color.webspray)
	end
	if self.db.profile.cocoon then
		self:Bar(L["bar_cocoonCD"], timer.cocoonCD - timer.websprayDuration, icon.cocoon, true, color.cocoon)
	end
	if self.db.profile.spiderlings then
		self:Bar(L["bar_spiderlings"], timer.spiderlings - timer.websprayDuration, icon.spiderlings, true, color.spiderlings)
	end
end

function module:Poison()
	self:RemoveBar(L["bar_poisonCD"])
	self:Bar(L["bar_poisonGain"], timer.poisonDuration, icon.poison, true, "Green")
	if UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Druid"] then
		self:WarningSign(icon.poison, 0.7)
	end
end

function module:PoisonFade()
	self:RemoveBar(L["bar_poisonGain"])
end

function module:Enrage()
	self:Sound("Beware")
	self:Message(L["msg_enrageGain"], "Urgent", false, nil, false)
	self:WarningSign(icon.enrage, 0.7)
end

function module:LowHp()
	lowHp = true
	self:Sound("BikeHorn")
	self:Message(L["msg_enrageSoon"], "Attention", false, nil, false)
end
