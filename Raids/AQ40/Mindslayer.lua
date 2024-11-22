
local module, L = BigWigs:ModuleDeclaration("Qiraji Mindslayer", "Ahn'Qiraj")
local BC = AceLibrary("Babble-Class-2.2")
local bbqirajibrainwasher = AceLibrary("Babble-Boss-2.2")["Qiraji Brainwasher"]
local bbtheprophetskeram = AceLibrary("Babble-Boss-2.2")["The Prophet Skeram"]

module.revision = 30075
module.enabletrigger = module.translatedName
module.toggleoptions = {"mc", "mindflay", "disorient"}
module.trashMod = true
module.defaultDB = {
	bosskill = nil,
}

L:RegisterTranslations("enUS", function() return {
    cmd = "Mindslayer",

    mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制出现时进行警告",

    mindflay_cmd = "mindflay",
    mindflay_name = "精神鞭笞警报",
    mindflay_desc = "精神鞭笞出现时进行警告",

    disorient_cmd = "disorient",
    disorient_name = "法力燃烧&迷惑警报",
    disorient_desc = "法力燃烧&迷惑出现时进行警告",


    trigger_mcYou = "You are afflicted by Cause Insanity.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_mcOther = "(.+) is afflicted by Cause Insanity.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    trigger_mcFade = "Cause Insanity fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mc = " 精神控制",
    msg_mc = "精神控制在 ",

    trigger_mindFlayYou = "You are afflicted by Mind Flay.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_mindFlayOther = "(.*) is afflicted by Mind Flay.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    trigger_mindFlayFade = "Mind Flay fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mindFlay = " 精神鞭笞",

    trigger_disorient = "afflicted by Mana Burn.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    bar_disorient = "法力燃烧&迷惑",
    msg_disorientSoon = "其拉斩灵者血量 < 20% HP - 即将出现30码范围法力燃烧&迷惑！",

    ["You have slain %s!"] = true,
    clickme = " >点击我！<",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Mindslayer",

    mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制出现时进行警告",

    mindflay_cmd = "mindflay",
    mindflay_name = "精神鞭笞警报",
    mindflay_desc = "精神鞭笞出现时进行警告",

    disorient_cmd = "disorient",
    disorient_name = "法力燃烧&迷惑警报",
    disorient_desc = "法力燃烧&迷惑出现时进行警告",


    trigger_mcYou = "You are afflicted by Cause Insanity.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_mcOther = "(.+) is afflicted by Cause Insanity.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    trigger_mcFade = "Cause Insanity fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mc = " 精神控制",
    msg_mc = "精神控制在 ",

    trigger_mindFlayYou = "You are afflicted by Mind Flay.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_mindFlayOther = "(.*) is afflicted by Mind Flay.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    trigger_mindFlayFade = "Mind Flay fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mindFlay = " 精神鞭笞",

    trigger_disorient = "afflicted by Mana Burn.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    bar_disorient = "法力燃烧&迷惑",
    msg_disorientSoon = "其拉斩灵者血量 < 20% HP - 即将出现30码范围法力燃烧&迷惑！",

    ["You have slain %s!"] = "你已经击败了%s！",
    clickme = " >点击我！<",
    you = "你",
} end )

local timer = {
	mc = 9.5,
	mindFlay = 8,
	disorient = 8,
}
local icon = {
	mc = "Spell_Shadow_Charm",
	mindFlay = "spell_shadow_siphonmana",
	disorient = "spell_shadow_manaburn",
}
local color = {
	mc = "Red",
	mindFlay = "Black",
	disorient = "Cyan",
}
local syncName = {
	mc = "MindslayerMC"..module.revision,
	mcFade = "MindslayerMCEnd"..module.revision,
	mindFlay = "MindslayerMindFlay"..module.revision,
	mindFlayFade = "MindslayerMindFlayEnd"..module.revision,
	disorient = "MindslayerDisorient"..module.revision,
	disorientSoon = "MindslayerDisorientSoon"..module.revision,
}

local disorientSoonCheck = nil

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event")
	
	self:RegisterEvent("UNIT_HEALTH")
	
	
	self:ThrottleSync(1, syncName.mc)
	self:ThrottleSync(1, syncName.mcFade)
	self:ThrottleSync(1, syncName.mindFlay)
	self:ThrottleSync(1, syncName.mindFlayFade)
	self:ThrottleSync(1, syncName.disorient)
	self:ThrottleSync(5, syncName.disorientSoon)
end

function module:OnSetup()
	self.started = nil
	
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
	if self.core:IsModuleActive(bbqirajibrainwasher, "Ahn'Qiraj") then self.core:DisableModule(bbqirajibrainwasher, "Ahn'Qiraj") end
	if self.core:IsModuleActive(bbtheprophetskeram, "Ahn'Qiraj") then self.core:DisableModule(bbtheprophetskeram, "Ahn'Qiraj") end
	
	disorientSoonCheck = true
end

