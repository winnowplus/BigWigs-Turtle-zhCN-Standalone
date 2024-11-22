
local module, L = BigWigs:ModuleDeclaration("High Priestess Jeklik", "Zul'Gurub")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30083
module.enabletrigger = module.translatedName
module.toggleoptions = {"heal", "fear", "fire", "mindflay", "silence", "swarm", "phase", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Jeklik",

	heal_cmd = "heal",
    heal_name = "治疗警报",
    heal_desc = "治疗时进行警告",
	
	fear_cmd = "fear",
    fear_name = "恐惧警报",
    fear_desc = "恐惧出现时进行警告",
	
	fire_cmd = "fire",
    fire_name = "火蝠警报",
    fire_desc = "站在火中的警告",
	
	mindflay_cmd = "mindflay",
    mindflay_name = "精神鞭笞警报",
    mindflay_desc = "施放精神鞭笞时进行警告",

	silence_cmd = "silence",
    silence_name = "沉默警报",
    silence_desc = "沉默时进行警告",

	swarm_cmd = "swarm",
    swarm_name = "蝙蝠群警报",
    swarm_desc = "蝙蝠群出现时进行警告",
	
	phase_cmd = "phase",
    phase_name = "阶段通知",
    phase_desc = "Boss阶段转换时进行警告",
	
	
	trigger_engage = "Lord Hir'eek, grant me wings of vengance!",--CHAT_MSG_MONSTER_YELL
	
	trigger_heal = "High Priestess Jeklik begins to cast Great Heal.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF",
    bar_healCast = "治疗 - 打断！",
    bar_healCd = "治疗冷却",
    msg_healCast = "治疗！打断它！",
	
	trigger_attack1 = "High Priestess Jeklik attacks", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES
	trigger_attack2 = "High Priestess Jeklik misses", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES
	trigger_attack3 = "High Priestess Jeklik hits", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS
	trigger_attack4 = "High Priestess Jeklik crits", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS
	trigger_kick1 = "Kick hits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_kick2 = "Kick crits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_kick3 = "Kick was blocked by High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel1 = "Pummel hits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel2 = "Pummel crits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel3 = "Pummel was blocked by High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash1 = "Shield Bash hits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash2 = "Shield Bash crits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash3 = "Shield Bash was blocked by High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_earthShock1 = "Earth Shock hits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_earthShock2 = "Earth Shock crits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	
	--this happens in P1
	trigger_terrifyingScreech1 = "afflicted by Terrifying Screech",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_terrifyingScreech2 = "Terrifying Screech was resisted",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_terrifyingScreech3 = "Terrifying Screech fail",--TBD
	
	--guessing this happens in P2
	trigger_psychicScream1 = "afflicted by Psychic Scream",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_psychicScream2 = "Psychic Scream was resisted",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_psychicScream3 = "Psychic Scream fail",--TBD

    bar_fearCd = "恐惧冷却",
	
	trigger_liquidFire = "Liquid Fire hits you for",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_liquidFire = "远离火焰！",
	
	trigger_mindflay = "afflicted by Mind Flay",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE //CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
		--mindflay chains, this trigger is unreliable
	--trigger_mindflayFade = "Mind Flay fades",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mindflay = "精神鞭笞 - 打断！",
	
	trigger_silence = "Sonic Burst hits",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_silenceAfflicted = "被沉默",
    bar_silenceCd = "沉默冷却",
	
	trigger_swarm = "TBD",--TBD, is there a trigger or it's on a fixed timer?
    bar_swam = "蝙蝠群",
    msg_swarm = "蝙蝠群！AOE！",
	
    msg_p2 = "第二阶段",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Jeklik",

	heal_cmd = "heal",
    heal_name = "治疗警报",
    heal_desc = "治疗时进行警告",
	
	fear_cmd = "fear",
    fear_name = "恐惧警报",
    fear_desc = "恐惧出现时进行警告",
	
	fire_cmd = "fire",
    fire_name = "火蝠警报",
    fire_desc = "站在火中的警告",
	
	mindflay_cmd = "mindflay",
    mindflay_name = "精神鞭笞警报",
    mindflay_desc = "施放精神鞭笞时进行警告",

	silence_cmd = "silence",
    silence_name = "沉默警报",
    silence_desc = "沉默时进行警告",

	swarm_cmd = "swarm",
    swarm_name = "蝙蝠群警报",
    swarm_desc = "蝙蝠群出现时进行警告",
	
	phase_cmd = "phase",
    phase_name = "阶段通知",
    phase_desc = "Boss阶段转换时进行警告",
	
	
	trigger_engage = "Lord Hir'eek, grant me wings of vengance!",--CHAT_MSG_MONSTER_YELL
	
	trigger_heal = "High Priestess Jeklik begins to cast Great Heal.",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF",
    bar_healCast = "治疗 - 打断！",
    bar_healCd = "治疗冷却",
    msg_healCast = "治疗！打断它！",
	
	trigger_attack1 = "High Priestess Jeklik attacks", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES
	trigger_attack2 = "High Priestess Jeklik misses", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES
	trigger_attack3 = "High Priestess Jeklik hits", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS
	trigger_attack4 = "High Priestess Jeklik crits", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS
	trigger_kick1 = "Kick hits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_kick2 = "Kick crits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_kick3 = "Kick was blocked by High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel1 = "Pummel hits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel2 = "Pummel crits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel3 = "Pummel was blocked by High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash1 = "Shield Bash hits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash2 = "Shield Bash crits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash3 = "Shield Bash was blocked by High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_earthShock1 = "Earth Shock hits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_earthShock2 = "Earth Shock crits High Priestess Jeklik", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	
	--this happens in P1
	trigger_terrifyingScreech1 = "afflicted by Terrifying Screech",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_terrifyingScreech2 = "Terrifying Screech was resisted",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_terrifyingScreech3 = "Terrifying Screech fail",--TBD
	
	--guessing this happens in P2
	trigger_psychicScream1 = "afflicted by Psychic Scream",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_psychicScream2 = "Psychic Scream was resisted",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_psychicScream3 = "Psychic Scream fail",--TBD

    bar_fearCd = "恐惧冷却",
	
	trigger_liquidFire = "Liquid Fire hits you for",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_liquidFire = "远离火焰！",
	
	trigger_mindflay = "afflicted by Mind Flay",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE //CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
		--mindflay chains, this trigger is unreliable
	--trigger_mindflayFade = "Mind Flay fades",--CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mindflay = "精神鞭笞 - 打断！",
	
	trigger_silence = "Sonic Burst hits",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_silenceAfflicted = "被沉默",
    bar_silenceCd = "沉默冷却",
	
	trigger_swarm = "TBD",--TBD, is there a trigger or it's on a fixed timer?
    bar_swam = "蝙蝠群",
    msg_swarm = "蝙蝠群！AOE！",
	
    msg_p2 = "第二阶段",
} end )

