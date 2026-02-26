local Shared = require("../../shared")

local Modules = Shared.Modules
local WeaponsDamageClient = Modules:find("WeaponsDamageClient", true)
local WeaponsToolbarClient = Modules:find("WeaponsToolbarClient", true)

local Camera = Shared.Classes.Camera
local Players = Shared.Services.Players
local LocalPlayer = Shared.Classes.LocalPlayer

local Melee = {
	Config = {
		Aura = false,
		BypassRangeCheck = false,

		CustomDamage = false,
		CustomDamageAmount = 50,

		AuraRange = 10, -- anything above 20 might get you detected, i haven't tested though
		AuraAttackDelay = 0.1,

		ShowAuraRange = false,
		ShowAuraRangeChunk = 20,
		ShowAuraRangeColor = Color3.fromRGB(255, 255, 255),

		ShowAuraTarget = false,
		ShowAuraTargetColor = Color3.fromRGB(255, 255, 255),
	},

	LastTick = 0,
	Toggled = false, -- this is just for the keybinds

	RangeLines = {},
	TargetLines = {},
}

local Segments = math.floor(360 / Melee.Config.ShowAuraRangeChunk)

for i = 1, Segments do
	local Line = Drawing.new("Line")
	Line.Visible = false
	Line.Thickness = 1.5
	Melee.RangeLines[i] = Line
end

local Old
Old = hookfunction(debug.getupvalue(WeaponsDamageClient.dealMelee, 6), LPH_NO_UPVALUES(function(a, b)
	if Melee.Config.BypassRangeCheck then
		return false
	end

	return Old(a, b)
end))

local LPH_DetectHits = LPH_NO_VIRTUALIZE(function(Player, Humanoid, Damage) -- prevents a detection becasue they only check the function name :joy: :joy: :joy:
	WeaponsDamageClient.dealMelee(Player, Humanoid, Damage)
end)

Melee.GetEnemyForMelee = function() -- skidded from parvus
	local LocalCharacter = LocalPlayer.Character

	if not LocalCharacter or not LocalCharacter.PrimaryPart then
		return
	end

	local Distance, Closest = Melee.Config.AuraRange, {}

	for Index, Player in next, Players:GetPlayers() do
		local Character = Player.Character

		if Player == LocalPlayer then
			continue
		end

		if Player.Team == LocalPlayer.Team then
			continue
		end

		if not Character then
			continue
		end

		local PrimaryPart = Character.PrimaryPart

		if not PrimaryPart then
			continue
		end

		local Humanoid = Character.Humanoid

		if not Humanoid then
			continue
		end

		if Humanoid.Health <= 0 then
			continue
		end

		local Magnitude = (PrimaryPart.Position - LocalCharacter.PrimaryPart.Position).Magnitude

		if Distance > Magnitude then
			Distance = Magnitude
			table.insert(Closest, Player)
		end
	end

	return Closest
end

Melee.Update = function()
	if not Melee.Config.Aura then
		for _, Line in next, Melee.RangeLines do
			Line.Visible = false
		end

		for _, Line in next, Melee.TargetLines do
			Line.Visible = false
		end

		return
	end

	local Tick = tick()
	local Enemies = Melee.GetEnemyForMelee()

	if Melee.Config.ShowAuraRange then
		if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
			local Points = {}

			for Angle = 0, 360, Melee.Config.ShowAuraRangeChunk do
				local Rad = math.rad(Angle)
				local Pos = LocalPlayer.Character.PrimaryPart.Position + Vector3.new(math.cos(Rad) * Melee.Config.AuraRange, 0, math.sin(Rad) * Melee.Config.AuraRange)
				local Screen = Camera:WorldToViewportPoint(Pos)

				if Screen.Z > 0 then
					Points[#Points + 1] = Vector2.new(Screen.X, Screen.Y)
				end
			end

			for i = 1, Segments do
				local A = Points[i]
				local B = Points[i + 1] or Points[1]
				local Line = Melee.RangeLines[i]

				if A and B then
					Line.Visible = true
					Line.Color = Melee.Config.ShowAuraRangeColor
					Line.From = A
					Line.To = B
				else
					Line.Visible = false
				end
			end
		else
			for _, Line in next, Melee.RangeLines do
				Line.Visible = false
			end
		end
	else
		for _, Line in next, Melee.RangeLines do
			Line.Visible = false
		end
	end

	if Melee.Config.ShowAuraTarget then
		for _, Line in next, Melee.TargetLines do
			Line.Visible = false
		end

		for _, Player in next, Enemies do
			local To, OnScreen = Camera:WorldToViewportPoint(Player.Character.PrimaryPart.Position) 
			local To2, OnScreen2 = Camera:WorldToViewportPoint(LocalPlayer.Character.PrimaryPart.Position)

			if OnScreen and OnScreen2 then
				Melee.TargetLines[Player].Visible = true
				Melee.TargetLines[Player].From = Vector2.new(To2.X, To2.Y)
				Melee.TargetLines[Player].To = Vector2.new(To.X, To.Y)
			else
				Melee.TargetLines[Player].Visible = false
			end
		end
	else
		for _, Line in next, Melee.TargetLines do
			Line.Visible = false
		end
	end

	if Melee.Toggled then
		if Tick - Melee.LastTick >= Melee.Config.AuraAttackDelay then
			if #Enemies > 0 then
				for _, Player in next, Enemies do
					local Client = WeaponsToolbarClient.getEquippedWeaponClient()

					if Client and Client.meleeAction then
						LPH_DetectHits(Player, Player.Character.Humanoid, Melee.Config.CustomDamage and Melee.Config.CustomDamageAmount or Client:GetDamage())
					end
				end
			end

			Melee.LastTick = Tick
		end
	end
end

Melee.CreateLine = function(Player)
	local Line = Drawing.new("Line")
	Line.Visible = false
	Line.Thickness = 1.5

	Melee.TargetLines[Player] = Line
end

return Melee