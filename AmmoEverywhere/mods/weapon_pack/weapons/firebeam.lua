
--extended beam effects
local beamMP = 1.2
BeamEndEffectTime = BeamEndEffectTime * beamMP
BeamTable = {}
GenerateBeamTable(5, 0.05, 1)
dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbbeam0", "context/HUD-laser", nil, nil, nil, nil, path))
if not dlc2_Ammunition then dlc2_Ammunition = 
	{
		{
			Sprite = "hud-ammo-sbbeam0",
			StringId = "Weapon.firebeam"
		}
	} 
end

