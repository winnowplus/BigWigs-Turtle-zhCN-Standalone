
local module, L = BigWigs:ModuleDeclaration("Vaelastrasz the Corrupt", "Blackwing Lair")
local bbvaelastraszthecorrupt = AceLibrary("Babble-Boss-2.2")["Vaelastrasz the Corrupt"]

module.revision = 30085
module.enabletrigger = module.translatedName
module.toggleoptions = {"start", "adrenaline", "icon","flamebreath", "flamebreathdot", "firenova", "tailsweep", "parry", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Vaelastrasz",
	
    start_cmd = "start",
    start_name = "战斗警报",
    start_desc = "战斗开始时进行警告",

    adrenaline_cmd = "adrenaline",
    adrenaline_name = "燃烧刺激警报",
    adrenaline_desc = "燃烧刺激出现时进行警告",

    icon_cmd = "icon",
    icon_name = "燃烧刺激团队图标",
    icon_desc = "在燃烧刺激目标上标记骷髅",

    flamebreath_cmd = "flamebreath",
    flamebreath_name = "火息术警报",
    flamebreath_desc = "火息术出现时进行警告",

    flamebreathdot_cmd = "flamebreathdot",
    flamebreathdot_name = "火息术DoT警报",
    flamebreathdot_desc = "火息术DoT出现时进行警告",

    firenova_cmd = "firenova",
    firenova_name = "火焰新星警报",
    firenova_desc = "火焰新星出现时进行警告",

    tailsweep_cmd = "tailsweep",
    tailsweep_name = "龙尾扫击警报",
    tailsweep_desc = "龙尾扫击出现时进行警告",

    parry_cmd = "parry",
    parry_name = "招架警报",
    parry_desc = "招架出现时进行警告",
	
	
	trigger_gossip1 = "Too late, friends", --CHAT_MSG_MONSTER_YELL
	trigger_gossip2 = "I beg you, mortals", --CHAT_MSG_MONSTER_YELL
	trigger_gossip3 = "FLAME! DEATH! DESTRUCTION!", --CHAT_MSG_MONSTER_YELL
    bar_gossip = "战斗开始",
    msg_gossip = "瓦拉斯塔兹事件开始了！",
	
	trigger_engage = "afflicted by Essence of the Red.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	
	--burning adrenaline on mana user every 15sec, every 45s on the tank ALSO
		-- -5% hp per second
	trigger_adrenalineYou = "You are afflicted by Burning Adrenaline.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_adrenalineOther = "(.+) is afflicted by Burning Adrenaline.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_adrenalineFade = "Burning Adrenaline fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER --guessing
    bar_adrenalineCd = "燃烧刺激冷却",
    bar_adrenalineDur = " 燃烧中！",
    msg_adrenaline = " 受到了燃烧刺激",
	
	trigger_dieYou = "You die.", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
	trigger_dieOther = "(.+) dies.", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
	
	trigger_flameBreath = "Vaelastrasz the Corrupt begins to cast Flame Breath.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_flameBreathCd = "火息术冷却",
    bar_flameBreathCast = "正在施放火息术！",

    trigger_flameBreathDotYou = "You are afflicted by Flame Breath %((.+)%).", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_flameBreathDotOther = "(.+) is afflicted by Flame Breath %((.+)%).", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_flameBreathDotFade = "Flame Breath fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_flameBreathDot = " 火息术DoT",

    trigger_fireNova = "Vaelastrasz the Corrupt's Fire Nova", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_fireNova = "火焰新星冷却",

    trigger_tailSweepYou = "Vaelastrasz the Corrupt's Tail Sweep hits you", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_tailSweep = "龙尾扫击击中BOSS后方30码范围内。",

    trigger_parryYou = "You attack. Vaelastrasz the Corrupt parries.", --CHAT_MSG_COMBAT_SELF_MISSES
    msg_parryYou = "堕落的瓦拉斯塔兹招架了你的攻击 - 别再害坦克了，笨蛋！",
    you = "you",
} end)

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Vaelastrasz",
	
    start_cmd = "start",
    start_name = "战斗警报",
    start_desc = "战斗开始时进行警告",

    adrenaline_cmd = "adrenaline",
    adrenaline_name = "燃烧刺激警报",
    adrenaline_desc = "燃烧刺激出现时进行警告",

    icon_cmd = "icon",
    icon_name = "燃烧刺激团队图标",
    icon_desc = "在燃烧刺激目标上标记骷髅",

    flamebreath_cmd = "flamebreath",
    flamebreath_name = "火息术警报",
    flamebreath_desc = "火息术出现时进行警告",

    flamebreathdot_cmd = "flamebreathdot",
    flamebreathdot_name = "火息术DoT警报",
    flamebreathdot_desc = "火息术DoT出现时进行警告",

    firenova_cmd = "firenova",
    firenova_name = "火焰新星警报",
    firenova_desc = "火焰新星出现时进行警告",

    tailsweep_cmd = "tailsweep",
    tailsweep_name = "龙尾扫击警报",
    tailsweep_desc = "龙尾扫击出现时进行警告",

    parry_cmd = "parry",
    parry_name = "招架警报",
    parry_desc = "招架出现时进行警告",
	
	
	trigger_gossip1 = "太晚了，朋友们！奈法留斯的腐败已经蔓延", --CHAT_MSG_MONSTER_YELL
	trigger_gossip2 = "我求求你们，凡人", --CHAT_MSG_MONSTER_YELL
	trigger_gossip3 = "火焰！死亡！毁灭！", --CHAT_MSG_MONSTER_YELL
    bar_gossip = "战斗开始",
    msg_gossip = "瓦拉斯塔兹事件开始了！",
	
	trigger_engage = "受到了红龙精华效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	
	--burning adrenaline on mana user every 15sec, every 45s on the tank ALSO
		-- -5% hp per second
	trigger_adrenalineYou = "你受到了燃烧刺激效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_adrenalineOther = "(.+)受到了燃烧刺激效果的影响。", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_adrenalineFade = "燃烧刺激效果从(.+)身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER --guessing
    bar_adrenalineCd = "燃烧刺激冷却",
    bar_adrenalineDur = " 即将爆炸！",
    msg_adrenaline = " 受到了燃烧刺激",
	
	trigger_dieYou = "你死亡了。", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
	trigger_dieOther = "(.+)死亡了。", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
	
	trigger_flameBreath = "堕落的瓦拉斯塔兹开始施放火息术。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_flameBreathCd = "火息术冷却",
    bar_flameBreathCast = "正在施放火息术！",

    trigger_flameBreathDotYou = "你受到了火息术效果的影响%（(.+)%）。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
    trigger_flameBreathDotOther = "(.+)受到了火息术效果的影响%（(.+)%）。", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
    trigger_flameBreathDotFade = "火息术效果从(.+)身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_flameBreathDot = " 火息术DoT",

    trigger_fireNova = "堕落的瓦拉斯塔兹的火焰新星击中", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_fireNova = "火焰新星冷却",

    trigger_tailSweepYou = "堕落的瓦拉斯塔兹的龙尾扫击击中你", --CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
    msg_tailSweep = "龙尾扫击击中BOSS后方30码范围内。",

    trigger_parryYou = "你发起了攻击。堕落的瓦拉斯塔兹招架住了。", --CHAT_MSG_COMBAT_SELF_MISSES
    msg_parryYou = "堕落的瓦拉斯塔兹招架了你的攻击 - 别再害坦克了，笨蛋！",
    you = "你",
} end)

