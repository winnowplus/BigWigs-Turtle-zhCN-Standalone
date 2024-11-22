
local module, L = BigWigs:ModuleDeclaration("Atiesh", "Stratholme")
local BZ = AceLibrary("Babble-Zone-2.2")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30092
module.enabletrigger = module.translatedName
module.toggleoptions = {"unholyaura", "shadowbolt", "breathofsargeras", "bosskill"}
module.zonename = {
	AceLibrary("AceLocale-2.2"):new("BigWigs")["Outdoor Raid Bosses Zone"],
	AceLibrary("Babble-Zone-2.2")["Stratholme"],
}

L:RegisterTranslations("enUS", function() return {
	cmd = "Atiesh",

	unholyaura_cmd = "unholyaura",
	unholyaura_name = "邪恶光环警报",
	unholyaura_desc = "邪恶光环时进行警告",

	shadowbolt_cmd = "shadowbolt",
	shadowbolt_name = "暗影箭警报",
	shadowbolt_desc = "暗影箭时进行警告",
	
	breathofsargeras_cmd = "breathofsargeras",
	breathofsargeras_name = "萨格拉斯之息警报",
	breathofsargeras_desc = "萨格拉斯之息时进行警告",
	
	
	--is engage trigger, aura hits every 2 sec
	trigger_gainAura = "Atiesh gains Unholy Aura (1).", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	
	--every 2sec
	trigger_auraHits = "Atiesh's Unholy Aura hits",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
	bar_unholyAura = "邪恶光环",
	
	trigger_shadowBolt = "Atiesh begins to cast Shadow Bolt.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_shadowBoltCd = "暗影箭冷却",
	bar_shadowBoltCast = "施放暗影箭！",
	
	trigger_breathOfSargerasCast = "Atiesh begins to perform Breath of Sargeras.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_breathOfSargerasCd = "萨格拉斯之息冷却",
	bar_breathOfSargerasCast = "施放萨格拉斯之息",
	msg_breathOfSargeras = "萨格拉斯之息 - 驱散（仅近战和猎人）",
	
	trigger_breathOfSargerasYou = "You are afflicted by Breath of Sargeras", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE   You are afflicted by Breath of Sargeras(1)...
	bar_breathOfSargerasAfflic = " 被诅咒",
	
	trigger_breathOfSargerasFadeYou = "Breath of Sargeras fades from You.", --CHAT_MSG_SPELL_AURA_GONE_SELF
	trigger_breathOfSargerasFadeOther = "Breath of Sargeras fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_PARTY
	
	
	trigger_eyeOfNaxx = "The living are here!", --CHAT_MSG_MONSTER_YELL
	bar_eyeOfNaxx = "纳克萨玛斯之眼！",
	--trigger_eyeOfNaxxDead = "Eye of Naxxramas dies." --CHAT_MSG_COMBAT_HOSTILE_DEATH
	EyeofNaxxramas = "Eye of Naxxramas",
	Atiesh = "Atiesh",
} end )

L:RegisterTranslations("zhCN", function() return {
	cmd = "Atiesh",

	unholyaura_cmd = "unholyaura",
	unholyaura_name = "邪恶光环警报",
	unholyaura_desc = "邪恶光环时进行警告",

	shadowbolt_cmd = "shadowbolt",
	shadowbolt_name = "暗影箭警报",
	shadowbolt_desc = "暗影箭时进行警告",
	
	breathofsargeras_cmd = "breathofsargeras",
	breathofsargeras_name = "萨格拉斯之息警报",
	breathofsargeras_desc = "萨格拉斯之息时进行警告",
	
	
	--is engage trigger, aura hits every 2 sec
	trigger_gainAura = "埃提耶什获得了邪恶光环的效果。", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	
	--every 2sec
	trigger_auraHits = "埃提耶什的邪恶光环击中",--CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE
	bar_unholyAura = "邪恶光环",
	
	trigger_shadowBolt = "埃提耶什开始施放暗影箭。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_shadowBoltCd = "暗影箭冷却",
	bar_shadowBoltCast = "施放暗影箭！",
	
	trigger_breathOfSargerasCast = "埃提耶什开始施展萨格拉斯之息。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_breathOfSargerasCd = "萨格拉斯之息冷却",
	bar_breathOfSargerasCast = "施放萨格拉斯之息",
	msg_breathOfSargeras = "萨格拉斯之息 - 驱散（仅近战和猎人）",
	
	trigger_breathOfSargerasYou = "你受到了萨格拉斯之息效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE   You are afflicted by Breath of Sargeras(1)...
	bar_breathOfSargerasAfflic = " 被诅咒",
	
	trigger_breathOfSargerasFadeYou = "萨格拉斯之息效果从你身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF
	trigger_breathOfSargerasFadeOther = "萨格拉斯之息效果从(.+)身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_PARTY
	
	
	trigger_eyeOfNaxx = "这儿有活人！", --CHAT_MSG_MONSTER_YELL
	bar_eyeOfNaxx = "纳克萨玛斯之眼！",
	--trigger_eyeOfNaxxDead = "Eye of Naxxramas dies." --CHAT_MSG_COMBAT_HOSTILE_DEATH
	EyeofNaxxramas = "纳克萨玛斯之眼",
	Atiesh = "埃提耶什",
} end )

