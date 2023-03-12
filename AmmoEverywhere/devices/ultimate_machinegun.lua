dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
HitPoints = 15
StructureSplashDamage = 0
DeviceSplashDamage = 0
IncendiaryRadius = 0
IncendiaryRadiusHeated = 0
IgnitePlatformOnDestruct = false

Root = 
{
	Sprite = path .. "/devices/ammo/leadHailAmmo.png",
	Name = "ammo_fmj",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}