local module, L = BigWigs:ModuleDeclaration("Echo of Medivh", "Karazhan")

-- module variables
module.revision = 30001
module.enabletrigger = module.translatedName
module.toggleoptions = { "corruption", "doom", "cancelrestopot", "corruptionmark", "corruptionyell", "bosskill" }
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Tower of Karazhan"],
	AceLibrary("Babble-Zone-2.2")["Tower of Karazhan"],
}

-- module defaults
module.defaultDB = {
	corruption = true,
	doom = true,
	cancelrestopot = true,
	corruptionmark = true,
	corruptionyell = true,
}

-- localization
L:RegisterTranslations("enUS", function()
	return {
		cmd = "EchoMedivh",

		corruption_cmd = "corruption",
		corruption_name = "Corruption of Medivh Alert",
		corruption_desc = "Warns when players are afflicted by Corruption of Medivh",

		doom_cmd = "doom",
		doom_name = "Doom of Medivh Alert",
		doom_desc = "Shows timer for Doom of Medivh stacks",

		cancelrestopot_cmd = "cancelrestopot",
		cancelrestopot_name = "Auto-Cancel Restoration Potion",
		cancelrestopot_desc = "Automatically cancels your Restoration Potion when Doom of Medivh fades",

		corruptionmark_cmd = "corruptionmark",
		corruptionmark_name = "Corruption Raid Mark",
		corruptionmark_desc = "Marks players with Corruption of Medivh and restores previous mark when it fades",

		corruptionyell_cmd = "corruptionyell",
		corruptionyell_name = "Corruption Chat Message",
		corruptionyell_desc = "Makes corrupted players say a warning in chat",

		trigger_corruptionYou = "You are afflicted by Corruption of Medivh",
		trigger_corruptionOther = "(.+) is afflicted by Corruption of Medivh",
		trigger_corruptionFade = "Corruption of Medivh fades from you",
		trigger_corruptionFadeOther = "Corruption of Medivh fades from (.+)",

		trigger_doomYou = "You are afflicted by Doom of Medivh %((%d+)%)",
		trigger_doomFade = "Doom of Medivh fades from",

		msg_corruptionYou = "YOU have Corruption! Get away from others!",
		msg_corruptionOther = "%s has Corruption! Get away from others!",

		warning_corruptedGetAway = "CORRUPTED, GET AWAY",
		yell_corruption = "I am corrupted! STAY AWAY!",

		bar_corruption = "Corruption of Medivh",
		bar_doom = "Doom of Medivh (%d)",

		resto_pot_cancelling = "Cancelling Resto Pot since Doom was removed",
	}
end)

L:RegisterTranslations("zhCN", function()
	return {
		cmd = "EchoMedivh",

		corruption_cmd = "corruption",
		corruption_name = "麦迪文的腐化警报",
		corruption_desc = "当玩家受到麦迪文的腐化影响时发出警告",

		doom_cmd = "doom",
		doom_name = "麦迪文的灾祸警报",
		doom_desc = "显示麦迪文的灾祸层数的计时器",

		cancelrestopot_cmd = "cancelrestopot",
		cancelrestopot_name = "自动取消滋补药剂",
		cancelrestopot_desc = "当麦迪文的灾祸效果消失时，自动取消你的滋补药剂效果",

		corruptionmark_cmd = "corruptionmark",
		corruptionmark_name = "腐化团队标记",
		corruptionmark_desc = "标记受到麦迪文的腐化的玩家，并在腐化效果消失时恢复之前的标记",

		corruptionyell_cmd = "corruptionyell",
		corruptionyell_name = "腐化聊天消息",
		corruptionyell_desc = "让受腐化的玩家在聊天频道发出警告",

		trigger_corruptionYou = "你受到了麦迪文的腐化效果的影响",
		trigger_corruptionOther = "(.+)受到了麦迪文的腐化效果的影响",
		trigger_corruptionFade = "麦迪文的腐化效果从你身上消失了",
		trigger_corruptionFadeOther = "麦迪文的腐化效果从(.+)身上消失了",

		trigger_doomYou = "你受到了麦迪文的灾祸效果的影响%（(%d+)%）",
		trigger_doomFade = "麦迪文的灾祸效果从",

		msg_corruptionYou = "你中了腐化！远离其他人！",
		msg_corruptionOther = "%s中了腐化！远离其他人！",

		warning_corruptedGetAway = "已被腐化，快躲开",
		yell_corruption = "我被腐化了！离我远点！",

		bar_corruption = "麦迪文的腐化",
		bar_doom = "麦迪文的腐化(%d)",

		resto_pot_cancelling = "由于灾祸效果已移除，正在取消滋补效果",
	}
end)

