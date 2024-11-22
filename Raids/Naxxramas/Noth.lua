
local module, L = BigWigs:ModuleDeclaration("Noth the Plaguebringer", "Naxxramas")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30017
module.enabletrigger = module.translatedName
module.toggleoptions = {"blink", "teleport", "curse", "cripple", -1, "wave", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Noth",

    blink_cmd = "blink",
    blink_name = "闪现警报",
    blink_desc = "闪现时进行警告",

    teleport_cmd = "teleport",
    teleport_name = "传送警报",
    teleport_desc = "传送时进行警告",

    curse_cmd = "curse",
    curse_name = "诅咒警报",
    curse_desc = "诅咒时进行警告",
    
    cripple_cmd = "cripple",
    cripple_name = "残废术警报",
    cripple_desc = "残废术生效时进行警告",
    
    wave_cmd = "wave",
    wave_name = "波浪警报",
    wave_desc = "波浪来袭时进行警告",

	trigger_start1 = "Die, trespasser!",
	trigger_start2 = "Glory to the master!",
	trigger_start3 = "Your life is forfeit!",
	
	trigger_curse1 = "afflicted by Curse of the Plaguebringer",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_curse2 = "Curse of the Plaguebringer was resisted",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_curse = "诅咒！",
    bar_curse = "诅咒冷却",
	
	trigger_cripple1 = "is afflicted by Cripple",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_cripple2 = "Cripple was resisted",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_cripple = "残废术！",
    bar_cripple = "残废术冷却",
	
	trigger_blink = "Noth the Plaguebringer gains Blink.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_blink = "闪现！",
    bar_blink = "闪现冷却",
	
	trigger_add = "Rise, my soldiers! Rise and fight once more!",
    bar_roomWave = "3个被感染的战士",
	
    bar_wave1 = "第1波",
    bar_wave2 = "第2波",
	
    msg_tpToBalcony = "传送！他在阳台上！",
    msg_tpToRoom = "回到房间中！",
    bar_teleport = "传送",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Noth",

    blink_cmd = "blink",
    blink_name = "闪现警报",
    blink_desc = "闪现时进行警告",

    teleport_cmd = "teleport",
    teleport_name = "传送警报",
    teleport_desc = "传送时进行警告",

    curse_cmd = "curse",
    curse_name = "诅咒警报",
    curse_desc = "诅咒时进行警告",
    
    cripple_cmd = "cripple",
    cripple_name = "残废术警报",
    cripple_desc = "残废术生效时进行警告",
    
    wave_cmd = "wave",
    wave_name = "小怪警报",
    wave_desc = "小怪来袭时进行警告",

	trigger_start1 = "Die, trespasser!",
	trigger_start2 = "Glory to the master!",
	trigger_start3 = "Your life is forfeit!",
	
	trigger_curse1 = "受到了瘟疫使者的诅咒效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_curse2 = "瘟疫使者的诅咒效果从你身上消失了。",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_curse = "诅咒！",
    bar_curse = "诅咒冷却",
	
	trigger_cripple1 = "受到了残废术效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_cripple2 = "残废术效果从你身上消失了。",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_cripple = "残废术！",
    bar_cripple = "残废术冷却",
	
	trigger_blink = "瘟疫者诺斯获得了闪现术的效果。",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_blink = "闪现！",
    bar_blink = "闪现冷却",
	
	trigger_add = "起来吧，我的士兵们！奋起再战！",
    bar_roomWave = "3个被感染的战士",
	
    bar_wave1 = "第1波",
    bar_wave2 = "第2波",
	
    msg_tpToBalcony = "传送！他在阳台上！",
    msg_tpToRoom = "回到房间中！",
    bar_teleport = "传送",
} end )

