
carbineEquipped = false
shotgunEquipped = false


Citizen.CreateThread(function()

		ped = GetPlayerPed(-1)
	
	while true do 
		Wait(0)

		ped = GetPlayerPed(-1)
		veh = GetVehiclePedIsIn(ped)
		currentWeapon = GetSelectedPedWeapon(ped)
		

		if nearPickup then
			TriggerEvent("chatMessage", "[KRT  WEAPON]", {255, 0, 0}, "Near pickup")
		end
		
		if carbineEquipped == false then
			RemoveWeaponFromPed(ped, "WEAPON_CARBINERIFLE")			
			
		end
		
		if shotgunEquipped == false then
			RemoveWeaponFromPed(ped, "WEAPON_PUMPSHOTGUN")			
		
		end
		
		if carbineEquipped then
			if (tostring(currentWeapon) ~= "-2084633992") and veh == nil then
				TriggerEvent("chatMessage", "[KRT  WEAPON]", {255, 0, 0}, "Must put away your carbine!")
			end
			SetCurrentPedWeapon(ped, "WEAPON_CARBINERIFLE", true)
		end
		
		if shotgunEquipped then
			if tostring(currentWeapon) ~= "487013001" and veh == nil then
				TriggerEvent("chatMessage", "[KRT  WEAPON]", {255, 0, 0}, "Must put away your shotgun!")
			end
			SetCurrentPedWeapon(ped, "WEAPON_PUMPSHOTGUN", true)
		end
		
		
	--	GiveWeaponToPed(ped, "WEAPON_COMBATPISTOL", 60, false, true)
		
		--Wait(3000)
		
	--	RemoveWeaponFromPed(ped, "WEAPON_COMBATPISTOL")
	
		
		--TaskReloadWeapon(ped, true)

	end

end)

RegisterNetEvent("equipCarbine")
AddEventHandler("equipCarbine", function()
	
	print((GetVehicleClass(veh) == 18))
	
	if (GetVehicleClass(veh) == 18) then
		carbineEquipped = not carbineEquipped
		shotgunEquipped = false
		
		
		
	elseif (GetVehicleClass(veh) ~= 18) then
		TriggerEvent("chatMessage", "[KRT  WEAPON]", {255, 0, 0}, "Must be in a police car to grab your carbine!")
	end
	
	
	if carbineEquipped then
		TriggerEvent("chatMessage", "[KRT  WEAPON]", {255, 0, 0}, "Carbine Equipped!")
		GiveWeaponToPed(ped, "WEAPON_CARBINERIFLE", 60, false, true)
	else 
		TriggerEvent("chatMessage", "[KRT  WEAPON]", {255, 0, 0}, "Carbine Unequipped!")
	end
end)

RegisterNetEvent("equipShotgun")
AddEventHandler("equipShotgun", function()
	
	if (GetVehicleClass(veh) == 18) then
		shotgunEquipped = not shotgunEquipped
		carbineEquipped = false
		
	elseif (GetVehicleClass(veh) ~= 18) then
		TriggerEvent("chatMessage", "[SADOJ  WEAPON]", {255, 0, 0}, "Must be in a police car to grab your shotgun!")
	end
	
	if shotgunEquipped then
		TriggerEvent("chatMessage", "[KRT  WEAPON]", {255, 0, 0}, "Shotgun Equipped!")
		GiveWeaponToPed(ped, "WEAPON_PUMPSHOTGUN", 60, false, true)
	else
		TriggerEvent("chatMessage", "[KRT  WEAPON]", {255, 0, 0}, "Shotgun Unequipped!")
	end
end)

RegisterNetEvent("equipPistol")
AddEventHandler("equipPistol", function()
	GiveWeaponToPed(ped, "WEAPON_COMBATPISTOL", 60, false, true)
	GiveWeaponToPed(ped, "WEAPON_STUNGUN", 60, false, true)
	GiveWeaponToPed(ped, "WEAPON_FLASHLIGHT", 60, false, true)
	GiveWeaponToPed(ped, "WEAPON_NIGHTSTICK", 60, false, true)
end)

RegisterNetEvent("dropGun")
AddEventHandler("dropGun", function()
	currentWeapon = GetSelectedPedWeapon(ped)
	
	droppedWeapon = SetPedDropsInventoryWeapon(ped, currentWeapon, -2.0, 0.0, 0.5, 30)
	
	
	TriggerEvent("chatMessage", "[KRT  WEAPON]", {255, 0, 0}, "Gun Dropped!")
end)
