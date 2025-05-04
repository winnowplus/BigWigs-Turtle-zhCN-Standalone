local module, L = BigWigs:ModuleDeclaration("Keeper Gnarlmoon", "Karazhan")

-- module variables
module.revision = 30000 -- To be updated
module.enabletrigger = module.translatedName
module.toggleoptions = { "lunarshift", "ravens", "owlphase", "owlenrage", "moondebuff", "bloodboil", "owlhpframe", "bosskill" }
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Tower of Karazhan"],
	AceLibrary("Babble-Zone-2.2")["Tower of Karazhan"],
}
-- module defaults
module.defaultDB = {
	lunarshift = true,
	ravens = true,
	owlphase = true,
	owlenrage = true,
	moondebuff = true,
	bloodboil = true,
	owlhpframe = true,
	owlframeposx = 100,
	owlframeposy = 400,
}

-- localization
L:RegisterTranslations("enUS", function()
	return {
		cmd = "Gnarlmoon",

		lunarshift_cmd = "lunarshift",
		lunarshift_name = "Lunar Shift Alert",
		lunarshift_desc = "Warns when Keeper Gnarlmoon begins to cast Lunar Shift",

		bloodboil_cmd = "bloodboil",
		bloodboil_name = "Blood Boil Alert",
		bloodboil_desc = "Timer for Keeper Gnarlmoon's Blood Boil ability",

		owlphase_cmd = "owlphase",
		owlphase_name = "Owl Phase Alert",
		owlphase_desc = "Warns when Keeper Gnarlmoon enters and exits the Owl Dimension phase",

		owlenrage_cmd = "owlenrage",
		owlenrage_name = "Owl Enrage Alert",
		owlenrage_desc = "Warns when the Owls are about to enrage",

		moondebuff_cmd = "moondebuff",
		moondebuff_name = "Moon Debuff Alert",
		moondebuff_desc = "Warns when you get affected by Red Moon or Blue Moon",

		owlhpframe_cmd = "owlhpframe",
		owlhpframe_name = "Owl HP Frame",
		owlhpframe_desc = "Shows a frame with the owl HP during owl phases",

		lowRedOwl = "Low Red Owl",
		lowBlueOwl = "Low Blue Owl",
		highRedOwl = "High Red Owl",
		highBlueOwl = "High Blue Owl",

		trigger_lunarShiftCast = "Keeper Gnarlmoon begins to cast Lunar Shift",
		bar_lunarShiftCast = "Lunar Shift Casting!",
		bar_lunarShiftCD = "Next Lunar Shift",
		msg_lunarShift = "Lunar Shift casting!",

		ravens_cmd = "ravens",
		ravens_name = "Raven alert",
		ravens_desc = "Timer for when 12 Blood Ravens will appear",
		msg_ravensSoon = "12 ravens incoming",

		msg_midHp = "Keeper Gnarlmoon < 71% - Owls Soon (@ 66%)!",
		msg_lowHp = "Keeper Gnarlmoon < 38% - Owls Soon (@ 33%)!",

		trigger_owlPhaseStart = "Keeper Gnarlmoon gains Worgen Dimension",
		trigger_owlPhaseEnd = "Worgen Dimension fades from Keeper Gnarlmoon",
		msg_owlPhaseStart = "Owl Phase begins - kill the owls at the same time within 1 min!",
		msg_owlPhaseEnd = "Owl Phase ended!",

		bar_owlEnrage = "Owls Enrage",
		msg_owlEnrage = "Owls will enrage in 10 seconds!",
		msg_owlsEnraged = "Owls Enraged!",

		trigger_redMoon = "afflicted by Red Moon",
		trigger_blueMoon = "afflicted by Blue Moon",
		msg_redMoon = "You have RED MOON!",
		msg_blueMoon = "You have BLUE MOON!",

		trigger_bloodBoil = "Keeper Gnarlmoon's Blood Boil hits",
		bar_bloodBoil = "Next Blood Boil",
	}
end)

