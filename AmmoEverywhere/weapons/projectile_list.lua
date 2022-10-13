dofile("scripts/type.lua")
dofile("scripts/sprites_utility.lua")
--globals
SBBA_PATH = path
--start emp
local sbMegaEMP = DeepCopy(FindProjectile("rocketemp"))
if sbMegaEMP then
	sbMegaEMP.SaveName = "sbMegaEMP"
	sbMegaEMP.EMPRadius = sbMegaEMP.EMPRadius * 2.5
	sbMegaEMP.EMPDuration = sbMegaEMP.EMPDuration * 2
	sbMegaEMP.ProjectileDamage = sbMegaEMP.ProjectileDamage * 3
	sbMegaEMP.ProjectileSplashDamage = sbMegaEMP.ProjectileSplashDamage * 3
	table.insert(Projectiles, sbMegaEMP)
end
---------------------START MORTARS----------------------------------------
--start airburst mortar
local sbAirburstS1 = DeepCopy(FindProjectile("shrapnel"))
if sbAirburstS1 then
	sbAirburstS1.SaveName = "sbAirburstS1"
	sbAirburstS1.WeaponDamageBonus = sbAirburstS1.WeaponDamageBonus * 4
	SetDamageMultiplier("sbAirburstS1", { SaveName = "machinegun", Direct = 3 })
	table.insert(Projectiles, sbAirburstS1)
	MakeFlamingVersion("sbAirburstS1", 1.25,	0.2, flamingSniperTrail, nil, smallArmsFlare)
end
local sbAirburstP1 = DeepCopy(FindProjectile("mortar2"))
if sbAirburstP1 then
	sbAirburstP1.SaveName = "sbAirburstP1"
	sbAirburstP1.CollisionLookaheadDist = 160
	sbAirburstP1.ProjectileDamage = sbAirburstP1.ProjectileDamage / 2
	sbAirburstP1.ProjectileSplashDamage = sbAirburstP1.ProjectileSplashDamage / 2
	sbAirburstP1.TrailEffect = path .. "/effects/trail_mortarAirburst.lua"
	sbAirburstP1.Effects.Impact = 
	{
		['firebeam'] = { Effect = "mods/weapon_pack/effects/flak_explode.lua", Projectile = { Count = 15, Type = "flamingsbAirburstS1", Speed = 7000, StdDev = 1.5 }, Offset = -160, Terminate = true, },
		['default'] = { Effect = "mods/weapon_pack/effects/flak_explode.lua", Projectile = { Count = 15, Type = "sbAirburstS1", Speed = 7000, StdDev = 1.5 }, Offset = -160, Terminate = true, }
	}
	table.insert(Projectiles, sbAirburstP1)
end
--start napalm mortar
local sbNapalmMortar = DeepCopy(FindProjectile("mortar"))
if sbNapalmMortar then
	sbNapalmMortar.SaveName = "sbba_NapalmMortar"
	sbNapalmMortar.IncendiaryRadius = 100
	sbNapalmMortar.IncendiaryRadiusHeated = 110
	sbNapalmMortar.ProjectileDamage = 50
	sbNapalmMortar.ProjectileSplashDamage = 55
	sbNapalmMortar.AlwaysIncendiary = true
	sbNapalmMortar.Effects = 
	{
		Impact =
		{
			["antiair"] = "effects/mortar_air_burst.lua",
			["default"] = path .. "/effects/impact_napalm.lua",
		},
	}
	sbNapalmMortar.Projectile.Root.Sprite = path .. "/weapons/mortars/napalmProjectile.png"
	sbNapalmMortar.TrailEffect = path .. "/effects/trail_mortarNapalm.lua"
	table.insert(Projectiles, sbNapalmMortar)
	MakeFlamingVersion("sbba_NapalmMortar", 1.33, 3, flamingTrail, 150, nil, genericFlamingExpire)
end
--start extra heavy mortar
local sbExtraHeavyMortar = DeepCopy(FindProjectile("mortar2"))
if sbExtraHeavyMortar then
	sbExtraHeavyMortar.SaveName = "sbExtraHeavyMortar"
	sbExtraHeavyMortar.AntiAirHitpoints = 11
	sbExtraHeavyMortar.AntiAirDamage = 200
	sbExtraHeavyMortar.ProjectileDamage = sbExtraHeavyMortar.ProjectileDamage * 2
	sbExtraHeavyMortar.ProjectileSplashDamage = sbExtraHeavyMortar.ProjectileSplashDamage * 1.3
	sbExtraHeavyMortar.Impact = sbExtraHeavyMortar.Impact * 2
	sbExtraHeavyMortar.TrailEffect = path .. "/effects/trail_mortarExtraHeavy.lua"
	sbExtraHeavyMortar.Projectile.Root.Sprite = path .. "/weapons/mortars/extraheavy2.png"
	sbExtraHeavyMortar.Effects.Impact.default = "effects/impact_heavy.lua"
	table.insert(Projectiles, sbExtraHeavyMortar)
	MakeFlamingVersion("sbExtraHeavyMortar", 1.33, 3, flamingTrail, 50, nil, genericFlamingExpire)
