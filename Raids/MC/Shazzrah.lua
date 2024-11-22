
local module, L = BigWigs:ModuleDeclaration("Shazzrah", "Molten Core")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30075
module.enabletrigger = module.translatedName
module.toggleoptions = {"counterspell", "curse", "deaden", "blink", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Shazzrah",

	counterspell_cmd = "counterspell",
    counterspell_name = "法术反制警报",
    counterspell_desc = "法术反制出现时进行警告",

	curse_cmd = "curse",
    curse_name = "沙斯拉尔的诅咒警报",
    curse_desc = "沙斯拉尔的诅咒出现时进行警告",

	deaden_cmd = "deaden",
    deaden_name = "衰减魔法警报",
    deaden_desc = "衰减魔法出现时进行警告",

	blink_cmd = "blink",
    blink_name = "闪现警报",
    blink_desc = "闪现出现时进行警告",
	
	
	trigger_counterspell = "Shazzrah's Counterspell", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	trigger_counterspell2 = "Shazzrah interrupt", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_counterspellCd = "法术反制冷却",
    bar_counterspellSoon = "即将法术反制...",
    msg_counterspellSoon = "即将法术反制 - 停止施法！",
    msg_counterspell = "法术反制完毕 - 开始施法！",
	
	trigger_curse = "afflicted by Shazzrah's Curse.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_curse2 = "Shazzrah's Curse was resisted", --CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_curseCd = "沙斯拉尔的诅咒冷却",
    msg_curse = "沙斯拉尔的诅咒 - 解除诅咒！",
	
	trigger_deaden = "Shazzrah gains Deaden Magic.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_deadenFade = "Deaden Magic fades from Shazzrah.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_deadenCd = "衰减魔法冷却",
    bar_deadenDur = "衰减魔法已开启！",
    msg_deaden = "衰减魔法 - 驱散它！",
	
	--there is no trigger blink
		--instead, checking for target change, if found, expecting a blink to have happenned
    bar_blinkCd = "闪现冷却",
    bar_blinkSoon = "即将闪现...",
    msg_blink = "闪现 - 仇恨重置！",
    c_shazzrah = "Shazzrah",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Shazzrah",

	counterspell_cmd = "counterspell",
    counterspell_name = "法术反制警报",
    counterspell_desc = "法术反制出现时进行警告",

	curse_cmd = "curse",
    curse_name = "沙斯拉尔的诅咒警报",
    curse_desc = "沙斯拉尔的诅咒出现时进行警告",

	deaden_cmd = "deaden",
    deaden_name = "衰减魔法警报",
    deaden_desc = "衰减魔法出现时进行警告",

	blink_cmd = "blink",
    blink_name = "闪现警报",
    blink_desc = "闪现出现时进行警告",
	
	
	trigger_counterspell = "沙斯拉尔打断了", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	trigger_counterspell2 = "沙斯拉尔的法术反制被(.+)抵抗了。", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_counterspellCd = "法术反制冷却",
    bar_counterspellSoon = "即将法术反制...",
    msg_counterspellSoon = "即将法术反制 - 停止施法！",
    msg_counterspell = "法术反制完毕 - 开始施法！",
	
	trigger_curse = "受到了沙斯拉尔的诅咒效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_curse2 = "沙斯拉尔的诅咒被(.+)抵抗了。", --CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_curseCd = "沙斯拉尔的诅咒冷却",
    msg_curse = "沙斯拉尔的诅咒 - 解除诅咒！",
	
	trigger_deaden = "沙斯拉尔获得了衰减魔法的效果。", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	trigger_deadenFade = "衰减魔法效果从沙斯拉尔身上消失。", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_deadenCd = "衰减魔法冷却",
    bar_deadenDur = "衰减魔法已开启！",
    msg_deaden = "衰减魔法 - 驱散它！",
	
	--there is no trigger blink
		--instead, checking for target change, if found, expecting a blink to have happenned
    bar_blinkCd = "闪现冷却",
    bar_blinkSoon = "即将闪现...",
    msg_blink = "闪现 - 仇恨重置！",
    c_shazzrah = "沙斯拉尔",
} end)

