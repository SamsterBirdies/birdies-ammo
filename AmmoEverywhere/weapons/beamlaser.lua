if not dlc2_Ammunition then dlc2_Ammunition = {{}} end
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbBattery2", "context/HUD-battery", nil, nil, nil, nil, path))

--extended beam effects
local beamMP = 1.2
BeamEndEffectTime = BeamEndEffectTime * beamMP

table.insert(dlc2_Ammunition, 
{ 
	Sprite = "hud-ammo-sbBattery2",
	Devices = { "ammo_sbBattery" },
	Projectile = "sbLaserEXT",
	BeamDuration = BeamDuration * beamMP,
	--EnergyFireCost = 5000 / 1.8,
})
