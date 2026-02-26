local Shared = require("../../shared")
local Utility = require("../../utils/utility/utils")

local Players = Shared.Services.Players
local UserInputService = Shared.Services.UserInputService

local Camera = Shared.Classes.Camera
local LocalPlayer = Shared.Classes.LocalPlayer

local Modules = Shared.Modules
local FireActionClient = Modules:find("FireActionClient", true)
local CombatFormationClient = Modules:find("CombatFormationClient", true)
local WeaponsProjectilesClient = Modules:find("WeaponsProjectilesClient", true)

local Variables = debug.getupvalue(FireActionClient.Fire, 6)

local General = {
	SilentAim = { -- this table is so messy i could do so much better but like i wont lol
		Config = {
			Enabled = false,
			Manipulation = false,

			VisibleCheck = false,
			FlagBearerPriority = false,

			Hitpart = "Torso",
			DistanceLimit = 500,
		},

		FOVConfig = {
			Enabled = false,
			Outline = false,
			Visible = false,
			Filled = false,

			Radius = 100,
			Thickness = 1,
			NumSides = 20,
			Transparency = 0,

			Color = Color3.fromRGB(44, 124, 254),
		},

		FOVFillConfig = {
			Transparency = 0.3,
			Color = Color3.fromRGB(44, 124, 254),
		},

		LineConfig = {
			Enabled = false,
			Outline = false,

			Thickness = 1,
			Transparency = 1,
			Color = Color3.new(1, 1, 1),
		},

		Line = Utility.Draw("Line", {
			ZIndex = 11,
			Visible = false,
		}),

		LineOutline = Utility.Draw("Line", {
			ZIndex = 10,
			Visible = false,
			Color = Color3.new(0, 0, 0),
		}),

		FOVCircle = Utility.Draw("Circle", {
			ZIndex = 11,
			Visible = false,
		}),

		FOVCircleOutline = Utility.Draw("Circle", {
			ZIndex = 10,
			Visible = false,
			Color = Color3.new(0, 0, 0),
		}),

		FOVCircleFill = Utility.Draw("Circle", {
			ZIndex = 9,
			Visible = false,
			Filled = true,
		}),

		Target = nil,
		TargetPart = nil,
		Toggled = false,
		Update = function() end, -- so this shit doesn't scream at me saying it can't find the function
	},

	Aimbot = {
		Config = {
			Enabled = false,
			Smoothing = 0.3,

			VisibleCheck = false,
			FlagBearerPriority = false,

			Hitpart = "Torso",
			DistanceLimit = 500,
		},

		FOVConfig = {
			Enabled = false,
			Outline = false,
			Visible = false,
			Filled = false,

			Radius = 100,
			Thickness = 1,
			NumSides = 20,
			Transparency = 0,

			Color = Color3.fromRGB(44, 124, 254),
		},

		FOVFillConfig = {
			Transparency = 0.7,
			Color = Color3.fromRGB(44, 124, 254),
		},

		LineConfig = {
			Enabled = false,
			Outline = false,

			Thickness = 1,
			Transparency = 1,
			Color = Color3.new(1, 1, 1),
		},

		Line = Utility.Draw("Line", {
			ZIndex = 14,
			Visible = false,
		}),

		LineOutline = Utility.Draw("Line", {
			ZIndex = 13,
			Visible = false,
			Color = Color3.new(0, 0, 0),
		}),

		FOVCircle = Utility.Draw("Circle", {
			ZIndex = 14,
			Visible = false,
		}),

		FOVCircleOutline = Utility.Draw("Circle", {
			ZIndex = 13,
			Visible = false,
			Color = Color3.new(0, 0, 0),
		}),

		FOVCircleFill = Utility.Draw("Circle", {
			ZIndex = 12,
			Visible = false,
			Filled = true,
		}),

		Target = nil,
		TargetPart = nil,
		Toggled = false,
		Update = function() end, -- so this shit doesn't scream at me saying it can't find the function
	},

	BulletTracers = {
		Config = {
			Enabled = false,
			Duration = 5,
			Color = Color3.fromRGB(255, 255, 255),
		},
	},
}

local Aimbot = General.Aimbot

