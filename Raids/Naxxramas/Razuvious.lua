
local module, L = BigWigs:ModuleDeclaration("Instructor Razuvious", "Naxxramas")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30067
module.enabletrigger = module.translatedName
module.toggleoptions = {"mc", "shout", "unbalance", "shieldwall", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Razuvious",

    shout_cmd = "shout",
    shout_name = "怒吼警报",
    shout_desc = "打断怒吼时进行警告",

    mc_cmd = "mc",
    mc_name = "精神控制计时条",
    mc_desc = "显示精神控制计时条",

    unbalance_cmd = "unbalancing",
    unbalance_name = "重压打击警报",
    unbalance_desc = "重压打击出现时进行警告",

    shieldwall_cmd = "shieldwall",
    shieldwall_name = "盾墙计时器",
    shieldwall_desc = "显示盾墙计时器",


	trigger_shout = "%s lets loose a triumphant shout.", --CHAT_MSG_RAID_BOSS_EMOTE
    bar_shout = "打断怒吼",
    msg_shout = "打断怒吼！",
	
	trigger_mcYou = "You gain Mind Control.", --CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS
	trigger_mcFadeYou = "Mind Control fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    mc_bar = " 精神控制",
    mcLocked_bar = "无法精神控制 ",
	
	trigger_unbalance = "afflicted by Unbalancing Strike.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_unbalance2 = "Instructor Razuvious's Unbalancing Strike", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_unbalance = "重压打击",
	
	trigger_shieldWall = "Deathknight Understudy gains Shield Wall.", --CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS
    bar_shieldWall = "盾墙",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Razuvious",

    shout_cmd = "shout",
    shout_name = "怒吼警报",
    shout_desc = "瓦解怒吼时进行警告",

    mc_cmd = "mc",
    mc_name = "精神控制计时条",
    mc_desc = "显示精神控制计时条",

    unbalance_cmd = "unbalancing",
    unbalance_name = "重压打击警报",
    unbalance_desc = "重压打击出现时进行警告",

    shieldwall_cmd = "shieldwall",
    shieldwall_name = "盾墙计时器",
    shieldwall_desc = "显示盾墙计时器",


	trigger_shout = "%s发出胜利的呼喊。", --CHAT_MSG_RAID_BOSS_EMOTE
    bar_shout = "瓦解怒吼",
    msg_shout = "瓦解怒吼！",
	
	trigger_mcYou = "你获得了精神控制的效果。", --CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS
	trigger_mcFadeYou = "精神控制效果从你身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF
    mc_bar = " 精神控制",
    mcLocked_bar = "无法精神控制 ",
	
	trigger_unbalance = "受到了重压打击效果的影响。", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_unbalance2 = "教官拉苏维奥斯的重压打击", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_unbalance = "重压打击",
	
	trigger_shieldWall = "死亡骑士学员获得了盾墙的效果。", --CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS
    bar_shieldWall = "盾墙",
} end )

local timer = {
	firstShout = 14.5,
	shout = 25,
	
	mc = 60,
	mcLocked = 60,
	
	unbalance = 30,
	
	shieldwall = 20,
}
local icon = {
	shout = "Ability_Warrior_WarCry",
	
	mc = "spell_shadow_shadowworddominate",
	mcLocked = "spell_shadow_sacrificialshield",
	taunt = "spell_nature_reincarnation",
	
	unbalance = "Ability_Warrior_DecisiveStrike",
	
	shieldwall = "Ability_Warrior_ShieldWall",
}
local color = {
	shout = "Red",
	
	mc = "White",
	mcLocked = "Black",
	
	unbalance = "Blue",
	
	shieldwall = "Green",
}
local syncName = {
	shout = "RazuviousShout"..module.revision,
	
	mc = "RazuviousMc"..module.revision,
	mcEnd = "RazuviousMcEnd"..module.revision,
	mcLocked = "RazuviousMcLocked"..module.revision,
	
	unbalance = "RazuviousUnbalance"..module.revision,
	
	shieldwall = "RazuviousShieldwall"..module.revision,
}

