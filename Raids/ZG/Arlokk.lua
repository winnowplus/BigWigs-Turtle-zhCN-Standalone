
local module, L = BigWigs:ModuleDeclaration("High Priestess Arlokk", "Zul'Gurub")
local BC = AceLibrary("Babble-Class-2.2")
local bbhighpriestessarlokk = AceLibrary("Babble-Boss-2.2")["High Priestess Arlokk"]

module.revision = 30078
module.enabletrigger = module.translatedName
module.toggleoptions = {"phase", "mark", "whirlwind", "ravage", "gouge", "swp", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Arlokk",
	
	phase_cmd = "phase",
    phase_name = "阶段变化警报",
    phase_desc = "阶段变化时进行警告",
	
	mark_cmd = "mark",
    mark_name = "娅尔罗的印记警报",
    mark_desc = "娅尔罗的印记出现时进行警告",

	whirlwind_cmd = "whirlwind",
    whirlwind_name = "旋风斩警报",
    whirlwind_desc = "旋风斩出现时进行警告",

	ravage_cmd = "ravage",
    ravage_name = "毁灭警报",
    ravage_desc = "毁灭出现时进行警告",

	gouge_cmd = "gouge",
    gouge_name = "凿击警报",
    gouge_desc = "凿击出现时进行警告",
	
	swp_cmd = "swp",
    swp_name = "暗言术：痛警报",
    swp_desc = "暗言术：痛出现时进行警告",
	
	
	trigger_engage = "Bethekk, your priestess calls upon your might!",--CHAT_MSG_MONSTER_YELL
	
    msg_trollPhase = "巨魔阶段 - 施放凿击和暗言术：痛", --supposed to cast gouge in troll form only, is it the case on twow?
    msg_pantherPhase = "豹形阶段 - 伤害增加35% - 施放背刺和毁灭",
    msg_vanishPhase = "消失阶段 - 施放娅尔罗的印记",
    bar_return = "重新出现冷却",
    bar_returnSoon = "即将重新出现...",
    bar_nextVanish = "下一次消失",
    bar_nestTroll = "下一次巨魔阶段", --need data on timer
	
	trigger_markYou = "You are afflicted by Mark of Arlokk.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_markOther = "(.+) is afflicted by Mark of Arlokk.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_markFade = "Mark of Arlokk fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    msg_mark = " 被标记！",
    bar_mark = " 标记",
	
	trigger_ww = "High Priestess Arlokk's Whirlwind",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_ww = "旋风斩冷却",
	
	trigger_ravageYou = "You are afflicted by Ravage.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_ravageOther = "(.+) is afflicted by Ravage.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_ravageFade = "Ravage fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_ravage = " 毁灭昏迷",
	
	trigger_gougeYou = "You are afflicted by Gouge.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_gougeOther = "(.+) is afflicted by Gouge.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_gougeFade = "Gouge fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_gouge = " 被凿击",
	
	trigger_swpYou = "You are afflicted by Shadow Word: Pain.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_swpOther = "(.+) is afflicted by Shadow Word: Pain.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_swpFade = "Shadow Word: Pain fades from (.+).",	--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_swp = " 暗言术：痛",
    msg_swp = " 暗言术：痛 - 驱散！",
    you = "you",
    clickme = " >点击我<",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Arlokk",
	
	phase_cmd = "phase",
    phase_name = "阶段变化警报",
    phase_desc = "阶段变化时进行警告",
	
	mark_cmd = "mark",
    mark_name = "娅尔罗的印记警报",
    mark_desc = "娅尔罗的印记出现时进行警告",

	whirlwind_cmd = "whirlwind",
    whirlwind_name = "旋风斩警报",
    whirlwind_desc = "旋风斩出现时进行警告",

	ravage_cmd = "ravage",
    ravage_name = "毁灭警报",
    ravage_desc = "毁灭出现时进行警告",

	gouge_cmd = "gouge",
    gouge_name = "凿击警报",
    gouge_desc = "凿击出现时进行警告",
	
	swp_cmd = "swp",
    swp_name = "暗言术：痛警报",
    swp_desc = "暗言术：痛出现时进行警告",
	
	
	trigger_engage = "Bethekk, your priestess calls upon your might!",--CHAT_MSG_MONSTER_YELL
	
    msg_trollPhase = "巨魔阶段 - 施放凿击和暗言术：痛", --supposed to cast gouge in troll form only, is it the case on twow?
    msg_pantherPhase = "豹形阶段 - 伤害增加35% - 施放背刺和毁灭",
    msg_vanishPhase = "消失阶段 - 施放娅尔罗的印记",
    bar_return = "重新出现冷却",
    bar_returnSoon = "即将重新出现...",
    bar_nextVanish = "下一次消失",
    bar_nestTroll = "下一次巨魔阶段", --need data on timer
	
	trigger_markYou = "You are afflicted by Mark of Arlokk.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_markOther = "(.+) is afflicted by Mark of Arlokk.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_markFade = "Mark of Arlokk fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    msg_mark = " 被标记！",
    bar_mark = " 标记",
	
	trigger_ww = "High Priestess Arlokk's Whirlwind",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_ww = "旋风斩冷却",
	
	trigger_ravageYou = "You are afflicted by Ravage.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_ravageOther = "(.+) is afflicted by Ravage.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_ravageFade = "Ravage fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_ravage = " 毁灭昏迷",
	
	trigger_gougeYou = "You are afflicted by Gouge.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_gougeOther = "(.+) is afflicted by Gouge.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_gougeFade = "Gouge fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_gouge = " 被凿击",
	
	trigger_swpYou = "You are afflicted by Shadow Word: Pain.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_swpOther = "(.+) is afflicted by Shadow Word: Pain.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_swpFade = "Shadow Word: Pain fades from (.+).",	--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_swp = " 暗言术：痛",
    msg_swp = " 暗言术：痛 - 驱散！",
    you = "you",
    clickme = " >点击我<",
} end )