-- timer and icon variables
local timer = {
	corruption = 12, -- duration of corruption debuff
	doomMin = 14, -- minimum time between Doom stacks
	doomMax = 24, -- maximum time between Doom stacks
}

local icon = {
	corruption = "INV_Misc_ShadowEgg", -- icon for corruption
	doom = "Spell_Nature_Drowsy", -- icon for doom
}

local syncName = {
	corruption = "EchoMedivhCorruption" .. module.revision,
}

local maxCorruptedPlayers = 10
local doomStackCount = 0
local playerMarks = {}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "AfflictionEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "AfflictionEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
end

function module:OnSetup()
	self.started = nil
	doomStackCount = 0
	playerMarks = {}
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:AfflictionEvent(msg)
	-- Corruption of Medivh
	if string.find(msg, L["trigger_corruptionYou"]) then
		self:Sync(syncName.corruption .. " " .. UnitName("player"))
	else
		local _, _, player = string.find(msg, L["trigger_corruptionOther"])
		if player then
			self:Sync(syncName.corruption .. " " .. player)
		end
	end

	-- Doom of Medivh
	local _, _, count = string.find(msg, L["trigger_doomYou"])
	if count then
		self:DoomOfMedivh(tonumber(count))
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["trigger_corruptionFade"]) then
		self:RemoveBar(L["bar_corruption"])
	end

	if string.find(msg, L["trigger_doomFade"]) then
		self:RemoveBar(string.format(L["bar_doom"], doomStackCount))
		doomStackCount = 0

		-- Auto-cancel restoration potion if enabled
		if self.db.profile.cancelrestopot then
			self:CancelAura(11359) -- Restoration Potion
		end
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	local _, _, player = string.find(msg, L["trigger_corruptionFadeOther"])
	if player then
		self:CorruptionFade(player)
	end
end

function module:OnFriendlyDeath(msg)
	-- Remove raid marker when a player dies
	local _, _, player = string.find(msg, "(.+)死亡了。")
	if player then
		self:CorruptionFade(player)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.corruption and rest then
		self:CorruptionOfMedivh(rest)
	elseif sync == syncName.corruptionFade and rest then
		self:CorruptionFade(rest)
	end
end

function module:CorruptionOfMedivh(player)
	if self.db.profile.corruption then
		if player == UnitName("player") then
			self:Message(L["msg_corruptionYou"], "Important", true, "Alarm")
			self:WarningSign(icon.corruption, 5, true, L["warning_corruptedGetAway"])
			self:Bar(L["bar_corruption"], timer.corruption, icon.corruption)

			-- Yell in chat if enabled
			if self.db.profile.corruptionyell then
				SendChatMessage(L["yell_corruption"], "SAY")
			end
		else
			self:Message(string.format(L["msg_corruptionOther"], player), "Important")
		end
	end

	-- Set raid mark if enabled
	if self.db.profile.corruptionmark then
		self:SetCorruptionMark(player)
	end
end

function module:CorruptionFade(player)
	-- Restore previous raid mark if enabled
	if self.db.profile.corruptionmark then
		self:RestoreMark(player)
	end
end

function module:SetCorruptionMark(player)
	local markToUse = self:GetAvailableRaidMark()
	if markToUse then
		self:SetRaidTargetForPlayer(player, markToUse)
	end
end

function module:RestoreMark(player)
	self:RestorePreviousRaidTargetForPlayer(player)
end

function module:DoomOfMedivh(count)
	if not self.db.profile.doom then
		return
	end

	doomStackCount = count

	-- Remove existing bar
	self:RemoveBar(string.format(L["bar_doom"], count - 1))

	-- Create new bar with appropriate color
	local barColor = "white" -- Default color
	if count >= 4 then
		barColor = "red"
	elseif count >= 3 then
		barColor = "yellow"
	end

	self:IntervalBar(string.format(L["bar_doom"], count), timer.doomMin, timer.doomMax, icon.doom, true, barColor)
end

