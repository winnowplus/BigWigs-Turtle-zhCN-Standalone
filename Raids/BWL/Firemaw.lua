
local module, L = BigWigs:ModuleDeclaration("Firemaw", "Blackwing Lair")
local bbfiremaw = AceLibrary("Babble-Boss-2.2")["Firemaw"]

module.revision = 30085
module.enabletrigger = module.translatedName
module.toggleoptions = {"wingbuffet", "shadowflame", "flamebuffet", "stacks", "bosskill"}

L:RegisterTranslations("enUS", function() return {
    cmd = "Firemaw",

    wingbuffet_cmd = "wingbuffet",
    wingbuffet_name = "龙翼打击警报",
    wingbuffet_desc = "龙翼打击出现时进行警告",

    shadowflame_cmd = "shadowflame",
    shadowflame_name = "暗影烈焰警报",
    shadowflame_desc = "暗影烈焰出现时进行警告",

    flamebuffet_cmd = "flamebuffet",
    flamebuffet_name = "烈焰打击警报",
    flamebuffet_desc = "烈焰打击出现时进行警告",

    stacks_cmd = "stacks",
    stacks_name = "烈焰打击层数过高警报",
    stacks_desc = "烈焰打击层数过高时进行警告",


    trigger_wingBuffet = "Firemaw begins to cast Wing Buffet.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_wingBuffetCast = "正在施放龙翼打击！",
    bar_wingBuffetCd = "龙翼打击冷却",
    msg_wingBuffetCast = "正在施放龙翼打击！",
    msg_wingBuffetSoon = "2秒后龙翼打击 - 现在嘲讽！",

    trigger_shadowFlame = "Firemaw begins to cast Shadow Flame.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_shadowFlameCast = "正在施放暗影烈焰！",
    bar_shadowFlameCd = "暗影烈焰冷却",
    msg_shadowFlameCast = "正在施放暗影烈焰！",
	
	trigger_flameBuffet = "Firemaw's Flame Buffet", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
		--Firemaw's Flame Buffet fails. (.+) is immune.
		--Firemaw's Flame Buffet was resisted by (.+).
		--Firemaw's Flame Buffet was resisted.
		--Firemaw's Flame Buffet hits (.+) for (.+) Fire damage.
		--Firemaw's Flame Buffet is absorbed by (.+).
		--You absorb Firemaw's Flame Buffet.
    bar_flameBuffet = "烈焰打击",

    trigger_flameBuffetYou = "You are afflicted by Flame Buffet %((.+)%).", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_flameBuffetYou = " 烈焰打击层数 - 考虑清除你的层数",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Firemaw",

    wingbuffet_cmd = "wingbuffet",
    wingbuffet_name = "龙翼打击警报",
    wingbuffet_desc = "龙翼打击出现时进行警告",

    shadowflame_cmd = "shadowflame",
    shadowflame_name = "暗影烈焰警报",
    shadowflame_desc = "暗影烈焰出现时进行警告",

    flamebuffet_cmd = "flamebuffet",
    flamebuffet_name = "烈焰打击警报",
    flamebuffet_desc = "烈焰打击出现时进行警告",

    stacks_cmd = "stacks",
    stacks_name = "烈焰打击层数过高警报",
    stacks_desc = "烈焰打击层数过高时进行警告",


    trigger_wingBuffet = "费尔默开始施放龙翼打击。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_wingBuffetCast = "正在施放龙翼打击！",
    bar_wingBuffetCd = "龙翼打击冷却",
    msg_wingBuffetCast = "正在施放龙翼打击！",
    msg_wingBuffetSoon = "2秒后龙翼打击 - 现在嘲讽！",

    trigger_shadowFlame = "费尔默开始施放暗影烈焰。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_shadowFlameCast = "正在施放暗影烈焰！",
    bar_shadowFlameCd = "暗影烈焰冷却",
    msg_shadowFlameCast = "正在施放暗影烈焰！",
	
	trigger_flameBuffet = "费尔默的烈焰打击", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
		--Firemaw's Flame Buffet fails. (.+) is immune.
		--Firemaw's Flame Buffet was resisted by (.+).
		--Firemaw's Flame Buffet was resisted.
		--Firemaw's Flame Buffet hits (.+) for (.+) Fire damage.
		--Firemaw's Flame Buffet is absorbed by (.+).
		--You absorb Firemaw's Flame Buffet.
    bar_flameBuffet = "烈焰打击",

    trigger_flameBuffetYou = "你受到了烈焰打击效果的影响%（(.+)%）。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    msg_flameBuffetYou = " 烈焰打击层数 - 考虑清除你的层数",
} end)

