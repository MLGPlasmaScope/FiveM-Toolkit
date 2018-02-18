--
--
--										BREATHALYZER FIVEM SCRIPT
--												 BY NIC
--											


	-- Registers functions for chat message --
RegisterServerEvent("chatMessage")
RegisterServerEvent("returnData")
RegisterServerEvent("setBac")

	-- Creates Array of BAC data of users --
	bacData = {} 
	
	
	-- Set BAC level for current player --

AddEventHandler('chatMessage', function(source, n, message)
	bacm = stringsplit(message, " ")
	
	if bacm[1] == "/bac" then
		CancelEvent()
		TriggerClientEvent("Bac", source)
		bacData[source] = bacm[2]
	
	end
end)


	-- Check user's BAC using player ID --


AddEventHandler('chatMessage', function(source, n, message)
    bm = stringsplit(message, " ")

    if bm[1] == "/breath" then
      CancelEvent()
	  
	if bm[2] == nil then
		TriggerClientEvent("breathNearby", source)
	end
	
    if tablelength(bm) > 1 then
      local tPID = tonumber(bm[2])
	  
		if bacData[tPID] ~= nil then
			TriggerClientEvent("Breath", source, bacData[tPID])
		elseif bacData[tPID] == nil then
			TriggerClientEvent("Breath", source, "0.00")
		end
    end
  end
end)


AddEventHandler('returnData', function(id)
	RconPrint("Breathalyzing: "..id)
	if bacData[id] ~= nil then
		TriggerClientEvent("Breath", source, bacData[id])
	elseif bacData[id] == nil then
		TriggerClientEvent("Breath", source, "0.00")
	end
end)


AddEventHandler("setBac", function(amount)

	TriggerClientEvent("Bac", source)
	bacData[source] = amount

end)


	-- Define chat structure '/command #' --

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end