
local module, L = BigWigs:ModuleDeclaration("General Rajaxx", "Ruins of Ahn'Qiraj")
local andorov = AceLibrary("Babble-Boss-2.2")["Lieutenant General Andorov"]
local BC = AceLibrary("Babble-Class-2.2")

module.revision = 30069
module.enabletrigger = {module.translatedName, andorov}
module.toggleoptions = {"wave", "fear", "attackorder", "lightningcloud", "shockwave", "shield", "knockback", "enlarge", "thundercrash", "bosskill"}

L:RegisterTranslations("enUS", function() return {
	cmd = "Rajaxx",

	wave_cmd = "wave",
	wave_name = "来袭警报",
	wave_desc = "当新一批敌人来袭时发出警告",
	
	fear_cmd = "fear",--1
	fear_name = "恐惧警报",
	fear_desc = "恐惧状态出现时进行警告",
	
	attackorder_cmd = "attackorder",--2
	attackorder_name = "攻击指令警报",
	attackorder_desc = "攻击指令出现时进行警告",
	
	lightningcloud_cmd = "lightningcloud",--3
	lightningcloud_name = "闪电云警报",
	lightningcloud_desc = "闪电云出现时进行警告",
	
	shockwave_cmd = "shockwave",--4
	shockwave_name = "震荡波警报",
	shockwave_desc = "震荡波出现时进行警告",
	
	shield_cmd = "shield",--5
	shield_name = "护盾警报",
	shield_desc = "护盾出现时进行警告",
	
	knockback_cmd = "knockback",--6
	knockback_name = "击退警报",
	knockback_desc = "击退出现时进行警告",
	
	enlarge_cmd = "enlarge",--7
	enlarge_name = "巨化术警报",
	enlarge_desc = "巨化术出现时进行警告",
	
	thundercrash_cmd = "thundercrash",--2
	thundercrash_name = "雷霆冲击警报",
	thundercrash_desc = "雷霆冲击出现时进行警告",
	
	
	trigger_eventStarted = "Remember, Rajaxx, when I said I'd kill you last?",--CHAT_MSG_MONSTER_YELL
	bar_eventStart = "战斗开始",
	
	--not using trigger_wave1 -> bc if you body pull, will cause the trigger to happen at wave 2
	--trigger_wave1 = "Kill first, ask questions later... Incoming!",--CHAT_MSG_MONSTER_YELL
	msg_wave1 = "第1/8波 -- 4名战士，2名钉刺者，奎兹上尉 -> 恐惧",
	trigger_fear = "afflicted by Intimidating Shout.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	bar_fear = "恐惧冷却",
	
	trigger_wave2 = "Captain Qeez dies.",--CHAT_MSG_COMBAT_HOSTILE_DEATH
	msg_wave2 = "第2/8波 -- 3名战士，3名钉刺者，图比德上尉 -> 标记",
	trigger_attackOrder = "(.*) is afflicted by Attack Order.",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_attackOrderYou = "You are afflicted by Attack Order.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	bar_attackOrder = " 已标记",
	trigger_attackOrderFade = "Attack Order fades from (.*).",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_wave3 = "The time of our retribution is at hand! Let darkness reign in the hearts of our enemies!",--CHAT_MSG_MONSTER_YELL
	msg_wave3 = "第3/8波 -- 1名战士，5名钉刺者，德雷恩上尉 -> 闪电云",
	trigger_lightningCloud = "You are afflicted by Lightning Cloud.",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	msg_lightningCloud = "闪电云，快躲开！",
	trigger_lightningCloudFade = "Lightning Cloud fades from you",--CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_wave4 = "No longer will we wait behind barred doors and walls of stone! No longer will our vengeance be denied! The dragons themselves will tremble before our wrath!",--??\n?? CHAT_MSG_MONSTER_YELL
	msg_wave4 = "第4/8波 -- 2名战士，4名钉刺者，库雷姆上尉 -> 范围伤害",
	trigger_shockwave = "Captain Xurrem's Shockwave",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	bar_shockwave = "震荡波冷却",
	
	trigger_wave5 = "Fear is for the enemy! Fear and death!",--CHAT_MSG_MONSTER_YELL
	msg_wave5 = "第5/8波 -- 2名战士，4名钉刺者，叶吉斯少校 -> 护盾",
	trigger_shield = "Major Yeggeth gains Shield of Rajaxx",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	bar_shield = "免疫魔法",
	
	trigger_wave6 = "Staghelm will whimper and beg for his life, just as his whelp of a son did! One thousand years of injustice will end this day!",--??\n?? CHAT_MSG_MONSTER_YELL
	msg_wave6 = "第6/8波 -- 4名战士，2名钉刺者，帕库少校 -> 击退",
	trigger_slam = "Major Pakkon's Sweeping Slam",--
	bar_slam = "重击冷却",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	
	trigger_wave7 = "Fandral! Your time has come! Go and hide in the Emerald Dream and pray we never find you!",--??\n?? CHAT_MSG_MONSTER_YELL
	msg_wave7 = "第7/8波 -- 3名战士，3名钉刺者，泽朗上校 -> 扩大",
	trigger_enlarge = "Colonel Zerran gains Enlarge.",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	bar_enlarge = "扩大，驱散！",
	msg_enlarge = "扩大，驱散！",
	trigger_enlargeFade = "Enlarge fades from Colonel Zerran.",--CHAT_MSG_SPELL_AURA_GONE_OTHER
	
	trigger_wave8 = "Impudent fool! I will kill you myself!",--CHAT_MSG_MONSTER_YELL
	msg_wave8 = "第8/8波 -- 拉贾克斯将军",
	trigger_thundercrash = "Thundercrash",
	bar_thundercrash = "雷霆冲击 CD",
	clickme = " >点击我！<",
	you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	cmd = "Rajaxx",

	wave_cmd = "wave",
	wave_name = "来袭警报",
	wave_desc = "当新一批敌人来袭时发出警告",
	
	fear_cmd = "fear",--1
	fear_name = "恐惧警报",
	fear_desc = "恐惧状态出现时进行警告",
	
	attackorder_cmd = "attackorder",--2
	attackorder_name = "攻击指令警报",
	attackorder_desc = "攻击指令出现时进行警告",
	
	lightningcloud_cmd = "lightningcloud",--3
	lightningcloud_name = "闪电云警报",
	lightningcloud_desc = "闪电云出现时进行警告",
	
	shockwave_cmd = "shockwave",--4
	shockwave_name = "震荡波警报",
	shockwave_desc = "震荡波出现时进行警告",
	
	shield_cmd = "shield",--5
	shield_name = "护盾警报",
	shield_desc = "护盾出现时进行警告",
	
	knockback_cmd = "knockback",--6
	knockback_name = "击退警报",
	knockback_desc = "击退出现时进行警告",
	
	enlarge_cmd = "enlarge",--7
	enlarge_name = "巨化术警报",
	enlarge_desc = "巨化术出现时进行警告",
	
	thundercrash_cmd = "thundercrash",--2
	thundercrash_name = "雷霆冲击警报",
	thundercrash_desc = "雷霆冲击出现时进行警告",
	
	
	trigger_eventStarted = "拉贾克斯，还记得我说过要杀光其他虫子之后再干掉你么？",--CHAT_MSG_MONSTER_YELL
	bar_eventStart = "战斗开始",
	
	--not using trigger_wave1 -> bc if you body pull, will cause the trigger to happen at wave 2
	--trigger_wave1 = "Kill first, ask questions later... Incoming!",--CHAT_MSG_MONSTER_YELL
	msg_wave1 = "第1/8波 -- 4名战士，2名钉刺者，奎兹上尉 -> 恐惧",
	trigger_fear = "受到了破胆怒吼效果的影响。",--CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	bar_fear = "恐惧冷却",
	
	trigger_wave2 = "奎兹上尉死亡了。",--CHAT_MSG_COMBAT_HOSTILE_DEATH
	msg_wave2 = "第2/8波 -- 3名战士，3名钉刺者，图比德上尉 -> 标记",
	trigger_attackOrder = "(.*)受到了攻击命令效果的影响。",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE
	trigger_attackOrderYou = "你受到了攻击命令效果的影响。",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	bar_attackOrder = " 被标记",
	trigger_attackOrderFade = "攻击命令效果从(.*)身上消失了。",--CHAT_MSG_SPELL_AURA_GONE_OTHER // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_wave3 = "我们复仇的时刻到了！让敌人的内心被黑暗吞噬吧!",--CHAT_MSG_MONSTER_YELL
	msg_wave3 = "第3/8波 -- 1名战士，5名钉刺者，德雷恩上尉 -> 闪电云",
	trigger_lightningCloud = "你受到了闪电之云效果的影响。",--CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	msg_lightningCloud = "闪电云，快躲开！",
	trigger_lightningCloudFade = "闪电之云效果从你身上消失了。",--CHAT_MSG_SPELL_AURA_GONE_SELF
	
	trigger_wave4 = "我们不用再呆在这座石墙里面了！我们很快就能报仇了！在我们的怒火面前，就连那些龙也会战栗！",--??\n?? CHAT_MSG_MONSTER_YELL
	msg_wave4 = "第4/8波 -- 2名战士，4名钉刺者，库雷姆上尉 -> 范围伤害",
	trigger_shockwave = "瑟瑞姆上尉的震荡波",--CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	bar_shockwave = "震荡波冷却",
	
	trigger_wave5 = "让敌人胆战心惊吧！让他们在恐惧中死去！",--CHAT_MSG_MONSTER_YELL
	msg_wave5 = "第5/8波 -- 2名战士，4名钉刺者，叶吉斯少校 -> 护盾",
	trigger_shield = "叶吉斯少校获得了拉贾克斯之盾的效果。",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	bar_shield = "免疫魔法",
	
	trigger_wave6 = "鹿盔将会呜咽着哀求我绕他一命，就像他那懦弱的儿子一样！一千来的屈辱会在今天洗清！",--??\n?? CHAT_MSG_MONSTER_YELL
	msg_wave6 = "第6/8波 -- 4名战士，2名钉刺者，帕库少校 -> 击退",
	trigger_slam = "帕库少校的横扫猛击",--
	bar_slam = "猛击冷却",--CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE // CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE
	
	trigger_wave7 = "范达尔！你的死期到了！藏到翡翠梦境里去吧，祈祷我们永远都找不到你！",--??\n?? CHAT_MSG_MONSTER_YELL
	msg_wave7 = "第7/8波 -- 3名战士，3名钉刺者，泽朗上校 -> 扩大",
	trigger_enlarge = "泽朗上校获得了放大的效果。",--CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	bar_enlarge = "扩大，驱散！",
	msg_enlarge = "扩大，驱散！",
	trigger_enlargeFade = "放大效果从泽朗上校身上消失了。",--CHAT_MSG_SPELL_AURA_GONE_OTHER
	
	trigger_wave8 = "无礼的蠢货！我会亲自要了你们的命！",--CHAT_MSG_MONSTER_YELL
	msg_wave8 = "第8/8波 -- 拉贾克斯将军",
	trigger_thundercrash = "雷霆碰撞",
	bar_thundercrash = "雷霆冲击 CD",
	clickme = " >点击我！<",
	you = "你",
} end )

