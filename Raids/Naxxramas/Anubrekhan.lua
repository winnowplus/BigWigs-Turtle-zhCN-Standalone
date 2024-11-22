
local module, L = BigWigs:ModuleDeclaration("Anub'Rekhan", "Naxxramas")
local bbcryptguard = AceLibrary("Babble-Boss-2.2")["Crypt Guard"]

module.revision = 30067
module.enabletrigger = module.translatedName
module.toggleoptions = {"locust", "impale", -1, "enrage", "web", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Anubrekhan",

    locust_cmd = "locust",
    locust_name = "蝗虫群警报",
    locust_desc = "蝗虫群出现时进行警告。",

    impale_cmd = "impale",
    impale_name = "穿刺警报",
    impale_desc = "穿刺出现时进行警告。",

    enrage_cmd = "enrage",
    enrage_name = "地穴卫士激怒警报",
    enrage_desc = "地穴卫士激怒时进行警告。",

    web_cmd = "web",
    web_name = "地穴卫士网警报",
    web_desc = "地穴卫士放网时进行警告。",
	
	
	trigger_engage1 = "Just a little taste...",
	trigger_engage2 = "Yes, run! It makes the blood pump faster!",
	trigger_engage3 = "There is no way out.",
	
    trigger_locustSwarmCast = "Anub'Rekhan begins to cast Locust Swarm.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    msg_locustSwarmCasting = "正在施放蝗虫群！",
    bar_locustSwarmCasting = "正在施放蝗虫群！",

    trigger_locustSwarmGain = "Anub'Rekhan gains Locust Swarm.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    bar_locustSwarmIsUp = "蝗虫群！",

    trigger_locustSwarmEnds = "Locust Swarm fades from Anub'Rekhan.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_locustSwarmCd = "蝗虫群 CD",
    bar_locustSwarmOffCd = "蝗虫群准备完毕...",
	
    trigger_locustSwarmYou = "You are afflicted by Locust Swarm", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_locustYou = "远离Boss！",
    trigger_locustSwarmYouFade = "Locust Swarm fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    
    trigger_impale = "Anub'Rekhan's Impale hits", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_impale = "穿刺 CD",
    
    trigger_enrage = "Crypt Guard gains Enrage.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrage = "地穴卫士激怒 - 使用眩晕和陷阱！",
    
    trigger_web = "afflicted by Web.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_web2 = "Web fails.", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_webCd = "网 CD",
    bar_webDur = "被网住了！",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Anubrekhan",

    locust_cmd = "locust",
    locust_name = "蝗虫群警报",
    locust_desc = "蝗虫群出现时进行警告。",

    impale_cmd = "impale",
    impale_name = "穿刺警报",
    impale_desc = "穿刺出现时进行警告。",

    enrage_cmd = "enrage",
    enrage_name = "地穴卫士激怒警报",
    enrage_desc = "地穴卫士激怒时进行警告。",

    web_cmd = "web",
    web_name = "地穴卫士网警报",
    web_desc = "地穴卫士放网时进行警告。",
	
	
	trigger_engage1 = "一些小点心",
	trigger_engage2 = "对，跑吧！那样伤口出血就更多了！",
	trigger_engage3 = "你们逃不掉的。",
	
    trigger_locustSwarmCast = "阿努布雷坎开始施放虫群风暴。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    msg_locustSwarmCasting = "正在施放虫群风暴！",
    bar_locustSwarmCasting = "正在施放虫群风暴！",

    trigger_locustSwarmGain = "阿努布雷坎受到了虫群风暴效果的影响。", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    bar_locustSwarmIsUp = "虫群风暴！",

    trigger_locustSwarmEnds = "虫群风暴效果从阿努布雷坎身上消失。", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_locustSwarmCd = "虫群风暴 CD",
    bar_locustSwarmOffCd = "虫群风暴随时可能开始！",
	
    trigger_locustSwarmYou = "你受到了虫群风暴效果的影响", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_locustYou = "远离Boss！",
    trigger_locustSwarmYouFade = "虫群风暴效果从你身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF
    
    trigger_impale = "阿努布雷坎的穿刺击中", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_impale = "穿刺 CD",
    
    trigger_enrage = "地穴卫士变得愤怒了！", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrage = "地穴卫士激怒 - 使用眩晕和陷阱！",
    
    trigger_web = "受到了蛛网效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_web2 = "蛛网效果从", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_webCd = "蛛网 CD",
    bar_webDur = "被网住了！",
} end )

local timer = {
	firstLocustSwarm = {80,120},--96
	readyFirstLocustSwarm = 40,
	locustSwarmInterval = {70,90},--90,110
	readySwarmInterval = 20,
	locustSwarmDuration = 20,
	locustSwarmCastTime = 3,
	
	locustAfflicted = 6,
	
	impale = {12,18},
	
	webCd = 12,
	webDur = 10,
}
local icon = {
	locust = "Spell_Nature_InsectSwarm",
	impale = "ability_backstab",
	enrage = "spell_shadow_unholyfrenzy",
	web = "ability_ensnare",
}
local color = {
	locustCd = "White",
	locustOffCd = "Cyan",
	locustCasting = "Green",
	
	impale = "Red",
	
	webCd = "Black",
	webDur = "Blue",
}
local syncName = {
	locustCast = "AnubLocustInc"..module.revision,
	locustGain = "AnubLocustSwarm"..module.revision,
	locustEnds = "AnubLocustEnds"..module.revision,
	impale = "AnubImpale"..module.revision,
	
	enrage = "AnubEnrage"..module.revision,
	web = "AnubWeb"..module.revision,
}

