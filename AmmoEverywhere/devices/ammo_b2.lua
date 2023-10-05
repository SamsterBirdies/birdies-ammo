dofile("mods/dlc2/devices/ammo_nighthawk.lua")
Sprites = {}
ConsumeEffect = "mods/dlc2/effects/ammo_consumption.lua"
DestroyEffect = "mods/dlc2/effects/nighthawk_explode.lua"
HitPoints = 90
Root = 
{
	Sprite = path .. "/devices/ammo/b2Ammo.png",
	Name = "ammo_b2",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.5},
	PivotOffset = {0,0}
}

dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbB2", "context/HUD-b2", nil, nil, nil, nil, path))
table.insert(Sprites,
	{
		Name = "sbRunwayB2",
		States =
		{
			Normal = { Frames = { { texture = path .. "/weapons/b2/baseRunway.png" }, mipmap = true, }, },
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
		AmmoSprites = { { Node = "Head", Sprite = "sbRunwayB2", }, },
		Sprite = "hud-ammo-sbB2",
		Devices = { {Name = "ammo_sbB2", Consume = true}, },
		Weapons = { "runway", "runway2" },
		ReloadTime = 5,
		--MetalFireCost = 100,
		--EnergyFireCost = 2000,
		Projectile = "sbB2",
		HeatPerRound = 0.65,
	}
}