local timer = {
	gossip1 = 36,
	gossip2 = 26,
	gossip3 = 10,
	
	adrenalineCd = 15,
	adrenalineDur = 20,
	
	flameBreathCd = {5,10}, --sqw 5.062 to 9.604
	flameBreathCast = 2,
	flameBreathDot = 15,
	
	fireNovaCd = {2,4}, --saw from 2 to 3.878, first at 3.966
}
local icon = {
	gossip = "inv_misc_head_dragon_01",
	adrenaline = "INV_Gauntlets_03",
	adrenalineDur = "spell_shadow_mindbomb",
	flameBreath = "spell_fire_fire",
	flameBreathDot = "spell_fire_incinerate",
	tailSweep = "inv_misc_monsterscales_05",
	fireNova = "spell_fire_sealoffire",
	parry = "ability_parry",
}
local color = {
	gossip = "White",
	
	adrenalineCd = "Orange",
	adrenalineDur = "Red",
	
	flameBreathCd = "Cyan",
	flameBreathCast = "Blue",
	flameBreathDot = "Magenta",
	
	fireNovaCd = "Black",
}
local syncName = {
	gossip1 = "VaelGossip1"..module.revision,
	gossip2 = "VaelGossip2"..module.revision,
	gossip3 = "VaelGossip3"..module.revision,
	
	adrenaline = "VaelAdrenaline2"..module.revision,
	adrenalinePlayer = "VaelAdrenalinePlayer"..module.revision,
	adrenalinePlayerFade = "VaelAdrenalinePlayerFade"..module.revision,
	
	flameBreath = "VaelBreath"..module.revision,
	flameBreathDot = "VaelBreathDot"..module.revision,
	flameBreathDotFade = "VaelBreathDotFade"..module.revision,
	
	fireNova = "VaelFireNova"..module.revision,
}

