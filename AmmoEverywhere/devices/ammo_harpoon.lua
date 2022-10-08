dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbHarpoon", "context/HUD-harpoon", nil, nil, nil, nil, path))
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbHarpoon",
		Devices = { {Name = "ammo_sbHarpoon", Consume = false} }, 
		Weapons = { "harpoon" },
		Projectile = "sbHarpoonP1",
		MinFireSpeed = 6000,
		MaxFireSpeed = 6001,
		ReloadTime = 15,
		EnergyFireCost = 500,
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/harpoonAmmo.png",
	Name = "ammo_apache",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.56},
	PivotOffset = {0,0}
}
DestroyEffect = "effects/bracing_destroy.lua"
StructureSplashDamage = 0
DeviceSplashDamage = 0
IncendiaryRadius = 0
IncendiaryRadiusHeated = 0
IgnitePlatformOnDestruct = false
