dofile("mods/dlc2/devices/ammo_orbital_sweep.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbOrbitalArtillery", "context/HUD-orbitalArtillery", nil, nil, nil, nil, path))
table.insert(Sprites,
	{
		Name = "sbOrbitalArtilleryAmmoBarrel",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/orbital/artilleryReady.png" }, mipmap = true, }, },
			Idle = Normal,
			Reload =
			{
				Frames =
				{
					{ texture = path .. "/weapons/orbital/artilleryEmpty.png", duration = 120 },
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
		AmmoSprites = { { Node = "Head", Sprite = "sbOrbitalArtilleryAmmoBarrel", }, },
		Sprite = "hud-ammo-sbOrbitalArtillery",
		Devices = {"ammo_sbOrbitalArtillery"},
		Projectile = "sbOrbitalArtilleryMarker",
		Weapons = {"orbital_laser", "orbital_laser2"},
		FireEffect = "mods/dlc2/effects/fire_ol_laser_sweep.lua",
	}
}
Root = 
{
	Sprite = path .. "/devices/ammo/orbitalArtilleryAmmo.png",
	Name = "ammo_orbie",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.55},
	PivotOffset = {0,0}
}

DestroyProjectile = "sbOrbitalArtilleryMarker"
IncendiaryRadius = 0
IncendiaryRadiusHeated = 0
StructureSplashDamage = 0
StructureSplashDamageMaxRadius = 0
DeviceSplashDamage = 0
DeviceSplashDamageMaxRadius = 0
DeviceSplashDamageDelay = 0