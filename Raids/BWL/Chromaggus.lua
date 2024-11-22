local module, L = BigWigs:ModuleDeclaration("Chromaggus", "Blackwing Lair")
local BC = AceLibrary("Babble-Class-2.2")

L:RegisterTranslations("enUS", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	cmd = "Chromaggus",

	enrage_cmd = "enrage",
	enrage_name = "激怒",
	enrage_desc = "20%生命激怒前发出警报.",

	frenzy_cmd = "frenzy",
	frenzy_name = "狂暴",
	frenzy_desc = "狂暴警报.",

	breath_cmd = "breath",
	breath_name = "吐息",
	breath_desc = "提醒，吐息.",

    breathcd_cmd = "breathcd",
    breathcd_name = "吐息倒计时",
    breathcd_desc = "吐息语音警告.",

	vulnerability_cmd = "vulnerability",
	vulnerability_name = "弱点警报",
	vulnerability_desc = "克洛玛古斯弱点改变时发出警报.",

	breath_trigger = "Chromaggus begins to cast (.+).",
	trigger_vulnerability_direct_crit = "^[%w]+[%s's]* ([%w%s:]+) ([%w]+) Chromaggus for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)", -- [Fashu's] [Firebolt] [hits] Battleguard Sartura for [44] [Fire] damage. ([14] resisted)
 	trigger_vulnerability_direct_hit = "^[%w]+[%s's]* ([%w%s:]+) ([%w]+) Chromaggus for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)",
	vulnerability_dots_test = "^Chromaggus suffers ([%d]+) ([%w]+) damage from [%w]+[%s's]* ([%w%s:]+)%.[%s%(]*([%d]*)",
	frenzy_trigger = "Chromaggus gains Frenzy.",
	frenzyfade_trigger = "Frenzy fades from Chromaggus.",
	vulnerability_trigger = "flinches as its skin shimmers.",

	firstbreaths_warning = "5秒吐息!",
	breath_warning = "%s 5秒!",
	breath_message = "%s 正在施放!",
	vulnerability_message = "弱点: %s!",
	vulnerability_warning = "克洛玛古斯弱点改变!",
	frenzy_message = "狂暴! 立刻宁神!",
	enrage_warning = "马上激怒!",

	breath1 = "Time Lapse",
	breath2 = "Corrosive Acid",
	breath3 = "Ignite Flesh",
	breath4 = "Incinerate",
	breath5 = "Frost Burn",

	breathcolor1 = "Black",
	breathcolor2 = "Green",
	breathcolor3 = "Magenta",
	breathcolor4 = "Red",
	breathcolor5 = "Blue",

	icon1 = "Spell_Arcane_PortalOrgrimmar",
	icon2 = "Spell_Nature_Acid_01",
	icon3 = "Spell_Fire_Fire",
	icon4 = "Spell_Shadow_ChillTouch",
	icon5 = "Spell_Frost_ChillingBlast",

	castingbar = "施放%s",
	frenzy_bar = "狂暴(立刻宁神)",
    frenzy_Nextbar = "下次狂暴(准备宁神)",
	first_bar = "第一次吐息",
	second_bar = "第二次吐息",
    vuln_bar = "%s 弱点",

	fire = "Fire",
	frost = "Frost",
	shadow = "Shadow",
	nature = "Nature",
	arcane = "Arcane",

	curseofdoom = "Curse of Doom",
	ignite = "Ignite",
	starfire = "Starfire",
	thunderfury = "Thunderfury",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	cmd = "Chromaggus",

	enrage_cmd = "enrage",
	enrage_name = "激怒",
	enrage_desc = "20%生命激怒前发出警报.",

	frenzy_cmd = "frenzy",
	frenzy_name = "狂暴",
	frenzy_desc = "狂暴警报.",

	breath_cmd = "breath",
	breath_name = "吐息",
	breath_desc = "提醒，吐息.",
    
    breathcd_cmd = "breathcd",
    breathcd_name = "吐息倒计时",
    breathcd_desc = "吐息语音警告.",
            
	vulnerability_cmd = "vulnerability",
	vulnerability_name = "弱点警报",
	vulnerability_desc = "克洛玛古斯弱点改变时发出警报.",

	breath_trigger = "克洛玛古斯开始施放(.+)。",
	trigger_vulnerability_direct_crit = "^[^%s]+的([^%s]+)致命一击对克洛玛古斯造成(%d+)点([^%s]+)伤害。[%（]*([%d]*)", -- [Fashu's] [Firebolt] [hits] Battleguard Sartura for [44] [Fire] damage. ([14] resisted)
 	trigger_vulnerability_direct_hit = "^[^%s]+的([^%s]+)击中克洛玛古斯造成(%d+)点([^%s]+)伤害。[%（]*([%d]*)",
	vulnerability_dots_test = "^[^%s]+的([^%s]+)使克洛玛古斯受到了(%d+)点([^%s]+)伤害。[%（]*([%d]*)",
	frenzy_trigger = "变得极为狂暴！",
	frenzyfade_trigger = "疯狂效果从克洛玛古斯身上消失。",
	vulnerability_trigger = "%s的皮肤闪闪发光，他退缩了。",

	firstbreaths_warning = "5秒吐息!",
	breath_warning = "%s 5秒!",
	breath_message = "%s 正在施放!",
	vulnerability_message = "弱点: %s!",
	vulnerability_warning = "克洛玛古斯弱点改变!",
	frenzy_message = "狂暴! 立刻宁神!",
	enrage_warning = "马上激怒!",

	breath1 = "时间流逝",
	breath2 = "腐蚀酸液",
	breath3 = "点燃躯体",
	breath4 = "焚烧",
	breath5 = "冰霜灼烧",
	
	breathcolor1 = "黑",
	breathcolor2 = "绿",
	breathcolor3 = "青铜",
	breathcolor4 = "红",
	breathcolor5 = "蓝",

	icon1 = "Spell_Arcane_PortalOrgrimmar",
	icon2 = "Spell_Nature_Acid_01",
	icon3 = "Spell_Fire_Fire",
	icon4 = "Spell_Shadow_ChillTouch",
	icon5 = "Spell_Frost_ChillingBlast",

	castingbar = "施放%s",
	frenzy_bar = "狂暴(立刻宁神)",
    frenzy_Nextbar = "下次狂暴(准备宁神)",
	first_bar = "第一次吐息",
	second_bar = "第二次吐息",
    vuln_bar = "%s 弱点",
	
	fire = "火焰",
	frost = "冰霜",
	shadow = "暗影",
	nature = "自然",
	arcane = "奥术",
	
	curseofdoom = "厄运诅咒",
	ignite = "点燃",
	starfire = "星火术",
	thunderfury = "雷霆之怒",
} end )

L:RegisterTranslations("deDE", function() return {
	enrage_name = "Wutanfall",
	enrage_desc = "Warnung, wenn Chromaggus w\195\188tend wird (ab 20%).",

	frenzy_name = "Raserei",
	frenzy_desc = "Warnung, wenn Chromaggus in Raserei ger\195\164t.",

	breath_name = "Atem",
	breath_desc = "Warnung, wenn Chromaggus seinen Atem wirkt.",

	vulnerability_name = "Zauber-Verwundbarkeiten",
	vulnerability_desc = "Warnung, wenn Chromagguss Zauber-Verwundbarkeit sich \195\164ndert.",

	breath_trigger = "^Chromaggus beginnt (.+) zu wirken\.",
	vulnerability_direct_test = "^(.+) trifft Chromaggus(.+) ([%d]+) ([%w]+)%.[%s%(]*([%d]*)",
	vulnerability_dots_test = "^Chromaggus erleidet ([%d]+) ([%w]+)schaden[%svon]*[%s%w]* %(durch ([%w%s:]+)%)%.[%s%(]*([%d]*)",
	frenzy_trigger = "Chromaggus wird mörderisch wahnsinnig!",
	frenzyfade_trigger = "Raserei schwindet von Chromaggus\.",
	vulnerability_trigger = "Chromaggus weicht zurück, als die Haut schimmert.",

	hit = "trifft",
	crit = "kritisch",

	firstbreaths_warning = "Atem in 5 Sekunden!",
	breath_warning = "%s in 5 Sekunden!",
	breath_message = "Chromaggus wirkt: %s Atem!",
	vulnerability_message = "Zauber-Verwundbarkeit: %s",
	vulnerability_warning = "Zauber-Verwundbarkeit ge\195\164ndert!",
	frenzy_message = "Raserei - Einlullender Schuss!",
	enrage_warning = "Wutanfall steht kurz bevor!",

	breath1 = "Zeitraffer",
	breath2 = "\195\132tzende S\195\164ure",
	breath3 = "Fleisch entz\195\188nden",
	breath4 = "Verbrennen",
	breath5 = "Frostbeulen",

	breathcolor1 = "black",
	breathcolor2 = "green",
	breathcolor3 = "orange",
	breathcolor4 = "red",
	breathcolor5 = "blue",

	icon1 = "Spell_Arcane_PortalOrgrimmar",
	icon2 = "Spell_Nature_Acid_01",
	icon3 = "Spell_Fire_Fire",
	icon4 = "Spell_Shadow_ChillTouch",
	icon5 = "Spell_Frost_ChillingBlast",

	castingbar = "Wirkt %s",
	frenzy_bar = "Raserei",
	frenzy_Nextbar = "Nächste Raserei",
	first_bar = "Erster Atem",
	second_bar = "Zweite Atem",
	vuln_bar = "%s Verwundbarkeit",

	fire = "Feuer",
	frost = "Frost",
	shadow = "Schatten",
	nature = "Natur",
	arcane = "Arkan",

	curseofdoom = "Fluch der Verdammnis",
	ignite = "Entz\195\188nden",
	starfire = "Sternenfeuer",
	thunderfury = "Zorn der Winde",
} end )


---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20007 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
--module.wipemobs = { L["add_name"] } -- adds which will be considered in CheckForEngage
module.toggleoptions = {"enrage", "frenzy", "breath", "breathcd", "vulnerability", "bosskill"}


-- locals
local timer = {
	firstBreath = 30,
	secondBreath = 60,
	breathInterval = 58,
	breathCast = 2,
	frenzy = 8,
	nextFrenzy = 15,
	vulnerability = 20,
}
local icon = {
	unknown = "INV_Misc_QuestionMark",
	breath1 = "Spell_Arcane_PortalOrgrimmar",
	breath2 = "Spell_Nature_Acid_01",
	breath3 = "Spell_Fire_Fire",
	breath4 = "Spell_Shadow_ChillTouch",
	breath5 = "Spell_Frost_ChillingBlast",
	frenzy = "Ability_Druid_ChallangingRoar",
	tranquil = "Spell_Nature_Drowsy",
	vulnerability = "Spell_Shadow_BlackPlague",
}
local syncName = {
	breath = "ChromaggusBreath"..module.revision,
	frenzy = "ChromaggusFrenzyStart"..module.revision,
	frenzyOver = "ChromaggusFrenzyStop"..module.revision,
}

local lastFrenzy = 0
local _, playerClass = UnitClass("player")
local breathCache = {}  -- in case your raid wipes

local vulnerability = nil
local twenty = nil
local frenzied = nil
local lastVuln = 0

------------------------------
--      Initialization      --
------------------------------

--module:RegisterYellEngage(L["start_trigger"])

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER")
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE")
	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_PET_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "PlayerDamageEvents")
	self:RegisterEvent("UNIT_HEALTH")

	self:ThrottleSync(10, "ChromaggusEngage")
	self:ThrottleSync(25, syncName.breath)
	self:ThrottleSync(5, syncName.frenzy)
	self:ThrottleSync(5, syncName.frenzyOver)
