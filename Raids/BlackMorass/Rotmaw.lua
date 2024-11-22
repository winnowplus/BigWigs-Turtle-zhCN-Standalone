local module, L = BigWigs:ModuleDeclaration("Rotmaw", "The Black Morass")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30029
module.enabletrigger = module.translatedName
module.toggleoptions = {"contagionofrot", "consume", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["The Black Morass"],
	AceLibrary("Babble-Zone-2.2")["The Black Morass"],
}

L:RegisterTranslations("enUS", function() return {
    cmd = "Rotmaw",

    contagionofrot_cmd = "contagionofrot",
    contagionofrot_name = "腐化传染警报",
    contagionofrot_desc = "腐化传染出现时进行警告",
    
    consume_cmd = "consume",
    consume_name = "吞噬警报",
    consume_desc = "吞噬出现时进行警告",

        
    trigger_contagionOfRotYou = "You are afflicted by Contagion of Rot.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_contagionOfRotOther = "(.+) is afflicted by Contagion of Rot.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_contagionOfRotFade = "Contagion of Rot fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_contagionOfRot = "腐败之源",
    
    trigger_consumeYou = "You are afflicted by Consume.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_consumeOther = "(.+) is afflicted by Consume.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_consumeFade = "Consume fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_consume = "被吞噬",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Rotmaw",

    contagionofrot_cmd = "contagionofrot",
    contagionofrot_name = "腐化传染警报",
    contagionofrot_desc = "腐化传染出现时进行警告",
    
    consume_cmd = "consume",
    consume_name = "吞噬警报",
    consume_desc = "吞噬出现时进行警告",

        
    trigger_contagionOfRotYou = "You are afflicted by Contagion of Rot.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_contagionOfRotOther = "(.+) is afflicted by Contagion of Rot.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_contagionOfRotFade = "Contagion of Rot fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_contagionOfRot = "腐败之源",
    
    trigger_consumeYou = "You are afflicted by Consume.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_consumeOther = "(.+) is afflicted by Consume.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_consumeFade = "Consume fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_consume = "被吞噬",
    you = "you",
} end )

local timer = {
	contagionOfRot = 240,
	consume = 15,
}
local icon = {
	contagionOfRot = "spell_shadow_callofbone",
	consume = "spell_nature_drowsy",
}
local color = {
	contagionOfRot = "Green",
	consume = "Red",
}
local syncName = {
	contagionOfRot = "RotmawContagionOfRot"..module.revision,
	contagionOfRotFade = "RotmawContagionOfRotFade"..module.revision,
	consume = "RotmawConsume"..module.revision,
	consumeFade = "RotmawConsumeFade"..module.revision,
}


function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_contagionOfRotYou, trigger_consumeYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_contagionOfRotOther, trigger_consumeOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_contagionOfRotOther, trigger_consumeOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_contagionOfRotFade, trigger_consumeFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_contagionOfRotFade, trigger_consumeFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_contagionOfRotFade, trigger_consumeFade
		
	self:ThrottleSync(3, syncName.contagionOfRot)
	self:ThrottleSync(3, syncName.contagionOfRotFade)
	self:ThrottleSync(3, syncName.consume)
	self:ThrottleSync(3, syncName.consumeFade)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_contagionOfRotYou"] then
		self:Sync(syncName.contagionOfRot .. " " .. UnitName("Player"))
		
	elseif string.find(msg, L["trigger_contagionOfRotOther"]) then
		local _,_, contagionOfRotPlayer, _ = string.find(msg, L["trigger_contagionOfRotOther"])
		self:Sync(syncName.contagionOfRot .. " " .. contagionOfRotPlayer)
		
	elseif string.find(msg, L["trigger_contagionOfRotFade"]) then
		local _,_, contagionOfRotFadePlayer, _ = string.find(msg, L["trigger_contagionOfRotFade"])
		if contagionOfRotFadePlayer == L["you"] then contagionOfRotFadePlayer = UnitName("Player") end
		self:Sync(syncName.contagionOfRotFade .. " " .. contagionOfRotFadePlayer)
		
		
	elseif msg == L["trigger_consumeYou"] then
		self:Sync(syncName.consume .. " " .. UnitName("Player"))
		
	elseif string.find(msg, L["trigger_consumeOther"]) then
		local _,_, consumePlayer, _ = string.find(msg, L["trigger_consumeOther"])
		self:Sync(syncName.consume .. " " .. consumePlayer)
		
	elseif string.find(msg, L["trigger_consumeFade"]) then
		local _,_, consumeFadePlayer, _ = string.find(msg, L["trigger_consumeFade"])
		if consumeFadePlayer == L["you"] then consumeFadePlayer = UnitName("Player") end
		self:Sync(syncName.consumeFade .. " " .. consumeFadePlayer)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.contagionOfRot and rest and self.db.profile.contagionofrot then
		self:ContagionOfRot(rest)
	elseif sync == syncName.contagionOfRotFade and rest and self.db.profile.contagionofrot then
		self:ContagionOfRotFade(rest)
	elseif sync == syncName.consume and rest and self.db.profile.consume then
		self:Consume(rest)
	elseif sync == syncName.consumeFade and rest and self.db.profile.consume then
		self:ConsumeFade(rest)
	end
end


function module:ContagionOfRot(rest)
	self:Bar(rest..L["bar_contagionOfRot"], timer.contagionOfRot, icon.contagionOfRot, true, color.contagionOfRot)
	
	if UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Priest"] or UnitClass("Player") == BC["Shaman"] then
		self:WarningSign(icon.contagionOfRot, 0.7)
	end
end

function module:ContagionOfRotFade(rest)
	self:RemoveBar(rest..L["bar_contagionOfRot"])
end

function module:Consume(rest)
	self:Bar(rest..L["bar_consume"], timer.consume, icon.consume, true, color.consume)
end

function module:ConsumeFade(rest)
	self:RemoveBar(rest..L["bar_consume"])
end
