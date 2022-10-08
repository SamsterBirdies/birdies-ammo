dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbMortarSmoke", "context/HUD-mortarSmoke", nil, nil, nil, nil, path))
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbMortarSmoke",
		Weapons = { "mortar2" },
		Devices = { { Name = "ammo_sbMortarSmoke", Consume = false } }, 
		Projectile = "sbSmokeMortar",
		FireEffect = path .. "/effects/fire_smokeMortar.lua",
		EnergyFireCost = 500,
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/mortarSmokeAmmo.png",
	Name = "ammo_airburst",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}

IncendiaryRadius = 100
StructureSplashDamage = 100
StructureSplashDamageMaxRadius = 150
DestroyProjectile = "sbSmokeMortar"