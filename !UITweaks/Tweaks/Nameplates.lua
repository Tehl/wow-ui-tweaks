local MyUI = _G.MyUI

local PERSONAL_NAMEPLATE_MIN_ZOOM = 16
local PERSONAL_NAMEPLATE_VISIBILITY_INTERVAL = 1

local function UpdateNameplateVisibility()
	-- can't modify cvars in combat
	if InCombatLockdown() then
		return
	end

	-- show personal nameplate when zoomed out
	local currentZoom = GetCameraZoom()
	local shouldBeVisible = currentZoom > PERSONAL_NAMEPLATE_MIN_ZOOM
	local isVisible = GetCVar("nameplateShowSelf") == "1"

	if isVisible and not shouldBeVisible then
		SetCVar("nameplateShowSelf", 0)
	elseif not isVisible and shouldBeVisible then
		SetCVar("nameplateShowSelf", 1)
	end
end

local function PersonalNameplateEnable()
	SetCVar("nameplateShowSelf", 1)

	-- show personal nameplate out of combat
	SetCVar("nameplatePersonalShowAlways", 1)

	-- check visibility for personal nameplate on a timer
	C_Timer.NewTicker(PERSONAL_NAMEPLATE_VISIBILITY_INTERVAL, UpdateNameplateVisibility, nil)
end

local function PersonalNameplateDisable()
	SetCVar("nameplateShowSelf", 0)
	SetCVar("nameplatePersonalShowAlways", 0)
end

local function SetupNameplates()
	-- use scale 1 for all nameplates
	SetCVar("nameplateMinScale", 1)
	SetCVar("nameplateLargerScale", 1)
	SetCVar("nameplateSelectedScale", 1.1)

	-- show nameplates for all units in range, regardless of combat state
	SetCVar("nameplateShowAll", 1)

	-- disable class colors
    SetCVar("ShowClassColorInFriendlyNameplate", 0)

	-- disable personal nameplate
	PersonalNameplateDisable()
end

MyUI:AddStartup(SetupNameplates)