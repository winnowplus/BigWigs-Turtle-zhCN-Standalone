local module, L = BigWigs:ModuleDeclaration("King", "Karazhan")

-- module variables
module.revision = 30002
module.enabletrigger = module.translatedName
module.toggleoptions = { "subservience", "kingsfury", "charmingpresence", "decursebow", "marksubservience", "markmindcontrol", "throttlebow", "bosskill" }
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Tower of Karazhan"],
	AceLibrary("Babble-Zone-2.2")["Tower of Karazhan"],
}
module.wipemobs = { "Knight", "Bishop", "Rook" }

local _, playerClass = UnitClass("player")
local BC = AceLibrary("Babble-Class-2.2")
local BS = AceLibrary("Babble-Spell-2.2")

-- module defaults
module.defaultDB = {
	subservience = true,
	kingsfury = true,
	charmingpresence = playerClass == "SHAMAN",
	decursebow = playerClass == "MAGE" or playerClass == "DRUID",
	marksubservience = true,
	markmindcontrol = true,
	throttlebow = true,
}

-- localization
L:RegisterTranslations("enUS", function()
	return {
		cmd = "ChessEvent",

		subservience_cmd = "subservience",
		subservience_name = "Dark Subservience Alert",
		subservience_desc = "Warns when you are afflicted by Dark Subservience",

		kingsfury_cmd = "kingsfury",
		kingsfury_name = "King's Fury Alert",
		kingsfury_desc = "Warns when the King begins to cast King's Fury",

		charmingpresence_cmd = "charmingpresence",
		charmingpresence_name = "Charming Presence Timer",
		charmingpresence_desc = "Shows a timer for when the Queen will cast Charming Presence",

		decursebow_cmd = "decursebow",
		decursebow_name = "Decurse Reminder for Bowing Players",
		decursebow_desc = "Shows a notification with decurse button for players who need to bow",

		marksubservience_cmd = "marksubservience",
		marksubservience_name = "Mark Subservience Target",
		marksubservience_desc = "Marks players affected by Dark Subservience with Skull raid icon (requires assistant or leader)",

		throttlebow_cmd = "throttlebow",
		throttlebow_name = "Throttle /bow",
		throttlebow_desc = "Throttle the Visual Display of other people's /bow",

		markmindcontrol_cmd = "markmindcontrol",
		markmindcontrol_name = "Mark Mind Controlled Target",
		markmindcontrol_desc = "Marks players affected by King's Curse with X raid icon (requires assistant or leader)",

		trigger_subservienceYou = "You are afflicted by Dark Subservience",
		trigger_subservienceOther = "(.+) is afflicted by Dark Subservience",
		trigger_subservienceFade = "Dark Subservience fades from (.+)",
		trigger_subservienceFailed = "Dark Subservience fails. Grounding Totem",

		trigger_kingscurseYou = "You are afflicted by King's Curse",
		trigger_kingscurseOther = "(.+) is afflicted by King's Curse",
		trigger_kingscurseFade = "King's Curse fades from (.+)",

		trigger_charmingPresenceYou = "You are afflicted by Charming Presence",
		trigger_charmingPresenceOther = "(.+) is afflicted by Charming Presence",
		trigger_charmingPresenceFade = "Charming Presence fades from (.+)",

		trigger_kingCastFury = "King begins to cast King(.+)Fury", -- they used special character apostrophe for this and queen's Fury

		msg_subservienceYou = "YOU need to go Bow to the Queen!",
		msg_subservienceOther = "%s needs to go Bow!",
		msg_queenCastingSubservience = "Queen began casting on %s!",
		msg_queenSubservienceTotem = "Totem ate cast instead of %s!",
		msg_kingCastFury = "King begins to cast King's Fury!",

		warning_bow = "BOW TO THE QUEEN!",

		bar_subservience = "Go right in front of Queen and Bow! >Click Me<",
		bar_kingsfury = "King's Fury - Hide!",
		bar_charmingpresence = "Next Charming Presence",
		bar_decursebow = "Decurse %s >Click Me<",
	}
end)

