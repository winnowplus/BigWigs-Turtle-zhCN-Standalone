local module, L = BigWigs:ModuleDeclaration("Ostarius", "Tanaris")
local BC = AceLibrary("Babble-Class-2.2")
local bbostarius = AceLibrary("Babble-Boss-2.2")["Ostarius"]

module.revision = 30049
module.enabletrigger = module.translatedName
module.toggleoptions = {"conflagbar", "conflagyou", -1, "chainlightning", -1, "blizzard", "rainoffire", "sonicburst", -1, "traps", "eq", "stomp", -1, "activation", -1, "phase", "portals", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
	AceLibrary("Babble-Zone-2.2")["Tanaris"],
}

L:RegisterTranslations("enUS", function() return {
	cmd = "Ostarius",

    conflagbar_cmd = "conflagbar",
    conflagbar_name = "燃烧计时",
    conflagbar_desc = "燃烧技能的计时条",

    conflagyou_cmd = "conflagyou",
    conflagyou_name = "燃烧伤害警告",
    conflagyou_desc = "燃烧造成伤害时进行警告",

    chainlightning_cmd = "chainlightning",
    chainlightning_name = "闪电链警报",
    chainlightning_desc = "闪电链出现时进行警告",

    blizzard_cmd = "blizzard",
    blizzard_name = "暴风雪警告",
    blizzard_desc = "暴风雪出现时进行警告",

    rainoffire_cmd = "rainoffire",
    rainoffire_name = "火焰之雨警告",
    rainoffire_desc = "火焰之雨出现时进行警告",

    sonicburst_cmd = "sonicburst",
    sonicburst_name = "音爆警告",
    sonicburst_desc = "音爆出现时进行警告",

    activation_cmd = "activation",
    activation_name = "激活计时",
    activation_desc = "Boss激活的计时器",

    phase_cmd = "phase",
    phase_name = "阶段警告",
    phase_desc = "阶段出现变化时进行警告",

    portals_cmd = "portals",
    portals_name = "传送门警报",
    portals_desc = "传送门出现时进行警告",

    traps_cmd = "traps",
    traps_name = "陷阱警告",
    traps_desc = "陷阱阶段开始/结束时进行警告",

    eq_cmd = "eq",
    eq_name = "地震警告",
    eq_desc = "地震出现时进行警告",
	
    stomp_cmd = "stomp",
    stomp_name = "坦克践踏警报",
    stomp_desc = "坦克被践踏时进行警告",
	
		--using self only because affects many people within the same second
	trigger_conflagYou = "You are afflicted by Conflagration.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    say_conflagYou = "我中了燃烧！快跑开！",
    bar_conflag = " 燃烧",
	trigger_conflagYouFade = "Conflagration fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_conflagHitYou = "'s Conflagration hits you for", --CHAT_MSG_SPELL_SELF_DAMAGE
    msg_conflagHitYou = "远离燃烧效果！",
	
	trigger_chainLightning = "Ostarius's Chain Lightning",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_chainLightning = "下一次闪电链",
	
	trigger_blizzardPhase = "Elusive... Then face the might of the frost!", --CHAT_MSG_MONSTER_YELL
    msg_blizzardPhase = "不再施放火焰之雨 - 现在施放暴风雪！",
	trigger_blizzardYou = "You are afflicted by Blizzard.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_blizzardYou = "远离暴风雪区域！",
	trigger_blizzardYouFade = "Blizzard fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_rainOfFirePhase = "Fire will burn your corruption!", --CHAT_MSG_MONSTER_YELL
    msg_rainOfFirePhase = "现在施放火焰之雨！",
	trigger_rainOfFireYou = "You are afflicted by Rain of Fire.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_rainOfFireYou = "远离火焰之雨区域！",
	trigger_rainOfFireYouFade = "Rain of Fire fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_sonicBurstYou = "You are afflicted by Sonic Burst.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_sonicBurstYou = "音爆影响范围为20码...",
	
	
    bar_activeX = "奥兹塔里亚斯 激活",
	trigger_active33 = "Welcome, honored guests, to the research facility.", --CHAT_MSG_MONSTER_YELL
    msg_active33 = "奥兹塔里亚斯 33秒后激活！",
	
	trigger_active27 = "Please wait for the initial scanning...", --CHAT_MSG_MONSTER_YELL
    msg_active27 = "奥兹塔里亚斯 27秒后激活！",
	
	trigger_active17 = "WARNING! Curse of the flesh detected!", --CHAT_MSG_MONSTER_YELL
    msg_active17 = "奥兹塔里亚斯 17秒后激活！",
	
	trigger_active13 = "Initiating manual gate override... Gate locked successfully.",--CHAT_MSG_MONSTER_YELL
    msg_active13 = "奥兹塔里亚斯 13秒后激活！",
	
	trigger_active6 = "Activating defensive system for threat elimination.", --CHAT_MSG_MONSTER_YELL
    msg_active6 = "奥兹塔里亚斯 6秒后激活！",
	
	trigger_activeNow = "Guardians, awaken and smite these intruders!", --CHAT_MSG_MONSTER_YELL
    msg_activeNow = "奥兹塔里亚斯 已激活！",
	
    bar_portals = "下一次传送门",
    msg_portals = "传送门！",
	
	trigger_engage = "Ostarius gains Defensive Storm.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	
	
	--unused
		--p1 only, from adds, blue beam, stunnable, may cause clutter if warning this + conflag
	trigger_mortalityScan = "You are afflicted by Mortality Scan.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_mortalityScanFade = "Mortality Scan fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	--unused
		--p2 only, from traps and pillars, better to stand in this than other ability, so may not want to warn about
	trigger_frostBreath = "You are afflicted by Frost Breath.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_frostBreathFade = "Frost Breath fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF

	--p3 only, 30-28%, 20-18%, 10-8%
	trigger_earthquake = "'s Earthquake", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    msg_earthquakeSoon = "地震即将来临！近战退后！",
    msg_earthquakeDone = "地震结束！近战输出！",
	
	trigger_stomp = "(.+) is afflicted by Stomp.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_stompYou = "You are afflicted by Stomp.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_stompFade = "Stomp fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	bar_stomp = " 被践踏",
	
	--is there a yell for all phases?
	--is p2 or p3 the slow part?
    msg_phase2 = "第二阶段 - 范围伤害技能",
    msg_phase3 = "第三阶段 -- 不再施放暴风雪 -- 缓慢输出...",
    msg_phase4 = "第四阶段 - 击败Boss！",
    msg_traps = "启动陷阱！看见就解除！",
    msg_trapsFade = "陷阱阶段结束！",
		
	trigger_p3 = "Still you persist, servants of the old ones? Very well.", --CHAT_MSG_MONSTER_YELL
	trigger_p4 = "NO! I will not fail again!", --CHAT_MSG_MONSTER_YELL
	
	--[[
	Frost Breath?
	Mortality Scan, 11sec, channel, casted by Ostarius or not? Overlaps many. Kickable?
	
	Stomp?
	Harsh Winds?
	
	Chain Lightning, interruptible? Happenned 3x, at 15sec interval
	The yells?
	Gate Construct, there is 8, do they spawn at the same time?
	]]--
	you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Ostarius",

    conflagbar_cmd = "conflagbar",
    conflagbar_name = "燃烧计时",
    conflagbar_desc = "燃烧技能的计时条",

    conflagyou_cmd = "conflagyou",
    conflagyou_name = "燃烧伤害警告",
    conflagyou_desc = "燃烧造成伤害时进行警告",

    chainlightning_cmd = "chainlightning",
    chainlightning_name = "闪电链警报",
    chainlightning_desc = "闪电链出现时进行警告",

    blizzard_cmd = "blizzard",
    blizzard_name = "暴风雪警告",
    blizzard_desc = "暴风雪出现时进行警告",

    rainoffire_cmd = "rainoffire",
    rainoffire_name = "火焰之雨警告",
    rainoffire_desc = "火焰之雨出现时进行警告",

    sonicburst_cmd = "sonicburst",
    sonicburst_name = "音爆警告",
    sonicburst_desc = "音爆出现时进行警告",

    activation_cmd = "activation",
    activation_name = "激活计时",
    activation_desc = "Boss激活的计时器",

    phase_cmd = "phase",
    phase_name = "阶段警告",
    phase_desc = "阶段出现变化时进行警告",

    portals_cmd = "portals",
    portals_name = "传送门警报",
    portals_desc = "传送门出现时进行警告",

    traps_cmd = "traps",
    traps_name = "陷阱警告",
    traps_desc = "陷阱阶段开始/结束时进行警告",

    eq_cmd = "eq",
    eq_name = "地震警告",
    eq_desc = "地震出现时进行警告",
	
    stomp_cmd = "stomp",
    stomp_name = "坦克践踏警报",
    stomp_desc = "坦克被践踏时进行警告",
	
		--using self only because affects many people within the same second
	trigger_conflagYou = "You are afflicted by Conflagration.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    say_conflagYou = "我中了燃烧！快跑开！",
    bar_conflag = " 燃烧",
	trigger_conflagYouFade = "Conflagration fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_conflagHitYou = "'s Conflagration hits you for", --CHAT_MSG_SPELL_SELF_DAMAGE
    msg_conflagHitYou = "远离燃烧效果！",
	
	trigger_chainLightning = "Ostarius's Chain Lightning",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_chainLightning = "下一次闪电链",
	
	trigger_blizzardPhase = "Elusive... Then face the might of the frost!", --CHAT_MSG_MONSTER_YELL
    msg_blizzardPhase = "不再施放火焰之雨 - 现在施放暴风雪！",
	trigger_blizzardYou = "You are afflicted by Blizzard.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_blizzardYou = "远离暴风雪区域！",
	trigger_blizzardYouFade = "Blizzard fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_rainOfFirePhase = "Fire will burn your corruption!", --CHAT_MSG_MONSTER_YELL
    msg_rainOfFirePhase = "现在施放火焰之雨！",
	trigger_rainOfFireYou = "You are afflicted by Rain of Fire.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_rainOfFireYou = "远离火焰之雨区域！",
	trigger_rainOfFireYouFade = "Rain of Fire fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_sonicBurstYou = "You are afflicted by Sonic Burst.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_sonicBurstYou = "音爆影响范围为20码...",
	
	
    bar_activeX = "奥兹塔里亚斯 激活",
	trigger_active33 = "Welcome, honored guests, to the research facility.", --CHAT_MSG_MONSTER_YELL
    msg_active33 = "奥兹塔里亚斯 33秒后激活！",
	
	trigger_active27 = "Please wait for the initial scanning...", --CHAT_MSG_MONSTER_YELL
    msg_active27 = "奥兹塔里亚斯 27秒后激活！",
	
	trigger_active17 = "WARNING! Curse of the flesh detected!", --CHAT_MSG_MONSTER_YELL
    msg_active17 = "奥兹塔里亚斯 17秒后激活！",
	
	trigger_active13 = "Initiating manual gate override... Gate locked successfully.",--CHAT_MSG_MONSTER_YELL
    msg_active13 = "奥兹塔里亚斯 13秒后激活！",
	
	trigger_active6 = "Activating defensive system for threat elimination.", --CHAT_MSG_MONSTER_YELL
    msg_active6 = "奥兹塔里亚斯 6秒后激活！",
	
	trigger_activeNow = "Guardians, awaken and smite these intruders!", --CHAT_MSG_MONSTER_YELL
    msg_activeNow = "奥兹塔里亚斯 已激活！",
	
    bar_portals = "下一次传送门",
    msg_portals = "传送门！",
	
	trigger_engage = "Ostarius gains Defensive Storm.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	
	
	--unused
		--p1 only, from adds, blue beam, stunnable, may cause clutter if warning this + conflag
	trigger_mortalityScan = "You are afflicted by Mortality Scan.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_mortalityScanFade = "Mortality Scan fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
	
	--unused
		--p2 only, from traps and pillars, better to stand in this than other ability, so may not want to warn about
	trigger_frostBreath = "You are afflicted by Frost Breath.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_frostBreathFade = "Frost Breath fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF

	--p3 only, 30-28%, 20-18%, 10-8%
	trigger_earthquake = "'s Earthquake", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    msg_earthquakeSoon = "地震即将来临！近战退后！",
    msg_earthquakeDone = "地震结束！近战输出！",
	
	trigger_stomp = "(.+) is afflicted by Stomp.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_stompYou = "You are afflicted by Stomp.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_stompFade = "Stomp fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	bar_stomp = " 被践踏",
	
	--is there a yell for all phases?
	--is p2 or p3 the slow part?
    msg_phase2 = "第二阶段 - 范围伤害技能",
    msg_phase3 = "第三阶段 -- 不再施放暴风雪 -- 缓慢输出...",
    msg_phase4 = "第四阶段 - 击败Boss！",
    msg_traps = "启动陷阱！看见就解除！",
    msg_trapsFade = "陷阱阶段结束！",
		
	trigger_p3 = "Still you persist, servants of the old ones? Very well.", --CHAT_MSG_MONSTER_YELL
	trigger_p4 = "NO! I will not fail again!", --CHAT_MSG_MONSTER_YELL
	
	--[[
	Frost Breath?
	Mortality Scan, 11sec, channel, casted by Ostarius or not? Overlaps many. Kickable?
	
	Stomp?
	Harsh Winds?
	
	Chain Lightning, interruptible? Happenned 3x, at 15sec interval
	The yells?
	Gate Construct, there is 8, do they spawn at the same time?
	]]--
	you = "you",
} end )

