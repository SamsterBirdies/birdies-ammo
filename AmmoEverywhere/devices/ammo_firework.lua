dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
DestroyEffect = "effects/battery_explode.lua"
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbFirework", "context/HUD-firework", nil, nil, nil, nil, path))
DestroyProjectile = "sbFireworkP1"
StructureSplashDamage = 0
DeviceSplashDamage = 0
HitPoints = 50
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbFirework",
		Devices = { "ammo_sbFirework" }, 
		Weapons = { "harpoon" },
		Projectile = "sbFireworkP1",
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/fireworkAmmo.png",
	Name = "ammo_apache",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}