local engaged = nil
local adrenalineCount = 1
local adrenalinePlayers = {}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --trigger_gossip1,2,3
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_engage, trigger_adrenalineYou, trigger_flameBreathDotYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_engage, trigger_adrenalineOther, trigger_flameBreathDotOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_engage, trigger_adrenalineOther, trigger_flameBreathDotFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_adrenalineFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_adrenalineFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_adrenalineFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event") --trigger_tailSweepYou, trigger_fireNova
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event") --trigger_fireNova
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_flameBreath, trigger_fireNova
	
	self:RegisterEvent("CHAT_MSG_COMBAT_SELF_MISSES", "Event") --trigger_parryYou
	
	
	self:ThrottleSync(2, syncName.gossip1)
	self:ThrottleSync(2, syncName.gossip2)
	self:ThrottleSync(2, syncName.gossip3)
	
	self:ThrottleSync(10, syncName.adrenaline)
	self:ThrottleSync(0, syncName.adrenalinePlayer)
	self:ThrottleSync(0, syncName.adrenalinePlayerFade)
	
	self:ThrottleSync(3, syncName.flameBreath)
	self:ThrottleSync(3, syncName.flameBreathDot)
	self:ThrottleSync(3, syncName.flameBreathDotFade)
	
	self:ThrottleSync(1, syncName.fireNova)
end

function module:OnSetup()
	self.started = nil
	
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH") --trigger_dieYou, trigger_dieOther
end

function module:OnEngage()
	engaged = true
	adrenalineCount = 1
	adrenalinePlayers = {}
	
	self:RemoveBar(L["bar_gossip"])
	
	if self.db.profile.adrenaline then
		self:Bar(L["bar_adrenalineCd"], timer.adrenalineCd, icon.adrenaline, true, color.adrenalineCd)
	end
	
	if self.db.profile.flamebreath then
		self:IntervalBar(L["bar_flameBreathCd"], timer.flameBreathCd[1], timer.flameBreathCd[2], icon.flameBreath, true, color.flameBreathCd)
	end
	
	if self.db.profile.firenova then
		self:IntervalBar(L["bar_fireNova"], timer.fireNovaCd[1], timer.fireNovaCd[2], icon.fireNova, true, color.fireNovaCd)
	end
end

function module:OnDisengage()
end

