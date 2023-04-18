dofile("scripts/type.lua")
--globals
SBBA_PATH = path
local SBBA_AMMO_DEFAULT = --default device values. no longer global
{
	Icon = "hud-battery-icon",
	Detail = "hud-detail-battery",
	Enabled = true,
	BuildTimeIntermediate = 5,
	BuildTimeComplete = 20,
	ScrapPeriod = 1,
	MetalCost = 100,
	EnergyCost = 1000,
	MetalRepairCost = 100,
	EnergyRepairCost = 1000,
	MaxUpAngle = StandardMaxUpAngle,
	BuildOnGroundOnly = false,
	SelectEffect = "ui/hud/devices/ui_devices",
}
BuildQueueConcurrent["sbInf"] = 100000
BuildQueueConcurrent["sbMortarsInfinite"] = 1000

--fmj
table.insert(Sprites, DetailSprite("hud-detail-sbFMJ", "fmj", path))
table.insert(Sprites, ButtonSprite("hud-sbFMJ-icon", "HUD/HUD-fmj", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("ammo_decoy"),
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbFMJ",
			dlc2_BuildQueue = "sbInf",
			FileName = path .. "/devices/ammo_fmj.lua",
			Detail = "hud-detail-sbFMJ",
			Icon = "hud-sbFMJ-icon",
			MetalCost = 300,
			EnergyCost = 3000,
			Prerequisite = "upgrade",
			Enabled = true,
			BuildTimeComplete = 35,
			PopulationCap = 1,
		}
	)
)
--mortars

