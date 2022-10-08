dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbMortarAllInOne", "context/HUD-mortarAllInOne", nil, nil, nil, nil, path))
table.insert(Sprites,
	{
		Name = "sbAIObarrel",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/mortars/aioBarrel.png" }, mipmap = true, }, },
			Idle = Normal,
		},
	}
)
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbMortarAllInOne",
		Weapons = { "mortar2" },
		Devices = 
		{ 
			{ Name = "ammo_sbMortarAllInOne", Consume = false }, 
		}, 
		Projectile = "sbAIOmortarP1",
		FireEffect = path .. "/effects/fire_AIO.lua",
		EnergyFireCost = 800,
		MetalFireCost = 25,
		AmmoSprites = { { Node = "Head", Sprite = "sbAIObarrel", }, },
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/mortarAllInOneAmmo.png",
	Name = "ammo_aio",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}
NodeEffects =
{
	{
		NodeName = "ammo_aio",
		EffectPath = path .. "/effects/idle_AIO.lua",
	},
}
DestroyProjectile = "sbAIOmortarP1"
IncendiaryRadius = 120
IncendiaryRadiusHeated = 150
StructureSplashDamage = 170
StructureSplashDamageMaxRadius = 150
DeviceSplashDamage = 100
DeviceSplashDamageMaxRadius = 250
DeviceSplashDamageDelay = 0.3