Aimbot.WallCheck = LPH_JIT_MAX(function(Part)
	if not Aimbot.Config.VisibleCheck then
		return true
	end

	if not Part or not Part.Parent then
		return false
	end

	local _RaycastParams = RaycastParams.new()
	_RaycastParams.FilterType = Enum.RaycastFilterType.Exclude
	_RaycastParams.IgnoreWater = true
	_RaycastParams.FilterDescendantsInstances = { LocalPlayer.Character, Camera }

	local RayResult =
		workspace:Raycast(Camera.CFrame.Position, (Part.Position - Camera.CFrame.Position).Unit * 1000, _RaycastParams)

	if RayResult then
		local HitPart = RayResult.Instance
		local HitCharacter = HitPart:FindFirstAncestorOfClass("Model")
		local TargetCharacter = Part:FindFirstAncestorOfClass("Model")

		return HitCharacter == TargetCharacter
	end

	return false
end)

Aimbot.GetClosestPlayer = LPH_JIT_MAX(function()
	if not Aimbot.Config.Enabled or not Aimbot.Toggled then
		return nil
	end

	local ClosestPlayer, ClosestDistance, Hitpart = nil, math.huge, nil

	for _, Player in next, Players:GetPlayers() do
		if Player ~= LocalPlayer then
			local Character = Player.Character

			if Character and Character:FindFirstChild(Aimbot.Config.Hitpart) then
				if LocalPlayer.Team == Player.Team then
					continue
				end

				if not (Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0) then
					continue
				end

				if
					not (
						(Camera.CFrame.Position - Player.Character:GetPivot().Position).Magnitude
						<= Aimbot.Config.DistanceLimit
					)
				then
					continue
				end

				local Part = Character[Aimbot.Config.Hitpart]
				local PartPosition, OnScreen = Camera:WorldToViewportPoint(Part.Position)

				if OnScreen then
					local AimVector = Vector2.new(PartPosition.X, PartPosition.Y)
					local Distance = (UserInputService:GetMouseLocation() - AimVector).Magnitude

					if Distance < ClosestDistance then
						if
							not Aimbot.FOVConfig.Enabled
							or Utility.InRadius(Aimbot.FOVCircle.Position, AimVector, Aimbot.FOVConfig.Radius)
						then
							if Aimbot.WallCheck(Part) then
								if Aimbot.Target and Aimbot.TargetPart then
									return Aimbot.Target, Aimbot.TargetPart
								end

								if Aimbot.Config.FlagBearerPriority and Player:GetAttribute("FlagBearer") then
									Hitpart = Part
									ClosestPlayer = Player
									ClosestDistance = Distance
								elseif not Aimbot.Config.FlagBearerPriority then
									Hitpart = Part
									ClosestPlayer = Player
									ClosestDistance = Distance
								elseif not Player:GetAttribute("FlagBearer") then
									Hitpart = Part
									ClosestPlayer = Player
									ClosestDistance = Distance
								end
							end
						end
					end
				end
			end
		end
	end

	return ClosestPlayer, Hitpart
end)

