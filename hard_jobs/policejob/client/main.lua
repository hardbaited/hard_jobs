Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())

        if whenKeyJustPressed(0x4AF4D473) then
            TriggerServerEvent("vorp_ml_policejob:checkjob")
        end

        Citizen.Wait(5)
    end
end)

function openPolicemenu()
	MenuData.CloseAll()
	local elements = {
		{label = "Sheriff Star", value = 'star' , desc = "Put On Your Star"},
		{label = "Cuff Citizen", value = 'cuff' , desc = "Cuff A Citizen"},
		{label = "UnCuff Citizen", value = 'uncuff' , desc = "UnCuff A Citizen"},
	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = "Sheriff Menu",
		subtext    = "Sheriff Stuff",
		align    = 'left',
		elements = elements,
	},
	function(data, menu)
		if (data.current.value == 'star') then 
			if not IsPedMale(ped) then
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(),  0x1FC12C9C, true, true, true)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
            else
                Citizen.InvokeNative(0xD3A7B003ED343FD9, PlayerPedId(), 0xDB4C451D, true, false, true)
                Citizen.InvokeNative(0xCC8CA3E88256E58F, PlayerPedId(), 0, 1, 1, 1, false)
            end
            TriggerEvent("vorp:TipRight", "You have put on your star", 2000)

        elseif (data.current.value == 'cuff') then
            local closestPlayer, closestDistance = GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                TriggerServerEvent("vorp_ml_policejob:cuffplayer", GetPlayerServerId(closestPlayer))
                TriggerEvent("vorp:TipRight", "You have cuffed a citizen", 2000)
            end

        elseif (data.current.value == 'uncuff') then
            local closestPlayer, closestDistance = GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 3.0 then
                TriggerServerEvent("vorp_ml_policejob:uncuffplayer", GetPlayerServerId(closestPlayer))
                TriggerEvent("vorp:TipRight", "You have uncuffed a citizen", 2000)
            end
		end
	end,
	function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent("vorp_ml_policejob:open")
AddEventHandler("vorp_ml_policejob:open", function(cb)
    openPolicemenu()
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

--Police cuff
function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end

    for i = 1, #players, 1 do
        local tgt = GetPlayerPed(players[i])

        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then
            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

RegisterNetEvent("vorp_ml_policejob:cuff")
AddEventHandler("vorp_ml_policejob:cuff", function()
    local playerPed = PlayerPedId()
    SetEnableHandcuffs(playerPed, true)
    --print("cuffplayer")
end)

--IsPedCuffed(playerPed, true)

RegisterNetEvent("vorp_ml_policejob:uncuff")
AddEventHandler("vorp_ml_policejob:uncuff", function()
    local playerPed = PlayerPedId()
    UncuffPed(playerPed)
    --print("uncuffplayer")
end)

RegisterNetEvent("vorp_ml_policejob:hogtie")
AddEventHandler("vorp_ml_policejob:hogtie", function()
    isLasso = not isLasso
    local playerPed = PlayerPedId()
    Citizen.CreateThread(function()
        if isLasso then
            TaskKnockedOutAndHogtied(playerPed, false, false)
            SetEnableHandcuffs(playerPed, true)
            DisablePlayerFiring(playerPed, true)
            SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_UNARMED"), true) -- unarm player
            SetPedCanPlayGestureAnims(playerPed, false)
            DisplayRadar(false)
        elseif not isLasso then
            ClearPedTasksImmediately(playerPed, true, false)
            ClearPedSecondaryTask(playerPed)
            SetEnableHandcuffs(playerPed, false)
            DisablePlayerFiring(playerPed, false)
            SetPedCanPlayGestureAnims(playerPed, true)
            DisplayRadar(true)
        end
    end)
end)

Citizen.CreateThread(function()
    for k, v in pairs(Config.Zones) do
        local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
        SetBlipSprite(blip, 1047294027, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Sheriffs Office")
    end
end)
