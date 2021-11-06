--[[ Credits by synTM ]] -- ! Don't Edit this Disclaimer !

RegisterNetEvent("syn:coffee")
RegisterNetEvent("syn:haycube")
RegisterNetEvent("syn:beans")
RegisterNetEvent("syn:peach")
RegisterNetEvent("syn:salmon")
RegisterNetEvent("syn:medicine")
RegisterNetEvent("syn:tent")
RegisterNetEvent("syn:NativeTent")
RegisterNetEvent("syn:nativeTerritory")
RegisterNetEvent("syn:GangTerritory")
RegisterNetEvent("syn:campfire")


--[[AddEventHandler(
    "syn:coffee",
    function(source)
        local _source = source

        local propEntity =
            CreateObject(GetHashKey("p_mugCoffee01x"), GetEntityCoords(PlayerPedId()), false, true, false, false, true)
        TaskItemInteraction_2(
            PlayerPedId(),
            -1199896558,
            propEntity,
            GetHashKey("p_mugCoffee01x_ph_r_hand"),
            GetHashKey("DRINK_COFFEE_HOLD"),
            1,
            0,
            -1.0
        )
        Citizen.Wait(5000)
        TriggerEvent("srp:drink", 30)
        TriggerEvent("srp:eat", -5)
        Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 1, 1000.0, false)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
            print(number)
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, number + 25)
        else
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 25)
        end
        Citizen.Wait(1000)
        local closestPlayerPed = GetPlayerPed(closestPlayer)
        local health = GetAttributeCoreValue(closestPlayerPed, 0)
        local newHealth = health + 25
        local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
        local newStamina = stamina + 25
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
        Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
        --end
    end
)]]

AddEventHandler(
    "syn:haycube",
    function(source)
        local Ped = PlayerPedId()
        local SulCavallo = IsPedOnMount(Ped)
        local _source = source
        if SulCavallo then
            --end
            local Cavallo = GetMount(Ped)
            --if IsThisModelAHorse(Cavallo) then

            -- TaskAnimalInteraction(Ped, Cavallo, -224471938, true, true) --Animazione
            TaskAnimalInteraction(Ped, Cavallo, -224471938, GetHashKey("s_horsnack_haycube01x"), 0)
            --TriggerEvent("syn:exp", Cavallo, 1000)
            local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, Cavallo, 0)
            local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, Cavallo, 1)

            if not tonumber(valueHealth) then
                valueHealth = 0
            end
            if not tonumber(valueStamina) then
                valueStamina = 0
            end
            Citizen.Wait(3500)
            Citizen.InvokeNative(0xC6258F41D86676E0, Cavallo, 0, valueHealth + 15)
            Citizen.InvokeNative(0xC6258F41D86676E0, Cavallo, 1, valueStamina + 15)
        else
            --end
            TaskItemInteraction(
                PlayerPedId(),
                nil,
                GetHashKey("EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND"),
                true,
                0,
                0
            )
            Citizen.Wait(1000)
            TriggerEvent("srp:eat", 15)
            TriggerEvent("srp:drink", -5)
            local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
            if number then
                print(number)
                Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, number + 25)
            else
                Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 25)
            end
        end
    end
)

--[[RegisterNetEvent("syn:carrot")
AddEventHandler(
    "syn:carrot",
    function(source)
        local Ped = PlayerPedId()
        local SulCavallo = IsPedOnMount(Ped)
        local _source = source
        if SulCavallo then
            --end
            local Cavallo = GetMount(Ped)
            --if IsThisModelAHorse(Cavallo) then

            TaskAnimalInteraction(Ped, Cavallo, -224471938, GetHashKey("p_carrot02x"), 0) --Animazione

            local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, Cavallo, 0)
            local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, Cavallo, 1)

            if not tonumber(valueHealth) then
                valueHealth = 0
            end
            if not tonumber(valueStamina) then
                valueStamina = 0
            end
            Citizen.Wait(3500)
            Citizen.InvokeNative(0xC6258F41D86676E0, Cavallo, 0, valueHealth + 30)
            Citizen.InvokeNative(0xC6258F41D86676E0, Cavallo, 1, valueStamina + 30)
        else
            --end
            TaskItemInteraction(
                PlayerPedId(),
                nil,
                GetHashKey("EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND"),
                true,
                0,
                0
            )
            Citizen.Wait(1000)
            TriggerEvent("srp:eat", 25)
            TriggerEvent("srp:drink", -5)
            local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
            if number then
                print(number)
                Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, number + 25)
            else
                Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 25)
            end
        end
    end
)