end

-- called after module is enabled and after each wipe
function module:OnSetup()
	vulnerability = nil
	twenty = nil
	self.started = nil
	frenzied = nil
	lastVuln = 0
end

-- called after boss is engaged
function module:OnEngage()
	if self.db.profile.breath then
		local firstBarName  = L["first_bar"]
		local firstBarMSG   = L["firstbreaths_warning"]
		local secondBarName = L["second_bar"]
		local secondBarMSG  = L["firstbreaths_warning"]
		if table.getn(breathCache) == 2 then
			-- if we have 2 breaths cached this session means we have wiped already and that after discovering the two breath types
			firstBarName  = string.format(L["castingbar"], breathCache[1])
			firstBarMSG   = string.format(L["breath_message"], breathCache[1])
			secondBarName = string.format(L["castingbar"], breathCache[2])
			secondBarMSG  = string.format(L["breath_message"], breathCache[2])
		elseif table.getn(breathCache) == 1 then
			-- we wiped before but know at least the first breath
			firstBarName  = string.format(L["castingbar"], breathCache[1])
			firstBarMSG   = string.format(L["breath_message"], breathCache[1])
		end
		self:DelayedMessage(timer.firstBreath - 5, firstBarMSG, "Attention", nil, nil, true)
		self:Bar(firstBarName, timer.firstBreath, icon.unknown, true, "cyan")
		self:DelayedMessage(timer.secondBreath - 5, secondBarMSG, "Attention", nil, nil, true)
		self:Bar(secondBarName, timer.secondBreath, icon.unknown, true, "cyan")
	end
	if self.db.profile.breathcd then
		self:DelayedSound(timer.firstBreath - 10, "Ten", "b1_10")
		self:DelayedSound(timer.firstBreath - 3, "Three", "b1_3")
		self:DelayedSound(timer.firstBreath - 2, "Two", "b1_2")
		self:DelayedSound(timer.firstBreath - 1, "One", "b1_1")

		self:DelayedSound(timer.secondBreath - 10, "Ten", "b2_10")
		self:DelayedSound(timer.secondBreath - 3, "Three", "b2_3")
		self:DelayedSound(timer.secondBreath - 2, "Two", "b2_2")
		self:DelayedSound(timer.secondBreath - 1, "One", "b2_1")
	end
	if self.db.profile.frenzy then
		self:Bar(L["frenzy_Nextbar"], timer.nextFrenzy, icon.frenzy, true, "white")
	end
	self:Bar(format(L["vuln_bar"], "???"), timer.vulnerability, icon.vulnerability)

	lastVuln = GetTime()