Aimbot.Update = LPH_JIT_MAX(function()
	if not Aimbot.Config.Enabled then
		Aimbot.FOVCircle.Visible = false
		Aimbot.FOVCircleOutline.Visible = false
		Aimbot.FOVCircleFill.Visible = false
		return
	end

	Aimbot.Target, Aimbot.TargetPart = Aimbot.GetClosestPlayer()
	local AimbotFOVLocation = UserInputService:GetMouseLocation()

	if Aimbot.FOVConfig.Enabled then
		local FOVCircle = Aimbot.FOVCircle
		local LerpedLocation = FOVCircle.Position:Lerp(Vector2.new(AimbotFOVLocation.X, AimbotFOVLocation.Y), 0.5)

		FOVCircle.Radius = Aimbot.FOVConfig.Radius
		FOVCircle.Thickness = Aimbot.FOVConfig.Thickness
		FOVCircle.NumSides = Aimbot.FOVConfig.NumSides
		FOVCircle.Color = Aimbot.FOVConfig.Color
		FOVCircle.Transparency = math.clamp(1 - Aimbot.FOVConfig.Transparency, 0, 1)
		FOVCircle.Visible = Aimbot.FOVConfig.Visible
		FOVCircle.Position = LerpedLocation

		if Aimbot.FOVConfig.Outline then
			local FOVCircleOutline = Aimbot.FOVCircleOutline
			FOVCircleOutline.Radius = Aimbot.FOVConfig.Radius
			FOVCircleOutline.Thickness = Aimbot.FOVConfig.Thickness + 2
			FOVCircleOutline.NumSides = Aimbot.FOVConfig.NumSides
			FOVCircleOutline.Visible = Aimbot.FOVConfig.Visible
			FOVCircleOutline.Position = LerpedLocation
		else
			Aimbot.FOVCircleOutline.Visible = false
		end

		if Aimbot.FOVConfig.Filled then
			local FOVCircleFill = Aimbot.FOVCircleFill
			FOVCircleFill.Radius = Aimbot.FOVConfig.Radius
			FOVCircleFill.Thickness = Aimbot.FOVConfig.Thickness
			FOVCircleFill.NumSides = Aimbot.FOVConfig.NumSides
			FOVCircleFill.Visible = Aimbot.FOVConfig.Visible

			FOVCircleFill.Color = Aimbot.FOVFillConfig.Color
			FOVCircleFill.Transparency = math.clamp(1 - Aimbot.FOVFillConfig.Transparency, 0, 1)
			FOVCircleFill.Position = LerpedLocation
		else
			Aimbot.FOVCircleFill.Visible = false
		end
	else
		Aimbot.FOVCircle.Visible = false
		Aimbot.FOVCircleFill.Visible = false
		Aimbot.FOVCircleOutline.Visible = false
	end

	if Aimbot.LineConfig.Enabled then
		local Line = Aimbot.Line
		local LineOutline = Aimbot.LineOutline

		local AimVector = Aimbot.Target
			and Aimbot.Target.Character
			and Camera:WorldToViewportPoint(Aimbot.Target.Character[Aimbot.Config.Hitpart].Position)

		if AimVector then
			Line.Visible = true
			Line.Color = Aimbot.LineConfig.Color
			Line.Thickness = Aimbot.LineConfig.Thickness
			Line.Transparency = Aimbot.LineConfig.Transparency

			Line.To = Vector2.new(AimVector.X, AimVector.Y)
			Line.From = Vector2.new(AimbotFOVLocation.X, AimbotFOVLocation.Y)

			if Aimbot.LineConfig.Outline then
				LineOutline.Visible = true
				LineOutline.Thickness = Aimbot.LineConfig.Thickness + 2

				LineOutline.To = Vector2.new(AimVector.X, AimVector.Y)
				LineOutline.From = Vector2.new(AimbotFOVLocation.X, AimbotFOVLocation.Y)
			else
				LineOutline.Visible = false
			end
		else
			Line.Visible = false
			LineOutline.Visible = false
		end
	else
		Aimbot.Line.Visible = false
		Aimbot.LineOutline.Visible = false
	end
end)