end
--start smoke mortar (if moonshot weapons is enabled)
local sbMiniSmoke = DeepCopy(FindProjectile("smoke"))
if sbMiniSmoke then
	--smoke
	sbMiniSmoke.SaveName = "sbMiniSmoke"
	sbMiniSmoke.FieldRadius = 75.0
	sbMiniSmoke.ProjectileShootDownRadius = 75
	sbMiniSmoke.MaxAge = 7
	sbMiniSmoke.TrailEffect = path .. "/effects/trail_miniSmoke.lua"
	table.insert(Projectiles, sbMiniSmoke)
	--mortar projectile
	local sbSmokeMortar = DeepCopy(FindProjectile("mortar2"))
	if sbSmokeMortar then
		sbSmokeMortar.SaveName = "sbSmokeMortar"
		sbSmokeMortar.Projectile.Root.Sprite = path .. "/weapons/mortars/smoke2.png"
		sbSmokeMortar.TrailEffect = path .. "/effects/trail_mortarSmoke.lua"
		sbSmokeMortar.Effects.Impact = 
		{
			["firebeam"] = {Effect = "effects/mortar_air_burst.lua", Projectile = {Count = 1, Type = "sbMiniSmoke", Speed = 0.1, StdDev = 0}, Offset = 50, Terminate = true},
			["default"] = {Effect = "effects/mortar_air_burst.lua", Projectile = {Count = 1, Type = "sbMiniSmoke", Speed = 0.1, StdDev = 0}, Offset = 50, Terminate = true},
		}
		table.insert(Projectiles, sbSmokeMortar)
	end
end
--all in one mortar
table.insert(Sprites,
{
	Name = "sbAIOprojectileSprite",
			
	States =
	{
		Normal =  
		{  
			Frames =
			{
				{ texture = path .. "/weapons/mortars/allinone_sheet.png", top = 0/3, bottom = 1/3 },
				{ texture = path .. "/weapons/mortars/allinone_sheet.png", top = 1/3, bottom = 2/3 },
				{ texture = path .. "/weapons/mortars/allinone_sheet.png", top = 2/3, bottom = 3/3 },
				duration = 0.04,
				mipmap = true,
			},
			NextState = "Normal",
		},
	},
})
local sbAIOmortar = DeepCopy(FindProjectile("sbExtraHeavyMortar"))
if sbAIOmortar then
	sbAIOmortar.SaveName = "sbAIOmortarP1"
	sbAIOmortar.ProjectileDamage = 0
	sbAIOmortar.AntiAirHitpoints = 4
	sbAIOmortar.ProjectileShootDownRadius = sbAIOmortar.ProjectileShootDownRadius * 1.4
	sbAIOmortar.ProjectileSplashDamage = 0
	sbAIOmortar.IgnitesBackgroundMaterials = true
	sbAIOmortar.CollisionLookaheadDist = 160
	sbAIOmortar.Projectile.Root.Sprite = "sbAIOprojectileSprite"
	sbAIOmortar.TrailEffect = path .. "/effects/trail_mortarAIO.lua"
	sbAIOmortar.Effects.Impact =
	{
		["firebeam"] = {Effect = "effects/impact_heavy.lua", Projectile = {Count = 1, Type = "flamingsbAIOmortarP2", StdDev = 0}, Offset = 50, Terminate = true},
		["default"] = {Effect = "effects/impact_heavy.lua", Projectile = {Count = 1, Type = "sbAIOmortarP2", StdDev = 0}, Offset = -160, Terminate = true},
	}
	table.insert(Projectiles, sbAIOmortar)
end
local sbAIOmortarP2 = DeepCopy(FindProjectile("sbExtraHeavyMortar"))
if sbAIOmortarP2 then
	sbAIOmortarP2.SaveName = "sbAIOmortarP2"
	sbAIOmortarP2.AntiAirHitpoints = 4
	sbAIOmortarP2.IncendiaryRadius = 100
	sbAIOmortarP2.IncendiaryRadiusHeated = 110
	sbAIOmortarP2.AlwaysIncendiary = true
	sbAIOmortarP2.ProjectileIncendiary = true
	sbAIOmortarP2.IgnitesBackgroundMaterials = true
	sbAIOmortarP2.Projectile.Root.Sprite = "sbAIOprojectileSprite"
	sbAIOmortarP2.TrailEffect = path .. "/effects/trail_mortarAIO.lua"
	sbAIOmortarP2.Effects.Age =
	{
		t1 = { Effect = "mods/weapon_pack/effects/flak_explode.lua", Projectile = { Count = 15, Type = "sbAirburstS1", Speed = 7000, StdDev = 1.5 }, Offset = 0, Terminate = false},
	}
	if FindProjectile("sbMiniSmoke") then --if moonshot weapons is enabled then the smoke effect will take place.
		sbAIOmortarP2.Effects.Impact = 
		{
			["antiair"] = {Effect = "effects/mortar_air_burst.lua", Projectile = {Count = 1, Type = "sbMiniSmoke", Speed = 0.1, StdDev = 0}, Offset = 50, Terminate = true},
			["default"] = {Effect = path .. "/effects/impact_napalm.lua", Projectile = {Count = 1, Type = "sbMiniSmoke", Speed = 0.1, StdDev = 0}, Offset = 50, Terminate = true},
		}
	else
		sbAIOmortarP2.Effects.Impact = 
		{
			["antiair"] = "effects/mortar_air_burst.lua",
			["default"] = path .. "/effects/impact_napalm.lua",
		}
	end
	table.insert(Projectiles, sbAIOmortarP2)
	MakeFlamingVersion("sbAIOmortarP2", 1.33, 2.5, flamingTrail, 150, nil, genericFlamingExpire)
