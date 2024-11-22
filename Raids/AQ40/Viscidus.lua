local module, L = BigWigs:ModuleDeclaration("Viscidus", "Ahn'Qiraj")
local BC = AceLibrary("Babble-Class-2.2")
local bbglobofviscidus = AceLibrary("Babble-Boss-2.2")["Glob of Viscidus"]
local bbviscidus = AceLibrary("Babble-Boss-2.2")["Viscidus"]

module.revision = 30067
module.enabletrigger = module.translatedName
module.toggleoptions = {"volley", "toxin", "freezestages", "freezecount", "pokecount", "glob", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Viscidus",

    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",

    toxin_cmd = "toxin",
    toxin_name = "站在毒云中警报",
    toxin_desc = "站在毒云中时进行警告",

    freezestages_cmd = "freezestages",
    freezestages_name = "冰冻状态警报",
    freezestages_desc = "不同冰冻状态时进行警告",
    
    freezecount_cmd = "freezecount",
    freezecount_name = "计算冰霜伤害",
    freezecount_desc = "计算冰霜伤害击中维希度斯的次数以冻结它",
    
    pokecount_cmd = "pokecount",
    pokecount_name = "计算戳击伤害",
    pokecount_desc = "计算物理伤害击中维希度斯的次数以使其粉碎",
    
    glob_cmd = "glob",
    glob_name = "水珠死亡计数器",
    glob_desc = "计数水珠的死亡次数",


    trigger_volley = "afflicted by Poison Bolt Volley.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_volley = "毒箭齐射",
    
    trigger_toxin = "You are afflicted by Toxin.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_toxin = "远离毒云！",
    trigger_toxinFade = "Toxin fades from you.",--CHAT_MSG_SPELL_AURA_GONE_OTHER",

    trigger_frostDmg = "Frost damage",--CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE
    trigger_chilledDmg = "gains Chilled",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    trigger_wintersChill = "gains Winter's Chill",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    bar_frostDmg = "剩余冰霜击中次数",
    
    trigger_pokeYou = "hit Viscidus for",--CHAT_MSG_COMBAT_SELF_HITS
    trigger_pokeOther = "hits Viscidus for",--CHAT_MSG_COMBAT_PARTY_HITS // CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS
    trigger_pokeCritYou = "crit Viscidus for",--CHAT_MSG_COMBAT_SELF_HITS
    trigger_pokeCritOther = "crits Viscidus for",--CHAT_MSG_COMBAT_PARTY_HITS // CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS
    bar_poke = "剩余戳击次数",
    
    trigger_slow = " begins to slow!",--CHAT_MSG_RAID_BOSS_EMOTE
    trigger_freezing = " is freezing up!",--CHAT_MSG_RAID_BOSS_EMOTE
    trigger_frozen = " is frozen solid!",--CHAT_MSG_RAID_BOSS_EMOTE
    trigger_crack = " begins to crack!",--CHAT_MSG_RAID_BOSS_EMOTE
    trigger_shatter = " looks ready to shatter!",--CHAT_MSG_RAID_BOSS_EMOTE
    
    msg_slow = "冻结计数：100 / 200",
    msg_freezing = "冻结计数：150 / 200",
    msg_frozen = "冻结计数：200 / 200 - 已冻结，赶快戳击它！",
    msg_crack = "戳击计数：50 / 150",
    msg_shatter = "戳击计数：100 / 150",
    
    bar_glob = "剩余水珠数量",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Viscidus",

    volley_cmd = "volley",
    volley_name = "毒箭齐射警报",
    volley_desc = "毒箭齐射出现时进行警告",

    toxin_cmd = "toxin",
    toxin_name = "站在毒云中警报",
    toxin_desc = "站在毒云中时进行警告",

    freezestages_cmd = "freezestages",
    freezestages_name = "冰冻状态警报",
    freezestages_desc = "不同冰冻状态时进行警告",
    
    freezecount_cmd = "freezecount",
    freezecount_name = "计算冰霜伤害",
    freezecount_desc = "计算冰霜伤害击中维希度斯的次数以冻结它",
    
    pokecount_cmd = "pokecount",
    pokecount_name = "计算戳击伤害",
    pokecount_desc = "计算物理伤害击中维希度斯的次数以使其粉碎",
    
    glob_cmd = "glob",
    glob_name = "水珠死亡计数器",
    glob_desc = "计数水珠的死亡次数",


    trigger_volley = "受到了毒箭之雨效果的影响。",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    bar_volley = "毒箭齐射",
    
    trigger_toxin = "你受到了剧毒效果的影响。",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_toxin = "远离毒云！",
    trigger_toxinFade = "剧毒效果从你身上消失了。",--CHAT_MSG_SPELL_AURA_GONE_OTHER",

    trigger_frostDmg = "冰霜伤害",--CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE
    trigger_chilledDmg = "获得冰冻",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    trigger_wintersChill = "获得深冬之寒",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    bar_frostDmg = "剩余冰霜击中次数",
    
    trigger_pokeYou = "击中维希度斯",--CHAT_MSG_COMBAT_SELF_HITS
    trigger_pokeOther = "击中维希度斯",--CHAT_MSG_COMBAT_PARTY_HITS // CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS
    trigger_pokeCritYou = "击中维希度斯",--CHAT_MSG_COMBAT_SELF_HITS
    trigger_pokeCritOther = "击中维希度斯",--CHAT_MSG_COMBAT_PARTY_HITS // CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS
    bar_poke = "剩余戳击次数",
    
    trigger_slow = "开始变慢！",--CHAT_MSG_RAID_BOSS_EMOTE
    trigger_freezing = "冻僵了！",--CHAT_MSG_RAID_BOSS_EMOTE
    trigger_frozen = "冻成固体了！",--CHAT_MSG_RAID_BOSS_EMOTE
    trigger_crack = "开始破裂！",--CHAT_MSG_RAID_BOSS_EMOTE
    trigger_shatter = "看起来就要崩溃了！",--CHAT_MSG_RAID_BOSS_EMOTE
    
    msg_slow = "冻结计数：100 / 200",
    msg_freezing = "冻结计数：150 / 200",
    msg_frozen = "冻结计数：200 / 200 - 已冻结，赶快戳击它！",
    msg_crack = "戳击计数：50 / 150",
    msg_shatter = "戳击计数：100 / 150",
    
    bar_glob = "剩余水珠数量",
} end )