local OldRenderStepped
OldRenderStepped = hookfunction(
	FireActionClient.RenderStepped,
	LPH_NO_UPVALUES(function(
		self,
		a --[[no idea what this really is]]
	)
		if not (Aimbot.Config.Enabled and Aimbot.Toggled) then
			return OldRenderStepped(self, a)
		end

		local Direction, Origin

		if self.aiming then -- taken from the decompliled fire function that also calls fireBProjectile (imporant because in the original code direction and origin are taken from this)
			if self.muzzleAttachment then
				local MuzzleCFrame = self.muzzleAttachment.WorldCFrame

				if self.muzzleProjectileOffset then
					MuzzleCFrame = MuzzleCFrame * self.muzzleProjectileOffset
				end

				local BaseSpreadDegrees = Variables.ProjectileSpread
				local SpreadAngle = math.rad(BaseSpreadDegrees) * (math.random() - 0.5) * (1 - 0.6 * self.aimProgress) -- this wont be the most accurate because i wont hook math.random

				if self.noBayonetBonus then
					SpreadAngle = SpreadAngle * 0.96
				end

				if self.inaccuracyModifier then
					SpreadAngle = SpreadAngle * self.inaccuracyModifier
				end

				local IsSkirmishFormation = CombatFormationClient.formation == 3
				local ProjectileSpeed = self.projectileSpeed or 860

				if IsSkirmishFormation then
					SpreadAngle = SpreadAngle * Variables.SkirmishAccuracyModifier
					ProjectileSpeed = 940
				end

				if FireActionClient.rsc and math.random() > FireActionClient.rsc then
					SpreadAngle = SpreadAngle * 0.08
				end

				local ShotDirection = (MuzzleCFrame * CFrame.Angles(0, 0, math.pi * 2 * math.random()) * CFrame.Angles(
					SpreadAngle,
					0,
					0
				)).LookVector

				Direction, Origin = ShotDirection * ProjectileSpeed, MuzzleCFrame.Position + ShotDirection * 1 -- * 1 is in the original for some reason, im just gonna keep it evne though it does nun
			end
		end

		if Direction and Origin then
			local Target, Part = Aimbot.Target, Aimbot.TargetPart

			if Target and Part then
				local MousePosition = UserInputService:GetMouseLocation()

				local Prediction = Utility.SolveTrajectory(Origin, Part.Position, Part.Velocity, Direction)
				local Vector = Camera:WorldToViewportPoint(Prediction.AimPosition)

				local Lerp = MousePosition:Lerp(Vector2.new(Vector.X, Vector.Y), Aimbot.Config.Smoothing)
				local Delta = Lerp - MousePosition

				mousemoverel(Delta.X, Delta.Y)
			end
		end

		return OldRenderStepped(self, a)
	end)
)

local SilentAim = General.SilentAim

SilentAim.WallCheck = LPH_JIT_MAX(function(Part)
	if not SilentAim.Config.VisibleCheck then
		return true
	end

	if not Part or not Part.Parent then
		return false
	end

	local _RaycastParams = RaycastParams.new()
	_RaycastParams.FilterType = Enum.RaycastFilterType.Exclude
	_RaycastParams.IgnoreWater = true
	_RaycastParams.FilterDescendantsInstances = { LocalPlayer.Character, Camera }

	local RayResult =
		workspace:Raycast(Camera.CFrame.Position, (Part.Position - Camera.CFrame.Position).Unit * 1000, _RaycastParams)

	if RayResult then
		local HitPart = RayResult.Instance
		local HitCharacter = HitPart:FindFirstAncestorOfClass("Model")
		local TargetCharacter = Part:FindFirstAncestorOfClass("Model")

		return HitCharacter == TargetCharacter
	end

	return false
end)

SilentAim.GetClosestPlayer = LPH_JIT_MAX(function()
	if not SilentAim.Config.Enabled or not SilentAim.Toggled then
		return nil
	end

	local ClosestPlayer, ClosestDistance, Hitpart = nil, math.huge, nil

	for _, Player in next, Players:GetPlayers() do
		if Player ~= LocalPlayer then
			local Character = Player.Character

			if Character and Character:FindFirstChild(SilentAim.Config.Hitpart) then
				if LocalPlayer.Team == Player.Team then
					continue
				end

				if not (Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0) then
					continue
				end

				if
					not (
						(Camera.CFrame.Position - Player.Character:GetPivot().Position).Magnitude
						<= SilentAim.Config.DistanceLimit
					)
				then
					continue
				end

				local Part = Character[SilentAim.Config.Hitpart]
				local PartPosition, OnScreen = Camera:WorldToViewportPoint(Part.Position)

				if OnScreen then
					local AimVector = Vector2.new(PartPosition.X, PartPosition.Y)
					local Distance = (UserInputService:GetMouseLocation() - AimVector).Magnitude

					if Distance < ClosestDistance then
						if
							not SilentAim.FOVConfig.Enabled
							or Utility.InRadius(SilentAim.FOVCircle.Position, AimVector, SilentAim.FOVConfig.Radius)
						then
							if SilentAim.WallCheck(Part) then
								if SilentAim.Config.FlagBearerPriority and Player:GetAttribute("FlagBearer") then
									Hitpart = Part
									ClosestPlayer = Player
									ClosestDistance = Distance
								elseif not SilentAim.Config.FlagBearerPriority then
									Hitpart = Part
									ClosestPlayer = Player
									ClosestDistance = Distance
								elseif not Player:GetAttribute("FlagBearer") then
									Hitpart = Part
									ClosestPlayer = Player
									ClosestDistance = Distance
								end
							end
						end
					end
				end
			end
		end
	end

	return ClosestPlayer, Hitpart
end)

