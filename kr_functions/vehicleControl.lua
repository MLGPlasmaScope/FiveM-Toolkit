
windowsDown = false

RegisterNetEvent("openDoor")
AddEventHandler("openDoor", function(door)

	if door == "lfront" then
		doorIndex = 0
	elseif door == "rfront" then
		doorIndex = 1
	elseif door == "lrear" then
		doorIndex = 2
	elseif door == "rrear" then
		doorIndex = 3
	elseif door == "trunk" then
		doorIndex = 5
	end

	print('door door')
	ped = GetPlayerPed(-1)
	veh = GetPlayersLastVehicle()

	doorAngle = GetVehicleDoorAngleRatio(veh, doorIndex)


	if doorAngle ~= 0 then
		SetVehicleDoorShut(veh, doorIndex, false)
	elseif doorAngle == 0 then
		SetVehicleDoorOpen(veh, doorIndex, false, false)
	end
end)

RegisterNetEvent('Engine')
AddEventHandler('Engine', function()

	ped = GetPlayerPed(-1)
	veh = GetPlayersLastVehicle()


	if IsVehicleEngineOn(veh, false) then
		SetVehicleEngineOn(veh, false, false)
	else
		SetVehicleEngineOn(veh, true, false)
	end
end)

RegisterNetEvent('Windows')
AddEventHandler('Windows', function()

	ped = GetPlayerPed(-1)
	veh = GetPlayersLastVehicle()
	
	if windowsDown == false then
		RollDownWindows(veh)
		windowsDown = true
	elseif windowsDown then
		RollUpWindow(veh, 0)
		RollUpWindow(veh, 1)
		RollUpWindow(veh, 2)
		RollUpWindow(veh, 3)
		windowsDown = false
	end

end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(0)

		ped = GetPlayerPed(-1)
		veh = GetPlayersLastVehicle()
		vehSpeed = GetEntitySpeed(veh)

		if vehSpeed < 2 then
			frontL = GetEntityBoneIndexByName(veh, "wheel_lf")
			FreezeEntityPosition(frontL, true)
		end


	end
end)