end
--------------------END MORTARS-------------------------------------------
--------------------START APACHE------------------------------------------
--only if high seas is enabled
if FindProjectile("nighthawk") or FindProjectile("thunderbolt") then
	--apache sprites
	table.insert(Sprites,
	{
		Name = "sbApacheRotorSpin",
				
		States =
		{
			Normal =  
			{  
				Frames =
				{
					{ texture = path .. "/weapons/helicopter/apacheRotor1.png" },
					{ texture = path .. "/weapons/helicopter/apacheRotor21.png" },
					{ texture = path .. "/weapons/helicopter/apacheRotor3.png" },
					{ texture = path .. "/weapons/helicopter/apacheRotor41.png" },
					
					duration = 0.04,
					mipmap = true,
				},
				NextState = "Normal",
			},
		},
	})
	table.insert(Sprites,
	{
		Name = "sbApacheTailRotorSpin",
				
		States =
		{
			Normal =  
			{  
				Frames =
				{
					{ texture = path .. "/weapons/helicopter/apacheTailRotor1.png" },
					{ texture = path .. "/weapons/helicopter/apacheTailRotor2.png" },
					{ texture = path .. "/weapons/helicopter/apacheTailRotor4.png" },
					{ texture = path .. "/weapons/helicopter/apacheTailRotor3.png" },
					
					duration = 0.04,
					mipmap = true,
				},
				NextState = "Normal",
			},
		},
	})
	--apache requisite projectiles
	--hydra rocket
	local sbApacheHydra = DeepCopy(FindProjectile("missile"))
	if sbApacheHydra then
		sbApacheHydra.SaveName = "sbApacheHydra"
		sbApacheHydra.Missile.RocketThrust = 140000
		SetDamageMultiplier("sbApacheHydra", {SaveName = "bracing", Direct = 2})
		sbApacheHydra.ProjectileIncendiary = false
		sbApacheHydra.Projectile.Root.Sprite = path .. "/weapons/helicopter/hydra.png"
		sbApacheHydra.Projectile.Root.Scale = 0.75
		--sbApacheHydra.Effects = DeepCopy(FindProjectile("bomb").Effects)
		table.insert(Projectiles, sbApacheHydra)
		MakeFlamingVersion("sbApacheHydra", 1.33, 2.5, flamingSwarmTrail, 75, nil, genericFlamingExpire)
	end
	--hellfire missile
	local sbApacheHellfire = DeepCopy(FindProjectile("missile2"))
	if sbApacheHellfire then
		sbApacheHellfire.SaveName = "sbApacheHellfire"
		sbApacheHellfire.Missile.RocketThrust = 135000
		sbApacheHellfire.ProjectileIncendiary = true
		sbApacheHellfire.AlwaysIncendiary = true
		sbApacheHellfire.IncendiaryRadius = 175
		sbApacheHellfire.IncendiaryRadiusHeated = 200
		sbApacheHellfire.ProjectileSplashDamageMaxRadius = 240
		sbApacheHellfire.ProjectileSplashDamage = 200
		sbApacheHellfire.Projectile.Root.Sprite = path .. "/weapons/helicopter/hellfire.png"
		sbApacheHellfire.Projectile.Root.ChildrenInFront[1].Pivot = {0, 0.5}
		if FindProjectile("paveway") then
			sbApacheHellfire.Effects = DeepCopy(FindProjectile("paveway").Effects)
		end
		table.insert(Projectiles, sbApacheHellfire)
		MakeFlamingVersion("sbApacheHellfire", 1.33, 2.5, flamingTrail, 225, nil, rocketFlamingExpire)
	end
	--open door test projectile
	local sbApacheS4 = DeepCopy(FindProjectile("sniper2"))
	if sbApacheS4 then
		sbApacheS4.SaveName = "sbApacheS4"
		sbApacheS4.ProjectileMass = 4
		sbApacheS4.ProjectileSprite = path .. "/blank.png"
		sbApacheS4.Impact = 0
		sbApacheS4.ProjectileDamage = 0
		sbApacheS4.WeaponDamageBonus = 0
		sbApacheS4.MaxAge = 0.5
		sbApacheS4.PenetrationDamage = 4000
		sbApacheS4.PenetrationSpeedMultiplier = 1
		sbApacheS4.Gravity = 0
		sbApacheS4.TrailEffect = nil
		sbApacheS4.Effects = {}
		table.insert(Projectiles, sbApacheS4)
	end
	local sbApacheP1 = DeepCopy(FindProjectile("rocket"))
	if sbApacheP1 then
		sbApacheP1.SaveName = "sbApacheP1"
		sbApacheP1.ProjectileDamage = 300
		sbApacheP1.ProjectileSplashDamage = 250
		sbApacheP1.ProjectileSplashDamageMaxRadius = 250
		sbApacheP1.ProjectileIncendiary = false
		sbApacheP1.IncendiaryRadius = 150
		sbApacheP1.IncendiaryRadiusHeated = 270
		sbApacheP1.ProjectileShootDownRadius = 60
		sbApacheP1.AntiAirHitpoints = 100
		sbApacheP1.AntiAirDamage = 400
		if FindProjectile("paveway") then
			sbApacheP1.Effects = DeepCopy(FindProjectile("paveway").Effects)
		end
		sbApacheP1.Effects.Impact.firebeam = {Effect = "effects/derrick_explode.lua", Terminate = true}
		sbApacheP1.Effects.Impact.antiair = {Effect = "effects/derrick_explode.lua", Terminate = true}
		sbApacheP1.Projectile =
		{
			Root =
			{
				Name = "Root",
				Angle = -83,
				Sprite = path .. "/weapons/helicopter/apacheBase2.png",
				PivotOffset = {-0.077844, -0.057971},
				Scale = 1.6,
				ChildrenInFront = 
				{
					{
						Name = "rotor",
						Angle = 0,
						Sprite = "sbApacheRotorSpin",
						Pivot = {0.077844, -0.188405},
						PivotOffset = {-0.077844, 0.188405},
						--Scale = 3,
					}
				},
				ChildrenBehind =
				{
					{
						Name = "tailrotor",
						Angle = 0,
						Sprite = "sbApacheTailRotorSpin",
						Pivot = {-0.330838, -0.123188},
						PivotOffset = {0.330838, 0.123188},
						--Scale = 3,
					}
				},
			}
		}
		sbApacheP1.Missile =
		{
			ThrustAngleExtent = 0.01,
			ErraticAngleExtentStdDev = 0.01,
			ErraticAngleExtentMax = 0.01,
			MaxSteerPerSecond = 0.01,
			MaxSteerPerSecondErratic = 0.01,
			ErraticAnglePeriodMean = 0.01,
			ErraticAnglePeriodStdDev = 0.01,
			RocketThrust = 20000,
			RocketThrustChange = 0,
			ErraticThrust = 0.01,
			CruiseTargetDistance = 300,
			CruiseTargetDuration = .5,
			TargetRearOffsetDistance = 100000,
			MinTargetUpdateDistance = 2000,
		}
		sbApacheP1.Effects.Age = 
		{
			t200 = { Effect = nil, Projectile = { Count = 1, Type = "sbApacheP2", StdDev = 0 }, Terminate = true, Splash = false,}
		}
		sbApacheP1.Gravity = 0
		sbApacheP1.FlipSpriteFacingLeft = true
		sbApacheP1.TrailEffect = path .. "/effects/trail_apache.lua"
		--phase 2
		local sbApacheP2 = DeepCopy(sbApacheP1)
		sbApacheP2.SaveName = "sbApacheP2"
		sbApacheP2.Missile.RocketThrust = 14000
		sbApacheP2.AntiAirHitpoints = 100
		sbApacheP2.dlc2_Bombs = nil
		local sbApacheS1 = { Effect = path .. "/effects/fire_20mmcannonApache.lua", Projectile = { Count = 1, Type = "cannon20mm", StdDev = 0.1, Speed = 7000 }, Terminate = false, Splash = false,}
		local sbApacheS2 = { Effect = path .. "/effects/apache_launchSmall.lua", Projectile = { Count = 1, Type = "sbApacheHydra", StdDev = 0.1, Speed = 2000 }, Terminate = false, Splash = false,}
		local sbApacheS3 = { Effect = path .. "/effects/apache_launchLarge.lua", Projectile = { Count = 1, Type = "sbApacheHellfire", StdDev = 0.1, Speed = 2000 }, Terminate = false, Splash = false,}
		sbApacheP2.Effects.Age = {}
		for i = 100, 2000, 200 do
			sbApacheP2.Effects.Age['t' .. tostring(i)] = sbApacheS1
		end
		for i = 2400, 3500, 150 do
			sbApacheP2.Effects.Age['t' .. tostring(i)] = sbApacheS2
		end
		sbApacheP2.Effects.Age['t4000'] = sbApacheS3
		sbApacheP2.Effects.Age['t4600'] = { Effect = path .. "/effects/apache_turn.lua", Projectile = { Count = 1, Type = "sbApacheP3", StdDev = 0, Speed = -1500 }, Terminate = true, Splash = false,}
		sbApacheP2.CollisionLookaheadDist = 150
		sbApacheP2.Effects.Impact.default = { Effect = nil, Projectile = { Count = 1, Type = "sbApacheP3", StdDev = 0, Speed = -1500 }, Offset = -150, Terminate = true, Splash = false,}
		--phase 3
		local sbApacheP3 = DeepCopy(sbApacheP1)
		sbApacheP3.SaveName = "sbApacheP3"
		sbApacheP3.TrailEffect = path .. "/effects/trail_apache_turn.lua"
		sbApacheP3.ProjectileType = "mortar"
		sbApacheP3.ProjectileDrag = 0.01
		sbApacheP3.AntiAirHitpoints = 75
		sbApacheP3.dlc2_Bombs = nil
		sbApacheP3.Missile = nil
		local sbApacheS4 = { Effect = nil, Projectile = { Count = 1, Type = "sbApacheS4", StdDev = 0, Speed = 10000 }, Terminate = false, Splash = false,}
		sbApacheP3.Effects.Age = {}
		for i = 100, 30000, 100 do
			sbApacheP3.Effects.Age['t' .. tostring(i)] = sbApacheS4
		end
		sbApacheP3.Effects.ImpactDevice =
		{
			['runway'] = {Effect = nil, Terminate = true, Splash = false},
			['runway2'] = {Effect = nil, Terminate = true, Splash = false},
		}
		sbApacheP3.DamageMultiplier =
		{
			{ SaveName = "runway", Direct = 0, Splash = 0 },
			{ SaveName = "runway2", Direct = 0, Splash = 0 },
		}
		sbApacheP3.ProjectileDamage = 200
		sbApacheP3.ProjectileSplashDamage = 175
		sbApacheP3.ProjectileSplashDamageMaxRadius = 200
		sbApacheP3.ProjectileIncendiary = false
		sbApacheP3.IncendiaryRadius = 0
		sbApacheP3.IncendiaryRadiusHeated = 0
		--insert projectiles
		table.insert(Projectiles, sbApacheP3)
		table.insert(Projectiles, sbApacheP2)
		table.insert(Projectiles, sbApacheP1)
	end
