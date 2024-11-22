local module, L = BigWigs:ModuleDeclaration("Gri'lek", "Zul'Gurub")
local BC = AceLibrary("Babble-Class-2.2")
local bbgrilek = AceLibrary("Babble-Boss-2.2")["Gri'lek"]

module.revision = 30057
module.enabletrigger = module.translatedName
module.toggleoptions = {"avatar", "puticon", "stun", "groundtremor", "roots", "sweepingstrikes", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Grilek",
	
    avatar_cmd = "avatar",
    avatar_name = "天神下凡警报",
    avatar_desc = "天神下凡出现时进行警告。",

    puticon_cmd = "puticon",
    puticon_name = "在格里雷克的目标上放置图标",
    puticon_desc = "在格里雷克的目标玩家身上标记团队图标。",

    stun_cmd = "stun",
    stun_name = "首领昏迷警报",
    stun_desc = "格里雷克在天神下凡后昏迷（2秒）时警告。",

    groundtremor_cmd = "groundtremor",
    groundtremor_name = "地震警报",
    groundtremor_desc = "地震出现时进行警告。",
	
    roots_cmd = "roots",
    roots_name = "纠缠根须警报",
    roots_desc = "纠缠根须出现时进行警告。",

    sweepingstrikes_cmd = "sweepingstrikes",
    sweepingstrikes_name = "横扫攻击警报",
    sweepingstrikes_desc = "横扫攻击出现时进行警告。",


    trigger_avatar = "Gri'lek is afflicted by Avatar.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
    trigger_avatarFade = "Avatar fades from Gri'lek.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_avatarCd = "天神下凡 CD",
    bar_avatarDur = "天神下凡！",
    msg_avatar = "天神下凡 - 远离Boss！",
	
    trigger_stun = "Gri'lek is afflicted by Stun.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
    trigger_stunFade = "Stun fades from Gri'lek.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_stun = "格里雷克昏迷",

    trigger_groundTremor = "afflicted by Ground Tremor.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_groundTremorFade = "Ground Tremor fades from", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_groundTremorCd = "地震 CD",
    bar_groundTremorDur = "地震昏迷",

    trigger_rootsYou = "You are afflicted by Entangling Roots.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_rootsOther = "(.+) is afflicted by Entangling Roots.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_rootsFade = "Entangling Roots fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_roots = " 纠缠",
	
	--untested
    trigger_sweepingStrikes = "Gri'lek gains Sweeping Strikes.", --guessing CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    trigger_sweepingStrikes2 = "Gri'lek is afflicted Sweeping Strikes.", --guessing CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
    trigger_sweepingStrikesFade = "Sweeping Strikes fades from Gri'lek.", --guessing CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_sweepingStrikes = "横扫攻击！",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	cmd = "Grilek",
	
    avatar_cmd = "avatar",
    avatar_name = "天神下凡警报",
    avatar_desc = "天神下凡出现时进行警告。",

    puticon_cmd = "puticon",
    puticon_name = "在格里雷克的目标上放置图标",
    puticon_desc = "在格里雷克的目标玩家身上标记团队图标。",

    stun_cmd = "stun",
    stun_name = "首领昏迷警报",
    stun_desc = "格里雷克在天神下凡后昏迷（2秒）时警告。",

    groundtremor_cmd = "groundtremor",
    groundtremor_name = "地震警报",
    groundtremor_desc = "地震出现时进行警告。",
	
    roots_cmd = "roots",
    roots_name = "纠缠根须警报",
    roots_desc = "纠缠根须出现时进行警告。",

    sweepingstrikes_cmd = "sweepingstrikes",
    sweepingstrikes_name = "横扫攻击警报",
    sweepingstrikes_desc = "横扫攻击出现时进行警告。",


    trigger_avatar = "Gri'lek is afflicted by Avatar.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
    trigger_avatarFade = "Avatar fades from Gri'lek.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_avatarCd = "天神下凡 CD",
    bar_avatarDur = "天神下凡！",
    msg_avatar = "天神下凡 - 远离Boss！",
	
    trigger_stun = "Gri'lek is afflicted by Stun.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
    trigger_stunFade = "Stun fades from Gri'lek.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_stun = "格里雷克昏迷",

    trigger_groundTremor = "afflicted by Ground Tremor.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_groundTremorFade = "Ground Tremor fades from", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_groundTremorCd = "地震 CD",
    bar_groundTremorDur = "地震昏迷",

    trigger_rootsYou = "You are afflicted by Entangling Roots.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_rootsOther = "(.+) is afflicted by Entangling Roots.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_rootsFade = "Entangling Roots fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_roots = " 纠缠",
	
	--untested
    trigger_sweepingStrikes = "Gri'lek gains Sweeping Strikes.", --guessing CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    trigger_sweepingStrikes2 = "Gri'lek is afflicted Sweeping Strikes.", --guessing CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
    trigger_sweepingStrikesFade = "Sweeping Strikes fades from Gri'lek.", --guessing CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_sweepingStrikes = "横扫攻击！",
    you = "you",
} end )

