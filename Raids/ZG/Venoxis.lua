
local module, L = BigWigs:ModuleDeclaration("High Priest Venoxis", "Zul'Gurub")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30077
module.enabletrigger = module.translatedName
module.wipemobs = {"Razzashi Cobra"}
module.toggleoptions = {"renew", "holyfire", "holywrath", "holynova", -1, "phase", -1, "poisoncloud", "venomspit", "enrage", "parasitic", -1, "adds", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Venoxis",

	renew_cmd = "renew",
    renew_name = "恢复警报",
    renew_desc = "恢复时进行警告",

	holyfire_cmd = "holyfire",
    holyfire_name = "神圣之火警报",
    holyfire_desc = "神圣之火时进行警告",
	
	holywrath_cmd = "holywrath",
    holywrath_name = "神圣愤怒警报",
    holywrath_desc = "神圣愤怒时进行警告",
	
	holynova_cmd = "holynova",
    holynova_name = "神圣新星警报",
    holynova_desc = "神圣新星时进行警告",
	
	phase_cmd = "phase",
    phase_name = "阶段变化警报",
    phase_desc = "蛇阶段时进行警告",
	
	poisoncloud_cmd = "poisoncloud",
    poisoncloud_name = "毒云警报",
    poisoncloud_desc = "毒云时进行警告",
	
	venomspit_cmd = "venomspit",
    venomspit_name = "喷毒警报",
    venomspit_desc = "喷毒时进行警告",
	
	enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒时进行警告",
	
	parasitic_cmd = "parasitic",
    parasitic_name = "寄生蛇警报",
    parasitic_desc = "寄生蛇时进行警告",
	
	adds_cmd = "adds",
    adds_name = "增援死亡警报",
    adds_desc = "增援死亡时进行警告",
	
	
	trigger_renew = "High Priest Venoxis gains Renew.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_renewFade = "Renew fades from High Priest Venoxis.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_renew = "恢复",
    msg_renew = "恢复 - 驱散！",
	
	trigger_holyFireCast = "High Priest Venoxis begins to cast Holy Fire.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	trigger_holyFireYou = "You are afflicted by Holy Fire.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_holyFireOther = "(.+) is afflicted by Holy Fire.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_holyFireFade = "Holy Fire fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_holyFireCast = "施放神圣之火！",
    bar_holyFireDur = " 神圣之火",
    msg_holyFire = "神圣之火 - 驱散！",
	
	trigger_holyWrath = "High Priest Venoxis's Holy Wrath", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_holyWrathCd = "神圣愤怒冷却",
	
	trigger_holyNova = "High Priest Venoxis's Holy Nova", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_holyNovaCd = "神圣新星冷却",
	
	trigger_phase2 = "Let the coils of hate unfurl!", --CHAT_MSG_MONSTER_YELL
    msg_phase2 = "第二阶段 - 避免毒云！",
	
	trigger_poisonCloudYou = "You are afflicted by Poison Cloud.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_poisonCloudYouFade = "Poison Cloud fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_poisonCloudYou = "远离毒云！",
	
	trigger_venomSpit = "High Priest Venoxis's Venom Spit hits (.+) for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	trigger_venomSpitFade = "Venom Spit fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_venomSpit = " 喷毒",
	
	trigger_enrage = "High Priest Venoxis gains Enrage.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrage = "温诺希斯激怒了！",
	
	--no trigger for parasitic serpent, 1st at 11sec after p2, next is ???
    bar_parasiticSerpent = "寄生蛇生成",
    msg_parasiticSerpent = "杀死寄生蛇（低血量） - AoE！",
	
    msg_addDead = "/4 蛇增援已死",
    c_razzashicobra = "Razzashi Cobra",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Venoxis",

	renew_cmd = "renew",
    renew_name = "恢复警报",
    renew_desc = "恢复时进行警告",

	holyfire_cmd = "holyfire",
    holyfire_name = "神圣之火警报",
    holyfire_desc = "神圣之火时进行警告",
	
	holywrath_cmd = "holywrath",
    holywrath_name = "神圣愤怒警报",
    holywrath_desc = "神圣愤怒时进行警告",
	
	holynova_cmd = "holynova",
    holynova_name = "神圣新星警报",
    holynova_desc = "神圣新星时进行警告",
	
	phase_cmd = "phase",
    phase_name = "阶段变化警报",
    phase_desc = "蛇阶段时进行警告",
	
	poisoncloud_cmd = "poisoncloud",
    poisoncloud_name = "毒云警报",
    poisoncloud_desc = "毒云时进行警告",
	
	venomspit_cmd = "venomspit",
    venomspit_name = "喷毒警报",
    venomspit_desc = "喷毒时进行警告",
	
	enrage_cmd = "enrage",
    enrage_name = "激怒警报",
    enrage_desc = "激怒时进行警告",
	
	parasitic_cmd = "parasitic",
    parasitic_name = "寄生蛇警报",
    parasitic_desc = "寄生蛇时进行警告",
	
	adds_cmd = "adds",
    adds_name = "增援死亡警报",
    adds_desc = "增援死亡时进行警告",
	
	
	trigger_renew = "High Priest Venoxis gains Renew.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_renewFade = "Renew fades from High Priest Venoxis.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_renew = "恢复",
    msg_renew = "恢复 - 驱散！",
	
	trigger_holyFireCast = "High Priest Venoxis begins to cast Holy Fire.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	trigger_holyFireYou = "You are afflicted by Holy Fire.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_holyFireOther = "(.+) is afflicted by Holy Fire.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_holyFireFade = "Holy Fire fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_holyFireCast = "施放神圣之火！",
    bar_holyFireDur = " 神圣之火",
    msg_holyFire = "神圣之火 - 驱散！",
	
	trigger_holyWrath = "High Priest Venoxis's Holy Wrath", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_holyWrathCd = "神圣愤怒冷却",
	
	trigger_holyNova = "High Priest Venoxis's Holy Nova", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_holyNovaCd = "神圣新星冷却",
	
	trigger_phase2 = "Let the coils of hate unfurl!", --CHAT_MSG_MONSTER_YELL
    msg_phase2 = "第二阶段 - 避免毒云！",
	
	trigger_poisonCloudYou = "You are afflicted by Poison Cloud.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_poisonCloudYouFade = "Poison Cloud fades from you.", --CHAT_MSG_SPELL_AURA_GONE_SELF
    msg_poisonCloudYou = "远离毒云！",
	
	trigger_venomSpit = "High Priest Venoxis's Venom Spit hits (.+) for", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	trigger_venomSpitFade = "Venom Spit fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_venomSpit = " 喷毒",
	
	trigger_enrage = "High Priest Venoxis gains Enrage.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    msg_enrage = "温诺希斯激怒了！",
	
	--no trigger for parasitic serpent, 1st at 11sec after p2, next is ???
    bar_parasiticSerpent = "寄生蛇生成",
    msg_parasiticSerpent = "杀死寄生蛇（低血量） - AoE！",
	
    msg_addDead = "/4 蛇增援已死",
    c_razzashicobra = "拉扎什眼镜蛇",
    you = "you",
} end )

