dofile('ui/uihelper.lua')
--[[
table.insert(Sprites, ButtonSprite("hud-ammo-sbcannon", "context/HUD-cannon", nil, nil, nil, nil, path))
if not dlc2_Ammunition then dlc2_Ammunition = 
	{
		{
			Sprite = "hud-ammo-sbcannon",
			StringId = "Weapon.cannon",
		}
	} 
end
table.insert(dlc2_Ammunition,
	{
		Sprite = "hud-ammo-sbapcannon",
		StringId = "AP CANNON",
		Projectile = "sbAPCannon",
	}
)
table.insert(dlc2_Ammunition,
	{
		Sprite = "hud-ammo-sbhecannon",
		StringId = "HE CANNON",
		Projectile = "sbHECannon",
	}
)]]