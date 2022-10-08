dofile("mods/dlc2/devices/ammo_nighthawk.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
Root = 
{
	Sprite = path .. "/devices/ammo/grapeshotAmmo.png",
	Name = "ammo_base",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.53},
	PivotOffset = {0,0}
}

dofile('ui/uihelper.lua')
--table.insert(Sprites, ButtonSprite("hud-ammo-sbB2", "context/HUD-b2", nil, nil, nil, nil, path))

dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbB2",
		Devices = { {Name = "ammo_sbGrapeshot", Consume = true}, },
		Weapons = { "turret", "turret2", "turret2_focus", "turret3", "turret3_focus" },
		Projectile = "sbGrapeshot6",
	}
}