--[[ Cuff Player ]]--
RegisterNetEvent("cuff1")
AddEventHandler("cuff1", function()
	ped = GetPlayerPed(-1)
	if (DoesEntityExist(ped)) then
		Citizen.CreateThread(function()
		RequestAnimDict("mp_arresting")
			while not HasAnimDictLoaded("mp_arresting") do
				Citizen.Wait(0)
			end
			if isCuffed then
				ClearPedSecondaryTask(ped)
				StopAnimTask(ped, "mp_arresting", "idle", 3)
				SetEnableHandcuffs(ped, false)
				isCuffed = false
			else
				TaskPlayAnim(ped, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
				SetEnableHandcuffs(ped, true)
				Citizen.Trace("cuffed")
				isCuffed = true
			end
			
			
		end)
	end
end)


AddEventHandler("core:ShowNotification", function(text)
	SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true)
end)


--[[ Cuff Nearest Player ]]--
RegisterNetEvent("cuff")
AddEventHandler("cuff", function()
	local ped = GetPlayerPed(-1)
	local nearestPlayer = GetNearestPlayerToEntity(ped)
	local entityType = GetEntityType(ped)
	
	shortestDistance = 2
	closestId = 0
	
	for id = 0, 32 do
        if NetworkIsPlayerActive( id ) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
			ped1 = GetPlayerPed( id )
			local x,y,z = table.unpack(GetEntityCoords(ped))
                if (GetDistanceBetweenCoords(GetEntityCoords(ped1), x,y,z) <  shortestDistance) then
					
					shortestDistance = GetDistanceBetweenCoords(GetEntityCoords(ped), x,y,z)
					closestId = GetPlayerServerId(id)		
					
				end
				
        end		
	end
		
		TriggerServerEvent("cuffNear", closestId)
	
end)




--[[ Some Realism Factors ]]--
Citizen.CreateThread(function()

	ped = GetPlayerPed(-1)

	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(ped, "mp_arresting", "idle", 3) then
			isCuffed = true
		elseif isCuffed then
			TaskPlayAnim(ped, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
			DisableControlAction(1, 24, true)
			DisableControlAction(1, 25, true)
			DisableControlAction(1, 59, true)
			DisableControlAction(1, 63, true)
			DisableControlAction(1, 64, true)
			DisableControlAction(1, 123, true)
			DisableControlAction(1, 124, true)
			DisableControlAction(1, 125, true)
			DisableControlAction(1, 133, true)
			DisableControlAction(1, 134, true)
			SetPedCurrentWeaponVisible(GetPlayerPed(-1), false, true, false, false)
			
		end
	end
end)