local timer = {
	active33 = 33,
	active27 = 27,
	active17 = 17,
	active13 = 13,
	active6 = 6,
	
	portals = 40,
	
	conflag = 10,
	
	chainLightning = 15,
	
	stomp = 12,
	
	--unused atm
	frostBreath = 99,
	earthquake = 99,
	harshWinds = 99,
	mortalityScan = 11,
}
local icon = {
	activeX = "inv_misc_pocketwatch_01",
	portals = "spell_arcane_portaldarnassus",
	
	conflag = "spell_fire_incinerate",
	blizzard = "spell_frost_icestorm",
	rainOfFire = "spell_shadow_rainoffire",
	sonicBurst = "spell_shadow_teleport",
	
	traps = "spell_shadow_grimward",
	earthquake = "spell_nature_earthquake",
	mortalityScan = "ability_thunderbolt",
	
	chainLightning = "spell_nature_chainlightning",
	stomp = "ability_warstomp",
	
	--unused atm
	frostBreath = "spell_frost_frostnova",
	harshWinds = "spell_nature_earthbind",
	chainLightning = "spell_nature_chainlightning",
}
local color = {
	activeX = "White",
	portals = "Cyan",
	
	conflag = "Red",
	chainLightning = "Blue",
	stomp = "Yellow",
	
	--unused atm
	frostBreath = "Blue",
	earthquake = "Cyan",
	harshWinds = "Green",
	mortalityScan = "Black",
}
local syncName = {
	active33 = "OstariusActive33"..module.revision,
	active27 = "OstariusActive27"..module.revision,
	active17 = "OstariusActive17"..module.revision,
	active13 = "OstariusActive13"..module.revision,
	active6 = "OstariusActive6"..module.revision,
	activeNow = "OstariusActiveNow"..module.revision,
	
	portals = "OstariusPortals"..module.revision,
	
	conflag = "OstariusConflag"..module.revision,
	conflagFade = "OstariusConflagFade"..module.revision,
	
	chainLightning = "OstariusChainLightning"..module.revision,
	
	phase2 = "OstariusPhase2"..module.revision,
	phase3 = "OstariusPhase3"..module.revision,
	phase4 = "OstariusPhase4"..module.revision,
	
	traps = "OstariusTraps"..module.revision,
	trapsFade = "OstariusTrapsFade"..module.revision,
	
	eq30 = "OstariusEq30"..module.revision,
	eq20 = "OstariusEq20"..module.revision,
	eq10 = "OstariusEq10"..module.revision,
	eq = "OstariusEq"..module.revision,
	stomp = "OstariusStomp"..module.revision,
	stompFade = "OstariusStompFade"..module.revision,
	
	rainOfFirePhase = "OstariusRainOfFirePhase"..module.revision,
	blizzardPhase = "OstariusBlizzardPhase"..module.revision,
}