local timer = {
	healCast = 4,
	healCd = 20,--need data

	firstTerrifyingScreechCd = 18,--need data
	terrifyingScreechCd = 30,--need data
	psychicScreamCd = 39.5,--need data
	
	mindflay = 25,--need data
	
	firstSilence = 12,--need data
	silenceCd = 10,--20cd -10afflicted
	silenceAfflicted = 10,
	
	swarm = 45,--need data
}
local icon = {
	heal = "Spell_Holy_Heal",
	terrifyingScreech = "Spell_Shadow_SummonImp",
	psychicScream = "Spell_Shadow_PsychicScream",
	liquidFire = "spell_fire_incinerate",
	mindflay = "Spell_Shadow_SiphonMana",
	silence = "spell_shadow_teleport",
	swarm = "ability_hunter_pet_bat",
}
local color = {
	healCast = "Green",
	healCd = "White",
	fearCd = "Blue",
	mindflay = "Orange",
	silenceCd = "Black",
	silenceAfflicted = "Cyan",
	swarm = "Red",
}
local syncName = {
	heal = "JeklikHeal"..module.revision,
	healOver = "JeklikHealStop"..module.revision,
	terrifyingScreech = "JeklikTerrifyingScreech"..module.revision,
	psychicScream = "JeklikPsychicScream"..module.revision,
	mindflay = "Jeklikmindflay"..module.revision,
	mindflayFade = "JeklikmindflayEnd2"..module.revision,
	silence = "JeklikSilence"..module.revision,
	swarm = "JeklikSwarmBats"..module.revision,
	phase = "JeklikPhase"..module.revision,
}

module:RegisterYellEngage(L["trigger_engage"])

