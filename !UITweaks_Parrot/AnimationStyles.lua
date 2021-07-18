local Parrot = _G.Parrot
local L = LibStub("AceLocale-3.0"):GetLocale("Parrot")

Parrot:RegisterAnimationStyle {
	-- shallower version of the default x = y^2 - 1 parabola
	name = "!UI:Parabola",
	localName = L["!UI: Parabola"],
	func = function(frame, xOffset, yOffset, size, percent, direction, num, max, uid)
		local vert, horiz = (";"):split(direction)
		if vert == "DOWN" then
			percent = 1 - percent
		end
		local xDiff = (1 - 4*(percent * 0.75 - 0.5)^2) * size * 1/5
		local point = "LEFT"
		if horiz == "LEFT" or (horiz == "ALT" and uid%2 == 0) then
			xDiff = -xDiff
			point = "RIGHT"
		end
		local y = yOffset + (percent - 0.5) * size
		local x = xOffset + xDiff
		frame:SetPoint(point, UIParent, "CENTER", x, y)
	end,
	defaultDirection = "DOWN;ALT",
	directions = {
		["UP;LEFT"] = L["Up, left"],
		["UP;RIGHT"] = L["Up, right"],
		["UP;ALT"] = L["Up, alternating"],
		["DOWN;LEFT"] = L["Down, left"],
		["DOWN;RIGHT"] = L["Down, right"],
		["DOWN;ALT"] = L["Down, alternating"],
	},
	overlap = true,
}