end

-- called after boss is disengaged (wipe(retreat) or victory)
function module:OnDisengage()
end


------------------------------
--      Initialization      --
------------------------------

function module:UNIT_HEALTH( msg )
	if self.db.profile.enrage and UnitName(msg) == module.translatedName then
		local health = UnitHealth(msg)
		if health > 15 and health <= 20 and not twenty then
			self:Message(L["enrage_warning"], "Important", true, "Beware")
			twenty = true
		elseif health > 90 and twenty then
			twenty = nil
		end
	end
end

function module:CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE( msg )
	local _,_, spellName = string.find(msg, L["breath_trigger"])
	if spellName then
		local breath = L:HasReverseTranslation(spellName) and L:GetReverseTranslation(spellName) or nil
		if breath then
			breath = string.sub(breath, -1)
			self:Sync(syncName.breath .. " " ..breath)
		end
	end
end

function module:CHAT_MSG_MONSTER_EMOTE(msg)
	if string.find(msg, L["frenzy_trigger"]) and arg2 == module.translatedName then
		self:Sync(syncName.frenzy)
	elseif string.find(msg, L["vulnerability_trigger"]) then
		if self.db.profile.vulnerability then
			self:Message(L["vulnerability_warning"], "Positive")
			if vulnerability then
				self:RemoveBar(format(L["vuln_bar"], vulnerability))
			end
			self:Bar(format(L["vuln_bar"], "???"), timer.vulnerability, icon.vulnerability)
		end
		lastVuln = GetTime()
		vulnerability = nil
	end
