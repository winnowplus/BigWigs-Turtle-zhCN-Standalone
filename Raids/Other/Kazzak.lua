
local module, L = BigWigs:ModuleDeclaration("Lord Kazzak", "Blasted Lands")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30067
module.enabletrigger = module.translatedName 
module.toggleoptions = {"berserk", "markofkazzak", "puticon", "twistedreflection", "voidbolt", "corruptsoul", "lowmana", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Kazzak",

    berserk_cmd = "berserk",
    berserk_name = "狂暴警报",
    berserk_desc = "狂暴出现时进行警告。",

    markofkazzak_cmd = "markofkazzak",
    markofkazzak_name = "卡扎克印记警报",
    markofkazzak_desc = "卡扎克印记（法力吸取减益）出现时进行警告。",

    puticon_cmd = "puticon",
    puticon_name = "标记卡扎克印记目标的团队图标",
    puticon_desc = "在获得卡扎克印记的人身上放置团队图标。\n\n（需要助理或更高权限）",

    twistedreflection_cmd = "twistedreflection",
    twistedreflection_name = "扭曲反射警报",
    twistedreflection_desc = "扭曲反射（每次击中治疗卡扎克25k生命值）出现时进行警告。",

    voidbolt_cmd = "voidbolt",
    voidbolt_name = "虚空箭警报",
    voidbolt_desc = "虚空箭出现时进行警告。",

    corruptsoul_cmd = "corruptsoul",
    corruptsoul_name = "腐蚀灵魂警报",
    corruptsoul_desc = "当卡扎克因随机死亡而得到治疗时进行警告。",

    lowmana_cmd = "lowmana",
    lowmana_name = "低法力警报",
    lowmana_desc = "当你的法力值过低时进行警告。",
	
	
	trigger_engage1 = "All mortals will perish!", --CHAT_MSG_MONSTER_YELL
	trigger_engage2 = "The Legion will conquer all!", --CHAT_MSG_MONSTER_YELL
	trigger_bossDead = "The Legion... will never... fall.", --CHAT_MSG_MONSTER_YELL
	
	trigger_berserk = "Lord Kazzak gains Berserk.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS to be confirmed
    bar_berserk = "狂暴",
    msg_berserk60 = "1分钟后狂暴！",
    msg_berserk10 = "10秒后狂暴！",
    msg_berserk = "狂暴！",
	
	trigger_markOfKazzakYou = "You are afflicted by Mark of Kazzak.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_markOfKazzakOther = "(.+) is afflicted by Mark of Kazzak.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_markOfKazzakFade = "Mark of Kazzak fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_markOfKazzakCd = "卡扎克印记 CD",
    bar_markOfKazzakDur = " 卡扎克印记",
    msg_markOfKazzak = " 被卡扎克印记 - 驱散！",
    msg_markOfKazzakYou = "你中了卡扎克印记 - 法力不能耗尽！",
    msg_lowMana = "警告 - 你的法力很低 - 卡扎克印记可能致命！",
	
	trigger_twistedReflectionYou = "You are afflicted by Twisted Reflection.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_twistedReflectionOther = "(.+) is afflicted by Twisted Reflection.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_twistedReflectionFade = "Twisted Reflection fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_twistedReflectionCd = "扭曲反射 CD",
    bar_twistedReflectionDur = " 扭曲反射",
    msg_twistedReflection = " 被扭曲反射 - 驱散！",
	
	trigger_voidBolt = "Lord Kazzak begins to cast Void Bolt.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_voidBoltCd = "虚空箭 CD",
    bar_voidBoltCast = "虚空箭！",
		
	trigger_deadYou = "You die.", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
	trigger_deadOther = "(.+) dies.", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
    msg_corruptSoul = " 死亡治疗了魔王卡扎克！",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	cmd = "Kazzak",

    berserk_cmd = "berserk",
    berserk_name = "狂暴警报",
    berserk_desc = "狂暴出现时进行警告。",

    markofkazzak_cmd = "markofkazzak",
    markofkazzak_name = "卡扎克印记警报",
    markofkazzak_desc = "卡扎克印记（法力吸取减益）出现时进行警告。",

    puticon_cmd = "puticon",
    puticon_name = "标记卡扎克印记目标的团队图标",
    puticon_desc = "在获得卡扎克印记的人身上放置团队图标。\n\n（需要助理或更高权限）",

    twistedreflection_cmd = "twistedreflection",
    twistedreflection_name = "扭曲反射警报",
    twistedreflection_desc = "扭曲反射（每次击中治疗卡扎克25k生命值）出现时进行警告。",

    voidbolt_cmd = "voidbolt",
    voidbolt_name = "虚空箭警报",
    voidbolt_desc = "虚空箭出现时进行警告。",

    corruptsoul_cmd = "corruptsoul",
    corruptsoul_name = "腐蚀灵魂警报",
    corruptsoul_desc = "当卡扎克因随机死亡而得到治疗时进行警告。",

    lowmana_cmd = "lowmana",
    lowmana_name = "低法力警报",
    lowmana_desc = "当你的法力值过低时进行警告。",
	
	
	trigger_engage1 = "All mortals will perish!", --CHAT_MSG_MONSTER_YELL
	trigger_engage2 = "The Legion will conquer all!", --CHAT_MSG_MONSTER_YELL
	trigger_bossDead = "The Legion... will never... fall.", --CHAT_MSG_MONSTER_YELL
	
	trigger_berserk = "Lord Kazzak gains Berserk.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS to be confirmed
    bar_berserk = "狂暴",
    msg_berserk60 = "1分钟后狂暴！",
    msg_berserk10 = "10秒后狂暴！",
    msg_berserk = "狂暴！",
	
	trigger_markOfKazzakYou = "You are afflicted by Mark of Kazzak.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_markOfKazzakOther = "(.+) is afflicted by Mark of Kazzak.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_markOfKazzakFade = "Mark of Kazzak fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_markOfKazzakCd = "卡扎克印记 CD",
    bar_markOfKazzakDur = " 卡扎克印记",
    msg_markOfKazzak = " 被卡扎克印记 - 驱散！",
    msg_markOfKazzakYou = "你中了卡扎克印记 - 法力不能耗尽！",
    msg_lowMana = "警告 - 你的法力很低 - 卡扎克印记可能致命！",
	
	trigger_twistedReflectionYou = "You are afflicted by Twisted Reflection.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_twistedReflectionOther = "(.+) is afflicted by Twisted Reflection.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_twistedReflectionFade = "Twisted Reflection fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_twistedReflectionCd = "扭曲反射 CD",
    bar_twistedReflectionDur = " 扭曲反射",
    msg_twistedReflection = " 被扭曲反射 - 驱散！",
	
	trigger_voidBolt = "Lord Kazzak begins to cast Void Bolt.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_voidBoltCd = "虚空箭 CD",
    bar_voidBoltCast = "虚空箭！",
		
	trigger_deadYou = "You die.", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
	trigger_deadOther = "(.+) dies.", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
    msg_corruptSoul = " 死亡治疗了魔王卡扎克！",
    you = "you",
} end )

