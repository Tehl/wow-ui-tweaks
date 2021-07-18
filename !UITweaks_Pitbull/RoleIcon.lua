
local PitBull4 = _G.PitBull4
local L = PitBull4.L

local PitBull4_RoleIcon = PitBull4:NewModule("!UI_RoleIcon", "AceEvent-3.0")

PitBull4_RoleIcon:SetModuleType("indicator")
PitBull4_RoleIcon:SetName(L["!UI: Role icon"])
PitBull4_RoleIcon:SetDescription(L["Show an icon on the unit frame based on which Role it is."])
PitBull4_RoleIcon:SetDefaults({
	attach_to = "root",
	location = "edge_top_left",
	position = 1,
})

function PitBull4_RoleIcon:OnEnable()
	self:RegisterEvent("PLAYER_ROLES_ASSIGNED")
end

local TEXTURES = {
	TANK = [[Interface\Addons\!UITweaks_Pitbull\media\Tank.tga]],
	HEALER = [[Interface\Addons\!UITweaks_Pitbull\media\Healer.tga]],
	DAMAGER = [[Interface\Addons\!UITweaks_Pitbull\media\DPS.tga]]
}

TEXTURES[1] = TEXTURES.TANK
TEXTURES[2] = TEXTURES.HEALER
TEXTURES[3] = TEXTURES.DAMAGER

function PitBull4_RoleIcon:GetTexture(frame)
	local role = UnitGroupRolesAssigned(frame.unit)
	return TEXTURES[role] or nil
end

function PitBull4_RoleIcon:GetExampleTexture(frame)
	local role = UnitGroupRolesAssigned(frame.unit)
	return TEXTURES[role] or TEXTURES[math.random(1, 3)]
end

function PitBull4_RoleIcon:GetTexCoord(frame)
	return nil
end

function PitBull4_RoleIcon:GetExampleTexCoord(frame)
	return nil
end

function PitBull4_RoleIcon:PLAYER_ROLES_ASSIGNED()
	self:UpdateAll()
end