table.insert(Sprites, DetailSprite("hud-detail-sbMortarNapalm", "mortarNapalm", path))
table.insert(Sprites, ButtonSprite("hud-sbMortarNapalm-icon", "HUD/HUD-mortarNapalm", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("ammo_decoy"),
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbMortarNapalm",
			dlc2_BuildQueue = "sbMortarsInfinite",
			FileName = path .. "/devices/ammo_mortarNapalm.lua",
			Detail = "hud-detail-sbMortarNapalm",
			Icon = "hud-sbMortarNapalm-icon",
			MetalCost = 300,
			EnergyCost = 3000,
			Prerequisite = "upgrade",
			Enabled = true,
			BuildTimeComplete = 26,
			PopulationCap = 1,
		}
	)
)
table.insert(Sprites, DetailSprite("hud-detail-sbMortarAirburst", "mortarAirburst", path))
table.insert(Sprites, ButtonSprite("hud-sbMortarAirburst-icon", "HUD/HUD-mortarAirburst", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("ammo_decoy"),
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbMortarAirburst",
			FileName = path .. "/devices/ammo_mortarAirburst.lua",
			dlc2_BuildQueue = "sbMortarsInfinite",
			Detail = "hud-detail-sbMortarAirburst",
			Icon = "hud-sbMortarAirburst-icon",
			MetalCost = 250,
			EnergyCost = 1500,
			Prerequisite = "armoury",
			Enabled = true,
			BuildTimeComplete = 20,
			PopulationCap = 1,
		}
	)
)
table.insert(Sprites, DetailSprite("hud-detail-sbMortarExtraHeavy", "mortarExtraHeavy", path))
table.insert(Sprites, ButtonSprite("hud-sbMortarExtraHeavy-icon", "HUD/HUD-mortarExtraHeavy", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("ammo_decoy"),
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbMortarExtraHeavy",
			FileName = path .. "/devices/ammo_mortarExtraHeavy.lua",
			dlc2_BuildQueue = "sbMortarsInfinite",
			Detail = "hud-detail-sbMortarExtraHeavy",
			Icon = "hud-sbMortarExtraHeavy-icon",
			MetalCost = 300,
			EnergyCost = 2000,
			Prerequisite = "munitions",
			Enabled = true,
			BuildTimeComplete = 26,
			PopulationCap = 1,
		}
	)
)
table.insert(Sprites, DetailSprite("hud-detail-sbMortarSmoke", "mortarSmoke", path))
table.insert(Sprites, ButtonSprite("hud-sbMortarSmoke-icon", "HUD/HUD-mortarSmoke", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("ammo_decoy"),
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbMortarSmoke",
			FileName = path .. "/devices/ammo_mortarSmoke.lua",
			dlc2_BuildQueue = "sbMortarsInfinite",
			Detail = "hud-detail-sbMortarSmoke",
			Icon = "hud-sbMortarSmoke-icon",
			MetalCost = 300,
			EnergyCost = 2000,
			Prerequisite = "factory",
			Enabled = true,
			BuildTimeComplete = 26,
			PopulationCap = 1,
		}
	)
)
table.insert(Sprites, DetailSprite("hud-detail-sbMortarAllInOne", "mortarAllInOne", path))
table.insert(Sprites, ButtonSprite("hud-sbMortarAllInOne-icon", "HUD/HUD-mortarAllInOne", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("ammo_decoy"),
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbMortarAllInOne",
			FileName = path .. "/devices/ammo_mortarAllInOne.lua",
			dlc2_BuildQueue = "sbMortarsInfinite",
			Detail = "hud-detail-sbMortarAllInOne",
			Icon = "hud-sbMortarAllInOne-icon",
			MetalCost = 400,
			EnergyCost = 3000,
			Prerequisite = {{"ammo_sbMortarAirburst","ammo_sbMortarNapalm","ammo_sbMortarExtraHeavy","ammo_sbMortarSmoke"}},
			Enabled = true,
			BuildTimeComplete = 30,
			PopulationCap = 1,
		}
	)
)
--harpoon
if FindDevice("ammo_decoy") then
	table.insert(Sprites, DetailSprite("hud-detail-sbFirework", "firework", path))
	table.insert(Sprites, ButtonSprite("hud-sbFirework-icon", "HUD/HUD-firework", nil, ButtonSpriteBottom, nil, nil, path))
	table.insert(Devices, IndexOfDevice("ammo_decoy") + 1,
		InheritType(FindDevice("ammo_decoy"),nil,
			{	
				SaveName = "ammo_sbFirework",
				dlc2_BuildQueue = "dlc2_harpoon",
				FileName = path .. "/devices/ammo_firework.lua",
				Detail = "hud-detail-sbFirework",
				Icon = "hud-sbFirework-icon",
				MetalCost = 200,
				EnergyCost = 2500,
				Prerequisite = "armoury",
				Enabled = true,
				BuildTimeComplete = 45,
				PopulationCap = 6,
			}
		)
	)
	--harpoon harpoon
	table.insert(Sprites, DetailSprite("hud-detail-sbHarpoon", "harpoon", path))
	table.insert(Sprites, ButtonSprite("hud-sbHarpoon-icon", "HUD/HUD-harpoon", nil, ButtonSpriteBottom, nil, nil, path))
	table.insert(Devices, IndexOfDevice("ammo_sbFirework") + 1,
		InheritType(FindDevice("ammo_decoy"),nil,
			{	
				SaveName = "ammo_sbHarpoon",
				dlc2_BuildQueue = "dlc2_harpoon",
				FileName = path .. "/devices/ammo_harpoon.lua",
				Detail = "hud-detail-sbHarpoon",
				Icon = "hud-sbHarpoon-icon",
				BuildTimeComplete = 35,
				MetalCost = 250,
				EnergyCost = 2000,
				Prerequisite = "upgrade",
				Enabled = true,
				Upgrades = 
				{
					{
						Enabled = false,
						SaveName = "sbHarpoonInterWeapon",
						MetalCost = 0,
						EnergyCost = 0,
						BuildDuration = 0,
					},
					{
						Enabled = false,
						SaveName = "sbHarpoonInterDevice",
						MetalCost = 0,
						EnergyCost = 0,
						BuildDuration = 0,
					},
					{
						Enabled = false,
						SaveName = "sbHarpoonInterAmmo",
						MetalCost = 0,
						EnergyCost = 0,
						BuildDuration = 0,
					},
				}
			}
		)
	)
	--harpoon inter ammo
	table.insert(Devices,
		InheritType(SBBA_AMMO_DEFAULT,nil,
			{	
				SaveName = "sbHarpoonInterAmmo",
				FileName = path .. "/devices/harpoonInterAmmo.lua",
				MetalCost = 0,
				EnergyCost = 0,
				Enabled = false,
				BuildTimeComplete = 0,
				Upgrades = {},
			}
		)
	)
	RegisterApplyMod(function()
		local sbHarpoonInterAmmo = FindDevice("sbHarpoonInterAmmo")
		for k, v in pairs(Devices) do
			if v.SaveName ~= "sbHarpoonInterAmmo" then
				if v.BuildOnGroundOnly or v.BuildOnOreOnly then
					--pass
				else
					table.insert(sbHarpoonInterAmmo.Upgrades,
					{
						Enabled = false,
						SaveName = v.SaveName,
						Prerequisite = "sbHarpoonInterAmmo",
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
end
--runway
if FindDevice("ammo_nighthawk") then
	--apache
	table.insert(Sprites, DetailSprite("hud-detail-sbApache", "apache", path))
	table.insert(Sprites, ButtonSprite("hud-sbApache-icon", "HUD/HUD-apache", nil, ButtonSpriteBottom, nil, nil, path))
	table.insert(Devices, IndexOfDevice("ammo_nighthawk") + 1,
		InheritType(FindDevice("ammo_nighthawk"),nil,
			{	
				SaveName = "ammo_sbApache",
				FileName = path .. "/devices/ammo_apache.lua",
				dlc2_BuildQueue = "dlc2_runway",
				Detail = "hud-detail-sbApache",
				Icon = "hud-sbApache-icon",
				MetalCost = 400,
				EnergyCost = 5000,
				Prerequisite = {{"munitions","factory"}},
				Enabled = true,
				BuildTimeComplete = 110,
				Upgrades =
				{
					{
						Enabled = false,
						SaveName = "ammo_sbApacheFireable",
						MetalCost = 0,
						EnergyCost = 0,
					}
				},
			}
		)
	)
	BuildQueueConcurrent["sbRunwayReload"] = 1
	table.insert(Devices,
		InheritType(FindDevice("ammo_sbApache"),nil,
			{	
				SaveName = "ammo_sbApacheReturned",
				FileName = path .. "/devices/ammo_apacheReturned.lua",
				dlc2_BuildQueue = "sbRunwayReload",
				MetalCost = 0,
				EnergyCost = 0,
				Enabled = false,
				BuildTimeComplete = 20,
				Upgrades =
				{
					{
						Enabled = false,
						SaveName = "ammo_sbApacheFireable",
						MetalCost = 0,
						EnergyCost = 0,
					}
				},
			}
		)
	)
	FindDevice("ammo_sbApacheReturned").Prerequisite = nil
	table.insert(Devices,
		InheritType(FindDevice("ammo_sbApache"),nil,
			{	
				SaveName = "ammo_sbApacheFireable",
				FileName = path .. "/devices/ammo_apacheFireable.lua",
				dlc2_BuildQueue = "sbInf",
				MetalCost = 0,
				EnergyCost = 0,
				Enabled = false,
				BuildTimeComplete = 0.001,
			}
		)
	)
	FindDevice("ammo_sbApacheFireable").Prerequisite = nil
	--b2
	table.insert(Sprites, DetailSprite("hud-detail-sbB2", "b2", path))
	table.insert(Sprites, ButtonSprite("hud-sbB2-icon", "HUD/HUD-b2", nil, ButtonSpriteBottom, nil, nil, path))
	table.insert(Devices, IndexOfDevice("ammo_nighthawk") + 1,
		InheritType(FindDevice("ammo_nighthawk"),nil,
			{	
				SaveName = "ammo_sbB2",
				FileName = path .. "/devices/ammo_b2.lua",
				dlc2_BuildQueue = "dlc2_runway",
				Detail = "hud-detail-sbB2",
				Icon = "hud-sbB2-icon",
				MetalCost = 200,
				EnergyCost = 6000,
				Prerequisite = "factory",
				Enabled = true,
				BuildTimeComplete = 85,
			}
		)
	)
	--bomb glider
	table.insert(Sprites, DetailSprite("hud-detail-sbBombGlider", "bombGlider", path))
	table.insert(Sprites, ButtonSprite("hud-sbBombGlider-icon", "HUD/HUD-bombGlider", nil, ButtonSpriteBottom, nil, nil, path))
	table.insert(Devices, IndexOfDevice("ammo_thunderbolt"),
		InheritType(FindDevice("ammo_nighthawk"),nil,
			{	
				SaveName = "ammo_sbBombGlider",
				FileName = path .. "/devices/ammo_bombGlider.lua",
				dlc2_BuildQueue = "dlc2_runway",
				Detail = "hud-detail-sbBombGlider",
				Icon = "hud-sbBombGlider-icon",
				MetalCost = 50,
				EnergyCost = 500,
				Prerequisite = "munitions",
				Enabled = true,
				BuildTimeComplete = 8,
			}
		)
	)
	--biplane
	table.insert(Sprites, DetailSprite("hud-detail-sbBiplaneFlechette", "biplane", path))
	table.insert(Sprites, ButtonSprite("hud-sbBiplaneFlechette-icon", "HUD/HUD-biplaneFlechette", nil, ButtonSpriteBottom, nil, nil, path))
	table.insert(Devices, IndexOfDevice("ammo_sbBombGlider"),
		InheritType(FindDevice("ammo_nighthawk"),nil,
			{	
				SaveName = "ammo_sbBiplane",
				FileName = path .. "/devices/ammo_biplane.lua",
				dlc2_BuildQueue = "dlc2_runway",
				Detail = "hud-detail-sbBiplaneFlechette",
				Icon = "hud-sbBiplaneFlechette-icon",
				MetalCost = 75,
				EnergyCost = 750,
				Prerequisite = "workshop",
				Enabled = true,
				BuildTimeComplete = 18,
			}
		)
	)
end
--lasers
BuildQueueConcurrent["sbBattery"] = 1
table.insert(Sprites, DetailSprite("hud-detail-sbBattery", "battery", path))
table.insert(Sprites, ButtonSprite("hud-sbBattery-icon", "HUD/HUD-battery", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Devices, IndexOfDevice("ammo_orbital_sweep"),
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbBattery",
			dlc2_BuildQueue = "sbBattery",
			FileName = path .. "/devices/ammo_battery.lua",
			Detail = "hud-detail-sbBattery",
			Icon = "hud-sbBattery-icon",
			MetalCost = 300,
			EnergyCost = 2000,
			Prerequisite = "factory",
			Enabled = true,
			BuildTimeComplete = 37,
		}
	)
)
if FindDevice("ammo_orbital_sweep") then
	BuildQueueConcurrent["sbTracer"] = 1
	table.insert(Sprites, DetailSprite("hud-detail-sbOrbitalTracer", "orbitalTracer", path))
	table.insert(Sprites, ButtonSprite("hud-sbOrbitalTracer-icon", "HUD/HUD-orbitalTracer", nil, ButtonSpriteBottom, nil, nil, path))
	table.insert(Devices, IndexOfDevice("ammo_orbital_sweep"),
		InheritType(FindDevice("ammo_orbital_sweep"),nil,
			{	
				SaveName = "ammo_sbOrbitalTracer",
				dlc2_BuildQueue = "sbTracer",
				FileName = path .. "/devices/ammo_orbitalTracer.lua",
				Detail = "hud-detail-sbOrbitalTracer",
				Icon = "hud-sbOrbitalTracer-icon",
				MetalCost = 30,
				EnergyCost = 800,
				Prerequisite = "upgrade",
				Enabled = true,
				BuildTimeComplete = 10,
				Upgrades = {},
			}
		)
	)
	table.insert(Sprites, DetailSprite("hud-detail-sbOrbitalArtillery", "orbitalArtillery", path))
	table.insert(Sprites, ButtonSprite("hud-sbOrbitalArtillery-icon", "HUD/HUD-orbitalArtillery", nil, ButtonSpriteBottom, nil, nil, path))
	table.insert(Devices, IndexOfDevice("ammo_orbital_focus") + 1,
		InheritType(FindDevice("ammo_orbital_sweep"),nil,
			{	
				SaveName = "ammo_sbOrbitalArtillery",
				dlc2_BuildQueue = "dlc2_ol_ammo",
				FileName = path .. "/devices/ammo_orbitalArtillery.lua",
				Detail = "hud-detail-sbOrbitalArtillery",
				Icon = "hud-sbOrbitalArtillery-icon",
				MetalCost = 300,
				EnergyCost = 8000,
				Prerequisite = "munitions",
				Enabled = true,
				BuildTimeComplete = 125,
				Upgrades = {},
			}
		)
	)
end
--rocket ammo
table.insert(Sprites, ButtonSprite("hud-sbRocketCannon-icon", "HUD/HUD-rocketCannon", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, DetailSprite("hud-detail-sbRocketCannon", "rocketCannon", path))
table.insert(Devices, IndexOfDevice("ammo_sbFirework") + 2,
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbRocketCannon",
			dlc2_BuildQueue = "sbInf",
			FileName = path .. "/devices/ammo_rocketCannon.lua",
			Detail = "hud-detail-sbRocketCannon",
			Icon = "hud-sbRocketCannon-icon",
			MetalCost = 400,
			EnergyCost = 3000,
			Prerequisite = "munitions",
			Enabled = true,
			BuildTimeComplete = 50,
			PopulationCap = 1,
		}
	)
)
BuildQueueConcurrent["sbRocket"] = 1
table.insert(Sprites, ButtonSprite("hud-sbRocketNuke-icon", "HUD/HUD-rocketNuke", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, DetailSprite("hud-detail-sbRocketNuke", "rocketNuke", path))
table.insert(Devices, IndexOfDevice("ammo_sbRocketCannon") + 1,
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbRocketNuke",
			dlc2_BuildQueue = "sbRocket",
			FileName = path .. "/devices/ammo_rocketNuke.lua",
			Detail = "hud-detail-sbRocketNuke",
			Icon = "hud-sbRocketNuke-icon",
			MetalCost = 100,
			EnergyCost = 3000,
			Prerequisite = "workshop",
			Enabled = true,
			BuildTimeComplete = 45,
		}
	)
)
--ultimates
table.insert(Sprites, ButtonSprite("hud-sbLeadHail-icon", "HUD/HUD-leadHail", nil, ButtonSpriteBottom, nil, nil, path))
table.insert(Sprites, DetailSprite("hud-detail-sbLeadHail", "leadHail", path))
table.insert(Devices,1,
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ult_sbmg",
			PopulationCap = 1,
			FileName = path .. "/devices/ultimate_machinegun.lua",
			Detail = "hud-detail-sbLeadHail",
			Icon = "hud-sbLeadHail-icon",
			MetalCost = 100,
			EnergyCost = 2000,
			Enabled = true,
			BuildTimeComplete = 40,
		}
	)
)

