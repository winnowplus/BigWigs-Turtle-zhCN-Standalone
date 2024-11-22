--Original file from balakethelock
--Adjustments by Relar

local module, L = BigWigs:ModuleDeclaration("Kel'Thuzad", "Naxxramas")
local BC = AceLibrary("Babble-Class-2.2")
local bbkelthuzad = AceLibrary("Babble-Boss-2.2")["Kel'Thuzad"]
local bbunstoppableabomination = AceLibrary("Babble-Boss-2.2")["Unstoppable Abomination"]
local bbsoulweaver = AceLibrary("Babble-Boss-2.2")["Soul Weaver"]
local bzsapphironslair = AceLibrary("Babble-Zone-2.2")["Sapphiron's Lair"]
local bzeasternplaguelands = AceLibrary("Babble-Zone-2.2")["Eastern Plaguelands"]
local bzkelthuzadchamber = AceLibrary("Babble-Zone-2.2")["Kel'Thuzad Chamber"]

module.revision = 30086
module.enabletrigger = module.translatedName
module.toggleoptions = {
	"phase",
	"p1adds",
	-1,
	"mc",
	--"mcicon",
	"fissure",
	"frostblast",
	"frostblastframe",
	"detonate",
	"detonateicon",
	-1,
	"frostbolt",
	"volley",
	-1,
	"guardian",
	"shackle",
	"bloodtap",
	-1,
	"proximity",
	"bosskill",
}