local timer = {
	berserk = 180,
	
	firstMarkOfKazzakCd = 14,
	markOfKazzakCd = 10,
	markOfKazzakDur = 60,
	
	twistedReflectionCd = 14,
	twistedReflectionDur = 45,
	
	voidBoltCd = 10,
	voidBoltCast = 4,
}
local icon = {
	berserk = "Spell_Shadow_UnholyFrenzy",
	markOfKazzak = "Spell_Shadow_Antishadow",
	twistedReflection = "Spell_Arcane_PortalDarnassus",
	voidBolt = "Spell_Shadow_Haunting",
}
local color = {
	berserk = "Black",
	
	markOfKazzakCd = "Orange",
	markOfKazzakDur = "Red",
	
	twistedReflectionCd = "White",
	twistedReflectionDur = "Magenta",
	
	voidBoltCd = "Cyan",
	voidBoltCast = "Blue",
}
local syncName = {
	berserk = "LordKazzakBerserk"..module.revision,
	
	markOfKazzak = "LordKazzakMarkStart"..module.revision,
	markOfKazzakFade = "LordKazzakMarkStop"..module.revision,
	
	twistedReflection = "LordKazzakReflectionStart"..module.revision,
	twistedReflectionFade = "LordKazzakReflectionStop"..module.revision,
	
	voidBolt = "LordKazzakVoidBoltStart"..module.revision,
	--voidboltStop = "LordKazzakVoidBoltStop"..module.revision,
		
	randomDeath = "LordKazzakRandomDeath"..module.revision,
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --engage and kill
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_markOfKazzakFade, trigger_twistedReflectionFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_markOfKazzakFade, trigger_twistedReflectionFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_markOfKazzakFade, trigger_twistedReflectionFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_markOfKazzakYou, trigger_twistedReflectionYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_markOfKazzakOther, trigger_twistedReflectionOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_markOfKazzakOther, trigger_twistedReflectionOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_voidBolt
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_berserk


	self:ThrottleSync(2, syncName.markOfKazzak)
	self:ThrottleSync(2, syncName.markOfKazzakFade)
	
	self:ThrottleSync(2, syncName.twistedReflection)
	self:ThrottleSync(2, syncName.twistedReflectionFade)
	
	self:ThrottleSync(5, syncName.voidBolt)
	
	self:ThrottleSync(5, syncName.berserk)
	
	self:ThrottleSync(0.5, syncName.randomDeath)
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH") --trigger_deadYou, trigger_deadOther
end

function module:OnEngage()	
	if self.db.profile.berserk then
		self:Bar(L["bar_berserk"], timer.berserk, icon.berserk, true, color.berserk)
		self:DelayedMessage(timer.berserk - 60, L["msg_berserk60"], "Attention", false, nil, false)
		self:DelayedMessage(timer.berserk - 10, L["msg_berserk10"], "Important", false, nil, false)
		
	end
	
	if self.db.profile.markofkazzak then
		self:Bar(L["bar_markOfKazzakCd"], timer.firstMarkOfKazzakCd, icon.markOfKazzak, true, color.markOfKazzakCd)
	end
	
	if self.db.profile.twistedreflection then
		self:Bar(L["bar_twistedReflectionCd"], timer.twistedReflectionCd, icon.twistedReflection, true, color.twistedReflectionCd)
	end
	
	if self.db.profile.voidbolt then
		self:Bar(L["bar_voidBoltCd"], timer.voidBoltCd, icon.voidBolt, true, color.voidBoltCd)
	end
	
	if self.db.profile.lowmana and not (UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Rogue"]) then
		self:ScheduleRepeatingEvent("CheckMana", self.CheckMana, 2, self)
	end
end

function module:CheckMana()
	if self.db.profile.lowmana and not UnitIsDeadOrGhost("Player") and UnitMana("Player") <= 1000 then
		self:Message(L["msg_lowMana"], "Personal", false, nil, false)
	end
end

function module:OnDisengage()
	self:CancelScheduledEvent("CheckMana")
end

function module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
	BigWigs:CheckForWipe(self)
	
	if string.find(msg, L["trigger_deadYou"]) then
		self:Sync(syncName.randomDeath.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_deadOther"]) then
		local _,_,deadPlayer,_ = string.find(msg, L["trigger_deadOther"])
		self:Sync(syncName.randomDeath.." "..deadPlayer)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_engage1"] or msg == L["trigger_engage2"] then
		module:SendEngageSync()
	elseif msg == L["trigger_bossDead"] then
		self:SendBossDeathSync()
	end
end

function module:Event(msg)
	if msg == L["trigger_berserk"] then
		self:Sync(syncName.berserk)
	
	
	elseif msg == L["trigger_markOfKazzakYou"] then
		self:Sync(syncName.markOfKazzak.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_markOfKazzakOther"]) then
		local _,_,markOfKazzakPlayer,_ = string.find(msg, L["trigger_markOfKazzakOther"])
		self:Sync(syncName.markOfKazzak.." "..markOfKazzakPlayer)
		
	elseif string.find(msg, L["trigger_markOfKazzakFade"]) then
		local _,_,markOfKazzakFadePlayer,_ = string.find(msg, L["trigger_markOfKazzakFade"])
		if markOfKazzakFadePlayer == L["you"] then markOfKazzakFadePlayer = UnitName("Player") end
		self:Sync(syncName.markOfKazzakFade.." "..markOfKazzakFadePlayer)
	
	
	elseif msg == L["trigger_twistedReflectionYou"] then
		self:Sync(syncName.twistedReflection.." "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_twistedReflectionOther"]) then
		local _,_,twistedReflectionPlayer,_ = string.find(msg, L["trigger_twistedReflectionOther"])
		self:Sync(syncName.twistedReflection.." "..twistedReflectionPlayer)
		
	elseif string.find(msg, L["trigger_twistedReflectionFade"]) then
		local _,_,twistedReflectionFadePlayer,_ = string.find(msg, L["trigger_twistedReflectionFade"])
		if twistedReflectionFadePlayer == L["you"] then twistedReflectionFadePlayer = UnitName("Player") end
		self:Sync(syncName.twistedReflectionFade.." "..twistedReflectionFadePlayer)
		
		
	elseif msg == L["trigger_voidBolt"] then
		self:Sync(syncName.voidBolt)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.berserk and self.db.profile.berserk then
		self:Berserk()
	
	elseif sync == syncName.markOfKazzak and rest and self.db.profile.markofkazzak then
		self:MarkOfKazzak(rest)
	elseif sync == syncName.markOfKazzakFade and rest and self.db.profile.markofkazzak then
		self:MarkOfKazzakFade(rest)
	
	elseif sync == syncName.twistedReflection and rest and self.db.profile.twistedreflection then
		self:TwistedReflection(rest)
	elseif sync == syncName.twistedReflectionFade and rest and self.db.profile.twistedreflection then
		self:TwistedReflectionFade(rest)
		
	elseif sync == syncName.voidBolt and self.db.profile.voidbolt then
		self:VoidBolt()
		
	elseif sync == syncName.randomDeath and rest then
		self:RandomDeath(rest)
	end
end


function module:Berserk()
	self:RemoveBar(L["bar_berserk"])
	self:CancelDelayedMessage(L["msg_berserk60"])
	self:CancelDelayedMessage(L["msg_berserk10"])
	
	self:Message(L["msg_berserk"], "Urgent", false, nil, false)
	self:WarningSign(icon.berserk, 1)
	self:Sound("Beware")
end

function module:MarkOfKazzak(rest)
	self:Bar(rest..L["bar_markOfKazzakDur"], timer.markOfKazzakDur, icon.markOfKazzak, true, color.markOfKazzakDur)
	self:Bar(L["bar_markOfKazzakCd"], timer.markOfKazzakCd, icon.markOfKazzak, true, color.markOfKazzakCd)
	
	if rest == UnitName("Player") and not (UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Rogue"]) then
		self:Message(L["msg_markOfKazzakYou"], "Personal", false, nil, false)
		self:Sound("Beware")
		self:WarningSign(icon.markOfKazzak, timer.markOfKazzakDur)
	end
	
	if UnitClass("Player") == BC["Mage"] or UnitClass("Player") == BC["Druid"] then
		self:Message(rest..L["msg_markOfKazzak"], "Urgent", false, nil, false)
		self:Sound("Info")
		self:WarningSign(icon.markOfKazzak, timer.markOfKazzakDur)
	end
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 8)
			end
		end
	end
end

function module:MarkOfKazzakFade(rest)
	self:RemoveBar(rest..L["bar_markOfKazzakDur"])
	
	if rest == UnitName("Player") then
		self:RemoveWarningSign(icon.markOfKazzak)
	end
	
	if UnitClass("Player") == BC["Mage"] or UnitClass("Player") == BC["Druid"] then
		self:RemoveWarningSign(icon.markOfKazzak)
	end
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 0)
			end
		end
	end
end

function module:TwistedReflection(rest)
	self:Bar(rest..L["bar_twistedReflectionDur"], timer.twistedReflectionDur, icon.twistedReflection, true, color.twistedReflectionDur)
	self:Bar(L["bar_twistedReflectionCd"], timer.twistedReflectionCd, icon.twistedReflection, true, color.twistedReflectionCd)
	
	if UnitClass("Player") == BC["Priest"] or UnitClass("Player") == BC["Paladin"] then
		self:Message(rest..L["msg_twistedReflection"], "Urgent", false, nil, false)
		self:Sound("Info")
		self:WarningSign(icon.twistedReflection, timer.twistedReflectionDur)
	end
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 6)
			end
		end
	end
end

function module:TwistedReflectionFade(rest)
	self:RemoveBar(rest..L["bar_twistedReflectionDur"])
	
	if UnitClass("Player") == BC["Priest"] or UnitClass("Player") == BC["Paladin"] then
		self:RemoveWarningSign(icon.twistedReflection)
	end
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 0)
			end
		end
	end
end

function module:VoidBolt()
	self:RemoveBar(L["bar_voidBoltCd"])
	self:Bar(L["bar_voidBoltCast"], timer.voidBoltCast, icon.voidBolt, true, color.voidBoltCast)
	self:DelayedBar(timer.voidBoltCast, L["bar_voidBoltCd"], timer.voidBoltCd, icon.voidBolt, true, color.voidBoltCd)
end

function module:RandomDeath(rest)
	if self.db.profile.markofkazzak then
		self:MarkOfKazzakFade(rest)
	end
		
	if self.db.profile.twistedreflection then
		self:TwistedReflectionFade(rest)
	end
	if self.db.profile.corruptsoul then
		self:CorruptSoul(rest)
	end
end

function module:CorruptSoul(rest)
	self:Message(rest..L["msg_corruptSoul"], "Attention", false, nil, false)
end