local timer = {
	volley = {10,15},
	toxin = 10,
}
local icon = {
	volley = "Spell_Nature_CorrosiveBreath",
	toxin = "Spell_Nature_AbolishMagic",
	frostDmg = "spell_frost_frostbolt02",
	poke = "inv_sword_04",
	glob = "Ability_creature_poison_06",
}
local color = {
	volley = "Green",
	frostDmg = "Cyan",
	poke = "Red",
	glob = "Black",
}
local syncName = {
	volley = "ViscidusVolley"..module.revision,
	slow = "ViscidusSlow"..module.revision,
	freezing = "ViscidusFreezing"..module.revision,
	frozen = "ViscidusFrozen"..module.revision,
	crack = "ViscidusCrack"..module.revision,
	shatter = "ViscidusShatter"..module.revision,
	glob = "ViscidusGlob"..module.revision,
}

local frostDmgCount = 0
local pokeCount = 0
local globDeathCount = 0
local checkPhysical = nil
local checkFrost = nil

local maxFreezeCount = 200
local maxPokeCount = 110
local maxGlobDeathCount = 18

--[[ Physical analysis
-- vMangos shows --
local crackCount = 50
local shatterCount = 100
local explodeCount = 150

-- Log analysis shows --
176	entries
109	hit / crit
132	hit / crit + abilities
117	hit / crit + deep wounds proc
140	hit / crit + abilities + deep wounds proc
	
109	hit / crit
23	abilities
8	deep wounds proc
4	wands
3	afflictions
15	frostbolt
3	lightning bolt
3	electric discharge
5	dream herald dot
1	life steal
1	dragonbreath chili
1	arcane shot
]]--

--[[Frost analysis
-- vMangos shows --
local slowCount = 100
local freezingCount = 150
local frozenCount = 200

-- Log analysis shows --
5	"gains Winter's Chill",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
1	"gains Chilled",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
193 "Frost damage",--CHAT_MSG_SPELL_XXX_DAMAGE

199 total, close enough, wonder what is the 1 missing...
]]--