SilentAim.Update = LPH_JIT_MAX(function()
	if not SilentAim.Config.Enabled then
		SilentAim.FOVCircle.Visible = false
		SilentAim.FOVCircleOutline.Visible = false
		SilentAim.FOVCircleFill.Visible = false

		return
	end

	SilentAim.Target, SilentAim.TargetPart = SilentAim.GetClosestPlayer()
	local SilentAimFOVLocation = UserInputService:GetMouseLocation()

	if SilentAim.FOVConfig.Enabled then
		local FOVCircle = SilentAim.FOVCircle
		local LerpedLocation = FOVCircle.Position:Lerp(Vector2.new(SilentAimFOVLocation.X, SilentAimFOVLocation.Y), 0.5)

		FOVCircle.Radius = SilentAim.FOVConfig.Radius
		FOVCircle.Thickness = SilentAim.FOVConfig.Thickness
		FOVCircle.NumSides = SilentAim.FOVConfig.NumSides
		FOVCircle.Color = SilentAim.FOVConfig.Color
		FOVCircle.Transparency = math.clamp(1 - SilentAim.FOVConfig.Transparency, 0, 1)
		FOVCircle.Visible = SilentAim.FOVConfig.Visible
		FOVCircle.Position = LerpedLocation

		if SilentAim.FOVConfig.Outline then
			local FOVCircleOutline = SilentAim.FOVCircleOutline
			FOVCircleOutline.Radius = SilentAim.FOVConfig.Radius
			FOVCircleOutline.Thickness = SilentAim.FOVConfig.Thickness + 2
			FOVCircleOutline.NumSides = SilentAim.FOVConfig.NumSides
			FOVCircleOutline.Visible = SilentAim.FOVConfig.Visible
			FOVCircleOutline.Position = LerpedLocation
		else
			SilentAim.FOVCircleOutline.Visible = false
		end

		if SilentAim.FOVConfig.Filled then
			local FOVCircleFill = SilentAim.FOVCircleFill
			FOVCircleFill.Radius = SilentAim.FOVConfig.Radius
			FOVCircleFill.Thickness = SilentAim.FOVConfig.Thickness
			FOVCircleFill.NumSides = SilentAim.FOVConfig.NumSides
			FOVCircleFill.Visible = SilentAim.FOVConfig.Visible

			FOVCircleFill.Color = SilentAim.FOVFillConfig.Color
			FOVCircleFill.Transparency = math.clamp(1 - SilentAim.FOVFillConfig.Transparency, 0, 1)
			FOVCircleFill.Position = LerpedLocation
		else
			SilentAim.FOVCircleFill.Visible = false
		end
	else
		SilentAim.FOVCircle.Visible = false
		SilentAim.FOVCircleFill.Visible = false
		SilentAim.FOVCircleOutline.Visible = false
	end

	if SilentAim.LineConfig.Enabled then
		local Line = SilentAim.Line
		local LineOutline = SilentAim.LineOutline

		local AimVector = SilentAim.Target
			and SilentAim.Target.Character
			and Camera:WorldToViewportPoint(SilentAim.Target.Character[SilentAim.Config.Hitpart].Position)

		if AimVector then
			Line.Visible = true
			Line.Color = SilentAim.LineConfig.Color
			Line.Thickness = SilentAim.LineConfig.Thickness
			Line.Transparency = SilentAim.LineConfig.Transparency

			Line.To = Vector2.new(AimVector.X, AimVector.Y)
			Line.From = Vector2.new(SilentAimFOVLocation.X, SilentAimFOVLocation.Y)

			if SilentAim.LineConfig.Outline then
				LineOutline.Visible = true
				LineOutline.Thickness = SilentAim.LineConfig.Thickness + 2

				LineOutline.To = Vector2.new(AimVector.X, AimVector.Y)
				LineOutline.From = Vector2.new(SilentAimFOVLocation.X, SilentAimFOVLocation.Y)
			else
				LineOutline.Visible = false
			end
		else
			Line.Visible = false
			LineOutline.Visible = false
		end
	else
		SilentAim.Line.Visible = false
		SilentAim.LineOutline.Visible = false
	end
end)

