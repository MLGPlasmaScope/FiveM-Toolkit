RegisterServerEvent("cuffNear")
AddEventHandler("cuffNear", function(id)

	print("cuffing "..id)
	TriggerClientEvent("cuff1", id)

end)

RegisterServerEvent("chatMessage")
AddEventHandler('chatMessage', function(source, n, message)
    cm = stringsplit(message, " ")

    if cm[1] == "/cuff" then
      CancelEvent()
    if (cm[2] ~= nil) then
      local tPID = tonumber(cm[2])
      TriggerClientEvent("cuff1", tPID)
	elseif (cm[2] == nil) then
		TriggerClientEvent("cuff", source)
    end
  end
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