--local globCount = 18 --supposed to be 20, but log and video confirms 18

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_RAID_BOSS_EMOTE")--trigger_slow...
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_volley, trigger_toxin
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_volley
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_volley
	
	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "Event")--trigger_frostDmg
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "Event")--trigger_frostDmg
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_frostDmg
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--trigger_chilledDmg, trigger_wintersChill
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_toxinFade
	
	self:RegisterEvent("CHAT_MSG_COMBAT_SELF_HITS", "CheckPhysical")--trigger_pokeYou trigger_pokeCritYou
	self:RegisterEvent("CHAT_MSG_COMBAT_PARTY_HITS", "CheckPhysical")--trigger_pokeOther, trigger_pokeCritOther
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLYPLAYER_HITS", "CheckPhysical")--trigger_pokeOther, trigger_pokeCritOther
	
	self:ThrottleSync(8, syncName.volley)
	self:ThrottleSync(5, syncName.slow)
	self:ThrottleSync(5, syncName.freezing)
	self:ThrottleSync(5, syncName.frozen)
	self:ThrottleSync(5, syncName.crack)
	self:ThrottleSync(5, syncName.shatter)
	self:ThrottleSync(5, syncName.glob)
end

function module:OnSetup()
	self.started = nil
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
	frostDmgCount = 0
	pokeCount = 0
	globDeathCount = 0
	checkPhysical = nil
	checkFrost = true
	
	self:TriggerEvent("BigWigs_StartCounterBar", self, L["bar_frostDmg"], maxFreezeCount, "Interface\\Icons\\"..icon.frostDmg, true, color.frostDmg)
	self:TriggerEvent("BigWigs_SetCounterBar", self, L["bar_frostDmg"], frostDmgCount)
	
	if self.db.profile.volley then
		self:Volley()
	end
end

function module:OnDisengage()
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)

	if (msg == string.format(UNITDIESOTHER, bbglobofviscidus)) then
		self:Glob()
	end
end

function module:CHAT_MSG_RAID_BOSS_EMOTE(msg, sender)
	if string.find(msg, L["trigger_slow"]) then
		self:Sync(syncName.slow)
	elseif string.find(msg, L["trigger_freezing"]) then
		self:Sync(syncName.freezing)
	elseif string.find(msg, L["trigger_frozen"]) then
		self:Sync(syncName.frozen)
	elseif string.find(msg, L["trigger_crack"]) then
		self:Sync(syncName.crack)
	elseif string.find(msg, L["trigger_shatter"]) then
		self:Sync(syncName.shatter)
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_volley"]) then
		self:Sync(syncName.volley)
		
	elseif msg == L["trigger_toxin"] then
		self:Toxin()
	elseif msg == L["trigger_toxinFade"] then
		self:ToxinFade()
		
	elseif string.find(msg, L["trigger_frostDmg"]) or string.find(msg, L["trigger_chilledDmg"]) or string.find(msg, L["trigger_wintersChill"]) then
		if checkFrost == true then
			self:FrostDmg()
		end
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.volley and self.db.profile.volley then
		self:Volley()
	elseif sync == syncName.slow then
		self:Slow()
	elseif sync == syncName.freezing then
		self:Freezing()
	elseif sync == syncName.frozen then
		self:Frozen()
	elseif sync == syncName.crack then
		self:Crack()
	elseif sync == syncName.shatter then
		self:Shatter()
	elseif sync == syncName.glob then
		self:Glob()
	end
end


function module:Volley()
	self:IntervalBar(L["bar_volley"], timer.volley[1], timer.volley[2], icon.volley, true, color.volley)
	
	if UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Paladin"] then
		self:WarningSign(icon.volley, 0.7)
	end
end

function module:Toxin()
	self:Message(L["msg_toxin"], "Personal", false, nil, false)
	self:Sound("Info")
	self:WarningSign(icon.toxin, timer.toxin)
end

function module:ToxinFade()
	self:RemoveWarningSign(icon.toxin)
end



function module:Slow()
	pokeCount = 0
	globDeathCount = 0
	
	if self.db.profile.freezestages then
		self:Message(L["msg_slow"], "Atention", false, nil, false)
	end
end

function module:Freezing()
	if self.db.profile.freezestages then
		self:Message(L["msg_freezing"], "Atention", false, nil, false)
	end
end

function module:Frozen()
	checkPhysical = true
	checkFrost = false
	
	frostDmgCount = 0
	
	self:TriggerEvent("BigWigs_StopCounterBar", self, L["bar_frostDmg"])
	
	if self.db.profile.pokecount then
		self:TriggerEvent("BigWigs_StartCounterBar", self, L["bar_poke"], maxPokeCount, "Interface\\Icons\\"..icon.poke, true, color.poke)
		self:TriggerEvent("BigWigs_SetCounterBar", self, L["bar_poke"], pokeCount)
	end
	
	if self.db.profile.freezestages then
		self:Message(L["msg_frozen"], "Atention", false, nil, false)
		self:WarningSign(icon.poke, 0.7)
	end