AddEventHandler(
    "syn:beans",
    function(source)
        local _source = source
        TaskItemInteraction(
            PlayerPedId(),
            nil,
            GetHashKey("EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND"),
            true,
            0,
            0
        )
        Citizen.Wait(1000)
        TriggerEvent("srp:eat", 30)
        TriggerEvent("srp:drink", 5)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
            print(number)
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, number + 25)
        else
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 25)
        end
    end
)

AddEventHandler(
    "syn:peach",
    function(source)
        local _source = source
        TaskItemInteraction(
            PlayerPedId(),
            nil,
            GetHashKey("EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND"),
            true,
            0,
            0
        )
        Citizen.Wait(1000)
        TriggerEvent("srp:drink", 10)
        TriggerEvent("srp:eat", 25)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
            print(number)
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, number + 25)
        else
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 25)
        end
    end
)

AddEventHandler(
    "syn:salmon",
    function(source)
        local _source = source
        TaskItemInteraction(
            PlayerPedId(),
            nil,
            GetHashKey("EAT_MULTI_BITE_FOOD_SPHERE_D8-2_SANDWICH_QUICK_LEFT_HAND"),
            true,
            0,
            0
        )
        Citizen.Wait(1000)
        TriggerEvent("srp:drink", -25)
        TriggerEvent("srp:eat", 60)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
            print(number)
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, number + 25)
        else
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 25)
        end
    end
)]]

local status = false

AddEventHandler(
    "syn:medicine",
    function(source)
        if status == false then
            local playerPed = PlayerPedId()
            local propEntity =
                CreateObject(GetHashKey("p_bottleJD01x"), GetEntityCoords(PlayerPedId()), false, false, 1, 1, 0)
            TaskItemInteraction_2(
                PlayerPedId(),
                1737033966,
                propEntity,
                GetHashKey("p_bottleJD01x_ph_r_hand"),
                GetHashKey("DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_UNCORK"),
                true,
                0,
                0
            )
            status = true
            Citizen.Wait(10000)
            for i = 1, 10 do
                local closestPlayerPed = GetPlayerPed(closestPlayer)
                local health = GetAttributeCoreValue(closestPlayerPed, 0)
                local newHealth = health + 100
                local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
                local newStamina = stamina + 100
                Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
                Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
            end
        elseif status == true then
            TriggerEvent("vorp:TipBottom", "You're already drinking a Medicine", 4000)
        end
        status = false
    end
)

AddEventHandler("syn:tent", function()
    if tent ~= 0 then
        SetEntityAsMissionEntity(tent)
        DeleteObject(tent)
        tent = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 50000, true, false, false, false)
    exports["progressBars"]:startUI(50000, "You're making a tent...")
    Citizen.Wait(50000)
    ClearPedTasksImmediately(PlayerPedId())
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local prop = CreateObject(GetHashKey("mp005_s_posse_tent_bountyhunter07x"), x, y, z, true, false, true)
    SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(prop)
    tent = prop
end)

AddEventHandler("syn:NativeTent", function()
    if NativeTent ~= 0 then
        SetEntityAsMissionEntity(NativeTent)
        DeleteObject(NativeTent)
        NativeTent = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 50000, true, false, false, false)
    exports["progressBars"]:startUI(50000, "You're making a tent...")
    Citizen.Wait(50000)
    ClearPedTasksImmediately(PlayerPedId())
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local propNativeTent = CreateObject(GetHashKey("p_tentmountainmen02x"), x, y, z, true, false, true)
    SetEntityHeading(propNativeTent, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(propNativeTent)
    NativeTent = propNativeTent
end)

AddEventHandler("syn:nativeTerritory", function()
    if territory ~= 0 then
        SetEntityAsMissionEntity(territory)
        DeleteObject(territory)
        territory = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 10000, true, false, false, false)
    exports["progressBars"]:startUI(10000, "You're marking your territory...")
    Citizen.Wait(10000)
    ClearPedTasksImmediately(PlayerPedId())
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local propTerritory = CreateObject(GetHashKey("p_spookynative05x"), x, y, z, true, false, true)
    SetEntityHeading(propTerritory, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(propTerritory)
    territory = propTerritory
end)