L:RegisterTranslations("zhCN", function()
	return {
		cmd = "ChessEvent",

		subservience_cmd = "subservience",
		subservience_name = "黑暗屈从警报",
		subservience_desc = "当你受到黑暗屈从影响时发出警告",

		kingsfury_cmd = "kingsfury",
		kingsfury_name = "国王之怒警报",
		kingsfury_desc = "当国王开始施放国王之怒时发出警告",

		charmingpresence_cmd = "charmingpresence",
		charmingpresence_name = "魅惑之心计时器",
		charmingpresence_desc = "显示皇后即将施放魅惑之心的计时器",

		decursebow_cmd = "decursebow",
		decursebow_name = "鞠躬玩家的解诅咒提醒",
		decursebow_desc = "为需要鞠躬的玩家显示带有解诅咒按钮的通知",

		marksubservience_cmd = "marksubservience",
		marksubservience_name = "标记被屈从的目标",
		marksubservience_desc = "用骷髅标记受黑暗屈从影响的玩家（需要助理或团长权限）",

		throttlebow_cmd = "throttlebow",
		throttlebow_name = "限制 /bow 动作显示",
		throttlebow_desc = "限制其他人 /bow 动作的视觉显示",

		markmindcontrol_cmd = "markmindcontrol",
		markmindcontrol_name = "标记被控制目标",
		markmindcontrol_desc = "用X团队图标标记受国王诅咒影响的玩家（需要助理或领袖权限）",

		trigger_subservienceYou = "你受到了黑暗屈从效果的影响",
		trigger_subservienceOther = "(.+)受到了黑暗屈从效果的影响",
		trigger_subservienceFade = "黑暗屈从效果从(.+)身上消失了",
		trigger_subservienceFailed = "黑暗屈从施放失败。根基图腾生效",

		trigger_kingscurseYou = "你受到了国王的诅咒效果的影响",
		trigger_kingscurseOther = "(.+)受到了国王的诅咒效果的影响",
		trigger_kingscurseFade = "国王的诅咒效果从(.+)身上消失了",

		trigger_charmingPresenceYou = "你受到了魅惑之心效果的影响",
		trigger_charmingPresenceOther = "(.+)受到了魅惑之心效果的影响",
		trigger_charmingPresenceFade = "魅惑之心效果从(.+)身上消失了",

		trigger_kingCastFury = "国王开始施放国王之怒", -- 这里国王和女王的“之怒”用了特殊的撇号字符

		msg_subservienceYou = "快去向皇后鞠躬！",
		msg_subservienceOther = "%s需要去鞠躬！",
		msg_queenCastingSubservience = "皇后开始对 %s 施放技能！",
		msg_queenSubservienceTotem = "图腾挡掉了对 %s 的技能施放！",
		msg_kingCastFury = "国王开始施放国王之怒！",

		warning_bow = "向皇后鞠躬！",

		bar_subservience = "靠近皇后>点击我<鞠躬！",
		bar_kingsfury = "国王之怒 - 找地方躲！",
		bar_charmingpresence = "下一次魅惑之心",
		bar_decursebow = "快帮 %s 解诅咒!!!",
	}
end)

-- timer and icon variables
local timer = {
	subservience = 8, -- duration of subservience debuff
	kingsfury = 4, -- duration of king's fury cast
	charmingpresence = 12, -- queen casts every 12 seconds
	throttlebow = 1.5, -- bow throttle rate
}

local icon = {
	subservience = "Spell_BrokenHeart", -- icon for subservience
	kingsfury = "Spell_Holy_HolyNova", -- icon for king's fury
	charmingpresence = "Spell_Shadow_ShadowWordDominate", -- icon for charming presence
	kingscurse = "Spell_Shadow_GrimWard", -- icon for King's curse
}

local kingsCurseTexture = "Interface\\Icons\\Spell_Shadow_GrimWard"

local syncName = {
	subservience = "ChessSubservience" .. module.revision,
	queenCastingSubservience = "ChessQueenCastingSubservience" .. module.revision,
	kingCastFury = "ChessKingCastFury" .. module.revision,
	subservienceFailed = "ChessSubservienceFailed" .. module.revision,
	charmingPresence = "ChessCharmingPresence" .. module.revision,
}

local spellIds = {
	subservience = 41647, -- Dark Subservience
	charmingpresence = 41644,
	kingscurse = 41635,
}

