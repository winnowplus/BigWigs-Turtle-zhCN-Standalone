
local module, L = BigWigs:ModuleDeclaration("Doctor Weavil", "Dustwallow Marsh")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30051
module.enabletrigger = module.translatedName
module.toggleoptions = {"mindshatter", "mc", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
	AceLibrary("Babble-Zone-2.2")["Dustwallow Marsh"],
}

L:RegisterTranslations("enUS", function() return {
    cmd = "DoctorWeavil",

    mindshatter_cmd = "mindshatter",
    mindshatter_name = "心灵碎裂警报",
    mindshatter_desc = "心灵碎裂时进行警告",

    mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制时进行警告",
    

        --AoE, 10sec CD, casts 0-6sec after, AoE 30 yards, 1k ish shadow damage + stun
    trigger_mindShatter = "'s Mind Shatter", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_mindShatterCd = "心灵碎裂 CD",
    bar_mindShatterSoon = "心灵碎裂 即将到来...",
    
    trigger_mcYou = "You are afflicted by Mental Domination.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_mcOther = "(.+) is afflicted by Mental Domination.", --CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_mcFade = "Mental Domination fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mc = " 精神控制",
    clickme = " >点击我！<",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "DoctorWeavil",

    mindshatter_cmd = "mindshatter",
    mindshatter_name = "心灵碎裂警报",
    mindshatter_desc = "心灵碎裂时进行警告",

    mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制时进行警告",
    

        --AoE, 10sec CD, casts 0-6sec after, AoE 30 yards, 1k ish shadow damage + stun
    trigger_mindShatter = "'s Mind Shatter", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_mindShatterCd = "心灵碎裂 CD",
    bar_mindShatterSoon = "心灵碎裂 即将到来...",
    
    trigger_mcYou = "You are afflicted by Mental Domination.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_mcOther = "(.+) is afflicted by Mental Domination.", --CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_mcFade = "Mental Domination fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mc = " 精神控制",
    clickme = " >点击我！<",
    you = "you",
} end )

local timer = {
	mindShatterCd = 10,
	mindShatterSoon = 6,
	mc = 120,
}
local icon = {
	mindShatter = "spell_nature_earthquake",
	mc = "spell_shadow_metamorphosis",
}
local color = {
	mindShatter = "Black",
	mindShatterSoon = "Cyan",
	mc = "Red",
}
local syncName = {
	mindShatter = "DrWeavilMindShatter"..module.revision,
	mc = "DrWeavilMc"..module.revision,
	mcFade = "DrWeavilMcFade"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	
	
	
	
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--trigger_mindShatter
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_mindShatter
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_mindShatter
		
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_mcYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_mcOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_mcOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event") --trigger_mcOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_mcFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_mcFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_mcFade
	
	self:ThrottleSync(3, syncName.mindShatter)
	self:ThrottleSync(3, syncName.mc)
	self:ThrottleSync(3, syncName.mcFade)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	if self.db.profile.mindshatter then
		self:Bar(L["bar_mindShatterCd"], timer.mindShatterCd, icon.mindShatter, true, color.mindShatter)
		self:DelayedBar(timer.mindShatterCd, L["bar_mindShatterSoon"], timer.mindShatterSoon, icon.mindShatter, true, color.mindShatterSoon)
	end
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == "test" then
		module:SendEngageSync()
	end
	
	
	
	
	
	
	
	if string.find(msg, L["trigger_mindShatter"]) then
		self:Sync(syncName.mindShatter)
		
	elseif string.find(msg, L["trigger_mcYou"]) then
		self:Sync(syncName.mc .. " " .. UnitName("Player"))
	
	
	elseif string.find(msg, L["trigger_mcOther"]) then
		local _,_, mcPlayer, _ = string.find(msg, L["trigger_mcOther"])
		self:Sync(syncName.mc .. " " .. mcPlayer)
		
	
	elseif string.find(msg, L["trigger_mcFade"]) then
		local _,_, mcFadePlayer, _ = string.find(msg, L["trigger_mcFade"])
		if mcFadePlayer == L["you"] then mcFadePlayer = UnitName("Player") end
		self:Sync(syncName.mcFade .. " " .. mcFadePlayer)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.mindShatter and self.db.profile.mindshatter then
		self:MindShatter()
	elseif sync == syncName.mc and rest and self.db.profile.mc then
		self:Mc(rest)
	elseif sync == syncName.mcFade and rest and self.db.profile.mc then
		self:McFade(rest)
	end
end


function module:MindShatter()
	self:RemoveBar(L["bar_mindShatterCd"])
	self:RemoveBar(L["bar_mindShatterSoon"])
	
	self:CancelDelayedBar(L["bar_mindShatterSoon"])
	
	self:WarningSign(icon.mindShatter, 0.7)
	self:Sound("Info")
	
	self:Bar(L["bar_mindShatterCd"], timer.mindShatterCd, icon.mindShatter, true, color.mindShatter)
	self:DelayedBar(timer.mindShatterCd, L["bar_mindShatterSoon"], timer.mindShatterSoon, icon.mindShatter, true, color.mindShatterSoon)
end

function module:Mc(rest)
	self:Bar(rest.." "..L["bar_mc"]..L["clickme"], timer.mc, icon.mc, true, color.mc)
	self:SetCandyBarOnClick("BigWigsBar "..rest.." "..L["bar_mc"]..L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 4)
			end
		end
	end
	
	if UnitClass("Player") == BC["Mage"] then
		self:WarningSign(icon.mc, 0.7)
		self:Sound("Beware")
	end
end

function module:McFade(rest)
	self:RemoveBar(rest.." "..L["bar_mc"]..L["clickme"])
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 0)
			end
		end
	end
end
