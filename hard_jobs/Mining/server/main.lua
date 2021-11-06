RegisterNetEvent("hard_mining:FoundItems")
AddEventHandler("hard_mining:FoundItems", function()
    local _source = source 
    
    local itemAlienFragment = ConfigMining.AlienFragmentItem
    local randomChanceAlienFragment = math.random(1, 10000)
    local randomChanceItemAlienFragment = ConfigMining.AlienFragmentItemChance
    
    local itemDiamond = ConfigMining.DiamondItem
    local randomChanceDiamond = math.random(1, 50)
    local randomChanceItemDiamond = ConfigMining.DiamondItemChance

    local itemGold = ConfigMining.GoldItem
    local randomChanceGold = math.random(1, 20)
    local randomChanceItemGold = ConfigMining.GoldItemChance

    local itemIron = ConfigMining.IronItem
    local randomChanceIron = math.random(1, 45)
    local randomChanceItemIron = ConfigMining.IronItemChance

    local itemCopper = ConfigMining.CopperItem
    local randomChanceCopper = math.random(1, 7)
    local randomChanceItemCopper = ConfigMining.CopperItemChance

    local itemRock = ConfigMining.RockItem
    local randomChanceRock = math.random(1, 45)
    local randomChanceItemRock = ConfigMining.RockItemChance
    
    if ConfigMining.EnableChanceDebug then
        print("Alien Fragment: The random number is " ..randomChanceAlienFragment .. " and must be == to " .. ConfigMining.DropChanceAlienFragment .. " for the player to get the item.")
        print("Diamond: The random number is " ..randomChanceDiamond .. " and must be <= to " .. ConfigMining.DropChanceDiamond .. " for the player to get the item.")
        print("Gold: The random number is " ..randomChanceGold .. " and must be <= to " .. ConfigMining.DropChanceGold .. " for the player to get the item.")
        print("Copper: The random number is " ..randomChanceCopper .. " and must be <= to " .. ConfigMining.DropChanceCopper .. " for the player to get the item.")
        print("Iron: The random number is " ..randomChanceIron .. " and must be <= to " .. ConfigMining.DropChanceIron .. " for the player to get the item.")
        print("Rock: The random number is " ..randomChanceRock .. " and must be <= to " ..ConfigMining.DropChanceRock .. " for the player to get the item.")
        print("those prints above will help you find the right numbers for your economy :)")
        print("---------------------------------------------------------------------------------------------------------------------------------------------------")
    end

    if randomChanceRock <= ConfigMining.DropChanceRock then
        VORP.addItem(_source, itemRock, randomChanceItemRock)
        TriggerClientEvent("vorp:TipRight", _source, "You found " .. randomChanceItemRock .. ' ' .. itemRock, 3000)

    elseif randomChanceCopper <= ConfigMining.DropChanceCopper then
        VORP.addItem(_source, itemCopper, randomChanceItemCopper)
        TriggerClientEvent("vorp:TipRight", _source, "You found " .. randomChanceItemCopper .. ' ' .. itemCopper, 3000)
        
    elseif randomChanceIron <= ConfigMining.DropChanceIron then
        VORP.addItem(_source, itemIron, randomChanceItemIron)
        TriggerClientEvent("vorp:TipRight", _source, "You found " .. randomChanceItemIron .. ' ' .. itemIron, 3000)

    elseif randomChanceGold <= ConfigMining.DropChanceGold  then
        VORP.addItem(_source, itemGold, randomChanceItemGold)
        TriggerClientEvent("vorp:TipRight", _source, "You found " .. randomChanceItemGold .. ' ' .. itemGold, 3000)

    elseif randomChanceDiamond <= ConfigMining.DropChanceDiamond then
        VORP.addItem(_source, itemDiamond, randomChanceItemDiamond)
        TriggerClientEvent("vorp:TipRight", _source, "You found " .. randomChanceItemDiamond .. ' ' .. itemDiamond, 3000)

    elseif randomChanceAlienFragment == ConfigMining.DropChanceAlienFragment then
        VORP.addItem(_source, itemAlienFragment, randomChanceItemAlienFragment)
        TriggerClientEvent("vorp:TipRight", _source, "You found " .. randomChanceItemAlienFragment .. ' ' .. itemAlienFragment, 3000)

    else
        TriggerClientEvent("vorp:TipRight", _source, "You found nothing", 3000)
    end
end)