L:RegisterTranslations("zhCN", function()
	return {
		cmd = "Gnarlmoon",

		lunarshift_cmd = "lunarshift",
		lunarshift_name = "月相转换警报",
		lunarshift_desc = "当守护者纳尔穆恩开始施放月相转换时发出警告",

		bloodboil_cmd = "bloodboil",
		bloodboil_name = "血液沸腾警报",
		bloodboil_desc = "守护者的血液沸腾技能计时器",

		owlphase_cmd = "owlphase",
		owlphase_name = "猫头鹰阶段警报",
		owlphase_desc = "当守护者纳尔穆恩进入或退出猫头鹰维度阶段时发出警告",

		owlenrage_cmd = "owlenrage",
		owlenrage_name = "猫头鹰激怒警报",
		owlenrage_desc = "当猫头鹰即将激怒时发出警告",

		moondebuff_cmd = "moondebuff",
		moondebuff_name = "月之减益警报",
		moondebuff_desc = "当你受到红月或蓝月影响时发出警告",

		owlhpframe_cmd = "owlhpframe",
		owlhpframe_name = "猫头鹰血量监控",
		owlhpframe_desc = "在猫头鹰阶段显示一个监控猫头鹰血量的框架",

		lowRedOwl = "内侧红枭",
		lowBlueOwl = "内侧蓝枭",
		highRedOwl = "外侧红枭",
		highBlueOwl = "外侧蓝枭",

		trigger_lunarShiftCast = "守护者纳尔穆恩开始施放月之转换",
		bar_lunarShiftCast = "月相转换施放中!",
		bar_lunarShiftCD = "下一次月相转换",
		msg_lunarShift = "月相转换施放中!",

		ravens_cmd = "ravens",
		ravens_name = "小乌鸦警报",
		ravens_desc = "12只小乌鸦出现的计时器",
		msg_ravensSoon = "12只小乌鸦出现！",

		msg_midHp = "BOSS血量<71% - 准备猫头鹰阶段(66%开启)!",
		msg_lowHp = "BOSS血量<38% - 准备猫头鹰阶段(33%开启)!",

		trigger_owlPhaseStart = "守护者纳尔穆恩获得了狼人维度的效果",
		trigger_owlPhaseEnd = "狼人维度效果从守护者纳尔穆恩身上消失",
		msg_owlPhaseStart = "猫头鹰阶段开始 - 在1分钟内同时击杀猫头鹰!",
		msg_owlPhaseEnd = "猫头鹰阶段结束!",

		bar_owlEnrage = "猫头鹰狂暴",
		msg_owlEnrage = "10秒后猫头鹰狂暴！",
		msg_owlsEnraged = "猫头鹰狂暴了！",

		trigger_redMoon = "受到了红月效果的影响",
		trigger_blueMoon = "受到了蓝月效果的影响",
		msg_redMoon = "你受到红月影响!",
		msg_blueMoon = "你受到蓝月影响!",

		trigger_bloodBoil = "守护者纳尔穆恩的血液沸腾击中",
		bar_bloodBoil = "下一次血液沸腾",
	}
end)

-- timer and icon variables
local timer = {
	lunarShiftCast = 5,
	lunarShiftCD = 30,
	owlPhase = 67, -- approximately based on logs
	owlEnrage = 60,
	ravenSummon = { 15, 40 },
	bloodBoil = 11,
}

local icon = {
	lunarShift = "Spell_Nature_StarFall",
	owlPhase = "Ability_EyeOfTheOwl",
	owlEnrage = "Spell_Shadow_UnholyFrenzy",
	redMoon = "inv_misc_orb_05",
	blueMoon = "inv_ore_arcanite_02",
	bloodBoil = "Spell_Shadow_BloodBoil",
}

local color = {
	lunarShift = "Blue",
	owlPhase = "Green",
	owlEnrage = "Red",
	bloodBoil = "Red",
}

local syncName = {
	lunarShift = "GnarlmoonLunarShift" .. module.revision,
	owlPhaseStart = "GnarlmoonOwlStart" .. module.revision,
	owlPhaseEnd = "GnarlmoonOwlEnd" .. module.revision,
	bloodBoil = "GnarlmoonBloodBoil" .. module.revision,
}

function module:OnSetup()
	self.started = nil
	self.phase = nil
	self.owlPhaseCount = 0

	-- Used to monitor when owl phase will begin
	self.lowHp = nil
	self.midHp = nil
	self.gnarlHealth = 100

	-- used to separate timer for first raven summon from remainer
	self.firstRaven = true

	-- Reset owl health values
	self.lowRedOwlHp = 100
	self.lowBlueOwlHp = 100
	self.highRedOwlHp = 100
	self.highBlueOwlHp = 100

	self.owlsExist = false