end
---------------------------END APACHE---------------------------------
-----------------------START BOMB GLIDER------------------------------
local sbBombGlider = DeepCopy(FindProjectile("mortar2"))
if sbBombGlider then
	sbBombGlider.SaveName = "sbBombGlider"
	sbBombGlider.MaxAge = 60
	sbBombGlider.Effects.Age = {['t0'] = { Effect = "mods/dlc2/effects/bomb_release.lua", Projectile = { Count = 1, Type = "sbBombGliderBomb", StdDev = 0, Speed = 1000}, Terminate = true, Splash = false,}}
	sbBombGlider.TrailEffect = path .. "/effects/trail_glider.lua"
	sbBombGlider.Effects.Impact =
	{
		firebeam = "mods/dlc2/effects/impact_bombs.lua",
		default = "mods/dlc2/effects/impact_bombs.lua",
		antiair = "effects/mortar_air_burst.lua",
	}
	sbBombGlider.ProjectileDamage = 60.0
	sbBombGlider.ProjectileSplashDamage = 120.0
	--sbBombGlider.ProjectileSplashDamageMaxRadius = 130.0
	--sbBombGlider.DamageMultiplier = {}
	sbBombGlider.AntiAirHitpoints = 11
	sbBombGlider.ProjectileShootDownRadius = 30
	sbBombGlider.FlipSpriteFacingLeft = true
	sbBombGlider.Gravity = 0.01
	sbBombGlider.Projectile =
	{
		Root =
		{
			Name = "Root",
			Angle = -90,
			Sprite = path .. "/weapons/glider/glider.png",
			PivotOffset = {0, -0.242},
			--Scale = 1.6,
		}
	}
	--bomb
	local sbBombGliderBomb = DeepCopy(sbBombGlider)
	sbBombGliderBomb.SaveName = "sbBombGliderBomb"
	sbBombGliderBomb.Effects.Age = { ['t0'] = { Effect = path .. "/effects/glider_detach.lua", Terminate = false, Splash = false,},}
	sbBombGliderBomb.Gravity = 981
	sbBombGliderBomb.AntiAirHitpoints = 5
	sbBombGliderBomb.TrailEffect = path .. "/effects/trail_b2bomb.lua"
	sbBombGliderBomb.Projectile =
	{
		Root =
		{
			Name = "Root",
			Angle = -90,
			Sprite = path .. "/weapons/glider/gliderBomb.png",
			PivotOffset = {0, 0},
			--Scale = 1.6,
		}
	}
	
	table.insert(Projectiles, sbBombGliderBomb)
	table.insert(Projectiles, sbBombGlider)
	MakeFlamingVersion("sbBombGliderBomb", 1.33, 2, flamingTrail, 150, nil, genericFlamingExpire)
	FindProjectile("flamingsbBombGliderBomb").Effects.Age = {}
