local Bartender4 = _G.Bartender4
local Masque = LibStub("Masque", true)

local math_floor = math.floor
local math_ceil = math.ceil

local splits = {
	["3"] = {
		{
			index = 4,
			size = 536
		},
		{
			index = 10,
			size = 536
		}
	},
	["1"] = {
		{
			index = 6,
			size = 18
	}
	},
	["6"] = {
		{
			index = 6,
			size = 18
		}
	}
}

local function GetWidthWithSplit(bar, pad, hpad, numbuttons, ButtonPerRow)
	local defaultWidth = (bar.button_width + hpad) * ButtonPerRow - pad + 10

	local barSplits = splits[bar.id]
	if not barSplits then
		return defaultWidth
	end

	local maxWidth = 0
	local rowWidth = defaultWidth
	local i = 0

	while i <= numbuttons do
		if barSplits[i + 1] then
			rowWidth = rowWidth + barSplits[i + 1].size
		end
		if i % ButtonPerRow == 0 then
			maxWidth = math.max(maxWidth, rowWidth)
			rowWidth = defaultWidth
		end
		i = i + 1
	end

	maxWidth = math.max(maxWidth, rowWidth)

	return maxWidth
end

local function GetPadWithSplit(bar, hpad, index)
	if splits[bar.id] then
		for i, v in ipairs(splits[bar.id]) do
			if index == v.index then
				return hpad + v.size
			end
		end
    end
    return hpad
end

Bartender4.ButtonBar.prototype.UpdateButtonLayout = function (self)
	local buttons = self.buttons
	local pad = self:GetPadding()

	local numbuttons = self.numbuttons or #buttons

	-- bail out if the bar has no buttons, for whatever reason
	-- (eg. stanceless class, or no stances learned yet, etc.)
	if numbuttons == 0 then return end

	local Rows = self:GetRows()
	local ButtonPerRow = math_ceil(numbuttons / Rows) -- just a precaution
	Rows = math_ceil(numbuttons / ButtonPerRow)
	if Rows > numbuttons then
		Rows = numbuttons
		ButtonPerRow = 1
	end

	local hpad = pad + (self.hpad_offset or 0)
	local vpad = pad + (self.vpad_offset or 0)

	self:SetSize(
        GetWidthWithSplit(self, pad, hpad, numbuttons, ButtonPerRow),
        (self.button_height + vpad) * Rows - pad + 10
    )

	local h1, h2, v1, v2
	local xOff, yOff
	if self.config.position.growHorizontal == "RIGHT" then
		h1, h2 = "LEFT", "RIGHT"
		xOff = 5
	else
		h1, h2 = "RIGHT", "LEFT"
		xOff = -3

		hpad = -hpad
	end

	if self.config.position.growVertical == "DOWN" then
		v1, v2 = "TOP", "BOTTOM"
		yOff = -3
	else
		v1, v2 = "BOTTOM", "TOP"
		yOff = 5

		vpad = -vpad
	end

	-- anchor button 1
	local anchor = self:GetAnchor()
	buttons[1]:ClearSetPoint(anchor, self, anchor, xOff - (self.hpad_offset or 0), yOff - (self.vpad_offset or 0))

	-- and anchor all other buttons relative to our button 1
	for i = 2, numbuttons do
		-- jump into a new row
		if ((i-1) % ButtonPerRow) == 0 then
			buttons[i]:ClearSetPoint(v1 .. h1, buttons[i-ButtonPerRow], v2 .. h1, 0, -vpad)
		-- align to the previous button
		else
			buttons[i]:ClearSetPoint("TOP" .. h1, buttons[i-1], "TOP" .. h2, GetPadWithSplit(self, hpad, i), 0)
		end
	end

	if not Masque then
		for i = 1, #buttons do
			local button = buttons[i]
			if button.icon and self.config.skin.Zoom then
				button.icon:SetTexCoord(0.07,0.93,0.07,0.93)
			elseif button.icon then
				button.icon:SetTexCoord(0,1,0,1)
			end
		end
	end
end