-- Track players afflicted with King's Curse
local bowed = {}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "AfflictionEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "AfflictionEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "AfflictionEvent")

	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "FadesEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "FadesEvent")

	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "CastEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "CastEvent")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "CastEvent")

	-- install wrapper exactly once
	if not self.origChatFrameOnEvent and self.db.profile.throttlebow then
		self.origChatFrameOnEvent = ChatFrame_OnEvent

		ChatFrame_OnEvent = function(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
			local msg, who = arg1, arg2
			-- only throttle OTHER players’ /bow emote when we’re engaged
			if self.engaged and event == "CHAT_MSG_TEXT_EMOTE" and who ~= UnitName("player") and string.find(msg, "^.- bow") then
				local now = GetTime()
				if not bowed[who] or now - bowed[who] >= timer.throttlebow then
					bowed[who] = now
					self.origChatFrameOnEvent(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
				end
			else
				-- everything else goes through as normal
				self.origChatFrameOnEvent(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
			end
		end
	end

	if SUPERWOW_VERSION then
		self:RegisterCastEventsForUnitName("Queen", "QueenCastEvent")
	end

	self:ThrottleSync(1, syncName.subservience)
	self:ThrottleSync(2, syncName.queenCastingSubservience)
	self:ThrottleSync(2, syncName.kingCastFury)
	self:ThrottleSync(2, syncName.subservienceFailed)
	self:ThrottleSync(2, syncName.charmingPresence)
end

function module:OnSetup()
	self.started = nil
end

function module:OnDisable()
	if self.origChatFrameOnEvent and self.db.profile.throttlebow then
		-- remove the wrapper
		ChatFrame_OnEvent = self.origChatFrameOnEvent
		self.origChatFrameOnEvent = nil
	end
end

function module:OnEngage()
	bowed = {}

	self.queenTarget = ""
end

function module:OnDisengage()
end

function module:QueenCastEvent(casterGuid, targetGuid, eventType, spellId, castTime)
	if spellId == spellIds.subservience and eventType == "START" then
		self.queenTarget = UnitName(targetGuid) or ""
		self:Sync(syncName.queenCastingSubservience .. " " .. self.queenTarget)
	elseif spellId == spellIds.charmingpresence and eventType == "CAST" then
		self:Sync(syncName.charmingPresence)
	end
end

function module:CastEvent(msg)
	if self.db.profile.subservience and string.find(msg, L["trigger_subservienceFailed"]) and self.queenTarget ~= "" then
		self:Sync(syncName.subservienceFailed .. " " .. self.queenTarget)
	elseif string.find(msg, L["trigger_kingCastFury"]) then
		self:Sync(syncName.kingCastFury)
	end
end

function module:AfflictionEvent(msg)
	-- Dark Subservience
	if string.find(msg, L["trigger_subservienceYou"]) then
		self:Sync(syncName.subservience .. " " .. UnitName("player"))
		return
	else
		local _, _, player = string.find(msg, L["trigger_subservienceOther"])
		if player then
			self:Sync(syncName.subservience .. " " .. player)
			return
		end
	end

	-- Charming Presence
	local _, _, player = string.find(msg, L["trigger_charmingPresenceOther"])
	if player and self.db.profile.markmindcontrol then
		-- Mark the player with X raid target
		self:SetRaidTargetForPlayer(player, 7) -- X
		return
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["trigger_subservienceFade"]) then
		self:RemoveBar(L["bar_subservience"])

		if self.db.profile.marksubservience then
			self:RestorePreviousRaidTargetForPlayer(UnitName("player"))
		end
	elseif string.find(msg, L["trigger_kingscurseFade"]) then
		local player = UnitName("player")
		self:RemoveBar(string.format(L["bar_decursebow"], player))
	end
end

function module:FadesEvent(msg)
	local _, _, player = string.find(msg, L["trigger_kingscurseFade"])
	if player then
		self:RemoveBar(string.format(L["bar_decursebow"], player))
		return
	end

	_, _, player = string.find(msg, L["trigger_subservienceFade"])
	if player then
		if self.db.profile.marksubservience then
			self:RestorePreviousRaidTargetForPlayer(player)
		end
		self:RemoveBar(string.format(L["bar_decursebow"], player))
		return
	end

	_, _, player = string.find(msg, L["trigger_charmingPresenceFade"])
	if player then
		if self.db.profile.markmindcontrol then
			self:RestorePreviousRaidTargetForPlayer(player)
		end
		return
	end
end

function module:OnFriendlyDeath(msg)
	local _, _, player = string.find(msg, "(.+)死亡了")
	if player then
		-- Remove raid marks for players who die
		if self.db.profile.marksubservience or self.db.profile.markmindcontrol then
			self:RestorePreviousRaidTargetForPlayer(player)
		end

		self:RemoveBar(string.format(L["bar_decursebow"], player))
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.subservience and rest then
		self:Subservience(rest)
	elseif sync == syncName.queenCastingSubservience then
		self:QueenCastingSubservience(rest)
	elseif sync == syncName.kingCastFury then
		self:KingCastFury()
	elseif sync == syncName.subservienceFailed and rest then
		self:SubservienceFailed(rest)
	elseif sync == syncName.charmingPresence then
		if self.db.profile.charmingpresence then
			self:StartCharmingPresenceTimer()
		end
	end
end

function module:StartCharmingPresenceTimer()
	if not self.db.profile.charmingpresence then
		return
	end

	self:Bar(L["bar_charmingpresence"], timer.charmingpresence, icon.charmingpresence)
end

function module:QueenCastingSubservience(playerName)
	if not self.db.profile.subservience then
		return
	end
	self.queenTarget = playerName

	self:Message(string.format(L["msg_queenCastingSubservience"], playerName), "Attention", nil, "Info")
end

function module:SubservienceFailed(playerName)
	if not self.db.profile.subservience then
		return
	end

	self:Message(string.format(L["msg_queenSubservienceTotem"], playerName), "Positive")
end

function module:Subservience(player)
	if not self.db.profile.subservience then
		return
	end

	if player == UnitName("player") then
		self:Message(L["msg_subservienceYou"], "Important")
		self:WarningSign(icon.subservience, timer.subservience, true, L["warning_bow"])
		self:Bar(L["bar_subservience"], timer.subservience, icon.subservience)

		-- Set the bar to target Queen and bow when clicked
		self:SetCandyBarOnClick("BigWigsBar " .. L["bar_subservience"], function()
			TargetByName("皇后", true)
			DoEmote("bow")
		end)

		self:Sound("GoBow")
	else
		self:Message(string.format(L["msg_subservienceOther"], player), "Important")

		-- Check for King's Curse directly if decursebow is enabled
		if self.db.profile.decursebow then
			-- Find the player in raid
			local raidTarget = nil
			for i = 1, 40 do
				if UnitExists("raid" .. i) and UnitName("raid" .. i) == player then
					raidTarget = "raid" .. i
					break
				end
			end

			-- If found, check for King's Curse debuff
			if raidTarget then
				for i = 1, 16 do
					local texture = UnitDebuff(raidTarget, i)
					if texture then
						if texture == kingsCurseTexture then
							-- Player has King's Curse, show decurse reminder
							self:DecurseReminder(player, raidTarget)
							break
						end
					else
						break
					end
				end
			end
		end
	end

	if self.db.profile.marksubservience then
		self:SetRaidTargetForPlayer(player, 8) -- Skull
	end
end

function module:DecurseReminder(player, raidTarget)
	if not self.db.profile.decursebow then
		return
	end

	-- Create a bar with decurse functionality
	local barText = string.format(L["bar_decursebow"], player)
	self:Bar(barText, timer.subservience, icon.kingscurse)

	-- Set the bar to target player and cast Remove Curse when clicked
	self:SetCandyBarOnClick("BigWigsBar " .. barText, function(name, button, playerName, target)
		if SUPERWOW_VERSION or SetAutoloot then
			if playerClass == BC["MAGE"] then
				CastSpellByName(BS["Remove Lesser Curse"], target)
			elseif playerClass == BC["DRUID"] then
				CastSpellByName(BS["Remove Curse"], target)
			end
		else
			TargetByName(playerName, true)
			if playerClass == BC["MAGE"] then
				CastSpellByName(BS["Remove Lesser Curse"])
			elseif playerClass == BC["DRUID"] then
				CastSpellByName(BS["Remove Curse"])
			end
		end
	end, player, raidTarget)
end

function module:KingCastFury()
	if not self.db.profile.kingsfury then
		return
	end
	self:Message(L["msg_kingCastFury"], "Attention", nil, "Info")
	self:Bar(L["bar_kingsfury"], timer.kingsfury, icon.kingsfury)
end

function module:Test()
	-- Initialize module state
	self:OnSetup()
	self:Engage()

	-- Store original player name
	local originalPlayer = UnitName("player")
	local testPlayerName1 = UnitName("raid1") or "TestPlayer1"
	local testPlayerName2 = UnitName("raid2") or "TestPlayer2"

	local events = {
		-- King's Curse events
		{ time = 1, func = function()
			-- Simulate actual message format
			local msg = originalPlayer .. " is afflicted by King's Curse"
			module:AfflictionEvent(msg)
			print("Test: " .. msg)
		end },

		{ time = 1, func = function()
			-- Simulate actual message format
			local msg = testPlayerName1 .. " is afflicted by King's Curse"
			module:AfflictionEvent(msg)
			print("Test: " .. msg)
		end },

		-- Queen cast with target
		{ time = 2, func = function()
			local targetMsg = "Queen begins to cast Dark Subservience on " .. originalPlayer
			print("Test: " .. targetMsg)
			-- Use the correct sync format
			self:Sync(syncName.queenCastingSubservience .. " " .. originalPlayer)
		end },

		-- Subservience events for self
		{ time = 3, func = function()
			local msg = "You are afflicted by Dark Subservience"
			module:AfflictionEvent(msg)
			print("Test: " .. msg)
		end },

		{ time = 7, func = function()
			print("Test: Queen begins to cast Charming Presence")
			module:Sync(syncName.charmingPresence)
		end },

		{ time = 9, func = function()
			local msg = "Dark Subservience fades from you"
			module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
			print("Test: " .. msg)
		end },

		-- Subservience events for another player with King's Curse
		{ time = 12, func = function()
			local msg = testPlayerName1 .. " is afflicted by Dark Subservience"
			module:AfflictionEvent(msg)
			module:DecurseReminder(testPlayerName1, "raid1")
			print("Test: " .. msg)
		end },

		{ time = 18, func = function()
			local msg = "Dark Subservience fades from " .. testPlayerName1
			module:FadesEvent(msg)
			print("Test: " .. msg)
		end },

		-- Test King's Curse fading
		{ time = 20, func = function()
			local msg = "King's Curse fades from " .. testPlayerName1
			module:FadesEvent(msg)
			print("Test: " .. msg)
		end },

		-- Test subservience failed (grounding totem)
		{ time = 24, func = function()
			self.queenTarget = testPlayerName1
			print("Test: Queen begins to cast Dark Subservience on " .. testPlayerName1)
			self:Sync(syncName.queenCastingSubservience .. " " .. testPlayerName1)
		end },

		{ time = 25, func = function()
			local msg = "Dark Subservience fails. Grounding Totem"
			module:CastEvent(msg)
			print("Test: " .. msg)
		end },

		-- King's Fury event
		{ time = 28, func = function()
			local msg = "King begins to cast King's Fury"
			module:CastEvent(msg)
			print("Test: " .. msg)
		end },

		-- Test player death with debuffs
		{ time = 30, func = function()
			local msg = testPlayerName2 .. " is afflicted by Dark Subservience"
			module:AfflictionEvent(msg)
			module:DecurseReminder(testPlayerName2, "raid2")
			print("Test: " .. msg)
		end },

		{ time = 31, func = function()
			local msg = testPlayerName2 .. " is afflicted by King's Curse"
			module:AfflictionEvent(msg)
			print("Test: " .. msg)
		end },

		{ time = 32, func = function()
			local msg = testPlayerName2 .. " dies"
			module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
			print("Test: " .. msg)
		end },

		-- Test disengage
		{ time = 35, func = function()
			print("Test: Disengage")
			BigWigs:DisableModule("King")
		end },
	}

	-- Schedule each event at its absolute time
	for i, event in ipairs(events) do
		self:ScheduleEvent("ChessEventTest" .. i, event.func, event.time)
	end

	self:Message("Chess Event test started", "Positive")
	return true
end

-- Test command:
-- /run local m=BigWigs:GetModule("King"); BigWigs:SetupModule("King");m:Test();
