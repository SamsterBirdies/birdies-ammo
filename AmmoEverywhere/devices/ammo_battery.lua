dofile("mods/dlc2/devices/ammo_thunderbolt.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
HitPoints = 90
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbBattery", "context/HUD-battery", nil, nil, nil, nil, path))
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbBattery",
		Weapons = { "firebeam" },
		Devices = { "ammo_sbBattery" }, 
		BeamDuration = 2.5 * 1.2,
	},
	--[[ laser is done in weapon file. projectile beamtables get bugged when done here
	{ 
		Sprite = "hud-ammo-sbBattery",
		Weapons = { "laser" },
		Devices = { "ammo_sbBattery" },
		Projectile = {"sbLaserEXT"},
		BeamDuration = 1.5 * 1.2,
	},]]
	--[[
	{ 
		Sprite = "hud-ammo-sbBattery",
		Weapons = { "magnabeam" },
		Devices = { "ammo_sbBattery" },
		BeamDuration = 7 * 2,
		
	},]]
	--[[ errors happen if a mod isnt loaded
	{ 
		Sprite = "hud-ammo-sbBattery",
		Weapons = { "sbpullbeam" },
		Devices = { "ammo_sbBattery" },
		BeamDuration = 4.5 * 2,
	},
	{ 
		Sprite = "hud-ammo-sbBattery",
		Weapons = { "sbshieldbeam" },
		Devices = { "ammo_sbBattery" },
		BeamDuration = 3 * 2,
	},
	{ 
		Sprite = "hud-ammo-sbBattery",
		Weapons = { "sbdrunklaser" },
		Devices = { "ammo_sbBattery" },
		BeamDuration = 4.0 * 2,
	},]]
}
Root = 
{
	Sprite = path .. "/devices/ammo/beamAmmo.png",
	Name = "ammo_battery",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.5},
	PivotOffset = {0,0}
}