L:RegisterTranslations("enUS", function() return {
	cmd = "Kelthuzad",

	phase_cmd = "phase",
    phase_name = "阶段警报",
    phase_desc = "阶段变化时进行警告。",
	
	p1adds_cmd = "p1adds",
    p1adds_name = "第一阶段增援警报",
    p1adds_desc = "第一阶段增援出现时进行提醒。",
	
	mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制发生时进行警告。",

	--mcicon_cmd = "mcicon",
    mcicon_name = "精神控制标记",
    mcicon_desc = "在被精神控制的目标上标记团队标记。",

	fissure_cmd = "fissure",
    fissure_name = "暗影裂隙警报",
    fissure_desc = "暗影裂隙出现时进行警告。",

	frostblast_cmd = "frostblast",
    frostblast_name = "冰霜冲击警报",
    frostblast_desc = "冰霜冲击施放时进行警告。",
	
	frostblastframe_cmd = "frostblastframe",
    frostblastframe_name = "冰霜冲击目标框架",
    frostblastframe_desc = "显示一个包含冰霜冲击目标及其血量条的框架。",
	
	detonate_cmd = "detonate",
    detonate_name = "自爆法力警报",
    detonate_desc = "自爆法力施放时进行警告。",

	detonateicon_cmd = "detonateicon",
    detonateicon_name = "自爆法力标记",
    detonateicon_desc = "在自爆法力的目标上标记团队标记。",
	
	frostbolt_cmd = "frostbolt",
    frostbolt_name = "单体寒冰箭警报",
    frostbolt_desc = "单体寒冰箭施放时进行警告。",

	volley_cmd = "volley",
    volley_name = "寒冰箭雨警报",
    volley_desc = "寒冰箭雨施放时进行警告。",

	guardian_cmd = "guardian",
    guardian_name = "守护者出现警报",
    guardian_desc = "第三阶段守护者出现时进行警告。",

	shackle_cmd = "shackle",
    shackle_name = "束缚亡灵计数",
    shackle_desc = "统计对守护者施放的束缚亡灵次数。",
	
	bloodtap_cmd = "bloodtap",
    bloodtap_name = "血液分流计数",
    bloodtap_desc = "统计守护者身上的血液分流增益次数。",

	proximity_cmd = "proximity",
    proximity_name = "近距离警告",
    proximity_desc = "显示近距离警告框架",
	
	
	--Mortal Wound from Unstoppable Abomination, stacking, -10% healing, 15sec
	
	trigger_engage = "Minions, servants, soldiers of the cold dark, obey the call of Kel'Thuzad!", --CHAT_MSG_MONSTER_YELL
    bar_phase1 = "第一阶段",
	
	trigger_phase2_1 = "Pray for mercy!", --CHAT_MSG_MONSTER_YELL
	trigger_phase2_2 = "Scream your dying breath!", --CHAT_MSG_MONSTER_YELL
	trigger_phase2_3 = "The end is upon you!", --CHAT_MSG_MONSTER_YELL
    bar_phase2 = "克尔苏加德激活",
    msg_phase2 = "第二阶段 - 15秒后克尔苏加德激活！",
	
    msg_phase3soon = "即将进入第三阶段 - 在40%血量时开始",
	
	trigger_phase3 = "Master! I require aid!", --CHAT_MSG_MONSTER_YELL
    msg_phase3 = "第三阶段 - 5 个守护者即将到来 - 最多束缚 3 个！",
	
	--supposedly 14 of each, saw 13 weaver in logs. Also 117 Soldier of the Frozen Wastes, useful?
    bar_abom = "/14 憎恶死亡",
    bar_weaver = "/14 编织者死亡",
	
    msg_abom = "憎恶已刷新 ",
    msg_weaver = "织魂者已刷新 ",
		
	trigger_mcYell1 = "Your soul, is bound to me now!",
	trigger_mcYell2 = "There will be no escape!",
    msg_mc = "精神控制！",
	
	trigger_mcYou = "You are afflicted by Chains of Kel'Thuzad.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_mcOther = "(.+) is afflicted by Chains of Kel'Thuzad.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_mcFade = "Chains of Kel'Thuzad fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mcAfflic = " 精神控制",
    bar_mcCd = "精神控制 CD",
	trigger_friendlyDead = "(.+) dies.", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
	
	trigger_fissure = "Kel'Thuzad casts Shadow Fissure.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_fissure = "离开裂隙！",
    msg_fissure = "暗影裂隙！",
	
	trigger_frostBlastYell = "I will freeze the blood in your veins!", --CHAT_MSG_MONSTER_YELL
	trigger_frostBlastYou = "You are afflicted by Frost Blast.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_frostBlastOther = "(.+) is afflicted by Frost Blast.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE, CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    bar_frostBlastCd = "冰霜冲击 CD",
    bar_frostBlastAfflic = "冰霜冲击",
    msg_frostBlast = "冰霜冲击！",
		--unused
	trigger_frostBlastFade = "Frost Blast fades from (.+)", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	
	trigger_detonateYou = "You are afflicted by Detonate Mana.", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_detonateOther = "(.+) is afflicted by Detonate Mana.", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_detonateFade = "Detonate Mana fades from (.+).", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_detonateAfflic = " 自爆法力",
    bar_detonateCd = "自爆法力 CD",
    msg_detonate = "自爆法力在 ",
	
	trigger_frostbolt = "Kel'Thuzad begins to cast Frostbolt.", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_frostbolt = "寒冰箭",
    msg_frostbolt = "寒冰箭 - 打断！",
	
	trigger_attack1 = "Kel'Thuzad attacks", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES
	trigger_attack2 = "Kel'Thuzad misses", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES
	trigger_attack3 = "Kel'Thuzad hits", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS
	trigger_attack4 = "Kel'Thuzad crits", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS
	trigger_kick1 = "Kick hits Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_kick2 = "Kick crits Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_kick3 = "Kick was blocked by Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel1 = "Pummel hits Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel2 = "Pummel crits Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel3 = "Pummel was blocked by Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash1 = "Shield Bash hits Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash2 = "Shield Bash crits Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash3 = "Shield Bash was blocked by Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_earthShock1 = "Earth Shock hits Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_earthShock2 = "Earth Shock crits Kel'Thuzad", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	
	trigger_volley = "afflicted by Frostbolt", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    bar_volley = "魔法飞弹 CD",
	
    bar_guardian = "守护者 %d",
	
	trigger_shackle = "Guardian of Icecrown is afflicted by Shackle Undead.", --CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
	trigger_shackleFade = "Shackle Undead fades from Guardian of Icecrown.", --CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_shackle = "束缚亡灵（最多3个）",
    msg_shackle = "%s/3",
	
	trigger_bloodTap = "Guardian of Icecrown gains Blood Tap %((.+)%).", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
    bar_bloodTapA = "血液分流 +",
    bar_bloodTapB = "% 伤害",
    clickme = " >点击我！<",
    you = "you",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Kelthuzad",

	phase_cmd = "phase",
    phase_name = "阶段警报",
    phase_desc = "阶段变化时进行警告。",
	
	p1adds_cmd = "p1adds",
    p1adds_name = "第一阶段增援警报",
    p1adds_desc = "第一阶段增援出现时进行提醒。",
	
	mc_cmd = "mc",
    mc_name = "精神控制警报",
    mc_desc = "精神控制发生时进行警告。",

	--mcicon_cmd = "mcicon",
    mcicon_name = "精神控制标记",
    mcicon_desc = "在被精神控制的目标上标记团队标记。",

	fissure_cmd = "fissure",
    fissure_name = "红圈警报",
    fissure_desc = "红圈出现时进行警告。",

	frostblast_cmd = "frostblast",
    frostblast_name = "冰墓警报",
    frostblast_desc = "冰墓施放时进行警告。",
	
	frostblastframe_cmd = "frostblastframe",
    frostblastframe_name = "冰墓目标框架",
    frostblastframe_desc = "显示一个包含冰墓目标及其血量条的框架。",
	
	detonate_cmd = "detonate",
    detonate_name = "法力爆炸警报",
    detonate_desc = "法力爆炸施放时进行警告。",

	detonateicon_cmd = "detonateicon",
    detonateicon_name = "法力爆炸标记",
    detonateicon_desc = "在法力爆炸的目标上标记团队标记。",
	
	frostbolt_cmd = "frostbolt",
    frostbolt_name = "单体冰霜箭警报",
    frostbolt_desc = "单体冰霜箭施放时进行警告。",

	volley_cmd = "volley",
    volley_name = "群体寒冰箭警报",
    volley_desc = "群体寒冰箭施放时进行警告。",

	guardian_cmd = "guardian",
    guardian_name = "小强出现警报",
    guardian_desc = "第三阶段小强出现时进行警告。",

	shackle_cmd = "shackle",
    shackle_name = "束缚亡灵计数",
    shackle_desc = "统计对小强施放的束缚亡灵次数。",
	
	bloodtap_cmd = "bloodtap",
    bloodtap_name = "血液分流计数",
    bloodtap_desc = "统计小强身上的血液分流增益次数。",

	proximity_cmd = "proximity",
    proximity_name = "近距离警告",
    proximity_desc = "显示近距离警告框架",
	
	
	--Mortal Wound from Unstoppable Abomination, stacking, -10% healing, 15sec
	
	trigger_engage = "冰冷黑暗的爪牙、仆人、士兵，听从克尔苏加德的召唤！", --CHAT_MSG_MONSTER_YELL
    bar_phase1 = "第一阶段",
	
	trigger_phase2_1 = "祈求怜悯！", --CHAT_MSG_MONSTER_YELL
	trigger_phase2_2 = "尖叫出你的临终呼吸！", --CHAT_MSG_MONSTER_YELL
	trigger_phase2_3 = "末日就在你身上！", --CHAT_MSG_MONSTER_YELL
    bar_phase2 = "克尔苏加德激活",
    msg_phase2 = "第二阶段 - 15秒后克尔苏加德激活！",
	
    msg_phase3soon = "即将进入第三阶段 - 在40%血量时开始",
	
	trigger_phase3 = "掌握！我需要援助！", --CHAT_MSG_MONSTER_YELL
    msg_phase3 = "第三阶段 - 5个小强即将到来 - 最多束缚 3 个！",
	
	--supposedly 14 of each, saw 13 weaver in logs. Also 117 Soldier of the Frozen Wastes, useful?
    bar_abom = "/14 憎恶死亡",
    bar_weaver = "/14 女妖死亡",
	
    msg_abom = "憎恶已刷新 ",
    msg_weaver = "女妖已刷新 ",
		
	trigger_mcYell1 = "你的灵魂，现在与我绑定了！",
	trigger_mcYell2 = "将无处可逃！",
    msg_mc = "精神控制！",
	
	trigger_mcYou = "你受到了克尔苏加德锁链效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_mcOther = "(.+)受到了克尔苏加德锁链效果的影响。", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE
	trigger_mcFade = "克尔苏加德的锁链效果从(.+)身上消失了。", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
    bar_mcAfflic = " 精神控制",
    bar_mcCd = "精神控制 CD",
	trigger_friendlyDead = "(.+)死亡了。", --CHAT_MSG_COMBAT_FRIENDLY_DEATH
	
	trigger_fissure = "克尔苏加德施放了暗影裂隙。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
    bar_fissure = "离开红圈！",
    msg_fissure = "红圈！",
	
	trigger_frostBlastYell = "我要冻结你血管里的血液！", --CHAT_MSG_MONSTER_YELL
	trigger_frostBlastYou = "你受到了冰霜冲击效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_frostBlastOther = "(.+)受到了冰霜冲击效果的影响。", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE, CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
    bar_frostBlastCd = "冰墓 CD",
    bar_frostBlastAfflic = "冰墓",
    msg_frostBlast = "冰墓！",
		--unused
	trigger_frostBlastFade = "冰霜冲击效果从(.+)身上消失。", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER

	trigger_detonateYou = "你受到了自爆法力效果的影响。", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE
	trigger_detonateOther = "(.+)受到了自爆法力效果的影响。", --CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	trigger_detonateFade = "自爆法力效果从(.+)身上消失。", --CHAT_MSG_SPELL_AURA_GONE_SELF // CHAT_MSG_SPELL_AURA_GONE_PARTY // CHAT_MSG_SPELL_AURA_GONE_OTHER
	bar_detonateAfflic = " 法力爆炸",
	bar_detonateCd = "法力爆炸 CD",
	msg_detonate = "法力爆炸在 ",

	trigger_frostbolt = "克尔苏加德开始施放冰霜箭。", --CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE
	bar_frostbolt = "冰霜箭",
	msg_frostbolt = "冰霜箭 - 打断！",
	
	trigger_attack1 = "克尔苏加德击中", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES
	trigger_attack2 = "克尔苏加德没有击中", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES
	trigger_attack3 = "克尔苏加德击中", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS
	trigger_attack4 = "克尔苏加德的致命一击", --CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS // CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS // CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS
	trigger_kick1 = "脚踢击中克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_kick2 = "脚踢对克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_kick3 = "脚踢被克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel1 = "拳击击中克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel2 = "拳击对克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_pummel3 = "拳击被克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash1 = "盾击击中克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash2 = "盾击对克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_shieldBash3 = "盾击被克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_earthShock1 = "地震术击中克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	trigger_earthShock2 = "地震术致命一击对克尔苏加德", --CHAT_MSG_SPELL_SELF_DAMAGE // CHAT_MSG_SPELL_PARTY_DAMAGE // CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE
	
	trigger_volley = "克尔苏加德的群体寒冰箭击中", --CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE // CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE // CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE // CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE
	bar_volley = "群体寒冰箭 CD",

	bar_guardian = "小强 %d",

	trigger_shackle = "寒冰皇冠卫士受到了束缚亡灵效果的影响。", --CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE
	trigger_shackleFade = "束缚亡灵效果从寒冰皇冠卫士身上消失。", --CHAT_MSG_SPELL_AURA_GONE_OTHER
	bar_shackle = "束缚亡灵（最多3个）",
	msg_shackle = "%s/3",

	trigger_bloodTap = "寒冰皇冠卫士获得了鲜血分流的效果%（(.+)%）。", --CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS
	bar_bloodTapA = "血液分流 +",
	bar_bloodTapB = "% 伤害",
	clickme = " >点击我！<",
	you = "你",

} end )

