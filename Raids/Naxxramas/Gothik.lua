
local module, L = BigWigs:ModuleDeclaration("Gothik the Harvester", "Naxxramas")
local bzeasternplaguelands = AceLibrary("Babble-Zone-2.2")["Eastern Plaguelands"]
local bbdeathknightcavalier = AceLibrary("Babble-Boss-2.2")["Deathknight Cavalier"]

module.revision = 30084
module.enabletrigger = module.translatedName
module.toggleoptions = {"room", -1, "add", "adddeath", "bosskill"}
module.wipemobs = {
	"Unrelenting Rider",
	"Unrelenting Deathknight",
	"Unrelenting Trainee",
	"Spectral Rider",
	"Spectral Deathknight",
	"Spectral Trainee",
}

L:RegisterTranslations("enUS", function() return {
	cmd = "Gothik",

	room_cmd = "room",
    room_name = "房间到达警报",
    room_desc = "戈提克传送到房间时进行警告",

	add_cmd = "add",
    add_name = "小怪刷新警报",
    add_desc = "小怪刷新时进行警告",

	adddeath_cmd = "adddeath",
    adddeath_name = "小怪死亡警报",
    adddeath_desc = "小怪死亡时进行警告",


	trigger_engage = "Brazenly you have disregarded powers beyond your understanding.",
	trigger_bossDead = "I... am... undone.",
	
	name_trainee = "Unrelenting Trainee",
	name_traineeSpectral = "Spectral Trainee",
    bar_trainee = "训练师 - ",
    msg_traineeSoon = "3秒后出现11个训练师",
	
	name_deathKnight = "Unrelenting Deathknight",
	name_deathKnightSpectral = "Spectral Deathknight",
    bar_dk = "死亡骑士 - ",
    msg_dkSoon = "3秒后出现7个死亡骑士",
    msg_dkDead = "死亡骑士已死！",
	
	name_rider = "Unrelenting Rider",
	name_riderSpectral = "Spectral Rider",
    bar_rider = "骑兵 - ",
    msg_riderSoon = "3秒后出现4个骑兵",
    msg_riderDead = "骑兵已死！",
	
	trigger_inRoom = "I have waited long enough! Now, you face the harvester of souls!",
    bar_inRoom = "进入房间",
    msg_inRoom = "收割者戈提克传送到战场中！",
    msg_inRoom10 = "10秒后戈提克即将到来",
	
    msg_gateOpen = "中央大门打开！",
    c_unrelentingrider = "Unrelenting Rider",
    c_unrelentingdeathknight = "Unrelenting Deathknight",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Gothik",

    room_cmd = "room",
    room_name = "房间到达警报",
    room_desc = "戈提克传送到房间时进行警告",

    add_cmd = "add",
    add_name = "小怪刷新警报",
    add_desc = "小怪刷新时进行警告",

    adddeath_cmd = "adddeath",
    adddeath_name = "小怪死亡警报",
    adddeath_desc = "小怪死亡时进行警告",


    trigger_engage = "你公然无视超出你理解范围的力量",
    trigger_bossDead = "完蛋了！",
    
    name_trainee = "无情的训练师",
    name_traineeSpectral = "鬼灵训练师",
    bar_trainee = "训练师 - ",
    msg_traineeSoon = "3秒后出现11个训练师",
    
    name_deathKnight = "无情的死亡骑士",
    name_deathKnightSpectral = "鬼灵死亡骑士",
    bar_dk = "死亡骑士 - ",
    msg_dkSoon = "3秒后出现7个死亡骑士",
    msg_dkDead = "死亡骑士已死！",
    
    name_rider = "无情的骑兵",
    name_riderSpectral = "鬼灵骑兵",
    bar_rider = "骑兵 - ",
    msg_riderSoon = "3秒后出现4个骑兵",
    msg_riderDead = "骑兵已死！",
    
    trigger_inRoom = "我已经等够久了",
    bar_inRoom = "进入房间",
    msg_inRoom = "收割者戈提克传送到战场中！",
    msg_inRoom10 = "10秒后戈提克即将到来",
    
    msg_gateOpen = "中央大门打开！",
    c_unrelentingrider = "无情的骑兵",
    c_unrelentingdeathknight = "无情的死亡骑士",
} end )

local timer = {
	inroom = 274, --4:34
	
	firstTrainee = 24,
	trainee = 20,
	
	firstDeathknight = 74, --1:14
	deathknight = 25,
	
	firstRider = 134, --2:14
	rider = 30,
}
local icon = {
	inroom = "Spell_Magic_LesserInvisibilty",
	trainee = "Ability_Seal",
	deathknight = "INV_Boots_Plate_08",
	rider = "Spell_Shadow_DeathPact",
}
local color = {
	inroom = "White",
	trainee = "Green",
	deathknight = "Yellow",
	rider = "Red",
}
local syncName = {
	inRoom = "GothikInRoom"..module.revision,
	gateOpen = "GothikGateOpen"..module.revision,
}

local numTrainees = 1
local numDeathknights = 1
local numRiders = 1
local gateOpen = nil

function module:OnRegister()
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
	
	self:RegisterEvent("UNIT_HEALTH")
	
	self:ThrottleSync(10, syncName.inRoom)
	self:ThrottleSync(10, syncName.gateOpen)
end

