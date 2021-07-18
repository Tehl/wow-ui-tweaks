local LSM = LibStub("LibSharedMedia-3.0");

local MediaType_BACKGROUND = LSM.MediaType.BACKGROUND
local MediaType_BORDER = LSM.MediaType.BORDER
local MediaType_FONT = LSM.MediaType.FONT
local MediaType_STATUSBAR = LSM.MediaType.STATUSBAR

LSM:Register(MediaType_BORDER   , "!UI: Pixel",             [[Interface\Addons\!UITweaks\Media\border\pixel]]      )

LSM:Register(MediaType_STATUSBAR, "!UI: Flat",              [[Interface\Addons\!UITweaks\Media\statusbar\flat]]    )
LSM:Register(MediaType_STATUSBAR, "!UI: Diamond",           [[Interface\Addons\!UITweaks\Media\statusbar\diamond]] )