local timer = {
	eventStart = 34.72,
	
	firstFear = 11,--wave1
	fearCD = 15,--wave1
	attackOrder = 10,--wave2

	firstShockwave = 12,--wave4
	shockwaveCD = 10,--wave4
	shieldDuration = 6,--wave5
	firstSlam = 25,--wave6
	slamCD = 12.5,--wave6
	enlargeDuration = 60,--wave7
	firstThundercrash = 11,--wave8 (boss)
	thundercrashCD = 24,--wave8 (boss)
}
local icon = {
	eventStart = "Inv_Misc_PocketWatch_01",
	wave = "Inv_Misc_PocketWatch_01",
	
	fear = "Ability_GolemThunderClap",--wave1
	attackOrder = "Ability_Hunter_SniperShot",--wave2
	lightningCloud = "Spell_Nature_CallStorm",--wave3
	shockwave = "Inv_Gauntlets_31",--wave4
	shield = "Spell_Holy_SealOfProtection",--wave5
	slam = "Ability_Devour",--wave6
	enlarge = "Spell_Nature_Strength",--wave7
	thundercrash = "Spell_Nature_ThunderClap",--wave8 (boss)
}
local syncName = {
	wave1 = "RajaxxWave1"..module.revision,
	wave2 = "RajaxxWave2"..module.revision,
	wave3 = "RajaxxWave3"..module.revision,
	wave4 = "RajaxxWave4"..module.revision,
	wave5 = "RajaxxWave5"..module.revision,
	wave6 = "RajaxxWave6"..module.revision,
	wave7 = "RajaxxWave7"..module.revision,
	wave8 = "RajaxxWave8"..module.revision,
	fear = "RajaxxFear"..module.revision,
	attackOrder = "RajaxxAttackOrder"..module.revision,
	attackOrderFade = "RajaxxAttackOrderFade"..module.revision,
	shockwave = "RajaxxShockwave"..module.revision,
	shield = "RajaxxShield"..module.revision,
	slam = "RajaxxSlam"..module.revision,
	enlarge = "RajaxxEnlarge"..module.revision,
	enlargeFade = "RajaxxEnlargeFade"..module.revision,
	thundercrash = "RajaxxThundercrash"..module.revision,
}

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event")--debug
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "Event")--Fear, AttackOrder
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event")--Fear, AttackOrder, shockwave
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event")--Fear, AttackOrder, shockwave
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")--Fear, AttackOrder, lightningCloud, shockwave

	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event")--AttackOrderFade, enlargeFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event")--AttackOrderFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event")--AttackOrderFade, lightningCloudFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event")--Shield, Enlarge
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")--Slam
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_PARTY_DAMAGE", "Event")--Slam
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE", "Event")--Slam

	self:RegisterEvent("CHAT_MSG_MONSTER_YELL")
		
	self:ThrottleSync(5, syncName.wave1)
	self:ThrottleSync(5, syncName.wave2)
	self:ThrottleSync(5, syncName.wave3)
	self:ThrottleSync(5, syncName.wave4)
	self:ThrottleSync(5, syncName.wave5)
	self:ThrottleSync(5, syncName.wave6)
	self:ThrottleSync(5, syncName.wave7)
	self:ThrottleSync(5, syncName.wave8)
	self:ThrottleSync(5, syncName.fear)
	self:ThrottleSync(5, syncName.attackOrder)
	self:ThrottleSync(1, syncName.attackOrderFade)
	self:ThrottleSync(5, syncName.shockwave)
	self:ThrottleSync(5, syncName.shield)
	self:ThrottleSync(5, syncName.slam)
	self:ThrottleSync(5, syncName.enlarge)
	self:ThrottleSync(5, syncName.enlargeFade)
	self:ThrottleSync(5, syncName.thundercrash)

