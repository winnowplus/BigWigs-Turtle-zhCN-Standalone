
local module, L = BigWigs:ModuleDeclaration("Thaddius", "Naxxramas")
local bbfeugen = AceLibrary("Babble-Boss-2.2")["Feugen"]
local bbstalagg = AceLibrary("Babble-Boss-2.2")["Stalagg"]

module.revision = 30090
module.enabletrigger = {module.translatedName, feugen, stalagg}
module.toggleoptions = {"power", "magneticPull", "manaburn", -1, "phase", -1, "enrage", "selfcharge", "polarity", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Thaddius",
	
	power_cmd = "power",
	power_name = "能量涌动警报",
	power_desc = "斯塔拉格能量涌动时进行警告",
	
	magneticPull_cmd = "magneticPull",
	magneticPull_name = "磁性吸引警报",
	magneticPull_desc = "磁性吸引时进行警告",
	
	manaburn_cmd = "manaburn",
	manaburn_name = "法力燃烧警报",
	manaburn_desc = "法力燃烧时进行警告",
	
	phase_cmd = "phase",
	phase_name = "阶段警报",
	phase_desc = "阶段转换时进行警告",
	
	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒出现时进行警告",

	polarity_cmd = "polarity",
	polarity_name = "极性转换警报",
	polarity_desc = "极性转换时进行警告",

	selfcharge_cmd = "selfcharge",
	selfcharge_name = "电荷变化警报",
	selfcharge_desc = "你的正/负电荷变化时进行警告。",

	
	trigger_engage = "Stalagg crush you!", --CHAT_MSG_MONSTER_YELL
	trigger_engage1 = "Feed you to master!", --CHAT_MSG_MONSTER_YELL
	
	trigger_powerSurge = "Stalagg gains Power Surge.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	bar_powerSurge = "能量涌动",
	msg_powerSurge = "斯塔拉格获得能量涌动！",
	
	bar_magneticPull = "磁性吸引",
	
	trigger_manaBurn = "Feugen's Static Field hits you for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	trigger_manaBurn2 = "You absorb Feugen's Static Field.",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	msg_manaBurn = "费尔根法力燃烧你了！30码范围AOE",
	
	trigger_feugenDeadYell = "No... more... Feugen...",--CHAT_MSG_MONSTER_YELL
	trigger_stalaggDeadYell = "Master save me...",--CHAT_MSG_MONSTER_YELL
	
	trigger_3sec = "%s overloads!",--CHAT_MSG_RAID_BOSS_EMOTE
	bar_phase2 = "塔迪乌斯激活",
	msg_phase2 = "第二阶段",
	msg_positionReminder = "- - - - -  塔迪乌斯  + + + + +",
	
	trigger_enrage = "Thaddius gains Berserk.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	bar_enrage = "激怒",
	msg_enrage = "激怒！",
	msg_enrage60 = "60秒后激怒",
	msg_enrage10 = "10秒后激怒",
	
	trigger_polarityShiftCast = "Thaddius begins to cast Polarity Shift.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_polarityShiftCast = "极性转换施法",
	msg_polarityShift = "正在施放极性转换！",
	
	trigger_polarityShiftAfflic = "Now YOU feel pain!", --CHAT_MSG_MONSTER_YELL
	bar_polarityShiftCd = "极性转换冷却",
	
	msg_noChange = "你的增益效果没有变化！",
	msg_changeToPositive = "你变成了正电荷！",
	msg_changeToNegative = "你变成了负电荷！",
	bar_polarityTick = "极性跳动",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	cmd = "Thaddius",
	
	power_cmd = "power",
	power_name = "能量涌动警报",
	power_desc = "斯塔拉格能量涌动时进行警告",
	
	magneticPull_cmd = "magneticPull",
	magneticPull_name = "磁性吸引警报",
	magneticPull_desc = "磁性吸引时进行警告",
	
	manaburn_cmd = "manaburn",
	manaburn_name = "静止力场警报",
	manaburn_desc = "静止力场时进行警告",
	
	phase_cmd = "phase",
	phase_name = "阶段警报",
	phase_desc = "阶段转换时进行警告",
	
	enrage_cmd = "enrage",
	enrage_name = "激怒警报",
	enrage_desc = "激怒出现时进行警告",

	polarity_cmd = "polarity",
	polarity_name = "极性转换警报",
	polarity_desc = "极性转换时进行警告",

	selfcharge_cmd = "selfcharge",
	selfcharge_name = "电荷变化警报",
	selfcharge_desc = "你的正/负电荷变化时进行警告。",

	
	trigger_engage = "斯塔拉格碾压你！", --CHAT_MSG_MONSTER_YELL
	trigger_engage1 = "喂你当主人！", --CHAT_MSG_MONSTER_YELL
	
	trigger_powerSurge = "斯塔拉格获得了能量涌动的效果。",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	bar_powerSurge = "能量涌动",
	msg_powerSurge = "斯塔拉格获得能量涌动！",
	
	bar_magneticPull = "磁性吸引",
	
	trigger_manaBurn = "费尔根的静止力场击中", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	trigger_manaBurn2 = "You absorb Feugen's Static Field.",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	msg_manaBurn = "费尔根的静止力场！30码范围AOE",
	
	trigger_feugenDeadYell = "不...更多...费根...",--CHAT_MSG_MONSTER_YELL
	trigger_stalaggDeadYell = "主宰救救我吧...",--CHAT_MSG_MONSTER_YELL
	
	trigger_3sec = "%s 超载！",--CHAT_MSG_RAID_BOSS_EMOTE
	bar_phase2 = "塔迪乌斯激活",
	msg_phase2 = "第二阶段",
	msg_positionReminder = "- - - - -  塔迪乌斯  + + + + +",
	
	trigger_enrage = "塔迪乌斯获得了狂暴的效果。", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	bar_enrage = "狂暴",
	msg_enrage = "狂暴！",
	msg_enrage60 = "60秒后狂暴",
	msg_enrage10 = "10秒后狂暴",
	
	trigger_polarityShiftCast = "塔迪乌斯开始施放极性转化。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_polarityShiftCast = "开始极性转换",
	msg_polarityShift = "正在施放极性转换！",
	
	trigger_polarityShiftAfflic = "现在你感到疼痛了！", --CHAT_MSG_MONSTER_YELL
	bar_polarityShiftCd = "极性转换倒计时",
	
	msg_noChange = "你的增益效果没有变化！",
	msg_changeToPositive = "你变成了正电荷！",
	msg_changeToNegative = "你变成了负电荷！",
	bar_polarityTick = "跑位时间",
} end )

