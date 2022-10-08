dofile(path .. "/devices/ammo_apache.lua")
Sprites = {}

dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbApache", "context/HUD-apache", nil, nil, nil, nil, path))
table.insert(Sprites,
	{
		Name = "sbRunwayApache",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/helicopter/apacheRunway.png" }, mipmap = true, }, },
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

ConstructEffect = nil
CompleteEffect = nil

IncendiaryRadius = 120
IncendiaryRadiusHeated = 150
StructureSplashDamage = 200
StructureSplashDamageMaxRadius = 150
DeviceSplashDamage = 200
DeviceSplashDamageMaxRadius = 250
DeviceSplashDamageDelay = 0.3

dlc2_Ammunition =
{
	{ 
		AmmoSprites = { { Node = "Head", Sprite = "sbRunwayApache", }, },
		Sprite = "hud-ammo-sbApache",
		Devices = { {Name = "ammo_sbApacheFireable", Consume = true} },
		Weapons = { "runway", "runway2" },
		MetalFireCost = 100,
		EnergyFireCost = 2000,
		Projectile = "sbApacheP1",
		MinFireSpeed = 1600,
		MaxFireSpeed = 1600.1,
	}
}