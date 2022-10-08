
local beamMP = 2

BeamEndEffectTime = BeamEndEffectTime * beamMP

BeamTable = {}
GenerateBeamTable(30, 0.05, 1)

if not dlc2_Ammunition then dlc2_Ammunition = {{}} end
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbBattery3", "context/HUD-battery", nil, nil, nil, nil, path))

--extended beam effects
local beamMP = 2
BeamEndEffectTime = BeamEndEffectTime * beamMP

table.insert(dlc2_Ammunition, 
{ 
	Sprite = "hud-ammo-sbBattery3",
	Devices = { "ammo_sbBattery" },
	BeamDuration = BeamDuration * beamMP,
	--EnergyFireCost = 5000 / 1.8,
})