local timer = {
	firstVanish = 35,
	vanish = 75,
	
	unvanish = 35,
	unvanishSoon = 15,
	
	mark = 120,
	
	ww = 16,
	
	ravage = 2,
	
	gouge = 4,
	
	swp = 18,
}
local icon = {
	vanish = "Ability_Vanish",
	mark = "Ability_Hunter_Snipershot",
	ww = "Ability_Whirlwind",
	ravage = "spell_frost_stun",
	gouge = "ability_gouge",
	swp = "spell_shadow_shadowwordpain",
}
local color = {
	phase = "White",
	ww = "Blue",
	mark = "Green",
	ravage = "Black",
	gouge = "Red",
	swp = "Magenta",
}
local syncName = {
	vanishPhase = "ArlokkPhaseVanish"..module.revision,
	pantherPhase = "ArlokkPhasePanther"..module.revision,
	
	mark = "ArlokkMark"..module.revision,
	markFade = "ArlokkMarkFade"..module.revision,
	
	ww = "ArlokkWhirlwind"..module.revision,
	
	ravage = "ArlokkRavage"..module.revision,
	ravageFade = "ArlokkRavageFade"..module.revision,
	
	gouge = "ArlokkGouge"..module.revision,
	gougeFade = "ArlokkGougeFade"..module.revision,
	
	swp = "ArlokkSwp"..module.revision,
	swpFade = "ArlokkSwpFade"..module.revision,
}

