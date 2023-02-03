dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbStandard0", "context/HUD-lead", nil, nil, nil, nil, path))
if not dlc2_Ammunition then dlc2_Ammunition = 
	{
		{
			Sprite = "hud-ammo-sbStandard0",
			StringId = "Weapon.ammo_sbStandard",
		},
	} 
end