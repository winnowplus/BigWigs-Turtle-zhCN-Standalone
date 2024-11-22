
local module, L = BigWigs:ModuleDeclaration("Grobbulus", "Naxxramas")

module.revision = 30090
module.enabletrigger = module.translatedName
module.toggleoptions = {"slimespray", "inject", "cloud", "icon",  -1, "enrage", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Grobbulus",

	enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",
	
	slimespray_cmd = "slimespray",
    slimespray_name = "软泥喷射",
    slimespray_desc = "显示软泥喷射的计时条",
	
	inject_cmd = "inject",
    inject_name = "变异注射警报",
    inject_desc = "当有人被注射时进行警告",

    icon_cmd = "icon",
    icon_name = "标记图标",
    icon_desc = "在被注射的人员身上放置一个骷髅图标。(需要是助理或更高权限)",

    cloud_cmd = "cloud",
    cloud_name = "毒云术",
    cloud_desc = "毒云术出现时进行警告",
		
		
	trigger_enrage = "%s becomes enraged!",--to be confirmed
    bar_enrage = "激怒",
    msg_enrage60 = "1分钟后激怒",
    msg_enrage10 = "10秒后激怒",
    msg_enrage = "激怒！",
	
	trigger_slimeSpray = "Slime Spray",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_slimeSprayCD = "毒液喷射冷却",
	
	trigger_injectYou = "You are afflicted by Mutating Injection.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_injectOther = "(.+) is afflicted by Mutating Injection.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_injectFade = "Mutating Injection fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_injected = " 注射",
    msg_inject = " 注射",
	
	trigger_cloudCast = "Grobbulus casts Poison Cloud.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    bar_cloudCD = "毒云术冷却",
    msg_cloudCast = "毒云术 -- 移动格罗布鲁斯！",
	trigger_cloudHitsYou = "Grobbulus Cloud's Poison hits you",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	
    msg_lowHp = "格罗布鲁斯生命值低于30% - 更频繁注射",
	you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Grobbulus",

	enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",
	
	slimespray_cmd = "slimespray",
    slimespray_name = "软泥喷射",
    slimespray_desc = "显示软泥喷射的计时条",
	
	inject_cmd = "inject",
    inject_name = "变异注射警报",
    inject_desc = "当有人被注射时进行警告",

    icon_cmd = "icon",
    icon_name = "标记图标",
    icon_desc = "在被注射的人员身上放置一个骷髅图标。(需要是助理或更高权限)",

    cloud_cmd = "cloud",
    cloud_name = "毒云",
    cloud_desc = "毒云出现时进行警告",
		
		
	trigger_enrage = "格罗布鲁斯陷入狂暴状态！",--to be confirmed
    bar_enrage = "激怒",
    msg_enrage60 = "1分钟后激怒",
    msg_enrage10 = "10秒后激怒",
    msg_enrage = "激怒！",
	
	trigger_slimeSpray = "软泥喷射",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_slimeSprayCD = "软泥喷射冷却",
	
	trigger_injectYou = "你受到了变异注射效果的影响。",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_injectOther = "(.+)受到了变异注射效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_injectFade = "变异注射效果从(.+)身上消失了。",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_injected = " 注射",
    msg_inject = " 注射",
	
	trigger_cloudCast = "格罗布鲁斯施放了毒性云雾。",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF
    bar_cloudCD = "毒云冷却",
    msg_cloudCast = "毒云 -- 移动格罗布鲁斯！",
	trigger_cloudHitsYou = "瘟疫毒云的中毒击中你",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	
    msg_lowHp = "格罗布鲁斯生命值低于30% - 更频繁注射",
	you = "你",
} end )

local timer = {
	enrage = 720,
	firstSlimeSpray = {20, 30},--25
	slimeSprayCD = {30, 35},--confirmed
	injectDuration = 10,
	cloudCD = 16,
}
local icon = {
	enrage = "Spell_Shadow_UnholyFrenzy",
	slimeSpray = "INV_Misc_Slime_01",
	inject = "Spell_Shadow_CallofBone",
	cloud = "Ability_Creature_Disease_02",
	cleanse = "spell_holy_renew",
}
local color = {
	enrage = "White",
	slimeSpray = "Green",
	inject = "Red",
	cloud = "Blue",
}
local syncName = {
	enrage = "GrobbulusEnrage"..module.revision,
	slimeSpray = "GrobbulusSlimeSpray"..module.revision,
	inject = "GrobbulusInject"..module.revision,
	injectFade = "GrobbulusInjectFade2"..module.revision,
	cloud = "GrobbulusCloud"..module.revision,
	lowHp = "GrobbulusLowHp"..module.revision,
}

local lowHp = nil
local amInjected = nil

