if not LibStub then return end

local MSQ = LibStub("Masque", true)

if not MSQ then return end

local scale = function(contentSize, sourceTextureSize)
	return (sourceTextureSize or contentSize)/contentSize * 36
end

MSQ:AddSkin("!UI: Retina", {
	Template = "Retina",
	Title = "!UI: Retina",
	Order = 3,

	UpgradeIcon = {
		Texture = [[Interface\AddOns\!UITweaks_Masque\media\retina\Upgrade]],
		BlendMode = "BLEND",
		DrawLayer = "OVERLAY",
		DrawLevel = 2,
		Width = scale(72,128),
		Height = scale(72,128),
		Point = "CENTER",
		RelPoint = "CENTER",
		OffsetX = 0,
		OffsetY = 0,
	},
}, true)