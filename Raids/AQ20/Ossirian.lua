
local module, L = BigWigs:ModuleDeclaration("Ossirian the Unscarred", "Ruins of Ahn'Qiraj")
local BST = AceLibrary("Babble-SpellTree-2.2")
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30012
module.enabletrigger = module.translatedName
module.toggleoptions = {"bigicon", "warstomp", "cyclone", "sandstorm", "supreme", "weakness", "clickit", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Ossirian",
	
    bigicon_cmd = "bigicon",
    bigicon_name = "大图标警告标志",
    bigicon_desc = "沙尘暴、虚弱和萨满的根基图腾的大警告标志",

	warstomp_cmd = "warstomp",
	warstomp_name = "战争践踏计时条",
	warstomp_desc = "奥斯里安的战争践踏计时条",

	cyclone_cmd = "cyclone",
	cyclone_name = "飓风术计时条",
	cyclone_desc = "奥斯里安的飓风术计时条",

	sandstorm_cmd = "sandstorm",
	sandstorm_name = "沙尘暴伤害警告",
	sandstorm_desc = "受到沙尘暴的伤害时进行警告",
	
	supreme_cmd = "supreme",
	supreme_name = "狂暴警报",
	supreme_desc = "狂暴姿态出现时进行警告",
	
	weakness_cmd = "weakness",
	weakness_name = "奥斯里安的弱点警报",
	weakness_desc = "警告奥斯里安的新弱点是什么",

	clickit_cmd = "clickit",
	clickit_name = "现在点击水晶",
	clickit_desc = "计时器，如果在此计时器后点击，他将变为狂暴状态",

	supreme_trigger = "Ossirian the Unscarred gains Strength of Ossirian.",
	supreme_trigger2 = "Ossirian the Unscarred is afflicted by Strength of Ossirian.",
	supreme_bar = "狂暴姿态",
	supremewarn = "无疤者奥斯里安狂暴姿态!",
	supremedelaywarn = "狂暴将在 %d 秒后出现！",

	debuff_trigger = "Ossirian the Unscarred is afflicted by (.+) Weakness.",
	debuff_trigger2 = "Ossirian the Unscarred gains (.+) Weakness.",
	debuffwarn = "奥斯里安现在弱点是：",

	ossiLostSupreme = "Strength of Ossirian fades from Ossirian the Unscarred.",-- CHAT_MSG_SPELL_AURA_GONE_OTHER",

	expose = "Expose",
	
	cyclone_trigger = "Enveloping Winds",
	cyclone_bar = "飓风术",
	warstomp_trigger = "War Stomp",
	warstomp_bar = "战争践踏",
	
	sandstorm_trigger = "Sand Vortex's Harsh Winds hits you for",
	
	clickit_bar = "点击水晶或死亡",

	firstcrystal_bar = "在0秒时点击第一个水晶",
	firstcrystal_warn = "现在点击它！！！",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	cmd = "Ossirian",
	
    bigicon_cmd = "bigicon",
    bigicon_name = "大图标警告标志",
    bigicon_desc = "沙尘暴、虚弱和萨满的根基图腾的大警告标志",

	warstomp_cmd = "warstomp",
	warstomp_name = "战争践踏计时条",
	warstomp_desc = "奥斯里安的战争践踏计时条",

	cyclone_cmd = "cyclone",
	cyclone_name = "飓风术计时条",
	cyclone_desc = "奥斯里安的飓风术计时条",

	sandstorm_cmd = "sandstorm",
	sandstorm_name = "沙尘暴伤害警告",
	sandstorm_desc = "受到沙尘暴的伤害时进行警告",
	
	supreme_cmd = "supreme",
	supreme_name = "狂暴警报",
	supreme_desc = "狂暴姿态出现时进行警告",
	
	weakness_cmd = "weakness",
	weakness_name = "奥斯里安的弱点警报",
	weakness_desc = "警告奥斯里安的新弱点是什么",

	clickit_cmd = "clickit",
	clickit_name = "现在点击水晶",
	clickit_desc = "计时器，如果在此计时器后点击，他将变为狂暴状态",

	supreme_trigger = "无疤者奥斯里安获得了奥斯里安之力的效果。",
	supreme_trigger2 = "无疤者奥斯里安受到了奥西里安之力的影响。",
	supreme_bar = "狂暴姿态",
	supremewarn = "无疤者奥斯里安狂暴姿态!",
	supremedelaywarn = "狂暴将在 %d 秒后出现！",

	debuff_trigger = "无疤者奥斯里安受到了(.+)虚弱效果的影响。",
	debuff_trigger2 = "无疤者奥斯里安获得了(.+)虚弱的效果。",
	debuffwarn = "奥斯里安现在弱点是：",

	ossiLostSupreme = "无疤者奥斯里安的奥斯里安之力效果消失了。",-- CHAT_MSG_SPELL_AURA_GONE_OTHER",

	expose = "虚弱",
	
	cyclone_trigger = "包围之风",
	cyclone_bar = "飓风术",
	warstomp_trigger = "战争践踏",
	warstomp_bar = "战争践踏",
	
	sandstorm_trigger = "沙尘漩涡的强风击中你造成",
	
	clickit_bar = "点击水晶或死亡",

	firstcrystal_bar = "在0秒时点击第一个水晶",
	firstcrystal_warn = "现在点击它！！！",
} end )