local timer = {
	wingBuffetFirstCd = 30,
	wingBuffetCd = 29, --30sec - 1sec cast
	wingBuffetCast = 1,
	
	shadowFlameFirstCd = 16,
	shadowFlameCd = 14, --16 - 2sec cast
	shadowFlameCast = 2,
	
	flameBuffet = {1.913,4.936}, --saw 1.913 to 4.936
}
local icon = {
	wingBuffet = "INV_Misc_MonsterScales_14",
	shadowFlame = "Spell_Fire_Incinerate",
	flameBuffet = "Spell_Fire_Fireball"
}
local color = {
	wingBuffetCd = "Cyan",
	wingBuffetCast = "Blue",
	
	shadowFlameCd = "Orange",
	shadowFlameCast = "Red",
	
	flameBuffet = "Black"
}
local syncName = {
	wingBuffet = "FiremawWingBuffet"..module.revision,
	shadowFlame = "FiremawShadowflame"..module.revision,
	flameBuffet = "FiremawFlameBuffet"..module.revision,
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --Debug
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_flameBuffet
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_flameBuffet
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_wingBuffet, trigger_shadowFlame, trigger_flameBuffet
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_flameBuffetYou

	
	self:ThrottleSync(3, syncName.wingBuffet)
	self:ThrottleSync(3, syncName.shadowFlame)
	self:ThrottleSync(1.5, syncName.flameBuffet)
end

function module:OnSetup()
	self.started = nil
end

function module:OnEngage()
	if self.db.profile.wingbuffet then
		self:Bar(L["bar_wingBuffetCd"], timer.wingBuffetFirstCd, icon.wingBuffet, true, color.wingBuffetCd)
		self:DelayedMessage(timer.wingBuffetFirstCd - 2, L["msg_wingBuffetSoon"], "Attention", false, nil, false)
	end
	
	if self.db.profile.shadowflame then
		self:Bar(L["bar_shadowFlameCd"], timer.shadowFlameCd, icon.shadowFlame, true, color.shadowFlameCd)
	end
	
	if self.db.profile.flamebuffet then
		self:IntervalBar(L["bar_flameBuffet"], timer.flameBuffet[1], timer.flameBuffet[2], icon.flameBuffet, true, color.flameBuffet)
	end
end

function module:OnDisengage()
end

function module:Event(msg)
	if msg == L["trigger_wingBuffet"] then
		self:Sync(syncName.wingBuffet)
	
	elseif msg == L["trigger_shadowFlame"] then
		self:Sync(syncName.shadowFlame)
	
	elseif string.find(msg, L["trigger_flameBuffet"]) then
		self:Sync(syncName.flameBuffet)
	
	elseif string.find(msg, L["trigger_flameBuffetYou"]) and self.db.profile.stacks then
		local _,_,stacks,_ = string.find(msg, L["trigger_flameBuffetYou"])
		local stacksNum = tonumber(stacks)
		if stacksNum >= 8 then
			self:FlameBuffetStacks(stacksNum)
		end
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wingBuffet and self.db.profile.wingbuffet then
		self:WingBuffet()
	elseif sync == syncName.shadowFlame and self.db.profile.shadowflame then
		self:ShadowFlame()
	elseif sync == syncName.flameBuffet and self.db.profile.flamebuffet then
		self:FlameBuffet()
	end
end


function module:WingBuffet()
	self:CancelDelayedMessage(L["msg_wingBuffetSoon"])
	self:RemoveBar(L["bar_wingBuffetCd"])
	
	self:Bar(L["bar_wingBuffetCast"], timer.wingBuffetCast, icon.wingBuffet, true, color.wingBuffetCast)
	
	self:DelayedBar(timer.wingBuffetCast, L["bar_wingBuffetCd"], timer.wingBuffetCd, icon.wingBuffet, true, color.wingBuffetCd)
	self:DelayedMessage(timer.wingBuffetCast + timer.wingBuffetCd - 2, L["msg_wingBuffetSoon"], "Attention", false, nil, false)
end

function module:ShadowFlame()
	self:RemoveBar(L["bar_shadowFlameCd"])
	
	self:Bar(L["bar_shadowFlameCast"], timer.shadowFlameCast, icon.shadowFlame, true, color.shadowFlameCast)
	self:Message(L["msg_shadowFlameCast"], "Urgent", false, nil, false)
	
	self:DelayedBar(timer.shadowFlameCast, L["bar_shadowFlameCd"], timer.shadowFlameCd, icon.shadowFlame, true, color.shadowFlameCd)
end

function module:FlameBuffet()
	self:IntervalBar(L["bar_flameBuffet"], timer.flameBuffet[1], timer.flameBuffet[2], icon.flameBuffet, true, color.flameBuffet)
end

function module:FlameBuffetStacks(stacksNum)
	--don't bother if you are tanking
	if UnitName("Target") == bbfiremaw and UnitName("TargetTarget") == UnitName("Player") then return end
	
	self:Message(stacksNum..L["msg_flameBuffetYou"], "Personal", false, nil, false)
	self:WarningSign(icon.flameBuffet, 0.7)
	self:Sound("Info")
end
