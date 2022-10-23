dofile('ui/uihelper.lua')
table.insert(Sprites, ButtonSprite("hud-ammo-sbrocket", "context/HUD-rocket", nil, nil, nil, nil, path))
if not dlc2_Ammunition then dlc2_Ammunition = 
	{
		{
			AmmoSprites = { { Node = "Head", Sprite = "rocket-head", }, },
			Sprite = "hud-ammo-sbrocket",
			StringId = "Weapon.rocket",
		}
	} 
end