end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH")
end

function module:OnEngage()
	self:Bar("Target Andorov", 3600, icon.eventStart, true, "Cyan")
	self:SetCandyBarOnClick("BigWigsBar ".."Target Andorov", function(name, button, extra) TargetByName(andorov, true) end, rest)
end

function module:OnDisengage()
end

function module:CheckForWipe()
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	if string.find(msg, L["trigger_wave2"]) then
		self:Sync(syncName.wave2)
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg, sender)
	if msg == L["trigger_eventStarted"] and sender == andorov then
		module:SendEngageSync()
		self:Sync(syncName.wave1)
		
	--elseif string.find(msg, L["trigger_wave1"]) then
		--self:Sync(syncName.wave1)
		
	--no yells for wave 2

	elseif string.find(msg, L["trigger_wave3"]) then
		self:Sync(syncName.wave3)
	elseif string.find(msg, L["trigger_wave4"]) then
		self:Sync(syncName.wave4)
	elseif string.find(msg, L["trigger_wave5"]) then
		self:Sync(syncName.wave5)
	elseif string.find(msg, L["trigger_wave6"]) then
		self:Sync(syncName.wave6)
	elseif string.find(msg, L["trigger_wave7"]) then
		self:Sync(syncName.wave7)
	elseif string.find(msg, L["trigger_wave8"]) then
		self:Sync(syncName.wave8)
	end