local timer = {
	phase1 = 320,
	phase2 = 15,
	
	p1adds = 600,
	
	firstMc = 60,
	mcCd = {40,55}, --was{60,90} vMangos says{60,75} minus the 20sec mcAfflic
	mcAfflic = 20,
	
	fissure = 3,
	
		--30-60 CD, can't happen less than 5sec after fissure, 8sec after volley
	firstFrostBlast = 50,
	frostBlastCd = {25,55}, --30,60, minus the 5sec afflic
	frostBlastAfflic = 5,
	
	firstDetonate = 20,
	detonateAfflic = 5,
	detonateCd = {15,20}, --was{20,30} vMangos says {20,25} minus the 5sec afflic
	
		--5-7sec CD, can't happen less than 5sec after fissure, 8sec after volley
	frostbolt = 2,
		
		--15-17 CD, can't happen less than 5sec after frostBlast or fissure
	firstVolley = 30,
	volley = {15,17},
	
	firstGuardian = 5,
	guardian = 7,
	
	bloodTap = 600,
}
local icon = {
	phase = "Spell_Shadow_Raisedead",
		
	abomination = "Spell_Shadow_CallOfBone",
	soulWeaver = "Spell_Shadow_Possession",
		
	mc = "Inv_Belt_18",
	fissure = "spell_shadow_creepingplague",
	frostBlast = "Spell_Frost_FreezingBreath",
	detonate = "Spell_Nature_WispSplode",
	frostbolt = "Spell_Frost_FrostBolt02",
	volley = "Spell_Frost_FrostWard",
	
	guardian = "Spell_Shadow_Raisedead",
	shackle = "Spell_Nature_Slow",
	bloodTap = "spell_shadow_lifedrain",
}
local color = {
	soulWeaver = "Blue",
	abomination = "Red",
	
	phase = "White",
	
	mc = "Black",
	detonate = "Green",
	frostBlast = "Red",
	fissure = "Cyan",
	
	volley = "Orange",
	frostbolt = "Blue",	
	
	guardian = "White",
	shackle = "White",
	bloodTap = "Yellow",
}
local syncName = {
	phase2 = "KelPhase2"..module.revision,
	phase3 = "KelPhase3"..module.revision,
	phase3soon = "KelPhase3soon"..module.revision,
	
	abominationDead = "KelAddDiesAbom"..module.revision,
	soulWeaverDead = "KelAddDiesSoul"..module.revision,
	
	mcYell = "KelMcYell"..module.revision,
	mc = "KelMc"..module.revision,
	mcFade = "KelMcFade"..module.revision,
	
	fissure = "KelFissure"..module.revision,
	
	frostBlastYell = "KelFrostBlastYell"..module.revision,
	frostBlast = "KelFrostBlast"..module.revision,
	
	detonate = "KelDetonate"..module.revision,
	detonateFade = "KelDetonateFade"..module.revision,
	
	frostbolt = "KelFrostbolt"..module.revision,
	frostboltOver = "KelFrostboltStop"..module.revision,
	
	volley = "KelVolley"..module.revision,
	
	shackle = "KelShackle"..module.revision,
	shackleFade = "KelShackleFade"..module.revision,
	
	bloodTap = "KelBloodTap"..module.revision,
}

