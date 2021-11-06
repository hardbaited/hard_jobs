Mining = false

RegisterNetEvent('hard_jobs:StartMining')
AddEventHandler('hard_jobs:StartMining', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local sleep = true

    if ConfigMining.UseAnnesburg then
        for k,v in pairs(ConfigMining.Annesburg) do 
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                sleep = false
                StartJob()
            end
        end
    end

    if ConfigMining.UseNativeCave then
        for k,v in pairs(ConfigMining.NativeCave) do 
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                sleep = false
                StartJob()
            end
        end
    end

    if ConfigMining.UseTumbleWeed then
        for k,v in pairs(ConfigMining.TubmleWeed) do 
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                sleep = false
                StartJob()
            end
        end
    end

    if sleep then
        Wait(1000)
    end
end)

Citizen.CreateThread(function()
    Citizen.Wait(5)
    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local sleep = true

        if ConfigMining.UseAnnesburg then
            for k,v in pairs(ConfigMining.Annesburg) do 
                if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                    sleep = false
                    PrintText()
                end
            end
        end

        if ConfigMining.UseNativeCave then
            for k,v in pairs(ConfigMining.NativeCave) do 
                if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                    sleep = false
                    PrintText()
                end
            end
        end

        if ConfigMining.UseTumbleWeed then
            for k,v in pairs(ConfigMining.TubmleWeed) do 
                if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                    sleep = false
                    PrintText()
                end
            end
        end
        Citizen.Wait(5)

        if sleep then
            Wait(1000)
        end
    end
end)

function PrintText()
    SetTextScale(0.3, 0.3)
    SetTextFontForCurrentCommand(1)
    local msg = "Use you pickaxe to start mining"
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())

    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end

function DoAnimMining()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('WORLD_HUMAN_PICKAXE_WALL'), -1, true, false, false, false)
end

function StartJob()
    if not Mining then
        local ped = PlayerPedId()
        DoAnimMining()
        Mining = true
        exports['progressBars']:startUI(20000, "Mining...")
        Wait(20000)
        ClearPedTasksImmediately(ped)
        TriggerServerEvent("hard_mining:FoundItems")
        Mining = false
    end
end

Citizen.CreateThread(function()
    if ConfigMining.TubmleWeedBlip then
        local blip = N_0x554d9d53f696d002(1664425300, ConfigMining.TubmleWeedBlipLocation.x, ConfigMining.TubmleWeedBlipLocation.y, ConfigMining.TubmleWeedBlipLocation.z)
        SetBlipSprite(blip, 3535996525, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Mines")
    end

    if ConfigMining.AnnesburgBlip then
        local blip = N_0x554d9d53f696d002(1664425300, ConfigMining.TubmleWeedBlipLocation.x, ConfigMining.TubmleWeedBlipLocation.y, ConfigMining.TubmleWeedBlipLocation.z)
        SetBlipSprite(blip, 3535996525, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Mines")
    end

    if ConfigMining.NativeCaveBlip then
        local blip = N_0x554d9d53f696d002(1664425300, ConfigMining.NativeCaveBlipLocation.x, ConfigMining.NativeCaveBlipLocation.y, ConfigMining.NativeCaveBlipLocation.z)
        SetBlipSprite(blip, 3535996525, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Mines")
    end
end)