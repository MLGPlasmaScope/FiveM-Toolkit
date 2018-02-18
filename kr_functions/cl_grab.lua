otherid = 0
grab = false

RegisterNetEvent("grab")
AddEventHandler('grab', function(pl)
	
	otherid = tonumber(pl)
	local ped = GetPlayerPed(-1)
	local ped1 = GetPlayerPed(GetPlayerFromServerId(otherid))
	local x,y,z = table.unpack(GetEntityCoords(ped))
	
	if (GetDistanceBetweenCoords(GetEntityCoords(ped1), x,y,z) <  5) then
	
		grab = not grab
		
		if (grab == false) then
			DetachEntity(GetPlayerPed(-1), true, false)	
	    else
			TriggerEvent("chatMessage", "[DOJ GRAB]", {255, 255, 255}, "Grabbed!")
	    end 
	end
	
end)


RegisterNetEvent("grabNearClient")
AddEventHandler('grabNearClient', function()
	
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
		
    if (closestId ~= nil) then
		TriggerServerEvent("grabNear", closestId)
	else
		 TriggerEvent("chatMessage", "[DOJ GRAB]", {255, 255, 255}, "No one found!")
	end
end)



Citizen.CreateThread(function()
	while true do

		if grab then
			
			local ped = GetPlayerPed(GetPlayerFromServerId(otherid))
			local myped = GetPlayerPed(-1)
			
			
			AttachEntityToEntity(myped, ped, 11816, 0.45, 0.35, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		end
		Citizen.Wait(0)
	end
end)
