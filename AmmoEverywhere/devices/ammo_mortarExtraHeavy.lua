dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
HitPoints = 90
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbMortarExtraHeavy", "context/HUD-mortarExtraHeavy", nil, nil, nil, nil, path))
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbMortarExtraHeavy",
		Weapons = { "mortar2" },
		Devices = { { Name = "ammo_sbMortarExtraHeavy", Consume = false } }, 
		Projectile = "sbExtraHeavyMortar",
		FireEffect = path .. "/effects/fire_extraHeavyMortar.lua",
		EnergyFireCost = 500,
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/mortarExtraHeavyAmmo.png",
	Name = "ammo_airburst",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}

IncendiaryRadius = 120
IncendiaryRadiusHeated = 150
StructureSplashDamage = 200
StructureSplashDamageMaxRadius = 150
DeviceSplashDamage = 200
DeviceSplashDamageMaxRadius = 250
DeviceSplashDamageDelay = 0.3