local phase = 1
local traps = nil
local eq30 = nil
local eq20 = nil
local eq10 = nil

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --trigger_active33, trigger_active27, trigger_active17, trigger_active13, trigger_active6, trigger_activeNow, trigger_p3, trigger_p4, trigger_blizzardPhase, trigger_rainOfFirePhase
	
	self:RegisterEvent("UNIT_HEALTH")
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_earthquake, trigger_chainLightning
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_earthquake, trigger_chainLightning
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_earthquake, trigger_chainLightning
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_engage
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_conflagYou, trigger_blizzardYou, trigger_rainOfFireYou, trigger_sonicBurstYou, trigger_mortalityScan, trigger_frostBreath, trigger_stomp
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_stomp
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_stomp
	
	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "Event") --trigger_conflagHitYou
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_conflagYouFade, trigger_blizzardYouFade, trigger_rainOfFireYouFade, trigger_mortalityScanFade, trigger_frostBreathFade, trigger_stompFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_stompFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_stompFade
	
	
	self:ThrottleSync(3, syncName.active33)
	self:ThrottleSync(3, syncName.active27)
	self:ThrottleSync(3, syncName.active17)
	self:ThrottleSync(3, syncName.active13)
	self:ThrottleSync(3, syncName.active6)
	self:ThrottleSync(3, syncName.activeNow)
	
	self:ThrottleSync(10, syncName.portals)
	
	self:ThrottleSync(0, syncName.conflag)
	self:ThrottleSync(0, syncName.conflagFade)
	
	self:ThrottleSync(5, syncName.chainLightning)
	
	self:ThrottleSync(10, syncName.phase2)
	self:ThrottleSync(10, syncName.phase3)
	self:ThrottleSync(10, syncName.phase4)
	
	self:ThrottleSync(10, syncName.traps)
	self:ThrottleSync(10, syncName.trapsFade)
	
	self:ThrottleSync(10, syncName.eq30)
	self:ThrottleSync(10, syncName.eq20)
	self:ThrottleSync(10, syncName.eq10)
	self:ThrottleSync(10, syncName.eq)
	self:ThrottleSync(5, syncName.stomp)
	self:ThrottleSync(0, syncName.stompFade)
	
	self:ThrottleSync(10, syncName.blizzardPhase)
	self:ThrottleSync(10, syncName.rainOfFirePhase)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()	
