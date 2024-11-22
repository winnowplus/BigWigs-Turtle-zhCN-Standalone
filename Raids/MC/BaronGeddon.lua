
local module, L = BigWigs:ModuleDeclaration("Baron Geddon", "Molten Core")
local BC = AceLibrary("Babble-Class-2.2")
local bbbarongeddon = AceLibrary("Babble-Boss-2.2")["Baron Geddon"]

module.revision = 30075
module.enabletrigger = module.translatedName
module.toggleoptions = {"bomb", "inferno", "armageddon", "ignite", "icon", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Molten Core"],
	AceLibrary("Babble-Zone-2.2")["Molten Core"],
}

L:RegisterTranslations("enUS", function() return {
    cmd = "Baron",

    bomb_cmd = "bomb",
    bomb_name = "活化炸弹警报",
    bomb_desc = "活化炸弹出现时进行警告",

    inferno_cmd = "inferno",
    inferno_name = "地狱火警报",
    inferno_desc = "地狱火出现时进行警告",

    armageddon_cmd = "armageddon",
    armageddon_name = "末日决战警报",
    armageddon_desc = "末日决战出现时进行警告",

    ignite_cmd = "ignite",
    ignite_name = "点燃法力警报",
    ignite_desc = "点燃法力出现时进行警告",

    icon_cmd = "icon",
    icon_name = "炸弹目标团队图标",
    icon_desc = "在成为炸弹的玩家上标记团队图标。（需要助理或更高权限）",
	
	
	trigger_bombYou = "You are afflicted by Living Bomb.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_bombOther = "(.+) is afflicted by Living Bomb.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_bombFade = "Living Bomb fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_bomb = " 炸弹！",
    msg_bomb = " 是炸弹！",
	
	trigger_inferno = "Baron Geddon gains Inferno.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_infernoFade = "Inferno fades from Baron Geddon.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_infernoCd = "地狱火冷却",
    bar_infernoSoon = "即将地狱火...",
    bar_infernoChannel = "地狱火！",
	
	trigger_infernoYou = "Baron Geddon's Inferno hits you for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_infernoYou = "远离地狱火！",
	
	trigger_armageddon = "Baron Geddon is afflicted by Armageddon.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
    bar_armageddon = "末日决战！",
    msg_armageddon = "末日决战 - 杀死迦顿男爵！",
	
	trigger_ignite = "afflicted by Ignite Mana", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_ignite2 = "Ignite Mana was resisted", --CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_igniteCd = "点燃法力冷却",
    msg_ignite = "点燃法力 - 驱散！(仅限有法力值的职业)",
    you = "you",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Baron",

    bomb_cmd = "bomb",
    bomb_name = "活化炸弹警报",
    bomb_desc = "活化炸弹出现时进行警告",

    inferno_cmd = "inferno",
    inferno_name = "地狱火警报",
    inferno_desc = "地狱火出现时进行警告",

    armageddon_cmd = "armageddon",
    armageddon_name = "末日决战警报",
    armageddon_desc = "末日决战出现时进行警告",

    ignite_cmd = "ignite",
    ignite_name = "点燃法力警报",
    ignite_desc = "点燃法力出现时进行警告",

    icon_cmd = "icon",
    icon_name = "炸弹目标团队图标",
    icon_desc = "在成为炸弹的玩家上标记团队图标。（需要助理或更高权限）",
	
	
	trigger_bombYou = "你受到了活化炸弹效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_bombOther = "(.*)受到了活化炸弹效果的影响。", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_bombFade = "活化炸弹效果从(.*)身上消失。", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_bomb = " 炸弹！",
    msg_bomb = " 是炸弹！",
	
	trigger_inferno = "迦顿男爵获得了地狱火的效果。", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_infernoFade = "地狱火效果从迦顿男爵身上消失。", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_infernoCd = "地狱火冷却",
    bar_infernoSoon = "即将地狱火...",
    bar_infernoChannel = "地狱火！",
	
	trigger_infernoYou = "迦顿男爵的地狱火击中你造成", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_infernoYou = "远离地狱火！",
	
	trigger_armageddon = "Baron Geddon is afflicted by Armageddon.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
    bar_armageddon = "末日决战！",
    msg_armageddon = "末日决战 - 杀死迦顿男爵！",
	
	trigger_ignite = "受到了点燃法力效果的影响", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_ignite2 = "点燃法力被抵抗了", --CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_igniteCd = "点燃法力冷却",
    msg_ignite = "点燃法力 - 驱散！(仅限有法力值的职业)",
    you = "你",
} end)

