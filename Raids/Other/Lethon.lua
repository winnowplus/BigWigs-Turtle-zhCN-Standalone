
local module, L = BigWigs:ModuleDeclaration("Lethon", "Ashenvale")
local bblethon = AceLibrary("Babble-Boss-2.2")["Lethon"]

module.revision = 30087
module.enabletrigger = module.translatedName 
module.toggleoptions = {"tailsweep", "dreamfog", "noxiousbreath", -1, "shadowbolt", "summon", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
	AceLibrary("Babble-Zone-2.2")["Ashenvale"],
	AceLibrary("Babble-Zone-2.2")["Duskwood"],
	AceLibrary("Babble-Zone-2.2")["The Hinterlands"],
	AceLibrary("Babble-Zone-2.2")["Feralas"]
}

L:RegisterTranslations("enUS", function() return {
	cmd = "Lethon",

	tailsweep_cmd = "tailsweep",
    tailsweep_name = "龙尾扫击警报",
    tailsweep_desc = "龙尾扫击出现时进行警告",
	
	dreamfog_cmd = "dreamfog",
    dreamfog_name = "梦境迷雾昏睡警报",
    dreamfog_desc = "梦境迷雾昏睡出现时进行警告",
	
	noxiousbreath_cmd = "noxiousbreath",
    noxiousbreath_name = "毒性吐息警报",
    noxiousbreath_desc = "毒性吐息出现时进行警告",
	
	shadowbolt_cmd = "shadowbolt",
    shadowbolt_name = "暗影箭警报",
    shadowbolt_desc = "暗影箭出现时进行警告",
	
	summon_cmd = "summon",
    summon_name = "召唤警报",
    summon_desc = "召唤出现时进行警告",


	trigger_engage = "I can sense the SHADOW on your hearts. There can be no rest for the wicked!", --CHAT_MSG_MONSTER_YELL
	
	--self
	trigger_tailSweepYou = "Tail Sweep hits you for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_tailSweepYou = "龙尾扫击 - 不要站在龙的后面！",
	
	--self
	trigger_dreamFogYou = "You are afflicted by Sleep.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_dreamFogYouFade = "Sleep fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_dreamFogYou = "梦境迷雾昏睡 - 不要站在梦境迷雾之中！",

	--if nox you, for loop, find bossTarget, if bossTarget not you then WarningSign + msg only tank should
	trigger_noxiousBreathYou = "You are afflicted by Noxious Breath", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_noxiousBreathOther = "(.+) is afflicted by Noxious Breath", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_noxiousBreathCd = "毒性吐息 CD",
    msg_noxiousBreathYou = "毒性吐息 - 不要站在龙的前面！",

	--if is 3+ then bar
	trigger_noxiousBreathStackYou = "You are afflicted by Noxious Breath %((.+)%).", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_noxiousBreathStackOther = "(.+) is afflicted by Noxious Breath %((.+)%).", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_noxiousBreathFade = "Noxious Breath fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_noxiousBreath = " 毒性吐息",
	
	--trigger_shadowBoltYou = "Lethon's Shadow Bolt Whirl hits you for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	--trigger_shadowBoltOther = "Lethon's Shadow Bolt Whirl hits (.+) for", --CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	trigger_shadowBoltGain = "Lethon gains Shadow Bolt Whirl.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    bar_shadowBolt = "暗影箭 ",
    msg_shadowBoltSwapSide = "暗影箭换边 - 转动雷索！",
	
	trigger_summon = "Your wicked souls shall feed my power!", --CHAT_MSG_MONSTER_YELL
    msg_summon = "灵魂之影 - 击杀小怪！",
    msg_summonSoon = "小怪即将出现",
	
	trigger_drawSpiritStun = "afflicted by Draw Spirit.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_drawSpiritStun = "眩晕",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Lethon",

	tailsweep_cmd = "tailsweep",
    tailsweep_name = "龙尾扫击警报",
    tailsweep_desc = "龙尾扫击出现时进行警告",
	
	dreamfog_cmd = "dreamfog",
    dreamfog_name = "梦境迷雾昏睡警报",
    dreamfog_desc = "梦境迷雾昏睡出现时进行警告",
	
	noxiousbreath_cmd = "noxiousbreath",
    noxiousbreath_name = "毒性吐息警报",
    noxiousbreath_desc = "毒性吐息出现时进行警告",
	
	shadowbolt_cmd = "shadowbolt",
    shadowbolt_name = "暗影箭警报",
    shadowbolt_desc = "暗影箭出现时进行警告",
	
	summon_cmd = "summon",
    summon_name = "召唤警报",
    summon_desc = "召唤出现时进行警告",


	trigger_engage = "I can sense the SHADOW on your hearts. There can be no rest for the wicked!", --CHAT_MSG_MONSTER_YELL
	
	--self
	trigger_tailSweepYou = "Tail Sweep hits you for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_tailSweepYou = "龙尾扫击 - 不要站在龙的后面！",
	
	--self
	trigger_dreamFogYou = "You are afflicted by Sleep.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_dreamFogYouFade = "Sleep fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_dreamFogYou = "梦境迷雾昏睡 - 不要站在梦境迷雾之中！",

	--if nox you, for loop, find bossTarget, if bossTarget not you then WarningSign + msg only tank should
	trigger_noxiousBreathYou = "You are afflicted by Noxious Breath", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_noxiousBreathOther = "(.+) is afflicted by Noxious Breath", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_noxiousBreathCd = "毒性吐息 CD",
    msg_noxiousBreathYou = "毒性吐息 - 不要站在龙的前面！",

	--if is 3+ then bar
	trigger_noxiousBreathStackYou = "You are afflicted by Noxious Breath %((.+)%).", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_noxiousBreathStackOther = "(.+) is afflicted by Noxious Breath %((.+)%).", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_noxiousBreathFade = "Noxious Breath fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_noxiousBreath = " 毒性吐息",
	
	--trigger_shadowBoltYou = "Lethon's Shadow Bolt Whirl hits you for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	--trigger_shadowBoltOther = "Lethon's Shadow Bolt Whirl hits (.+) for", --CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	trigger_shadowBoltGain = "Lethon gains Shadow Bolt Whirl.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    bar_shadowBolt = "暗影箭 ",
    msg_shadowBoltSwapSide = "暗影箭换边 - 转动雷索！",
	
	trigger_summon = "Your wicked souls shall feed my power!", --CHAT_MSG_MONSTER_YELL
    msg_summon = "灵魂之影 - 击杀小怪！",
    msg_summonSoon = "小怪即将出现",
	
	trigger_drawSpiritStun = "afflicted by Draw Spirit.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_drawSpiritStun = "眩晕",
    you = "you",
} end )

