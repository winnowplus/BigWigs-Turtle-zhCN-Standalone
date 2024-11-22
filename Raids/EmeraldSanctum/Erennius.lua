local module, L = BigWigs:ModuleDeclaration("Erennius", "Emerald Sanctum")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30020
module.enabletrigger = module.translatedName
module.toggleoptions = {"wailoferennius", "howloferennius", "volley", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Erennius",

    wailoferennius_cmd = "wailoferennius",
    wailoferennius_name = "埃伦纽斯之嚎警报",
    wailoferennius_desc = "埃伦纽斯之嚎出现时进行警告",

    howloferennius_cmd = "howloferennius",
    howloferennius_name = "埃伦纽斯之吼警报",
    howloferennius_desc = "埃伦纽斯之吼出现时进行警告",
    
    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",
    
    --Erennius vv
    trigger_wailOfErenniusCast = "Erennius begins to cast Wail of Erennius.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_wailOfErenniusCast = "正在施放埃伦纽斯之嚎",
    bar_wailOfErenniusAfflicted = "埃伦纽斯之嚎效果",
    bar_wailOfErenniusCd = "埃伦纽斯之嚎冷却",
    
    trigger_howlOfErennius = "afflicted by Howl of Erennius",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_howlOfErenniusResist = "Howl of Erennius was resisted",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
    bar_howlOfErenniusCD = "沉默冷却",
    bar_howlOfErenniusAfflicted = "沉默！",
    
    trigger_volley = "afflicted by Poison Bolt Volley",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_volley = "毒箭齐射",
    --Erennius ^^
    
    trigger_someYell = "Your efforts...",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Erennius",

    wailoferennius_cmd = "wailoferennius",
    wailoferennius_name = "埃伦纽斯之嚎警报",
    wailoferennius_desc = "埃伦纽斯之嚎出现时进行警告",

    howloferennius_cmd = "howloferennius",
    howloferennius_name = "埃伦纽斯之吼警报",
    howloferennius_desc = "埃伦纽斯之吼出现时进行警告",
    
    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",
    
    --Erennius vv
    trigger_wailOfErenniusCast = "埃伦纽斯开始施放",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_wailOfErenniusCast = "正在施放群体睡眠",
    bar_wailOfErenniusAfflicted = "群体睡眠",
    bar_wailOfErenniusCd = "群体睡眠冷却",
    
    trigger_howlOfErennius = "受到了埃伦纽斯之嚎效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_howlOfErenniusResist = "Howl of Erennius was resisted",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
    bar_howlOfErenniusCD = "沉默冷却",
    bar_howlOfErenniusAfflicted = "沉默！",
    
    trigger_volley = "受到了毒箭之雨效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    bar_volley = "毒箭齐射",
    --Erennius ^^
    
    trigger_someYell = "Your efforts...",
} end )

local timer = {
	wailOfErenniusCast = 6,
	wailOfErenniusAfflicted = 3,
	wailOfErenniusCd = 26,
	howlOfErenniusCd = {22,38},--saw 30, saw 46, minus the 8 afflicted -> 25,38
	howlOfErenniusAfflicted = 8,
	volley = 12,
}
local icon = {
	wailOfErenniusCast = "Spell_Shadow_ShadeTruesight",
	wailOfErenniusAfflicted = "Spell_Shadow_ShadeTruesight",
	wailOfErenniusCd = "Spell_Shadow_ShadeTruesight",
	howlOfErennius = "Spell_Shadow_AuraOfDarkness",
	volley = "Spell_Nature_CorrosiveBreath",
}
local color = {
	wailOfErenniusCast = "Purple",
	wailOfErenniusAfflicted = "Purple",
	wailOfErenniusCd = "Purple",
	howlOfErennius = "Red",
	volley = "Green",
}
local syncName = {
	wailOfErenniusCast = "ErenniusWailOfErenniusCast"..module.revision,
	howlOfErennius = "ErenniusHowlOfErennius"..module.revision,
	volley = "ErenniusVolley"..module.revision,
}

--module:RegisterYellEngage(L["trigger_engage"])

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_wailOfErennius, trigger_howlOfErenniusResist
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_howlOfErennius, trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_howlOfErennius, trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_howlOfErennius, trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_howlOfErenniusResist

	self:ThrottleSync(10, syncName.wailOfErenniusCast)
	self:ThrottleSync(10, syncName.howlOfErennius)
	self:ThrottleSync(8, syncName.volley)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_wailOfErenniusCast"] then
		self:Sync(syncName.wailOfErenniusCast)
	
	elseif string.find(msg, L["trigger_howlOfErennius"]) or string.find(msg, L["trigger_howlOfErenniusResist"]) then
		self:Sync(syncName.howlOfErennius)
		
	elseif string.find(msg, L["trigger_volley"]) then
		self:Sync(syncName.volley)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wailOfErenniusCast and self.db.profile.wailoferennius then
		self:WailOfErenniusCast()
	elseif sync == syncName.howlOfErennius and self.db.profile.howloferennius then
		self:HowlOfErennius()
	elseif sync == syncName.volley and self.db.profile.volley then
		self:Volley()
	end
end


function module:WailOfErenniusCast()
	self:RemoveBar(L["bar_wailOfErenniusCd"])
	self:Bar(L["bar_wailOfErenniusCast"], timer.wailOfErenniusCast, icon.wailOfErenniusCast, true, color.wailOfErenniusCast)
	self:DelayedBar(timer.wailOfErenniusCast, L["bar_wailOfErenniusAfflicted"], timer.wailOfErenniusAfflicted, icon.wailOfErenniusAfflicted, true, color.wailOfErenniusAfflicted)
	self:DelayedBar(9, L["bar_wailOfErenniusCd"], timer.wailOfErenniusCd, icon.wailOfErenniusCd, true, color.wailOfErenniusCd)
end

function module:HowlOfErennius()
	self:RemoveBar(L["bar_howlOfErenniusCD"])
	self:Bar(L["bar_howlOfErenniusAfflicted"], timer.howlOfErenniusAfflicted, icon.howlOfErennius, true, color.howlOfErennius)
	self:DelayedIntervalBar(timer.howlOfErenniusAfflicted, L["bar_howlOfErenniusCD"], timer.howlOfErenniusCd[1], timer.howlOfErenniusCd[2], icon.howlOfErennius, true, color.howlOfErennius)
end

function module:Volley()
	self:Bar(L["bar_volley"], timer.volley, icon.volley, true, color.volley)
	
	if UnitClass("Player") == BC["Shaman"] then
		self:WarningSign(icon.volley, 0.7)
	end
end
