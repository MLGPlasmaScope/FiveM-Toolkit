--[[

    Resource: kr_toolkit
    Description: Basic roleplay functionality for trainer servers
    Version: 2.0
    Author: Kronus
    
-]]

-- Define variables

local looped = 8
local looped2 = 16

-- Create the thread
Citizen.CreateThread(function()
    local checkbox2 = false
    local ped = GetPlayerPed(PlayerId())
    local pedA = PlayerPedId()
    local currentItemIndex = 1
    local selectedItemIndex = 1

    for theId,theItems in pairs(anims) do
        RequestAnimDict(theItems.dic)
    end

    WarMenu.CreateMenu('toolkit', 'Kronus Toolkit')

    WarMenu.SetTitleColor('toolkit', 255, 255, 255)
    WarMenu.SetTitleBackgroundColor('toolkit', 63, 127, 191)

    -- Main Menu
    WarMenu.CreateSubMenu('leomenu','toolkit','Leo Menu')
    WarMenu.CreateSubMenu('civmenu','toolkit','Civ Menu')
    WarMenu.CreateSubMenu('vehicle','toolkit','Vehicle Menu')
    WarMenu.CreateSubMenu('emotes','toolkit','Emotes')
    WarMenu.CreateSubMenu('doors','vehicle','Door Menu')

    -- Emotes
    WarMenu.CreateSubMenu('gesture', 'emotes', 'Gestures')
    WarMenu.CreateSubMenu('misc2', 'emotes', 'Misc')
    WarMenu.CreateSubMenu('scens', 'emotes', 'Scenarios')
    WarMenu.CreateSubMenu('job', 'scens', 'Jobs')
    WarMenu.CreateSubMenu('hobby', 'scens', 'Hobbies')
    WarMenu.CreateSubMenu('drink', 'scens', 'Drinking & Drugs')
    WarMenu.CreateSubMenu('ems', 'scens', 'EMS Scenarios')
    WarMenu.CreateSubMenu('sat', 'scens', 'Sat Down Scenarios')
    WarMenu.CreateSubMenu('misc', 'scens', 'Misc')

    WarMenu.CreateSubMenu('closeMenu', 'toolkit', 'Are you sure?')

    while true do
        ped = GetPlayerPed(PlayerId())

        if checkbox then
            looped = 1
        else
            looped = 32
        end

        if checkbox2 then
            looped2 = 1
        else
            looped2 = 0
        end

        -- Drawing the Menu
        if WarMenu.IsMenuOpened('toolkit') then
            if WarMenu.MenuButton('Police Toolbox','leomenu') then

            elseif WarMenu.MenuButton('Civ Toolbox','civmenu') then

            elseif WarMenu.MenuButton('Vehicle Menu','vehicle') then

            elseif WarMenu.MenuButton('Emotes','emotes') then

            elseif WarMenu.MenuButton('Close', 'closeMenu') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('leomenu') then
            if WarMenu.Button('Cuff') then
                TriggerEvent("Cuff_close:getcuff")
            elseif WarMenu.Button('Drag') then
                TriggerEvent("Cuff_close:getDrag")
            elseif WarMenu.Button('Loadout') then
                --TriggerEvent("equipPistol")
                TriggerEvent("yt:policeLoadout",source)
            elseif WarMenu.Button('Toggle Carbine') then
                TriggerEvent("equipCarbine")
            elseif WarMenu.Button('Toggle Shotgun') then
                TriggerEvent("equipShotgun")
			elseif WarMenu.Button('Binoculars') then
				TriggerEvent("binoculars:Activate")
            elseif WarMenu.MenuButton('Spikes Strips', 'spikes') then
            elseif WarMenu.Button('Delete Vehicle') then
                TriggerEvent("wk:deleteVehicle",source)
            elseif WarMenu.MenuButton('Back', 'toolkit') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('civmenu') then   
            if WarMenu.Button('Hands Up') then
                TriggerEvent("Handsup") 
            elseif WarMenu.Button('Drop Gun') then
                TriggerEvent("dropGun")
            elseif WarMenu.MenuButton('Back', 'toolkit') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('vehicle') then
            if WarMenu.Button('Toggle Engine') then
                TriggerEvent("Engine")
            elseif WarMenu.MenuButton('Doors', 'doors') then
            elseif WarMenu.Button('Roll Windows') then
                TriggerEvent("Windows") 
            elseif WarMenu.MenuButton('Back', 'toolkit') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('emotes') then
            if WarMenu.MenuButton('Gestures','gesture') then
                --Do stuff here
            elseif WarMenu.MenuButton('Misc','misc2') then

            elseif WarMenu.MenuButton('Scenarios','scens') then

            elseif WarMenu.MenuButton('Back', 'toolkit') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('doors') then
            if WarMenu.Button('Trunk') then
                TriggerEvent("openDoor", "trunk")
            elseif WarMenu.Button('Left Front') then
                TriggerEvent("openDoor", "lfront")
            elseif WarMenu.Button('Right Front') then
                TriggerEvent("openDoor", "rfront")
            elseif WarMenu.Button('Left Back') then
                TriggerEvent("openDoor", "lrear")
            elseif WarMenu.Button('Right Back') then
                TriggerEvent("openDoor", "rrear")
            elseif WarMenu.MenuButton('Back', 'vehicle') then
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('gesture') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(pedA)
            end
            for theId,theItems in pairs(anims) do
                if theItems.category == "Gesture" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('misc2') then

            if WarMenu.CheckBox('Loop Animations', checkbox, function(checked)
                    checkbox = checked
                end) then
            elseif WarMenu.Button('~r~~h~Stop Animation') then
                ClearPedTasks(pedA)
            end
            for theId,theItems in pairs(anims) do
                if theItems.category == "Misc" then
                    if WarMenu.Button(theItems.label) then
                        TaskPlayAnim(ped, theItems.dic, theItems.anim, 8.0, -1, -1, looped, 1, 0, 0, 0)
                    end
                end
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('scens') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            elseif WarMenu.MenuButton('Jobs', 'job') then
            elseif WarMenu.MenuButton('Hobbies', 'hobby') then
            elseif WarMenu.MenuButton('Drinks and Drugs', 'drink') then
            elseif WarMenu.MenuButton('EMS Animations', 'ems') then
            elseif WarMenu.MenuButton('Sitting Scenarios', 'sat') then
            elseif WarMenu.MenuButton('Misc', 'misc') then
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('job') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Jobs" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

        WarMenu.Display()
        elseif WarMenu.IsMenuOpened('hobby') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Hobby" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('drink') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Drink" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('ems') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "EMS" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('sat') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Sat" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('misc') then

            if WarMenu.CheckBox2('Loop Scenarios', checkbox2, function(checked2)
                    checkbox2 = checked2
                end) then
            elseif WarMenu.Button('~r~~h~Stop Scenario') then
                ClearPedTasks(ped)
            end
            for theId,theItems in pairs(scens) do
                if theItems.category == "Misc" then
                    if WarMenu.Button(theItems.label) then
                    TaskStartScenarioInPlace(ped, theItems.scen, looped2, true)
                    end
                end
            end

            WarMenu.Display()

        elseif WarMenu.IsMenuOpened('closeMenu') then
            if WarMenu.Button('Yes') then
                WarMenu.CloseMenu()
            elseif WarMenu.MenuButton('No', 'test') then
            end

            WarMenu.Display()
        elseif IsControlJustReleased(0, 244) then --M by default
            WarMenu.OpenMenu('toolkit')
        end

        Citizen.Wait(0)
    end
end)

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    --SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    -- SetTextDropShadow()
    -- SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
    end

    function isCursorInZone(x1, y1, x2, y2, drawx, callBack)
      if CursorInZone(x1, y1, x2, y2) then

        DrawRect(0.277, drawx, 0.0489999999999999, 0.0439999999999999, 250, 251, 251, 228)
        callBack(true)


      end
    end

    if IsControlJustPressed(1, 329) or IsDisabledControlJustPressed(1, 329) then

      return true
    end
    
function getText(maxChars, callback)
    DisplayOnscreenKeyboard(false, "", "", "", "", "", "", maxChars)
    inputText = ""
    input = true
    textdone = false
    Citizen.CreateThread(function()
        while input do
            Citizen.Wait(0)
            HideHudAndRadarThisFrame()
            if (UpdateOnscreenKeyboard() == 3) then
                if (textdone) then
                    input = false
                    break
                end
            elseif (UpdateOnscreenKeyboard() == 1) then
                inputText = GetOnscreenKeyboardResult()
                if (string.len(inputText) > 0) then
                    input = false
                    textdone = true
                    callback(inputText)
                    break
                else
                    DisplayOnscreenKeyboard(false, "", "", inputText, "", "", "", maxChars)
                end
            elseif (UpdateOnscreenKeyboard() == 2) then
                if (textdone) then
                    input = false
                    callback("none")
                    break
                end
            end
        end
    end)
end