local timer = {
	weakness = 45,
	supreme = 45,
	warstomp = 30,
	cyclone = 20,
	clickit = 10,
	firstcrystal = 10,
	firstWarstomp = 25,
}

local icon = {
	supreme = "Ability_warrior_innerrage",
	warstomp = "Ability_warstomp",
	cyclone = "Spell_Nature_Cyclone",
	grounding = "spell_nature_groundingtotem",
	sandstorm = "spell_nature_earthbind",
	
	shadow = "spell_shadow_shadowbolt",
	fire = "Spell_Fire_Fire",
	frost = "Spell_Frost_ChillingBlast",
	nature = "spell_nature_healingtouch",
	arcane = "spell_nature_starfall",
	
	clickit = "inv_misc_pocketwatch_01",
}

local syncName = {
	weakness = "OssirianWeakness"..module.revision,
	supreme = "OssirianSupreme"..module.revision,
	warstomp = "OssirianWarstomp"..module.revision,
	cyclone = "OssirianCyclone"..module.revision,
}

local _, playerClass = UnitClass("player")
bwOssiWeaknessTime = GetTime()

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF", "Event")

	
	self:ThrottleSync(3, syncName.weakness)
	self:ThrottleSync(3, syncName.supreme)
	self:ThrottleSync(3, syncName.cyclone)
	self:ThrottleSync(3, syncName.warstomp)
end

function module:OnSetup()
end

function module:OnEngage()
	bwOssiSupreme = true
	bwOssiFirstWarstop = true
	bwOssiWeaknessTime = GetTime()
	
	self:Sync(syncName.warstomp)
	self:Sync(syncName.cyclone)
	self:Sync(syncName.supreme)
	
	if self.db.profile.clickit then
		self:Bar(L["firstcrystal_bar"], timer.firstcrystal, icon.clickit, true, "blue")
		self:DelayedMessage(timer.firstcrystal, L["firstcrystal_warn"], "Urgent")
	end
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["ossiLostSupreme"] then
		bwOssiSupreme = false
	end
	
	if ((bwOssiWeaknessTime + 46) < GetTime()) and bwOssiSupreme == false then
		self:RemoveBar(L["supreme_bar"])
		self:Bar("狂暴姿态", 30, icon.supreme, true, "red")
		self:Message("警告! 狂暴姿态刷新!", "Attention", nil, "Beware")
		bwOssiSupreme = nil
	end
	
	local _, _, debuffName = string.find(msg, L["debuff_trigger"])
	if string.find(msg, L["debuff_trigger"]) and debuffName ~= L["expose"] then
		self:Sync(syncName.weakness .. " " .. debuffName)
	end
	
	local _, _, debuffName = string.find(msg, L["debuff_trigger2"])
	if string.find(msg, L["debuff_trigger2"]) and debuffName ~= L["expose"] then
		self:Sync(syncName.weakness .. " " .. debuffName)
	end
	
	if string.find(msg, L["cyclone_trigger"]) then
		self:Sync(syncName.cyclone)
	end
	if string.find(msg, L["warstomp_trigger"]) then
		self:Sync(syncName.warstomp)
	end
	if string.find(msg, L["supreme_trigger"]) or string.find(msg, L["supreme_trigger2"]) then
		self:Sync(syncName.supreme)
	end
	if string.find(msg, L["sandstorm_trigger"]) and self.db.profile.sandstorm then
		if self.db.profile.bigicon then
			self:WarningSign(icon.sandstorm, 1)
		end
		self:Sound("RunAway")
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.weakness and rest and self.db.profile.weakness then
		self:Weakness(rest)
	elseif sync == syncName.supreme and self.db.profile.supreme then
		self:Supreme()
	elseif sync == syncName.cyclone and self.db.profile.cyclone then
		self:Cyclone()
	elseif sync == syncName.warstomp and self.db.profile.warstomp then
		self:WarStomp()
	end
