dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbMortarAirburst", "context/HUD-mortarAirburst", nil, nil, nil, nil, path))
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbMortarAirburst",
		Weapons = { "mortar2" },
		Devices = { { Name = "ammo_sbMortarAirburst", Consume = false } }, 
		Projectile = "sbAirburstP1",
		FireEffect = path .. "/effects/fire_airburst.lua"
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/mortarAirburstAmmo.png",
	Name = "ammo_airburst",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}
DestroyProjectile = "sbAirburstP1"