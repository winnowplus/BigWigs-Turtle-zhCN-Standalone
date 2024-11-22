
local module, L = BigWigs:ModuleDeclaration("Kurinnaxx", "Ruins of Ahn'Qiraj")

module.revision = 30069
module.enabletrigger = module.translatedName
module.toggleoptions = {"wound", "trap", "enrage", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Kurinnaxx",

    wound_cmd = "wound",
    wound_name = "重伤警报",
    wound_desc = "重伤出现时进行警告",

    trap_cmd = "trap",
    trap_name = "陷阱警报",
    trap_desc = "为每个中陷阱的玩家显示计时条",

    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",
    
    
    trigger_trap = "Sand Trap hits (.+) for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    msg_sandTrap = "沙尘陷阱",
    bar_trap = " 沙尘陷阱",
    
    trigger_woundYou = "You are afflicted by Mortal Wound %((.+)%).",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_woundOther = "(.+) is afflicted by Mortal Wound %((.+)%).",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    bar_wound = " 重伤",

    trigger_enrage = "Kurinnaxx gains Enrage.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrage = "库林纳克斯激怒了！",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Kurinnaxx",

    wound_cmd = "wound",
    wound_name = "重伤警报",
    wound_desc = "重伤出现时进行警告",

    trap_cmd = "trap",
    trap_name = "陷阱警报",
    trap_desc = "为每个中陷阱的玩家显示计时条",

    enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒出现时进行警告",
    
    
    trigger_trap = "流沙陷阱的沙漠陷阱击中(.+)造成", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    msg_sandTrap = "沙尘陷阱",
    bar_trap = " 沙尘陷阱",
    
    trigger_woundYou = "你受到了重伤效果的影响%（(.+)%）。",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_woundOther = "(.+)受到了重伤效果的影响%（(.+)%）。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
    bar_wound = " 重伤",

    trigger_enrage = "库林纳克斯获得了狂怒的效果。", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrage = "库林纳克斯激怒了！",
    you = "你",
} end )

local timer = {
	wound = 15,
	trap = 20,
}
local icon = {
	wound = "ability_criticalstrike",
	trap = "inv_misc_dust_02",
	enrage = "Spell_Shadow_UnholyFrenzy",
}
local color = {
	wound = "Black",
	trap = "White",
}
local syncName = {
	wound = "KurinaxxWound"..module.revision,
	trap = "KurinaxxTrap"..module.revision,
	enrage = "KurinaxxEnrage"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_trap
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_trap
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_trap
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_woundYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_woundOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_woundOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_enrage
	
	
	self:ThrottleSync(2, syncName.wound)
	self:ThrottleSync(0, syncName.trap)
	self:ThrottleSync(10, syncName.enrage)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:Event(msg)
	if string.find(msg, L["trigger_woundYou"]) then
		local _,_,woundQty,_ = string.find(msg, L["trigger_woundYou"])
		local woundPlayer = UnitName("Player")
		local woundPlayerAndWoundQty = woundPlayer .. " " .. woundQty
		self:Sync(syncName.wound.." "..woundPlayerAndWoundQty)
		
	elseif string.find(msg, L["trigger_woundOther"]) then
		local _,_,woundPlayer,woundQty = string.find(msg, L["trigger_woundOther"])
		local woundPlayerAndWoundQty = woundPlayer .. " " .. woundQty
		self:Sync(syncName.wound.." "..woundPlayerAndWoundQty)
	
	
	elseif string.find(msg, L["trigger_trap"]) then
		local _,_,trapPlayer = string.find(msg, L["trigger_trap"])
		if trapPlayer == L["you"] then trapPlayer = UnitName("Player") end
		self:Sync(syncName.trap.." "..trapPlayer)
	
	elseif msg == L["trigger_enrage"] then
		self:Sync(syncName.enrage)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wound and rest and self.db.profile.wound then
		self:Wound(rest)
	
	elseif sync == syncName.trap and rest and self.db.profile.trap then
		self:Trap(rest)
	
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
	end
end


function module:Wound(rest)
	local woundPlayer = strsub(rest,0,strfind(rest," ") - 1)
	local woundQty = tonumber(strsub(rest,strfind(rest," "),strlen(rest)))
	
	self:RemoveBar(woundPlayer.." ".."1"..L["bar_wound"])
	self:RemoveBar(woundPlayer.." ".."2"..L["bar_wound"])
	self:RemoveBar(woundPlayer.." ".."3"..L["bar_wound"])
	self:RemoveBar(woundPlayer.." ".."4"..L["bar_wound"])
	self:RemoveBar(woundPlayer.." ".."5"..L["bar_wound"])
	self:RemoveBar(woundPlayer.." ".."6"..L["bar_wound"])
	self:RemoveBar(woundPlayer.." ".."7"..L["bar_wound"])
	self:RemoveBar(woundPlayer.." ".."8"..L["bar_wound"])
	self:RemoveBar(woundPlayer.." ".."9"..L["bar_wound"])
	self:RemoveBar(woundPlayer.." ".."10"..L["bar_wound"])

	self:Bar(woundPlayer.." "..woundQty..L["bar_wound"], timer.wound, icon.wound, true, color.wound)
end

function module:Trap(rest)
	if rest == UnitName("Player") then
		self:Message(L["msg_sandTrap"], "Attention", false, nil, false)
		self:WarningSign(icon.trap, 0.7)
	end
	
	self:Bar(rest..L["bar_trap"], timer.trap, icon.trap)
end

function module:Enrage()
	self:Message(L["msg_enrage"], "Attention", false, nil, false)
	self:Sound("Alarm")
	self:WarningSign(icon.enrage, 0.7)
end
