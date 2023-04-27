dofile("mods/dlc2/devices/ammo_decoy.lua")
Sprites = {}
HitPoints = 15
StructureSplashDamage = 0
DeviceSplashDamage = 0
IncendiaryRadius = 0
IncendiaryRadiusHeated = 0
DestroyEffect = "effects/battery_explode.lua"
IgnitePlatformOnDestruct = false
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbFMJ", "context/HUD-fmj", nil, nil, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-ammo-sbStandard", "context/HUD-lead", nil, nil, nil, nil, path))
table.insert(Sprites, ButtonSprite("hud-ammo-sbLeadHail", "context/HUD-leadHail", nil, nil, nil, nil, path))
dlc2_Ammunition =
{
	{ 
		Sprite = "hud-ammo-sbStandard",
		Weapons = { "machinegun" },
		StringId = "Weapon.ammo_sbStandard",
		Projectile = "sbmachinegunfix",
	},
	{ 
		Sprite = "hud-ammo-sbFMJ",
		Weapons = { "machinegun" },
		Devices = { { Name = "ammo_sbFMJ", Consume = false } }, 
		Projectile = "sbFMJmachinegun",
		MetalFireCost = 2,
		EnergyFireCost = 33,
	},
	{ 
		Sprite = "hud-ammo-sbLeadHail",
		Weapons = { "machinegun" },
		Devices = { { Name = "ult_sbmg", Consume = true } }, 
		Projectile = "sbult_mg1",
		FireEffect = path .. "/effects/call_in.lua",
		RoundsEachBurst = 1,
		ReloadTime = 30,
		MetalFireCost = 0,
		EnergyFireCost = 30,
	},
	{ 
		Sprite = "hud-ammo-sbFMJ",
		Weapons = { "sniper" },
		Devices = { { Name = "ammo_sbFMJ", Consume = false } }, 
		Projectile = "sbFMJsniper",
		MetalFireCost = 3,
		EnergyFireCost = 40,
	},
	{ 
		Sprite = "hud-ammo-sbFMJ",
		Weapons = { "minigun" },
		Devices = { { Name = "ammo_sbFMJ", Consume = false } }, 
		Projectile = "sbFMJminigun",
		MetalFireCost = 23,
		EnergyFireCost = 320,
	},
	{ 
		Sprite = "hud-ammo-sbFMJ",
		Weapons = { "shotgun" },
		Devices = { { Name = "ammo_sbFMJ", Consume = false } }, 
		Projectile = "sbFMJshotgun",
		MetalFireCost = 24,
	},
}
Root = 
{
	Sprite = path .. "/devices/ammo/fmjAmmo.png",
	Name = "ammo_fmj",
	ChildrenInFront = {},
	Angle = 0,
	Pivot = {0,-0.54},
	PivotOffset = {0,0}
}