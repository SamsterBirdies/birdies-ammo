dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
dofile('ui/uihelper.lua')

dlc2_Ammunition =
{
	{ 
		--Sprite = "hud-ammo-sbAirburst",
		Weapons = { "sbbow" },
		Devices = { "ammo_sbShotbow" },
		RetriggerFireEffect = true, 
		RoundPeriod = 0,
		FireStdDev = 1,
		RoundsEachBurst = 8,
	},
	{
		Weapons = { "turret" },
		Devices = { "ammo_sbShotbow" },
		RetriggerFireEffect = true, 
		Projectile = "sniper",
		RoundsEachBurst = 16,
		RoundPeriod = 0,
		Recoil = 0,
		MaxFireSpeed = 6000,
		MinFireSpeed = 5999,
	}
}