end

function module:OnDisengage()
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_active33"] then
		self:Sync(syncName.active33)
	elseif msg == L["trigger_active27"] then
		self:Sync(syncName.active27)
	elseif msg == L["trigger_active17"] then
		self:Sync(syncName.active17)
	elseif msg == L["trigger_active13"] then
		self:Sync(syncName.active13)
	elseif msg == L["trigger_active6"] then
		self:Sync(syncName.active6)
	elseif msg == L["trigger_activeNow"] then
		self:Sync(syncName.activeNow)
	
	elseif msg == L["trigger_p3"] then
		self:Sync(syncName.phase3)
	elseif msg == L["trigger_p4"] then
		self:Sync(syncName.phase4)
		
	elseif msg == L["trigger_blizzardPhase"] then
		self:Sync(syncName.blizzardPhase)
	elseif msg == L["trigger_rainOfFirePhase"] then
		self:Sync(syncName.rainOfFirePhase)
	end
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == boss then
		local health = UnitHealth(msg)
		if health >= 71 and phase ~= 1 then
			phase = 1
			if traps ~= nil then
				traps = nil
			end
		elseif phase == 1 and health <= 70 and health >= 31 then
			self:Sync(syncName.phase2)
		elseif traps == nil and health <= 50 and health >= 31 then
			self:Sync(syncName.traps)
		elseif eq30 == nil and health <=32 then
			self:Sync(syncName.eq30)
		--elseif phase == 2 and health <= 30 then
		--	self:Sync(syncName.phase3)
		elseif traps == true and health <= 30 then
			self:Sync(syncName.trapsFade)
		elseif eq20 == nil and health <=22 then
			self:Sync(syncName.eq20)
		--elseif phase == 3 and health <=15 then
		--	self:Sync(syncName.phase4)
		elseif eq10 == nil and health <=12 then
			self:Sync(syncName.eq10)
		end
	end
