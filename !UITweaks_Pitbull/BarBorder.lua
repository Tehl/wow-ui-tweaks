
local PitBull4 = _G.PitBull4
local L = PitBull4.L

local PitBull4_BarBorder = PitBull4:NewModule("BarBorder", "AceEvent-3.0", "AceHook-3.0")

PitBull4_BarBorder:SetModuleType("custom")
PitBull4_BarBorder:SetName(L["Bar Border"])
PitBull4_BarBorder:SetDescription(L["Adds a border to status bars."])
PitBull4_BarBorder:SetDefaults({})

local PitBull4_HealthBar
local PitBull4_PowerBar

local function set_hooks()
	if not PitBull4_HealthBar then
		PitBull4_HealthBar = PitBull4:GetModule("HealthBar", true)
		if PitBull4_HealthBar then
			PitBull4_BarBorder:RawHook(PitBull4_HealthBar, "UpdateFrame", "StatusBar_UpdateFrame")
		end
	end

	if not PitBull4_PowerBar then
		PitBull4_PowerBar = PitBull4:GetModule("PowerBar", true)
		if PitBull4_PowerBar then
			PitBull4_BarBorder:RawHook(PitBull4_PowerBar, "UpdateFrame", "StatusBar_UpdateFrame")
		end
	end
end

function PitBull4_BarBorder:OnModuleLoaded(module)
	if not self.db.profile.global.enabled then return end
	local id = module.id
	if id == "HealthBar" or id == "Border" or id == "Background" then
		set_hooks()
	end
end

function PitBull4_BarBorder:StatusBar_UpdateFrame(module, frame)
    local result = self.hooks[module].UpdateFrame(module, frame)
    
    local id = module.id
    local control = frame[id]
    
	if control then
		if control._hasBackdrop ~= true then
			Mixin(control, BackdropTemplateMixin)
			control._hasBackdrop = true
		end

		local edgeSize = 8
		if select(2, control:GetSize()) < 8 then
			edgeSize = 6
		end

		control:SetBackdrop({
			edgeFile = [[Interface\Addons\!UITweaks\Media\border\pixel]], 
			tile = false, tileSize = 0, edgeSize = edgeSize, 
			insets = { left = 1, right = 1, top = 1, bottom = 1 }
		});
		control:SetBackdropColor(0,0,0,1);
    end

    return result
end