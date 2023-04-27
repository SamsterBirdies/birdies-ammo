dofile("mods/dlc2/devices/ammo_thunderbolt.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
SelectionWidth = 37.5
SelectionHeight = 70.75
SelectionOffset = { 0.0, -71.25 }
HitPoints = 400
Mass = 100
IncendiaryRadius = 0
IncendiaryRadiusHeated = 0
StructureSplashDamage = 0
StructureSplashDamageMaxRadius = 0
DeviceSplashDamage = 0
DeviceSplashDamageMaxRadius = 0
DeviceSplashDamageDelay = 0
DestroyEffect = "effects/battery_explode.lua"
Root = 
{
	Sprite = path .. "/devices/ammo/rocketCannonAmmo.png",
	Name = "ammo_rocket",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbCannon", "context/HUD-cannon", nil, nil, nil, nil, path))
table.insert(Sprites,
	{
		Name = "sbRocketCannon-Head",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/rocket/head0.png" }, mipmap = true, }, },
			Idle = Normal,
			Reload =
			{
				Frames =
				{
					{ texture = path .. "/weapons/rocket/head0.png", duration = 0.32 },
					{ texture = path .. "/weapons/rocket/head1.png" },
					{ texture = path .. "/weapons/rocket/head2.png" },
					{ texture = path .. "/weapons/rocket/head3.png", duration = 120 },
					mipmap = true,
					duration = 0.04,
				},
			},
			ReloadEnd =
			{
				Frames =
				{
					{ texture = path .. "/weapons/rocket/head4.png" , duration = 0.04},
					{ texture = path .. "/weapons/rocket/head5.png" },
					{ texture = path .. "/weapons/rocket/head6.png" }, --duration = 0.52 },
					{ texture = path .. "/weapons/rocket/head7.png" },
					{ texture = path .. "/weapons/rocket/head8.png" },
					{ texture = path .. "/weapons/rocket/head9.png" },
					mipmap = true,
					duration = 0.08,
				},
				NextState = "Normal",
			},
		},
	}
)
dlc2_Ammunition =
{
	{ 
		AmmoSprites = { { Node = "Head", Sprite = "sbRocketCannon-Head", }, },
		--AmmoSprites = { { Node = "Head", Sprite = "sbRunwayApache", }, },
		Sprite = "hud-ammo-sbCannon",
		Devices = { {Name = "ammo_sbRocketCannon", Consume = false}, },
		Weapons = { "rocket" },
		MetalFireCost = 32,
		EnergyFireCost = 1400,
		Projectile = "sbRocketCannon",
		RoundsEachBurst = 2,
		RoundPeriod = 0.12,
		ReloadTime = 18,
		RetriggerFireEffect = false,
		FireStdDev = 0.01,
		MinFireSpeed = 6000,
		MaxFireSpeed = 6001,
		FireEffect = path .. "/effects/fire_rocketCannon.lua",
	}
}