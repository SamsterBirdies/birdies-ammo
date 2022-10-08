dofile("weapons/beamlaser.lua")
Sprites = {}
SelectionWidth = 450.0
SelectionHeight = 180.0
WeaponMass = 800.0
SelectionOffset = { -30.0, -180.5 }
Projectile = "ol_beam_focus"
DestroyEffect = "effects/mushroom_cloud.lua"
FireEffect = "mods/dlc2/effects/orbital_laser_source_fire_focus.lua"
BeamDuration = 4.3
ShowAimingGizmo = false
BarrelLength = 1
IncendiaryRadius = 375
IncendiaryRadiusHeated = 420
DeviceSplashDamage = 200
DeviceSplashDamageMaxRadius = 500
DeviceSplashDamageDelay = 0
StructureSplashDamage = 400
StructureSplashDamageMaxRadius = 500
ReloadTime = 45
EnergyFireCost = 10000/BeamDuration
FireStdDevAuto = 0.0
HitPoints = 800
Root =
{
	Name = "Laser",
	Angle = 0,
	Scale = 2,
	Pivot = { 0, -1 },
	PivotOffset = { 0, 0 },
--	PivotOffset = { -0.15, 0 },
	Sprite = path .. "/weapons/orbital/sattelite.png",
	UserData = 0,
	
	ChildrenInFront =
	{
		{
			Name = "Hardpoint0",
			Angle = 90,
--			Pivot = { 0.47, -0.16 },
			Pivot = { 0.5, 0 },
			PivotOffset = { 0, 0 },
		},
		{
			Name = "Chamber",
			Angle = 90,
			Pivot = { 0, -0.16 },
			PivotOffset = { 0, 0 },
		},
	},
}