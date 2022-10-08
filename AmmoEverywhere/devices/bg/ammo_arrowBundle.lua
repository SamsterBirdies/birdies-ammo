dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
dofile('ui/uihelper.lua')
--table.insert(Sprites, ButtonSprite("hud-ammo-sbMortarAirburst", "context/HUD-mortarAirburst", nil, nil, nil, nil, path))
dlc2_Ammunition =
{
	{ 
		--Sprite = "hud-ammo-sbMortarAirburst",
		Weapons = { "sbbow" },
		Devices = { { Name = "ammo_sbArrowBundle"} }, 
		Projectile = "sbArrowBundleP1",
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/bg/arrow_bundle.png",
	Name = "ammo_arrowBundle",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}