dofile("scripts/forts.lua")
-------------------------Apache-------------------------
function sbReturnApache(deviceId, projectileNodeId)
	local teamId = GetDeviceTeamIdActual(deviceId)
	DestroyProjectile(projectileNodeId)
	SpawnEffect(path .. "/effects/apache_land.lua", GetDevicePosition(deviceId))
	EnableDevice("ammo_sbApacheReturned", true, 1)
	EnableDevice("ammo_sbApacheReturned", true, 2)
	for k, v in pairs(data.AmmoLocations[teamId]) do
		local result = CreateDevice(teamId, "ammo_sbApacheReturned", v[1], v[2], v[3])
		--Log(tostring(result))
		if result > 0 then
			break
		end
	end
	EnableDevice("ammo_sbApacheReturned", false, 1)
	EnableDevice("ammo_sbApacheReturned", false, 2)
	CloseWeaponDoors(deviceId)
end
-----------------------Artillery barrage----------------
function sbCallArtillery(markerPOS, team)
	--get position to place weapon
	local extents = GetWorldExtents()
	local devicePOS = Vec3(0,-12000,0)
	--if neither team 1 or team 2 then assign one closest to the projectile
	if team%100 ~= 1 and team%100 ~= 2 then
		if markerPOS["x"] > 0 then
			team = 2
		else
			team = 1
		end
	end
	--switch sides for teams.
	if team%100 == 1 then
		devicePOS = Vec3(extents["MinX"] + 200, extents["MinY"] - 2000, 0)
	elseif team%100 == 2 then
		devicePOS = Vec3(extents["MaxX"] - 200, extents["MinY"] - 2000, 0)
	end
	--place weapon and fire
	EnableWeapon("sbOrbitalArtillery_source", true, 1)
	EnableWeapon("sbOrbitalArtillery_source", true, 2)
	EnableWeapon("sbOrbitalArtillerySpread_source", true, 1)
	EnableWeapon("sbOrbitalArtillerySpread_source", true, 2)
	local deviceId = dlc2_CreateFloatingDevice(team, "sbOrbitalArtillerySpread_source", devicePOS, 0.0)
	ScheduleCall(2.5, FireWeapon, deviceId, markerPOS, 0.0, FIREFLAG_NORMAL)
	--make higher weapons for more spread and new angles
	devicePOS["y"] = devicePOS["y"] - 3000
	--disabled 1 weapon as a nerf
	--local deviceId2 = dlc2_CreateFloatingDevice(team, "sbOrbitalArtillerySpread_source", devicePOS, 0.0)
	--ScheduleCall(2.65, FireWeapon, deviceId2, markerPOS, 0.0, FIREFLAG_NORMAL) 
	devicePOS["y"] = devicePOS["y"] - 3000
	local deviceId3 = dlc2_CreateFloatingDevice(team, "sbOrbitalArtillery_source", devicePOS, 0.0)
	ScheduleCall(3.2, FireWeapon, deviceId3, markerPOS, 0.0, FIREFLAG_NORMAL)
	devicePOS["y"] = devicePOS["y"] - 3000
	local deviceId4 = dlc2_CreateFloatingDevice(team, "sbOrbitalArtillery_source", devicePOS, 0.0)
	ScheduleCall(3.35, FireWeapon, deviceId4, markerPOS, 0.0, FIREFLAG_NORMAL)
	--Log("script run. param:" .. tostring(markerPOS) .. ", " .. tostring(team))
	--Log("device id's:" .. tostring(deviceId) .. "," .. tostring(deviceId3) .. "," tostring(deviceId4))
	
	EnableWeapon("sbOrbitalArtillery_source", false, 1)
	EnableWeapon("sbOrbitalArtillery_source", false, 2)
	EnableWeapon("sbOrbitalArtillerySpread_source", false, 1)
	EnableWeapon("sbOrbitalArtillerySpread_source", false, 2)
	--continue to event OnWeaponFiredEnd to delete device