local timer = {
	powerSurge = 10,
	magneticPull = 20.5,
	
	phase2 = 14,
	
	enrage = 300,
	
	firstPolarity = {11,14.2},--saw 11, 14.2
	polarityShiftCd = 27,--{25,35},
	polarityShiftCast = 3,
	polarityTick = 5,
}
local icon = {
	powerSurge = "Spell_Shadow_UnholyFrenzy",
	magneticPull = "spell_nature_groundingtotem",
	
	phase2 = "Inv_misc_pocketwatch_01",
	
	enrage = "Spell_Shadow_UnholyFrenzy",
	
	polarityShift = "Spell_Nature_Lightning",
	positive = "Spell_ChargePositive",
	negative = "Spell_ChargeNegative",
	
	manaBurn = "Spell_Shadow_ManaBurn",
	
	hpBar = "spell_shadow_raisedead",
}
local color = {
	powerSurge = "Red",
	magneticPull = "Blue",
	
	phase = "Black",
	
	enrage = "White",
	
	polarityShiftCd = "Cyan",
	polarityShiftCast = "Green",
	
	positive = "Blue",
	negative = "Red",
	
	hpBar = "Magenta"
}
local syncName = {
	powerSurge = "StalaggPower"..module.revision,
	
	phase2 = "ThaddiusAddsDead"..module.revision,
	
	teslaOverload = "ThaddiusTeslaOverload"..module.revision,
	
	enrage = "ThaddiusEnrage"..module.revision,
	
	polarityShiftCast = "ThaddiusPolarityShiftCast"..module.revision,
	polarity = "ThaddiusPolarity"..module.revision,
}

local phase2started = nil
local stalaggDead = nil
local feugenDead = nil

module:RegisterYellEngage(L["trigger_engage"])
module:RegisterYellEngage(L["trigger_engage1"])

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --trigger_engage, trigger_engage1, trigger_feugenDeadYell, trigger_stalaggDeadYell, trigger_polarityShiftAfflic
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE") --trigger_3sec
		
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_polarityShiftCast
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_manaBurn, trigger_manaBurn2
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_powerSurge, trigger_enrage
	
	self:ThrottleSync(4, syncName.powerSurge)
	
	self:ThrottleSync(20, syncName.phase2)
	self:ThrottleSync(5, syncName.teslaOverload)
	
	self:ThrottleSync(10, syncName.enrage)
	self:ThrottleSync(10, syncName.polarityShiftCast)
	self:ThrottleSync(10, syncName.polarity)
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	
	self.started = nil
	self.previousCharge = ""
