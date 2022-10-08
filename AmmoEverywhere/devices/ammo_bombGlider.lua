dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
HitPoints = 50
IncendiaryRadius = 80
IncendiaryRadiusHeated = 0
DeviceSplashDamageMaxRadius = 200
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbBombGlider", "context/HUD-bombGlider", nil, nil, nil, nil, path))
table.insert(Sprites,
	{
		Name = "sbRunwayGlider",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/glider/gliderRunway.png" }, mipmap = true, }, },
			Idle = Normal,
			Reload =
			{
				Frames =
				{
					{ texture = path .. "/weapons/helicopter/apacheRunway.png", duration = 120, colour = {0,0,0,0} },
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
		Sprite = "hud-ammo-sbBombGlider",
		AmmoSprites = { { Node = "Head", Sprite = "sbRunwayGlider", }, },
		Devices = { {Name = "ammo_sbBombGlider", Consume = true} }, 
		Weapons = { "runway", "runway2" },
		Projectile = "sbBombGlider",
		EnergyFireCost = 200,
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/bombGliderAmmo.png",
	Name = "ammo_apache",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.56},
	PivotOffset = {0,0}
}