end

function module:CHAT_MSG_SPELL_AURA_GONE_OTHER(msg)
	if msg == L["frenzyfade_trigger"] then
		self:Sync(syncName.frenzyOver)
	end
end

function module:CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE(msg)
	if not self.db.profile.vulnerability then return end
	if not vulnerability then
		local _, _, dmg, school, userspell, partial = string.find(msg, L["vulnerability_dots_test"])
		if dmg and school and userspell then
			if school == L["arcane"] then
				if partial and partial ~= "" then
					if tonumber(dmg)+tonumber(partial) >= 250 then
						self:IdentifyVulnerability(school)
					end
				else
					if tonumber(dmg) >= 250 then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == L["fire"] and not string.find(userspell, L["ignite"]) then
				if partial and partial ~= "" then
					if tonumber(dmg)+tonumber(partial) >= 400 then
						self:IdentifyVulnerability(school)
					end
				else
					if tonumber(dmg) >= 400 then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == L["nature"] then
				if partial and partial ~= "" then
					if tonumber(dmg)+tonumber(partial) >= 300 then
						self:IdentifyVulnerability(school)
					end
				else
					if tonumber(dmg) >= 300 then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == L["shadow"] then
				if string.find(userspell, L["curseofdoom"]) then
					if partial and partial ~= "" then
						if tonumber(dmg)+tonumber(partial) >= 3000 then
							self:IdentifyVulnerability(school)
						end
					else
						if tonumber(dmg) >= 3000 then
							self:IdentifyVulnerability(school)
						end
					end
				else
					if partial and partial ~= "" then
						if tonumber(dmg)+tonumber(partial) >= 500 then
							self:IdentifyVulnerability(school)
						end
					else
						if tonumber(dmg) >= 500 then
							self:IdentifyVulnerability(school)
						end
					end
				end
			end
		end
	end