local timer = {
	firstAvatar = 25,
	avatarCd = 10, --25s - duration
	avatarDur = 15,
	
	stun = 2,
	
	firstGroundTremor = 18,
	groundTremorCd = 18, --20s - duration
	groundTremorDur = 2,
	
	roots = 10,
	
	--does he do it on Twow?
	sweepingStrikes = 20,
}
local icon = {
	avatar = "Ability_Creature_Cursed_05",
	stun = "spell_frost_stun",
	groundTremor = "spell_nature_earthquake",
	roots = "spell_nature_stranglevines",
	
	--does he do it on Twow?
	sweepingStrikes = "ability_rogue_slicedice",
}
local color = {
	avatarCd = "White",
	avatarDur = "Cyan",
	stun = "Blue",
	groundTremor = "Black",
	roots = "Green",
	
	--does he do it on Twow?
	sweepingStrikes = "Red",
}
local syncName = {
	avatar = "GrilekAvatar"..module.revision,
	avatarOver = "GrilekAvatarStop"..module.revision,
	stun = "GrilekStun"..module.revision,
	stunFade = "GrilekStunFade"..module.revision,
	groundTremor = "GrilekGroundTremor"..module.revision,
	groundTremorFade = "GrilekGroundTremorFade"..module.revision,
	roots = "GrilekRoots"..module.revision,
	rootsFade = "GrilekRootsFade"..module.revision,
	
	--does he do it on Twow?
	sweepingStrikes = "GrilekSweepingStrikes"..module.revision,
	sweepingStrikesFade = "GrilekSweepingStrikesFade"..module.revision,
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --Debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_sweepingStrikes
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "Event") --trigger_avatar, trigger_stun, trigger_sweepingStrikes2
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_groundTremor, trigger_rootsYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_groundTremor, trigger_rootsOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_groundTremor, trigger_rootsOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_rootsFade, trigger_groundTremorFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_rootsFade, trigger_groundTremorFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_avatarFade, trigger_stunFade, trigger_rootsFade, trigger_sweepingStrikesFade, trigger_groundTremorFade

	self:ThrottleSync(3, syncName.avatar)
	self:ThrottleSync(3, syncName.avatarOver)
	self:ThrottleSync(3, syncName.stun)
	self:ThrottleSync(3, syncName.stunFade)
	self:ThrottleSync(3, syncName.groundTremor)
	self:ThrottleSync(3, syncName.groundTremorFade)
	self:ThrottleSync(3, syncName.roots)
	self:ThrottleSync(0, syncName.rootsFade)
	
	--does he do it on Twow?
	self:ThrottleSync(3, syncName.sweepingStrikes)
	self:ThrottleSync(3, syncName.sweepingStrikesFade)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	if self.db.profile.avatar then
		self:Bar(L["bar_avatarCd"], timer.firstAvatar, icon.avatar, true, color.avatarCd)
	end
	
	if self.db.profile.groundtremor then
		self:Bar(L["bar_groundTremorCd"], timer.firstGroundTremor, icon.groundTremor, true, color.groundTremor)
	end
	
	if self.db.profile.puticon then
		self:ScheduleRepeatingEvent("grilekTargetCheck", self.GrilekTarget, 0.5, self)
	end
end

function module:OnDisengage()
	self:CancelScheduledEvent("grilekTargetCheck")
end

function module:GrilekTarget()
	if (IsRaidLeader() or IsRaidOfficer()) and UnitName("Target") ~= nil and UnitName("TargetTarget") ~= nil then
		if UnitName("Target") == bbgrilek and UnitName("TargetTarget") ~= nil then
			SetRaidTargetIcon("TargetTarget",8)
		end
	end
end