AddEventHandler("syn:GangTerritory", function()
    if territory2 ~= 0 then
        SetEntityAsMissionEntity(territory2)
        DeleteObject(territory2)
        territory2 = 0
    end
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 10000, true, false, false, false)
    exports["progressBars"]:startUI(10000, "You're marking your territory...")
    Citizen.Wait(10000)
    ClearPedTasksImmediately(PlayerPedId())
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
    local propTerritory2 = CreateObject(GetHashKey("p_skullpost02x"), x, y, z, true, false, true)
    SetEntityHeading(propTerritory2, GetEntityHeading(PlayerPedId()))
    PlaceObjectOnGroundProperly(propTerritory2)
    territory2 = propTerritory2
end)


RegisterCommand(
    "dGangTerritory",
    function(source, args, rawCommand)
        if territory2 == 0 then
            --   print("No hay tienda.")
        else
            local playerPed = PlayerPedId()
            TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 5000, true, false, false, false)
            exports["progressBars"]:startUI(5000, "You're taking your mark apart...")
            Citizen.Wait(5000)
            SetEntityAsMissionEntity(territory2)
            DeleteObject(territory2)
            territory2 = 0
            TriggerServerEvent("syn:additem", "territorymarkgang")
        end
end, false)

local territory2 = 0

RegisterCommand(
    "dNativeTent",
    function(source, args, rawCommand)
        if NativeTent == 0 then
            --   print("No hay tienda.")
        else
            local playerPed = PlayerPedId()
            TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 50000, true, false, false, false)
            exports["progressBars"]:startUI(50000, "You're taking your mark apart...")
            Citizen.Wait(50000)
            SetEntityAsMissionEntity(NativeTent)
            DeleteObject(NativeTent)
            NativeTent = 0
            TriggerServerEvent("syn:additem", "nativetent")
        end
end, false)

local NativeTent = 0

RegisterCommand(
    "dNativeTerritory",
    function(source, args, rawCommand)
        if territory == 0 then
            --   print("No hay tienda.")
        else
            local playerPed = PlayerPedId()
            TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 5000, true, false, false, false)
            exports["progressBars"]:startUI(5000, "You're taking your mark apart...")
            Citizen.Wait(5000)
            SetEntityAsMissionEntity(territory)
            DeleteObject(territory)
            territory = 0
            TriggerServerEvent("syn:additem", "territorymark")
        end
end, false)

local territory = 0

AddEventHandler(
    "syn:campfire",
    function()
        if campfire ~= 0 then
            SetEntityAsMissionEntity(campfire)
            DeleteObject(campfire)
            campfire = 0
        end
        local playerPed = PlayerPedId()
        TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 30000, true, false, false, false)
        exports["progressBars"]:startUI(30000, "You're making fire...")
        Citizen.Wait(30000)
        ClearPedTasksImmediately(PlayerPedId())
        local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, -1.55))
        local prop = CreateObject(GetHashKey("p_campfire02x"), x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(PlayerPedId()))
        PlaceObjectOnGroundProperly(prop)
        campfire = prop
    end
)

RegisterCommand(
    "dtent",
    function(source, args, rawCommand)
        if tent == 0 then
            --   print("No hay tienda.")
        else
            local playerPed = PlayerPedId()
            TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 50000, true, false, false, false)
            exports["progressBars"]:startUI(50000, "You're taking the tent apart...")
            Citizen.Wait(50000)
            SetEntityAsMissionEntity(tent)
            DeleteObject(tent)
            tent = 0
            TriggerServerEvent("syn:additem", "tent")
        end
end, false)

local tent = 0

RegisterCommand(
    "dcampfire",
    function(source, args, rawCommand)
        if campfire == 0 then
            --   print("There is no campfire.")
        else
            local playerPed = PlayerPedId()
            TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_CROUCH_INSPECT"), 30000, true, false, false, false)
            exports["progressBars"]:startUI(30000, "You're extinguishing the campfire...")
            Citizen.Wait(30000)
            SetEntityAsMissionEntity(campfire)
            DeleteObject(campfire)
            campfire = 0
            TriggerServerEvent("syn:additem", "campfire")
        end
    end,
    false
)

local campfire = 0

-- Syn Edits