local OldfireBProjectile -- just regular prediction
OldfireBProjectile = hookfunction(
	WeaponsProjectilesClient.fireBProjectile,
	LPH_NO_UPVALUES(function(Direction, Origin, WeaponValue)
		if SilentAim.Config.Enabled and not SilentAim.Config.Manipulation then
			local Target, Part = SilentAim.Target, SilentAim.TargetPart

			if not (Target and Part) then
				return OldfireBProjectile(Direction, Origin, WeaponValue)
			end

			local ProjectileSpeed = Direction.Magnitude
			local Prediction = Utility.SolveTrajectory(Origin, Part.Position, Part.Velocity, Direction)
			local Dir = Prediction.AimDirection * ProjectileSpeed

			return OldfireBProjectile(Dir, Origin, WeaponValue)
		end

		return OldfireBProjectile(Direction, Origin, WeaponValue)
	end)
)

local simulateFirearmProjectile = (
	function() -- gets the stupid function with getgc because they didn't want to make it global smhh
		for _, v in next, getgc(true) do
			if typeof(v) ~= "function" then
				continue
			end

			local info = debug.getinfo(v)

			if string.match(info.source, "WeaponsProjectilesClient") and info.name == "simulateFirearmProjectile" then
				return v
			end
		end

		return nil
	end
)()

local OldSimulateFirearmProjectile
OldSimulateFirearmProjectile = hookfunction(
	simulateFirearmProjectile,
	LPH_NO_UPVALUES(
		function(Bullet, ExtraVelocity, Offset) -- this is the method i first used that i also found on v3rm (thanks steffanuk12? im not sure)
			if not Bullet.isLocal then
				return OldSimulateFirearmProjectile(Bullet, ExtraVelocity, Offset)
			end

			local StartingPosition = Bullet.position

			if SilentAim.Config.Enabled and SilentAim.Config.Manipulation then
				if not Bullet.__Target then
					Bullet.__Target = SilentAim.TargetPart
				end

				if Bullet.__Target then
					local Speed = Bullet.velocity.Magnitude

					if Speed > 0 then
						local TargetDirection = (Bullet.__Target.Position - Bullet.position).Unit
						Bullet.velocity = TargetDirection * Speed -- p100 ud btw
					end
				end
			end

			local Result = OldSimulateFirearmProjectile(Bullet, ExtraVelocity, Offset)

			if General.BulletTracers.Config.Enabled then
				local EndPosition = Bullet.position

				task.spawn(function()
					local To, OnScreen2 = Camera:WorldToViewportPoint(EndPosition)
					local From, OnScreen1 = Camera:WorldToViewportPoint(StartingPosition)

					local Line = Utility.Draw("Line", {
						Visible = false,
						Color = General.BulletTracers.Config.Color,
						To = Vector2.new(To.X, To.Y),
						From = Vector2.new(From.X, From.Y),
					})

					local Connection = Shared.Services.RunService.RenderStepped:Connect(function()
						To, OnScreen2 = Camera:WorldToViewportPoint(EndPosition)
						From, OnScreen1 = Camera:WorldToViewportPoint(StartingPosition)

						if OnScreen1 and OnScreen2 then
							Line.Visible = true

							Line.From = Vector2.new(From.X, From.Y)
							Line.To = Vector2.new(To.X, To.Y)
						else
							Line.Visible = false
						end
					end)

					task.delay(General.BulletTracers.Config.Duration, function()
						local Duration = 0.15
						local Start, Goal, StartTime = Line.Transparency or 1, 0, tick()

						while tick() - StartTime < Duration do
							local Alpha = (tick() - StartTime) / Duration
							Line.Transparency = Start + (Goal - Start) * Alpha
							task.wait()
						end

						Line.Transparency = Goal

						Connection:Disconnect()
						Line:Destroy()
					end)
				end)
			end

			return Result
		end
	)
)

return General
