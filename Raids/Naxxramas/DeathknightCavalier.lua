
local module, L = BigWigs:ModuleDeclaration("Deathknight Cavalier", "Naxxramas")
local bbdeathknightcavalier = AceLibrary("Babble-Boss-2.2")["Deathknight Cavalier"]
local bbdeathlord = AceLibrary("Babble-Boss-2.2")["Death Lord"]

module.revision = 30067
module.enabletrigger = {bbdeathknightcavalier, bbdeathlord}
module.toggleoptions = {"deathcoil"}
module.trashMod = true
module.defaultDB = {
	bosskill = nil,
}

L:RegisterTranslations("enUS", function() return {
	cmd = "DeathknightCavalier",

	deathcoil_cmd = "deathcoil",
    deathcoil_name = "死亡缠绕警报",
    deathcoil_desc = "死亡缠绕出现时进行警告",
	
	
	trigger_deathCoilYou = "You are afflicted by Death Coil.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_deathCoilOther = "(.+) is afflicted by Death Coil.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_deathCoilFade = "Death Coil fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_PARTY_OTHER // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_deathCoil = " 死亡缠绕",

    ["You have slain %s!"] = true,
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "DeathknightCavalier",

    deathcoil_cmd = "deathcoil",
    deathcoil_name = "死亡缠绕警报",
    deathcoil_desc = "死亡缠绕出现时进行警告",
    
    
    trigger_deathCoilYou = "你受到了死亡缠绕效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_deathCoilOther = "(.+)受到了死亡缠绕效果的影响。", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_deathCoilFade = "死亡缠绕效果从(.+)身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_PARTY_OTHER // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_deathCoil = " 死亡缠绕",

    ["You have slain %s!"] = "你杀死了%s！",
    you = "你",
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	deathCoil = 3,
}
local icon = {
	deathCoil = "spell_shadow_deathcoil",
}
local color = {
	deathCoil = "Black",
}
local syncName = {
	deathCoil = "DeathknightCavalierDeathCoil"..module.revision,
	deathCoilFade = "DeathknightCavalierDeathCoilFade"..module.revision,
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_deathCoilYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_deathCoilOther
	self:RegisterEvent("CHAT_MSG_CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_deathCoilOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_deathCoilFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_PARTY_OTHER", "Event") --trigger_deathCoilFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_deathCoilFade
	
	self:ThrottleSync(0.1, syncName.deathCoil)
	self:ThrottleSync(0.1, syncName.deathCoilFade)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:CheckForBossDeath(msg)
	if msg == string.format(UNITDIESOTHER, self:ToString())
		or msg == string.format(L["You have slain %s!"], bbdeathknightcavalier)
		or msg == string.format(L["You have slain %s!"], bbdeathlord) then
		local function IsBossInCombat()
			local t = module.enabletrigger
			if not t then return false end
			if type(t) == "string" then t = {t} end

			if UnitExists("target") and UnitAffectingCombat("target") then
				local target = UnitName("target")
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
			self:SendBossDeathSync()
		end
	end
end

function module:Event(msg)
	if msg == L["trigger_deathCoilYou"] then
		self:Sync(syncName.deathCoil .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_deathCoilOther"]) then
		local _,_, deathCoilPlayer, _ = string.find(msg, L["trigger_deathCoilOther"])
		self:Sync(syncName.deathCoil .. " " .. deathCoilPlayer)
	
	elseif string.find(msg, L["trigger_deathCoilFade"]) then
		local _,_, deathCoilFadePlayer, _ = string.find(msg, L["trigger_deathCoilFade"])
		if deathCoilFadePlayer == L["you"] then deathCoilFadePlayer = UnitName("Player") end
		self:Sync(syncName.deathCoilFade .. " " .. deathCoilFadePlayer)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.deathCoil and rest and self.db.profile.deathcoil then
		self:DeathCoil(rest)
	elseif sync == syncName.deathCoilFade and rest and self.db.profile.deathcoil then
		self:DeathCoilFade(rest)
	end
end


function module:DeathCoil(rest)
	self:Bar(rest..L["bar_deathCoil"], timer.deathCoil, icon.deathCoil, true, color.deathCoil)
end

function module:DeathCoilFade(rest)
	self:RemoveBar(rest..L["bar_deathCoil"])
end