local timer = {
	dreamFog = 5,
	
	noxiousBreathFirstCd = 7,
	noxiousBreathCd = {9,11},
	noxiousBreathDur = 30,
	
	firstShadowBoltCd = 25,
	shadowBoltCd = 5,
	
	drawSpiritStun = 5,
}
local icon = {
	tailSweep = "inv_misc_monsterscales_05",
	dreamFog = "spell_nature_sleep",
	noxiousBreath = "spell_shadow_lifedrain02",
	
	shadowBolt = "spell_shadow_shadowbolt",
	summon = "spell_holy_prayerofspirit",
	drawSpiritStun = "spell_shadow_summoninfernal",
}
local color = {
	noxiousBreathCd = "Black",
	noxiousBreathDur = "Red",
	
	shadowBoltCd = "Magenta",
	
	drawSpiritStun = "Green",
}
local syncName = {
	noxiousBreath = "LethonNoxiousBreath"..module.revision,
	noxiousBreathStacks = "LethonNoxiousBreathStacks"..module.revision,
	noxiousBreathStacksFade = "LethonNoxiousBreathStacksFade"..module.revision,
	
	shadowBoltGain = "LethonShadowBoltGain"..module.revision,
	shadowBoltSwapSide = "LethonShadowBoltSwapSide"..module.revision,
	
	summon = "LethonSummon"..module.revision,
	
	drawSpiritStun = "LethonDrawSpiritStun"..module.revision,
}