RegisterNetEvent("smokecigar")
AddEventHandler(
    "smokecigar",
    function()
        --Citizen.InvokeNative(0xB31A277C1AC7B7FF, PlayerPedId(), 1, 1, GetHashKey("KIT_EMOTE_ACTION_SMOKE_CIGAR_1"), 3, 0, 1, 0, 1) -- UPPER BODY EMOTE
        local playerPed = PlayerPedId()
        TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_SMOKE_CIGAR"), 120000, true, false, false, false)

        --[[local smoke = true --UNCOMMENT IF YOU WANT TO HAVE A BUFF
        while smoke do
            Wait(25000)
            Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 0, 1000.0, false)
            PlaySoundFrontend("Core_Fill_Up", "Consumption_Sounds", true, 0)
            smoke = false
        end]]
    end
)

RegisterNetEvent("smokecigarette")
AddEventHandler(
    "smokecigarette",
    function()
        --[[Citizen.InvokeNative(
            0xB31A277C1AC7B7FF,
            PlayerPedId(),
            0,
            0,
            GetHashKey("KIT_EMOTE_ACTION_SMOKE_CIGARETTE_1"),
            1,
            1,
            0,
            0,
            0
        ) -- UPPER BODY EMOTE]]
        local playerPed = PlayerPedId()
        TaskStartScenarioInPlace(playerPed, GetHashKey("WORLD_HUMAN_SMOKE_INTERACTION"), 120000, true, false, false, false)
        --[[local smoke = true
        while smoke do
            Wait(25000)
            Citizen.InvokeNative(0xF6A7C08DF2E28B28, PlayerPedId(), 0, 800.0, false)
            PlaySoundFrontend("Core_Fill_Up", "Consumption_Sounds", true, 0)
            smoke = false
        end]]
    end
)

RegisterNetEvent("syn:horsestimulant")
AddEventHandler(
    "syn:horsestimulant",
    function(source)
        local Ped = PlayerPedId()
        local SulCavallo = IsPedOnMount(Ped)
        local _source = source

        local Cavallo = GetMount(Ped)
        --if IsThisModelAHorse(Cavallo) then

        TaskAnimalInteraction(PlayerPedId(), Cavallo,-1355254781, 0, 0) --stem
        TaskAnimalInteraction(PlayerPedId(), Cavallo, -1355254781, GetHashKey("p_cs_syringe01x"), 0)

        local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, Cavallo, 0)
        local valueStamina = Citizen.InvokeNative(0x36731AC041289BB1, Cavallo, 1)

        if not tonumber(valueHealth) then
            valueHealth = 0
        end
        if not tonumber(valueStamina) then
            valueStamina = 0
        end
        Citizen.Wait(3500)
        Citizen.InvokeNative(0xC6258F41D86676E0, Cavallo, 0, valueHealth + 35)
        Citizen.InvokeNative(0xC6258F41D86676E0, Cavallo, 1, valueStamina + 35)

        Citizen.InvokeNative(0xF6A7C08DF2E28B28, Cavallo, 0, 1000.0)
        Citizen.InvokeNative(0xF6A7C08DF2E28B28, Cavallo, 1, 1000.0)

        Citizen.InvokeNative(0x50C803A4CD5932C5, true) --core
        Citizen.InvokeNative(0xD4EE21B7CC7FD350, true) --core
        PlaySoundFrontend("Core_Fill_Up", "Consumption_Sounds", true, 0)
    end
)

RegisterNetEvent("syn:brush")
AddEventHandler(
    "syn:brush",
    function(source)
        local _source = source
        local Ped = PlayerPedId()
        local Cavallo = Citizen.InvokeNative(0x4C8B59171957BCF7, PlayerPedId())
        local pCoords = GetEntityCoords(Ped)
        local cCoords = GetEntityCoords(Cavallo)
        local Distanza = GetDistanceBetweenCoords(pCoords, cCoords)
        if Distanza < 1.0 then
            TriggerEvent("vorp:TipRight", "You used the brush", 5000)
            TaskAnimalInteraction(Ped, Cavallo, 1968415774, true, true)
            --TriggerEvent("syn:exp", Cavallo, 1)
            TaskAnimalInteraction(Ped, Cavallo, 554992710, GetHashKey("P_BRUSHHORSE02X"), 0)
            local valueHealth = Citizen.InvokeNative(0x36731AC041289BB1, Cavallo, 0) -- Controlla la vita del cavallo
            if not tonumber(valueHealth) then
                valueHealth = 0
            end
            Citizen.Wait(3000)
            Citizen.InvokeNative(0xC6258F41D86676E0, Cavallo, 0, valueHealth + 5) -- Cura il cavallo di poco (5)
            Citizen.InvokeNative(0x6585D955A68452A5, Cavallo) -- Pulisce il cavallo
            Citizen.InvokeNative(0xB5485E4907B53019, Cavallo) -- Setta il cavallo bagnato
        else
            TriggerEvent("vorp:TipRight", "You are not near your horse", 3000)
            Wait(0)
        end
    end
)

