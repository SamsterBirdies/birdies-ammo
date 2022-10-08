dofile("devices/sandbags.lua")
ConstructEffect = nil
CompleteEffect = nil
DestroyEffect = path .. "/effects/blank.lua"
Sprites = {}
Root = 
{
	Sprite = path .. "/blank.png",
	Name = "base",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.5},
	PivotOffset = {0,0}
}
StructureSplashDamage = 0
DeviceSplashDamage = 0
IncendiaryRadius = 0
IncendiaryRadiusHeated = 0
IgnitePlatformOnDestruct = false