local mcIcon = nil

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE") --trigger_shout
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_unbalance2
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_unbalance2
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_unbalance2
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS", "Event")--trigger_mcYou
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_mcFadeYou
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_unbalance
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_unbalance
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_BUFFS", "Event") --trigger_shieldWall
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_BUFFS", "Event") --trigger_shieldWall
	
	
	self:ThrottleSync(5, syncName.shout)
	self:ThrottleSync(0, syncName.mc)
	self:ThrottleSync(0, syncName.mcEnd)
	self:ThrottleSync(0, syncName.mcLocked)	
	self:ThrottleSync(5, syncName.unbalance)
	self:ThrottleSync(5, syncName.shieldwall)
end

function module:OnSetup()
end

function module:OnEngage()
	mcIcon = nil
	
	if self.db.profile.shout then
		self:Bar(L["bar_shout"], timer.firstShout, icon.shout, true, color.shout)
		self:DelayedWarningSign(timer.firstShout - 3, icon.shout, 0.7)
	end
end

function module:OnDisengage()
end

function module:CHAT_MSG_RAID_BOSS_EMOTE(msg)
	if msg == L["trigger_shout"] then
		self:Sync(syncName.shout)
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_unbalance"]) or string.find(msg, L["trigger_unbalance2"]) then
		self:Sync(syncName.unbalance)
	
	elseif string.find(msg, L["trigger_shieldWall"]) then
		self:Sync(syncName.shieldwall)
	
	elseif string.find(msg, L["trigger_mcYou"]) then
		if GetRaidTargetIndex("Target") == nil	then mcIcon = "NoIcon"		end
		if GetRaidTargetIndex("Target") == 1	then mcIcon = "Star"		end
		if GetRaidTargetIndex("Target") == 2	then mcIcon = "Circle"		end
		if GetRaidTargetIndex("Target") == 3	then mcIcon = "Diamond"		end
		if GetRaidTargetIndex("Target") == 4	then mcIcon = "Triangle"	end
		if GetRaidTargetIndex("Target") == 5	then mcIcon = "Moon"		end
		if GetRaidTargetIndex("Target") == 6	then mcIcon = "Square"		end
		if GetRaidTargetIndex("Target") == 7	then mcIcon = "Cross"		end
		if GetRaidTargetIndex("Target") == 8	then mcIcon = "Skull"		end
		self:Sync(syncName.mc .. " ".. UnitName("Player") .. " " .. mcIcon)
	end
	if string.find(msg, L["trigger_mcFadeYou"]) then
		self:Sync(syncName.mcEnd .. " " .. UnitName("Player") .. " " .. mcIcon)
		self:Sync(syncName.mcLocked .. " " .. mcIcon)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.shout and self.db.profile.shout then
		self:Shout()
	
	elseif sync == syncName.mc and self.db.profile.mc then
		self:Mc(rest)
	elseif sync == syncName.mcEnd and self.db.profile.mc then
		self:McEnd(rest)
	elseif sync == syncName.mcLocked and self.db.profile.mc then
		self:McLocked(rest)
		
	elseif sync == syncName.unbalance and self.db.profile.unbalance then
		self:Unbalance()
	
	elseif sync == syncName.shieldwall and self.db.profile.shieldwall then
		self:Shieldwall()
	end
end

function module:Shout()
	self:CancelDelayedWarningSign(icon.shout)
	
	self:Message(L["msg_shout"], "Attention", false, nil, false)
	self:Sound("Alarm")
	self:Bar(L["bar_shout"], timer.shout, icon.shout, true, color.shout)
	self:DelayedWarningSign(timer.shout - 3, icon.shout, 0.7)
end

function module:Unbalance()
	self:Bar(L["bar_unbalance"], timer.unbalance, icon.unbalance, true, color.unbalance)
end

function module:Shieldwall()
	self:Bar(L["bar_shieldWall"], timer.shieldwall, icon.shieldwall, true, color.shieldwall)
	if UnitClass("Player") == BC["Priest"] then
		self:DelayedWarningSign(timer.shieldwall, icon.taunt, 0.7)
		self:DelayedSound(timer.shieldwall, "Info")
	end
end

function module:Mc(rest)
	self:Bar(rest..L["mc_bar"], timer.mc, icon.mc, true, color.mc)
end

function module:McEnd(rest)
	self:RemoveBar(rest..L["mc_bar"])
	if UnitClass("Player") == BC["Warrior"] then
		self:WarningSign(icon.taunt, 0.7)
		self:Sound("Info")
	end
end

function module:McLocked(rest)
	self:Bar(L["mcLocked_bar"]..rest, timer.mcLocked, icon.mcLocked, true, color.mcLocked)
end
