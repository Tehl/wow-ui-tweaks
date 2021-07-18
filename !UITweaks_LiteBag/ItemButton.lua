if LibStub then
    local Masque = LibStub("Masque", true)

    if Masque then
        local group = Masque:Group("LiteBag")

        LiteBag_RegisterHook(
            "LiteBagItemButton_Create",
            function(b)
                group:AddButton(b)
                _G[b:GetName() .. "BackgroundTexture"]:Hide()
            end
        )
    end
end
