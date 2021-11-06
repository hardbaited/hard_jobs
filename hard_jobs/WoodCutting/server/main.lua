RegisterNetEvent("hard_WoodCutter:FoundItems")
AddEventHandler("hard_WoodCutter:FoundItems", function()
    local _source = source 
    
    local itemWood = ConfigWoodCutter.WoodItem
    local randomChanceWood = math.random(1, 5)
    local randomChanceItemWood = ConfigWoodCutter.WoodItemChance
    
    if ConfigWoodCutter.EnableChanceDebug then
        print("Wood: The random number is " ..randomChanceWood .. " and must be <= to " .. ConfigWoodCutter.DropChanceWood .. " for the player to get the item.")
        print("those prints above will help you find the right numbers for your economy :)")
    end

    if randomChanceWood <= ConfigWoodCutter.DropChanceWood then
        VORP.addItem(_source, itemWood, randomChanceItemWood)
        TriggerClientEvent("vorp:TipRight", _source, "You found " .. randomChanceItemWood .. ' ' .. itemWood, 3000)

    else
        TriggerClientEvent("vorp:TipRight", _source, "The Wood You Found Was Wet So It Cant Be Used", 3000)
    end
end)