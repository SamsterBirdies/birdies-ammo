dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbincmortar", "context/HUD-incmortar", nil, nil, nil, nil, path))
if not dlc2_Ammunition then dlc2_Ammunition = 
	{
		{
			Sprite = "hud-ammo-sbincmortar",
			StringId = "Weapon.mortar",
		}
	} 
end