local seventyFiveSoon = nil
local fiftySoon = nil
local twentyFiveSoon = nil
local currentSide = nil

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --trigger_engage, trigger_summon
	
	self:RegisterEvent("UNIT_HEALTH")
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_tailSweepYou, trigger_noxiousBreathYou, trigger_shadowBoltYou
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_shadowBoltOther
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_shadowBoltOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_dreamFogYou, trigger_noxiousBreathStackYou, trigger_drawSpiritStun
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_noxiousBreathOther, trigger_noxiousBreathStackOther, trigger_drawSpiritStun
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_noxiousBreathOther, trigger_noxiousBreathStackOther, trigger_drawSpiritStun

	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_dreamFogYouFade, trigger_noxiousBreathFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_noxiousBreathFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_noxiousBreathFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_shadowBoltGain
	
	self:ThrottleSync(0.1, syncName.noxiousBreath)
	self:ThrottleSync(0.1, syncName.noxiousBreathStacks)
	self:ThrottleSync(0.1, syncName.noxiousBreathStacksFade)
	
	self:ThrottleSync(3, syncName.shadowBoltGain)
	self:ThrottleSync(15, syncName.shadowBoltSwapSide)
	
	self:ThrottleSync(3, syncName.summon)
	
	self:ThrottleSync(3, syncName.drawSpiritStun)
end

function module:OnSetup()
end

function module:OnEngage()
	if self.core:IsModuleActive("Ysondre", "Ashenvale") then self.core:DisableModule("Ysondre", "Ashenvale") end
	--if self.core:IsModuleActive("Lethon", "Ashenvale") then self.core:DisableModule("Lethon", "Ashenvale") end
	if self.core:IsModuleActive("Taerar", "Ashenvale") then self.core:DisableModule("Taerar", "Ashenvale") end
	if self.core:IsModuleActive("Emeriss", "Ashenvale") then self.core:DisableModule("Emeriss", "Ashenvale") end
	
	seventyFiveSoon = nil
	fiftySoon = nil
	twentyFiveSoon = nil
	currentSide = nil
	
	if self.db.profile.noxiousbreath then
		self:Bar(L["bar_noxiousBreathCd"], timer.noxiousBreathFirstCd, icon.noxiousBreath, true, color.noxiousBreathCd)
	end
end

function module:OnDisengage()
	self:CancelDelayedSync(syncName.shadowBoltSwapSide)
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()
	
	elseif string.find(msg, L["trigger_summon"]) then
		self:Sync(syncName.summon)
	end
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == module.translatedName then
		local healthPct = UnitHealth(msg) * 100 / UnitHealthMax(msg)
		if healthPct > 75 and healthPct <= 80 and seventyFiveSoon == nil and self.db.profile.summon then
			self:SeventyFiveSoon()
		elseif healthPct > 50 and healthPct <= 55 and fiftySoon == nil and self.db.profile.summon then
			self:FiftySoon()
		elseif healthPct > 25 and healthPct <= 30 and twentyFiveSoon == nil and self.db.profile.summon then
			self:TwentyFiveSoon()		
		end
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_noxiousBreathYou"]) then
		self:Sync(syncName.noxiousBreath .. " " .. UnitName("Player"))
	elseif string.find(msg, L["trigger_noxiousBreathOther"]) then
		local _,_,noxiousBreathPlayer = string.find(msg, L["trigger_noxiousBreathOther"])
		self:Sync(syncName.noxiousBreath .. " " .. noxiousBreathPlayer)
	end
	
	if string.find(msg, L["trigger_tailSweepYou"]) and self.db.profile.tailsweep then
		self:TailSweep()
	
	elseif msg == L["trigger_dreamFogYou"] and self.db.profile.dreamfog then
		self:DreamFog()
	elseif msg == L["trigger_dreamFogYouFade"] and self.db.profile.dreamfog then
		self:DreamFogFade()
	
	elseif string.find(msg, L["trigger_noxiousBreathStackYou"]) then
		local _,_,stacksQty,_ = string.find(msg, L["trigger_noxiousBreathStackYou"])
		local stacksPlayer = UnitName("Player")
		local stacksPlayerAndStacksQty = stacksPlayer .. " " .. stacksQty
		self:Sync(syncName.noxiousBreathStacks.." "..stacksPlayerAndStacksQty)
		
	elseif string.find(msg, L["trigger_noxiousBreathStackOther"]) then
		local _,_,stacksPlayer,stacksQty = string.find(msg, L["trigger_noxiousBreathStackOther"])
		local stacksPlayerAndStacksQty = stacksPlayer .. " " .. stacksQty
		self:Sync(syncName.noxiousBreathStacks.." "..stacksPlayerAndStacksQty)
	
	elseif string.find(msg, L["trigger_noxiousBreathFade"]) then
		local _,_,noxiousBreathFadePlayer = string.find(msg, L["trigger_noxiousBreathFade"])
		if noxiousBreathFadePlayer == L["you"] then noxiousBreathFadePlayer = UnitName("Player") end
		self:Sync(syncName.noxiousBreathStacksFade .. " " .. noxiousBreathFadePlayer)
		
		
	elseif string.find(msg, L["trigger_shadowBoltGain"]) then
		self:Sync(syncName.shadowBoltGain)
	
	
	elseif string.find(msg, L["trigger_drawSpiritStun"]) then
		self:Sync(syncName.drawSpiritStun)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.noxiousBreath and rest and self.db.profile.noxiousbreath then
		self:NoxiousBreath(rest)
	elseif sync == syncName.noxiousBreathStacks and rest and self.db.profile.noxiousbreath then
		self:NoxiousBreathStacks(rest)
	elseif sync == syncName.noxiousBreathStacksFade and rest and self.db.profile.noxiousbreath then
		self:NoxiousBreathStacksFade(rest)
	
	elseif sync == syncName.shadowBoltGain and self.db.profile.shadowbolt then
		self:ShadowBoltGain()
	elseif sync == syncName.shadowBoltSwapSide and self.db.profile.shadowbolt then
		self:ShadowBoltSwapSide()
		
	elseif sync == syncName.summon and self.db.profile.summon then
		self:Summon()
	
	elseif sync == syncName.drawSpiritStun and self.db.profile.summon then
		self:DrawSpiritStun()
	end