-- Command for clearing ped animations instantly
RegisterCommand(
    "c",
    function(source, args, rawCommand)
        ClearPedTasksImmediately(PlayerPedId())
    end,
    false
)

--stew use for later camp upgrades
keys = {
    -- Letter E
    ["G"] = 0x760A9C6F
}

function whenKeyJustPressed(key) ---iscontorlpressed doesnt work in vehicles or some shit, this works
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local str = CreateVarString(10, "LITERAL_STRING", str)
    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)
    SetTextFontForCurrentCommand(15)
    if enableShadow then
        SetTextDropshadow(1, 0, 0, 0, 255)
    end
    DisplayText(str, x, y)
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(1)
            local player = PlayerPedId()
            local Coords = GetEntityCoords(player)
            local stew = DoesObjectOfTypeExistAtCoords(Coords.x, Coords.y, Coords.z, 1.5, 174418135, 0) -- (-808559472)
            if stew ~= false then
                DrawTxt("Press [~e~G~q~] to get stew", 0.50, 0.95, 0.7, 0.5, true, 255, 255, 255, 255, true)
                if whenKeyJustPressed(keys["G"]) then
                    local bowl =
                        CreateObject("p_bowl04x_stew", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
                    local spoon =
                        CreateObject("p_spoon01x", GetEntityCoords(PlayerPedId()), true, true, false, false, true)

                    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
                    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)

                    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)

                    TaskItemInteraction_2(
                        PlayerPedId(),
                        599184882,
                        bowl,
                        GetHashKey("p_bowl04x_stew_ph_l_hand"),
                        -583731576,
                        1,
                        0,
                        -1.0
                    )
                    TaskItemInteraction_2(
                        PlayerPedId(),
                        599184882,
                        spoon,
                        GetHashKey("p_spoon01x_ph_r_hand"),
                        -583731576,
                        1,
                        0,
                        -1.0
                    )

                    Citizen.InvokeNative(0xB35370D5353995CB, PlayerPedId(), -583731576, 1.0)

                    Citizen.Wait(5000)

                    TriggerEvent("srp:drink", 40)
                    TriggerEvent("srp:eat", 60)
                    local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
                    if number then
                        print(number)
                        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, number + 25)
                    else
                        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 25)
                    end
                    Citizen.Wait(5000)

                    local closestPlayerPed = GetPlayerPed(closestPlayer)
                    local health = GetAttributeCoreValue(closestPlayerPed, 0)
                    local newHealth = health + 40
                    local stamina = GetAttributeCoreValue(closestPlayerPed, 1)
                    local newStamina = stamina + 40
                    local health2 = GetEntityHealth(closestPlayerPed)
                    local newHealth2 = health2 + 40
                    Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 0, newHealth) --core
                    Citizen.InvokeNative(0xC6258F41D86676E0, closestPlayerPed, 1, newStamina) --core
                    SetEntityHealth(closestPlayerPed, newHealth2)
                end
            end
        end
    end
)

--[[RegisterNetEvent("syn:meatgreavy")
AddEventHandler(
    "syn:meatgreavy",
    function(source)
        local _source = source
        local bowl = CreateObject("p_bowl04x_stew", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
        local spoon = CreateObject("p_spoon01x", GetEntityCoords(PlayerPedId()), true, true, false, false, true)

        Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)

        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)

        TaskItemInteraction_2(
            PlayerPedId(),
            599184882,
            bowl,
            GetHashKey("p_bowl04x_stew_ph_l_hand"),
            -583731576,
            1,
            0,
            -1.0
        )
        TaskItemInteraction_2(
            PlayerPedId(),
            599184882,
            spoon,
            GetHashKey("p_spoon01x_ph_r_hand"),
            -583731576,
            1,
            0,
            -1.0
        )

        Citizen.InvokeNative(0xB35370D5353995CB, PlayerPedId(), -583731576, 1.0)

        Citizen.Wait(1000)
        TriggerEvent("srp:drink", 30)
        TriggerEvent("srp:eat", 60)
        local number = Citizen.InvokeNative(0x36731AC041289BB1, PlayerPedId(), 1)
        if number then
            print(number)
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, number + 25)
        else
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, 25)
        end
    end
)]]
