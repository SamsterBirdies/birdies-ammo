dofile("mods/dlc2/devices/ammo_thunderbolt.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
SelectionWidth = 65.5
SelectionHeight = 32.5
SelectionOffset = { 0.0, -34 }
Root = 
{
	Sprite = path .. "/devices/ammo/rocketNukeLongAmmo.png",
	Name = "ammo_rocket",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.55},
	PivotOffset = {0,0}
}
IncendiaryRadius = 100
IncendiaryRadiusHeated = 120
StructureSplashDamage = 160
StructureSplashDamageMaxRadius = 200
DeviceSplashDamage = 150
DeviceSplashDamageMaxRadius = 300
DeviceSplashDamageDelay = 0.3
HitPoints = 90
DestroyEffect = "effects/missile_ground_hit.lua"
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbNuke", "context/HUD-nuke", nil, nil, nil, nil, path))
table.insert(Sprites,
	{
		Name = "sbRocketNuke-Head",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/rocket/headn0.png" }, mipmap = true, }, },
			Idle = Normal,
			Reload =
			{
				Frames =
				{
					{ texture = "mods/weapon_pack/weapons/rocket/head02.png" },
					{ texture = "mods/weapon_pack/weapons/rocket/head03.png" },
					{ texture = "mods/weapon_pack/weapons/rocket/head04.png", duration = 120  },
					mipmap = true,
					duration = 0.05,
				},
			},
			ReloadEnd =
			{
				Frames =
				{
					{ texture = "mods/weapon_pack/weapons/rocket/head05.png" },
					{ texture = path .. "/weapons/rocket/headn1.png" },
					{ texture = path .. "/weapons/rocket/headn2.png" },
					mipmap = true,
					duration = 0.16,
				},
				NextState = "Normal",
			},
		},
	}
)
dlc2_Ammunition =
{
	{ 
		AmmoSprites = { { Node = "Head", Sprite = "sbRocketNuke-Head", }, },
		--AmmoSprites = { { Node = "Head", Sprite = "sbRunwayApache", }, },
		Sprite = "hud-ammo-sbNuke",
		Devices = { {Name = "ammo_sbRocketNuke", Consume = true}, },
		Weapons = { "rocket" },
		Projectile = "missile2",
		RoundsEachBurst = 1,
		MinFireSpeed = 400,
		MaxFireSpeed = 401,
		FireEffect = "effects/warhead_launch.lua",
	}
}