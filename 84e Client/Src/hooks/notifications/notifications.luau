local Shared = require("../../shared")
local _Network = require("../network/network")

local GuiSounds = Shared.Modules:find("GuiSounds", true)
local CombatKillfeedClient = Shared.Modules:find("CombatKillfeedClient", true)

local Notifications = {
	Config = {},
}

CombatKillfeedClient.playHitmarkSound = function()
	GuiSounds.play(
		"Hitmark",
		GuiSounds.CustomSound and 1 or 0.9,
		GuiSounds.CustomSound and GuiSounds.CustomVolume or nil
	)
end

Notifications.playHitmarkSound = CombatKillfeedClient.playHitmarkSound

return Notifications