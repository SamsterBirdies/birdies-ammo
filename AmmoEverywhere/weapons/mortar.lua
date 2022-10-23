dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbMortarHeavy", "context/HUD-heavymortar", nil, nil, nil, nil, path))
if not dlc2_Ammunition then dlc2_Ammunition = 
	{
		{
			AmmoSprites = { { Node = "Head", Sprite = "mortar-head", }, },
			Sprite = "hud-ammo-sbMortarHeavy",
			StringId = "Weapon.mortar2",
		}
	} 
end