function module:OnDisengage()
	disorientSoonCheck = true
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)
end

function module:CheckForBossDeath(msg)
	if msg == string.format(UNITDIESOTHER, self:ToString())
		or msg == string.format(L["You have slain %s!"], self.translatedName)
		or msg == string.format(L["You have slain %s!"], "Qiraji Champion") then
		local function IsBossInCombat()
			local t = module.enabletrigger
			if not t then return false end
			if type(t) == "string" then t = {t} end

			if UnitExists("Target") and UnitAffectingCombat("Target") then
				local target = UnitName("Target")
				for _, mob in pairs(t) do
					if target == mob then
						return true
					end
				end
			end

			local num = GetNumRaidMembers()
			for i = 1, num do
				local raidUnit = string.format("raid%starget", i)
				if UnitExists(raidUnit) and UnitAffectingCombat(raidUnit) then
					local target = UnitName(raidUnit)
					for _, mob in pairs(t) do
						if target == mob then
							return true
						end
					end
				end
			end
			return false
		end

		if not IsBossInCombat() then
			--self:SendBossDeathSync()
		end
	end
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == self.translatedName and disorientSoonCheck == true then
		local healthPct = UnitHealth(msg) * 100 / UnitHealthMax(msg)
		if healthPct < 20 then
			self:Sync(syncName.disorientSoon)
		end
	end
end

function module:Event(msg)
	if msg == L["trigger_mcYou"] then
		self:Sync(syncName.mc .. " " .. UnitName("player"))
	elseif string.find(msg, L["trigger_mcOther"]) then
		local _,_, mcPlayer, _ = string.find(msg, L["trigger_mcOther"])
		self:Sync(syncName.mc .. " " .. mcPlayer)
	elseif string.find(msg, L["trigger_mcFade"]) then
		local _,_, mcFadePlayer, _ = string.find(msg, L["trigger_mcFade"])
		if mcFadePlayer == L["you"] then mcFadePlayer = UnitName("Player") end
		self:Sync(syncName.mcFade .. " " .. mcFadePlayer)
	
	elseif msg == L["trigger_mindFlayYou"] then
		self:Sync(syncName.mindFlay .. " " .. UnitName("player"))
	elseif string.find(msg, L["trigger_mindFlayOther"]) then
		local _,_, mindFlayPlayer, _ = string.find(msg, L["trigger_mindFlayOther"])
		self:Sync(syncName.mindFlay .. " " .. mindFlayPlayer)
	elseif string.find(msg, L["trigger_mindFlayFade"]) then
		local _,_, mindFlayFadePlayer, _ = string.find(msg, L["trigger_mindFlayFade"])
		if mindFlayFadePlayer == L["you"] then mindFlayFadePlayer = UnitName("Player") end
		self:Sync(syncName.mindFlayFade .. " " .. mindFlayFadePlayer)

	elseif string.find(msg, L["trigger_disorient"]) then
		self:Sync(syncName.disorient)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.mc and rest and self.db.profile.mc then
		self:Mc(rest)
	elseif sync == syncName.mcFade and rest and self.db.profile.mc then
		self:McFade(rest)
		
	elseif sync == syncName.mindFlay and rest and self.db.profile.mindflay then
		self:MindFlay(rest)
	elseif sync == syncName.mindFlayFade and rest and self.db.profile.mindflay then
		self:MindFlayFade(rest)
		
	elseif sync == syncName.disorient and self.db.profile.disorient then
		self:Disorient()
	elseif sync == syncName.disorientSoon and self.db.profile.disorient then
		self:DisorientSoon()
	end
end


function module:Mc(rest)
	self:Bar(rest..L["bar_mc"]..L["clickme"], timer.mc, icon.mc, true, color.mc)
	self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_mc"].. L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)
	self:Message(L["msg_mc"]..rest, "Attention", false, nil, false)
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 4)
			end
		end
	end
	
	if UnitClass("Player") == BC["Mage"] then
		self:WarningSign(icon.mc, 1)
		self:Sound("Info")
	end
end

function module:McFade(rest)
	self:RemoveBar(rest..L["bar_mc"].. L["clickme"])
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTargetIcon("raid"..i, 0)
			end
		end
	end
end

function module:MindFlay(rest)
	self:Bar(rest..L["bar_mindFlay"], timer.mindFlay, icon.mindFlay, true, color.mindFlay)
end

function module:MindFlayFade(rest)
	self:RemoveBar(rest..L["bar_mindFlay"])
end

function module:Disorient()
	self:Bar(L["bar_disorient"], timer.disorient, icon.disorient, true, color.disorient)
end

function module:DisorientSoon()
	disorientSoonCheck = nil
	
	self:Message(L["msg_disorientSoon"], "Urgent", false, nil, false)
	self:ScheduleEvent("EnableDisorientSoonCheck", self.EnableDisorientSoonCheck, 5, self)
end

function module:EnableDisorientSoonCheck()
	disorientSoonCheck = true
end
