
local module, L = BigWigs:ModuleDeclaration("Antnormi", "The Black Morass")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30035
module.enabletrigger = module.translatedName
module.toggleoptions = {"fear", "shadowshock", "enrage", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["The Black Morass"],
	AceLibrary("Babble-Zone-2.2")["The Black Morass"],
}

L:RegisterTranslations("enUS", function() return {
    cmd = "Antnormi",

    fear_cmd = "fear",
    fear_name = "恐惧警报",
    fear_desc = "恐惧出现时进行警告",
    
    shadowshock_cmd = "shadowshock",
    shadowshock_name = "暗影震击警报",
    shadowshock_desc = "暗影震击出现时进行警告",
    
    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",
    
    
    trigger_engage = "We are Infinite!Your journey ends here now, time will belong to US!",--CHAT_MSG_MONSTER_YELL
    
    trigger_fearCastStart = "is preparing for a bellowing roar!",--CHAT_MSG_RAID_BOSS_EMOTE
    bar_fearCast = "正在施放恐惧",
    
    trigger_fearCastEnd = "afflicted by Cowering Roar",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_fearDuration = "恐惧中！",
    bar_fearCd = "恐惧冷却",
    
    trigger_shadowShock = "Antnormi's Shadow Shock",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_FRIENDLYPLAYER_DAMAGE
    bar_shadowShockCd = "暗影震击冷却",
    
    trigger_enrage = "Antnormi gains Enrage.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrage = "激怒！",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Antnormi",

    fear_cmd = "fear",
    fear_name = "恐惧警报",
    fear_desc = "恐惧出现时进行警告",
    
    shadowshock_cmd = "shadowshock",
    shadowshock_name = "暗影震击警报",
    shadowshock_desc = "暗影震击出现时进行警告",
    
    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",
    
    
    trigger_engage = "We are Infinite!Your journey ends here now, time will belong to US!",--CHAT_MSG_MONSTER_YELL
    
    trigger_fearCastStart = "is preparing for a bellowing roar!",--CHAT_MSG_RAID_BOSS_EMOTE
    bar_fearCast = "正在施放恐惧",
    
    trigger_fearCastEnd = "afflicted by Cowering Roar",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_fearDuration = "恐惧中！",
    bar_fearCd = "恐惧冷却",
    
    trigger_shadowShock = "Antnormi's Shadow Shock",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_FRIENDLYPLAYER_DAMAGE
    bar_shadowShockCd = "暗影震击冷却",
    
    trigger_enrage = "Antnormi gains Enrage.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrage = "激怒！",
} end )

local timer = {
	firstFearCd = 20,
	fearCd = 20,--25sec between each fear emote
	fearCast = 7,
	fearDuration = 5,
	shadowShockCd = 10,
}
local icon = {
	fear = "ability_devour",
	shadowShock = "spell_shadow_shadowbolt",
	enrage = "Spell_Shadow_UnholyFrenzy",
}
local color = {
	fearCd = "Black",
	fearCast = "Red",
	fearDuration = "Cyan",
	shadowShock = "Green",
}
local syncName = {
	fearCastStart = "AntnormiFearCastStart"..module.revision,
	fearCastEnd = "AntnormiFearCastEnd"..module.revision,
	shadowShock = "AntnormiShadowShock"..module.revision,
	enrage = "AntnormiEnrage"..module.revision,
}


function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_fearCastEnd
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_fearCastEnd
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_fearCastEnd
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--trigger_shadowShock
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_shadowShock
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_shadowShock
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--trigger_enrage
		
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")--trigger_engage
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")--trigger_fearCast
		
	self:ThrottleSync(3, syncName.fearCastStart)
	self:ThrottleSync(3, syncName.fearCastEnd)
	self:ThrottleSync(3, syncName.shadowShock)
	self:ThrottleSync(3, syncName.enrage)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	self:Bar(L["bar_fearCd"], timer.firstFearCd, icon.fear, true, color.fearCd)
end

function module:OnDisengage()
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()
	end
end

function module:CHAT_MSG_RAID_BOSS_EMOTE(msg, sender)
	if string.find(msg, L["trigger_fearCastStart"]) then
		self:Sync(syncName.fearCastStart)
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_fearCastEnd"]) then
		self:Sync(syncName.fearCastEnd)
	elseif string.find(msg, L["trigger_shadowShock"]) then
		self:Sync(syncName.shadowShock)
	elseif string.find(msg, L["trigger_enrage"]) then
		self:Sync(syncName.enrage)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.fearCastStart and self.db.profile.fear then
		self:FearCastStart()
	elseif sync == syncName.fearCastEnd and self.db.profile.fear then
		self:FearCastEnd()
	elseif sync == syncName.shadowShock and self.db.profile.shadowshock then
		self:ShadowShock()
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
	end
end


function module:FearCastStart()
	self:RemoveBar(L["bar_fearCd"])
	self:Bar(L["bar_fearCast"], timer.fearCast, icon.fear, true, color.fearCast)
	if UnitClass("Player") == BC["Shaman"] then
		self:WarningSign("spell_nature_tremortotem", 0.7)
	end
end

function module:FearCastEnd()
	self:RemoveBar(L["bar_fearCast"])
	self:Bar(L["bar_fearDuration"], timer.fearDuration, icon.fear, true, color.fearDuration)
	self:DelayedBar(timer.fearDuration, L["bar_fearCd"], timer.fearCd, icon.fear, true, color.fearCd)
end

function module:ShadowShock()
	self:RemoveBar(L["bar_shadowShockCd"])
	self:Bar(L["bar_shadowShockCd"], timer.shadowShockCd, icon.shadowShock, true, color.shadowShock)
end

function module:Enrage()
	self:Message(L["msg_enrage"], "Attention", false, nil, false)
	self:WarningSign(icon.enrage, 0.7)
	self:Sound("Beware")
end