module.proximityCheck = function(unit) return CheckInteractDistance(unit, 2) end
module.proximitySilent = true

local p3warn = nil
local mcYellTime = 0
local frostBlastYellTime = 0
local mc1 = nil
local mc2 = nil
local mc3 = nil
local mc4 = nil
local castingFrostbolt = nil
local shackleCount = 0
local shackleCounter = 0
local phase = "p1"
local numAbomDead = 0
local numWeaverDead = 0
local timeLastVolley = 0
local numVolleyHits = 0
local bloodTapCounter = 0

function module:OnRegister()
	self:RegisterEvent("MINIMAP_ZONE_CHANGED")
end

function module:OnEnable()
	--self:RegisterEvent("CHAT_MSG_SAY", "Event") --Debug
	
	self:RegisterEvent("CHAT_MSG_MONSTER_YELL") --trigger_engage, trigger_phase2_1,2,3, trigger_phase3, trigger_frostBlastYell
	
	self:RegisterEvent("UNIT_HEALTH") --msg_phase3Soon
	
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event") --trigger_fissure, trigger_frostbolt

	self:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE", "Event") --trigger_kick1-2-3, trigger_pummel1-2-3, trigger_shieldBash1-2-3, trigger_earthShock1-2
	self:RegisterEvent("CHAT_MSG_SPELL_PARTY_DAMAGE", "Event") --trigger_kick1-2-3, trigger_pummel1-2-3, trigger_shieldBash1-2-3, trigger_earthShock1-2
	self:RegisterEvent("CHAT_MSG_SPELL_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_kick1-2-3, trigger_pummel1-2-3, trigger_shieldBash1-2-3, trigger_earthShock1-2
	
	self:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE", "Event") --trigger_kick1-2-3, trigger_pummel1-2-3, trigger_shieldBash1-2-3, trigger_earthShock1-2
	
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS", "Event") --trigger_attack3, trigger_attack4
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_HITS", "Event") --trigger_attack3, trigger_attack4
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_HITS", "Event") --trigger_attack3, trigger_attack4
	
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES", "Event") --trigger_attack1, trigger_attack2
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_PARTY_MISSES", "Event") --trigger_attack1, trigger_attack2
	self:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_CREATURE_MISSES", "Event") --trigger_attack1, trigger_attack2

	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event") --trigger_volley, trigger_frostBlastYou, trigger_detonateYou
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_PARTY_DAMAGE", "Event") --trigger_volley, trigger_frostBlastOther, trigger_detonateOther
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_FRIENDLYPLAYER_DAMAGE", "Event") --trigger_volley, trigger_frostBlastOther, trigger_detonateOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_HOSTILEPLAYER_DAMAGE", "Event") --trigger_volley, trigger_frostBlastOther, trigger_detonateOther
	
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF", "Event") --trigger_frostBlastFade, trigger_detonateFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_PARTY", "Event") --trigger_frostBlastFade, trigger_detonateFade
	self:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_OTHER", "Event") --trigger_frostBlastFade, trigger_detonateFade, trigger_shackleFade
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_DAMAGE", "Event") --trigger_shackle
	
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_CREATURE_BUFFS", "Event") --trigger_bloodTap
	
	
	self:ThrottleSync(5, syncName.phase2)
	self:ThrottleSync(5, syncName.phase3)
	self:ThrottleSync(45, syncName.phase3soon)
	
	self:ThrottleSync(1, syncName.abominationDead)
	self:ThrottleSync(1, syncName.soulWeaverDead)
	
	self:ThrottleSync(5, syncName.mcYell)
	self:ThrottleSync(0, syncName.mc)
	self:ThrottleSync(0, syncName.mcFade)
	
	self:ThrottleSync(2, syncName.fissure)
	
	self:ThrottleSync(5, syncName.frostBlastYell)
	self:ThrottleSync(0, syncName.frostBlast)
	
	self:ThrottleSync(5, syncName.detonate)
	self:ThrottleSync(5, syncName.detonateFade)
	
	self:ThrottleSync(2, syncName.frostbolt)
	self:ThrottleSync(2, syncName.frostboltOver)
	
	self:ThrottleSync(3, syncName.volley)
	
	self:ThrottleSync(0, syncName.shackle)
	self:ThrottleSync(0, syncName.shackleFade)
	
	self:ThrottleSync(0, syncName.bloodTap)
	
	-- Set combat range to max to make sure players don't miss any events.
	SetCVar("CombatDeathLogRange", 200)
	SetCVar("CombatLogRangeParty", 200)
	SetCVar("CombatLogRangePartyPet", 200)
	SetCVar("CombatLogRangeFriendlyPlayers", 200)
	SetCVar("CombatLogRangeFriendlyPlayersPets", 200)
	SetCVar("CombatLogRangeHostilePlayers", 200)
	SetCVar("CombatLogRangeHostilePlayersPets", 200)
	SetCVar("CombatLogRangeCreature", 200)
end

function module:OnSetup()
	self:RegisterEvent("CHAT_MSG_COMBAT_HOSTILE_DEATH") --p1adds 
	self:RegisterEvent("CHAT_MSG_COMBAT_FRIENDLY_DEATH") --trigger_friendlyDead
end

