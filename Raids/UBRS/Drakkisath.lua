local module, L = BigWigs:ModuleDeclaration("General Drakkisath", "Blackrock Spire")
local bbchromaticeliteguard = AceLibrary("Babble-Boss-2.2")["Chromatic Elite Guard"]

module.revision = 30025
module.enabletrigger = module.translatedName
module.toggleoptions = {"flamestrike", "conflag", "conflagproxy", "adds", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Blackrock Spire"],
	AceLibrary("Babble-Zone-2.2")["Blackrock Spire"],
}

--[[Testing stuff
/script SendAddonMessage("BigWigs","DrakkisathAddDead", "RAID", "Relar");
/script SendAddonMessage("BigWigs","MagmadarPanic"..20041, "RAID", "Relar");
/script SendAddonMessage("BigWigs","DrakkisathConflagged"..20059 .."_ Relar", "RAID", "Relar"); works with rest method
/script SendAddonMessage("BigWigs","FaerlinaDispel"..30010 .." Relar", "RAID", "Relar");
/script SendAddonMessage("BigWigs","DrakkisathConflagged"..20059 .."_Relar", "RAID", "Relar"); works with substring method
--]]

L:RegisterTranslations("enUS", function() return {
	cmd = "Drakkisath",
	
	flamestrike_cmd = "flamestrike",
    flamestrike_name = "烈焰风暴警报",
    flamestrike_desc = "当站在烈焰风暴范围时进行警告",
	
	conflag_cmd = "conflag",
    conflag_name = "燃烧警报",
    conflag_desc = "燃烧出现时进行警告",
	
	conflagproxy_cmd = "conflagproxy",
    conflagproxy_name = "附近燃烧伤害警报",
    conflagproxy_desc = "对附近友方造成的燃烧伤害进行警告",
	
	adds_cmd = "adds",
    adds_name = "已死亡增援计数",
    adds_desc = "通报死亡的多彩精英卫兵数量",
	
	
	
	trigger_conflagSelf = "You are afflicted by Conflagration.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_conflagOther = "(.+) is afflicted by Conflagration.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_conflagFade = "Conflagration fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_Other
    bar_conflag = " 燃烧",
    msg_conflag = " 燃烧",
	
	trigger_flamestrike = "You are afflicted by Flamestrike.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_flamestrikeFade = "Flamestrike fades from you.",--CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_flamestrike = "从烈焰风暴中离开！",
	
	trigger_conflagProxy = "Conflagration hits you for",--CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
    msg_conflagProxy = "远离附近燃烧的人，你这个傻瓜！！！",

    msg_addDead = "/2 增援死亡",
    msg_bringBossBack = "增援死了，把达基萨斯拉回来！",
    generaldrakkisathdies = "General Drakkisath dies.",
    you = "you",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Drakkisath",

    flamestrike_cmd = "flamestrike",
    flamestrike_name = "烈焰风暴警报",
    flamestrike_desc = "当站在烈焰风暴范围时进行警告",

    conflag_cmd = "conflag",
    conflag_name = "燃烧警报",
    conflag_desc = "燃烧出现时进行警告",

    conflagproxy_cmd = "conflagproxy",
    conflagproxy_name = "附近燃烧伤害警报",
    conflagproxy_desc = "对附近友方造成的燃烧伤害进行警告",

    adds_cmd = "adds",
    adds_name = "已死亡增援计数",
    adds_desc = "通报死亡的多彩精英卫兵数量",



    trigger_conflagSelf = "You are afflicted by Conflagration.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_conflagOther = "(.+) is afflicted by Conflagration.",--CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_conflagFade = "Conflagration fades from (.+).",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_Other
    bar_conflag = " 燃烧",
    msg_conflag = " 燃烧",

    trigger_flamestrike = "You are afflicted by Flamestrike.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_flamestrikeFade = "Flamestrike fades from you.",--CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_flamestrike = "从烈焰风暴中离开！",

    trigger_conflagProxy = "Conflagration hits you for",--CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
    msg_conflagProxy = "远离附近燃烧的人，你这个傻瓜！！！",

    msg_addDead = "/2 增援死亡",
    msg_bringBossBack = "增援死了，把达基萨斯拉回来！",
    generaldrakkisathdies = "达基萨斯将军已死。",
    you = "you",
} end)

