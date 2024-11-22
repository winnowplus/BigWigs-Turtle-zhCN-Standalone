local module, L = BigWigs:ModuleDeclaration("Solnius", "Emerald Sanctum")
local BC = AceLibrary("Babble-Class-2.2")
local bberennius = AceLibrary("Babble-Boss-2.2")["Erennius"]
local bbsolnius = AceLibrary("Babble-Boss-2.2")["Solnius"]

module.revision = 30029
module.enabletrigger = module.translatedName
module.toggleoptions = {"transitions", "bosskill"}--"wailoferennius", "howloferennius", "volley", 
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Emerald Sanctum"],
	AceLibrary("Babble-Zone-2.2")["Emerald Sanctum"],
}

	--Abilities not used in the mod
--Call of Nightmare		Not Dispellable		Sleep + DoT				10sec		Sometimes does Dreamstate instead, why?
--Emerald Rot			Disease				Atk and cast -80%		30sec
-->>>>>>>>>				-> CureDisease 		->50%					->120sec	Still called Emerald Rot
--Bane of Eranikus		Not Dispellable		Casting speed -30%		30sec
--Dreamfever			Disease				Reduced Atk Spd			??sec
--Emerald Instability	Magic				200 nature dmg taken	??sec
--Sanctum Mind Decay	Magic				Mana Drain				??sec
-->>>>>>>>>				-> Dispel 			-> 75% reduce cast time for 30sec

L:RegisterTranslations("enUS", function() return {
    cmd = "Solnius",

    transitions_cmd = "transitions",
    transitions_name = "过渡阶段警报",
    transitions_desc = "过渡阶段出现时进行警告",

    --[[
    wailoferennius_cmd = "wailoferennius",
    wailoferennius_name = "埃伦纽斯之嚎警报",
    wailoferennius_desc = "埃伦纽斯之嚎出现时进行警告",

    howloferennius_cmd = "howloferennius",
    howloferennius_name = "埃伦纽斯之吼警报",
    howloferennius_desc = "埃伦纽斯之吼出现时进行警告",
    
    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",
    ]]--

    bar_isImmune = "索尔纽斯免疫",
    msg_isImmune = "索尔纽斯免疫",
    
    trigger_solniusSleep = "Solnius gains Sleep Visual DND.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    trigger_solniusSleepFade = "Sleep Visual DND fades from Solnius.",--CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_isSleeping = "索尔纽斯正在沉睡",
    msg_isSleeping = "小怪来袭！45秒内击杀",
    msg_isSleepingFade = "索尔纽斯醒来了！",

    --[[Erennius vv
    trigger_wailOfErenniusCast = "Erennius begins to cast Wail of Erennius.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_wailOfErenniusCast = "正在施放埃伦纽斯之嚎",
    bar_wailOfErenniusAfflicted = "埃伦纽斯之嚎效果",
    bar_wailOfErenniusCd = "埃伦纽斯之嚎冷却",
    
    trigger_howlOfErennius = "afflicted by Howl of Erennius",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_howlOfErenniusResist = "Howl of Erennius was resisted",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
    bar_howlOfErenniusCD = "沉默冷却",
    bar_howlOfErenniusAfflicted = "被沉默！",
    
    trigger_volley = "afflicted by Poison Bolt Volley",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_volley = "毒箭齐射",
    --Erennius ^^--]]
    
    trigger_engage = "You think you can interfere with my eternal duty? The awakening has been fortold long before your kind has existed mortals, you shall regret setting foot on our hallowed ground!",--CHAT_MSG_MONSTER_YELL
    
    trigger_hardMode = "You will not disturb the Awakener...",--CHAT_MSG_MONSTER_YELL
    msg_hardModeOn = "埃伦纽斯加入战斗；困难模式开启 - 祝你好运！",
    msg_hardModeOff = "埃伦纽斯在索尔纽斯之前死亡；困难模式取消 - *胆小鬼*",
    
    --trigger_yellSmt = "The dream beckons us all, you shall remain here forever...",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Solnius",

    transitions_cmd = "transitions",
    transitions_name = "过渡阶段警报",
    transitions_desc = "过渡阶段出现时进行警告",

    --[[
    wailoferennius_cmd = "wailoferennius",
    wailoferennius_name = "埃伦纽斯之嚎警报",
    wailoferennius_desc = "埃伦纽斯之嚎出现时进行警告",

    howloferennius_cmd = "howloferennius",
    howloferennius_name = "埃伦纽斯之吼警报",
    howloferennius_desc = "埃伦纽斯之吼出现时进行警告",
    
    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",
    ]]--

    bar_isImmune = "索尔纽斯免疫",
    msg_isImmune = "索尔纽斯免疫",
    
    trigger_solniusSleep = "索尔纽斯获得了Sleep Visual DND的效果。",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    trigger_solniusSleepFade = "Sleep Visual DND效果从索尔纽斯身上消失。",--CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_isSleeping = "索尔纽斯正在沉睡",
    msg_isSleeping = "小怪来袭！45秒内击杀",
    msg_isSleepingFade = "索尔纽斯醒来了！",

    --[[Erennius vv
    trigger_wailOfErenniusCast = "Erennius begins to cast Wail of Erennius.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_wailOfErenniusCast = "正在施放埃伦纽斯之嚎",
    bar_wailOfErenniusAfflicted = "埃伦纽斯之嚎效果",
    bar_wailOfErenniusCd = "埃伦纽斯之嚎冷却",
    
    trigger_howlOfErennius = "afflicted by Howl of Erennius",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_howlOfErenniusResist = "Howl of Erennius was resisted",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
    bar_howlOfErenniusCD = "沉默冷却",
    bar_howlOfErenniusAfflicted = "被沉默！",
    
    trigger_volley = "afflicted by Poison Bolt Volley",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_volley = "毒箭齐射",
    --Erennius ^^--]]
    
    trigger_engage = "You think you can interfere with my eternal duty? The awakening has been fortold long before your kind has existed mortals, you shall regret setting foot on our hallowed ground!",--CHAT_MSG_MONSTER_YELL
    
    trigger_hardMode = "You will not disturb the Awakener...",--CHAT_MSG_MONSTER_YELL
    msg_hardModeOn = "埃伦纽斯加入战斗；困难模式开启 - 祝你好运！",
    msg_hardModeOff = "埃伦纽斯在索尔纽斯之前死亡；困难模式取消 - *胆小鬼*",
    
    --trigger_yellSmt = "The dream beckons us all, you shall remain here forever...",
} end )