end

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE")

	self:ThrottleSync(3, syncName.lunarShift)
	self:ThrottleSync(5, syncName.owlPhaseStart)
	self:ThrottleSync(5, syncName.owlPhaseEnd)
	self:ThrottleSync(5, syncName.bloodBoil)

	-- Store owl health
	self.lowRedOwlHp = 100
	self.lowBlueOwlHp = 100
	self.highRedOwlHp = 100
	self.highBlueOwlHp = 100

	-- Create the owl status frame but keep it hidden until needed
	if self.db.profile.owlhpframe then
		self:UpdateOwlStatusFrame()
		self.owlStatusFrame:Show() -- let people position before fight
	end
end

function module:OnEngage()
	self.phase = 1
	self.owlPhaseCount = 0

	if self.owlStatusFrame then
		self.owlStatusFrame:Hide()
	end

	-- Used to monitor when owl phase will begin
	self.lowHp = nil
	self.midHp = nil
	self.gnarlHealth = 100

	-- used to separate timer for first raven summon from remainer
	self.firstRaven = true

	-- Make sure the owl frame is hidden at the start of the encounter
	self.owlsExist = false
	self:UpdateOwlStatusFrame()

	if self.db.profile.lunarshift then
		self:Bar(L["bar_lunarShiftCD"], timer.lunarShiftCD, icon.lunarShift, true, color.lunarShift)
	end

	if self.db.profile.ravens then
		self:DelayedMessage(timer.ravenSummon[1] - 5, L["msg_ravensSoon"], "Important", false, nil, false)
		self:ScheduleEvent("FirstRavens", self.FirstRavens, timer.ravenSummon[1], self)
	end

	if self.db.profile.owlphase then
		self:ScheduleRepeatingEvent("CheckHps", self.CheckHps, 1, self)
	end
end

function module:OnDisengage()
	if self:IsEventScheduled("FirstRavens") then
		self:CancelScheduledEvent("FirstRavens")
	end

	if self:IsEventScheduled("CheckHps") then
		self:CancelScheduledEvent("CheckHps")
	end

	if self:IsEventScheduled("RemainingRavens") then
		self:CancelScheduledEvent("RemainingRavens")
	end

	self.owlsExist = false
	self:UpdateOwlStatusFrame()
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE(msg)
	if string.find(msg, L["trigger_lunarShiftCast"]) then
		self:Sync(syncName.lunarShift)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS(msg)
	if string.find(msg, L["trigger_owlPhaseStart"]) then
		self:Sync(syncName.owlPhaseStart)
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if string.find(msg, L["trigger_owlPhaseEnd"]) then
		self:Sync(syncName.owlPhaseEnd)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE(msg)
	if self.db.profile.moondebuff then
		if string.find(msg, L["trigger_redMoon"]) then
			self:Message(L["msg_redMoon"], "Important", true, "Alarm")
			self:WarningSign(icon.redMoon, 5, true, "红")
		elseif string.find(msg, L["trigger_blueMoon"]) then
			self:Message(L["msg_blueMoon"], "Important", true, "Alert")
			self:WarningSign(icon.blueMoon, 5, "蓝")
		end
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE(msg)
	if self.db.profile.bloodboil and string.find(msg, L["trigger_bloodBoil"]) then
		self:Sync(syncName.bloodBoil)
	end
end

function module:BloodBoil()
	if self.db.profile.bloodboil then
		self:RemoveBar(L["bar_bloodBoil"])
		self:Bar(L["bar_bloodBoil"], timer.bloodBoil, icon.bloodBoil, true, color.bloodBoil)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.lunarShift then
		self:LunarShift()
	elseif sync == syncName.owlPhaseStart then
		self:OwlPhaseStart()
	elseif sync == syncName.owlPhaseEnd then
		self:OwlPhaseEnd()
	elseif sync == syncName.bloodBoil then
		self:BloodBoil()
	end
end

