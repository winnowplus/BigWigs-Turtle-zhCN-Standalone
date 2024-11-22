local frBuffTooltip = CreateFrame( "GameTooltip", "frBuffTooltip", nil, "GameTooltipTemplate" );
frBuffTooltip:Hide()
frBuffTooltip:SetFrameStrata("TOOLTIP")
frBuffTooltip:SetOwner(WorldFrame, "ANCHOR_NONE")

------------------------------
--      Are you local?      --
------------------------------
local L = AceLibrary("AceLocale-2.2"):new("BigWigsFRBuffMacro")

----------------------------
--      Localization      --
----------------------------

L:RegisterTranslations("enUS", function() return {
	["Resist Fire"] = "Resist Fire",
	["phase shift"] = "phase shift",

} end)

L:RegisterTranslations("zhCN", function() return {
	-- Sunelegy，Wind汉化修复Turtle-WOW中文数据
	-- Last update: 2024-06-22
	["Resist Fire"] = "抵抗火焰",
	["phase shift"] = "相位变换",

} end)

local function FR_FindBuff(obuff, unit)
	local buff=strlower(obuff);
	local tooltip=frBuffTooltip;
	local textleft1=getglobal(tooltip:GetName().."TextLeft1");
	if ( not unit ) then
		unit ='player';
	end

	for i=1, 16 do
		tooltip:SetOwner(UIParent, "ANCHOR_NONE");
		tooltip:SetUnitBuff(unit, i);
		b = textleft1:GetText();
		tooltip:Hide();
		if ( b and strfind(strlower(b), buff) ) then
			return "buff", i, b;
		elseif ( b==nil ) then
			break;
		end
	end
	tooltip:Hide();
end

local function BuffFireResist()
	for i=1, GetNumRaidMembers() do
		if UnitExists("raidpet"..i) then
			if not FR_FindBuff(L["Resist Fire"],"raidpet"..i) and not FR_FindBuff(L["phase shift"],"raidpet"..i) then
				if CheckInteractDistance("raidpet"..i, 4) then
					TargetUnit("raidpet"..i)
					CastPetAction(3)
					return
				end
			end
		end
	end

	for i=1, GetNumRaidMembers() do
		if not FR_FindBuff(L["Resist Fire"], "raid"..i) then
			if CheckInteractDistance("raid"..i, 4) then
				TargetUnit("raid"..i)
				CastPetAction(3)
				return
			end
		end
	end
end

SLASH_FRBUFF1 = "/frbuff"
SlashCmdList["FRBUFF"] = BuffFireResist