local timer = {
	unholyAura = 2,
	
	shadowBoltCd = {12.5,17.5}, --13-18 minus 0.5sec cast
	shadowBoltCast = 0.5,
	
	breathOfSargerasCd = {13,23}, --15-25 minus 2sec cast
	breathOfSargerasCast = 2,
	breathOfSargerasAfflic = 90,
	
	eyeOfNaxx = 7, --to be confirmed
}
local icon = {
	unholyAura = "spell_shadow_unholystrength",
	shadowBolt = "spell_shadow_shadowbolt",
	breathOfSargeras = "spell_shadow_metamorphosis",
	
	eyeOfNaxx = "inv_misc_shadowegg",
}
local color = {
	unholyAura = "Black",
	
	shadowBoltCd = "Blue",
	shadowBoltCast = "Magenta",
	
	breathOfSargerasCd = "Yellow",
	breathOfSargerasCast = "Orange",
	breathOfSargerasAfflic = "Red",
	
	eyeOfNaxx = "White",
}
local syncName = {
	unholyAura = "AtieshUnholyAura"..module.revision,
	shadowBolt = "AtieshShadowBolt"..module.revision,
	
	breathOfSargerasCast = "AtieshBreathOfSargerasCast"..module.revision,
	breathOfSargerasAfflic = "AtieshBreathOfSargerasAfflic"..module.revision,
	breathOfSargerasFade = "AtieshBreathOfSargerasFade"..module.revision,
	
	eyeOfNaxx = "EyeOfNaxx"..module.revision,
	eyeOfNaxxDead = "EyeOfNaxxDead"..module.revision,
}

function module:OnRegister()
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --Debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_gainAura
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_auraHits
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_auraHits
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_shadowBolt, trigger_breathOfSargerasCast
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_breathOfSargerasYou
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_breathOfSargerasFadeYou
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_breathOfSargerasFadeOther
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --trigger_eyeOfNaxx
	
	self:ThrottleSync(1, syncName.unholyAura)
	self:ThrottleSync(5, syncName.shadowBolt)
	
	self:ThrottleSync(5, syncName.breathOfSargerasCast)
	self:ThrottleSync(0, syncName.breathOfSargerasAfflic)
	self:ThrottleSync(0, syncName.breathOfSargerasFade)
	
	self:ThrottleSync(3, syncName.eyeOfNaxx)
	self:ThrottleSync(3, syncName.eyeOfNaxxDead)
end

function module:OnSetup()
	self.started = nil
	
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH") --eyeOfNaxxDead 
end

function module:OnEngage()	
	if self.db.profile.unholyaura then
		self:Bar(L["bar_unholyAura"], timer.unholyAura, icon.unholyAura, true, color.unholyAura)
	end
	
	if self.db.profile.breathofsargeras then
		self:IntervalBar(L["bar_breathOfSargerasCd"], timer.breathOfSargerasCd[1], timer.breathOfSargerasCd[2], icon.breathOfSargeras, true, color.breathOfSargerasCd)
	end
end

function module:OnDisengage()
end

function module:MINIMAP_ZONE_CHANGED(msg)
	if GetMinimapZoneText() == BZ["Elders' Square"] and not self.core:IsModuleActive(module.translatedName) then
		self.core:EnableModule(module.translatedName)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["trigger_eyeOfNaxx"] then
		self:Sync(syncName.eyeOfNaxx)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)
	
	if (msg == string.format(UNITDIESOTHER, L["EyeofNaxxramas"])) then
		self:Sync(syncName.eyeOfNaxxDead)
	
	elseif (msg == string.format(UNITDIESOTHER, L["Atiesh"])) then
		self:SendBossDeathSync()
	end
end

