local sbBAuraniumCannoncheck = FindProjectile("uraniumcannon")
if sbBAuraniumCannoncheck then
	function sbBAuraniumSupport(savename, maxage)
		sbBAuraniumcannon = DeepCopy(sbBAuraniumCannoncheck)
		sbBAuraniumcannon.SaveName = ("uranium"..savename)
		sbBAuraniumcannon.MaxAge = (maxage/DU_speed)
		table.insert(Projectiles, sbBAuraniumcannon)
		table.insert(ProjectilesToUranium, savename)
		ProjectileEffects[savename] = 
		{
			Trail = "mods/commander-cf-buster/effects/uranium_fly.lua",
			Impact =
			{
				["shield"] = "mods/commander-cf-buster/effects/impact_uranium_shield.lua",
			},
		}
	end
	--Add support
	sbBAuraniumSupport("sbApacheHellfire", 720)
	sbBAuraniumSupport("sbExtraHeavyMortar", 480)
	sbBAuraniumSupport("sbRocketCannon2", 480)
end