function module:OnEngage()
	p3warn = nil
	mcYellTime = GetTime()
	frostBlastYellTime = GetTime()
	mc1 = nil
	mc2 = nil
	mc3 = nil
	mc4 = nil
	castingFrostbolt = nil
	shackleCount = 0
	shackleCounter = 0
	phase = "p1"
	numAbomDead = 0
	numWeaverDead = 0
	bloodTapCounter = 0
	
	if self.db.profile.phase then
		self:Bar(L["bar_phase1"], timer.phase1, icon.phase, true, color.phase)
	end
	
	if self.db.profile.p1adds then
		self:Bar(numAbomDead..L["bar_abom"], timer.p1adds, icon.abomination, true, color.abomination)
		self:Bar(numWeaverDead..L["bar_weaver"], timer.p1adds, icon.soulWeaver, true, color.soulWeaver)
		
		self:ScheduleEvent("abom1", self.AbominationSpawns, 44, self, "1")
		self:ScheduleEvent("abom2", self.AbominationSpawns, 72, self, "2")
		self:ScheduleEvent("abom3", self.AbominationSpawns, 100, self, "3")
		self:ScheduleEvent("abom4", self.AbominationSpawns, 130, self, "4")
		self:ScheduleEvent("abom5", self.AbominationSpawns, 153, self, "5")
		self:ScheduleEvent("abom6", self.AbominationSpawns, 176, self, "6")
		self:ScheduleEvent("abom7", self.AbominationSpawns, 193, self, "7")
		self:ScheduleEvent("abom8", self.AbominationSpawns, 212, self, "8")
		self:ScheduleEvent("abom9", self.AbominationSpawns, 232, self, "9")
		self:ScheduleEvent("abom10", self.AbominationSpawns, 252, self, "10")
		self:ScheduleEvent("abom11", self.AbominationSpawns, 268, self, "11")
		self:ScheduleEvent("abom12", self.AbominationSpawns, 285, self, "12")
		self:ScheduleEvent("abom13", self.AbominationSpawns, 300, self, "13")
		self:ScheduleEvent("abom14", self.AbominationSpawns, 318, self, "14")
		
		self:ScheduleEvent("weaver1", self.WeaverSpawns, 44, self, "1")
		self:ScheduleEvent("weaver2", self.WeaverSpawns, 68, self, "2")
		self:ScheduleEvent("weaver3", self.WeaverSpawns, 97, self, "3")
		self:ScheduleEvent("weaver4", self.WeaverSpawns, 130, self, "4")
		self:ScheduleEvent("weaver5", self.WeaverSpawns, 155, self, "5")
		self:ScheduleEvent("weaver6", self.WeaverSpawns, 170, self, "6")
		self:ScheduleEvent("weaver7", self.WeaverSpawns, 190, self, "7")
		self:ScheduleEvent("weaver8", self.WeaverSpawns, 213, self, "8")
		self:ScheduleEvent("weaver9", self.WeaverSpawns, 235, self, "9")
		self:ScheduleEvent("weaver10", self.WeaverSpawns, 256, self, "10")
		self:ScheduleEvent("weaver11", self.WeaverSpawns, 271, self, "11")
		self:ScheduleEvent("weaver12", self.WeaverSpawns, 285, self, "12")
		self:ScheduleEvent("weaver13", self.WeaverSpawns, 294, self, "13")
		self:ScheduleEvent("weaver14", self.WeaverSpawns, 300, self, "14")
	end
	
	self:ScheduleRepeatingEvent("Kelthuzad_CheckForRaidWipe", self.CheckForRaidWipe, 60, self)
end

function module:OnDisengage()
	if self.db.profile.proximity then
		self:TriggerEvent("BigWigs_HideProximity")
	end
	
	if self.db.profile.frostblastframe then
		BigWigsFrostBlast:FBClose()
	end
end

function module:MINIMAP_ZONE_CHANGED(msg)
	if GetMinimapZoneText() == bzsapphironslair and self.core:IsModuleActive(module.translatedName) then
		self:TriggerEvent("BigWigs_RebootModule", module.translatedName)
		self:ResetModule()
		DEFAULT_CHAT_FRAME:AddMessage("|cff7fff7f   [BigWigs]|r - 自动重启模块："..module.translatedName)
	
	elseif GetMinimapZoneText() == bzeasternplaguelands and self.core:IsModuleActive(module.translatedName) then
		self:TriggerEvent("BigWigs_RebootModule", module.translatedName)
		self:ResetModule()
		DEFAULT_CHAT_FRAME:AddMessage("|cff7fff7f   [BigWigs]|r - 自动重启模块："..module.translatedName)
	
	elseif GetMinimapZoneText() == bzkelthuzadchamber and not self.core:IsModuleActive(module.translatedName) then
		self.core:EnableModule(module.translatedName)
	end
end

function module:ResetModule()
	p3warn = nil
	mcYellTime = GetTime()
	frostBlastYellTime = GetTime()
	mc1 = nil
	mc2 = nil
	mc3 = nil
	mc4 = nil
	castingFrostbolt = nil
	shackleCount = 0
	shackleCounter = 0
	phase = "p1"
	numAbomDead = 0
	numWeaverDead = 0
	bloodTapCounter = 0
	
	if self.db.profile.proximity then
		self:TriggerEvent("BigWigs_HideProximity")
	end
	
	if self.db.profile.frostblastframe then
		BigWigsFrostBlast:FBClose()
	end
	
	if self.db.profile.bloodtap then
		for i=10, 1000, 10 do
			self:RemoveBar(L["bar_bloodTapA"]..i..L["bar_bloodTapB"])
		end
	end
	
	self:CancelScheduledEvent("Kelthuzad_CheckForRaidWipe")
end

function module:CheckForRaidWipe()
	local raidWiped = true
	for i=1,GetNumRaidMembers() do
		if UnitIsConnected("Raid"..i) and UnitAffectingCombat("Raid"..i) and not UnitIsDeadOrGhost("Raid"..i) then
			raidWiped = nil
			break
		end
	end

	if raidWiped == true then
		self:TriggerEvent("BigWigs_RebootModule", module.translatedName)
		self:ResetModule()
		DEFAULT_CHAT_FRAME:AddMessage("|cff7fff7f   [BigWigs]|r - 自动重启模块："..module.translatedName)
	end
end

function module:UNIT_HEALTH(msg)
	if UnitName(msg) == module.translatedName then
		local healthPct = UnitHealth(msg) * 100 / UnitHealthMax(msg)
		if healthPct > 40 and healthPct <= 45 and p3warn == nil then
			self:Sync(syncName.phase3soon)
		elseif healthPct > 45 and p3warn == true then
			p3warn = nil
		elseif healthPct <= 40 and p3warn == nil then
			p3warn = true
		end
	end
end

function module:CHAT_MSG_MONSTER_YELL(msg)
	if msg == L["trigger_engage"] then
		module:SendEngageSync()
	
	elseif msg == L["trigger_phase2_1"] or msg == L["trigger_phase2_2"] or msg == L["trigger_phase2_3"] then
		self:Sync(syncName.phase2)
	
	elseif string.find(msg, L["trigger_phase3"]) then
		self:Sync(syncName.phase3)
	
	elseif msg == L["trigger_mcYell1"] or msg == L["trigger_mcYell2"] then
		self:Sync(syncName.mcYell)
	
	elseif msg == L["trigger_frostBlastYell"] then
		self:Sync(syncName.frostBlastYell)
	end
