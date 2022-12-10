function sbAmmoBank()
	if ReloadBank then
		for k, v in pairs(dlc2_Ammunition) do
			if v.StringId and v.StringId == "Weapon.mortar" then
				v.ReloadBank = ReloadBank
			end
		end
	end
end
RegisterApplyMod(sbAmmoBank)