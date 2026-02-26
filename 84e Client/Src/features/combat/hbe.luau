local Shared = require("../../shared")

local Players = Shared.Services.Players
local LocalPlayer = Shared.Classes.LocalPlayer

local Modules = Shared.Modules
local WeaponsDamageClient = Modules:find("WeaponsDamageClient", true)
local CombatTouchTestClient = Modules:find("CombatTouchTestClient", true)

local RunTouchTest = LPH_JIT_MAX(function()
	local upvalue = debug.getupvalue(CombatTouchTestClient.start, 3)

	if typeof(upvalue) ~= "function" then
		return nil
	end

	return upvalue
end)()

if RunTouchTest then
	hookfunction(
		RunTouchTest,
		LPH_NO_UPVALUES(function() -- hooks a detection
			return
		end)
	)
end

local DealShot
DealShot = hookfunction(
	WeaponsDamageClient.dealShot,
	LPH_NO_VIRTUALIZE(function(a, b, c, d, e)
		d = d:Lerp(c.Position, 0.999) -- bypass so that it doesn't return early and block our shots, the lerp is just for if they like view our shit yknow

		return DealShot(a, b, c, d, e)
	end)
)

local HitboxExtender = {
	Config = {
		Enabled = false,
		SizeIncrease = 1,

		Transparency = 0,
		Material = Enum.Material.ForceField,
		Color = Color3.fromRGB(255, 0, 0),
	},
}

HitboxExtender.Update = LPH_JIT_MAX(function()
	if not HitboxExtender.Config.Enabled then
		return
	end

	for _, Player in next, Players:GetPlayers() do
		if Player == LocalPlayer then
			continue
		end

		if not Player.Character then
			continue
		end

		local Character = Player.Character
		local HumanoidRootPart = Character and Character.HumanoidRootPart or nil

		if not HumanoidRootPart then
			continue
		end

		if Player.Team == LocalPlayer.Team then
			HumanoidRootPart.Transparency = 1
			HumanoidRootPart.Size = Vector3.new(2, 2, 2)
			HumanoidRootPart.Color = Color3.new(1, 1, 1)
			HumanoidRootPart.Material = Enum.Material.Plastic

			continue
		end

		HumanoidRootPart.Color = HitboxExtender.Config.Color
		HumanoidRootPart.Material = HitboxExtender.Config.Material
		HumanoidRootPart.Transparency = HitboxExtender.Config.Transparency
		HumanoidRootPart.Size = Vector3.new(2, 2, 2) * HitboxExtender.Config.SizeIncrease
	end
end)

HitboxExtender.OnDisable = LPH_JIT_MAX(function()
	for _, Player in next, Players:GetPlayers() do
		if Player == LocalPlayer then
			continue
		end

		if not Player.Character then
			continue
		end

		local Character = Player.Character
		local HumanoidRootPart = Character and Character.HumanoidRootPart or nil

		if not HumanoidRootPart then
			continue
		end

		HumanoidRootPart.Transparency = 1
		HumanoidRootPart.Size = Vector3.new(2, 2, 2)
		HumanoidRootPart.Color = Color3.new(1, 1, 1)
		HumanoidRootPart.Material = Enum.Material.Plastic
	end
end)

return HitboxExtender