local timer = {
	renew = 15,
	
	holyFireCast = 3.5,
	holyFireDur = 8,
	
	holyWrathFirst = 30,
	holyWrath = {15,25},
	
	holyNovaFirst = 7.5, --1st always at 7.5
	holyNovaSecond = 21, --2nd supposed to be {16,18}, but always see at {21.5,22.5}
	holyNova = {16,18},
	
	parasiticSerpentSpawnFirst = 11,
	venomSpit = 10,
}
local icon = {
	renew = "Spell_Holy_Renew",
	holyFire = "Spell_Holy_SearingLight",
	holyWrath = "spell_nature_wispheal",
	holyNova = "spell_holy_holynova",
	poisonCloud = "Ability_Creature_Disease_02",
	venomSpit = "spell_nature_corrosivebreath",
	enrage = "Spell_Shadow_UnholyFrenzy",
	parasiticSerpent = "inv_misc_monsterhead_03",
}
local color = {
	renew = "White",
	
	holyFireCast = "Red",
	holyFireDur = "Orange",
	
	holyWrath = "Yellow",
	holyNova = "Blue",
	
	venomSpit = "Green",
	parasiticSerpent = "Cyan",
}
local syncName = {
	renew = "VenoxisRenewStart"..module.revision,
	renewFade = "VenoxisRenewStop"..module.revision,
	
	holyFireCast = "VenoxisHolyFireCast"..module.revision,
	holyFire = "VenoxisHolyFire"..module.revision,
	holyFireFade = "VenoxisHolyFireFade"..module.revision,
	
	holyWrath = "VenoxisHolyWrath"..module.revision,
	
	holyNova = "VenoxisHolyNova"..module.revision,
	
	phase2 = "VenoxisPhaseTwo"..module.revision,
	
	venomSpit = "VenoxisVenomSpit"..module.revision,
	venomSpitFade = "VenoxisVenomSpitFade"..module.revision,
	
	enrage = "VenoxisEnrage"..module.revision,
	
	addDead = "VenoxisAddDead2"..module.revision,
}