function module:LunarShift()
	if self.db.profile.lunarshift then
		self:Message(L["msg_lunarShift"], "Important")
		self:RemoveBar(L["bar_lunarShiftCD"])
		self:Bar(L["bar_lunarShiftCast"], timer.lunarShiftCast, icon.lunarShift, true, color.lunarShift)
		self:DelayedBar(timer.lunarShiftCast, L["bar_lunarShiftCD"], timer.lunarShiftCD - timer.lunarShiftCast, icon.lunarShift, true, color.lunarShift)
	end
end

function module:FirstRavens()
	-- first summon is after 15 seconds, remainder are every 40 seconds
	self:DelayedMessage(timer.ravenSummon[2] - 5, L["msg_ravensSoon"], "Important", false, nil, false)
	self:ScheduleRepeatingEvent("RemainingRavens", self.RemainingRavens, timer.ravenSummon[2], self)
end

function module:RemainingRavens()
	self:DelayedMessage(timer.ravenSummon[2] - 5, L["msg_ravensSoon"], "Important", false, nil, false)
end

function module:OwlPhaseStart()
	-- set owl hps to 100
	self.lowRedOwlHp = 100
	self.lowBlueOwlHp = 100
	self.highRedOwlHp = 100
	self.highBlueOwlHp = 100

	if self.db.profile.owlphase then
		self.owlPhaseCount = self.owlPhaseCount + 1
		self:Message(L["msg_owlPhaseStart"], "Attention")
		self:Sound("Alarm")

		if self.db.profile.owlenrage then
			self:Bar(L["bar_owlEnrage"], timer.owlEnrage, icon.owlEnrage, true, color.owlEnrage)
			self:DelayedMessage(timer.owlEnrage - 10, L["msg_owlEnrage"], "Urgent")
			self:DelayedMessage(timer.owlEnrage, L["msg_owlsEnraged"], "Important")
		end

		-- Cancel Lunar Shift bars during owl phase
		self:RemoveBar(L["bar_lunarShiftCast"])
		self:RemoveBar(L["bar_lunarShiftCD"])

		-- Cancel Blood Boil bar during owl phase
		self:RemoveBar(L["bar_bloodBoil"])

		if self.db.profile.owlhpframe then
			self.owlsExist = true
			self:UpdateOwlStatusFrame()
		end
	end
end

function module:OwlPhaseEnd()
	if self.db.profile.owlphase then
		self:Message(L["msg_owlPhaseEnd"], "Positive")
		self:RemoveBar(L["bar_owlEnrage"])

		self.owlsExist = false
		self:UpdateOwlStatusFrame()
	end
end

function module:CheckHps()
	-- For tracking owl health
	local lowestRedOwlHp = 100
	local lowestBlueOwlHp = 100
	local highestRedOwlHp = 0
	local highestBlueOwlHp = 0

	for i = 1, GetNumRaidMembers() do
		local targetString = "raid" .. i .. "target"
		local targetName = UnitName(targetString)

		if targetName == module.translatedName then
			-- Check Gnarlmoon's health
			local tempH = UnitHealth(targetString)
			if tempH > 0 then
				local tempM = UnitHealthMax(targetString)
				if tempM and tempM > 0 then
					local health = tempH / tempM * 100
					if health < 100 then
						self.gnarlHealth = health
					end
				end
			end
		elseif self.owlsExist and targetName and string.find(targetName, "枭") then
			-- Calculate owl health percentage
			local owlHealth = 100
			local h = UnitHealth(targetString)
			local m = UnitHealthMax(targetString)

			if h and m and m > 0 then
				owlHealth = math.floor((h / m) * 100)
			end

			-- Check owl name to determine type and track lowest health
			if string.find(targetName, "红") then
				if owlHealth < lowestRedOwlHp then
					lowestRedOwlHp = owlHealth
				end
				if owlHealth > highestRedOwlHp then
					highestRedOwlHp = owlHealth
				end
			elseif string.find(targetName, "蓝") then
				if owlHealth < lowestBlueOwlHp then
					lowestBlueOwlHp = owlHealth
				end
				if owlHealth > highestBlueOwlHp then
					highestBlueOwlHp = owlHealth
				end
			end
		end
	end

	-- During test function, don't reset owl health
	if self.owlsExist and not self.testInProgress then
		-- Only update if the new health is lower than current health
		if lowestRedOwlHp < 100 then
			self.lowRedOwlHp = lowestRedOwlHp
		end

		if lowestBlueOwlHp < 100 then
			self.lowBlueOwlHp = lowestBlueOwlHp
		end

		if highestRedOwlHp > 0 then
			self.highRedOwlHp = highestRedOwlHp
		end

		if highestBlueOwlHp > 0 then
			self.highBlueOwlHp = highestBlueOwlHp
		end
	end

	if self.owlsExist then
		self:UpdateOwlStatusFrame()
	end

	-- Handle Gnarlmoon's health thresholds for phase warnings
	if self.gnarlHealth < 71 and self.midHp == nil then
		self.midHp = true
		self:Message(L["msg_midHp"], "Urgent", true, nil, false)
		self:Sound("Info")
	end

	if self.gnarlHealth < 38 and self.lowHp == nil then
		self.lowHp = true
		self:Message(L["msg_lowHp"], "Urgent", true, nil, false)
		self:Sound("Info")
	end
