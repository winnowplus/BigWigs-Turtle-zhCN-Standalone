
local module, L = BigWigs:ModuleDeclaration("Gargoyle", "Naxxramas")
local bbStoneskinGargoyle = AceLibrary("Babble-Boss-2.2")["Stoneskin Gargoyle"]
local bbPlaguedGargoyle = AceLibrary("Babble-Boss-2.2")["Plagued Gargoyle"]

module.revision = 20004
module.enabletrigger = { bbStoneskinGargoyle, bbPlaguedGargoyle }

L:RegisterTranslations("enUS", function() return {
    cmd = "Stoneskin",

    stoneskin_cmd = "stoneskin",
    stoneskin_name = "石肤术警报",
    stoneskin_desc = "石肤术出现时进行警告",

    stoneskintrigger = "%s emits a strange noise.",
    stoneskinwarn = "正在施放石肤术！",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Defender",

	stoneskin_cmd = "stoneskin",
	stoneskin_name = "Stoneskin Alert",
	stoneskin_desc = "Warn for Stoneskin",

	stoneskintrigger = "Stoneskin Gargoyle emits a strange noise.",
	stoneskinwarn = "Casting Stoneskin!",
} end )

L:RegisterTranslations("deDE", function() return {
	stoneskin_cmd = "stoneskin",
	stoneskin_name = "Stoneskin Alert",
	stoneskin_desc = "Warn for Stoneskin",

	stoneskintrigger = "Stoneskin Gargoyle emits a strange noise.",
	stoneskinwarn = "Casting Stoneskin!",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Stoneskin",

    stoneskin_cmd = "stoneskin",
    stoneskin_name = "石肤术警报",
    stoneskin_desc = "石肤术出现时进行警告",

    stoneskintrigger = "%s发出奇怪的声音。",
    stoneskinwarn = "正在施放石肤术！",
} end )

module.defaultDB = {
	bosskill = nil,
}

local timer = {
	stoneskin = 6,
}
local icon = {
	stoneskin = "spell_nature_enchantarmor",
}
local syncName = {
	stoneskin = "StoneskinGargoyleStoneskin"..module.revision,
}

function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_MONSTER_EMOTE", "checkStoneskin")

	self:ThrottleSync(6, syncName.stoneskin)
end

function module:OnSetup()
end

function module:OnEngage()
end

function module:OnDisengage()
end

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.stoneskin then
		self:Message(L["stoneskinwarn"], "Important", nil, "Beware")
		self:Bar(L["stoneskinwarn"], timer.stoneskin, icon.stoneskin)
	end
end

function module:checkStoneskin(msg)
	if msg == L["stoneskintrigger"] then
		self:Sync(syncName.stoneskin)
	end
end
