local MyUI = _G.MyUI

local ZOOM_LEVEL_CLOSE = 7.0
local ZOOM_LEVEL_DEFAULT = 9.1
local ZOOM_LEVEL_FAR = 10.5
local ZOOM_TRANSITION_TIME = 0.5

local function SetZoomLevel(targetZoom)
    local LibCamera = LibStub("LibCamera-1.0")
    local LibEasing = LibStub("LibEasing-1.0")

    LibCamera:SetZoom(targetZoom, ZOOM_TRANSITION_TIME, LibEasing.InOutQuad)
end

local function InitZoom()
    SetZoomLevel(ZOOM_LEVEL_DEFAULT)
end

SLASH_MYUI_ZOOMINFO1 = "/zoominfo"
function SlashCmdList.MYUI_ZOOMINFO(msg)
    print('Current zoom is ' .. GetCameraZoom())
end

SLASH_MYUI_ZOOMSET1 = "/zoomset"
function SlashCmdList.MYUI_ZOOMSET(msg)
    local targetZoom = ZOOM_LEVEL_DEFAULT
    if (msg == 'close') then
        targetZoom = ZOOM_LEVEL_CLOSE
    elseif (msg == 'far') then
        targetZoom = ZOOM_LEVEL_FAR
    end

    SetZoomLevel(targetZoom)
end

MyUI:AddStartup(InitZoom)