local timer = {
	counterspellFirstCd = 14, --saw 14.703, supposed to be 15
	counterspellCd = 16, --saw 17.92, supposed to be 16,18
	counterspellSoon = 3,
	
	curseFirstCd = 10, --saw 9.81, supposed to be 10
	curseCd =  20, --saw 19.926, supposed to be 20
	
	deadenFirstCd = 4.5, --saw 4.696, supposed to be 5
	deadenCd = {7,14}, -- saw 7.412, 10.423, supposed to be 7,14
	deadenDur = 30,

	blinkFirstCd = 25, --saw 30, supposed to be 25,30
	blinkCd = 30, --supposed to be 30,35
	blinkSoon = 5,
}
local icon = {
	counterspell = "Spell_Frost_IceShock",
	curse = "Spell_Shadow_AntiShadow",
	deaden = "Spell_Holy_SealOfSalvation",
	blink = "Spell_Arcane_Blink",
}
local color = {
	counterspellCd = "Orange",
	counterspellSoon = "Red",
	
	curseCd = "Magenta",
	
	deadenCd = "Cyan",
	deadenDur = "Blue",
	
	blinkCd = "White",
	blinkSoon = "Black",
}
local syncName = {
	counterspell = "ShazzrahCounterspell2"..module.revision,
	curse = "ShazzrahCurse"..module.revision,
	
	deaden = "ShazzrahDeadenMagicOn"..module.revision,
	deadenFade = "ShazzrahDeadenMagicOff"..module.revision,
	
	blink = "ShazzrahBlink2"..module.revision,
	enableCheckBlink = "ShazzrahCheckBlink"..module.revision,
}

local deadenStartTime = 0
local deadenEndTime = 0
local shazzTarget = nil

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --Debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_curse
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_curse
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_deaden
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_deadenFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_counterspell, trigger_counterspell2
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_counterspell, trigger_counterspell2, trigger_curse2
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_counterspell, trigger_counterspell2, trigger_curse2
	
	
	self:ThrottleSync(5, syncName.counterspell)
	self:ThrottleSync(10, syncName.curse)
	
	self:ThrottleSync(5, syncName.deaden)
	self:ThrottleSync(0.1, syncName.deadenFade)
	
	self:ThrottleSync(10, syncName.enableCheckBlink)
	self:ThrottleSync(10, syncName.blink)
end

function module:OnSetup()
end