end
----------------------Harpoon harpoon-------------------
function sbHarpoonDelayedWeapon(deviceTeamId, nodeIdA, nodeIdB, linkPos, saveName)
	EnableWeapon("sbHarpoonInterWeapon", true, 1)
	EnableWeapon("sbHarpoonInterWeapon", true, 2)
	local newId = CreateDevice(deviceTeamId, "sbHarpoonInterWeapon", nodeIdA, nodeIdB, linkPos)
	EnableWeapon("sbHarpoonInterWeapon", false, 1)
	EnableWeapon("sbHarpoonInterWeapon", false, 2)
	ScheduleCall(0.08, UpgradeDevice, newId, saveName)
end
--[[ not needed
function sbHarpoonScrapWeapon(deviceId)
	if GetLocalSelectedDeviceId() == deviceId then
		if GetDeviceTeamIdActual(deviceId) == GetLocalTeamId() then
			Deselect()
		end
	end
	DestroyDeviceById(deviceId)
end]]
function sbHarpoonDevice(projectileId, projectileTeamId, deviceId, saveName)
	--only trigger on enemy devices
	if projectileTeamId%100 ~= GetDeviceTeamIdActual(deviceId)%100 and GetDeviceTeamIdActual(deviceId) ~= 0 then
		if IsGroundDevice(deviceId) then
			Log("Harpoon can't steal ground devices.")
		else
			--devices cant upgrade into weapons. Delete device and create the interweapon that can upgrade.
			if IsWeapon(deviceId) then
				if #data.HarpoonAmmoIds[projectileTeamId] > 0 then
					for k, v in pairs(data.HarpoonAmmoIds[projectileTeamId]) do
						if DeviceExists(v) then
							local nodeIdA = GetDevicePlatformA(v)
							local nodeIdB = GetDevicePlatformB(v)
							local linkPos = GetDeviceLinkPosition(v)
							ApplyDamageToDevice(v, 10000)
							ScheduleCall(0.04, sbHarpoonDelayedWeapon, projectileTeamId, nodeIdA, nodeIdB, linkPos, saveName)
							break
						end
					end
				end
			--devices and ammo can just upgrade normally
			else
				--get type (device or ammo)
				local upgradeInto = "sbHarpoonInterDevice"
				if IsDeviceTypeAmmo(GetDeviceType(deviceId), GetDeviceTeamIdActual(deviceId)%100) then
					upgradeInto = "sbHarpoonInterAmmo"
				end
				--upgrade device
				if #data.HarpoonAmmoIds[projectileTeamId] > 0 then
					for k, v in pairs(data.HarpoonAmmoIds[projectileTeamId]) do
						local newId = UpgradeDevice(v, upgradeInto)
						if newId > 0 then
							ScheduleCall(0.08, UpgradeDevice, newId, saveName)
							break
						end
					end
				end
			end
			--destroy enemy device
			SpawnEffect(path .. "/effects/harpoon_transfer.lua", GetDevicePosition(deviceId))--spawn effect before destruction
			local destroyId = UpgradeDevice(deviceId, "sbHarpoonInterDevice")
			if destroyId > 0 then
				ScheduleCall(0.08, ApplyDamageToDevice, destroyId, 1000000000)
			else
				for i = 0.04, 15, 0.04 do
					ScheduleCall(i, DestroyDeviceById, deviceId)
				end
			end
		end
	end
end
function sbHarpoonSatellite(projectileTeamId)
	--called when collision with sattelite.
	if #data.HarpoonAmmoIds[projectileTeamId] > 0 then
		for k, v in pairs(data.HarpoonAmmoIds[projectileTeamId]) do
			if DeviceExists(v) then
				local nodeIdA = GetDevicePlatformA(v)
				local nodeIdB = GetDevicePlatformB(v)
				local linkPos = GetDeviceLinkPosition(v)
				ApplyDamageToDevice(v, 10000)
				ScheduleCall(0.04, sbHarpoonDelayedWeapon, projectileTeamId, nodeIdA, nodeIdB, linkPos, "sbSatteliteWeapon")
				break
			end
		end
	end