function module:OnEnable()
	self:RegisterEvent("UNIT_HEALTH")
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--inject
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--inject
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--inject
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--slimeSpray, cloudHitsYou
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--slimeSpray
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--slimeSpray
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event")--cloudCast
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_injectFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_injectFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_injectFade
	
	self:ThrottleSync(10, syncName.enrage)
	self:ThrottleSync(10, syncName.slimeSpray)
	self:ThrottleSync(3, syncName.inject)
	self:ThrottleSync(0.1, syncName.injectFade)
	self:ThrottleSync(5, syncName.cloud)
	self:ThrottleSync(10, syncName.lowHp)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	lowHp = nil
	amInjected = nil
	
	if self.db.profile.enrage then
		self:Bar(L["bar_enrage"], timer.enrage, icon.enrage, true, color.enrage)
		self:DelayedMessage(timer.enrage - 60, L["msg_enrage60"], "Important", false, nil, false)
		self:DelayedMessage(timer.enrage - 10, L["msg_enrage10"], "Important", false, nil, false)
	end
	
	if self.db.profile.slimespray then
		self:IntervalBar(L["bar_slimeSprayCD"], timer.firstSlimeSpray[1], timer.firstSlimeSpray[2], icon.slimeSpray, true, color.slimeSpray)
	end
	
	if self.db.profile.cloud then
		self:Bar(L["bar_cloudCD"], timer.cloudCD, icon.cloud, true, color.cloud)
	end
end

function module:OnDisengage()
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == module.translatedName then
		local healthPct = UnitHealth(msg) * 100 / UnitHealthMax(msg)
		if healthPct >= 30 and lowHp ~= nil then
			lowHp = nil
		elseif healthPct < 30 and lowHp == nil then
			self:Sync(syncName.lowHp)
		end
	end
end

function module:Event(msg)
	if msg == L["trigger_enrage"] then
		self:Sync(syncName.enrage)
	
	elseif string.find(msg, L["trigger_slimeSpray"]) then
		self:Sync(syncName.slimeSpray)
	
	
	elseif msg == L["trigger_injectYou"] then
		self:Sync(syncName.inject.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_injectOther"]) then
		local _,_, injectPerson, _ = string.find(msg, L["trigger_injectOther"])
		self:Sync(syncName.inject.." "..injectPerson)
	
	elseif string.find(msg, L["trigger_injectFade"]) then
		local _,_, injectFadePerson, _ = string.find(msg, L["trigger_injectFade"])
		if injectFadePerson == L["you"] then injectFadePerson = UnitName("Player") end
		self:Sync(syncName.injectFade.." "..injectFadePerson)
	
	elseif msg == L["trigger_cloudCast"] then
		self:Sync(syncName.cloud)
		
	elseif string.find(msg, L["trigger_cloudHitsYou"]) then
		self:WarningSign(icon.cloud, 0.7)
		self:Sound("Info")
	end
end


function module:BigWigs_RecvSync( sync, rest, nick )
	if sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
	elseif sync == syncName.slimeSpray and self.db.profile.slimespray then
		self:SlimeSpray()
	elseif sync == syncName.inject and rest and self.db.profile.inject then
		self:Inject(rest)
	elseif sync == syncName.injectFade and rest and self.db.profile.inject then
		self:InjectFade(rest)
	elseif sync == syncName.cloud and self.db.profile.cloud then
		self:Cloud()
	elseif sync == syncName.lowHp and self.db.profile.inject then
		self:LowHp()
	end
end


function module:Enrage()
	self:RemoveBar(L["bar_enrage"])
	self:CancelDelayedMessage(L["msg_enrage60"])
	self:CancelDelayedMessage(L["msg_enrage10"])
	
	self:WarningSign(icon.enrage, 0.7)
	self:Message(L["msg_enrage"], "Important", false, nil, false)
	self:Sound("RunAway")
end

function module:SlimeSpray()
	self:RemoveBar(L["bar_slimeSprayCD"])
	self:IntervalBar(L["bar_slimeSprayCD"], timer.slimeSprayCD[1], timer.slimeSprayCD[2], icon.slimeSpray, true, color.slimeSpray)
end

function module:Inject(rest)
	self:Bar(rest..L["bar_injected"], timer.injectDuration, icon.inject, true, color.inject)
	self:Message(rest..L["msg_inject"], "Urgent", false, nil, false)
	
	if (IsRaidLeader() or IsRaidOfficer()) and self.db.profile.icon then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 8)
			end
		end
	end
	
	if rest == UnitName("Player") then
		SendChatMessage(""..UnitName("Player").." 中了变异注射!","SAY")
		self:Sound("Beware")
		self:WarningSign(icon.inject, 3)
		amInjected = true
	end
end

function module:InjectFade(rest)
	self:RemoveBar(rest..L["bar_injected"])
	
	if (IsRaidLeader() or IsRaidOfficer()) and self.db.profile.icon then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 0)
			end
		end
	end
	
	if rest == UnitName("Player") and amInjected then
		self:RemoveWarningSign(icon.inject)
		SendChatMessage("我脚下有毒云！","SAY")
		self:WarningSign(icon.cleanse, 1)
		self:Sound("Long")
		amInjected = nil
	end
end

function module:Cloud()
	self:Message(L["msg_cloudCast"], "Important", false, nil, false)
	self:Bar(L["bar_cloudCD"], timer.cloudCD, icon.cloud, true, color.cloud)
end

function module:LowHp()
	lowHp = true
	
	self:Message(L["msg_lowHp"], "Important", false, nil, false)
end
