--!nocheck

local Library = require("./library")
local LoadingClock = os.clock()

for _, Connection in next, getconnections(game:GetService("ScriptContext").Error) do -- prevents bans from errors? hopefully
	if not Connection then
		continue
	end

	if not Connection.LuaConnection then
		continue
	end

	if Connection.Function then
		hookfunction(
			Connection.Function,
			function()
				return
			end
		)
	end

	pcall(Connection.Disconnect)
end

local CustomAsset = LPH_JIT_MAX(function(Path, Link)
	if isfile(Path) then
		return getcustomasset(Path)
	end

	if not isfile(Path) and Link then
		writefile(Path, game:HttpGet(Link))
	end

	return getcustomasset(Path)
end)

local sounds = {
	"discord",
	"mcbow",
	"minecraft",
	"minecraft_xp",
	"neverlose",
	"rust_headshot",
	"skeet",
	"stapler",
	"shooting_star",
	"bubble",
}

for _, v in next, sounds do
	CustomAsset(
		"Hitsounds/" .. v .. ".wav",
		"https://github.com/BlackDisciplesHook/Project-X-V3/raw/refs/heads/main/Hitsounds/" .. v .. ".wav"
	)
end

local Shared = require("@self/shared")
local Hooks = require("@self/hooks")
local Features = require("@self/features")

local Players = Shared.Services.Players
local RunService = Shared.Services.RunService
local LocalPlayer = Shared.Classes.LocalPlayer

RunService.PreRender:Connect(LPH_JIT_MAX(function()
	Features.Combat.Melee.Update()
	Features.Combat.HitboxExtender.Update()
	Features.Combat.Weapon.Aimbot.Update()
	Features.Combat.Weapon.SilentAim.Update()
end))

for _, Player in next, Players:GetPlayers() do
	if Player ~= LocalPlayer then
		Features.Combat.Melee.CreateLine(Player)
	end
end

Players.PlayerAdded:Connect(LPH_JIT_MAX(function(Player)
	if Player ~= LocalPlayer then
		Features.Combat.Melee.CreateLine(Player)
	end
end))

Players.PlayerRemoving:Connect(LPH_JIT_MAX(function(Player)
	if Player ~= LocalPlayer then
		Features.Combat.Melee.TargetLines[Player]:Remove()
		Features.Combat.Melee.TargetLines[Player] = nil
	end
end))

-- ew yucky ui code under here don't mind it!!