end
-----------------------END BOMB GLIDER--------------------------------
---------------------START B2 SPIRIT-----------------------------------
local sbB2bomb = DeepCopy(FindProjectile("bomb"))
if sbB2bomb then
	sbB2bomb.SaveName = "sbB2bomb"
	sbB2bomb.TrailEffect = path .. "/effects/trail_b2bomb.lua"
	sbB2bomb.MagneticModifierFriendly = 0.03
	sbB2bomb.Effects.Impact =
	{
		['default'] = path .. "/effects/impact_b2bomb.lua",
	}
	table.insert(Projectiles, sbB2bomb)
end
local sbB2 = DeepCopy(FindProjectile("nighthawk"))
if sbB2 then
	sbB2.SaveName = "sbB2"
	--[[sbB2.dlc2_Bombs =
	{
		Count = 60,
		Period = 0.04,
		Speed = 1000,
		OffsetX = 0,
		OffsetY = 180,
		Projectile = "sbB2bomb",
		FireEffect = "mods/dlc2/effects/bomb_release.lua",
		BankEffect = "mods/dlc2/effects/nighthawk_banking.lua",
		AIAnticipatesDelivery = true,
		BankingLookahead = 2500,
		AbortLookahead = 0,
	}]]
	sbB2.dlc2_Bombs = nil
	sbB2.Effects.Impact['firebeam'] = { Effect = nil, Projectile = { Count = 1, Type = "flamingsbB2", StdDev = 0, }, Terminate = true, Splash = false,}
	sbB2.Projectile =
	{
		Root =
		{
			Name = "Root",
			Angle = -90,
			Sprite = path .. "/weapons/b2/base.png",
			PivotOffset = {0, 0},
			Scale = 1.1,
		}
	}
	sbB2.Effects.Age = { ['t40'] = { Effect = nil, Projectile = { Count = 1, Type = "sbB2P2", StdDev = 0 }, Terminate = true, Splash = false,}}
	--phase 2, bomb dropping
	local sbB2P2 = DeepCopy(sbB2)
	if sbB2P2 then
		sbB2P2.SaveName = "sbB2P2"
		sbB2P2.Projectile =
		{
			Root =
			{
				Name = "Root",
				Angle = -90,
				Sprite = path .. "/weapons/b2/baseBayOpen.png",
				PivotOffset = {0, 0},
				Scale = 1.1,
			}
		}
		--sbB2P2.CollisionLookaheadDist = 1500
		sbB2P2.Effects.Impact = 
		{
			--['default'] = { Effect = "mods/dlc2/effects/nighthawk_banking.lua", Offset = -1500, Terminate = true, Splash = false,},
			['default'] = "mods/dlc2/effects/nighthawk_explode.lua",
			['antiair'] = "mods/dlc2/effects/nighthawk_explode.lua",
			['firebeam'] = { Effect = nil, Projectile = { Count = 1, Type = "flamingsbB2", StdDev = 0, }, Terminate = true, Splash = false,},
		}
		--age effects
		sbB2P2.Effects.Age = {}
		local bombCount = 60
		local bombPeriod = 40
		for i = 0, bombPeriod*bombCount, bombPeriod do
			sbB2P2.Effects.Age['t' .. tostring(i)] = { Effect = "mods/dlc2/effects/bomb_release.lua", Projectile = { Count = 1, Type = "sbB2bomb", StdDev = 0, Speed = 1000}, Terminate = false, Splash = false,}
		end
		sbB2P2.Effects.Age['t' .. tostring(40*(bombCount + 1))] = {Effect = path .. "/effects/b2_bank.lua", Terminate = true, Splash = false,}
	end
	--firebeamed version
	local sbFlamingB2 = DeepCopy(FindProjectile("flamingnighthawk"))
	if sbFlamingB2 then
		sbFlamingB2.SaveName = "flamingsbB2"
		sbFlamingB2.Projectile =
		{
			Root =
			{
				Name = "Root",
				Angle = -90,
				Sprite = path .. "/weapons/b2/base.png",
				PivotOffset = {0, 0},
				Scale = 1.1,
			}
		}
	end
	table.insert(Projectiles, sbFlamingB2)
	table.insert(Projectiles, sbB2P2)
	table.insert(Projectiles, sbB2)
