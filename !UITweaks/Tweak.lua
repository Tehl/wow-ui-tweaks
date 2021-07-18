local MyUI = {}

function MyUI:Initialise()
	self.frame = CreateFrame("Frame")
	self.frame:SetScript("OnEvent", function (_, ...)
		self:HandleEvent(...)
	end)
	self.events = {}
end

function MyUI:AddEvent(event, handler)
    if not self.events[event] then
        self.events[event] = {}
        self.frame:RegisterEvent(event)
    end
    table.insert(self.events[event], handler)
end

function MyUI:AddStartup(handler)
    self:AddEvent("PLAYER_LOGIN", handler)
end

function MyUI:AddEvents(events, handler)
    for _, event in ipairs(events) do
        self:AddEvent(event, handler)
    end
end

function MyUI:HandleEvent(event)
    if self.events[event] then
        for _, handler in ipairs(self.events[event]) do
            handler(event)
        end
    end
end

MyUI:Initialise()

_G.MyUI = MyUI