local timer = {
	conflag = 10,
}
local icon = {
	flamestrike = "spell_fire_selfdestruct",
	conflag = "spell_fire_incinerate",
}
local color = {
	conflag = "Red",
}
local syncName = {
	conflag = "DrakkisathConflag"..module.revision,
	conflagFade = "DrakkisathConflagFade"..module.revision,
	addsDead = "DrakkisathAddsDead"..module.revision,
}

local bwDrakAddsDead = 0

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "Event")--conflagProxyTrigger
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--flamestrikeTrigger
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_conflagOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_conflagOther
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--flamestrikeEndTrigger, trigger_conflagFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_conflagFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_conflagFade
	
	self:ThrottleSync(0.5, syncName.addsDead)
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
	bwDrakAddsDead = 0
end

function module:OnDisengage()
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, bbchromaticeliteguard) then
		bwDrakAddsDead = bwDrakAddsDead + 1
		if self.db.profile.adds then
			self:Message(bwDrakAddsDead..L["msg_addDead"], "Important", false, nil, false)
		end
		if bwDrakAddsDead == 2 then
			self:Sync(syncName.addsDead)
		end
		
	elseif msg == L["generaldrakkisathdies"] then
		self:SendBossDeathSync()
	end
end

function module:Event(msg)
	if msg == L["trigger_flamestrike"] then
		self:Flamestrike()
	elseif msg == L["trigger_flamestrikeFade"] then
		self:FlamestrikeFade()
		
	elseif string.find(msg, L["trigger_conflagProxy"]) then
		self:ConflagProxy()
	
	
	elseif string.find(msg, L["trigger_conflagSelf"]) then
		self:Sync(syncName.conflag .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_conflagOther"]) then
		local _,_, conflagPlayer, _ = string.find(msg, L["trigger_conflagOther"])
		self:Sync(syncName.conflag .. " " .. conflagPlayer)
		
	elseif string.find(msg, L["trigger_conflagFade"]) then
		local _,_, conflagFadePlayer, _ = string.find(msg, L["trigger_conflagFade"])
		if conflagFadePlayer == L["you"] then conflagFadePlayer = UnitName("Player") end
		self:Sync(syncName.conflagFade .. " " .. conflagFadePlayer)
	
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.conflag and rest and self.db.profile.conflag then
		self:Conflag(rest)
	elseif sync == syncName.conflagFade and rest and self.db.profile.conflag then
		self:ConflagFade(rest)
	elseif sync == syncName.addsDead and self.db.profile.adds then
		self:AddsDead()
	end
end


function module:Flamestrike()
	self:WarningSign(icon.flamestrike, 10)
	self:Sound("Info")
	self:Message(L["msg_flamestrike"], "Urgent", false, nil, false)
end

function module:FlamestrikeFade()
	self:RemoveWarningSign(icon.flamestrike)
end

function module:ConflagProxy()
	self:WarningSign(icon.conflag, 0.7)
	self:Sound("Info")
	self:Message(L["msg_conflagProxy"], "Urgent", false, nil, false)
end

function module:Conflag(rest)
	self:Message(rest..L["msg_conflag"], "Important", false, nil, false)
	self:Sound("Beware")
	self:Bar(rest..L["bar_conflag"], timer.conflag, icon.conflag, true, color.conflag)
end

function module:ConflagFade(rest)
	self:RemoveBar(rest..L["bar_conflag"])
end

function module:AddsDead()
	self:Message(L["msg_bringBossBack"], "Important", false, nil, false)
end