function module:CancelAura(spellId)
	local i = 0
	while true do
		local buffIndex = GetPlayerBuff(i, "HELPFUL")
		i = i + 1
		if buffIndex == -1 then
			break
		end
		local buffId = GetPlayerBuffID(buffIndex)
		buffId = (buffId < -1) and (buffId + 65536) or buffId
		if buffId == spellId then
			self:Message(L["resto_pot_cancelling"], "Positive")
			CancelPlayerBuff(buffIndex)
			break
		end
	end
end

function module:Test()
	-- Initialize module state
	self:OnSetup()
	self:Engage()

	local events = {
		-- Corruption events
		{ time = 1, func = function()
			local member = UnitName("player")
			print("Test: " .. member .. " is afflicted by Corruption of Medivh")
			module:AfflictionEvent("You are afflicted by Corruption of Medivh")
		end },

		{ time = 3, func = function()
			local member = UnitName("raid1") or "Player1"
			print("Test: " .. member .. " is afflicted by Corruption of Medivh")
			module:AfflictionEvent(member .. " is afflicted by Corruption of Medivh")
		end },

		{ time = 5, func = function()
			local member = UnitName("raid2") or "Player2"
			print("Test: " .. member .. " is afflicted by Corruption of Medivh")
			module:AfflictionEvent(member .. " is afflicted by Corruption of Medivh")
		end },

		-- Doom events for self
		{ time = 10, func = function()
			print("Test: You are afflicted by Doom of Medivh (1)")
			module:AfflictionEvent("You are afflicted by Doom of Medivh (1)")
		end },

		{ time = 15, func = function()
			print("Test: You are afflicted by Doom of Medivh (2)")
			module:AfflictionEvent("You are afflicted by Doom of Medivh (2)")
		end },

		-- Corruptions start to fade
		{ time = 17, func = function()
			local member = UnitName("raid1") or "Player1"
			print("Test: Corruption of Medivh fades from " .. member)
			module:CHAT_MSG_SPELL_AURA_GONE_OTHER("Corruption of Medivh fades from " .. member)
		end },

		{ time = 18, func = function()
			local member = UnitName("raid2") or "Player2"
			print("Test: Corruption of Medivh fades from " .. member)
			module:CHAT_MSG_SPELL_AURA_GONE_OTHER("Corruption of Medivh fades from " .. member)
		end },

		{ time = 20, func = function()
			print("Test: You are afflicted by Doom of Medivh (3)")
			module:AfflictionEvent("You are afflicted by Doom of Medivh (3)")
		end },

		-- New corruption wave
		{ time = 21, func = function()
			local member = UnitName("raid3") or "Player3"
			print("Test: " .. member .. " is afflicted by Corruption of Medivh")
			module:AfflictionEvent(member .. " is afflicted by Corruption of Medivh")
		end },

		{ time = 25, func = function()
			print("Test: You are afflicted by Doom of Medivh (4)")
			module:AfflictionEvent("You are afflicted by Doom of Medivh (4)")
		end },

		-- Player corruption fades
		{ time = 28, func = function()
			print("Test: Corruption fades from you")
			module:CHAT_MSG_SPELL_AURA_GONE_SELF("Corruption of Medivh fades from you")
		end },

		-- Last corruption fades
		{ time = 33, func = function()
			local member = UnitName("raid3") or "Player3"
			print("Test: Corruption of Medivh fades from " .. member)
			module:CHAT_MSG_SPELL_AURA_GONE_OTHER("Corruption of Medivh fades from " .. member)
		end },

		-- Doom fades
		{ time = 35, func = function()
			print("Test: Doom fades from you")
			module:CHAT_MSG_SPELL_AURA_GONE_SELF("Doom of Medivh fades from")
		end },

		-- Test player death with corruption
		{ time = 37, func = function()
			local member = UnitName("raid4") or "Player4"
			print("Test: " .. member .. " is afflicted by Corruption of Medivh")
			module:AfflictionEvent(member .. " is afflicted by Corruption of Medivh")

			print("Test: " .. member .. " dies")
			module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(member .. " dies")
		end },

		-- Disengage
		{ time = 40, func = function()
			print("Test: Disengage")
			module:Disengage()
		end },
	}

	-- Schedule each event at its absolute time
	for i, event in ipairs(events) do
		self:ScheduleEvent("EchoMedivhTest" .. i, event.func, event.time)
	end

	self:Message("Echo of Medivh test started", "Positive")
	return true
end

-- Test command:
-- /run local m=BigWigs:GetModule("Echo of Medivh"); BigWigs:SetupModule("Echo of Medivh");m:Test();
