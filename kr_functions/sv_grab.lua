RegisterServerEvent("chatMessage")

AddEventHandler('chatMessage', function(source, n, message)
    dm = stringsplit(message, " ")

    if dm[1] == "/grab" then
      CancelEvent()
	  
		if ((tablelength(dm) > 1) and (dm[2] ~= nil)) then
			local tPID = tonumber(dm[2])
			TriggerClientEvent("grab", tPID, source)
		elseif dm[2] == nil then
			TriggerClientEvent("grabNear",  source)
	 end
	 end
end)
	  
	 RegisterServerEvent("grabNear")

	AddEventHandler('grabNear', function(id)	
	
		TriggerClientEvent("grab", id, source)
	end)
	  
	  
	  
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