local MyUI = _G.MyUI

local FONT_SIZE_TITLE = 18
local FONT_SIZE_NORMAL = 14
local FONT_SIZE_SMALL = 13

local function SetupFonts()
    QuestTitleFont:SetFont(QuestTitleFont:GetFont(), FONT_SIZE_TITLE, nil)
    QuestFont:SetFont(QuestFont:GetFont(), FONT_SIZE_NORMAL, nil)
    QuestFontNormalSmall:SetFont(QuestFontNormalSmall:GetFont(), FONT_SIZE_SMALL, nil)
end

MyUI:AddStartup(SetupFonts)