local addDead = 0
local holyNovaCount = 1

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --trigger_phase2
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_renew, trigger_enrage
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_holyFireFade, trigger_poisonCloudYouFade, trigger_venomSpitFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_holyFireFade, trigger_venomSpitFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_renewFade, trigger_holyFireFade, trigger_venomSpitFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_venomSpit, trigger_holyWrath, trigger_holyNova
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_venomSpit, trigger_holyWrath, trigger_holyNova
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_holyFireCast, trigger_venomSpit, trigger_holyWrath, trigger_holyNova
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_holyFireYou, trigger_poisonCloudYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_holyFireOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_holyFireOther

	
	self:ThrottleSync(2, syncName.renew)
	self:ThrottleSync(2, syncName.renewFade)
	
	self:ThrottleSync(2, syncName.holyFireCast)
	self:ThrottleSync(2, syncName.holyFire)
	self:ThrottleSync(2, syncName.holyFireFade)
	
	self:ThrottleSync(5, syncName.holyWrath)
	
	self:ThrottleSync(5, syncName.holyNova)
	
	self:ThrottleSync(10, syncName.phase2)
	
	self:ThrottleSync(2, syncName.venomSpit)
	self:ThrottleSync(0.5, syncName.venomSpitFade)
	
	self:ThrottleSync(5, syncName.enrage)
	
	self:ThrottleSync(0.5, syncName.addDead)
end

function module:OnSetup()
	self.started = nil

	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
	addDead = 0
	holyNovaCount = 1
	
	if self.db.profile.holywrath then
		self:Bar(L["bar_holyWrathCd"], timer.holyWrathFirst, icon.holyWrath, true, color.holyWrath)
	end
	
	if self.db.profile.holynova then
		self:Bar(L["bar_holyNovaCd"], timer.holyNovaFirst, icon.holyNova, true, color.holyNova)
	end
end

function module:OnDisengage()
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if (msg == string.format(UNITDIESOTHER, L["c_razzashicobra"]))then
		addDead = addDead + 1
		if addDead <= 4 then
			self:Sync(syncName.addDead .. " " .. addDead)
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["trigger_phase2"] then
		self:Sync(syncName.phase2)
	end
end

function module:Event(msg)
	if msg == L["trigger_renew"] then
		self:Sync(syncName.renew)
	elseif msg == L["trigger_renewFade"] then
		self:Sync(syncName.renewFade)
	
	
	elseif msg == L["trigger_holyFireCast"] then
		self:Sync(syncName.holyFireCast)
	
	elseif msg == L["trigger_holyFireYou"] then
		self:Sync(syncName.holyFire .. " "..UnitName("Player"))
	
	elseif string.find(msg, L["trigger_holyFireOther"]) then
		local _,_,holyFirePerson, _ = string.find(msg, L["trigger_holyFireOther"])
		self:Sync(syncName.holyFire .. " "..holyFirePerson)
	
	elseif string.find(msg, L["trigger_holyFireFade"]) then
		local _,_,holyFireFadePerson, _ = string.find(msg, L["trigger_holyFireFade"])
		if holyFireFadePerson == L["you"] then holyFireFadePerson = UnitName("Player") end
		self:Sync(syncName.holyFireFade .. " "..holyFireFadePerson)
		
	elseif string.find(msg, L["trigger_holyWrath"]) then
		self:Sync(syncName.holyWrath)
		
	elseif string.find(msg, L["trigger_holyNova"]) then
		self:Sync(syncName.holyNova)
		
	elseif string.find(msg, L["trigger_venomSpit"]) then
		local _,_,venomSpitPerson, _ = string.find(msg, L["trigger_venomSpit"])
		if venomSpitPerson == L["you"] then venomSpitPerson = UnitName("Player") end
		self:Sync(syncName.venomSpit .. " "..venomSpitPerson)
	
	elseif string.find(msg, L["trigger_venomSpitFade"]) then
		local _,_,venomSpitFadePerson, _ = string.find(msg, L["trigger_venomSpitFade"])
		if venomSpitFadePerson == L["you"] then venomSpitFadePerson = UnitName("Player") end
		self:Sync(syncName.venomSpitFade .. " "..venomSpitFadePerson)
		
		
	elseif msg == L["trigger_poisonCloudYou"] and self.db.profile.poisoncloud then
		self:PoisonCloudYou()
	elseif msg == L["trigger_poisonCloudYouFade"] and self.db.profile.poisoncloud then
		self:PoisonCloudYouFade()
	
	elseif msg == L["trigger_enrage"] then
		self:Sync(syncName.enrage)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.renew and self.db.profile.renew then
		self:Renew()
	elseif sync == syncName.renewFade and self.db.profile.renew then
		self:RenewFade()
	
	elseif sync == syncName.holyFireCast and self.db.profile.holyfire then
		self:HolyFireCast()
	elseif sync == syncName.holyFire and rest and self.db.profile.holyfire then
		self:HolyFire(rest)
	elseif sync == syncName.holyFireFade and rest and self.db.profile.holyfire then
		self:HolyFireFade(rest)
	
	elseif sync == syncName.holyWrath and self.db.profile.holywrath then
		self:HolyWrath()
		
	elseif sync == syncName.holyNova and self.db.profile.holynova then
		self:HolyNova()
	
	elseif sync == syncName.phase2 and self.db.profile.phase then
		self:Phase2()
	
	elseif sync == syncName.venomSpit and rest and self.db.profile.venomspit then
		self:VenomSpit(rest)
	elseif sync == syncName.venomSpitFade and rest and self.db.profile.venomspit then
		self:VenomSpitFade(rest)
		
	elseif sync == syncName.enrage and self.db.profile.enrage then
		self:Enrage()
	
	elseif sync == syncName.addDead and rest and self.db.profile.adds then
		self:AddDead(rest)
	end