end

function module:CHAT_MSG_COMBAT_HOSTILE_DEATH(msg)
	BigWigs:CheckForBossDeath(msg, self)
	
	if (msg == string.format(UNITDIESOTHER, bbunstoppableabomination)) then
		self:Sync(syncName.abominationDead)
	
	elseif (msg == string.format(UNITDIESOTHER, bbsoulweaver)) then
		self:Sync(syncName.soulWeaverDead)
	
	elseif (msg == string.format(UNITDIESOTHER, bbkelthuzad))then
		self:SendBossDeathSync()
	end
end

function module:CHAT_MSG_COMBAT_FRIENDLY_DEATH(msg)
	if string.find(msg, L["trigger_friendlyDead"]) then
		local _, _, deadPlayer, _ = string.find(msg, L["trigger_friendlyDead"])
		self:Sync(syncName.mcFade .. " " .. deadPlayer)
	end
end

function module:Event(msg)
	if msg == L["trigger_mcYou"] then
		self:Sync(syncName.mc .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_mcOther"]) then
		local _, _, mcPlayer, _ = string.find(msg, L["trigger_mcOther"])
		self:Sync(syncName.mc .. " " .. mcPlayer)
	
	elseif string.find(msg, L["trigger_mcFade"]) then
		local _, _, mcFadePlayer, _ = string.find(msg, L["trigger_mcFade"])
		if mcFadePlayer == L["you"] then mcFadePlayer = UnitName("Player") end
		self:Sync(syncName.mcFade .. " " .. mcFadePlayer)
		
		
	elseif msg == L["trigger_fissure"] then
		self:Sync(syncName.fissure)
	
	
	elseif msg == L["trigger_frostBlastYou"] then
		self:Sync(syncName.frostBlast .. " " .. UnitName("Player"))
	
	elseif string.find(msg, L["trigger_frostBlastOther"]) then
		local _, _, frostBlastPlayer, _ = string.find(msg, L["trigger_frostBlastOther"])
		self:Sync(syncName.frostBlast .. " " .. frostBlastPlayer)
	
	
	elseif msg == L["trigger_detonateYou"] then
		self:Sync(syncName.detonate .. " " .. UnitName("Player"))
		
	elseif string.find(msg, L["trigger_detonateOther"]) then
		local _,_, detonatePlayer, _ = string.find( msg, L["trigger_detonateOther"])
		self:Sync(syncName.detonate .. " ".. detonatePlayer)
	
	elseif string.find(msg, L["trigger_detonateFade"]) then
		local _,_, detonateFadePlayer, _ = string.find( msg, L["trigger_detonateFade"])
		if detonateFadePlayer == L["you"] then detonateFadePlayer = UnitName("Player") end
		self:Sync(syncName.detonateFade .. " ".. detonateFadePlayer)
		
		
	elseif msg == L["trigger_frostbolt"] then
		self:Sync(syncName.frostbolt)
	
		--this may be required if mage counterspell doesn't have an event in combat log, to be confirmed
		--could also be required if lag makes a swing event appear after the cast started, to be confirmed
	elseif castingFrostbolt == true and (string.find(msg, L["trigger_attack1"]) or string.find(msg, L["trigger_attack2"]) or string.find(msg, L["trigger_attack3"]) or string.find(msg, L["trigger_attack4"])
		or string.find(msg, L["trigger_kick1"]) or string.find(msg, L["trigger_kick2"]) or string.find(msg, L["trigger_kick3"]) -- kicked
		or string.find(msg, L["trigger_pummel1"]) or string.find(msg, L["trigger_pummel2"]) or string.find(msg, L["trigger_pummel3"]) -- pummeled
		or string.find(msg, L["trigger_shieldBash1"]) or string.find(msg, L["trigger_shieldBash2"]) or string.find(msg, L["trigger_shieldBash3"]) -- shield bashed
		or string.find(msg, L["trigger_earthShock1"]) or string.find(msg, L["trigger_earthShock2"])) then -- earth shocked
		self:Sync(syncName.frostboltOver)
	
	
		-- only warn if there are more than 4 players hit by frostbolt volley within 4s
	elseif string.find(msg, L["trigger_volley"]) then
		local now = GetTime()
		if now - timeLastVolley > 4 then
			timeLastVolley = now
			numVolleyHits = 1
		else
			numVolleyHits = numVolleyHits + 1
		end

		if numVolleyHits == 4 then
			self:Sync(syncName.volley)
		end
		
		
	elseif string.find(msg, L["trigger_shackle"]) then
		shackleCount = shackleCount + 1
		self:Sync(syncName.shackle .. " " .. shackleCount)
	elseif string.find(msg, L["trigger_shackleFade"]) then
		shackleCount = shackleCount - 1
		self:Sync(syncName.shackle .. " " .. shackleCount)
		
		
	elseif string.find(msg, L["trigger_bloodTap"]) then
		local _,_, bloodTapCount, _ = string.find( msg, L["trigger_bloodTap"])
		self:Sync(syncName.bloodTap .. " " .. bloodTapCount)
	end
end


function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.phase2 then
		self:Phase2()
	elseif sync == syncName.phase3soon then
		self:Phase3soon()
	elseif sync == syncName.phase3 then
		self:Phase3()
	
	elseif sync == syncName.mcYell and self.db.profile.mc then
		self:McYell()
	elseif sync == syncName.mc and rest and self.db.profile.mc then
		self:Mc(rest)
	elseif sync == syncName.mcFade and rest and self.db.profile.mc then
		self:McFade(rest)
	
	elseif sync == syncName.frostBlastYell and self.db.profile.frostblast then
		self:FrostBlastYell()
	elseif sync == syncName.frostBlast and rest and self.db.profile.frostblast then
		self:FrostBlast(rest)
		
	elseif sync == syncName.detonate and rest then
		self:Detonate(rest)
	elseif sync == syncName.detonateFade and rest then
		self:DetonateFade(rest)
	
	elseif sync == syncName.fissure and self.db.profile.fissure then
		self:Fissure()
	
	elseif sync == syncName.frostbolt and self.db.profile.frostbolt then
		self:Frostbolt()
	elseif sync == syncName.frostboltOver and self.db.profile.frostbolt then
		self:FrostboltOver()
	
	elseif sync == syncName.volley and self.db.profile.volley then
		self:Volley()
	
	elseif sync == syncName.shackle and rest and self.db.profile.shackle then
		self:Shackle(rest)
	
	elseif sync == syncName.bloodTap and rest and self.db.profile.bloodtap then
		self:BloodTap(rest)
	
	elseif sync == syncName.abominationDead and self.db.profile.p1adds then
		self:AbominationDies()
	elseif sync == syncName.soulWeaverDead and self.db.profile.p1adds then
		self:WeaverDies()
	end
end


function module:Phase2()
	phase = "p2"
	shackleCount = 0
	shackleCounter = 0
	bloodTapCounter = 0
	
	self:RemoveBar(numAbomDead..L["bar_abom"])
	self:RemoveBar(numWeaverDead..L["bar_weaver"])
	self:RemoveBar(L["bar_phase1"])
	self:CancelScheduledEvent("abom1") 
	self:CancelScheduledEvent("abom2") 
	self:CancelScheduledEvent("abom3") 
	self:CancelScheduledEvent("abom4") 
	self:CancelScheduledEvent("abom5") 
	self:CancelScheduledEvent("abom6") 
	self:CancelScheduledEvent("abom7") 
	self:CancelScheduledEvent("abom8") 
	self:CancelScheduledEvent("abom9") 
	self:CancelScheduledEvent("abom10")
	self:CancelScheduledEvent("abom11")
	self:CancelScheduledEvent("abom12")
	self:CancelScheduledEvent("abom13")
	self:CancelScheduledEvent("abom14")
	self:CancelScheduledEvent("weaver1")
	self:CancelScheduledEvent("weaver2")
	self:CancelScheduledEvent("weaver3")
	self:CancelScheduledEvent("weaver4")
	self:CancelScheduledEvent("weaver5")
	self:CancelScheduledEvent("weaver6")
	self:CancelScheduledEvent("weaver7")
	self:CancelScheduledEvent("weaver8")
	self:CancelScheduledEvent("weaver9")
	self:CancelScheduledEvent("weaver10")
	self:CancelScheduledEvent("weaver11")
	self:CancelScheduledEvent("weaver12")
	self:CancelScheduledEvent("weaver13")
	self:CancelScheduledEvent("weaver14")
	
	if self.db.profile.phase then
		self:Bar(L["bar_phase2"], timer.phase2, icon.phase, true, color.phase)
		self:Message(L["msg_phase2"], "Important", false, nil, false)
	end
	
	if self.db.profile.mc then
		self:DelayedBar(timer.phase2, L["bar_mcCd"], timer.firstMc, icon.mc, true, color.mc)
	end
	
	if self.db.profile.detonate then
		self:DelayedBar(timer.phase2, L["bar_detonateCd"], timer.firstDetonate, icon.detonate, true, color.detonate)
	end
	
	if self.db.profile.frostblast then
		self:DelayedBar(timer.phase2, L["bar_frostBlastCd"], timer.firstFrostBlast, icon.frostBlast, true, color.frostBlast)
	end

	if self.db.profile.volley then
		self:DelayedBar(timer.phase2, L["bar_volley"], timer.firstVolley, icon.volley, true, color.volley)
	end

	if self.db.profile.proximity then
		self:ScheduleEvent("KtShowProximity", self.EnableProximity, timer.phase2, self)
	end
	
	if self.db.profile.frostblastframe then
		self:ScheduleEvent("bwShowFBFrame", function() BigWigsFrostBlast:FBShow() end, timer.phase2, self)
	end
end

function module:Phase3soon()
	p3warn = true
	
	if self.db.profile.phase then
		self:Message(L["msg_phase3soon"], "Attention", false, nil, false)
	end
end

function module:Phase3()
	phase = "p3"
	p3warn = true
	shackleCount = 0
	shackleCounter = 0
	bloodTapCounter = 0
	
	if self.db.profile.shackle then		
		self:TriggerEvent("BigWigs_StartCounterBar", self, L["bar_shackle"], 5, "Interface\\Icons\\"..icon.shackle, true, color.shackle)
		self:TriggerEvent("BigWigs_SetCounterBar", self, L["bar_shackle"], (5 - 0.1))
	end
	
	if self.db.profile.phase then
		self:Message(L["msg_phase3"], "Urgent", false, nil, false)
		if UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Druid"] or UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Priest"] then
			self:Sound("Beware")
		end
	end
	
	if self.db.profile.guardian then
		self:Guardian()
	end
