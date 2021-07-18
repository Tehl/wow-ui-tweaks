local MyUI = _G.MyUI

local function SetupHealProfile()
	-- can't modify cvars in combat
	if InCombatLockdown() then
		return
	end
	
    local _, _, _, _, role = GetSpecializationInfo(GetSpecialization())
	if role == "HEALER"
		and (IsInGroup("player") or IsInRaid("player"))
	then
		SetCVar("nameplateShowFriends", 1)
	else
		SetCVar("nameplateShowFriends", 0)
	end
end

MyUI:AddStartup(SetupHealProfile)
MyUI:AddEvents({
    "GROUP_ROSTER_UPDATE",
    "PLAYER_SPECIALIZATION_CHANGED"
}, SetupHealProfile)