local timer = {
	firstCurse = {8,12},
	curseAfterTeleport = {2,10},
	curse = {50,60},
	
	firstCripple = {30,40},
	crippleAfterTeleport = {2,10},--5
	cripple = {30,40},
	
	firstBlink = {30,40},
	regularBlink = {30,40},
	blinkAfterTeleport = {2,10},

	firstRoom = 90,
	secondRoom = 110,
	thirdRoom = 180,
	room = 0, -- will be changed during the encounter

	firstBalcony = 70,
	secondBalcony = 95,
	thirdBalcony = 120, -- ??
	balcony = 0, -- will be changed during the encounter

	wave1 = {5,7},
	wave2_1 = {30,37},
	wave2_2 = {49,56},
	wave2_3 = {62,69},
	wave2 = 0,

	firstWarriorWave = 10,
	waveAfterTeleport = 10,
	nextWarriorWave = 30
}
local icon = {
	curse = "Spell_Shadow_AnimateDead",
	cripple = "Spell_Shadow_Cripple",
	blink = "Spell_Arcane_Blink",
	add = "ability_warrior_cleave",
	teleport = "Spell_Magic_LesserInvisibilty",
	wave = "Spell_ChargePositive"
}
local syncName = {
	curse = "NothCurse"..module.revision,
	cripple = "NothCripple"..module.revision,
	blink = "NothBlink"..module.revision,
	nextRoomWave = "NothRoomWave"..module.revision
}

local balconyPhase = 0
local bossPos = ''
bwTimeInRoom = 0

module:RegisterYellEngage(L["trigger_start1"])
module:RegisterYellEngage(L["trigger_start2"])
module:RegisterYellEngage(L["trigger_start3"])

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--Cripple, Curse
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--Cripple, Curse
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--Cripple, Curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--Cripple, Curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--Cripple, Curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--Cripple, Curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--Blink
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL", "Event")--nextWave

	self:ThrottleSync(5, syncName.blink)
	self:ThrottleSync(5, syncName.curse)
	self:ThrottleSync(5, syncName.cripple)
	self:ThrottleSync(5, syncName.nextRoomWave)
end

function module:OnSetup()
	timer.room = timer.firstRoom
	timer.balcony = timer.firstBalcony
	timer.wave2 = timer.wave2_1
end

function module:OnEngage()
	if self.db.profile.curse then
		self:IntervalBar(L["bar_curse"], timer.firstCurse[1], timer.firstCurse[2], icon.curse, true, "Red")
	end
	if self.db.profile.cripple then
		self:IntervalBar(L["bar_cripple"], timer.firstCripple[1], timer.firstCripple[2], icon.cripple, true, "Cyan")
	end
	if self.db.profile.blink then
		self:IntervalBar(L["bar_blink"], timer.firstBlink[1], timer.firstBlink[2], icon.blink, true, "Blue")
	end
	if self.db.profile.teleport then
		self:Bar(L["bar_teleport"], timer.room, icon.teleport, true, "White")
	end
	if self.db.profile.wave then
		self:Bar(L["bar_roomWave"], timer.firstWarriorWave, icon.add, true, "Black")
	end

	balconyPhase = 0
	bossPos = 'floor'
	bwTimeInRoom = GetTime()
	
	self:ScheduleEvent("bwnothtobalcony", self.TeleportToBalcony, timer.room, self)
end

function module:OnDisengage()
end

function module:Event(msg)
	if string.find(msg, L["trigger_curse1"]) or string.find(msg, L["trigger_curse2"]) then
		self:Sync(syncName.curse)
	elseif string.find(msg, L["trigger_cripple1"]) or string.find(msg, L["trigger_cripple2"]) then
		self:Sync(syncName.cripple)
	elseif msg == L["trigger_blink"] then
		self:Sync(syncName.blink)
	elseif msg == L["trigger_add"] and bossPos == 'floor' then
		self:Sync(syncName.nextRoomWave)
	end
end




function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.curse and self.db.profile.curse then
		self:Curse()
	elseif sync == syncName.cripple and self.db.profile.cripple then
		self:Cripple()
	elseif sync == syncName.blink and self.db.profile.blink then
		self:Blink()
	elseif sync == syncName.nextRoomWave and self.db.profile.wave then
		self:NextRoomWave()
	end
end




function module:Curse()
	self:RemoveBar(L["bar_curse"])
	if GetTime() < (bwTimeInRoom + timer.room - timer.curse[1]) then
		self:IntervalBar(L["bar_curse"], timer.curse[1], timer.curse[2], icon.curse, true, "Red")
	end
	
	if UnitClass("Player") == BC["Mage"] or UnitClass("Player") == BC["Druid"] then
		self:WarningSign(icon.curse, 0.7)
		self:Message(L["msg_curse"], "Important", nil, "Beware")
	end
end