end


function module:TailSweep()
	self:Message(L["msg_tailSweepYou"], "Personal", false, nil, false)
	self:WarningSign(icon.tailSweep, 1)
end

function module:DreamFog()
	self:Message(L["msg_dreamFogYou"], "Personal", false, nil, false)
	self:WarningSign(icon.dreamFog, timer.dreamFog)
end

function module:DreamFogFade()
	self:RemoveWarningSign(icon.dreamFog)
end

function module:NoxiousBreath(rest)
	self:IntervalBar(L["bar_noxiousBreathCd"], timer.noxiousBreathCd[1], timer.noxiousBreathCd[2], icon.noxiousBreath, true, color.noxiousBreathCd)
	
	if rest == UnitName("Player") then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i.."Target") == bblethon then
				if UnitName("raid"..i.."TargetTarget") ~= UnitName("Player") then
					self:Message(L["msg_noxiousBreathYou"], "Urgent", false, nil, false)
					self:Sound("Beware")
					self:WarningSign(icon.noxiousBreath, 1)
				end
				break
			end
		end
	end
end

function module:NoxiousBreathStacks(rest)
	local stacksPlayer = strsub(rest,0,strfind(rest," ") - 1)
	local stacksQty = tonumber(strsub(rest,strfind(rest," "),strlen(rest)))
	
	if type(stacksQty) == "number" then
		if stacksQty >= 3 then
			for i=1,GetNumRaidMembers() do
				if UnitName("raid"..i) == stacksPlayer then
					self:RemoveBar(stacksPlayer.." ".."3"..L["bar_noxiousBreath"])
					self:RemoveBar(stacksPlayer.." ".."4"..L["bar_noxiousBreath"])
					self:RemoveBar(stacksPlayer.." ".."5"..L["bar_noxiousBreath"])
					self:RemoveBar(stacksPlayer.." ".."6"..L["bar_noxiousBreath"])
					self:RemoveBar(stacksPlayer.." ".."7"..L["bar_noxiousBreath"])
					self:RemoveBar(stacksPlayer.." ".."8"..L["bar_noxiousBreath"])
					self:RemoveBar(stacksPlayer.." ".."9"..L["bar_noxiousBreath"])
					self:RemoveBar(stacksPlayer.." ".."10"..L["bar_noxiousBreath"])

					self:Bar(stacksPlayer.." "..stacksQty..L["bar_noxiousBreath"], timer.noxiousBreathDur, icon.noxiousBreath, true, color.noxiousBreathDur)
					break
				end
			end
		end
	end
	
	if UnitName("Player") == "Relar" or UnitName("Player") == "Dreadsome" or UnitName("Player") == "Vakos" then
		if type(stacksQty) ~= "number" then
			DEFAULT_CHAT_FRAME:AddMessage("|cFFFF8080[BigWigs]|r Send this Screenshot to Relar: "..rest)
		end
	end
