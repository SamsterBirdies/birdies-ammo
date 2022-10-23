dofile("mods/dlc2/devices/ammo_thunderbolt.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
Root = 
{
	Sprite = path .. "/devices/ammo/apacheAmmo.png",
	Name = "ammo_apache",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.5},
	PivotOffset = {0,0}
}
HitPoints = 90