local timer = {
	bomb = 8,
	
	infernoFirstCd = 18, --{18,24}, saw 21, 23.679
	infernoFirstSoon = 6,
	infernoChannel = 8,
	infernoCd = 10, --{10,16}, saw 11.766, 13.2
	infernoSoon = 6,
	
	
	armageddon = 8,
	
	firstIgniteCd = {10,15}, --saw 12.918
	igniteCd = {20,30}, --saw 27.381
}
local icon = {
	bomb = "inv_enchant_essenceastralsmall",
	inferno = "Spell_Fire_Incinerate",
	armageddon = "Spell_Fire_SelfDestruct",
	ignite = "Spell_Fire_Incinerate",
}
local color = {
	bomb = "Cyan",
	
	infernoCd = "Black",
	infernoSoon = "Orange",
	infernoChannel = "Red",
	
	armageddon = "White",
	ignite = "Blue",
}
local syncName = {
	bomb = "GeddonBomb"..module.revision,
	bombFade = "GeddonBombStop"..module.revision,
	
	inferno = "GeddonInferno"..module.revision,
	infernoFade = "GeddonInfernoFade"..module.revision,
	
	armageddon = "Geddonarmageddon"..module.revision,
	ignite = "Geddonignite"..module.revision,
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --Debug
		
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_bombYou, trigger_ignite
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_bombOther, trigger_ignite
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_bombOther, trigger_ignite
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_inferno
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_bombFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_bombFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_bombFade, trigger_infernoFade

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_infernoYou
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "Event") --trigger_armageddon
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_ignite2
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_ignite2


	self:ThrottleSync(5, syncName.bomb)
	self:ThrottleSync(3, syncName.bombFade)
	
	self:ThrottleSync(5, syncName.inferno)
	self:ThrottleSync(5, syncName.infernoFade)
	
	self:ThrottleSync(4, syncName.armageddon)
	self:ThrottleSync(4, syncName.ignite)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	if self.db.profile.inferno then
		self:Bar(L["bar_infernoCd"], timer.infernoFirstCd, icon.inferno, true, color.infernoCd)
		self:DelayedBar(timer.infernoFirstCd, L["bar_infernoSoon"], timer.infernoFirstSoon, icon.inferno, true, color.infernoSoon)
	end
	
	if self.db.profile.ignite then
		self:IntervalBar(L["bar_igniteCd"], timer.firstIgniteCd[1], timer.firstIgniteCd[2], icon.ignite, true, color.ignite)
	end
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_bombYou"] then
		self:Sync(syncName.bomb .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_bombOther"]) then
		local _,_, bombPlayer,_ = string.find(msg, L["trigger_bombOther"])
		self:Sync(syncName.bomb .. " " .. bombPlayer)
		
	elseif string.find(msg, L["trigger_bombFade"]) then
		local _,_, bombFadePlayer,_ = string.find(msg, L["trigger_bombFade"])
		if bombFadePlayer == L["you"] then bombFadePlayer = UnitName("Player") end
		self:Sync(syncName.bombFade .. " " .. bombFadePlayer)
		
		
	elseif msg == L["trigger_inferno"] then
		self:Sync(syncName.inferno)
	
	elseif msg == L["trigger_infernoFade"] then
		self:Sync(syncName.infernoFade)
	
	elseif string.find(msg, L["trigger_infernoYou"]) and self.db.profile.inferno then
		self:InfernoYou()
		
	elseif msg == L["trigger_armageddon"] then
		self:Sync(syncName.armageddon)
		
	elseif string.find(msg, L["trigger_ignite"]) or string.find(msg, L["trigger_ignite2"]) then
		self:Sync(syncName.ignite)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.bomb and rest and self.db.profile.bomb then
		self:Bomb(rest)
	elseif sync == syncName.bombFade and rest and self.db.profile.bomb then
		self:BombFade(rest)
	
	elseif sync == syncName.inferno and self.db.profile.inferno then
		self:Inferno()
	elseif sync == syncName.infernoFade and self.db.profile.inferno then
		self:InfernoFade()
	
	elseif sync == syncName.armageddon and self.db.profile.armageddon then
		self:Armageddon()
	
	elseif sync == syncName.ignite and self.db.profile.ignite then
		self:Ignite()
	end
end


function module:Bomb(rest)
	self:Bar(rest..L["bar_bomb"], timer.bomb, icon.bomb, true, color.bomb)
	self:Message(rest..L["msg_bomb"], "Urgent", false, nil, false)
	
	if rest == UnitName("Player") then
		SendChatMessage(UnitName("Player").." 是炸弹！","SAY")
		self:WarningSign(icon.bomb, timer.bomb)
		self:Sound("RunAway")
	end
	
	if self.db.profile.icon and (IsRaidLeader() or IsRaidOfficer()) then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 8)
			end
		end
	end
end

function module:BombFade(rest)
	self:RemoveBar(rest..L["bar_bomb"])
	
	if self.db.profile.icon and (IsRaidLeader() or IsRaidOfficer()) then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 0)
			end
		end
	end
end

function module:Inferno()
	self:RemoveBar(L["bar_infernoCd"])
	self:CancelDelayedBar(L["bar_infernoSoon"])
	self:RemoveBar(L["bar_infernoSoon"])
	
	self:Bar(L["bar_infernoChannel"], timer.infernoChannel, icon.inferno, true, color.infernoChannel)
end

function module:InfernoFade()
	self:RemoveBar(L["bar_infernoChannel"])
	
	self:Bar(L["bar_infernoCd"], timer.infernoCd, icon.inferno, true, color.infernoCd)
	self:DelayedBar(timer.infernoCd, L["bar_infernoSoon"], timer.infernoSoon, icon.inferno, true, color.infernoSoon)
end

function module:InfernoYou()
	if UnitName("Target") == bbbarongeddon and UnitName("TargetTarget") == UnitName("Player") then return end
	
	self:Message(L["msg_infernoYou"], "Personal", false, nil, false)
	self:Sound("Info")
	self:WarningSign(icon.inferno, 0.7)
end

function module:Armageddon()
	self:RemoveBar(L["bar_infernoCd"])
	self:CancelDelayedBar(L["bar_infernoSoon"])
	self:RemoveBar(L["bar_infernoSoon"])
	self:RemoveBar(L["bar_infernoChannel"])
	self:RemoveBar(L["bar_igniteCd"])
	
	self:Bar(L["bar_armageddon"], timer.armageddon, icon.armageddon, true, color.armageddon)
	self:Message(L["msg_armageddon"], "Important", false, nil, false)
	self:Sound("Beware")
end

function module:Ignite()
	self:IntervalBar(L["bar_igniteCd"], timer.igniteCd[1], timer.igniteCd[2], icon.ignite, true, color.ignite)

	if UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Priest"] then
		self:WarningSign(icon.ignite, 0.7)
		self:Sound("Info")
		self:Message(L["msg_ignite"], "Important", false, nil, false)
	end
end