local phase2 = nil
local castingHeal = nil
local castingMindFlay = nil

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--Debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "Event") --trigger_kick1-2-3, trigger_pummel1-2-3, trigger_shieldBash1-2-3, trigger_earthShock1-2
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "Event") --trigger_kick1-2-3, trigger_pummel1-2-3, trigger_shieldBash1-2-3, trigger_earthShock1-2
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_kick1-2-3, trigger_pummel1-2-3, trigger_shieldBash1-2-3, trigger_earthShock1-2
		
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Event") --trigger_attack3, trigger_attack4
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Event") --trigger_attack3, trigger_attack4
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Event") --trigger_attack3, trigger_attack4
	
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Event") --trigger_attack1, trigger_attack2
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Event") --trigger_attack1, trigger_attack2
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Event") --trigger_attack1, trigger_attack2
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event")--trigger_heal
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--trigger_terrifyingScreech1, trigger_terrifyingScreech2, trigger_psychicScream1, trigger_psychicScream2, trigger_mindflay
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--trigger_terrifyingScreech1, trigger_terrifyingScreech2, trigger_psychicScream1, trigger_psychicScream2, trigger_mindflay
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--trigger_terrifyingScreech1, trigger_terrifyingScreech2, trigger_psychicScream1, trigger_psychicScream2, trigger_mindflay
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--trigger_liquidFire, trigger_silence
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--trigger_silence
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--trigger_silence
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--trigger_mindflayFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--trigger_mindflayFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--trigger_mindflayFade
	
	self:RegisterEvent("UNIT_HEALTH")


	self:ThrottleSync(4, syncName.heal)
	self:ThrottleSync(4, syncName.healOver)
	
	self:ThrottleSync(10, syncName.terrifyingScreech)
	self:ThrottleSync(10, syncName.psychicScream)
	
	self:ThrottleSync(1.5, syncName.mindflay)
	self:ThrottleSync(1.5, syncName.mindflayFade)
	
	self:ThrottleSync(5, syncName.silence)
	
	self:ThrottleSync(5, syncName.swarm)
end

function module:OnSetup()
end

function module:OnEngage()
	phase2 = nil
	castingHeal = nil
	castingMindFlay = nil
	
	if self.db.profile.fear then
		self:Bar(L["bar_fearCd"], timer.firstTerrifyingScreechCd, icon.terrifyingScreech, true, color.fearCd)
	end
	
	if self.db.profile.silence then
		self:Bar(L["bar_silenceCd"], timer.firstSilence, icon.silence, true, color.silenceCd)
	end

	if self.db.profile.swarm then
		self:Bar(L["bar_swam"], timer.swarm, icon.swarm, true, color.swarm)
	end
end

function module:OnDisengage()
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == module.translatedName then
		local healthPct = UnitHealth(msg) * 100 / UnitHealthMax(msg)
		if healthPct <= 50 and not phase2 then
			self:Sync(syncName.phase)
			phase2 = true
			
		elseif healthPct > 50 and phase2 then
			phase2 = nil
		end
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_heal"]) then
		self:Sync(syncName.heal)
	elseif castingHeal == true and (string.find(msg, L["trigger_attack1"]) or string.find(msg, L["trigger_attack2"]) or string.find(msg, L["trigger_attack3"]) or string.find(msg, L["trigger_attack4"])
		or string.find(msg, L["trigger_kick1"]) or string.find(msg, L["trigger_kick2"]) or string.find(msg, L["trigger_kick3"]) -- kicked
		or string.find(msg, L["trigger_pummel1"]) or string.find(msg, L["trigger_pummel2"]) or string.find(msg, L["trigger_pummel3"]) -- pummeled
		or string.find(msg, L["trigger_shieldBash1"]) or string.find(msg, L["trigger_shieldBash2"]) or string.find(msg, L["trigger_shieldBash3"]) -- shield bashed
		or string.find(msg, L["trigger_earthShock1"]) or string.find(msg, L["trigger_earthShock2"])) then -- earth shocked
		self:Sync(syncName.healOver)
	
	elseif string.find(msg, L["trigger_terrifyingScreech1"]) or string.find(msg, L["trigger_terrifyingScreech2"]) or string.find(msg, L["trigger_terrifyingScreech3"]) then
		self:Sync(syncName.terrifyingScreech)
	elseif string.find(msg, L["trigger_psychicScream1"]) or string.find(msg, L["trigger_psychicScream2"]) or string.find(msg, L["trigger_psychicScream3"]) then
		self:Sync(syncName.psychicScream)
			
	elseif string.find(msg, L["trigger_liquidFire"]) and self.db.profile.fire then
		self:LiquidFire()
		
	elseif string.find(msg, L["trigger_mindflay"]) then
		self:Sync(syncName.mindflay)
	elseif castingMindFlay == true and (string.find(msg, L["trigger_attack1"]) or string.find(msg, L["trigger_attack2"]) or string.find(msg, L["trigger_attack3"]) or string.find(msg, L["trigger_attack4"])
		or string.find(msg, L["trigger_kick1"]) or string.find(msg, L["trigger_kick2"]) or string.find(msg, L["trigger_kick3"]) -- kicked
		or string.find(msg, L["trigger_pummel1"]) or string.find(msg, L["trigger_pummel2"]) or string.find(msg, L["trigger_pummel3"]) -- pummeled
		or string.find(msg, L["trigger_shieldBash1"]) or string.find(msg, L["trigger_shieldBash2"]) or string.find(msg, L["trigger_shieldBash3"]) -- shield bashed
		or string.find(msg, L["trigger_earthShock1"]) or string.find(msg, L["trigger_earthShock2"])) then -- earth shocked
		self:Sync(syncName.mindflayFade)

	elseif string.find(msg, L["trigger_silence"]) then
		self:Sync(syncName.silence)

	elseif msg == L["trigger_swarm"] then
		self:Sync(syncName.swarm)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.heal and self.db.profile.heal then
		self:Heal()
	elseif sync == syncName.healOver and self.db.profile.heal then
		self:HealOver()
	elseif sync == syncName.terrifyingScreech and self.db.profile.fear then
		self:TerrifyingScreech()
	elseif sync == syncName.psychicScream and self.db.profile.fear then
		self:PsychicScream()
	elseif sync == syncName.mindflay and self.db.profile.mindflay then
		self:MindFlay()
	elseif sync == syncName.mindflayFade and self.db.profile.mindflay then
		self:MindFlayFade()
	elseif sync == syncName.silence and self.db.profile.silence then
		self:Silence()
	elseif sync == syncName.swarm and self.db.profile.swarm then
		self:Swarm()
	elseif sync == syncName.phase then
		self:Phase()
	end