end

function module:UpdateOwlStatusFrame()
	if not self.db.profile.owlhpframe then
		return
	end

	-- Create frame if needed
	if not self.owlStatusFrame then
		self.owlStatusFrame = CreateFrame("Frame", "GnarlmoonOwlStatusFrame", UIParent)
		self.owlStatusFrame.module = self
		self.owlStatusFrame:SetWidth(200)  -- Wider to fit columns
		self.owlStatusFrame:SetHeight(90)  -- Increased height for more padding
		self.owlStatusFrame:ClearAllPoints()
		local s = self.owlStatusFrame:GetEffectiveScale()
		self.owlStatusFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", (self.db.profile.owlframeposx or 100) / s, (self.db.profile.owlframeposy or 400) / s)
		self.owlStatusFrame:SetBackdrop({
			bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
			edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
			tile = true,
			tileSize = 16,
			edgeSize = 16,
			insets = { left = 8, right = 8, top = 8, bottom = 8 }
		})
		self.owlStatusFrame:SetBackdropColor(0, 0, 0, 1)

		-- Allow dragging
		self.owlStatusFrame:SetMovable(true)
		self.owlStatusFrame:EnableMouse(true)
		self.owlStatusFrame:RegisterForDrag("LeftButton")
		self.owlStatusFrame:SetScript("OnDragStart", function()
			this:StartMoving()
		end)
		self.owlStatusFrame:SetScript("OnDragStop", function()
			this:StopMovingOrSizing()

			local scale = this:GetEffectiveScale()
			this.module.db.profile.owlframeposx = this:GetLeft() * scale
			this.module.db.profile.owlframeposy = this:GetTop() * scale
		end)

		local font = "Fonts\\FRIZQT__.TTF"
		local fontSize = 12

		-- Frame title
		self.owlStatusFrame.title = self.owlStatusFrame:CreateFontString(nil, "ARTWORK")
		self.owlStatusFrame.title:SetFontObject(GameFontNormal)
		self.owlStatusFrame.title:SetPoint("TOP", self.owlStatusFrame, "TOP", 0, -10)
		self.owlStatusFrame.title:SetText("猫头鹰血量")
		self.owlStatusFrame.title:SetFont(font, fontSize)

		-- Red Column Header (Left Side)
		self.owlStatusFrame.redHeader = self.owlStatusFrame:CreateFontString(nil, "ARTWORK")
		self.owlStatusFrame.redHeader:SetFontObject(GameFontNormal)
		self.owlStatusFrame.redHeader:SetPoint("TOPLEFT", self.owlStatusFrame, "TOPLEFT", 15, -25)
		self.owlStatusFrame.redHeader:SetText("红")
		self.owlStatusFrame.redHeader:SetFont(font, fontSize)
		self.owlStatusFrame.redHeader:SetTextColor(1, 0.3, 0.3)

		-- Blue Column Header (Right Side)
		self.owlStatusFrame.blueHeader = self.owlStatusFrame:CreateFontString(nil, "ARTWORK")
		self.owlStatusFrame.blueHeader:SetFontObject(GameFontNormal)
		self.owlStatusFrame.blueHeader:SetPoint("TOPRIGHT", self.owlStatusFrame, "TOPRIGHT", -15, -25)
		self.owlStatusFrame.blueHeader:SetText("蓝")
		self.owlStatusFrame.blueHeader:SetFont(font, fontSize)
		self.owlStatusFrame.blueHeader:SetTextColor(0.3, 0.3, 1)

		-- Create invisible anchor frames for precise alignment
		local leftAnchor = CreateFrame("Frame", nil, self.owlStatusFrame)
		leftAnchor:SetPoint("CENTER", self.owlStatusFrame, "CENTER", -60, 0)
		leftAnchor:SetWidth(1)
		leftAnchor:SetHeight(1)

		local rightAnchor = CreateFrame("Frame", nil, self.owlStatusFrame)
		rightAnchor:SetPoint("CENTER", self.owlStatusFrame, "CENTER", 60, 0)
		rightAnchor:SetWidth(1)
		rightAnchor:SetHeight(1)

		-- Low Owls Row Label
		self.owlStatusFrame.lowLabel = self.owlStatusFrame:CreateFontString(nil, "ARTWORK")
		self.owlStatusFrame.lowLabel:SetFontObject(GameFontNormal)
		self.owlStatusFrame.lowLabel:SetPoint("CENTER", self.owlStatusFrame, "CENTER", 0, -10)
		self.owlStatusFrame.lowLabel:SetText("内")
		self.owlStatusFrame.lowLabel:SetFont(font, fontSize)

		-- High Owls Row Label
		self.owlStatusFrame.highLabel = self.owlStatusFrame:CreateFontString(nil, "ARTWORK")
		self.owlStatusFrame.highLabel:SetFontObject(GameFontNormal)
		self.owlStatusFrame.highLabel:SetPoint("CENTER", self.owlStatusFrame, "CENTER", 0, -30)
		self.owlStatusFrame.highLabel:SetText("外")
		self.owlStatusFrame.highLabel:SetFont(font, fontSize)

		-- Red Low Owl HP (left column)
		self.owlStatusFrame.lowRedOwlHp = self.owlStatusFrame:CreateFontString(nil, "ARTWORK")
		self.owlStatusFrame.lowRedOwlHp:SetFontObject(GameFontNormal)
		self.owlStatusFrame.lowRedOwlHp:SetPoint("CENTER", leftAnchor, "CENTER", 0, -10)
		self.owlStatusFrame.lowRedOwlHp:SetJustifyH("CENTER")
		self.owlStatusFrame.lowRedOwlHp:SetFont(font, fontSize)
		self.owlStatusFrame.lowRedOwlHp:SetTextColor(1, 0.3, 0.3)

		-- Blue Low Owl HP (right column)
		self.owlStatusFrame.lowBlueOwlHp = self.owlStatusFrame:CreateFontString(nil, "ARTWORK")
		self.owlStatusFrame.lowBlueOwlHp:SetFontObject(GameFontNormal)
		self.owlStatusFrame.lowBlueOwlHp:SetPoint("CENTER", rightAnchor, "CENTER", 0, -10)
		self.owlStatusFrame.lowBlueOwlHp:SetJustifyH("CENTER")
		self.owlStatusFrame.lowBlueOwlHp:SetFont(font, fontSize)
		self.owlStatusFrame.lowBlueOwlHp:SetTextColor(0.3, 0.3, 1)

		-- Red High Owl HP (left column)
		self.owlStatusFrame.highRedOwlHp = self.owlStatusFrame:CreateFontString(nil, "ARTWORK")
		self.owlStatusFrame.highRedOwlHp:SetFontObject(GameFontNormal)
		self.owlStatusFrame.highRedOwlHp:SetPoint("CENTER", leftAnchor, "CENTER", 0, -30)
		self.owlStatusFrame.highRedOwlHp:SetJustifyH("CENTER")
		self.owlStatusFrame.highRedOwlHp:SetFont(font, fontSize)
		self.owlStatusFrame.highRedOwlHp:SetTextColor(1, 0.3, 0.3)

		-- Blue High Owl HP (right column)
		self.owlStatusFrame.highBlueOwlHp = self.owlStatusFrame:CreateFontString(nil, "ARTWORK")
		self.owlStatusFrame.highBlueOwlHp:SetFontObject(GameFontNormal)
		self.owlStatusFrame.highBlueOwlHp:SetPoint("CENTER", rightAnchor, "CENTER", 0, -30)
		self.owlStatusFrame.highBlueOwlHp:SetJustifyH("CENTER")
		self.owlStatusFrame.highBlueOwlHp:SetFont(font, fontSize)
		self.owlStatusFrame.highBlueOwlHp:SetTextColor(0.3, 0.3, 1)
	end

	-- Show/hide frame based on whether owls exist
	if self.owlsExist then
		self.owlStatusFrame:Show()
	else
		self.owlStatusFrame:Hide()
		return
	end

	-- Update HP values
	self:SetOwlHpText(self.owlStatusFrame.lowBlueOwlHp, self.lowBlueOwlHp)
	self:SetOwlHpText(self.owlStatusFrame.lowRedOwlHp, self.lowRedOwlHp)
	self:SetOwlHpText(self.owlStatusFrame.highBlueOwlHp, self.highBlueOwlHp)
	self:SetOwlHpText(self.owlStatusFrame.highRedOwlHp, self.highRedOwlHp)
