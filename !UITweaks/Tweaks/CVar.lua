local CVar_System = {
    ["checkAddonVersion"] = "0",
    ["scriptErrors"] = "1",
    ["useUiScale"] = "1",
    ["uiScale"] = "0.75",
    ["movieSubtitle"] = "1",

    ["ffxAntiAliasingMode"] = "3",

    ["Sound_EnableSoundWhenGameIsInBG"] = "1",
    ["Sound_ZoneMusicNoDelay"] = "1",

    ["Sound_MasterVolume"] = "0.2",
    ["Sound_SFXVolume"] = "0.7",
}

local CVar_Character = {
    ["chatStyle"] = "classic",
    ["profanityFilter"] = "0",
    ["wholeChatWindowClickable"] = "0",
    ["chatClassColorOverride"] = "1",
    ["chatMouseScroll"] = "1",

    ["cameraSmoothStyle"] = "0",
    ["findYourselfMode"] = "1",

    ["interactOnLeftClick"] = "0",
    ["deselectOnClick"] = "1",
    
    ["stopAutoAttackOnTargetChange"] = "0",
    ["assistAttack"] = "0",
    ["ActionButtonUseKeyDown"] = "1",
    ["spellActivationOverlayOpacity"] = "0",

    ["lootUnderMouse"] = "0",
    ["alwaysShowActionBars"] = "1",
    ["showTargetOfTarget"] = "1",

    ["UberTooltips"] = "1",
    ["showQuestTrackingTooltips"] = "1",

    ["UnitNameGuildTitle"] = "0",
    ["UnitNamePlayerPVPTitle"] = "0",
    ["UnitNameInteractiveNPC"] = "0",

    ["floatingCombatTextCombatDamageDirectionalScale"] = "0",
    ["floatingCombatTextCombatHealingAbsorbSelf"] = "0",
    ["floatingCombatTextCombatHealingAbsorbTarget"] = "0",
    ["floatingCombatTextSpellMechanics"] = "1",
    ["floatingCombatTextPetMeleeDamage"] = "0",
    ["floatingCombatTextPetSpellDamage"] = "0",
    ["WorldTextScale"] = 0.8,
}

local function SetupCVars(items)
    for k, v in pairs(items) do
        SetCVar(k, v)
    end
end

local function SetupCharacterCVars()
    if InCombatLockdown() then
		return
	end
    SetupCVars(CVar_Character)
end

SLASH_MYUI_CVARSETUP1 = "/ui_setup_cvars"
function SlashCmdList.MYUI_CVARSETUP(msg)
    SetupCVars(CVar_System)
    print("CVars updated")
end

MyUI:AddStartup(SetupCharacterCVars)