end

function module:PlayerDamageEvents(msg)
	if not self.db.profile.vulnerability then return end
	if not vulnerability then
		local stype = "hit"
		local _, _, userspell, dmg, school, partial = string.find(msg, L["trigger_vulnerability_direct_hit"])
		if not userspell then
			stype = "crit"
			_, _, userspell, dmg, school, partial = string.find(msg, L["trigger_vulnerability_direct_crit"])
		end
		-- "^[%w]+[%s's]* ([%w%s:]+) ([%w]+) Chromaggus for ([%d]+) ([%w]+) damage%.[%s%(]*([%d]*)"
		-- [Fashu's] [Firebolt] [hits] Battleguard Sartura for [44] [Fire] damage. ([14] resisted)
		-- [Fashu's] [Feuerblitz] [trifft] Schlachtwache Sartura für [44] [Feuerschaden]. ([14] widerstanden)
		-- userspell: Firebolt; stype: hits; dmg: 44; school: Fire; partial: 14

		-- Kan's Life Steal crits Battleguard Sartura for 45 Shadow damage. (15 resisted)
		-- Kan's Lebensdiebstahl trifft Schlachtwache Sartura kritisch für 45 Schattenschaden. (15 widerstanden)


		if stype and dmg and school then
			-- german combat log entries for a crit are a bit special (<name> hits <enemy> critically for <x> damage.)
			if school == L["arcane"] then
				if string.find(userspell, L["starfire"]) then
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 800 and stype == "hit") or (tonumber(dmg)+tonumber(partial) >= 1200 and stype == "crit") then
							self:IdentifyVulnerability(school)
						end
					else
						if (tonumber(dmg) >= 800 and stype == "hit") or (tonumber(dmg) >= 1200 and stype == "crit") then
							self:IdentifyVulnerability(school)
						end
					end
				else
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 600 and stype == "hit") or (tonumber(dmg)+tonumber(partial) >= 1200 and stype == "crit") then
							self:IdentifyVulnerability(school)
						end
					else
						if (tonumber(dmg) >= 600 and stype == "hit") or (tonumber(dmg) >= 1200 and stype == "crit") then
							self:IdentifyVulnerability(school)
						end
					end
				end
			elseif school == L["fire"] then
				if partial and partial ~= "" then
					if (tonumber(dmg)+tonumber(partial) >= 1300 and stype == "hit") or (tonumber(dmg)+tonumber(partial) >= 2600 and stype == "crit") then
						self:IdentifyVulnerability(school)
					end
				else
					if (tonumber(dmg) >= 1300 and stype == "hit") or (tonumber(dmg) >= 2600 and stype == "crit") then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == L["frost"] then
				if partial and partial ~= "" then
					if (tonumber(dmg)+tonumber(partial) >= 800 and stype == "hit")	or (tonumber(dmg)+tonumber(partial) >= 1600 and stype == "crit") then
						self:IdentifyVulnerability(school)
					end
				else
					if (tonumber(dmg) >= 800 and stype == "hit") or (tonumber(dmg) >= 1600 and stype == "crit") then
						self:IdentifyVulnerability(school)
					end
				end
			elseif school == L["nature"] then
				if string.find(userspell, L["thunderfury"]) then
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 800 and stype == "hit") or (tonumber(dmg)+tonumber(partial) >= 1200 and stype == "crit") then
							self:IdentifyVulnerability(school)
						end
					else
						if (tonumber(dmg) >= 800 and stype == "hit") or (tonumber(dmg) >= 1200 and stype == "crit") then
							self:IdentifyVulnerability(school)
						end
					end
				else
					if partial and partial ~= "" then
						if (tonumber(dmg)+tonumber(partial) >= 900 and stype == "hit") or (tonumber(dmg)+tonumber(partial) >= 1800 and stype == "crit") then
							self:IdentifyVulnerability(school)
						end
					else
						if (tonumber(dmg) >= 900 and stype == "hit") or (tonumber(dmg)>= 1800 and stype == "crit") then
							self:IdentifyVulnerability(school)
						end
					end
				end
			elseif school == L["shadow"] then
				if partial and partial ~= "" then
					if (tonumber(dmg)+tonumber(partial) >= 1700 and stype == "hit") or (tonumber(dmg)+tonumber(partial) >= 3400 and stype == "crit") then
						self:IdentifyVulnerability(school)
					end
				else
					if (tonumber(dmg) >= 1700 and stype == "hit") or (tonumber(dmg) >= 3400 and stype == "crit") then
						self:IdentifyVulnerability(school)
					end
				end
			end
		end
	end