--[[
BuildQueueConcurrent["sbGrapeshot"] = 1
table.insert(Devices, IndexOfDevice("ammo_sbBattery"),
	InheritType(SBBA_AMMO_DEFAULT,nil,
		{	
			SaveName = "ammo_sbGrapeshot",
			dlc2_BuildQueue = "sbGrapeshot",
			FileName = path .. "/devices/ammo_grapeshot.lua",
			Detail = "hud-detail-sbRocketCannon",
			Icon = "hud-sbRocketCannon-icon",
			MetalCost = 200,
			EnergyCost = 3000,
			Prerequisite = "munitions",
			Enabled = true,
			BuildTimeComplete = 30,
		}
	)
)
]]

--birdies guns
function sbAmmoApplyMod()
	if sb_BIRDIES_GUNS then
		--Log("Birdies guns enalbed")
		table.insert(Devices, 1,
			InheritType(FindDevice("ammo_decoy"),nil,
				{	
					SaveName = "ammo_sbArrowBundle",
					FileName = SBBA_PATH .. "/devices/bg/ammo_arrowBundle.lua",
					Icon = "hud-sniper-icon",
					MetalCost = 75,
					EnergyCost = 500,
					Prerequisite = "upgrade",
					Enabled = true,
					BuildTimeComplete = 10,
				}
			)
		)
	end
end

--RegisterApplyMod(sbAmmoApplyMod)