end

function module:Weakness(rest)
	if self.db.profile.clickit then
		self:ClickIt()
	end
	
	self:RemoveBar("狂暴姿态")
	bwOssiWeaknessTime = GetTime()
	bwOssiSupreme = false
	element = tostring(rest)
	
	if element == BST["Shadow"] and self.db.profile.weakness then
		self:RemoveBar("暗影易伤！")
		self:Message(string.format(L["debuffwarn"]..BST["Shadow"].."易伤！"), "Important")
		self:Bar("暗影易伤！", timer.weakness, icon.shadow, true, "green")
		if self.db.profile.bigicon then
			self:WarningSign(icon.shadow, 0.7)
		end
		self:RemoveBar(L["supreme_bar"])
	end
	if element == BST["Fire"] and self.db.profile.weakness then
		self:RemoveBar("火焰易伤！")
		self:Message(string.format(L["debuffwarn"]..BST["Fire"].."易伤！"), "Important")
		self:Bar("火焰易伤！", timer.weakness, icon.fire, true, "green")
		if self.db.profile.bigicon then
			self:WarningSign(icon.fire, 0.7)
		end
		self:RemoveBar(L["supreme_bar"])
	end
	if element == BST["Frost"] and self.db.profile.weakness then
		self:RemoveBar("冰霜易伤！")
		self:Message(string.format(L["debuffwarn"]..BST["Frost"].."易伤！"), "Important")
		self:Bar("冰霜易伤！", timer.weakness, icon.frost, true, "green")
		if self.db.profile.bigicon then
			self:WarningSign(icon.frost, 0.7)
		end
		self:RemoveBar(L["supreme_bar"])
	end
	if element == BST["Nature"] and self.db.profile.weakness then
		self:RemoveBar("自然易伤！")
		self:Message(string.format(L["debuffwarn"]..BST["Nature"].."易伤！"), "Important")
		self:Bar("自然易伤！", timer.weakness, icon.nature, true, "green")
		if self.db.profile.bigicon then
			self:WarningSign(icon.nature, 0.7)
		end
		self:RemoveBar(L["supreme_bar"])
	end
	if element == BST["Arcane"] and self.db.profile.weakness then
		self:RemoveBar("奥术易伤！")
		self:Message(string.format(L["debuffwarn"]..BST["Arcane"].."易伤！"), "Important")
		self:Bar("奥术易伤！", timer.weakness, icon.arcane, true, "green")
		if self.db.profile.bigicon then
			self:WarningSign(icon.arcane, 0.7)
		end
		self:RemoveBar(L["supreme_bar"])
	end	
    -- if self.db.profile.supreme then
    --     self:CancelDelayedMessage(string.format(L["supremedelaywarn"], 5))
    --     self:RemoveBar(L["supreme_bar"])
    --     self:DelayedMessage(timer.supreme-5, string.format(L["supremedelaywarn"], 5), "Important")
    --     self:Bar(L["supreme_bar"], timer.supreme, icon.supreme, true, "red")
    -- end
end

function module:Supreme()
	bwOssiSupreme = true
	self:Message(L["supremewarn"], "Attention", nil, "Beware")
	self:RemoveBar("狂暴姿态")
	self:Bar(L["supreme_bar"], timer.supreme, icon.supreme, true, "red")
end

function module:Cyclone()
	self:RemoveBar(L["cyclone_bar"])
	self:Bar(L["cyclone_bar"], timer.cyclone, icon.cyclone, true, "white")
	
	if playerClass == BC["Shaman"] and self.db.profile.bigicon then
		self:DelayedWarningSign(timer.cyclone - 5, icon.grounding, 1)
	end
end

function module:WarStomp()
	if bwOssiFirstWarstop == false then
		self:RemoveBar(L["warstomp_bar"])
	
		self:Bar(L["warstomp_bar"], timer.warstomp, icon.warstomp, true, "yellow")
		self:DelayedWarningSign(timer.warstomp - 5, icon.warstomp, 1)
	else
		self:Bar(L["warstomp_bar"], timer.firstWarstomp, icon.warstomp, true, "yellow")
		bwOssiFirstWarstop = false
	end
end

function module:ClickIt()
	self:RemoveBar(L["clickit_bar"])
	self:DelayedBar(timer.weakness-16.2, L["clickit_bar"], timer.clickit, icon.clickit, true, "blue")
end
