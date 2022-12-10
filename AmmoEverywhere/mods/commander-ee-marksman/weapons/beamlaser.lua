function sbAmmoBank()
	if ReloadBank then
		for k, v in pairs(dlc2_Ammunition) do
			if v.StringId and v.StringId == "Weapon.laser" then
				v.ReloadBank = ReloadBank
			end
		end
	end
end
RegisterApplyMod(sbAmmoBank)