module:RegisterYellEngage(L["trigger_engage"])

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_ww
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_ww
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_ww
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_markFade, trigger_ravageFade, trigger_gougeFade, trigger_swpFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_markFade, trigger_ravageFade, trigger_gougeFade, trigger_swpFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_markFade, trigger_ravageFade, trigger_gougeFade, trigger_swpFade
		
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_markYou, trigger_ravageYou, trigger_gougeYou, trigger_swpYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_markOther, trigger_ravageOther, trigger_gougeOther, trigger_swpOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_markOther,trigger_ravageOther, trigger_gougeOther, trigger_swpOther
	
	
	self:ThrottleSync(3, syncName.vanishPhase)
	self:ThrottleSync(3, syncName.pantherPhase)
	
	self:ThrottleSync(5, syncName.mark)
	self:ThrottleSync(5, syncName.markFade)
	
	self:ThrottleSync(5, syncName.ww)
	
	self:ThrottleSync(5, syncName.ravage)
	self:ThrottleSync(1, syncName.ravageFade)
	
	self:ThrottleSync(5, syncName.gouge)
	self:ThrottleSync(1, syncName.gougeFade)
	
	self:ThrottleSync(5, syncName.swp)
	self:ThrottleSync(1, syncName.swpFade)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	vanished = nil
	
	self:ScheduleRepeatingEvent("CheckVanish", self.CheckVanish, 1, self)
	
	if self.db.profile.phase then
		self:Bar(L["bar_nextVanish"], timer.firstVanish, icon.vanish, true, color.phase)
		self:Message(L["msg_trollPhase"], "Important", false, nil, false)
	end
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_markYou"] then
		self:Sync(syncName.mark.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_markOther"]) then
		local _,_, markedPlayer = string.find(msg, L["trigger_markOther"])
		self:Sync(syncName.mark.." "..markedPlayer)
	
	elseif string.find(msg, L["trigger_markFade"]) then
		local _,_, markFadePlayer = string.find(msg, L["trigger_markFade"])
		if markFadePlayer == L["you"] then markFadePlayer = UnitName("Player") end
		self:Sync(syncName.markFade.." "..markFadePlayer)
	
	
	elseif string.find(msg, L["trigger_ww"]) then
		self:Sync(syncName.ww)
		
	
	elseif msg == L["trigger_ravageYou"] then
		self:Sync(syncName.ravage.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_ravageOther"]) then
		local _,_, ravagedPlayer = string.find(msg, L["trigger_ravageOther"])
		self:Sync(syncName.ravage.." "..ravagedPlayer)
	
	elseif string.find(msg, L["trigger_ravageFade"]) then
		local _,_, ravageFadePlayer = string.find(msg, L["trigger_ravageFade"])
		if ravageFadePlayer == L["you"] then ravageFadePlayer = UnitName("Player") end
		self:Sync(syncName.ravageFade.." "..ravageFadePlayer)
		
		
	elseif msg == L["trigger_gougeYou"] then
		self:Sync(syncName.gouge.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_gougeOther"]) then
		local _,_, gougedPlayer = string.find(msg, L["trigger_gougeOther"])
		self:Sync(syncName.gouge.." "..gougedPlayer)
	
	elseif string.find(msg, L["trigger_gougeFade"]) then
		local _,_, gougeFadePlayer = string.find(msg, L["trigger_gougeFade"])
		if gougeFadePlayer == L["you"] then gougeFadePlayer = UnitName("Player") end
		self:Sync(syncName.gougeFade.." "..gougeFadePlayer)
		
		
	elseif msg == L["trigger_swpYou"] then
		self:Sync(syncName.swp.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_swpOther"]) then
		local _,_, swpPlayer = string.find(msg, L["trigger_swpOther"])
		self:Sync(syncName.swp.." "..swpPlayer)
	
	elseif string.find(msg, L["trigger_swpFade"]) then
		local _,_, swpFadePlayer = string.find(msg, L["trigger_swpFade"])
		if swpFadePlayer == L["you"] then swpFadePlayer = UnitName("Player") end
		self:Sync(syncName.swpFade.." "..swpFadePlayer)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.pantherPhase then
		self:PantherPhase()
	elseif sync == syncName.vanishPhase then
		self:VanishPhase()
	
	elseif sync == syncName.mark and rest and self.db.profile.mark then
		self:Mark(rest)
	elseif sync == syncName.markFade and rest and self.db.profile.mark then
		self:MarkFade(rest)
	
	elseif sync == syncName.ww and self.db.profile.whirlwind then
		self:Whirlwind()
		
	elseif sync == syncName.ravage and rest and self.db.profile.ravage then
		self:Ravage(rest)
	elseif sync == syncName.ravageFade and rest and self.db.profile.ravage then
		self:RavageFade(rest)
		
	elseif sync == syncName.gouge and rest and self.db.profile.gouge then
		self:Gouge(rest)
	elseif sync == syncName.gougeFade and rest and self.db.profile.gouge then
		self:GougeFade(rest)
		
	elseif sync == syncName.swp and rest and self.db.profile.swp then
		self:Swp(rest)
	elseif sync == syncName.swpFade and rest and self.db.profile.swp then
		self:SwpFade(rest)
	end
end

function module:PantherPhase()
	vanished = false
	
	self:CancelScheduledEvent("checkunvanish")
	
	if self.db.profile.phase then
		self:RemoveBar(L["bar_return"])
		self:Bar(L["bar_nextVanish"], timer.vanish, icon.vanish, true, color.phase)
		self:Message(L["msg_pantherPhase"], "Attention", false, nil, false)
		
		--how long until she goes back to troll phase?
		--is it the same after the 2nd vanish?
		--need data, we kill her too fast...
	end

	if not vanished then
		self:ScheduleRepeatingEvent("CheckVanish", self.CheckVanish, 0.5, self)
	end
end

function module:VanishPhase()
	vanished = true
	
	self:CancelScheduledEvent("CheckVanish")
	
	self:RemoveBar(L["bar_ww"])
	
	if self.db.profile.phase then
		self:Message(L["msg_vanishPhase"], "Attention")
	end
	
	if self.db.profile.phase then
		self:RemoveBar(L["bar_nextVanish"])
		self:Bar(L["bar_return"], timer.unvanish, icon.vanish, true, color.phase)
		self:DelayedBar(timer.unvanish, L["bar_returnSoon"], timer.unvanishSoon, icon.vanish, true, color.phase)
	end
	
	self:ScheduleRepeatingEvent("checkunvanish", self.CheckUnvanish, 0.5, self)
end

function module:CheckUnvanish()
	if module:IsArlokkVisible() then
		self:Sync(syncName.pantherPhase)
	end
end
function module:CheckVanish()
	if not module:IsArlokkVisible() then
		self:Sync(syncName.vanishPhase)
	end
end
	function module:IsArlokkVisible()
		if UnitName("PlayerTarget") == bbhighpriestessarlokk then
			return true
		else
			for i=1,GetNumRaidMembers() do
				if UnitName("Raid"..i.."Target") == bbhighpriestessarlokk then
					return true
				end
			end
		end

		return false
	end

function module:Mark(rest)
	self:Message(rest..L["msg_mark"], "Attention")

	self:Bar(rest..L["bar_mark"].. L["clickme"], timer.mark, icon.mark, true, color.mark)
	self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_mark"].. L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)

	if (IsRaidLeader() or IsRaidOfficer()) then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 8)
			end
		end
	end
end

function module:MarkFade(rest)
	self:RemoveBar(rest..L["bar_mark"].. L["clickme"])
	
	if (IsRaidLeader() or IsRaidOfficer()) then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 0)
			end
		end
	end
end

function module:Whirlwind()
	self:Bar(L["bar_ww"], timer.ww, icon.ww, true, color.ww)
end

function module:Ravage(rest)
	self:Bar(rest..L["bar_ravage"], timer.ravage, icon.ravage, true, color.ravage)
end

function module:RavageFade(rest)
	self:RemoveBar(rest..L["bar_ravage"])
end

function module:Gouge(rest)
	self:Bar(rest..L["bar_gouge"], timer.gouge, icon.gouge, true, color.gouge)
end

function module:GougeFade(rest)
	self:RemoveBar(rest..L["bar_gouge"])
end

function module:Swp(rest)
	self:Bar(rest..L["bar_swp"], timer.swp, icon.swp, true, color.swp)
	
	if UnitClass("Player") == BC["Priest"] or UnitClass("Player") == BC["Paladin"] then
		self:Message(rest..L["msg_swp"], "Personal", false, nil, false)
		self:Sound("Info")
		self:WarningSign(icon.swp, 0.7)
	end
end

function module:SwpFade(rest)
	self:RemoveBar(rest..L["bar_swp"])
end
