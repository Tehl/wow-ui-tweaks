local MyUI = _G.MyUI

local function SetupParrot()
    ParrotFrame:SetFrameStrata("LOW")
end

MyUI:AddStartup(SetupParrot)