end

function module:NoxiousBreathStacksFade(rest)
	self:RemoveBar(rest.." ".."3"..L["bar_noxiousBreath"])
	self:RemoveBar(rest.." ".."4"..L["bar_noxiousBreath"])
	self:RemoveBar(rest.." ".."5"..L["bar_noxiousBreath"])
	self:RemoveBar(rest.." ".."6"..L["bar_noxiousBreath"])
	self:RemoveBar(rest.." ".."7"..L["bar_noxiousBreath"])
	self:RemoveBar(rest.." ".."8"..L["bar_noxiousBreath"])
	self:RemoveBar(rest.." ".."9"..L["bar_noxiousBreath"])
	self:RemoveBar(rest.." ".."10"..L["bar_noxiousBreath"])
end

function module:ShadowBoltGain()
	self:Sync(syncName.shadowBoltSwapSide)
end

function module:ShadowBoltSwapSide()
	if currentSide == nil then
		currentSide = "Left"
		
		self:Bar(																L["bar_shadowBolt"]..currentSide.." 1/4", timer.firstShadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		self:DelayedBar(timer.firstShadowBoltCd, 								L["bar_shadowBolt"]..currentSide.." 2/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		self:DelayedBar(timer.firstShadowBoltCd + timer.shadowBoltCd * 1, 		L["bar_shadowBolt"]..currentSide.." 3/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		self:DelayedBar(timer.firstShadowBoltCd + timer.shadowBoltCd * 2, 		L["bar_shadowBolt"]..currentSide.." 4/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		
		
		self:DelayedSync(timer.firstShadowBoltCd + timer.shadowBoltCd * 3, syncName.shadowBoltSwapSide)
	
	elseif currentSide == "Left" then
		currentSide = "Right"
		
		self:Message(L["msg_shadowBoltSwapSide"], "Important", false, nil, false)
		self:Bar(									L["bar_shadowBolt"]..currentSide.." 1/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		self:DelayedBar(timer.shadowBoltCd * 1,		L["bar_shadowBolt"]..currentSide.." 2/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		self:DelayedBar(timer.shadowBoltCd * 2,		L["bar_shadowBolt"]..currentSide.." 3/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		self:DelayedBar(timer.shadowBoltCd * 3,		L["bar_shadowBolt"]..currentSide.." 4/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		
		self:DelayedSync(timer.shadowBoltCd * 4, syncName.shadowBoltSwapSide)
	
	elseif currentSide == "Right" then
		currentSide = "Left"
		
		self:Message(L["msg_shadowBoltSwapSide"], "Important", false, nil, false)
		self:Bar(									L["bar_shadowBolt"]..currentSide.." 1/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		self:DelayedBar(timer.shadowBoltCd * 1,		L["bar_shadowBolt"]..currentSide.." 2/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		self:DelayedBar(timer.shadowBoltCd * 2,		L["bar_shadowBolt"]..currentSide.." 3/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		self:DelayedBar(timer.shadowBoltCd * 3,		L["bar_shadowBolt"]..currentSide.." 4/4", timer.shadowBoltCd, icon.shadowBolt, true, color.shadowBoltCd)
		
		self:DelayedSync(timer.shadowBoltCd * 4, syncName.shadowBoltSwapSide)
	end
end

function module:Summon()
	self:Message(L["msg_summon"], "Urgent", false, nil, false)
	self:Sound("Alarm")
	self:WarningSign(icon.summon, 1)
end

function module:DrawSpiritStun()
	self:Bar(L["bar_drawSpiritStun"], timer.drawSpiritStun, icon.drawSpiritStun, true, color.drawSpiritStun)
end

function module:SeventyFiveSoon()
	seventyFiveSoon = true
	self:Message(L["msg_summonSoon"])
end

function module:FiftySoon()
	fiftySoon = true
	self:Message(L["msg_summonSoon"])
end

function module:TwentyFiveSoon()
	twentyFiveSoon = true
	self:Message(L["msg_summonSoon"])
end
