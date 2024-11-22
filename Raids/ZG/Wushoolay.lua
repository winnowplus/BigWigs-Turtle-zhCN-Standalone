
----------------------------------
--      Module Declaration      --
----------------------------------

local module, L = BigWigs:ModuleDeclaration("Wushoolay", "Zul'Gurub")


----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	cmd = "Wushoolay",

	chainlightning_trigger = "Wushoolay begins to cast Chain Lightning\.",
    chainlightning_bar = "闪电链",
    chainlightning_message = "闪电链！打断它！",
	lightningcloud_trigger = "You are afflicted by Lightning Cloud\.",
    lightningcloud_message = "离开闪电云！",

	chainlightning_cmd = "chainlightning",
    chainlightning_name = "闪电链警报",
    chainlightning_desc = "当Boss施放闪电链时进行警告",

	lightningcloud_cmd = "lightningcloud",
    lightningcloud_name = "闪电云警告",
    lightningcloud_desc = "当你站在闪电云中时进行警告",
} end )

L:RegisterTranslations("deDE", function() return {
	cmd = "Wushoolay",

	chainlightning_trigger = "Wushoolay beginnt Kettenblitzschlag zu wirken\.",
	chainlightning_bar = "Kettenblitzschlag",
	chainlightning_message = "Kettenblitzschlag! Unterbreche sie!",
	lightningcloud_trigger = "Ihr seid von Blitzschlagwolke betroffen\.",
	lightningcloud_message = "Beweg dich aus der Blitzschlagwolke!",

	chainlightning_cmd = "chainlightning",
	chainlightning_name = "Alarm f\195\188r Kettenblitzschlag",
	chainlightning_desc = "Warnen wenn Wushoolay beginnt Kettenblitzschlag zu wirken.",

	lightningcloud_cmd = "lightningcloud",
	lightningcloud_name = "Alarm f\195\188r Blitzschlagwolke",
	lightningcloud_desc = "Warnt dich wenn du in Blitzschlagwolke stehst.",
} end )

L:RegisterTranslations("esES", function() return {
	--cmd = "Wushoolay",

	chainlightning_trigger = "Wushoolay comienza a lanzar Cadena de relámpagos\.",
	chainlightning_bar = "Cadena de relámpagos",
	chainlightning_message = "¡Cadena de relámpagos! Interrúmpela!",
	lightningcloud_trigger = "Estás afligido por Nube de relámpagos\.",
	lightningcloud_message = "¡Muévate del Nube de relámpagos!",

	--chainlightning_cmd = "chainlightning",
	chainlightning_name = "Alerta de Cadena de relámpagos",
	chainlightning_desc = "Avisa cuando lance Cadena de relámpagos el jefe.",

	--lightningcloud_cmd = "lightningcloud",
	lightningcloud_name = "Alerta de Nube de relámpagos",
	lightningcloud_desc = "Avisa cuando estás en el Nube de relámpagos.",
} end )

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
    cmd = "Wushoolay",

	chainlightning_trigger = "Wushoolay begins to cast Chain Lightning\.",
    chainlightning_bar = "闪电链",
    chainlightning_message = "闪电链！打断它！",
	lightningcloud_trigger = "You are afflicted by Lightning Cloud\.",
    lightningcloud_message = "离开闪电云！",

	chainlightning_cmd = "chainlightning",
    chainlightning_name = "闪电链警报",
    chainlightning_desc = "当Boss施放闪电链时进行警告",

	lightningcloud_cmd = "lightningcloud",
    lightningcloud_name = "闪电云警告",
    lightningcloud_desc = "当你站在闪电云中时进行警告",
} end )
---------------------------------
--      	Variables 		   --
---------------------------------

-- module variables
module.revision = 20004 -- To be overridden by the module!
module.enabletrigger = module.translatedName -- string or table {boss, add1, add2}
module.toggleoptions = {"chainlightning", "lightningcloud", "bosskill"}


-- locals
local timer = {
	chainlightning = 1.5,
}
local icon = {
	chainlightning = "Spell_Nature_ChainLightning",
}
local syncName = {
	chainlightning = "WushoolayChainLightning"..module.revision,
}

------------------------------
--      Initialization      --
------------------------------

-- called after module is enabled
function module:OnEnable()
	self:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE", "Event")
	self:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE", "Event")

	self:ThrottleSync(3, syncName.chainlightning)
end

------------------------------
--      Events              --
------------------------------

function module:Event(msg)
	if msg == L["lightningcloud_trigger"] and self.db.profile.lightningcloud then
		self:Message(L["lightningcloud_message"], "Attention", "Alarm")
	elseif msg == L["chainlightning_trigger"] then
		self:Sync(syncName.chainlightning)
	end
end

------------------------------
--      Synchronization	    --
------------------------------

function module:BigWigs_RecvSync(sync, rest, nick)
	if sync == syncName.chainlightning and self.db.profile.chainlightning then
		self:Message(L["chainlightning_message"], "Important")
		self:Bar(L["chainlightning_bar"], timer.chainlightning, icon.chainlightning)
	end
end