local timer = {
	isImmune = 600,
	isSleeping = 45,
	--wailOfErenniusCast = 6,
	--wailOfErenniusAfflicted = 3,
	--wailOfErenniusCd = 26,
	--howlOfErennius = {33,46},--saw 33, saw 46
	--howlOfErenniusAfflicted = 8,
	--volley = 12,
}
local icon = {
	isImmune = "Inv_Misc_Pocketwatch_01",
	isSleeping = "Inv_Misc_Pocketwatch_01",
	--wailOfErenniusCast = "Spell_Shadow_ShadeTruesight",
	--wailOfErenniusAfflicted = "Spell_Shadow_ShadeTruesight",
	--wailOfErenniusCd = "Spell_Shadow_ShadeTruesight",
	--howlOfErennius = "Spell_Shadow_AuraOfDarkness",
	--volley = "Spell_Nature_CorrosiveBreath",
}
local color = {
	isImmune = "White",
	isSleeping = "White",
	--wailOfErenniusCast = "Purple",
	--wailOfErenniusAfflicted = "Purple",
	--wailOfErenniusCd = "Purple",
	--howlOfErennius = "Red",
	--volley = "Green",
}
local syncName = {
	hardMode = "SolniusHardMode"..module.revision,
	hardModeOff = "SolniusHardModeOff"..module.revision,
	isImmune = "SolniusIsImmune"..module.revision,
	isSleeping = "SolniusIsSleeping"..module.revision,
	isSleepingFade = "SolniusIsSleepingFade"..module.revision,
	--wailOfErenniusCast = "SolniusWailOfErenniusCast"..module.revision,
	--howlOfErennius = "SolniusHowlOfErennius"..module.revision,
	--volley = "SolniusVolley"..module.revision,
}

--module:RegisterYellEngage(L["trigger_engage"])
bwSolniusEngaged = false
bwSolniusHardMode = false
bwSolniusHardModeHardOn = false

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--trigger_solniusSleep
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_solniusSleepFade
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_wailOfErennius, trigger_howlOfErenniusResist
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_howlOfErennius, trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_howlOfErennius, trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_howlOfErennius, trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_howlOfErenniusResist
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")--trigger_hardMode
	
	self:ThrottleSync(10, syncName.hardMode)
	self:ThrottleSync(10, syncName.hardModeOff)
	self:ThrottleSync(10, syncName.isImmune)
	self:ThrottleSync(10, syncName.isSleeping)
	self:ThrottleSync(10, syncName.isSleepingFade)
	--self:ThrottleSync(10, syncName.wailOfErenniusCast)
	--self:ThrottleSync(10, syncName.howlOfErennius)
	--self:ThrottleSync(8, syncName.volley)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	
	bwSolniusEngaged = true
	bwSolniusHardMode = false
	bwSolniusHardModeHardOn = false
end

function module:OnDisengage()
end