function module:OnSetup()
	self.started = nil
	
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
	if self.core:IsModuleActive(bbdeathknightcavalier, "Naxxramas") then self.core:DisableModule(bbdeathknightcavalier, "Naxxramas") end
	
	numTrainees = 1
	numDeathknights = 1
	numRiders = 1
	
	if self.db.profile.room then
		self:Bar(L["bar_inRoom"], timer.inroom, icon.inroom, true, color.inroom)
		
		self:DelayedMessage(timer.inroom - 10, L["msg_inRoom10"], "Important", false, nil, false)
	end

	if self.db.profile.add then
		self:Bar(L["bar_trainee"]..numTrainees, timer.firstTrainee, icon.trainee, true, color.trainee)
		self:Bar(L["bar_dk"]..numDeathknights, timer.firstDeathknight, icon.deathknight, true, color.deathknight)
		self:Bar(L["bar_rider"]..numRiders, timer.firstRider, icon.rider, true, color.rider)
		
		self:DelayedMessage(timer.firstTrainee - 3, numTrainees..L["msg_traineeSoon"], "Attention", false, nil, false)
		self:DelayedMessage(timer.firstDeathknight - 3, numDeathknights..L["msg_dkSoon"], "Urgent", false, nil, false)
		self:DelayedMessage(timer.firstRider - 3, numRiders..L["msg_riderSoon"], "Important", false, nil, false)

		self:ScheduleEvent("GothikTraineeRepop1", self.Trainee, timer.firstTrainee, self)
		self:ScheduleEvent("GothikDkRepop1", self.DeathKnight, timer.firstDeathknight, self)
		self:ScheduleEvent("GothikRiderRepop1", self.Rider, timer.firstRider, self)
	end
end

function module:OnDisengage()
end

function module:MINIMAP_ZONE_CHANGED(msg)
	if GetMinimapZoneText() == bzeasternplaguelands and self.core:IsModuleActive(module.translatedName) then
		self:TriggerEvent("BigWigs_RebootModule", module.translatedName)
		self:ResetModule()
		DEFAULT_CHAT_FRAME:AddMessage("|cff7fff7f   [BigWigs]|r - 自动重启模块："..module.translatedName)
	end
end

function module:ResetModule()
	numTrainees = 1
	numDeathknights = 1
	numRiders = 1
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == module.translatedName then
		local healthPct = UnitHealth(msg) * 100 / UnitHealthMax(msg)
		if healthPct <= 30 and gateOpen == nil then
			self:Sync(syncName.gateOpen)
			gateOpen = true
		elseif healthPct > 30 and gateOpen == true then
			gateOpen = nil
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()
		
	elseif msg == L["trigger_inRoom"] then
		self:Sync(syncName.inRoom)

	elseif string.find(msg, L["trigger_bossDead"]) then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if msg == string.format(UNITDIESOTHER, L["c_unrelentingrider"]) and self.db.profile.adddeath then
		self:Message(L["msg_riderDead"], "Important", false, nil, false)
	
	elseif msg == string.format(UNITDIESOTHER, L["c_unrelentingdeathknight"]) and self.db.profile.adddeath then
		self:Message(L["msg_dkDead"], "Important", false, nil, false)
	end
end

--[[--debug
function module:Event(msg)
	if msg == "engage" then
		module:SendEngageSync()
	end
	
end
]]

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.inRoom and self.db.profile.room then
		self:InRoom()
	elseif sync == syncName.gateOpen and self.db.profile.room then
		self:GateOpen()
	end
end


function module:InRoom()
	self:RemoveBar(L["bar_inRoom"])
	self:CancelDelayedMessage(L["msg_inRoom10"])
	
	self:ResetModule()
	
	--self:Message(L["msg_inRoom"], "Important", false, nil, false) --useless, there is already an in-game message
end

function module:GateOpen()
	--self:Message(L["msg_gateOpen"], "Important", false, nil, false) --useless, there is already an in-game message
end

function module:Trainee()
	if numTrainees == 1 then
		self:ScheduleRepeatingEvent("GothikTraineeRepop", self.Trainee, timer.trainee, self)
	end
	
	numTrainees = numTrainees + 1
	
	self:Bar(L["bar_trainee"]..numTrainees, timer.trainee, icon.trainee, true, color.trainee)
	self:DelayedMessage(timer.trainee - 3, numTrainees..L["msg_traineeSoon"], "Attention", false, nil, false)
	
	if numTrainees >= 11 then
		self:CancelScheduledEvent("GothikTraineeRepop")
	end
end

function module:DeathKnight()
	if numDeathknights == 1 then
		self:ScheduleRepeatingEvent("GothikDkRepop", self.DeathKnight, timer.deathknight, self)
	end
	
	numDeathknights = numDeathknights + 1
	
	self:Bar(L["bar_dk"]..numDeathknights, timer.deathknight, icon.deathknight, true, color.deathknight)
	self:DelayedMessage(timer.deathknight - 3, numDeathknights..L["msg_dkSoon"], "Urgent", false, nil, false)
	
	if numDeathknights >= 7 then
		self:CancelScheduledEvent("GothikDkRepop")
	end
end

function module:Rider()
	if numRiders == 1 then
		self:ScheduleRepeatingEvent("GothikRiderRepop", self.Rider, timer.rider, self)
	end
	
	numRiders = numRiders + 1
	
	self:Bar(L["bar_rider"]..numRiders, timer.rider, icon.rider, true, color.rider)
	self:DelayedMessage(timer.rider - 3, numRiders..L["msg_riderSoon"], "Important", false, nil, false)
	
	if numRiders >= 4 then
		self:CancelScheduledEvent("GothikRiderRepop")
	end
end
