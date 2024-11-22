
local module, L = BigWigs:ModuleDeclaration("Solakar Flamewreath", "Blackrock Spire")
local hatcher = AceLibrary("Babble-Boss-2.2")["Rookery Hatcher"]
local guardian = AceLibrary("Babble-Boss-2.2")["Rookery Guardian"]

module.revision = 30025
module.enabletrigger = {module.translatedName, hatcher, guardian}
module.toggleoptions = {"waves", "warstomp", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Blackrock Spire"],
	AceLibrary("Babble-Zone-2.2")["Blackrock Spire"],
}

L:RegisterTranslations("enUS", function() return {
	cmd = "Solakar",
	
	waves_cmd = "waves",
    waves_name = "波次",
    waves_desc = "波次警告。",
	
	warstomp_cmd = "warstomp",
    warstomp_name = "战争践踏",
    warstomp_desc = "战争践踏出现时进行警告",
		
	trigger_warstomp = "Solakar Flamewreath's War Stomp",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_warstomp = "眩晕！",
	
	trigger_engage = "Intruders are destroying our eggs!  Stop!!",--CHAT_MSG_MONSTER_YELL
	
    msg_wave1 = "波次 1/5 -- 2 孵化者 / 守护者",
    bar_timeToWave2 = "波次 2/5 出现",
	
    msg_wave2 = "波次 2/5 -- 2 孵化者 / 守护者",
    bar_timeToWave3 = "波次 3/5 出现",
	
    msg_wave3 = "波次 3/5 -- 2 孵化者 / 守护者",
    bar_timeToWave4 = "波次 4/5 出现",
	
    msg_wave4 = "波次 4/5 -- 2 孵化者 / 守护者",
    bar_timeToWave5 = "波次 5/5 出现",
	
    msg_wave5 = "波次 5/5 -- 2 孵化者 / 守护者",
    bar_timeToBoss = "索拉卡·火冠出现",
	
	trigger_bossSpawn = "I am here! Now, puny little worms, you will pay for your intrusion!",--CHAT_MSG_MONSTER_YELL
    msg_bossSpawn = "索拉卡·火冠出现了！",
    z_nightmareillusion = "The Rookery",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	cmd = "Solakar",
	
	waves_cmd = "waves",
    waves_name = "波次",
    waves_desc = "波次警告。",
	
	warstomp_cmd = "warstomp",
    warstomp_name = "战争践踏",
    warstomp_desc = "战争践踏出现时进行警告",
		
	trigger_warstomp = "Solakar Flamewreath's War Stomp",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    bar_warstomp = "眩晕！",
	
	trigger_engage = "Intruders are destroying our eggs!  Stop!!",--CHAT_MSG_MONSTER_YELL
	
    msg_wave1 = "波次 1/5 -- 2 孵化者 / 守护者",
    bar_timeToWave2 = "波次 2/5 出现",
	
    msg_wave2 = "波次 2/5 -- 2 孵化者 / 守护者",
    bar_timeToWave3 = "波次 3/5 出现",
	
    msg_wave3 = "波次 3/5 -- 2 孵化者 / 守护者",
    bar_timeToWave4 = "波次 4/5 出现",
	
    msg_wave4 = "波次 4/5 -- 2 孵化者 / 守护者",
    bar_timeToWave5 = "波次 5/5 出现",
	
    msg_wave5 = "波次 5/5 -- 2 孵化者 / 守护者",
    bar_timeToBoss = "索拉卡·火冠出现",
	
	trigger_bossSpawn = "I am here! Now, puny little worms, you will pay for your intrusion!",--CHAT_MSG_MONSTER_YELL
    msg_bossSpawn = "索拉卡·火冠出现了！",
    z_nightmareillusion = "孵化间",
} end )

local timer = {
	timeToWave2 = 40,--need more data
	timeToWave3 = 40,--80sec from start
	timeToWave4 = 35,--115sec from start
	timeToWave5 = 40,--155sec from start
	timeToBoss = 40,--195sec from start
	warstomp = 5,
}
local icon = {
	waves = "Inv_Misc_Pocketwatch_01",
	warstomp = "ability_bullrush",
}
local syncName = {
	bossSpawn = "solakarBossSpawn"..module.revision,
	warstomp = "solakarWarstomp"..module.revision,
}
local color = {
	waves = "White",
	warstomp = "Black",
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--debug

	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_warstomp
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_warstomp
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_warstomp

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")--trigger_engage, trigger_bossNext

	self:ThrottleSync(2, syncName.bossSpawn)
	self:ThrottleSync(6, syncName.warstomp)
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
	self:Message(L["msg_wave1"])
	self:Bar(L["bar_timeToWave2"], timer.timeToWave2, icon.waves, true, color.waves)
	
	--timeToWave2
	self:DelayedMessage(40, L["msg_wave2"])
	self:DelayedBar(40, L["bar_timeToWave3"], timer.timeToWave3, icon.waves, true, color.waves)
	
	--timeToWave2 + timeToWave3
	self:DelayedMessage(80, L["msg_wave3"])
	self:DelayedBar(80, L["bar_timeToWave4"], timer.timeToWave4, icon.waves, true, color.waves)
	
	--timeToWave2 + timeToWave3 + timeToWave4
	self:DelayedMessage(115, L["msg_wave4"])
	self:DelayedBar(115, L["bar_timeToWave5"], timer.timeToWave5, icon.waves, true, color.waves)
	
	--timeToWave2 + timeToWave3 + timeToWave4 + timeToWave5
	self:DelayedMessage(155, L["msg_wave5"])
	self:DelayedBar(155, L["bar_timeToBoss"], timer.timeToBoss, icon.waves, true, color.waves)
end

function module:OnDisengage()
end

function module:CheckForWipe()
end

function module:OnRegister()
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end
function module:MINIMAP_ZONE_CHANGED(msg)
	if GetMinimapZoneText() ~= L["z_nightmareillusion"] or self.core:IsModuleActive(module.translatedName) then
		return
	end

	self.core:EnableModule(module.translatedName)
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if string.find(msg, L["trigger_engage"]) then
		module:SendEngageSync()
		
	elseif msg == L["trigger_bossSpawn"] then
		self:Sync(syncName.bossSpawn)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)
end

function module:Event(msg)
	if string.find(msg, L["trigger_warstomp"]) then
		self:Sync(syncName.warstomp)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.bossSpawn then
		self:BossSpawn()
	
	elseif sync == syncName.warstomp and self.db.profile.warstomp then
		self:Warstomp()
	end
end


function module:BossSpawn()
	self:CancelDelayedMessage(L["msg_wave2"])
	self:CancelDelayedMessage(L["msg_wave3"])
	self:CancelDelayedMessage(L["msg_wave4"])
	self:CancelDelayedMessage(L["msg_wave5"])
	
	self:CancelDelayedBar(L["bar_timeToWave3"])
	self:CancelDelayedBar(L["bar_timeToWave4"])
	self:CancelDelayedBar(L["bar_timeToWave5"])
	self:CancelDelayedBar(L["bar_timeToBoss"])
	
	self:RemoveBar(L["bar_timeToWave2"])
	self:RemoveBar(L["bar_timeToWave3"])
	self:RemoveBar(L["bar_timeToWave4"])
	self:RemoveBar(L["bar_timeToWave5"])
	self:RemoveBar(L["bar_timeToBoss"])
	
	self:Message(L["msg_bossSpawn"], "Urgent", false, nil, false)
end

function module:Warstomp()
	self:Bar(L["bar_warstomp"], timer.warstomp, icon.warstomp, true, color.warstomp)
end