end

function module:OnEngage()
	phase2started = false
	
	self.previousCharge = ""
	
	stalaggDead = false
	feugenDead = false
	
	self.feugenHP = 100
	self.stalaggHP = 100
	self:TriggerEvent("BigWigs_StartHPBar", self, bbfeugen, 100, "Interface\\Icons\\"..icon.hpBar, true, color.hpBar)
	self:TriggerEvent("BigWigs_SetHPBar", self, bbfeugen, 0)
	self:TriggerEvent("BigWigs_StartHPBar", self, bbstalagg, 100, "Interface\\Icons\\"..icon.hpBar, true, color.hpBar)
	self:TriggerEvent("BigWigs_SetHPBar", self, bbstalagg, 0)
	
	self:ScheduleRepeatingEvent("CheckAddHP", self.CheckAddHP, 0.5, self)
	
	if self.db.profile.magneticPull then
		self:Bar(L["bar_magneticPull"], timer.magneticPull, icon.magneticPull, true, color.magneticPull)
		self:ScheduleRepeatingEvent("MagneticPull", self.MagneticPull, timer.magneticPull, self)
	end
end

function module:OnDisengage()
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if (msg == string.format(UNITDIESOTHER, bbfeugen)) then
		feugenDead = true
	elseif (msg == string.format(UNITDIESOTHER, bbstalagg)) then
		stalaggDead = true
	end
	
	if feugenDead == true and stalaggDead == true then
		self:Sync(syncName.phase2)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["trigger_feugenDeadYell"] then
		feugenDead = true
		if feugenDead == true and stalaggDead == true then
			self:Sync(syncName.phase2)
		end
	elseif msg == L["trigger_stalaggDeadYell"] then
		stalaggDead = true
		if stalaggDead == true and feugenDead == true then
			self:Sync(syncName.phase2)
		end
	elseif msg == L["trigger_polarityShiftAfflic"] then
		self:Sync(syncName.polarity)
	end
end

function module:CHAT_MSG_RAID_BOSS_EMOTE(msg)
	if msg == L["trigger_3sec"] then
		self:Sync(syncName.teslaOverload)
	end
end

function module:CheckAddHP()
	local feugenHealth
	local stalaggHealth
	
	for i=1,GetNumRaidMembers() do
		if UnitName("Raid"..i.."Target") == bbfeugen then
			feugenHealth = math.ceil((UnitHealth("Raid"..i.."Target") / UnitHealthMax("Raid"..i.."Target")) * 100)
		elseif UnitName("Raid"..i.."Target") == bbstalagg then
			stalaggHealth = math.ceil((UnitHealth("Raid"..i.."Target") / UnitHealthMax("Raid"..i.."Target")) * 100)
		end
		if feugenHealth and stalaggHealth then
			break
		end
	end
	
	if feugenHealth then
		self.feugenHP = feugenHealth
		self:TriggerEvent("BigWigs_SetHPBar", self, bbfeugen, 100-self.feugenHP)
	end
	
	if stalaggHealth then
		self.stalaggHP = stalaggHealth
		self:TriggerEvent("BigWigs_SetHPBar", self, bbstalagg, 100-self.stalaggHP)
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_powerSurge"]) then
		self:Sync(syncName.powerSurge)
	
	elseif string.find(msg, L["trigger_manaBurn"]) or string.find(msg, L["trigger_manaBurn2"]) then
		self:ManaBurn()
	
	elseif msg == L["trigger_enrage"] then
		self:Sync(syncName.enrage)
		
	elseif msg == L["trigger_polarityShiftCast"] then
		self:Sync(syncName.polarityShiftCast)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.powerSurge and self.db.profile.power then
		self:PowerSurge()

	elseif sync == syncName.phase2 and self.db.profile.phase then
		self:Phase2()
	elseif sync == syncName.teslaOverload and self.db.profile.phase then
		self:ThreeSec()
	
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
		
	elseif sync == syncName.polarity and self.db.profile.polarity then
		self:PolarityShift()
	elseif sync == syncName.polarityShiftCast and self.db.profile.polarity then
		self:PolarityShiftCast()
	end
end


function module:PowerSurge()
	self:Message(L["msg_powerSurge"], "Important", false, nil, false)
	self:Bar(L["bar_powerSurge"], timer.powerSurge, icon.powerSurge, true, color.powerSurge)
end

