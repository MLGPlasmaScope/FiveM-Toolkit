local policeloadout = {
	{['i'] = 1, ['weapon'] = "WEAPON_TEARGAS"},
	{['i'] = 2, ['weapon'] = "WEAPON_COMBATPISTOL"},
	{['i'] = 3, ['weapon'] = "WEAPON_STUNGUN"},
	{['i'] = 4, ['weapon'] = "WEAPON_NIGHTSTICK"},
	{['i'] = 5, ['weapon'] = "WEAPON_FLASHLIGHT"},
	-- {['i'] = 4, ['weapon'] = "WEAPON_PUMPSHOTGUN"},
	-- {['i'] = 5, ['weapon'] = "WEAPON_CARBINERIFLE"},
}

RegisterNetEvent("yt:policeLoadout")
AddEventHandler("yt:policeLoadout", function()
 RemoveAllPedWeapons(GetPlayerPed(-1))
 local model = GetHashKey("s_m_y_cop_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    ShowNotification('Loadout Given')

local playerPed = GetPlayerPed(-1)
	for k,v in ipairs(policeloadout) do
		Citizen.Trace("Weapon: "..v.i.." "..v.weapon.." Given to ".. playerPed)
	    GiveWeaponToPed(playerPed, GetHashKey(v.weapon), 9999, true, true)
     	
	end
end)


RegisterNetEvent("Handsup")
AddEventHandler("Handsup", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict("random@mugging3")
			while not HasAnimDictLoaded("random@mugging3") do
				Citizen.Wait(100)
			end
			
			if IsEntityPlayingAnim(lPed, "random@mugging3", "handsup_standing_base", 3) then
				ClearPedSecondaryTask(lPed)
				SetEnableHandcuffs(lPed, false)
				--TriggerEvent("chatMessage", "", {255, 0, 0}, "Your have put your hands down.")
				ShowNotification('~o~You have put your hands down')
			else
				TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
				SetEnableHandcuffs(lPed, true)
				--TriggerEvent("chatMessage", "", {255, 0, 0}, "Your hands are up.")
				ShowNotification('~b~You have put your hands up')
			end		
		end)
	end
end)

-- client side handcuff script

local handCuffed = false -- store wether we are handcuffed or not

RegisterNetEvent('mHandCuff') -- register that this is a valid event

-- register a function to be called when we recieve the event
AddEventHandler('mHandCuff', function()
  -- set handCuffed equal to the oposite of its current value (true or false)
  handCuffed = not handCuffed
end)

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end