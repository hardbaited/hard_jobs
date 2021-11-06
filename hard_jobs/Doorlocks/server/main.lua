local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

local DoorInfo	= {}

RegisterServerEvent('gum_doorlock:Load')
AddEventHandler('gum_doorlock:Load', function()
	for k, v in pairs(DoorInfo) do
		TriggerClientEvent('gum_doorlock:setState', -1, v.doorID, v.state)
	end
end)

RegisterServerEvent('gum_doorlock:updatedoorsv')
AddEventHandler('gum_doorlock:updatedoorsv', function(doorID, cb)
    local _source = source
	
	local User = VorpCore.getUser(tonumber(_source))
	local Character = User.getUsedCharacter
	local job = Character.job
	
	if not IsAuthorized(job, ConfigDoorlocks.DoorList[doorID]) then
		TriggerClientEvent('vorp:TipRight', _source, 'You dont have the required job!', 2000)
		return
	else 
		TriggerClientEvent('gum_doorlock:changedoor', _source, doorID)
	end
end)

RegisterServerEvent('gum_doorlock:updateState')
AddEventHandler('gum_doorlock:updateState', function(doorID, state, cb)
    local _source = source
	
	local User = VorpCore.getUser(_source)
	local Character = User.getUsedCharacter
	local job = Character.job
	
	if type(doorID) ~= 'number' then
		return
	end

	if not IsAuthorized(job, ConfigDoorlocks.DoorList[doorID]) then
		return
	end
	
	DoorInfo[doorID] = {
		doorID = doorID,
		state = state
	}

	TriggerClientEvent('gum_doorlock:setState', -1, doorID, state)
end)

function IsAuthorized(jobName, doorID)
	for _,job in pairs(doorID.authorizedJobs) do
		if job == jobName then
			return true
		end
	end
	return false
end