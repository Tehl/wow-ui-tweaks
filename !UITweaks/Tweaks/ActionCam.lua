local MyUI = _G.MyUI

-- disable ActionCam warning message; need to do this immediately
UIParent:UnregisterEvent("EXPERIMENTAL_CVAR_CONFIRMATION_NEEDED")

local function SetupActionCam()
	-- set camera cvars
	--SetCVar("test_cameraDynamicPitch", 0)
	--SetCVar("test_cameraOverShoulder", 0)
	
	--SetCVar("test_cameraDynamicPitch", 1)
	--SetCVar("test_cameraOverShoulder", 0.3)
	--SetCVar("test_cameraOverShoulder", 0.5)
	
	SetCVar("test_cameraDynamicPitch", 1)
	SetCVar("test_cameraDynamicPitchBaseFovPad", 0.8)
	SetCVar("test_cameraDynamicPitchBaseFovPadFlying", 0.8)
	SetCVar("test_cameraOverShoulder", 0)
end

MyUI:AddStartup(SetupActionCam)