end
-----------------------END B2 SPIRIT------------------------------------
---------------------------START FIREWORK-------------------------------
if FindProjectile("decoy") then --only if high seas is enabled
	local sbFireworkP1 = DeepCopy(FindProjectile("mortar2"))
	if sbFireworkP1 then
		--effects
		local sbFireworkS1 = { Effect = path .. "/effects/detonate_firework1.lua", Projectile = { Count = 3, Type = "sbFireworkP2", StdDev = 10.1, Speed = 1800 }, Offset = -25, Terminate = true}
		local sbFireworkS2 = { Effect = path .. "/effects/detonate_firework2.lua", Projectile = { Count = 12, Type = "sbFireworkP3", StdDev = 10.1, Speed = 3000 }, Terminate = true}
		local sbFireworkS3 = { Effect = nil, Projectile = { Count = 1, Type = "sbFireworkP4", StdDev = 1.1, Speed = 1000 }, Terminate = false}
		--phase 1
		sbFireworkP1.SaveName = "sbFireworkP1"
		sbFireworkP1.Gravity = 300
		sbFireworkP1.ProjectileDamage = 30
		sbFireworkP1.ProjectileSplashDamage = 30
		sbFireworkP1.ProjectileSplashDamageMaxRadius = 150
		sbFireworkP1.ProjectileIncendiary = true
		sbFireworkP1.IncendiaryRadius = 50
		sbFireworkP1.AntiAirHitpoints = 11
		sbFireworkP1.Projectile.Root.Sprite = path .. "/weapons/firework/fireworkBall2.png"
		sbFireworkP1.TrailEffect = path .. "/effects/trail_firework.lua"
		local sbFireworkP2 = DeepCopy(sbFireworkP1)
		local sbFireworkP3 = DeepCopy(sbFireworkP1)
		sbFireworkP1.CollisionLookaheadDist = 25
		sbFireworkP1.Effects.Impact = { ['default'] = sbFireworkS1, ['firebeam'] = sbFireworkS1}
		
		sbFireworkP1.Projectile.Root.Scale = 7
		--phase 2
		sbFireworkP2.SaveName = "sbFireworkP2"
		sbFireworkP2.Effects.Impact = { ['default'] = sbFireworkS2, ['firebeam'] = sbFireworkS2}
		sbFireworkP2.Effects.Age = { t1000 = sbFireworkS2}
		sbFireworkP2.Projectile.Root.Scale = 4.5
		sbFireworkP2.ExplodeOnTouch = false
		--sbFireworkP2.TrailEffect = nil
		--phase 3
		sbFireworkP3.SaveName = "sbFireworkP3"
		sbFireworkP3.ProjectileDrag = 20
		sbFireworkP3.Effects = DeepCopy(FindProjectile("machinegun").Effects)
		sbFireworkP3.Effects.Deflect = {}
		sbFireworkP3.Projectile.Root.Scale = 1
		sbFireworkP3.ProjectileDamage = 10
		sbFireworkP3.WeaponDamageBonus = 10
		sbFireworkP3.ProjectileIncendiary = false
		sbFireworkP3.ProjectileSplashDamage = 0
		sbFireworkP3.ExplodeOnTouch = false
		sbFireworkP3.MinAge = 2.5
		sbFireworkP3.MaxAge = 6
		sbFireworkP3.AntiAirDamage = 0
		sbFireworkP3.AntiAirHitpoints = 1
		sbFireworkP3.ProjectileShootDownRadius = 2
		sbFireworkP3.ExpiresOnFreeFall = true
		sbFireworkP3.TrailEffect = nil
		sbFireworkP3.DeflectedByTerrain = true
		sbFireworkP3.Impact = 0
		sbFireworkP3.Effects.Age = 
		{
			t200 = sbFireworkS3,
			t300 = sbFireworkS3,
			t400 = sbFireworkS3,
			t600 = sbFireworkS3,
			t800 = path .. "/effects/blank.lua"
		}
		--phase4
		local sbFireworkP4 = DeepCopy(sbFireworkP3)
		sbFireworkP4.SaveName = "sbFireworkP4"
		sbFireworkP4.Effects.Age = {}
		sbFireworkP4.Projectile.Root.Scale = 1.8
		
		--insert
		table.insert(Projectiles, sbFireworkP4)
		table.insert(Projectiles, sbFireworkP3)
		table.insert(Projectiles, sbFireworkP2)
		table.insert(Projectiles, sbFireworkP1)
	end
	--------------------------------END FIREWORK-----------------------------------------
	----------------------------START HARPOON---------------------------------------
	local sbHarpoonP1 = DeepCopy(FindProjectile("cannon"))
	if sbHarpoonP1 then
		sbHarpoonP1.SaveName = "sbHarpoonP1"
		sbHarpoonP1.ProjectileDamage = 0
		sbHarpoonP1.ProjectileSplashDamage = 0
		sbHarpoonP1.ProjectileSprite = nil
		sbHarpoonP1.DrawBlurredProjectile = false
		sbHarpoonP1.ProjectileSplashMaxForce = 0
		sbHarpoonP1.PenetrationDamage = 500
		sbHarpoonP1.AntiAirDamage = 40
		sbHarpoonP1.Impact = 0
		sbHarpoonP1.ProjectileShootDownRadius = 15
		sbHarpoonP1.Projectile =
		{
			Root =
			{
				Name = "Root",
				Angle = 0,
				Scale = 1.5,
				Sprite = path .. "/weapons/harpoon/harpoonProjectile.png",
				Pivot = { 0, 0.35 },

				ChildrenInFront =
				{
				},
			}
		}
		sbHarpoonP1.TrailEffect = path .. "/effects/trail_harpoon.lua"
		sbHarpoonP1.Effects =
		{
			Impact =
			{
				["device"] = path .. "/effects/impact_harpoon_device.lua",
				["antiair"] = path .. "/effects/impact_harpoon_antiair.lua",
				["default"] = path .. "/effects/impact_harpoon_default.lua",
			},
			Deflect =
			{
				["default"] = "effects/bullet_bracing_hit.lua",
			},
		},
		table.insert(Projectiles, sbHarpoonP1)
	end