end

function module:Event(msg)
	if string.find(msg, L["trigger_fear"]) then
		self:Sync(syncName.fear)
	
	elseif string.find(msg, L["trigger_attackOrder"]) then
		local _,_, attackOrderPerson, _ = string.find(msg, L["trigger_attackOrder"])
		self:Sync(syncName.attackOrder.." "..attackOrderPerson)
	elseif msg == L["trigger_attackOrderYou"] then
		self:Sync(syncName.attackOrder.." "..UnitName("Player"))
		
	elseif string.find(msg, L["trigger_attackOrderFade"]) then
		local _,_, attackOrderFadePerson, _ = string.find(msg, L["trigger_attackOrderFade"])
		if attackOrderFadePerson == L["you"] then
			attackOrderFadePerson = UnitName("Player")
		end
		self:Sync(syncName.attackOrderFade.." "..attackOrderFadePerson)
		
	elseif msg == L["trigger_lightningCloud"] and self.db.profile.lightningcloud then
		self:LightningCloud()
	elseif msg == L["trigger_lightningCloudFade"] and self.db.profile.lightningcloud then
		self:LightningCloudFade()
		
	elseif string.find(msg, L["trigger_shockwave"]) then
		self:Sync(syncName.shockwave)
		
	elseif string.find(msg, L["trigger_shield"]) then
		self:Sync(syncName.shield)
		
	elseif string.find(msg, L["trigger_slam"]) then
		self:Sync(syncName.slam)
		
	elseif msg == L["trigger_enlarge"] then
		self:Sync(syncName.enlarge)
	elseif msg == L["trigger_enlargeFade"] then
		self:Sync(syncName.enlargeFade)
		
	elseif string.find(msg, L["trigger_thundercrash"]) then
		self:Sync(syncName.thundercrash)
	end
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.wave1 and self.db.profile.wave then
		self:Wave1()
	elseif sync == syncName.wave2 and self.db.profile.wave then
		self:Wave2()
	elseif sync == syncName.wave3 and self.db.profile.wave then
		self:Wave3()
	elseif sync == syncName.wave4 and self.db.profile.wave then
		self:Wave4()
	elseif sync == syncName.wave5 and self.db.profile.wave then
		self:Wave5()
	elseif sync == syncName.wave6 and self.db.profile.wave then
		self:Wave6()
	elseif sync == syncName.wave7 and self.db.profile.wave then
		self:Wave7()
	elseif sync == syncName.wave8 and self.db.profile.wave then
		self:Wave8()
	
	elseif sync == syncName.fear and self.db.profile.fear then
		self:Fear()
	
	elseif sync == syncName.attackOrder and rest and self.db.profile.attackorder then
		self:AttackOrder(rest)
	elseif sync == syncName.attackOrderFade and rest and self.db.profile.attackorder then
		self:AttackOrderFade(rest)
	
	elseif sync == syncName.shockwave and self.db.profile.shockwave then
		self:Shockwave()
	
	elseif sync == syncName.shield and self.db.profile.shield then
		self:Shield()
		
	elseif sync == syncName.slam and self.db.profile.knockback then
		self:Slam()
		
	elseif sync == syncName.enlarge and self.db.profile.enlarge then
		self:Enlarge()
	elseif sync == syncName.enlargeFade and self.db.profile.enlarge then
		self:EnlargeFade()
	
	elseif sync == syncName.thundercrash and self.db.profile.thundercrash then
		self:Thundercrash()
	end
