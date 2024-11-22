assert( BigWigs, "BigWigs not found!")

--[[

created by Vnm-Kronos (https://github.com/Vnm-Kronos)
improved by Dorann (https://github.com/xorann)

Allows you to start a pull timer.

Usage:
/pull 				starts a 6s pull timer
/pull <duration>	starts a custom pull timer. "/pull 7" starts a 7s pull timer.

--]]


-----------------------------------------------------------------------
--      Are you local?
-----------------------------------------------------------------------

local L = AceLibrary("AceLocale-2.2"):new("BigWigsPulltimer")

local timer = {
	pulltimer = 0,
}
local syncName = {
	pulltimer = "PulltimerSync",
	stoppulltimer = "PulltimerStopSync",
}
local icon = {
	pulltimer = "RACIAL_ORC_BERSERKERSTRENGTH",
}

-----------------------------------------------------------------------
--      Localization
-----------------------------------------------------------------------

L:RegisterTranslations("enUS", function() return {
	["Pull Timer"] = true,

	["pulltimer"] = true,
	["Options for Pull Timer"] = true,
	-- pullstart_message = "Pull in %d sec. (Sent by %s)",
	-- pullstop_message = "Pull aborted (Sent by %s)",
	-- pull1_message = "Pull in 1",
	-- pull2_message = "Pull in 2",
	-- pull3_message = "Pull in 3",
	-- pull4_message = "Pull in 4",
	-- pull5_message = "Pull in 5",
	-- pull0_message = "Pull!",

	["Pull"] = true,
	["pull"] = true,
	["You have to be the raid leader or an assistant"] = true,

	["Enable"] = true,
	["Enable pulltimer."] = true,

	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	["Pull Timer"] = "开怪计时",
	
	["pulltimer"] = "开怪计时",
	["Options for Pull Timer"] = "开怪计时设置",
	pullstart_message = "准备开怪,倒计时开始! %d 秒. (由 %s 发送)",
	pullstop_message = "开怪停止 (由 %s 发送)",
	pull1_message = "准备开怪 1",
	pull2_message = "准备开怪 2",
	pull3_message = "准备开怪 3",
	pull4_message = "准备开怪 4",
	pull5_message = "准备开怪 5",
	pull0_message = "开怪!",
	
	-- ["Pull"] = "开怪",
	-- ["pull"] = "开怪",
	["You have to be the raid leader or an assistant"] = "需要助理或更高权限",
	
	["Enable"] = "启用",
	["Enable pulltimer."] = "启用开怪计时",
} end )

L:RegisterTranslations("esES", function() return {
	["Pull Timer"] = "Temporizador de Tirar",

	--["pulltimer"] = true,
	["Options for Pull Timer"] = "Opciones para Temporizador de Tirar",
	pullstart_message = "Tira en %d seg. (Enviado por %s)",
	pullstop_message = "Tira abortado (Enviado por %s)",
	pull1_message = "Tira en 1",
	pull2_message = "Tira en 2",
	pull3_message = "Tira en 3",
	pull4_message = "Tira en 4",
	pull5_message = "Tira en 5",
	pull0_message = "¡Tira!",

	--["Pull"] = true,
	--["pull"] = true,
	["You have to be the raid leader or an assistant"] = "Tienes que ser líder o asistente para hacerlo",

	["Enable"] = "Activar",
	["Enable pulltimer."] = "Activar Temporizador de Tirar",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	["Pull Timer"] = "开怪计时",
	
	["pulltimer"] = "开怪计时",
	["Options for Pull Timer"] = "开怪计时设置",
	pullstart_message = "准备开怪,倒计时开始! %d 秒. (由 %s 发送)",
	pullstop_message = "开怪停止 (由 %s 发送)",
	pull1_message = "准备开怪 1",
	pull2_message = "准备开怪 2",
	pull3_message = "准备开怪 3",
	pull4_message = "准备开怪 4",
	pull5_message = "准备开怪 5",
	pull0_message = "开怪!",
	
	["Pull"] = "开怪",
	["pull"] = "开怪",
	["You have to be the raid leader or an assistant"] = "需要助理或更高权限",
	
	["Enable"] = "启用",
	["Enable pulltimer."] = "启用开怪计时",
} end )

-----------------------------------------------------------------------
--      Module Declaration
-----------------------------------------------------------------------

BigWigsPulltimer = BigWigs:NewModule(L["Pull Timer"], "AceConsole-2.0")
BigWigsPulltimer.revision = 20001
BigWigsPulltimer.defaultDB = {
	enable = true,
}
BigWigsPulltimer.consoleCmd = L["pulltimer"]
BigWigsPulltimer.consoleOptions = {
	type = "group",
	name = L["Pull Timer"],
	desc = L["Options for Pull Timer"],
	args = {
		enable = {
			type = "toggle",
			name = L["Enable"],
			desc = L["Enable pulltimer."],
			order = 1,
			get = function() return BigWigsPulltimer.db.profile.enable end,
			set = function(v) BigWigsPulltimer.db.profile.enable = v end,
		},
	},
}

-----------------------------------------------------------------------
--      Initialization
-----------------------------------------------------------------------
-- For easy use in macros.
local function BWPT(seconds)
	if tonumber(seconds) then
		seconds = tonumber(seconds)
	else
		seconds = 0
	end
	BigWigsPulltimer:BigWigs_PullCommand(seconds)
end

function BigWigsPulltimer:OnRegister()
--[[self:RegisterChatCommand({ L["slashpull_cmd"] }, {
type = "group",
args = {
pull = {
type = "text", name = L["slashpull2_cmd"],
desc = L["slashpull2_desc"],
set = function(v) self:BigWigs_PullCommand(v) end,
get = false,
usage = L["<duration>"],
},
},
})]]

end

function BigWigsPulltimer:OnEnable()
	self:RegisterEvent("BigWigs_Pulltimer")
	self:RegisterEvent("BigWigs_PullCommand")
	self:RegisterEvent("BigWigs_RecvSync")
	self:ThrottleSync(0.5, syncName.pulltimer)


	if SlashCmdList then
		SlashCmdList["BWPT_SHORTHAND"] = BWPT
		setglobal("SLASH_BWPT_SHORTHAND1", "/"..L["pull"])
	end
end

function BigWigsPulltimer:OnSetup()
end

-----------------------------------------------------------------------
--      Event Handlers
-----------------------------------------------------------------------

-----------------------------------------------------------------------
--      Synchronization
-----------------------------------------------------------------------

function BigWigsPulltimer:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.pulltimer then
		self:BigWigs_Pulltimer(rest, nick)
	end
	if sync == syncName.stoppulltimer then
		self:BigWigs_StopPulltimer()

		self:Message(string.format(L["pullstop_message"], nick), "Attention", false)
		PlaySound("igQuestFailed")
	end
end

-----------------------------------------------------------------------
--      Utility
-----------------------------------------------------------------------

function BigWigsPulltimer:BigWigs_PullCommand(msg)
	if (IsRaidLeader() or IsRaidOfficer()) then
		if tonumber(msg) then
			timer.pulltimer = tonumber(msg)
		else
			self:Sync(syncName.stoppulltimer)
			return
		end

		if  timer.pulltimer == 0 then
			-- stop pull timer if it is already running
			local registered, time, elapsed, running = self:BarStatus(L["Pull"])
			if running then
				self:Sync(syncName.stoppulltimer)
				return
				-- otherwise start a 6s pull timer
			else
				timer.pulltimer = 6
			end
		elseif ((timer.pulltimer > 63) or (timer.pulltimer < 1))  then
			return
		end

		self:Sync(syncName.pulltimer.." "..timer.pulltimer)
	else
		self:Print(L["You have to be the raid leader or an assistant"])
	end
end

function BigWigsPulltimer:BigWigs_StopPulltimer()
	self:TriggerEvent("BigWigs_StopBar", self, L["Pull"])
	self:CancelDelayedSound("One")
	self:CancelDelayedSound("Two")
	self:CancelDelayedSound("Three")
	self:CancelDelayedSound("Four")
	self:CancelDelayedSound("Five")
	self:CancelDelayedMessage(L["pull0_message"])
	self:CancelDelayedMessage(L["pull1_message"])
	self:CancelDelayedMessage(L["pull2_message"])
	self:CancelDelayedMessage(L["pull3_message"])
	self:CancelDelayedMessage(L["pull4_message"])
	self:CancelDelayedMessage(L["pull5_message"])
end

function BigWigsPulltimer:BigWigs_Pulltimer(duration, requester)
	--cancel events from an ongoing pull timer in case a new one is initiated
	self:BigWigs_StopPulltimer()

	if tonumber(duration) then
		timer.pulltimer = tonumber(duration)
	else
		return
	end

	self:Message(string.format(L["pullstart_message"], timer.pulltimer, requester), "Attention", false, "RaidAlert")
	self:Bar(L["Pull"], timer.pulltimer, icon.pulltimer)

	--self:DelayedSound(timer.pulltimer, "Warning")
	self:DelayedMessage(timer.pulltimer, L["pull0_message"], "Important", false, "Warning")
	self:DelayedSound(timer.pulltimer - 1, "One")
	self:DelayedMessage(timer.pulltimer - 1, L["pull1_message"], "Attention", false, false, true)
	if not (timer.pulltimer < 2.2) then
		self:DelayedSound(timer.pulltimer - 2, "Two")
		self:DelayedMessage(timer.pulltimer - 2, L["pull2_message"], "Attention", false, false, true)
	end
	if not (timer.pulltimer < 3.2) then
		self:DelayedSound(timer.pulltimer - 3, "Three")
		self:DelayedMessage(timer.pulltimer - 3, L["pull3_message"], "Attention", false, false, true)
	end
	if not (timer.pulltimer < 4.2) then
		self:DelayedSound(timer.pulltimer - 4, "Four")
		self:DelayedMessage(timer.pulltimer - 4, L["pull4_message"], "Attention", false, false, true)
	end
	if not (timer.pulltimer < 5.2) then
		self:DelayedSound(timer.pulltimer - 5, "Five")
		self:DelayedMessage(timer.pulltimer - 5, L["pull5_message"], "Attention", false, false, true)
	end
end
