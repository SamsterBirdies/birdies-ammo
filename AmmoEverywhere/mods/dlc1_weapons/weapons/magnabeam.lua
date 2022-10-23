
local beamMP = 2

BeamEndEffectTime = BeamEndEffectTime * beamMP

BeamTable = {}
GenerateBeamTable(30, 0.05, 1)

dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbbeam2", "context/HUD-laser", nil, nil, nil, nil, path))
if not dlc2_Ammunition then dlc2_Ammunition = 
	{
		{
			Sprite = "hud-ammo-sbbeam2",
			StringId = "Weapon.magnabeam"
		}
	} 
end
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