function module:Event(msg)
	if msg == L["trigger_avatar"] then
		self:Sync(syncName.avatar)
	elseif msg == L["trigger_avatarFade"] then
		self:Sync(syncName.avatarOver)
	
	elseif msg == L["trigger_stun"] then
		self:Sync(syncName.stun)
	elseif msg == L["trigger_stunFade"] then
		self:Sync(syncName.stunFade)
	
	elseif string.find(msg, L["trigger_groundTremor"]) then
		self:Sync(syncName.groundTremor)
	elseif string.find(msg, L["trigger_groundTremorFade"]) then
		self:Sync(syncName.groundTremorFade)
		
		
	elseif string.find(msg, L["trigger_rootsYou"]) then
		self:Sync(syncName.roots .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_rootsOther"]) then
		local _, _, rootsPlayer, _ = string.find(msg, L["trigger_rootsOther"])
		self:Sync(syncName.roots .. " " .. rootsPlayer)
	
	elseif string.find(msg, L["trigger_rootsFade"]) then
		local _, _, rootsFadePlayer, _ = string.find(msg, L["trigger_rootsFade"])
		if rootsFadePlayer == L["you"] then rootsFadePlayer = UnitName("Player") end
		self:Sync(syncName.rootsFade .. " " .. rootsFadePlayer)
	
	
	elseif msg == L["trigger_sweepingStrikes"] or msg == L["trigger_sweepingStrikes2"] then
		self:Sync(syncName.sweepingStrikes)
	elseif msg == L["trigger_sweepingStrikesFade"] then
		self:Sync(syncName.sweepingStrikesFade)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.avatar and self.db.profile.avatar then
		self:Avatar()
	elseif sync == syncName.avatarOver and self.db.profile.avatar then
		self:AvatarOver()
		
	elseif sync == syncName.stun and self.db.profile.stun then
		self:Stun()
	elseif sync == syncName.stunFade and self.db.profile.stun then
		self:StunFade()
		
	elseif sync == syncName.groundTremor and self.db.profile.groundtremor then
		self:GroundTremor()
	elseif sync == syncName.groundTremorFade and self.db.profile.groundtremor then
		self:GroundTremorFade()
		
	elseif sync == syncName.roots and rest and self.db.profile.roots then
		self:Roots(rest)
	elseif sync == syncName.rootsFade and rest and self.db.profile.roots then
		self:RootsFade(rest)
		
	elseif sync == syncName.sweepingStrikes and self.db.profile.sweepingstrikes then
		self:SweepingStrikes()
	elseif sync == syncName.sweepingStrikesFade and self.db.profile.sweepingstrikes then
		self:SweepingStrikesFade()
	end
end


function module:Avatar()
	self:RemoveBar(L["bar_avatarCd"])
	
	self:Bar(L["bar_avatarDur"], timer.avatarDur, icon.avatar, true, color.avatarDur)
	self:Message(L["msg_avatar"], "Urgent", false, nil, false)
	self:WarningSign(icon.avatar, 1)
	self:Sound("RunAway")
end

function module:AvatarOver()
	self:RemoveBar(L["bar_avatarDur"])
	self:Bar(L["bar_avatarCd"], timer.avatarCd, icon.avatar, true, color.avatarCd)
end

function module:Stun()
	self:Bar(L["bar_stun"], timer.stun, icon.stun, true, color.stun)
end

function module:StunFade()
	self:RemoveBar(L["bar_stun"])
end

function module:GroundTremor()
	self:RemoveBar(L["bar_groundTremorCd"])
	self:Bar(L["bar_groundTremorDur"], timer.groundTremorDur, icon.groundTremor, true, color.groundTremor)
end

function module:GroundTremorFade()
	self:RemoveBar(L["bar_groundTremorDur"])
	self:Bar(L["bar_groundTremorCd"], timer.groundTremorCd, icon.groundTremor, true, color.groundTremor)
end

function module:Roots(rest)
	self:Bar(rest..L["bar_roots"], timer.roots, icon.roots, true, color.roots)
	
	if UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Priest"] then
		self:WarningSign(icon.roots, 0.7)
		self:Sound("Info")
	end
end

function module:RootsFade(rest)
	self:RemoveBar(rest..L["bar_roots"])
end

function module:SweepingStrikes()
	self:Bar(L["bar_sweepingStrikes"], timer.sweepingStrikes, icon.sweepingStrikes, true, color.sweepingStrikes)
	
	if UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Druid"] then
		self:WarningSign(icon.sweepingStrikes, 1)
		self:Sound("Beware")
	end
end

function module:SweepingStrikesFade()
	self:RemoveBar(L["bar_sweepingStrikes"])
end