function module:OnEngage()
	deadenStartTime = 0
	deadenEndTime = 0
	shazzTarget = nil
	
	if self.db.profile.counterspell then
		self:Bar(L["bar_counterspellCd"], timer.counterspellFirstCd, icon.counterspell, true, color.counterspellCd)
		
		if not (UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Hunter"]) then
			self:DelayedBar(timer.counterspellFirstCd, L["bar_counterspellSoon"], timer.counterspellSoon, icon.counterspell, true, color.counterspellSoon)
			self:DelayedWarningSign(timer.counterspellFirstCd - 1, icon.counterspell, timer.counterspellSoon + 1)
			self:DelayedMessage(timer.counterspellFirstCd - 1, L["msg_counterspellSoon"], "Attention", false, nil, false)
			self:DelayedSound(timer.counterspellFirstCd - 1, "Beware")
		end
	end
	
	if self.db.profile.curse then
		self:Bar(L["bar_curseCd"], timer.curseFirstCd, icon.curse, true, color.curseCd)
	end
	
	if self.db.profile.deaden then
		self:Bar(L["bar_deadenCd"], timer.deadenFirstCd, icon.deaden, true, color.deadenCd)
	end
	
	if self.db.profile.blink then
		self:Bar(L["bar_blinkCd"], timer.blinkFirstCd, icon.blink, true, color.blinkCd)
		
		self:DelayedSync(timer.blinkFirstCd - 5, syncName.enableCheckBlink)
		self:DelayedBar(timer.blinkFirstCd, L["bar_blinkSoon"], timer.blinkSoon, icon.blink, true, color.blinkSoon)
	end
end

function module:OnDisengage()
	self:CancelScheduledEvent("CheckBlink")
	self:CancelDelayedSync(syncName.enableCheckBlink)
end

function module:Event(msg)
	if string.find(msg, L["trigger_counterspell"]) or string.find(msg, L["trigger_counterspell2"]) then
		self:Sync(syncName.counterspell)
	
	elseif string.find(msg, L["trigger_curse"]) or string.find(msg, L["trigger_curse2"]) then
		self:Sync(syncName.curse)
		
	elseif msg == L["trigger_deaden"] then
		self:Sync(syncName.deaden)
	
	elseif msg == L["trigger_deadenFade"] then
		self:Sync(syncName.deadenFade)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.counterspell and self.db.profile.counterspell then
		self:Counterspell()
	
	elseif sync == syncName.curse and self.db.profile.curse then
		self:Curse()
		
	elseif sync == syncName.deaden and self.db.profile.deaden then
		self:Deaden()
	elseif sync == syncName.deadenFade and self.db.profile.deaden then
		self:DeadenFade()
		
	elseif sync == syncName.enableCheckBlink and self.db.profile.blink then
		self:EnableCheckBlink()
	elseif sync == syncName.blink and self.db.profile.blink then
		self:Blink()
	end
end


function module:Counterspell()
	self:CancelDelayedBar(L["bar_counterspellSoon"])
	self:CancelDelayedWarningSign(icon.counterspell)
	self:CancelDelayedMessage(L["msg_counterspellSoon"])
	self:CancelDelayedSound("Beware")
	
	self:RemoveBar(L["bar_counterspellSoon"])
	self:RemoveWarningSign(icon.counterspell)
	
	self:Bar(L["bar_counterspellCd"], timer.counterspellCd, icon.counterspell, true, color.counterspellCd)
	
	if not (UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Hunter"]) then
		self:Message(L["msg_counterspell"], "Positive", false, nil, false)
		self:Sound("BikeHorn")
		
		self:DelayedBar(timer.counterspellCd, L["bar_counterspellSoon"], timer.counterspellSoon, icon.counterspell, true, color.counterspellSoon)
		self:DelayedWarningSign(timer.counterspellCd - 1, icon.counterspell, timer.counterspellSoon + 1)
		self:DelayedMessage(timer.counterspellCd - 1, L["msg_counterspellSoon"], "Attention", false, nil, false)
		self:DelayedSound(timer.counterspellCd - 1, "Beware")
	end
end

function module:Curse()
	self:Bar(L["bar_curseCd"], timer.curseCd, icon.curse, true, color.curseCd)
	
	if UnitClass("Player") == BC["Mage"] or UnitClass("Player") == BC["Druid"] then
		self:Message(L["msg_curse"], "Important", false, nil, false)
		self:Sound("Info")
		self:WarningSign(icon.curse, 0.7)
	end
end

function module:Deaden()
	self:RemoveBar(L["bar_deadenCd"])
	
	if UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Priest"] then
		self:Message(L["msg_deaden"], "Urgent", false, nil, false)
		self:Sound("Info")
		self:WarningSign(icon.deaden, timer.deadenDur)
	end
	
	self:Bar(L["bar_deadenDur"], timer.deadenDur, icon.deaden, true, color.deadenDur)
	deadenStartTime = GetTime()
end

function module:DeadenFade()
	self:RemoveBar(L["bar_deadenDur"])
	self:RemoveWarningSign(icon.deaden)
	
	deadenEndTime = GetTime()
	
	self:IntervalBar(L["bar_deadenCd"], timer.deadenCd[1] - (deadenEndTime - deadenStartTime), timer.deadenCd[2] - (deadenEndTime - deadenStartTime), icon.deaden, true, color.deadenCd)
end

function module:EnableCheckBlink()
	shazzTarget = nil
	self:ScheduleRepeatingEvent("CheckBlink", self.CheckBlink, 0.5, self)
end

function module:CheckBlink()
	--define current shazzTarget first
	if shazzTarget == nil then
		if UnitName("Target") == L["c_shazzrah"] then
			if UnitName("TargetTarget") ~= nil then
				shazzTarget = UnitName("TargetTarget")
			end
		else 
			for i=1,GetNumRaidMembers() do
				if UnitName("raid"..i.."Target") == L["c_shazzrah"] then
					if UnitName("TargetTarget") ~= nil then
						shazzTarget = UnitName("TargetTarget")
						break
					end
				end
			end
		end
	
	--then check for target change, if changed, guessing it's a blink
	else
		if UnitName("Target") == L["c_shazzrah"] and UnitName("TargetTarget") ~= nil then
			if shazzTarget ~= UnitName("TargetTarget") then
				self:Sync(syncName.blink)
			end
		else 
			for i=1,GetNumRaidMembers() do
				if UnitName("raid"..i.."Target") == L["c_shazzrah"] and UnitName("raid"..i.."TargetTarget") ~= nil then
					if shazzTarget ~= UnitName("raid"..i.."TargetTarget") then
						self:Sync(syncName.blink)
						break
					end
				end
			end
		end
	end
end

function module:Blink()
	self:CancelScheduledEvent("CheckBlink")
	self:CancelDelayedSync(syncName.enableCheckBlink)
	
	self:RemoveBar(L["bar_blinkCd"])
	self:CancelDelayedBar(L["bar_blinkSoon"])
	self:RemoveBar(L["bar_blinkSoon"])
	
	self:Bar(L["bar_blinkCd"], timer.blinkCd, icon.blink, true, color.blinkCd)
	self:Message(L["msg_blink"], "Important", false, nil, false)
	self:Sound("Alarm")
		
	self:DelayedSync(timer.blinkCd - 5, syncName.enableCheckBlink)
	self:DelayedBar(timer.blinkCd, L["bar_blinkSoon"], timer.blinkSoon, icon.blink, true, color.blinkSoon)
	
	shazzTarget = nil
end
