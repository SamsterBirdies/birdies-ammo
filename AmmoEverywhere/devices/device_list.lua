dofile("scripts/type.lua")
--When weapon is not found it will upgrade to this. Can upgrade to any device instantly. if not found, will upgrade to ammo and continue there.
table.insert(Devices,
	InheritType(FindDevice("battery"),nil,
		{	
			SaveName = "sbHarpoonInterDevice",
			FileName = path .. "/devices/harpoonInterDevice.lua",
			MetalCost = 0,
			EnergyCost = 0,
			Enabled = false,
			BuildTimeComplete = 0,
			Upgrades = {},
		}
	)
)
RegisterApplyMod(function()
	local sbHarpoonInterDevice = FindDevice("sbHarpoonInterDevice")
	for k, v in pairs(Devices) do
		if v.SaveName ~= "sbHarpoonInterDevice" then
			if v.BuildOnGroundOnly or v.BuildOnOreOnly then
				--pass
			else
				table.insert(sbHarpoonInterDevice.Upgrades,
				{
					Enabled = false,
					SaveName = v.SaveName,
					Prerequisite = "sbHarpoonInterDevice",
					MetalCost = 0,
					EnergyCost = 0,
					BuildDuration = 0,
				})
				if not v.Upgrades then v.Upgrades = {} end
				table.insert(v.Upgrades,
				{
					Enabled = false,
					SaveName = "sbHarpoonInterDevice",
					MetalCost = 0,
					EnergyCost = 0,
					BuildDuration = 0,
				})
			end
		end
	end
end)