end

function module:AbominationSpawns(count)
	if count then
		self:Message(L["msg_abom"]..count.."/14", "Personal", false, nil, false)
	end
end

function module:WeaverSpawns(count)
	if count then
		self:Message(L["msg_weaver"]..count.."/14", "Personal", false, nil, false)
	end
end

function module:AbominationDies()
	self:RemoveBar(numAbomDead..L["bar_abom"])
	
	numAbomDead = numAbomDead + 1
	if phase == "p1" then
		self:Bar(numAbomDead..L["bar_abom"], timer.p1adds, icon.abomination, true, color.abomination)
	end
end

function module:WeaverDies()
	self:RemoveBar(numWeaverDead..L["bar_weaver"])
	
	numWeaverDead = numWeaverDead + 1
	if phase == "p1" then
		self:Bar(numWeaverDead..L["bar_weaver"], timer.p1adds, icon.soulWeaver, true, color.soulWeaver)
	end
end

function module:McYell()
	mcYellTime = GetTime()
	
	self:RemoveBar(L["bar_mcCd"])
	
	self:DelayedIntervalBar(timer.mcAfflic, L["bar_mcCd"], timer.mcCd[1], timer.mcCd[2], icon.mc, true, color.mc)
	
	if UnitClass("Player") == BC["Mage"] or UnitClass("Player") == BC["Warlock"] then
		self:Message(L["msg_mc"], "Urgent", false, nil, false)
		self:WarningSign(icon.mc, 1)
		self:Sound("Long")
	end
end	

