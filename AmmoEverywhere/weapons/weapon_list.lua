dofile("scripts/type.lua")
--globals
SBBA_PATH = path
local sbOrbArtillery = FindWeapon("minigun")
if sbOrbArtillery then
	table.insert(Weapons,
		InheritType(FindWeapon("minigun"),nil,
			{	
				SaveName = "sbOrbitalArtillery_source",
				FileName = path .. "/weapons/orbitalArtillery.lua",
				MetalCost = 0,
				EnergyCost = 0,
				BuildTimeComplete = 0.0,
				Prerequisite = nil,
				Enabled = false,
				dlc2_BuildAnywhere = true,
				RequiresSpotterToFire = false,
				AnimationScript = nil,
				BuildOnGroundOnly = true,
				Upgrades = {},
			}
		)
	)
	FindWeapon("sbOrbitalArtillery_source").Prerequisite = nil
	table.insert(Weapons,
		InheritType(FindWeapon("minigun"),nil,
			{	
				SaveName = "sbOrbitalArtillerySpread_source",
				FileName = path .. "/weapons/orbitalArtillerySpread.lua",
				MetalCost = 0,
				EnergyCost = 0,
				BuildTimeComplete = 0.0,
				Prerequisite = nil,
				Enabled = false,
				dlc2_BuildAnywhere = true,
				RequiresSpotterToFire = false,
				AnimationScript = nil,
				BuildOnGroundOnly = true,
				Upgrades = {},
			}
		)
	)
	FindWeapon("sbOrbitalArtillerySpread_source").Prerequisite = nil
end
local sbHarpoon = FindWeapon("harpoon")
if sbHarpoon then
	--this weapon can upgrade into all weapon types instantly. If not found, will upgrade to device version and continue there.
	table.insert(Weapons,
		InheritType(FindWeapon("minigun"),nil,
			{	
				SaveName = "sbHarpoonInterWeapon",
				FileName = path .. "/weapons/harpoonInterWeapon.lua",
				MetalCost = 0,
				EnergyCost = 0,
				BuildTimeComplete = 0.0,
				Prerequisite = nil,
				Enabled = false,
				Upgrades = {},
			}
		)
	)
	--can steal the orbital sattelite as a personal weapon
	table.insert(Weapons,
		InheritType(FindWeapon("laser"),nil,
			{	
				SaveName = "sbSatteliteWeapon",
				FileName = path .. "/weapons/sattelite.lua",
				MetalCost = 0,
				EnergyCost = 0,
				BuildTimeComplete = 0.0,
				Prerequisite = nil,
				Enabled = false,
				Upgrades = {},
				ObserverBuildEvent = true,
			}
		)
	)
	FindWeapon("sbHarpoonInterWeapon").Prerequisite = nil
	RegisterApplyMod(function()
		local sbHarpoonInterWeapon = FindWeapon("sbHarpoonInterWeapon")
		for k, v in pairs(Weapons) do
			if v.SaveName ~= "sbHarpoonInterWeapon" then
				if v.BuildOnGroundOnly or v.BuildOnOreOnly 
				or v.SaveName == "sbOrbitalArtillery_source" or v.SaveName == "sbOrbitalArtillerySpread_source"
				or v.SaveName == "sbshotgunminigun"
				then
					--pass
				else
					table.insert(sbHarpoonInterWeapon.Upgrades,
					{
						Enabled = false,
						SaveName = v.SaveName,
						MetalCost = 0,
						Prerequisite = "sbHarpoonInterWeapon",
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
end