LPH_NO_VIRTUALIZE(function()
	Library.Theme["Accent"] = Color3.fromRGB(44, 124, 255)
	Library.Theme["Background"] = Color3.fromRGB(20, 20, 25)
	Library.Theme["Inline"] = Color3.fromRGB(25, 25, 30)

	local KeybindList = Library:KeybindList()
	KeybindList:SetVisibility(false)

	local Watermark = Library:Watermark(
		"84e Client - "
			.. os.date("%b %d %Y")
			.. " - "
			.. game:GetService("MarketplaceService"):GetProductInfoAsync(game.PlaceId).Name
	)

	local Window = Library:Window({
		Name = "84e Client - discord.gg/rgDXfnn4Md",
	})

	local Legit = Window:Page({ Name = "Legit", Columns = 2, Subtabs = false })

	local SilentAimSection = Legit:ScrollableSection({ Name = "Silent Aim", Side = 1, Size = 350 })

	SilentAimSection:Toggle({
		Name = "Enabled",
		Default = false,
		Flag = "silent_aim_enabled",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.Config.Enabled = value
		end,
	}):Keybind({
		Name = "Silent Aim",
		Mode = "Toggle",
		Flag = "silent_aim_bind",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.Toggled = value
		end,
	})

	SilentAimSection:Toggle({
		Name = "Manipulation",
		Default = true,
		Flag = "silent_aim_manipulation",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.Config.Manipulation = value
		end,
	})

	SilentAimSection:Divider()

	SilentAimSection:Slider({
		Name = "Distance Limit",
		Min = 50,
		Default = 500,
		Max = 1000,
		Decimals = 1,
		Suffix = "m",
		Flag = "silent_aim_distancelimit",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.Config.DistanceLimit = value
		end,
	})

	SilentAimSection:Dropdown({
		Name = "Hitpart",
		Items = { "Head", "Torso", "HumanoidRootPart" },
		Multi = false,
		Default = "Torso",
		Flag = "silent_aim_hitpart",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.Config.Hitpart = value
		end,
	})

	SilentAimSection:Dropdown({
		Name = "Checks",
		Items = { "Visible", "Flag Bearer Priority" },
		Multi = true,
		Flag = "silent_aim_checks",
		Callback = function(value)
			if table.find(value, "Visible") then
				Features.Combat.Weapon.SilentAim.Config.VisibleCheck = true
			else
				Features.Combat.Weapon.SilentAim.Config.VisibleCheck = false
			end

			if table.find(value, "Flag Bearer Priority") then
				Features.Combat.Weapon.SilentAim.Config.FlagBearerPriority = true
			else
				Features.Combat.Weapon.SilentAim.Config.FlagBearerPriority = true
			end
		end,
	})

	SilentAimSection:Divider()

	SilentAimSection:Toggle({
		Name = "FOV Enabled",
		Default = false,
		Flag = "silent_aim_fov_enabled",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.FOVConfig.Enabled = value
		end,
	})

	SilentAimSection:Toggle({
		Name = "FOV Visible",
		Default = false,
		Flag = "silent_aim_fov_visible",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.FOVConfig.Visible = value
		end,
	}):Colorpicker({
		Name = "Color",
		Flag = "silent_aim_fov_color",
		Alpha = 0,
		Default = Color3.fromRGB(44, 124, 254),
		Callback = function(value, Alpha)
			Features.Combat.Weapon.SilentAim.FOVConfig.Color = value
			Features.Combat.Weapon.SilentAim.FOVConfig.Transparency = Alpha
		end,
	})

	SilentAimSection:Toggle({
		Name = "FOV Filled",
		Default = false,
		Flag = "silent_aim_fov_filled",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.FOVConfig.Filled = value
		end,
	}):Colorpicker({
		Name = "Fill Color",
		Flag = "silent_aim_fov_fillcolor",
		Alpha = 0.3,
		Default = Color3.fromRGB(44, 124, 254),
		Callback = function(value, Alpha)
			Features.Combat.Weapon.SilentAim.FOVFillConfig.Color = value
			Features.Combat.Weapon.SilentAim.FOVFillConfig.Transparency = Alpha
		end,
	})

	SilentAimSection:Toggle({
		Name = "FOV Outline",
		Default = false,
		Flag = "silent_aim_fov_outlined",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.FOVConfig.Outline = value
		end,
	})

	SilentAimSection:Divider()

	SilentAimSection:Slider({
		Name = "FOV Radius",
		Min = 1,
		Max = 1000,
		Decimals = 1,
		Default = 100,
		Suffix = "px",
		Flag = "silent_aim_fov_radius",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.FOVConfig.Radius = value
		end,
	})

	SilentAimSection:Slider({
		Name = "FOV Sides",
		Min = 3,
		Max = 40,
		Decimals = 1,
		Default = 20,
		Suffix = " Sides",
		Flag = "silent_aim_fov_numsides",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.FOVConfig.NumSides = value
		end,
	})

	SilentAimSection:Divider()

	SilentAimSection:Toggle({
		Name = "Line Enabled",
		Default = false,
		Flag = "silent_aim_line_enabled",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.LineConfig.Enabled = value
		end,
	})

	SilentAimSection:Toggle({
		Name = "Line Outline",
		Default = false,
		Flag = "silent_aim_line_outlined",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.LineConfig.Outline = value
		end,
	}):Colorpicker({
		Name = "Line Color",
		Flag = "silent_aim_line_color",
		Alpha = 1,
		Default = Color3.new(1, 1, 1),
		Callback = function(value, Alpha)
			Features.Combat.Weapon.SilentAim.LineConfig.Color = value
			Features.Combat.Weapon.SilentAim.LineConfig.Transparency = Alpha
		end,
	})

	SilentAimSection:Slider({
		Name = "Line Thickness",
		Min = 1,
		Max = 10,
		Default = 1,
		Decimals = 1,
		Suffix = "px",
		Flag = "silent_aim_line_thickness",
		Callback = function(value)
			Features.Combat.Weapon.SilentAim.LineConfig.Thickness = value
		end,
	})

	local AimbotSection = Legit:ScrollableSection({ Name = "Aimbot", Side = 2, Size = 350 })

	AimbotSection:Toggle({
		Name = "Enabled",
		Default = false,
		Flag = "aimbot_enabled",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.Config.Enabled = value
		end,
	}):Keybind({
		Name = "Aimbot",
		Mode = "Toggle",
		Flag = "aimbot_bind",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.Toggled = value
		end,
	})

	AimbotSection:Divider()

	AimbotSection:Slider({
		Name = "Distance Limit",
		Min = 50,
		Default = 500,
		Max = 1000,
		Decimals = 1,
		Suffix = "m",
		Flag = "aimbot_distancelimit",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.Config.DistanceLimit = value
		end,
	})

	AimbotSection:Slider({
		Name = "Smoothing",
		Min = 0.01,
		Max = 1,
		Default = 0.5,
		Decimals = 0.01,
		Flag = "aimbot_smoothing",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.Config.Smoothing = value
		end,
	})

	AimbotSection:Dropdown({
		Name = "Hitpart",
		Items = { "Head", "Torso", "HumanoidRootPart" },
		Multi = false,
		Default = "Torso",
		Flag = "aimbot_hitpart",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.Config.Hitpart = value
		end,
	})

	AimbotSection:Dropdown({
		Name = "Checks",
		Items = { "Visible", "Flag Bearer Priority" },
		Multi = true,
		Flag = "aimbot_checks",
		Callback = function(value)
			if table.find(value, "Visible") then
				Features.Combat.Weapon.Aimbot.Config.VisibleCheck = true
			else
				Features.Combat.Weapon.Aimbot.Config.VisibleCheck = false
			end

			if table.find(value, "Flag Bearer Priority") then
				Features.Combat.Weapon.Aimbot.Config.FlagBearerPriority = true
			else
				Features.Combat.Weapon.Aimbot.Config.FlagBearerPriority = false
			end
		end,
	})

	AimbotSection:Divider()

	AimbotSection:Toggle({
		Name = "FOV Enabled",
		Default = false,
		Flag = "aimbot_fov_enabled",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.FOVConfig.Enabled = value
		end,
	})

	AimbotSection:Toggle({
		Name = "FOV Visible",
		Default = false,
		Flag = "aimbot_fov_visible",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.FOVConfig.Visible = value
		end,
	}):Colorpicker({
		Name = "Color",
		Flag = "aimbot_fov_color",
		Alpha = 0,
		Default = Color3.fromRGB(44, 124, 254),
		Callback = function(value, Alpha)
			Features.Combat.Weapon.Aimbot.FOVConfig.Color = value
			Features.Combat.Weapon.Aimbot.FOVConfig.Transparency = Alpha
		end,
	})

	AimbotSection:Toggle({
		Name = "FOV Filled",
		Default = false,
		Flag = "aimbot_fov_filled",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.FOVConfig.Filled = value
		end,
	}):Colorpicker({
		Name = "Fill Color",
		Flag = "aimbot_fov_fillcolor",
		Alpha = 0.7,
		Default = Color3.fromRGB(44, 124, 254),
		Callback = function(value, Alpha)
			Features.Combat.Weapon.Aimbot.FOVFillConfig.Color = value
			Features.Combat.Weapon.Aimbot.FOVFillConfig.Transparency = Alpha
		end,
	})

	AimbotSection:Toggle({
		Name = "FOV Outline",
		Default = false,
		Flag = "aimbot_fov_outlined",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.FOVConfig.Outline = value
		end,
	})

	AimbotSection:Divider()

	AimbotSection:Slider({
		Name = "FOV Radius",
		Min = 1,
		Max = 1000,
		Default = 100,
		Decimals = 1,
		Suffix = "px",
		Flag = "aimbot_fov_radius",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.FOVConfig.Radius = value
		end,
	})

	AimbotSection:Slider({
		Name = "FOV Sides",
		Min = 3,
		Max = 40,
		Default = 20,
		Decimals = 1,
		Suffix = " Sides",
		Flag = "aimbot_fov_numsides",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.FOVConfig.NumSides = value
		end,
	})

	AimbotSection:Divider()

	AimbotSection:Toggle({
		Name = "Line Enabled",
		Default = false,
		Flag = "aimbot_line_enabled",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.LineConfig.Enabled = value
		end,
	})

	AimbotSection:Toggle({
		Name = "Line Outline",
		Default = false,
		Flag = "aimbot_line_outlined",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.LineConfig.Outline = value
		end,
	}):Colorpicker({
		Name = "Line Color",
		Flag = "aimbot_line_color",
		Alpha = 1,
		Default = Color3.new(1, 1, 1),
		Callback = function(value, Alpha)
			Features.Combat.Weapon.Aimbot.LineConfig.Color = value
			Features.Combat.Weapon.Aimbot.LineConfig.Transparency = Alpha
		end,
	})

	AimbotSection:Slider({
		Name = "Line Thickness",
		Min = 1,
		Max = 10,
		Default = 1,
		Decimals = 1,
		Suffix = "px",
		Flag = "aimbot_line_thickness",
		Callback = function(value)
			Features.Combat.Weapon.Aimbot.LineConfig.Thickness = value
		end,
	})

	local HitboxExtenderSection = Legit:Section({ Name = "Hitbox Extender", Side = 1 })

	HitboxExtenderSection:Toggle({
		Name = "Enabled",
		Default = false,
		Flag = "hbe_enabled",
		Callback = function(value)
			Features.Combat.HitboxExtender.Config.Enabled = value
			if not value then
				Features.Combat.HitboxExtender.OnDisable()
			end
		end,
	}):Colorpicker({
		Name = "Color",
		Flag = "hbe_color",
		Alpha = 0,
		Default = Color3.new(1, 1, 1),
		Callback = function(value, Alpha)
			Features.Combat.HitboxExtender.Config.Color = value
			Features.Combat.HitboxExtender.Config.Transparency = Alpha
		end,
	})

	HitboxExtenderSection:Slider({
		Name = "Size Increase",
		Min = 1.1,
		Max = 10,
		Default = 1.1,
		Decimals = 0.1,
		Suffix = "x",
		Flag = "hbe_size_increase",
		Callback = function(value)
			Features.Combat.HitboxExtender.Config.SizeIncrease = value
		end,
	})

	local Rage = Window:Page({ Name = "Rage", Columns = 2, Subtabs = false })

	local MeleeAuraSection = Rage:Section({ Name = "Melee Aura", Side = 1 })

	MeleeAuraSection:Toggle({
		Name = "Enabled",
		Flag = "melee_aura_enabled",
		Default = false,
		Callback = function(value)
			Features.Combat.Melee.Config.Aura = value
		end,
	}):Keybind({
		Name = "Melee Aura",
		Mode = "Toggle",
		Flag = "melee_aura_bind",
		Callback = function(value)
			Features.Combat.Melee.Toggled = value
		end,
	})

	local RangeSlider = nil

	MeleeAuraSection:Toggle({
		Name = "Bypass Range Check",
		Flag = "melee_aura_range_check_bypass",
		Default = false,
		Callback = function(value)
			Features.Combat.Melee.Config.BypassRangeCheck = value

			if RangeSlider then
				if value then
					RangeSlider:SetMax(20)
				else
					RangeSlider:SetMax(10)
				end

				RangeSlider:Set(Library.Flags["melee_aura_range"])
			end
		end,
	})

	RangeSlider = MeleeAuraSection:Slider({
		Name = "Range",
		Min = 1,
		Max = 11,
		Default = 1,
		Decimals = 1,
		Suffix = "m",
		Flag = "melee_aura_range",
		Callback = function(value)
			Features.Combat.Melee.Config.AuraRange = value
		end,
	})

	MeleeAuraSection:Slider({
		Name = "Delay",
		Min = 0.15,
		Max = 1,
		Default = 0.5,
		Decimals = 0.05,
		Suffix = "s",
		Flag = "melee_aura_delay",
		Callback = function(value)
			Features.Combat.Melee.Config.AuraAttackDelay = value
		end,
	})

	MeleeAuraSection:Divider()

	MeleeAuraSection:Toggle({
		Name = "Visualize Area",
		Flag = "melee_aura_show_aura_range",
		Default = false,
		Callback = function(value)
			Features.Combat.Melee.Config.ShowAuraRange = value
		end,
	}):Colorpicker({
		Name = "Color",
		Flag = "melee_aura_area_color",
		Default = Color3.new(1, 1, 1),
		Callback = function(value)
			Features.Combat.Melee.Config.ShowAuraRangeColor = value
		end,
	})

	MeleeAuraSection:Toggle({
		Name = "Target Line",
		Flag = "melee_aura_show_aura_target",
		Default = false,
		Callback = function(value)
			Features.Combat.Melee.Config.ShowAuraTarget = value
		end,
	}):Colorpicker({
		Name = "Color",
		Flag = "melee_aura_line_color",
		Default = Color3.new(1, 1, 1),
		Callback = function(value)
			Features.Combat.Melee.Config.ShowAuraTargetColor = value
		end,
	})

	local Visuals = Window:Page({ Name = "Visuals", Columns = 2, Subtabs = false })

	local BulletTracersSection = Visuals:Section({ Name = "Bullet Tracers", Side = 1 })

	BulletTracersSection:Toggle({
		Name = "Enabled",
		Flag = "bullet_tracers_enabled",
		Default = false,
		Callback = function(value)
			Features.Combat.Weapon.BulletTracers.Config.Enabled = value
		end,
	}):Colorpicker({
		Name = "Color",
		Flag = "bullet_tracers_color",
		Default = Color3.new(1, 1, 1),
		Callback = function(value)
			Features.Combat.Weapon.BulletTracers.Config.Color = value
		end,
	})

	BulletTracersSection:Slider({
		Name = "Duration",
		Min = 0.1,
		Max = 10,
		Default = 5,
		Decimals = 0.1,
		Suffix = "s",
		Flag = "bullet_tracers_lifetime",
		Callback = function(value)
			Features.Combat.Weapon.BulletTracers.Config.Duration = value
		end,
	})

	local Misc = Window:Page({ Name = "Misc", Columns = 2, Subtabs = false })

	local ClientModsSection = Misc:Section({ Name = "Client Mods", Side = 1 })

	ClientModsSection:Toggle({
		Name = "Instant Flag Prompt",
		Flag = "instant_flag_capture_and_pick_up",
		Default = false,
		Callback = function(value)
			Features.Misc.Flag.Config.InstantCapture = value
		end,
	})

	local IndicatorSection = Misc:Section({ Name = "Hit Indicators", Side = 2 })

	local GuiSounds = Shared.Modules:find("GuiSounds")
	require(GuiSounds).CustomVolume = 1 -- sooo eww

	IndicatorSection:Dropdown({
		Name = "Sound",
		Items = sounds,
		Flag = "hitmarker_sound",
		Callback = function(value)
			if not value then
				require(GuiSounds).CustomSound = false
				GuiSounds.Hitmark.SoundId = "rbxassetid://6142895975"
				return
			end

			require(GuiSounds).CustomSound = true
			GuiSounds.Hitmark.SoundId = CustomAsset("Hitsounds/" .. value .. ".wav")
			Hooks.Notifications.playHitmarkSound()
		end,
	})

	IndicatorSection:Slider({
		Name = "Volume",
		Min = 1,
		Max = 100,
		Default = 100,
		Decimals = 1,
		Suffix = "%",
		Flag = "hitmarker_volume",
		Callback = function(value)
			require(GuiSounds).CustomVolume = value / 100
		end,
	})

	IndicatorSection:Divider()

	IndicatorSection:Toggle({
		Name = "Notification",
		Flag = "damage_notifications_enabled",
		Default = false,
		Callback = function(value) end,
	})

	local Settings = Window:Page({ Name = "Settings", Columns = 2, Subtabs = false })
	local SettingsSection = Settings:Section({ Name = "Settings", Side = 2 })
	local ConfigsSection = Settings:Section({ Name = "Profiles", Side = 1 })

	for Index, value in Library.Theme do
		SettingsSection:Label({ Name = Index, Alignment = "Left" }):Colorpicker({
			Name = Index,
			Default = value,
			Flag = "Theme" .. Index,
			Callback = function(Color)
				Library.Theme[Index] = Color
				Library:ChangeTheme(Index, Color)
			end,
		})
	end

	SettingsSection:Label({ Name = "Menu Keybind", Alignment = "Left" }):Keybind({
		Name = "Menu Keybind",
		Flag = "Menu Keybind",
		Default = Enum.KeyCode.F1,
		Mode = "Toggle",
		Callback = function(value)
			Library.MenuKeybind = Library.Flags["Menu Keybind"].Key
		end,
	})

	SettingsSection:Toggle({
		Name = "Watermark",
		Flag = "Watermark",
		Default = true,
		Callback = function(value)
			Watermark:SetVisibility(value)
		end,
	})

	SettingsSection:Toggle({
		Name = "Keybind List",
		Flag = "Keybind List",
		Default = false,
		Callback = function(value)
			KeybindList:SetVisibility(value)
		end,
	})

	SettingsSection:Dropdown({
		Name = "Tweening Style",
		Flag = "Tweening Style",
		Default = "Exponential",
		Items = {
			"Linear",
			"Sine",
			"Quad",
			"Cubic",
			"Quart",
			"Quint",
			"Exponential",
			"Circular",
			"Back",
			"Elastic",
			"Bounce",
		},
		Callback = function(value)
			Library.Tween.Style = Enum.EasingStyle[value]
		end,
	})

	SettingsSection:Dropdown({
		Name = "Tweening Direction",
		Flag = "Tweening Direction",
		Default = "Out",
		Items = { "In", "Out", "InOut" },
		Callback = function(value)
			Library.Tween.Direction = Enum.EasingDirection[value]
		end,
	})

	SettingsSection:Slider({
		Name = "Tweening Time",
		Min = 0,
		Max = 5,
		Default = 0.25,
		Decimals = 0.01,
		Flag = "Tweening Time",
		Callback = function(value)
			Library.Tween.Time = value
		end,
	})

	local ConfigName
	local ConfigSelected

	local ConfigsListbox = ConfigsSection:Listbox({
		Items = {},
		Name = "Configs",
		Flag = "Configs List",
		Callback = function(value)
			ConfigSelected = value
		end,
	})

	ConfigsSection:Textbox({
		Name = "Config Name",
		Placeholder = ". .",
		Flag = "Config Name",
		Callback = function(value)
			ConfigName = value
		end,
	})

	ConfigsSection:Button({
		Name = "Create Config",
		Callback = function()
			if not isfile(Library.Folders.Configs .. "/" .. ConfigName .. ".json") then
				writefile(Library.Folders.Configs .. "/" .. ConfigName .. ".json", Library:GetConfig())

				Library:RefreshConfigsList(ConfigsListbox)
			else
				Library:Notification("Config '" .. ConfigName .. ".json' already exists", 3, Color3.FromR(255, 0, 0))
				return
			end
		end,
	})

	ConfigsSection:Button({
		Name = "Load Config",
		Callback = function()
			if ConfigSelected then
				Library:LoadConfig(readfile(Library.Folders.Configs .. "/" .. ConfigSelected))
			end

			Library:Thread(function()
				task.wait(0.1)

				for Index, value in Library.Theme do
					Library.Theme[Index] = Library.Flags["Theme" .. Index].Color
					Library:ChangeTheme(Index, Library.Flags["Theme" .. Index].Color)
				end
			end)
		end,
	})

	ConfigsSection:Button({
		Name = "Delete Config",
		Callback = function()
			if ConfigSelected then
				Library:DeleteConfig(ConfigSelected)

				Library:RefreshConfigsList(ConfigsListbox)
			end
		end,
	})

	ConfigsSection:Button({
		Name = "Save Config",
		Callback = function()
			if ConfigSelected then
				Library:SaveConfig(ConfigSelected)
			end
		end,
	})

	ConfigsSection:Button({
		Name = "Refresh Configs",
		Callback = function()
			Library:RefreshConfigsList(ConfigsListbox)
		end,
	})

	Library:RefreshConfigsList(ConfigsListbox)

	Library:Notification(string.format("Loaded in: %.3ss", os.clock() - LoadingClock), 5, Library.Theme["Accent"])
end)()