end


function module:Renew()
	self:Bar(L["bar_renew"], timer.renew, icon.renew, true, color.renew)
	
	if UnitClass("Player") == BC["Priest"] or UnitClass("Player") == BC["Shaman"] then 
		self:Message(L["msg_renew"], "Attention", false, nil, false)
		self:Sound("Alarm")
		self:WarningSign(icon.renew, 0.7)
	end
end

function module:RenewFade()
	self:RemoveBar(L["bar_renew"])
end

function module:HolyFireCast()
	self:Bar(L["bar_holyFireCast"], timer.holyFireCast, icon.holyFire, true, color.holyFireCast)
end

function module:HolyFire(rest)
	self:RemoveBar(L["bar_holyFireCast"])
	self:Bar(rest..L["bar_holyFireDur"], timer.holyFireDur, icon.holyFire, true, color.holyFireDur)
end

function module:HolyFireFade(rest)
	self:RemoveBar(rest..L["bar_holyFireDur"])
end

function module:HolyWrath()
	self:RemoveBar(L["bar_holyWrathCd"])
	self:IntervalBar(L["bar_holyWrathCd"], timer.holyWrath[1], timer.holyWrath[2], icon.holyWrath, true, color.holyWrath)
end

function module:HolyNova()
	self:RemoveBar(L["bar_holyNovaCd"])
	
	if holyNovaCount == 1 then
		self:Bar(L["bar_holyNovaCd"], timer.holyNovaSecond, icon.holyNova, true, color.holyNova)
		holyNovaCount = 2
	elseif holyNovaCount == 2 then
		self:IntervalBar(L["bar_holyNovaCd"], timer.holyNova[1], timer.holyNova[2], icon.holyNova, true, color.holyNova)
	end
end

function module:Phase2()
	self:RemoveBar(L["bar_holyFireCast"])
	self:RemoveBar(L["bar_holyWrathCd"])
	self:RemoveBar(L["bar_holyNovaCd"])
	
	self:Message(L["msg_phase2"], "Important", false, nil, false)
	
	if self.db.profile.parasitic then
		self:Bar(L["bar_parasiticSerpent"], timer.parasiticSerpentSpawnFirst, icon.parasiticSerpent, true, color.parasiticSerpent)
		self:DelayedMessage(timer.parasiticSerpentSpawnFirst, L["msg_parasiticSerpent"], "Important", false, nil, false)
	end
end

function module:PoisonCloudYou()
	self:Message(L["msg_poisonCloudYou"], "Personal", false, nil, false)
	self:Sound("Info")
	self:WarningSign(icon.poisonCloud, 10)	
end

function module:PoisonCloudYouFade()
	self:RemoveWarningSign(icon.poisonCloud)
end

function module:VenomSpit(rest)
	self:Bar(rest..L["bar_venomSpit"], timer.venomSpit, icon.venomSpit, true, color.venomSpit)
	
	if UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Shaman"] then 
		self:Message(L["msg_venomSpot"], "Attention", false, nil, false)
		self:Sound("Alarm")
		self:WarningSign(icon.venomSpit, 0.7)
	end
end

function module:VenomSpitFade(rest)
	self:RemoveBar(rest..L["bar_venomSpit"])
end

function module:Enrage()
	self:Message(L["msg_enrage"], "Urgent", false, nil, false)
	self:Sound("Beware")
	self:WarningSign(icon.enrage, 0.7)
end

function module:AddDead(rest)
	self:Message(rest..L["msg_addDead"], "Positive", false, nil, false)
end