end

function module:Event(msg)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()
	
	elseif msg == L["trigger_conflagYou"] then
		self:Sync(syncName.conflag .. " " .. UnitName("Player"))
		if self.db.profile.conflagyou then
			SendChatMessage(L["say_conflagYou"],"SAY")
		end
	
	elseif msg == L["trigger_conflagYouFade"] then
		self:Sync(syncName.conflagFade .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_conflagHitYou"]) and self.db.profile.conflagyou then
		self:Message(L["msg_conflagHitYou"], "Urgent", false, nil, false)
		self:WarningSign(icon.conflag, 0.7)
		self:Sound("Info")
	
	
	elseif string.find(msg, L["trigger_chainLightning"]) then
		self:Sync(syncName.chainLightning)
		
	
	elseif string.find(msg, L["trigger_stomp"]) then
		local _, _, stompPlayer, _ = string.find(msg, L["trigger_stomp"])
		if UnitName("Target") ~= nil and UnitName("TargetTarget") ~= nil then
			if UnitName("Target") == bbostarius and UnitName("TargetTarget") == stompPlayer then
				self:Sync(syncName.stomp .. " " .. stompPlayer)
			end
		end
		
	elseif string.find(msg, L["trigger_stompYou"]) then
		if UnitName("Target") ~= nil and UnitName("TargetTarget") ~= nil then
			if UnitName("Target") == bbostarius and UnitName("TargetTarget") == UnitName("Player") then
				self:Sync(syncName.stomp .. " " .. UnitName("Player"))
			end
		end
		
	elseif string.find(msg, L["trigger_stompFade"]) then
		local _, _, stompFadePlayer, _ = string.find(msg, L["trigger_stompFade"])
		if stompFadePlayer == L["you"] then stompFadePlayer = UnitName("Player") end
		self:Sync(syncName.stompFade .. " " .. stompFadePlayer)
		
		
		
	elseif msg == L["trigger_blizzardYou"] and self.db.profile.blizzard then
		self:Message(L["msg_blizzardYou"], "Urgent", false, nil, false)
		self:WarningSign(icon.blizzard, 10)
		self:Sound("RunAway")
		
	elseif msg == L["trigger_blizzardYouFade"] and self.db.profile.blizzard then
		self:RemoveWarningSign(icon.blizzard)
		
		
	elseif msg == L["trigger_rainOfFireYou"] and self.db.profile.rainoffire then
		self:Message(L["msg_rainOfFireYou"], "Urgent", false, nil, false)
		self:WarningSign(icon.rainOfFire, 10)
		self:Sound("RunAway")
		
	elseif msg == L["trigger_rainOfFireYouFade"] and self.db.profile.rainoffire then
		self:RemoveWarningSign(icon.rainOfFire)
		
		
	elseif msg == L["trigger_sonicBurstYou"] and self.db.profile.sonicburst then
		if UnitClass("Player") == BC["Priest"] or UnitClass("Player") == BC["Mage"] or UnitClass("Player") == BC["Warlock"] or UnitClass("Player") == BC["Hunter"] then
			self:Message(L["msg_sonicBurstYou"], "Urgent", false, nil, false)
			self:WarningSign(icon.sonicBurst, 1)
		end
		
	elseif string.find(msg, L["trigger_earthquake"]) then
		self:Sync(syncName.eq)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.active33 and self.db.profile.activation then
		self:Active33()
	elseif sync == syncName.active27 and self.db.profile.activation then
		self:Active27()
	elseif sync == syncName.active17 and self.db.profile.activation then
		self:Active17()
	elseif sync == syncName.active13 and self.db.profile.activation then
		self:Active13()
	elseif sync == syncName.active6 and self.db.profile.activation then
		self:Active6()
	elseif sync == syncName.activeNow and self.db.profile.activation then
		self:ActiveNow()
	
	elseif sync == syncName.portals and self.db.profile.portals then
		self:Portals()
	
	elseif sync == syncName.conflag and rest and self.db.profile.conflagbar then
		self:Conflag(rest)
	elseif sync == syncName.conflagFade and rest and self.db.profile.conflagbar then
		self:ConflagFade(rest)
		
	elseif sync == syncName.chainLightning and self.db.profile.chainlightning then
		self:ChainLightning()
		
	elseif sync == syncName.phase2 and self.db.profile.phase then
		self:Phase2()
	elseif sync == syncName.phase3 and self.db.profile.phase then
		self:Phase3()
	elseif sync == syncName.phase4 and self.db.profile.phase then
		self:Phase4()
	
	elseif sync == syncName.blizzardPhase and self.db.profile.phase then
		self:BlizzardPhase()
	elseif sync == syncName.rainOfFirePhase and self.db.profile.phase then
		self:RainOfFirePhase()
	
	elseif sync == syncName.traps and self.db.profile.traps then
		self:Traps()
	elseif sync == syncName.trapsFade then
		self:TrapsFade()
	
	elseif sync == syncName.eq30 then
		self:EQ30()
	elseif sync == syncName.eq20 then
		self:EQ20()
	elseif sync == syncName.eq10 then
		self:EQ10()
	elseif sync == syncName.eq then
		self:EQ()
		
	elseif sync == syncName.stomp and rest and self.db.profile.stomp then
		self:Stomp(rest)
	elseif sync == syncName.stompFade and rest and self.db.profile.stomp then
		self:StompFade(rest)
	end
end


function module:Active33()
	self:RemoveBar(L["bar_activeX"])
	self:Bar(L["bar_activeX"], timer.active33, icon.activeX, true, color.activeX)
	self:Message(L["msg_active33"], "Attention", false, nil, false)
	self:Sound("Alarm")
end

function module:Active27()
	self:RemoveBar(L["bar_activeX"])
	self:Bar(L["bar_activeX"], timer.active27, icon.activeX, true, color.activeX)
	self:Message(L["msg_active27"], "Attention", false, nil, false)
	self:Sound("Alarm")
end

function module:Active17()
	self:RemoveBar(L["bar_activeX"])
	self:Bar(L["bar_activeX"], timer.active17, icon.activeX, true, color.activeX)
	self:Message(L["msg_active17"], "Attention", false, nil, false)
	self:Sound("Alarm")
end

function module:Active13()
	self:RemoveBar(L["bar_activeX"])
	self:Bar(L["bar_activeX"], timer.active13, icon.activeX, true, color.activeX)
	self:Message(L["msg_active13"], "Attention", false, nil, false)
	self:Sound("Alarm")
end

function module:Active6()
	self:RemoveBar(L["bar_activeX"])
	self:Bar(L["bar_activeX"], timer.active6, icon.activeX, true, color.activeX)
	self:Message(L["msg_active6"], "Attention", false, nil, false)
	self:Sound("Alarm")
end

function module:ActiveNow()
	self:RemoveBar(L["bar_activeX"])
	self:Message(L["msg_activeNow"], "Attention", false, nil, false)
	self:Sound("Alarm")

	self:Sync(syncName.portals)
end

function module:Portals()
	self:Message(L["msg_portals"], "Urgent", false, nil, false)
	self:Bar(L["bar_portals"], timer.portals, icon.portals, true, color.portals)
	self:DelayedSync(timer.portals, syncName.portals)
end

function module:Conflag(rest)
	self:Bar(rest..L["bar_conflag"], timer.conflag, icon.conflag, true, color.conflag)
end

function module:ConflagFade(rest)
	self:RemoveBar(rest..L["bar_conflag"])
end

function module:ChainLightning()
	self:RemoveBar(L["bar_chainLightning"])
	self:Bar(L["bar_chainLightning"], timer.chainLightning, icon.chainLightning, true, color.chainLightning)
end

function module:Phase2()
	phase = 2
	self:Message(L["msg_phase2"], "Important", false, nil, false)
end

function module:Phase3()
	phase = 3
	self:Message(L["msg_phase3"], "Important", false, nil, false)
	
	if self.db.profile.chainlightning then
		self:ChainLightning()
	end
end

function module:Phase4()
	phase = 4
	self:Message(L["msg_phase4"], "Important", false, nil, false)
end

function module:RainOfFirePhase()
	self:RemoveBar(L["bar_portals"])
	self:CancelDelayedSync(syncName.portals)
	
	self:Message(L["msg_rainOfFirePhase"], "Important", false, nil, false)
end

function module:BlizzardPhase()
	self:Message(L["msg_blizzardPhase"], "Important", false, nil, false)
end


function module:Traps()
	if traps == nil and UnitClass("Player") == BC["Rogue"] and self.db.profile.traps then
		self:Message(L["msg_traps"], "Personal", false, nil, false)
		self:Sound("Beware")
		self:WarningSign(icon.traps, 1)
	end
	traps = true
end

function module:TrapsFade()
	if traps == true and UnitClass("Player") == BC["Rogue"] and self.db.profile.traps then
		self:Message(L["msg_trapsFade"], "Personal", false, nil, false)
		self:Sound("Beware")
		self:WarningSign(icon.traps, 1)
	end
	traps = nil
end

function module:EQ30()
	if self.db.profile.eq then
		if UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Paladin"] then
			self:Message(L["msg_earthquakeSoon"], "Urgent", false, nil, false)
			self:Sound("RunAway")
			self:WarningSign(icon.earthquake, 1)
		end
	end
	eq30 = true
end

function module:EQ20()
	if self.db.profile.eq then
		if UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Paladin"] then
			self:Message(L["msg_earthquakeSoon"], "Urgent", false, nil, false)
			self:Sound("RunAway")
			self:WarningSign(icon.earthquake, 1)
		end
	end
	eq20 = true
end

function module:EQ10()
	if self.db.profile.eq then
		if UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Paladin"] then
			self:Message(L["msg_earthquakeSoon"], "Urgent", false, nil, false)
			self:Sound("RunAway")
			self:WarningSign(icon.earthquake, 1)
		end
	end
	eq10 = true
end

function module:EQ()
	if self.db.profile.eq then
		if UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Paladin"] then
			self:Message(L["msg_earthquakeDone"], "Positive", false, nil, false)			
			self:WarningSign(icon.earthquake, 1)
			self:Sound("Info")
		end
	end
end

function module:Stomp(rest)
	self:Bar(rest..L["bar_stomp"], timer.stomp, icon.stomp, true, color.stomp)
end

function module:StompFade(rest)
	self:RemoveBar(rest..L["bar_stomp"])
end