end

function module:SetOwlHpText(fontString, healthPercent)
	if not fontString then
		return
	end

	-- Format health percentage string
	local text = healthPercent .. "%"

	-- Color based on health percentage
	local r, g, b = 1, 1, 1
	if healthPercent <= 0 then
		text = "DEAD"
		r, g, b = 0.5, 0.5, 0.5
	elseif healthPercent < 15 then
		r, g, b = 1, 1, 0
	end

	-- Set the text and color
	fontString:SetText(text)
	fontString:SetTextColor(r, g, b)
end

function module:Test()
	-- Test owl HP frame
	self.owlsExist = true

	-- Update HP values over time
	self:ScheduleEvent("TestOwlsHP1", function()
		module.lowRedOwlHp = 85
		module.lowBlueOwlHp = 80
		module.highRedOwlHp = 90
		module.highBlueOwlHp = 75
		module:UpdateOwlStatusFrame()
	end, 3)

	self:ScheduleEvent("TestOwlsHP2", function()
		module.lowRedOwlHp = 50
		module.lowBlueOwlHp = 45
		module.highRedOwlHp = 55
		module.highBlueOwlHp = 40
		module:UpdateOwlStatusFrame()
	end, 6)

	self:ScheduleEvent("TestOwlsHP3", function()
		module.lowRedOwlHp = 15
		module.lowBlueOwlHp = 12
		module.highRedOwlHp = 18
		module.highBlueOwlHp = 9
		module:UpdateOwlStatusFrame()
	end, 9)

	-- Hide frame when phase ends
	self:ScheduleEvent("HideOwlFrame", function()
		module.owlsExist = false
		module:UpdateOwlStatusFrame()
	end, 12)