function module:MagneticPull()
	self:WarningSign(icon.magneticPull, 0.7)
	self:Bar(L["bar_magneticPull"], timer.magneticPull, icon.magneticPull, true, color.magneticPull)
end

function module:ManaBurn()
	self:WarningSign(icon.manaBurn, 0.7)
	self:Message(L["msg_manaBurn"], "Urgent", false, nil, false)
	self:Sound("Beware")
end

function module:Phase2()
	phase2started = true
	
	self:TriggerEvent("BigWigs_StopHPBar", self, bbfeugen)
	self:TriggerEvent("BigWigs_StopHPBar", self, bbstalagg)
	self:CancelScheduledEvent("CheckAddHP")
	self:CancelScheduledEvent("MagneticPull")
	self:RemoveBar(L["bar_magneticPull"])
	self:RemoveBar(L["bar_powerSurge"])
	self:CancelDelayedSound("Info")
	
	self:Bar(L["bar_phase2"], timer.phase2, icon.phase2, true, color.phase)
	self:Message(L["msg_positionReminder"])
end

function module:ThreeSec()
	if phase2started == true then
		self:RemoveBar(L["bar_phase2"])
		self:Bar(L["bar_phase2"], 3, icon.phase2, true, color.phase)
		self:Message(L["msg_positionReminder"])
		
		if self.db.profile.enrage then
			self:DelayedBar(3, L["bar_enrage"], timer.enrage, icon.enrage, true, color.enrage)
			self:DelayedMessage(timer.enrage - 60, L["msg_enrage60"], "Urgent", false, nil, false)
			self:DelayedMessage(timer.enrage - 10, L["msg_enrage10"], "Important", false, nil, false)
		end
		
		if self.db.profile.polarity then
			self:DelayedIntervalBar(3, L["bar_polarityShiftCd"], timer.firstPolarity[1], timer.firstPolarity[2], icon.polarityShift, true, color.polarityShiftCd)
			self:Message(L["msg_positionReminder"])
		end
	end
end

function module:Enrage()
	self:RemoveBar(L["bar_enrage"])
	self:CancelDelayedMessage(L["msg_enrage60"])
	self:CancelDelayedMessage(L["msg_enrage10"])
	
	self:Message(L["msg_enrage"], "Important", false, nil, false)
	self:Sound("Beware")
	self:WarningSign(icon.enrage, 0.7)
end

function module:PolarityShiftCast()
	self:RemoveBar(L["bar_polarityShiftCd"])
	self:Message(L["msg_polarityShift"], "Important", false, nil, false)
	self:Bar(L["bar_polarityShiftCast"], timer.polarityShiftCast, icon.polarityShift, true, color.polarityShiftCast)
end

function module:PolarityShift()
	self:RegisterEvent("PLAYER_AURAS_CHANGED")
	self:Bar(L["bar_polarityShiftCd"], timer.polarityShiftCd, icon.polarityShift, true, color.polarityShiftCd)
end

function module:PLAYER_AURAS_CHANGED(msg)
	local chargetype = nil
	local iIterator = 1
	while UnitDebuff("Player", iIterator) do
		local texture, applications = UnitDebuff("Player", iIterator)
		if texture == "Interface\\Icons\\Spell_ChargePositive" or texture == "Interface\\Icons\\Spell_ChargeNegative" then
			if applications > 1 then
				return
			end
			chargetype = texture
		end
		iIterator = iIterator + 1
	end
	if not chargetype then return end
	self:UnregisterEvent("PLAYER_AURAS_CHANGED")
	if self.db.profile.selfcharge then
		self:NewPolarity(chargetype)
	end
end

function module:NewPolarity(chargetype)
	if self.previousCharge and self.previousCharge == chargetype then
		self:Message(L["msg_noChange"], "Urgent", false, nil, false)
		self:Sound("Long")
	
	elseif chargetype == "Interface\\Icons\\Spell_ChargePositive" then
		self:Message(L["msg_changeToPositive"], "Positive", false, nil, false)
		self:Sound("RunAway")
		self:Bar(L["bar_polarityTick"], timer.polarityTick, icon.positive, true, color.positive)
		self:WarningSign(icon.positive, 5)
	
	elseif chargetype == "Interface\\Icons\\Spell_ChargeNegative" then
		self:Message(L["msg_changeToNegative"], "Important", false, nil, false)
		self:Sound("RunAway")
		self:Bar(L["bar_polarityTick"], timer.polarityTick, icon.negative, true, color.negative)
		self:WarningSign(icon.negative, 5)
	end
		
	self.previousCharge = chargetype
end