function module:UNIT_HEALTH(arg1)
	if UnitName(arg1) == module.translatedName then
		local health = UnitHealth(arg1)
		local maxHealth = UnitHealthMax(arg1)
		if math.ceil(100*health/maxHealth) < 59 and not isImmune then
			self:Sync(syncName.isImmune)
			isImmune = true
		elseif math.ceil(health) > 60 and isImmune then
			isImmune = nil
		end
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, bberennius) and bwSolniusHardMode == true then
		--[[
		self:RemoveBar(L["bar_wailOfErenniusCast"])
		self:RemoveBar(L["bar_wailOfErenniusAfflicted"])
		self:RemoveBar(L["bar_wailOfErenniusCd"])
		self:CancelDelayedBar(L["bar_wailOfErenniusAfflicted"])
		self:CancelDelayedBar(L["bar_wailOfErenniusCd"])
		--]]
		if bwSolniusHardModeHardOn == false then
			self:Sync(syncName.hardModeOff)
		end
	elseif msg == string.format(UNITDIESOTHER, bbsolnius) and bwSolniusHardMode == true then
		bwSolniusHardModeHardOn = true
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_engage"] and sender == bbsolnius then
		module:SendEngageSync()
	elseif msg == L["trigger_hardMode"] and bwSolniusEngaged == true then
		self:Sync(syncName.hardMode)
	end
end

function module:Event(msg)
	if msg == L["trigger_solniusSleep"] then
		self:Sync(syncName.isSleeping)
	elseif msg == L["trigger_solniusSleepFade"] then
		self:Sync(syncName.isSleepingFade)
	--[[
	elseif msg == L["trigger_wailOfErenniusCast"] then
		self:Sync(syncName.wailOfErenniusCast)
	
	elseif string.find(msg, L["trigger_howlOfErennius"]) or string.find(msg, L["trigger_howlOfErenniusResist"]) then
		self:Sync(syncName.howlOfErennius)
		
	elseif string.find(msg, L["trigger_volley"]) then
		self:Sync(syncName.volley)
	--]]
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.hardMode then
		self:HardMode()
	elseif sync == syncName.hardModeOff then
		self:HardModeOff()
	elseif sync == syncName.isImmune and self.db.profile.transitions then
		self:IsImmune()
	elseif sync == syncName.isSleeping and self.db.profile.transitions then
		self:IsSleeping()
	elseif sync == syncName.isSleepingFade and self.db.profile.transitions then
		self:IsSleepingFade()
	--[[
	elseif sync == syncName.wailOfErenniusCast and self.db.profile.wailoferennius then
		self:WailOfErenniusCast()
	elseif sync == syncName.howlOfErennius and self.db.profile.howloferennius then
		self:HowlOfErennius()
	elseif sync == syncName.volley and self.db.profile.volley then
		self:Volley()
	]]--
	end
end


function module:HardMode()
	bwSolniusHardMode = true
	self:Message(L["msg_hardModeOn"], "Urgent", false, nil, false)
end

function module:HardModeOff()
	bwSolniusHardMode = false
	self:Message(L["msg_hardModeOff"], "Urgent", false, nil, false)
end

function module:IsImmune()
	self:Bar(L["bar_isImmune"], timer.isImmune, icon.isImmune, true, color.isImmune)
	self:Message(L["msg_isImmune"], "Urgent", false, nil, false)
end

function module:IsSleeping()
	self:RemoveBar(L["bar_isImmune"])
	self:Bar(L["bar_isSleeping"], timer.isSleeping, icon.isSleeping, true, color.isSleeping)
	self:Message(L["msg_isSleeping"], "Urgent", false, nil, false)
end

function module:IsSleepingFade()
	self:RemoveBar(L["bar_isSleeping"])
	self:Message(L["msg_isSleepingFade"], "Urgent", false, nil, false)
end

--[[
function module:WailOfErenniusCast()
	self:RemoveBar(L["bar_wailOfErenniusCd"])
	self:Bar(L["bar_wailOfErenniusCast"], timer.wailOfErenniusCast, icon.wailOfErenniusCast, true, color.wailOfErenniusCast)
	self:DelayedBar(timer.wailOfErenniusCast, L["bar_wailOfErenniusAfflicted"], timer.wailOfErenniusAfflicted, icon.wailOfErenniusAfflicted, true, color.wailOfErenniusAfflicted)
	self:DelayedBar(9, L["bar_wailOfErenniusCd"], timer.wailOfErenniusCd, icon.wailOfErenniusCd, true, color.wailOfErenniusCd)
end

function module:HowlOfErennius()
	self:Bar(L["bar_howlOfErenniusAfflicted"], timer.howlOfErenniusAfflicted, icon.howlOfErennius, true, color.howlOfErennius)
	self:DelayedIntervalBar(timer.howlOfErenniusAfflicted, L["bar_howlOfErenniusCD"], timer.howlOfErennius[1], timer.howlOfErennius[2], icon.howlOfErennius, true, color.howlOfErennius)
end

function module:Volley()
	self:Bar(L["bar_volley"], timer.volley, icon.volley, true, color.volley)
	
	if UnitClass("Player") == BC["Shaman"] then
		self:WarningSign(icon.volley, 0.7)
	end
end
]]--