if not LibStub then return end

local MSQ = LibStub("Masque", true)

if not MSQ then return end

MSQ:AddSkin("!UI: Diamond",{

	-- Skin data start.
	Author = "Tehl",
	Version = "80200.0",
	Masque_Version = 80200,
	Shape = "Circle",

	Normal = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\diamond\diamond]],
		Static = true,
		Color = {0.1, 0.1, 0.1, 1},
	},
	Pushed = {
		Width = 34,
		Height = 34,
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\diamond\diamond]],
		Color = {0.3, 0.3, 0.3, 1},
	},
	Checked = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\diamond\diamondChecked]],
		BlendMode = "ADD",
	},
	Highlight = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\diamond\diamondHighlight]],
		BlendMode = "ADD",
	},
	Border = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\diamond\diamondBorder]],
	},
	Gloss = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\diamond\diamondSheen]],
	},
	Mask = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\diamond\diamondMask]],
	},
	Disabled = {
		Hide = true,
	},
	Icon = {
		Width = 36,
		Height = 36,
		TexCoords = {0.07,0.93,0.07,0.93},
		UseMask = true,
	},
	Cooldown = {
		Width = 36,
		Height = 36,
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\diamond\diamondSwipe]],
	},
	Backdrop = {
		Width = 36,
		Height = 36,
		TexCoords = {0.07,0.93,0.07,0.93},
		UseMask = true,
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\backdrop]],
	},
	Name = {
		Width = 32,
		Height = 10,
		OffsetY = 4,
	},
	Count = {
		Width = 32,
		Height = 10,
		OffsetX = -1,
		OffsetY = 5,
	},
	HotKey = {
		Width = 32,
		Height = 10,
		OffsetX = 3,
		OffsetY = -4,
	},
	Duration = {
		Width = 36,
		Height = 10,
		OffsetY = -2,
	},
	AutoCast = {
		Width = 32,
		Height = 32,
		OffsetX = 0.5,
		OffsetY = -0.5
	},
	AutoCastable = {
		Width = 54,
		Height = 54,
		Texture = [[Interface\Buttons\UI-AutoCastableOverlay]],
	},
	Flash = {
		Width = 32,
		Height = 32,
		Texture = [[Interface\Buttons\UI-QuickslotRed]],
	},
	-- Skin data end.

},true)