end

function module:Wave1()
	self:Message(L["msg_wave1"])
	if self.db.profile.fear then
		self:Bar(L["bar_fear"], timer.firstFear, icon.fear, true, "Blue")
	end
end

function module:Wave2()
	self:RemoveBar(L["bar_fear"])
	self:Message(L["msg_wave2"])
end

function module:Wave3()
	self:Message(L["msg_wave3"])
end

function module:Wave4()
	self:Message(L["msg_wave4"])
	if self.db.profile.shockwave then
		self:Bar(L["bar_shockwave"], timer.firstShockwave, icon.shockwave, true, "Blue")
	end
end

function module:Wave5()
	self:Message(L["msg_wave5"])
	self:RemoveBar(L["bar_shockwave"])
end

function module:Wave6()
	self:Message(L["msg_wave6"])
	self:RemoveBar(L["bar_shield"])
	if self.db.profile.knockback then
		self:Bar(L["bar_slam"], timer.firstSlam, icon.slam, true, "Blue")
	end
end

function module:Wave7()
	self:Message(L["msg_wave7"])
	self:RemoveBar(L["bar_slam"])
end

function module:Wave8()
	self:Message(L["msg_wave8"])
	self:RemoveBar(L["bar_enlarge"])
	if self.db.profile.thundercrash then
		self:Bar(L["bar_thundercrash"], timer.firstThundercrash, icon.thundercrash, true, "Blue")
	end