end


------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.breath and self.db.profile.breath then
		local spellName = L:HasTranslation("breath"..rest) and L["breath"..rest] or nil
		if not spellName then return end
		if table.getn(breathCache) < 2 then
			breathCache[table.getn(breathCache)+1] = spellName
		end
		local b = "breath"..rest
		self:RemoveBar(L["icon"..rest]) -- remove timer bar
		self:Bar(string.format( L["castingbar"], spellName), timer.breathCast, L["icon"..rest]) -- show cast bar
		self:Message(string.format(L["breath_message"], spellName), "Important")

		self:DelayedMessage(timer.breathInterval - 5, string.format(L["breath_warning"], spellName), "Important", nil, nil, true)
		self:DelayedBar(timer.breathCast, spellName, timer.breathInterval, L["icon"..rest], true, L["breathcolor"..rest]) -- delayed timer bar

		if self.db.profile.breathcd then
			self:DelayedSound(timer.breathInterval+timer.breathCast - 10, "Ten", spellName)
			self:DelayedSound(timer.breathInterval+timer.breathCast - 3, "Three", spellName)
			self:DelayedSound(timer.breathInterval+timer.breathCast - 2, "Two", spellName)
			self:DelayedSound(timer.breathInterval+timer.breathCast - 1, "One", spellName)
		end

	elseif sync == syncName.frenzy then
		if self.db.profile.frenzy and not frenzied then
			self:Message(L["frenzy_message"], "Attention")
			self:Bar(L["frenzy_bar"], timer.frenzy, icon.frenzy, true, "red")

			if playerClass == BC["Hunter"] then
				self:WarningSign(icon.tranquil, timer.frenzy, true)
			end
		end
		frenzied = true
		lastFrenzy = GetTime()
	elseif sync == syncName.frenzyOver then
		if self.db.profile.frenzy and frenzied then
			self:RemoveBar(L["frenzy_bar"])
			if lastFrenzy ~= 0 then
				local NextTime = (lastFrenzy + timer.nextFrenzy) - GetTime()
				self:Bar(L["frenzy_Nextbar"], NextTime, icon.frenzy, true, "white")
			end
		end
		self:RemoveWarningSign(icon.tranquil, true)
		frenzied = nil
	end
end


------------------------------
--      Utility	Functions   --
------------------------------

function module:IdentifyVulnerability(school)
	if not self.db.profile.vulnerability or not type(school) == "string" then return end
	if (lastVuln + 3) > GetTime() then return end -- 5 seconds delay

	vulnerability = school
	self:Message(format(L["vulnerability_message"], school), "Positive")
	if lastVuln then
		self:RemoveBar(format(L["vuln_bar"], "???"))
		self:Bar(format(L["vuln_bar"], school), (lastVuln + timer.vulnerability) - GetTime(), icon.vulnerability)
	end
end