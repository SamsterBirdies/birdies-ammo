dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
HitPoints = 90
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbMortarNapalm", "context/HUD-mortarNapalm", nil, nil, nil, nil, path))
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbMortarNapalm",
		Weapons = { "mortar" },
		Devices = { { Name = "ammo_sbMortarNapalm", Consume = false } }, 
		Projectile = "sbba_NapalmMortar",
		FireEffect = path .. "/effects/fire_napalmMortar.lua",
		EnergyFireCost = 350,
		MetalFireCost = 10,
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/mortarNapalmAmmo.png",
	Name = "ammo_airburst",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}

IncendiaryRadius = 160
IncendiaryRadiusHeated = 200