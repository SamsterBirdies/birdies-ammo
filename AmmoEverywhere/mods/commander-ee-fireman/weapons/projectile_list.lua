local napalm = FindProjectile("sbba_NapalmMortar")
if napalm then
	napalm.IncendiaryRadius = napalm.IncendiaryRadius * 1.35
	napalm.IncendiaryRadiusHeated = napalm.IncendiaryRadiusHeated * 1.7
end

local hellfire = FindProjectile("sbApacheHellfire")
if hellfire then
	hellfire.IncendiaryRadius = hellfire.IncendiaryRadius * 1.5
	hellfire.IncendiaryRadiusHeated = hellfire.IncendiaryRadiusHeated * 1.5
end

RegisterApplyMod(function()
	if active then
		local apachetest = FindProjectile("sbApacheS4")
		if apachetest then
			apachetest.ProjectileIncendiary = false
		end
		local apache = FindProjectile("sbApacheP3")
		if apache then
			apache.ProjectileIncendiary = false
		end
		local artillery = FindProjectile("sbArtilleryHail")
		if artillery then
			artillery.IncendiaryRadius = 60
			artillery.IncendiaryRadiusHeated = 80
		end
		local firework1 = FindProjectile("sbFireworkP3")
		if firework1 then
			firework1.IncendiaryRadius = 0
			firework1.IncendiaryRadiusHeated = 0
		end
		local firework1 = FindProjectile("sbFireworkP4")
		if firework1 then
			firework1.IncendiaryRadius = 0
			firework1.IncendiaryRadiusHeated = 0
		end
	end
end)