function module:Mc(rest)
	if (GetTime() - mcYellTime) > 10 then
		self:Sync(syncName.mcYell)
	end
	
	if mc1 == nil then
		mc1 = rest
		self:Bar(rest..L["bar_mcAfflic"].. L["clickme"], timer.mcAfflic, icon.mc, true, color.mc)
		self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_mcAfflic"].. L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)
	elseif mc2 == nil then
		mc2 = rest
		self:Bar(rest..L["bar_mcAfflic"].. L["clickme"], timer.mcAfflic, icon.mc, true, color.mc)
		self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_mcAfflic"].. L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)
	elseif mc3 == nil then
		mc3 = rest
		self:Bar(rest..L["bar_mcAfflic"].. L["clickme"], timer.mcAfflic, icon.mc, true, color.mc)
		self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_mcAfflic"].. L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)
	elseif mc4 == nil then
		mc4 = rest
		self:Bar(rest..L["bar_mcAfflic"].. L["clickme"], timer.mcAfflic, icon.mc, true, color.mc)
		self:SetCandyBarOnClick("BigWigsBar "..rest..L["bar_mcAfflic"].. L["clickme"], function(name, button, extra) TargetByName(extra, true) end, rest)
	end
end

function module:McFade(rest)
	self:RemoveBar(rest..L["bar_mcAfflic"].. L["clickme"])
	
	if mc1 ~= nil and mc2 ~= nil and mc3 ~= nil and mc4 ~= nil then
		mc1 = nil
		mc2 = nil
		mc3 = nil
		mc4 = nil
	end
end

function module:Fissure()
	self:Bar(L["bar_fissure"], timer.fissure, icon.fissure, true, color.fissure)
	self:WarningSign(icon.fissure, 0.7)
	self:Message(L["msg_fissure"], "Urgent", false, nil, false)
	self:Sound("BikeHorn")
end

function module:FrostBlastYell()
	frostBlastYellTime = GetTime()
	
	self:RemoveBar(L["bar_frostBlastCd"])
	
	self:Bar(L["bar_frostBlastAfflic"], timer.frostBlastAfflic, icon.frostBlast, true, color.frostBlast)
	self:DelayedIntervalBar(timer.frostBlastAfflic, L["bar_frostBlastCd"], timer.frostBlastCd[1], timer.frostBlastCd[2], icon.frostBlast, true, color.frostBlast)
	
	if UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Paladin"] or UnitClass("Player") == BC["Priest"] or UnitClass("Player") == BC["Druid"] then
		self:Message(L["msg_frostBlast"], "Urgent", false, nil, false)
		self:WarningSign(icon.frostBlast, 1)
		self:Sound("Long")
	end
end

function module:FrostBlast(rest)
	if (GetTime() - frostBlastYellTime) > 10 then
		self:Sync(syncName.frostBlastYell)
	end
	
	BigWigsFrostBlast:AddFrostBlastTarget(rest)
end

function module:Detonate(rest)
	self:RemoveBar(L["bar_detonateCd"])
	
	if rest == UnitName("Player") then
		SendChatMessage("引爆在 "..UnitName("Player").."!","YELL")
	end
	
	if (IsRaidLeader() or IsRaidOfficer()) and self.db.profile.detonateicon then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 8)
			end
		end
	end
	
	if (UnitClass("Player") ~= BC["Warrior"] and UnitClass("Player") ~= BC["Rogue"]) and self.db.profile.detonate then
		self:Message(L["msg_detonate"]..rest, "Attention", false, nil, false)

		self:Bar(rest..L["bar_detonateAfflic"], timer.detonateAfflic, icon.detonate, true, color.detonate)
		self:DelayedIntervalBar(timer.detonateAfflic, L["bar_detonateCd"], timer.detonateCd[1], timer.detonateCd[2], icon.detonate, true, color.detonate)
	end
end

function module:DetonateFade(rest)
	self:RemoveBar(rest..L["bar_detonateAfflic"])
	
	if IsRaidLeader() or IsRaidOfficer() then
		for i=1,GetNumRaidMembers() do
			if UnitName("raid"..i) == rest then
				SetRaidTarget("raid"..i, 0)
			end
		end
	end
end

function module:Frostbolt()
	castingFrostbolt = true
	
	if UnitClass("Player") == BC["Rogue"] or UnitClass("Player") == BC["Warrior"] or UnitClass("Player") == BC["Shaman"] or UnitClass("Player") == BC["Mage"] then
		self:Bar(L["bar_frostbolt"], timer.frostbolt, icon.frostbolt, true, color.frostbolt)
		self:WarningSign(icon.frostbolt, timer.frostbolt)
		self:Message(L["msg_frostbolt"], "Personal", false, nil, false)
		self:Sound("Info")
	end
end

function module:FrostboltOver()
	castingFrostbolt = nil
	self:RemoveBar(L["bar_frostbolt"])
	self:RemoveWarningSign(icon.frostbolt)
end

function module:Volley()
	self:IntervalBar(L["bar_volley"], timer.volley[1], timer.volley[2], icon.volley, true, color.volley)
end

function module:Guardian()
	self:Bar(string.format(L["bar_guardian"],1), timer.firstGuardian, icon.guardian, true, color.guardian)
	for i = 0,3 do
		self:DelayedBar(timer.firstGuardian + timer.guardian * i, string.format(L["bar_guardian"],i+2), timer.guardian, icon.guardian, true, color.guardian)
	end
end

function module:Shackle(rest)
	if tonumber(rest) < 0 then
		rest = 0
		shackleCount = 0
	elseif tonumber(rest) > 5 then
		rest = 5
		shackleCount = 5
	end
	
	if tonumber(rest) <= 0 and (shackleCounter == (5 - 0.1)) then return end
	
	if tonumber(rest) ~= (5 - shackleCounter)  then
		if tonumber(rest) <= 0 then
			shackleCounter = (5 - 0.1)
		else
			shackleCounter = 5 - tonumber(rest)
		end
		self:TriggerEvent("BigWigs_SetCounterBar", self, L["bar_shackle"], shackleCounter)
	end
end

function module:BloodTap(rest)
	if (tonumber(rest) * 10) > bloodTapCounter then
		self:RemoveBar(L["bar_bloodTapA"]..bloodTapCounter..L["bar_bloodTapB"])
		
		bloodTapCounter = tonumber(rest) * 10
		self:Bar(L["bar_bloodTapA"]..bloodTapCounter..L["bar_bloodTapB"], timer.bloodTap, icon.bloodTap, true, color.bloodTap)
	end
end

function module:EnableProximity()
	self:TriggerEvent("BigWigs_ShowProximity")
end