end

function module:Crack()
	if self.db.profile.freezestages then
		self:Message(L["msg_crack"], "Atention", false, nil, false)
	end
end

--on shatter emote, start looking for globs
function module:Shatter()
	if self.db.profile.freezestages then
		self:Message(L["msg_shatter"], "Atention", false, nil, false)
	end
	
	self:ScheduleRepeatingEvent("bwviscFindGlob", self.FindGlob, 0.5, self)
end



--look for globs, once found, stop looking, stop registering physical hits, go in glob section
function module:FindGlob()
	if UnitName("target") == bbglobofviscidus and not UnitIsDeadOrGhost("target") then
		self:CancelScheduledEvent("bwviscFindGlob")
		self:ScheduleRepeatingEvent("bwviscFindViscidus", self.FindViscidus, 0.5, self)
		checkPhysical = false
		self:StartGlobBar()
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == bbglobofviscidus and not UnitIsDeadOrGhost("Raid"..i.."target") then
				self:CancelScheduledEvent("bwviscFindGlob")
				self:ScheduleRepeatingEvent("bwviscFindViscidus", self.FindViscidus, 0.5, self)
				checkPhysical = false
				self:StartGlobBar()
				break
			end
		end
	end
end

--glob section, remove the poke bar, start the glob bar, start looking for visc
function module:StartGlobBar()
	if self.db.profile.glob then
		self:TriggerEvent("BigWigs_StopCounterBar", self, L["bar_poke"])
	
		self:TriggerEvent("BigWigs_StartCounterBar", self, L["bar_glob"], maxGlobDeathCount, "Interface\\Icons\\"..icon.glob, true, color.glob)
		self:TriggerEvent("BigWigs_SetCounterBar", self, L["bar_glob"], globDeathCount)
	end
	
	self:ScheduleRepeatingEvent("bwviscFindGlob", self.FindGlob, 0.5, self)
end

--look for visc, once found, stop looking, start registering frost damage, go in frost section
function module:FindViscidus()
	if UnitName("target") == bbviscidus then
		self:CancelScheduledEvent("bwviscFindViscidus")
		self:StartFostDmgBar()
		checkFrost = true
	else
		for i = 1, GetNumRaidMembers(), 1 do
			if UnitName("Raid"..i.."target") == bbviscidus then
				self:CancelScheduledEvent("bwviscFindViscidus")
				self:StartFostDmgBar()
				checkFrost = true
				break
			end
		end
	end
end

--frost section, remove glob bar, start frost bar
function module:StartFostDmgBar()
	self:TriggerEvent("BigWigs_StopCounterBar", self, L["bar_glob"])
	
	if self.db.profile.freezecount then
		self:TriggerEvent("BigWigs_StartCounterBar", self, L["bar_frostDmg"], maxFreezeCount, "Interface\\Icons\\"..icon.frostDmg, true, color.frostDmg)
		self:TriggerEvent("BigWigs_SetCounterBar", self, L["bar_frostDmg"], frostDmgCount)
	end
end



--update frost bar on frost dmg
function module:FrostDmg()
	frostDmgCount = frostDmgCount + 1
	
	if self.db.profile.freezecount then
		self:TriggerEvent("BigWigs_SetCounterBar", self, L["bar_frostDmg"], frostDmgCount)
	end
end

--update poke bar on poke damage
function module:CheckPhysical(msg)
	if checkPhysical == true then
		if string.find(msg, L["trigger_pokeYou"]) or string.find(msg, L["trigger_pokeCritYou"]) or string.find(msg, L["trigger_pokeOther"]) or string.find(msg, L["trigger_pokeCritOther"]) then
			pokeCount = pokeCount + 1
			if self.db.profile.pokecount then
				self:TriggerEvent("BigWigs_SetCounterBar", self, L["bar_poke"], pokeCount)
			end
		end
	end
end

--update glob bar on glob death
function module:Glob()
	globDeathCount = globDeathCount + 1
	
	if self.db.profile.glob then
		self:TriggerEvent("BigWigs_SetCounterBar", self, L["bar_glob"], globDeathCount)
	end
end
