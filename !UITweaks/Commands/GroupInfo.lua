local function GetSubGroup(unitName)
    for i = 1, GetNumGroupMembers() do
        local name, _, subgroup = GetRaidRosterInfo(i)
        if name == unitName then
            return subgroup
        end
    end
end

SLASH_MYUI_GROUPINFO1 = "/groupinfo"
function SlashCmdList.MYUI_GROUPINFO(msg)
    if not UnitInRaid("player") then
        print("You are not in a raid")
        return
    end

    local playerName = UnitName("player")

    local subgroup = GetSubGroup(playerName)
    if subgroup then
        print(playerName .. " is in group " .. subgroup)
    else
        print(playerName .. " is not in the current raid group")
    end
end
