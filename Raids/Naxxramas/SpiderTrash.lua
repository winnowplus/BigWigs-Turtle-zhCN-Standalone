
local module, L = BigWigs:ModuleDeclaration("Venom Stalker", "Naxxramas")
local bbvenomstalker = AceLibrary("Babble-Boss-2.2")["Venom Stalker"]
local bbnecrostalker = AceLibrary("Babble-Boss-2.2")["Necro Stalker"]

module.revision = 20048
module.enabletrigger = { bbvenomstalker, bbnecrostalker }
module.toggleoptions = {"charge"}
module.trashMod = true

L:RegisterTranslations("enUS", function() return {
    cmd = "SpiderTrash",

    charge_cmd = "charge",
    charge_name = "毒性充能",
    charge_desc = "显示毒性充能的冷却时间和图标。",
    
    charge_trigger = "is afflicted by Poison Charge",
    chargeself_trigger = "You are afflicted by Poison Charge",
    chargegone_self = "Poison Charge fades from you",
    charge_bar = "毒性充能 CD",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "SpiderTrash",

    charge_cmd = "charge",
    charge_name = "毒性充能",
    charge_desc = "显示毒性充能的冷却时间和图标。",
    
    charge_trigger = "受到了毒性充能效果的影响。",
    chargeself_trigger = "你受到了毒性充能效果的影响。",
    chargegone_self = "毒性充能效果从你身上消失",
    charge_bar = "毒性充能 CD",
} end )

local timer = {
	charge = {10, 15},
}

local icon = {
	charge = "spell_nature_corrosivebreath",
}

local deathCount = 0
local chargeNumber = 1
local lastCharge = 0
local poisonsOnSelf = 0

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
	deathCount = 0
	chargeNumber = 1
	lastCharge = 0
	poisonsOnSelf = 0
end

function module:OnEngage()
end

function module:CHAT_MSG_SPELL_AURA_GONE_SELF(msg)
	if string.find(msg, L["chargegone_self"]) then
		poisonsOnSelf = poisonsOnSelf - 1
		if poisonsOnSelf == 0 then
			self:RemoveWarningSign(icon.charge)
		end
	end
end
		
function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if msg == string.format(UNITDIESOTHER, bbvenomstalker) or
	msg == string.format(UNITDIESOTHER, bbnecrostalker) then
		deathCount = deathCount + 1
		if deathCount == 2 then
			self:SendBossDeathSync()
		end
	end
end

function module:Event(msg)
	if self.db.profile.charge and string.find(msg, L["charge_trigger"]) then
		if GetTime() > lastCharge + 1 then
			lastCharge = GetTime()
			local registered, time, elapsed, running = self:BarStatus(L["charge_bar"]..chargeNumber)
			if running and elapsed > 9.5 then
				self:IntervalBar(L["charge_bar"]..chargeNumber, timer.charge[1], timer.charge[2], icon.charge, true, "red")
			elseif running and elapsed < 10 then
				if chargeNumber == 1 then
					chargeNumber = 2
				else
					chargeNumber = 1
				end
				self:IntervalBar(L["charge_bar"]..chargeNumber, timer.charge[1], timer.charge[2], icon.charge, true, "red")
			else
				self:IntervalBar(L["charge_bar"]..chargeNumber, timer.charge[1], timer.charge[2], icon.charge, true, "red")
			end
		end
	elseif self.db.profile.charge and string.find(msg, L["chargeself_trigger"]) then
		poisonsOnSelf = poisonsOnSelf + 1
		self:WarningSign(icon.charge, 6)
	end
end