end


function module:Heal()
	castingHeal = true
	self:Bar(L["bar_healCast"], timer.healCast, icon.heal, true, color.healCast)
	self:Message(L["msg_healCast"], "Positive", false, nil, false)
	
	if UnitClass("Player") == BC["Mage"] then
		self:Sound("Beware")
		self:WarningSign(icon.heal, 0.7)
	elseif UnitClass("Player") == BC["Warrior"] then
		self:Sound("Beware")
		self:WarningSign(icon.heal, timer.healCast)
	elseif UnitClass("Player") == BC["Rogue"] then
		self:Sound("Beware")
		self:WarningSign(icon.heal, timer.healCast)
	end
end

function module:HealOver()
	castingHeal = nil
	self:RemoveBar(L["bar_healCast"])
	self:RemoveWarningSign(icon.heal)
end

function module:TerrifyingScreech()
	self:Bar(L["bar_fearCd"], timer.terrifyingScreechCd, icon.terrifyingScreech, true, color.fearCd)
end

function module:PsychicScream()
	self:Bar(L["bar_fearCd"], timer.psychicScreamCd, icon.psychicScream, true, color.fearCd)
end

function module:LiquidFire()
	self:Message(L["msg_liquidFire"], "Urgent", false, nil, false)
	self:Sound("Info")
	self:WarningSign(icon.liquidFire, 0.7)
end

function module:MindFlay()
	castingMindFlay = true
	self:Bar(L["bar_mindflay"], timer.mindflay, icon.mindflay, true, color.mindflay)
	
	if UnitClass("Player") == BC["Mage"] then
		self:Sound("Alarm")
		self:WarningSign(icon.mindflay, 0.7)
	elseif UnitClass("Player") == BC["Warrior"] then
		self:Sound("Alarm")
		self:WarningSign(icon.mindflay, timer.mindflay)
	elseif UnitClass("Player") == BC["Rogue"] then
		self:Sound("Alarm")
		self:WarningSign(icon.mindflay, timer.mindflay)
	end
end

function module:MindFlayFade()
	castingMindFlay = nil
	self:RemoveBar(L["bar_mindflay"])
	self:RemoveWarningSign(icon.heal)
end

function module:Silence()
	self:Bar(L["bar_silenceAfflicted"], timer.silenceAfflicted, icon.silence, true, color.silenceAfflicted)
	self:DelayedBar(timer.silenceAfflicted, L["bar_silenceCd"], timer.silenceCd, icon.silence, true, color.silenceCd)
end

function module:Swarm()
	self:RemoveBar(L["bar_swam"])
	self:Message(L["msg_swarm"], "Urgent", false, nil, false)
end

function module:Phase()
	phase2 = true
	
	if self.db.profile.phase then
		self:Message(L["msg_p2"])
		
		self:RemoveBar(L["bar_fearCd"])
		self:RemoveBar(L["bar_silenceCd"])
		self:RemoveBar(L["bar_swam"])
		
		self:CancelDelayedBar(L["bar_silenceCd"])
	end
end