end
------------------------------Ultimates--------------------------------------
--mg
function Ultimate_MG(teamId, direction, posX)
	--rains hail of bullets in fired direction
	local extents = GetWorldExtents()
	--effect
	for i = 0, 7 do
		ScheduleCall(i * 0.24, SpawnEffect, "effects/fire_machinegun.lua", Vec3(posX + (2500 * direction * i), extents["MinY"] - 5000))
	end
	--bullet hail
	for i = 4, 200 do
		ScheduleCall(i * 0.04, dlc2_CreateProjectile, "sbult_mg2", "machinegun", teamId, Vec3(posX + (140 * direction * i), extents["MinY"] - 100), Vec3(0,4000), 20)
		ScheduleCall(i * 0.04, dlc2_CreateProjectile, "sbult_mg2", "machinegun", teamId, Vec3(posX + (140 * direction * i) + (70 * direction), extents["MinY"] - 100), Vec3(0,4000), 20)
	end
end
-------------------EVENTS--------------------

function Load(gameStart)
	--initialize apache ammo locations tables, initialize harpoon harpoon ammo id's tables
	data.AmmoLocations = {}
	data.HarpoonAmmoIds = {}
	data.sattelites = {}
	
	for i = 1, GetTeamCount(), 1 do
		data.AmmoLocations[GetTeamId(i)] = {}
		data.HarpoonAmmoIds[GetTeamId(i)] = {}
	end
	
	--hide hidden items
	EnableWeapon("sbOrbitalArtillery_source", false, 1)
	EnableWeapon("sbOrbitalArtillery_source", false, 2)
	EnableWeapon("sbOrbitalArtillerySpread_source", false, 1)
	EnableWeapon("sbOrbitalArtillerySpread_source", false, 2)
	EnableDevice("ammo_sbApacheReturned", false, 1)
	EnableDevice("ammo_sbApacheReturned", false, 2)
	EnableDevice("ammo_sbApacheFireable", false, 1)
	EnableDevice("ammo_sbApacheFireable", false, 2)
	EnableDevice("sbHarpoonInterAmmo", false, 1)
	EnableDevice("sbHarpoonInterAmmo", false, 2)
	EnableDevice("sbHarpoonInterDevice", false, 1)
	EnableDevice("sbHarpoonInterDevice", false, 2)
	EnableWeapon("sbHarpoonInterWeapon", false, 1)
	EnableWeapon("sbHarpoonInterWeapon", false, 2)
	EnableWeapon("sbSatteliteWeapon", false, 1)
	EnableWeapon("sbSatteliteWeapon", false, 2)
	
end

function OnLinkHit(nodeIdA, nodeIdB, objectId, objectTeamId, objectSaveName, damage, pos)
	--apache open door
	if objectSaveName == "sbApacheS4" then
		--Log("collision detected")
		local materialName = GetLinkMaterialSaveName(nodeIdA, nodeIdB)
		--Log("opening door")
		OpenDoor(nodeIdA, nodeIdB, true)
	--summon orbital artillery strike
	elseif objectSaveName == "sbOrbitalArtilleryMarker" then
		sbCallArtillery(pos, objectTeamId)
	end
	
end

