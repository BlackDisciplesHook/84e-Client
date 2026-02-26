local Shared = require("../../shared")
local Network = require("../../hooks/network/network")

local FlagRig = Shared.Modules:find("FlagRig", true)

local Flag = {
    Config = {
        InstantCapture = false
    }
}

LPH_NO_VIRTUALIZE(function()
    local OldPromptTriggered
    OldPromptTriggered = hookfunction(FlagRig.PromptTriggered, function(flagAction)
        if Flag.Config.InstantCapture then
            flagAction.promptBeganTime = nil
            Network:FireEvent("EquipFlag", flagAction.flagModel)
            return
        end

        return OldPromptTriggered(flagAction)
    end)

    local OldPromptBegan
    OldPromptBegan = hookfunction(FlagRig.PromptBegan, function(flagAction)
        if Flag.Config.InstantCapture then
            flagAction:PromptTriggered(flagAction)
            return
        end

        return OldPromptBegan(flagAction)
    end)
end)()

return Flag