--[[ Credits by synTM ]]-- ! Don't Edit this Disclaimer !

local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

Citizen.CreateThread(function()

    Citizen.Wait(2000)

    VorpInv.RegisterUsableItem("consumable_haycube", function(data)
        VorpInv.subItem(data.source, "consumable_haycube", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're using some hay", 5000)
        TriggerClientEvent("syn:haycube", data.source)
    end)

    VorpInv.RegisterUsableItem("campfire", function(data)
        VorpInv.subItem(data.source, "campfire", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're placing a campfire", 5000)
        TriggerClientEvent("syn:campfire", data.source)
    end)

    VorpInv.RegisterUsableItem("tent", function(data)
        VorpInv.subItem(data.source, "tent", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're placing a tent", 5000)
        TriggerClientEvent("syn:tent", data.source)
    end)

    VorpInv.RegisterUsableItem("nativetent", function(data)
        VorpInv.subItem(data.source, "nativetent", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You're placing a tent", 5000)
        TriggerClientEvent("syn:NativeTent", data.source)
    end)

    VorpInv.RegisterUsableItem("territorymark", function(data)
        VorpInv.subItem(data.source, "territorymark", 1)
        TriggerClientEvent("syn:nativeTerritory", data.source)
    end)

    VorpInv.RegisterUsableItem("territorymarkgang", function(data)
        VorpInv.subItem(data.source, "territorymarkgang", 1)
        TriggerClientEvent("syn:GangTerritory", data.source)
    end)

    --synedits

    VorpInv.RegisterUsableItem("horsebrush", function(data)
        TriggerClientEvent("syn:brush", data.source)
    end)


    VorpInv.RegisterUsableItem("cigarette", function(data)
        VorpInv.subItem(data.source, "cigarette", 1)
        TriggerClientEvent("smokecigarette", data.source)
    end)
    
    VorpInv.RegisterUsableItem("cigar", function(data)
        VorpInv.subItem(data.source, "cigar", 1)
        TriggerClientEvent("smokecigar", data.source)
    end)

    VorpInv.RegisterUsableItem("stim", function(data)

        VorpInv.subItem(data.source, "stim", 1)
        TriggerClientEvent("vorp:TipRight", data.source, "You gave your horse stimulants", 5000)
        TriggerClientEvent("syn:horsestimulant", data.source)
    end)


    -- ## Items For The Jobs ## --
	VORP.RegisterUsableItem(ConfigMining.PickaxeItem, function(data)
		TriggerClientEvent('hard_jobs:StartMining', data.source)
	end)
    VORP.RegisterUsableItem(ConfigWoodCutter.AxeItem, function(data)
		TriggerClientEvent('hard_jobs:StartWoodCutting', data.source)
	end)

end)


RegisterNetEvent("syn:additem")
AddEventHandler("syn:additem", function(item)
    local _source = source
    VorpInv.addItem(source, item, 1)
end)