end
-----------------------------END HARPOON---------------------------------------------
--extended plasma laser
local sbLaserEXT = DeepCopy(FindProjectile("laser"))
if sbLaserEXT then
	sbLaserEXT.SaveName = "sbLaserEXT"
	sbLaserEXT.BeamThickness = function(t)
		return InterpolateTable(sbLaserEXT.BeamTable, t, 2)
	end
	sbLaserEXT.BeamDamage = function(t)
		return InterpolateTable(sbLaserEXT.BeamTable, t, 3)
	end
	sbLaserEXT.BeamTable =
	{
		{ 0,	1,	0, },
		{ 0.25, 3,  0, },
		{ 0.5,	30, 1000, },
		{ 1.1,	30, 1000, }, -- 1000
		{ 1.8,	0,	0, },
	}
	table.insert(Projectiles, sbLaserEXT)
end
------------------START ARTILLERY BARRAGE--------------------------------------------
--sprite
table.insert(Sprites,
{
	Name = "sbFlareSpin",
			
	States =
	{
		Normal =  
		{  
			Frames =
			{},
			NextState = "Normal",
		},
	},
})
local flareFrames = FindSprite(Sprites, "sbFlareSpin").States.Normal.Frames
for i = 0, 11, 1 do
	table.insert(flareFrames, { texture = path .. "/weapons/orbital/flare_sheet.png", top = i/12, bottom = (i+1) / 12})
end
flareFrames.duration = 0.04
flareFrames.mipmap = true
--data
local sbOrbArtillery = DeepCopy(FindProjectile("ol_marker_sweep"))
if sbOrbArtillery then
	sbOrbArtillery.SaveName = "sbOrbitalArtilleryMarker"
	sbOrbArtillery.Projectile =
	{
		Root =
		{
			Name = "Root",
			Angle = 0,
			Sprite = "sbFlareSpin",
			PivotOffset = {0, 0},
			Scale = 2.0,
		}
	}
	sbOrbArtillery.dlc2_orbital = nil
	sbOrbArtillery.TrailEffect = path .. "/effects/trail_flare.lua"
	sbOrbArtillery.Effects =
	{
		Impact =
		{
			["firebeam"] = path .. "/effects/flare_land_noReport.lua",
			["antiair"] = path .. "/effects/flare_land_noReport.lua",
			["foundations"] = path .. "/effects/flare_land_noReport.lua",
			["rocks01"] = path .. "/effects/flare_land_noReport.lua",
			["default"] = path .. "/effects/flare_land.lua",
		},
		Deflect =
		{
			["default"] = "effects/bullet_bracing_hit.lua",
		},
	}
	table.insert(Projectiles, sbOrbArtillery)
end
--orbital artillery barrage artillery projectile
local sbArtillery = DeepCopy(FindProjectile("flaming_boulder"))
if sbArtillery then
	sbArtillery.SaveName = "sbArtilleryHail"
	sbArtillery.ProjectileDamage = 100
	sbArtillery.ProjectileSplashDamage = 90
	sbArtillery.ProjectileSplashDamageMaxRadius = 130
	sbArtillery.Gravity = sbArtillery.Gravity * 1.35
	sbArtillery.ProjectileIncendiary = false
	sbArtillery.ProjectileIncendiaryRadiusHeated = 10
	sbArtillery.ProjectileIncendiaryRadius = 50
	sbArtillery.AntiAirHitpoints = 11
	sbArtillery.Projectile =
	{
		Root =
		{
			Name = "Root",
			Angle = 0,
			Scale = 3,
			Sprite = path .. "/weapons/mortars/artillery.tga",
		}
	}
	sbArtillery.TrailEffect = path .. "/effects/trail_artilleryHail.lua"
	sbArtillery.DamageMultiplier = {}
	sbArtillery.Effects.Impact = 
	{ 
		["default"] = path .. "/effects/impact_artilleryHail.lua", 
		["antiair"] = path .. "/effects/impact_artilleryHail_air.lua"
	}
	table.insert(Projectiles, sbArtillery)
	MakeFlamingVersion("sbArtilleryHail", 1.33,	1, flamingTrail, 100, nil, genericFlamingExpire)
