local function SetRaidMarker(iconId)
    local iconTarget
    if UnitExists("mouseover") and not UnitIsDead("mouseover") then
        iconTarget = "mouseover"
    elseif UnitExists("target") then
        iconTarget = "target"
    end

    if not iconTarget then
        return 
    end

    local currentIcon = GetRaidTargetIndex(iconTarget)
    if not currentIcon or currentIcon ~= iconId then
        SetRaidTarget(iconTarget, iconId)
    end
end

_G.MyUI_SetRaidMarker = SetRaidMarker