end

-- Update the Test function to include Blood Boil events:
function module:Test()
	-- Initialize module state
	self:OnSetup()
	self:OnEnable()

	-- Flag to prevent resetting owl health during test
	self.testInProgress = true

	local events = {
		-- Initial setup
		{ time = 3, func = function()
			print("Test: Keeper Gnarlmoon engaged")
			module:OnEngage()
		end },

		-- First Blood Boil
		{ time = 7, func = function()
			print("Test: Keeper Gnarlmoon's Blood Boil hits you")
			module:CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE("Keeper Gnarlmoon's Blood Boil hits you for 500 Fire damage.")
		end },

		-- Initial Lunar Shift
		{ time = 10, func = function()
			print("Test: Keeper Gnarlmoon begins to cast Lunar Shift")
			module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE("Keeper Gnarlmoon begins to cast Lunar Shift.")
		end },

		-- Second Blood Boil
		{ time = 18, func = function()
			print("Test: Keeper Gnarlmoon's Blood Boil hits you")
			module:CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE("Keeper Gnarlmoon's Blood Boil hits you for 500 Fire damage.")
		end },

		-- HP triggers
		{ time = 20, func = function()
			print("Test: 70% hp")
			module.gnarlHealth = 70
			module:CheckHps()
		end },

		-- Continue with previous test events...
		-- Rest of events from original test function
	}

	-- Schedule each event at its absolute time
	for i, event in ipairs(events) do
		self:ScheduleEvent("GnarlmoonTest" .. i, event.func, event.time)
	end

	self:Message("Keeper Gnarlmoon test started", "Positive")
	return true
end

-- Usage: /run local m=BigWigs:GetModule("Keeper Gnarlmoon"); BigWigs:SetupModule("Keeper Gnarlmoon");m:Test();