end
------------------------------------END ARTILLERY BARRAGE--------------------------------------
--rocket cannon
local sbRocketCannon = DeepCopy(FindProjectile("cannon"))
if sbRocketCannon then
	sbRocketCannon.SaveName = "sbRocketCannon"
	sbRocketCannon.ProjectileThickness = 7.4
	sbRocketCannon.ProjectileDamage = 200
	sbRocketCannon.ProjectileSplashDamage = 30
	sbRocketCannon.ProjectileSplashDamageMaxRadius = 150
	sbRocketCannon.Effects.Age =
	{
		t1 = { Effect = nil, Projectile = { Count = 1, Type = "sbRocketCannon2", StdDev = 0.01 }, Offset = 0, Terminate = true, Splash = false}
	}
	sbRocketCannon.TrailEffect = "mods/weapon_pack/effects/20mmcannon_trail.lua"
	table.insert(Projectiles, sbRocketCannon)
	MakeFlamingVersion("sbRocketCannon", 1.25,	0.4, flamingTrail, 75, nil, nil)
	FindProjectile("flamingsbRocketCannon").Effects.Age = {}
	--phase 2 (Forts doesnt allow deviation adjustment on ammo. Luckily projectiles do)
	local sbRocketCannon2 = DeepCopy(FindProjectile("sbRocketCannon"))
	sbRocketCannon2.SaveName = "sbRocketCannon2"
	sbRocketCannon2.Effects.Age = {}
	
	table.insert(Projectiles, sbRocketCannon2)
	MakeFlamingVersion("sbRocketCannon2", 1.25,	0.4, flamingTrail, 75, nil, nil)
end
-------------------------------------START GRAPESHOT-------------------------------------
--[[
local sbGrapeshot = DeepCopy(FindProjectile("mortar2"))
if sbGrapeshot then
	sbGrapeshot.SaveName = "sbGrapeshot"
	sbGrapeshot.Projectile.Root.Sprite = path .. "/weapons/deckgun/grapeshot.png"
	sbGrapeshot.TrailEffect = "mods/dlc2/effects/deck_gun_projectile_fly.lua"
	sbGrapeshot.Gravity = 200
	sbGrapeshot.Effects.Impact = 
	{
		["default"] = "mods/dlc2/effects/impact_bombs.lua"
	}
	table.insert(Projectiles, sbGrapeshot)
	MakeFlamingVersion("sbGrapeshot", 1.25, 2, flamingTrail, 75, nil, nil)
	--projectile spawners
	local sbGrapeshot6 = DeepCopy(sbGrapeshot)
	sbGrapeshot6.SaveName = "sbGrapeshot6"
	sbGrapeshot6.Effects.Age = { t1 = { Effect = nil, Projectile = { Count = 6, Type = "sbGrapeshot", StdDev = 0.03 }, Terminate = true, Splash = false}}
	table.insert(Projectiles, sbGrapeshot6)
end
]]
------------------------------------END GRAPESHOT----------------------------------------
--sattelite
local sbSatt = DeepCopy(FindProjectile("mortar2"))
if sbSatt then
	sbSatt.SaveName = "sbSatteliteProjectile"
	sbSatt.TrailEffect = nil
	sbSatt.Gravity = 0.001
	sbSatt.ProjectileShootDownRadius = 500
	sbSatt.AntiAirHitpoints = 30
	sbSatt.AntiAirDamage = 500
	sbSatt.Projectile.Root.Sprite = path .. "/weapons/orbital/sattelite.png"
	sbSatt.MaxAge = 15
	sbSatt.Effects.Impact = 
	{
		['default'] = path .. "/effects/blank.lua"
	}
	table.insert(Projectiles, sbSatt)
end
SetDamageMultiplier("ol_beam_sweep", { SaveName = "sbSatteliteProjectile", AntiAir = 0 })
SetDamageMultiplier("ol_beam_focus", { SaveName = "sbSatteliteProjectile", AntiAir = 0 })
SetDamageMultiplier("firebeam", { SaveName = "sbSatteliteProjectile", AntiAir = 0 })
SetDamageMultiplier("laser", { SaveName = "sbSatteliteProjectile", AntiAir = 0 })
-----------------------------------BIRDIES GUNS---------------------------------------
--arrow bundle
function sbProjectileBG()
	if sbBGpath then
		local sbbgArrowBundle = DeepCopy(FindProjectile("machinegun"))
		if sbbgArrowBundle then
			sbbgArrowBundle.SaveName = "sbArrowBundleP1"
			sbbgArrowBundle.Effects.Age = 
			{
				t1 = { Effect = nil, Projectile = { Count = 9, Type = "sbarrow", StdDev = 0.04 }, Offset = 0, Terminate = true, Splash = false}
			}
			table.insert(Projectiles, sbbgArrowBundle)
		end
	end
end

RegisterApplyMod(sbProjectileBG)