function module:Event(msg)
	if msg == L["trigger_gainAura"] then
		module:SendEngageSync()
		
	elseif string.find(msg, L["trigger_auraHits"]) then
		self:Sync(syncName.unholyAura)
		
	elseif msg == L["trigger_shadowBolt"] then
		self:Sync(syncName.shadowBolt)
		
	elseif msg == L["trigger_breathOfSargerasCast"] then
		self:Sync(syncName.breathOfSargerasCast)
		
	elseif string.find(msg, L["trigger_breathOfSargerasYou"]) then
		if UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Hunter"] then
			self:Sync(syncName.breathOfSargerasAfflic .. " " .. UnitName("Player"))
		elseif UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Druid"] then
			if UnitManaMax("Player") < 5000 then
				self:Sync(syncName.breathOfSargerasAfflic .. " " .. UnitName("Player"))
			end
		end
		
	elseif msg == L["trigger_breathOfSargerasFadeYou"] then
		self:Sync(syncName.breathOfSargerasFade .. " " .. UnitName("Player"))
		
	elseif string.find(msg, L["trigger_breathOfSargerasFadeOther"]) then
		local _,_,breathFadePerson = string.find(msg, L["trigger_breathOfSargerasFadeOther"])
		self:Sync(syncName.breathOfSargerasFade .. " " .. breathFadePerson)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.unholyAura and self.db.profile.unholyaura then
		self:UnholyAura()
	
	elseif sync == syncName.shadowBolt and self.db.profile.shadowbolt then
		self:ShadowBolt()
		
	elseif sync == syncName.breathOfSargerasCast and self.db.profile.breathofsargeras then
		self:BreathOfSargerasCast()
		
	elseif sync == syncName.breathOfSargerasAfflic and rest and self.db.profile.breathofsargeras then
		self:BreathOfSargerasAfflic(rest)
	elseif sync == syncName.breathOfSargerasFade and rest and self.db.profile.breathofsargeras then
		self:BreathOfSargerasFade(rest)
		
	elseif sync == syncName.eyeOfNaxx then
		self:EyeOfNaxx()
	elseif sync == syncName.eyeOfNaxxDead then
		self:EyeOfNaxxDead()
	end
end


function module:UnholyAura()
	self:RemoveBar(L["bar_unholyAura"])
	
	self:Bar(L["bar_unholyAura"], timer.unholyAura, icon.unholyAura, true, color.unholyAura)
end

function module:ShadowBolt()
	self:RemoveBar(L["bar_shadowBoltCd"])
	
	self:Bar(L["bar_shadowBoltCast"], timer.shadowBoltCast, icon.shadowBolt, true, color.shadowBoltCast)
	
	self:DelayedIntervalBar(timer.shadowBoltCast, L["bar_shadowBoltCd"], timer.shadowBoltCd[1], timer.shadowBoltCd[2], icon.shadowBolt, true, color.shadowBoltCd)
end

function module:BreathOfSargerasCast()
	self:RemoveBar(L["bar_breathOfSargerasCd"])
	
	self:Bar(L["bar_breathOfSargerasCast"], timer.breathOfSargerasCast, icon.breathOfSargeras, true, color.breathOfSargerasCast)
	
	self:DelayedIntervalBar(timer.breathOfSargerasCast, L["bar_breathOfSargerasCd"], timer.breathOfSargerasCd[1], timer.breathOfSargerasCd[2], icon.breathOfSargeras, true, color.breathOfSargerasCd)
	
	if UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Mage"] then
		self:DelayedMessage(timer.breathOfSargerasCast, L["msg_breathOfSargeras"], "Important", false, nil, false)
	end
end

function module:BreathOfSargerasAfflic(rest)	
	self:Bar(rest..L["bar_breathOfSargerasAfflic"], timer.breathOfSargerasAfflic, icon.breathOfSargeras, true, color.breathOfSargerasAfflic)
	
	if UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Mage"] then
		self:WarningSign(icon.breathOfSargeras, 1)
	end
end

function module:BreathOfSargerasFade(rest)
	self:RemoveBar(rest..L["bar_breathOfSargerasAfflic"])
end

function module:EyeOfNaxx()
	self:Bar(L["bar_eyeOfNaxx"], timer.eyeOfNaxx, icon.eyeOfNaxx, true, color.eyeOfNaxx)
	self:WarningSign(icon.eyeOfNaxx, timer.eyeOfNaxx)
	self:Sound("Beware")
end

function module:EyeOfNaxxDead()
	self:RemoveBar(L["bar_eyeOfNaxx"])
	
	self:RemoveWarningSign(icon.eyeOfNaxx)
end
