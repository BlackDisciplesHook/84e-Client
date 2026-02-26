local Modules = getloadedmodules()

LPH_NO_VIRTUALIZE(function()
	local RenamedModules = {
		"WeaponsClient",
		"WeaponsProjectilesClient",
		"WeaponsCannonClient",
		"WeaponsTargetsClient",
		"WeaponsToolbarClient",
		"WeaponsSoundsClient",
		"WeaponsCharacterClient",
		"WeaponsFlagClient",
		"WeaponsDamageClient",
		"WeaponsEffectsClient",
		"WeaponsToolbarClientOLD",
		"CombatClient",
		"CombatMouseClient",
		"CombatScreenEffectsClient",
		"CombatTiltsClient",
		"CombatScreenFlashClient",
		"CombatKillfeedClient",
		"CombatCompassGuiClient",
		"CombatFovClient",
		"CombatMoraleClient",
		"CombatStatesClient",
		"CombatMeleeClient",
		"CombatCharacterClient",
		"CombatGuisClient",
		"CombatMovementClient",
		"UtilityIncidentsClient",
		"UtilityReportsClient",
		"AfterAllScatterClient",
		"MeleeActionClient",
		"Trick2",
	}

	local NameToIndex = (function() -- yes they also reveal this info to us, so thanks for making my life easier!
		local t = {}

		for i, n in next, RenamedModules do
			t[n] = i
		end

		return t
	end)()

	function Modules:DecryptModuleName(ModuleName, OriginalName) -- nw has a really retarded way to obfuscate their module names and then keep that module unobfuscated...
		local index = NameToIndex[OriginalName]

		if not index or type(ModuleName) ~= "string" or not ModuleName:match("^%d+$") then
			return false
		end

		for key = 10, 99 do -- formula is basically just a = random number between 10-99 a (not really meant to be add as a result but more just add as at the start because they use string.format) + index + a
			if ModuleName == tostring(key) .. tostring(index + key) then
				return true
			end
		end

		return false
	end

	function Modules:find(name, required)
		for _, module in next, self do
			if typeof(module) == "Instance" then
				if module.Name == name or module.ClassName == name then
					return required and require(module) or module
				end

				if self:DecryptModuleName(module.Name, name) then
					return required and require(module) or module
				end
			end
		end

		warn("no module of the name '" .. name .. "' found")

		return nil
	end
end)()

return Modules