function module:Cripple()
	self:RemoveBar(L["bar_cripple"])
	if GetTime() < (bwTimeInRoom + timer.room - timer.cripple[1]) then
		self:IntervalBar(L["bar_cripple"], timer.cripple[1], timer.cripple[2], icon.cripple, true, "Cyan")
	end
	
	if UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Priest"] then
		self:WarningSign(icon.cripple, 0.7)
		self:Message(L["msg_cripple"], "Important", nil, "Beware")
	end
end

function module:Blink()
	self:RemoveBar(L["bar_blink"])
	self:Message(L["msg_blink"], "Important")
	if GetTime() < (bwTimeInRoom + timer.room - timer.regularBlink[1]) then
		self:IntervalBar(L["bar_blink"], timer.regularBlink[1], timer.regularBlink[2], icon.blink, true, "Blue")
	end
end

function module:NextRoomWave()
	self:RemoveBar(L["bar_roomWave"])
	if GetTime() < (bwTimeInRoom + timer.room - timer.nextWarriorWave) then
		self:Bar(L["bar_roomWave"], timer.nextWarriorWave, icon.add, true, "Black")
	end
end


function module:TeleportToBalcony()
	balconyPhase = balconyPhase + 1
	bossPos = 'balcony'
	-- 1 4 champions
	-- 2 4 champions 2 guardians
	-- 3 4 champions 2 guardians 3 constructs
	local waveText = ' - 4 Champions'
	if balconyPhase == 2 then
		waveText = ' - 4 Ch 2 Guardians'
	end
	if balconyPhase == 3 then
		waveText = ' - 4 Ch 2 Gu 3 Constructs'
	end

	self:CancelScheduledEvent("bwnothtobalcony")
	self:RemoveBar(L["bar_curse"])
	self:RemoveBar(L["bar_cripple"])
	self:RemoveBar(L["bar_blink"])
	self:RemoveBar(L["bar_roomWave"])
	
	if timer.room == timer.firstRoom then
		timer.room = timer.secondRoom
	elseif timer.room == timer.secondRoom then
		timer.room = timer.thirdRoom
	end

	if self.db.profile.teleport then
		self:Message(L["msg_tpToBalcony"], "Important")
		self:Bar(L["bar_teleport"], timer.balcony, icon.teleport, true, "White")
	end
	if self.db.profile.wave then
		self:IntervalBar(L["bar_wave1"] .. waveText, timer.wave1[1], timer.wave1[2], icon.wave, true, "Black")
		self:IntervalBar(L["bar_wave2"] .. waveText, timer.wave2[1], timer.wave2[2], icon.wave, true, "Black")
	end
	self:ScheduleEvent("bwnothtoroom", self.TeleportToRoom, timer.balcony, self)
end

function module:TeleportToRoom()
	bwTimeInRoom = GetTime()
	bossPos = 'floor'

	self:CancelScheduledEvent("bwnothtoroom")
	if timer.balcony == timer.firstBalcony then
		timer.balcony = timer.secondBalcony
		timer.wave2 = timer.wave2_2
	elseif timer.balcony == timer.secondBalcony then
		timer.balcony = timer.thirdBalcony
		timer.wave2 = timer.wave2_3
	end

	if self.db.profile.curse then
		self:IntervalBar(L["bar_curse"], timer.curseAfterTeleport[1], timer.curseAfterTeleport[2], icon.curse, true, "Red")
	end
	if self.db.profile.cripple then
		self:IntervalBar(L["bar_cripple"], timer.crippleAfterTeleport[1], timer.crippleAfterTeleport[2], icon.cripple, true, "Cyan")
	end
	if self.db.profile.blink then
		self:IntervalBar(L["bar_blink"], timer.blinkAfterTeleport[1], timer.blinkAfterTeleport[2], icon.blink, true, "Blue")
	end
	if self.db.profile.wave then
		self:Bar(L["bar_roomWave"], timer.waveAfterTeleport, icon.add, true, "Black")
	end
	if self.db.profile.teleport then
		self:Message(string.format(L["msg_tpToRoom"], timer.room), "Important")
		self:Bar(L["bar_teleport"], timer.room, icon.teleport, true, "White")
	end
	self:ScheduleEvent("bwnothtobalcony", self.TeleportToBalcony, timer.room, self)
end