function module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
	if engaged then
		BigWigs:CheckForWipe(self)
	end
	
	if msg == L["trigger_dieYou"] then
		self:Sync(syncName.adrenalinePlayerFade .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_dieOther"]) then
		local _, _, deadPerson = string.find(msg, L["trigger_dieOther"])
		self:Sync(syncName.adrenalinePlayerFade .. " " .. deadPerson)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if string.find(msg, L["trigger_gossip1"]) then
		self:Sync(syncName.gossip1)
	
	elseif string.find(msg, L["trigger_gossip2"]) then
		self:Sync(syncName.gossip2)
	
	elseif string.find(msg, L["trigger_gossip3"]) then
		self:Sync(syncName.gossip3)
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_engage"]) then
		module:SendEngageSync()
		
	elseif msg == L["trigger_adrenalineYou"] then
		self:Sync(syncName.adrenalinePlayer .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_adrenalineOther"]) then
		local _,_,adrenalinePlayer,_ = string.find(msg, L["trigger_adrenalineOther"])
		self:Sync(syncName.adrenalinePlayer .. " " .. adrenalinePlayer)
		
	elseif string.find(msg, L["trigger_adrenalineFade"]) then
		local _,_,adrenalineFadePlayer,_ = string.find(msg, L["trigger_adrenalineFade"])
		if adrenalineFadePlayer == L["you"] then adrenalineFadePlayer = UnitName("Player") end
		self:Sync(syncName.adrenalinePlayerFade .. " " .. adrenalineFadePlayer)
	
	
	elseif msg == L["trigger_flameBreath"] then
		self:Sync(syncName.flameBreath)
	
	
	elseif string.find(msg, L["trigger_flameBreathDotYou"]) then
		local _,_,flameBreathDotQty,_ = string.find(msg, L["trigger_flameBreathDotYou"])
		if tonumber(flameBreathDotQty) >= 3 then
			local flameBreathDotPlayer = UnitName("Player")
			local playerAndQuantity = flameBreathDotPlayer .. " " .. flameBreathDotQty
			self:Sync(syncName.flameBreathDot.." "..playerAndQuantity)
		end
	
	elseif string.find(msg, L["trigger_flameBreathDotOther"]) then
		local _,_,flameBreathDotPlayer,flameBreathDotQty = string.find(msg, L["trigger_flameBreathDotOther"])
		if tonumber(flameBreathDotQty) >= 3 then
			local playerAndQuantity = flameBreathDotPlayer .. " " .. flameBreathDotQty
			self:Sync(syncName.flameBreathDot.." "..playerAndQuantity)
		end
		
	elseif string.find(msg, L["trigger_flameBreathDotFade"]) then
		local _,_,flameBreathDotFadePlayer,_ = string.find(msg, L["trigger_flameBreathDotFade"])
		if flameBreathDotFadePlayer == L["you"] then flameBreathDotFadePlayer = UnitName("Player") end
		self:Sync(syncName.flameBreathDotFade .. " " .. flameBreathDotFadePlayer)
		
		
	elseif string.find(msg, L["trigger_fireNova"]) then
		self:Sync(syncName.fireNova)
		
	elseif string.find(msg, L["trigger_tailSweepYou"]) and self.db.profile.tailsweep then
		self:TailSweep()
		
	elseif string.find(msg, L["trigger_parryYou"]) and self.db.profile.parry then
		if UnitName("Target") ~= nil and UnitName("TargetTarget") ~= nil then
			if UnitName("Target") == bbvaelastraszthecorrupt and UnitName("TargetTarget") ~= UnitName("Player") then
				self:ParryYou()
			end
		end
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.gossip1 and self.db.profile.start then
		self:Gossip1()
	elseif sync == syncName.gossip2 and self.db.profile.start then
		self:Gossip2()
	elseif sync == syncName.gossip3 and self.db.profile.start then
		self:Gossip3()
	
	elseif sync == syncName.adrenaline and self.db.profile.adrenaline then
		self:Adrenaline()
		
	elseif sync == syncName.adrenalinePlayer and rest and self.db.profile.adrenaline then
		self:AdrenalinePlayer(rest)
	elseif sync == syncName.adrenalinePlayerFade and rest and self.db.profile.adrenaline then
		self:AdrenalinePlayerFade(rest)
	
	elseif sync == syncName.flameBreath and self.db.profile.flamebreath then
		self:FlameBreath()
		
	elseif sync == syncName.flameBreathDot and rest and self.db.profile.flamebreath then
		self:FlameBreathDot(rest)
	elseif sync == syncName.flameBreathDotFade and rest and self.db.profile.flamebreath then
		self:FlameBreathDotFade(rest)
	
	elseif sync == syncName.fireNova and self.db.profile.firenova then
		self:FireNova()
	end
end


function module:Gossip1()
	self:Bar(L["bar_gossip"], timer.gossip1, icon.gossip, true, color.gossip)
	self:Message(L["msg_gossip"], "Attention", false, nil, false)
end
function module:Gossip2()
	self:Bar(L["bar_gossip"], timer.gossip2, icon.gossip, true, color.gossip)
end
function module:Gossip3()
	self:Bar(L["bar_gossip"], timer.gossip3, icon.gossip, true, color.gossip)
end

function module:Adrenaline()
	self:RemoveBar(L["bar_adrenalineCd"])
	self:RemoveBar("2x "..L["bar_adrenalineCd"])
	
	adrenalineCount = adrenalineCount + 1
	
	if adrenalineCount == 3 or 
		adrenalineCount == 6 or 
		adrenalineCount == 9 or 
		adrenalineCount == 12 or 
		adrenalineCount == 15 or 
		adrenalineCount == 18 then
		self:Bar("2x "..L["bar_adrenalineCd"], timer.adrenalineCd, icon.adrenaline, true, color.adrenalineCd)
	else
		self:Bar(L["bar_adrenalineCd"], timer.adrenalineCd, icon.adrenaline, true, color.adrenalineCd)
	end
end

function module:AdrenalinePlayer(rest)
	local foundRest = nil
	for j,v in ipairs(adrenalinePlayers) do
		if v == rest then
			foundRest = true
			break
		end
	end
	
	if not foundRest then
		
		table.insert(adrenalinePlayers, rest)
		
		self:Bar(rest..L["bar_adrenalineDur"], timer.adrenalineDur, icon.adrenalineDur, true, color.adrenalineDur)
		self:Message(rest..L["msg_adrenaline"], "Urgent", false, nil, false)
		
		if rest == UnitName("Player") then
			SendChatMessage(UnitName("Player").." 中了燃烧刺激！","SAY")
			self:WarningSign(icon.adrenaline, 1)
			self:Sound("RunAway")
		end
		
		if self.db.profile.icon and (IsRaidLeader() or IsRaidOfficer()) then
			for i=1,GetNumRaidMembers() do
				if UnitName("Raid"..i) == rest then
					if UnitName("Raid"..i.."Target") == bbvaelastraszthecorrupt and UnitName("Raid"..i.."TargetTarget") ~= nil then
						if UnitName("Raid"..i.."TargetTarget") == rest then
							SetRaidTarget("Raid"..i, 6)
						else
							SetRaidTarget("Raid"..i, 8)
						end
					else
						SetRaidTarget("Raid"..i, 8)
					end
				end
			end
		end
		
		self:Sync(syncName.adrenaline)
	end
end

function module:AdrenalinePlayerFade(rest)
	for j,v in ipairs(adrenalinePlayers) do
		if v == rest then
			table.remove(adrenalinePlayers, j)
			
			self:RemoveBar(rest..L["bar_adrenalineDur"])
			
			if rest == UnitName("Player") then
				self:RemoveWarningSign(icon.adrenaline)
			end
		
			if self.db.profile.icon and (IsRaidLeader() or IsRaidOfficer()) then
				for i=1,GetNumRaidMembers() do
					if UnitName("Raid"..i) == rest then
						SetRaidTarget("Raid"..i, 0)
					end
				end
			end
			break
		end
	end
end

function module:FlameBreath()
	self:RemoveBar(L["bar_flameBreathCd"])
	
	self:Bar(L["bar_flameBreathCast"], timer.flameBreathCast, icon.flameBreath, true, color.flameBreathCast)
	
	self:DelayedIntervalBar(timer.flameBreathCast, L["bar_flameBreathCd"], timer.flameBreathCd[1], timer.flameBreathCd[2], icon.flameBreath, true, color.flameBreathCd)
end

function module:FlameBreathDot(rest)
	local flameBreathDotPlayer = strsub(rest,0,strfind(rest," ") - 1)
	local flameBreathDotQty = tonumber(strsub(rest,strfind(rest," "),strlen(rest)))
	
	self:RemoveBar(flameBreathDotPlayer.." ".."3"..L["bar_flameBreathDot"])
	self:RemoveBar(flameBreathDotPlayer.." ".."4"..L["bar_flameBreathDot"])
	self:RemoveBar(flameBreathDotPlayer.." ".."5"..L["bar_flameBreathDot"])
	self:RemoveBar(flameBreathDotPlayer.." ".."6"..L["bar_flameBreathDot"])
	self:RemoveBar(flameBreathDotPlayer.." ".."7"..L["bar_flameBreathDot"])
	self:RemoveBar(flameBreathDotPlayer.." ".."8"..L["bar_flameBreathDot"])
	self:RemoveBar(flameBreathDotPlayer.." ".."9"..L["bar_flameBreathDot"])
	self:RemoveBar(flameBreathDotPlayer.." ".."10"..L["bar_flameBreathDot"])

	self:Bar(flameBreathDotPlayer.." "..flameBreathDotQty..L["bar_flameBreathDot"], timer.flameBreathDot, icon.flameBreathDot, true, color.flameBreathDot)
end

function module:FlameBreathDotFade(rest)
	self:RemoveBar(rest.." ".."3"..L["bar_flameBreathDot"])
	self:RemoveBar(rest.." ".."4"..L["bar_flameBreathDot"])
	self:RemoveBar(rest.." ".."5"..L["bar_flameBreathDot"])
	self:RemoveBar(rest.." ".."6"..L["bar_flameBreathDot"])
	self:RemoveBar(rest.." ".."7"..L["bar_flameBreathDot"])
	self:RemoveBar(rest.." ".."8"..L["bar_flameBreathDot"])
	self:RemoveBar(rest.." ".."9"..L["bar_flameBreathDot"])
	self:RemoveBar(rest.." ".."10"..L["bar_flameBreathDot"])
end

function module:TailSweep()
	self:Message(L["msg_tailSweep"], "Personal", false, nil, false)
	self:WarningSign(icon.tailSweep, 1)
end

function module:FireNova()
	self:IntervalBar(L["bar_fireNova"], timer.fireNovaCd[1], timer.fireNovaCd[2], icon.fireNova, true, color.fireNovaCd)
end

function module:ParryYou()
	self:WarningSign(icon.parry, 0.7)
	self:Message(L["msg_parryYou"], "Personal", false, nil, false)
	self:Sound("Info")
end
