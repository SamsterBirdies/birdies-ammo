dofile("mods/dlc2/devices/ammo_orbital_sweep.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
DestroyEffect = "effects/battery_explode.lua"
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbOrbitalTracer", "context/HUD-oltracer", nil, nil, nil, nil, path))
table.insert(Sprites,
	{
		Name = "sbOrbitalTracerAmmoBarrel",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/orbital/tracerReady.png" }, mipmap = true, }, },
			Idle = Normal,
			Reload =
			{
				Frames =
				{
					{ texture = path .. "/weapons/orbital/tracerEmpty.png", duration = 120 },
					mipmap = true,
					duration = 0.1,
				},
			},
		},
	}
)
dlc2_Ammunition = 
{
	{
		AmmoSprites = { { Node = "Head", Sprite = "sbOrbitalTracerAmmoBarrel", }, },
		Sprite = "hud-ammo-sbOrbitalTracer",
		Devices = {"ammo_sbOrbitalTracer"},
		Projectile = "sbOLTracer",
		Weapons = {"orbital_laser", "orbital_laser2"},
		FireEffect = "mods/dlc2/effects/fire_ol_laser_sweep.lua",
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/olTracerAmmo.png",
	Name = "ammo_orbie",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.55},
	PivotOffset = {0,0}
}
HitPoints = 90