end


function module:Fear()
	self:Bar(L["bar_fear"], timer.fearCD, icon.fear, true, "Blue")
end

function module:AttackOrder(rest)
	if rest == UnitName("Player") then
		SendChatMessage("攻击命令在 "..UnitName("player").."!","SAY")
	end
	
	self:Bar(rest..L["bar_attackOrder"]..L["clickme"], timer.attackOrder, icon.attackOrder, true, "Blue")
	self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_attackOrder"].. L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)
	
	for i=1,GetNumRaidMembers() do
		if UnitName("raid"..i) == rest then
			SetRaidTarget("raid"..i, 4)
		end
	end
end

function module:AttackOrderFade(rest)
	self:RemoveBar(rest..L["bar_attackOrder"]..L["clickme"])
	for i=1,GetNumRaidMembers() do
		if UnitName("raid"..i) == rest then
			SetRaidTarget("raid"..i, 0)
		end
	end
end

function module:LightningCloud()
	self:Message(L["msg_lightningCloud"], "Important", false, "Info")
	self:WarningSign(icon.lightningCloud, 3)
end

function module:LightningCloudFade()
	self:RemoveWarningSign(icon.lightningCloud)
end

function module:Shockwave()
	self:Bar(L["bar_shockwave"], timer.shockwaveCD, icon.shockwave, true, "Blue")
end

function module:Shield()
	self:Bar(L["bar_shield"], timer.shieldDuration, icon.shield, true, "Blue")
end

function module:Slam()
	self:Bar(L["bar_slam"], timer.slamCD, icon.slam, true, "Blue")
end

function module:Enlarge()
	self:Bar(L["bar_enlarge"], timer.enlargeDuration, icon.enlarge, true, "Blue")
	if UnitClass("Player") == BC["Shaman"] then
		self:Message(L["msg_enlarge"], "Important", false, "Info")
		self:WarningSign(icon.enlarge, 0.7)
	else
		self:Message(L["msg_enlarge"], "Important")
	end
end

function module:EnlargeFade()
	self:RemoveBar(L["bar_enlarge"])
end

function module:Thundercrash()
	self:Bar(L["bar_thundercrash"], timer.thundercrashCD, icon.thundercrash, true, "Blue")
end