function OnDeviceCreated(teamId, deviceId, saveName, nodeA, nodeB, t, upgradedId)
	--save runway ammo locations for apache auto-placement 
	if saveName == "ammo_sbApache" or saveName == "ammo_thunderbolt" or saveName == "ammo_nighthawk" or saveName == "ammo_sbApacheReturned" then
		table.insert(data.AmmoLocations[teamId],1, {nodeA, nodeB, t})
		if #data.AmmoLocations[teamId] > 98 then
			--Log("#data.AmmoLocations[" .. tostring(teamId) .. "] is over 32. Removing excess entries.")
			table.remove(data.AmmoLocations[teamId],95)
			table.remove(data.AmmoLocations[teamId],95)
			--Log("#data.AmmoLocations[" .. tostring(teamId) .. "] is now " .. tostring(#data.AmmoLocations[teamId]))
		end
	--add harpoon ammmo device id to table
	elseif saveName == "ammo_sbHarpoon" then
		table.insert(data.HarpoonAmmoIds[teamId], deviceId)
		--[[
		Log("data.HarpoonAmmoIds[" .. tostring(teamId) .. "] = {")
		for k, v in pairs(data.HarpoonAmmoIds[teamId]) do
			Log(tostring(v) .. ",")
		end
		Log("}")]]
	end
end

function OnDeviceHit(teamId, deviceId, saveName, newHealth, projectileNodeId, projectileTeamId, pos)
	--apache return to runway
	if saveName == "runway" or saveName == "runway2" then
		if GetNodeProjectileSaveName(projectileNodeId) == "sbApacheP3" then
			sbReturnApache(deviceId, projectileNodeId)
		end
	end
	--summon orbital artillery strike
	if GetNodeProjectileSaveName(projectileNodeId) == "sbOrbitalArtilleryMarker" then
		sbCallArtillery(pos, projectileTeamId)
	--do device steal
	elseif GetNodeProjectileSaveName(projectileNodeId) == "sbHarpoonP1" then
		sbHarpoonDevice(projectileNodeId, projectileTeamId, deviceId, saveName)
	end
end

function OnWeaponFired(teamId, saveName, weaponId, projectileNodeId, projectileNodeIdFrom)
	if saveName == "orbital_laser_source" then
		--create sattelite projectile if sattelite fires
		local velocity = Vec3(0.1,0.1,0)
		local position = GetDevicePosition(weaponId)
		position.y = position.y - 5000
		if GetWeaponSelectedAmmo(weaponId) == "ol_beam_sweep" then
			if teamId%100 == 1 then
				velocity.x = 100
			else
				velocity.x = -100
			end
		end
		local sattProjectileId = dlc2_CreateProjectile("sbSatteliteProjectile", "sattelite", teamId%100, position, velocity, 15)
		data.sattelites[sattProjectileId] = weaponId
	end
	--ultimate mg
	if saveName == "machinegun" and GetNodeProjectileSaveName(projectileNodeId) == "sbult_mg1" then
		local direction = 1
		if NodeVelocity(projectileNodeId).x < 0 then
			direction = -1
		end
		Ultimate_MG(teamId, direction, GetDevicePosition(weaponId).x)
	end
end

function OnWeaponFiredEnd(teamId, saveName, weaponId)
	--remove artillery source weapon once done firing
	if saveName == "sbOrbitalArtillery_source" or saveName == "sbOrbitalArtillerySpread_source" then
		DestroyDeviceById(weaponId)
	end
end

function OnDeviceCompleted(teamId, deviceId, saveName)
	--upgrade apache ammo types to consumable type
	if saveName == "ammo_sbApache" or saveName == "ammo_sbApacheReturned" then
		UpgradeDevice(deviceId, "ammo_sbApacheFireable")
	end
	--guns that automatically have first ammo option selected
	if saveName == "machinegun" then
		SetWeaponSelectedAmmo(deviceId, "sbmachinegunfix")
	elseif saveName == "sniper" then
		SetWeaponSelectedAmmo(deviceId, "sniper")
	elseif saveName == "minigun" then
		SetWeaponSelectedAmmo(deviceId, "minigun")
	elseif saveName == "shotgun" then
		SetWeaponSelectedAmmo(deviceId, "shotgun")
	end
end

function OnDeviceDestroyed(teamId, deviceId, saveName, nodeA, nodeB, t)
	--Log(tostring(sideId))
	--remove harpoon entry from table
	local teamId = GetDeviceTeamIdActual(deviceId)
	if saveName == "ammo_sbHarpoon" then
		for k, v in pairs(data.HarpoonAmmoIds[teamId]) do
			if v == deviceId then
				table.remove(data.HarpoonAmmoIds[teamId], k)
			end
		end
	end
end

function OnProjectileDestroyed(nodeId, teamId, saveName, structureIdHit)
	if saveName == "sbSatteliteProjectile" then
		--destroy sattelite
		ApplyDamageToDevice(data.sattelites[nodeId], 100000)
		data.sattelites[nodeId] = nil
	end
end

function OnExecuteProjectileAction(nodeId, saveName, pos, normal, hitType, hitTeamId, hitSaveName)
	if saveName == "sbHarpoonP1" and hitSaveName == "sbSatteliteProjectile" then
		--harpoon the sattelite
		sbHarpoonSatellite(NodeTeam(nodeId))
		--max volume
		SpawnEffect(path .. "/effects/impact_harpoon_device.lua", pos)
		SpawnEffect(path .. "/effects/impact_harpoon_device.lua", pos)
		SpawnEffect(path .. "/effects/impact_harpoon_device.lua", pos)
		SpawnEffect(path .. "/effects/impact_harpoon_device.lua", pos)
	end
end