module:RegisterYellEngage(L["trigger_engage1"])
module:RegisterYellEngage(L["trigger_engage2"])
module:RegisterYellEngage(L["trigger_engage3"])

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event") --trigger_locustSwarmCast
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_locustSwarmGain, trigger_enrage
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_locustSwarmEnds, trigger_locustSwarmYouFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_locustSwarmEnds
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_impale, trigger_web2
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_impale, trigger_web2
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_impale, trigger_web2
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_web, trigger_locustSwarmYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_web
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_web
	
	
	self:ThrottleSync(10, syncName.locustCast)
	self:ThrottleSync(10, syncName.locustGain)
	self:ThrottleSync(10, syncName.locustEnds)
	self:ThrottleSync(10, syncName.impale)
	self:ThrottleSync(2, syncName.enrage)
	self:ThrottleSync(8, syncName.web)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	if self.db.profile.locust then
		self:IntervalBar(L["bar_locustSwarmCd"], timer.firstLocustSwarm[1], timer.firstLocustSwarm[2], icon.locust, true, color.locustCd)
		self:DelayedBar(timer.firstLocustSwarm[1], L["bar_locustSwarmOffCd"], timer.readyFirstLocustSwarm, icon.locust, true, color.locustOffCd)
	end
	
	if self.db.profile.impale then
		self:Impale()
	end
	
	if self.db.profile.web then
		self:Bar(L["bar_webCd"], timer.webCd, icon.web, true, color.webCd)
	end
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_locustSwarmCast"] then
		self:Sync(syncName.locustCast)
	elseif msg == L["trigger_locustSwarmGain"] then
		self:Sync(syncName.locustGain)
	elseif msg == L["trigger_locustSwarmEnds"] then
		self:Sync(syncName.locustEnds)
	
	elseif string.find(msg, L["trigger_locustSwarmYou"]) and self.db.profile.locust then
		self:LocustYou()
	elseif msg == L["trigger_locustSwarmYouFade"] then
		self:LocustYouFade()
		
	elseif string.find(msg, L["trigger_impale"]) then
		self:Sync(syncName.impale)
	
	elseif msg == L["trigger_enrage"] then
		self:Sync(syncName.enrage)
	
	elseif string.find(msg, L["trigger_web"]) or string.find(msg, L["trigger_web2"]) then
		self:Sync(syncName.web)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.locustCast and self.db.profile.locust then
		self:LocustCast()
	elseif sync == syncName.locustGain and self.db.profile.locust then
		self:LocustGain()
	elseif sync == syncName.locustEnds and self.db.profile.locust then
		self:LocustEnds()
	
	elseif sync == syncName.impale and self.db.profile.impale then
		self:Impale()
	
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
		
	elseif sync == syncName.web and self.db.profile.web then
		self:Web()
	end
end

function module:LocustCast()
	self:RemoveBar(L["bar_impale"])
	
	self:RemoveBar(L["bar_locustSwarmCd"])
	self:CancelDelayedBar(L["bar_locustSwarmOffCd"])
	self:RemoveBar(L["bar_locustSwarmOffCd"])
	
	self:Bar(L["bar_locustSwarmCasting"], timer.locustSwarmCastTime, icon.locust, true, color.locustCasting)
	self:WarningSign(icon.locust, timer.locustSwarmCastTime)
	self:Message(L["msg_locustSwarmCasting"], "Urgent", false, nil, false)
	self:Sound("Beware")
end

function module:LocustGain()
	self:RemoveBar(L["bar_locustSwarmCasting"])
	self:RemoveWarningSign(icon.locust)
	self:Bar(L["bar_locustSwarmIsUp"], timer.locustSwarmDuration, icon.locust, true, color.locustCasting)
end

function module:LocustEnds()
	self:RemoveBar(L["bar_locustSwarmIsUp"])
	self:IntervalBar(L["bar_locustSwarmCd"], timer.locustSwarmInterval[1], timer.locustSwarmInterval[2], icon.locust, true, color.locustCd)
	self:DelayedBar(timer.locustSwarmInterval[1], L["bar_locustSwarmOffCd"], timer.readySwarmInterval, icon.locust, true, color.locustOffCd)
	
	if self.db.profile.impale then
		self:Impale()
	end
end

function module:LocustYou()
	self:Sound("Info")
	self:WarningSign(icon.locust, timer.locustAfflicted)
	self:Message(L["msg_locustYou"], "Personal", false, nil, false)
end

function module:LocustYouFade()
	self:RemoveWarningSign(icon.locust)
end

function module:Impale()
	self:IntervalBar(L["bar_impale"], timer.impale[1], timer.impale[2], icon.impale, true, color.impale)
end

function module:Enrage()
	self:Message(L["msg_enrage"], "Important", false, nil, false)
	self:Sound("Alarm")
	if UnitName("Target") == bbcryptguard then
		self:WarningSign(icon.enrage, 0.7)
	end
end

function module:Web()
	self:Bar(L["bar_webDur"], timer.webDur, icon.web, true, color.webDur)
	self:Bar(L["bar_webCd"], timer.webCd, icon.web, true, color.webCd)
end
