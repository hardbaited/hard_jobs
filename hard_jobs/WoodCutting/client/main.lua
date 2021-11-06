WoodCutting = false

RegisterNetEvent('hard_jobs:StartWoodCutting')
AddEventHandler('hard_jobs:StartWoodCutting', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local sleep = true

    if ConfigWoodCutter.UseMontosRest then
        for k,v in pairs(ConfigWoodCutter.MontosRest) do 
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                sleep = false
                StartJobWoodCutting()
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

        if ConfigWoodCutter.UseMontosRest then
            for k,v in pairs(ConfigWoodCutter.MontosRest) do 
                if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                    sleep = false
                    PrintTextWood()
                end
            end
        end
        Citizen.Wait(5)

        if sleep then
            Wait(1000)
        end
    end
end)

function PrintTextWood()
    SetTextScale(0.3, 0.3)
    SetTextFontForCurrentCommand(1)
    local msg = "Use you axe to start cutting down trees"
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())

    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end

function DoAnimWood()
    TaskStartScenarioInPlace(PlayerPedId(), GetHashKey('EA_WORLD_HUMAN_TREE_CHOP_NEW'), -1, true, false, false, false)
end

function StartJobWoodCutting()
    if not WoodCutting then
        local ped = PlayerPedId()
        DoAnimWood()
        WoodCutting = true
        exports['progressBars']:startUI(30000, "Cutting Down Tree...")
        Wait(30000)
        ClearPedTasksImmediately(ped)
        TriggerServerEvent("hard_WoodCutter:FoundItems")
        WoodCutting = false
    end
end

Citizen.CreateThread(function()
    if ConfigWoodCutter.MontosRestBlip then
        local blip = N_0x554d9d53f696d002(1664425300, ConfigWoodCutter.MontosRestBlipLocation.x, ConfigWoodCutter.MontosRestBlipLocation.y, ConfigWoodCutter.MontosRestBlipLocation.z)
        SetBlipSprite(blip, 1480984695, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Tree Farm")
    end
end)