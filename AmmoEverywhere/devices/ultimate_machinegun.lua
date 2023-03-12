dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
HitPoints = 15
StructureSplashDamage = 0
DeviceSplashDamage = 0
IncendiaryRadius = 0
IncendiaryRadiusHeated = 0
IgnitePlatformOnDestruct = false
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbFMJ", "context/HUD-fmj", nil, nil, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-ammo-sbStandard", "context/HUD-lead", nil, nil, nil, nil, path))
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbFMJ",
		Weapons = { "machinegun" },
		Devices = { { Name = "ult_sbmg", Consume = true } }, 
		Projectile = "sbult_mg1",
		FireEffect = path .. "/effects/blank.lua",
		RoundsEachBurst = 1,
		ReloadTime = 30,
		MetalFireCost = 0,
		EnergyFireCost = 30,
	},
}
Root = 
{
	Sprite = path .. "/devices/ammo/fmjAmmo.png",
	Name = "ammo_fmj",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}