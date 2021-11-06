local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("hard_jobs:checkjobsaloon")
AddEventHandler("hard_jobs:checkjobsaloon", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    for k,v in pairs(ConfigSl.SaloonLocs) do
        if job == v.Job then
            TriggerClientEvent('hard_vsaloon:open', _source)
        --[[else
            TriggerClientEvent("vorp:Tip", _source, "Last time i checked you dont work on the saloon <3", 4000) -- from server side]]
        end
    end
end)

RegisterServerEvent("hard_jobs:checkjobsaloon2")
AddEventHandler("hard_jobs:checkjobsaloon2", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'vsaloon2' then
        TriggerClientEvent('hard_vsaloon:open', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "Last time i checked you dont work on the saloon <3", 4000) -- from server side
    end
end)

RegisterServerEvent("hard_jobs:checkjobsaloon3")
AddEventHandler("hard_jobs:checkjobsaloon3", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'vsaloon3' then
        TriggerClientEvent('hard_vsaloon:open', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "Last time i checked you dont work on the saloon <3", 4000) -- from server side
    end
end)

RegisterServerEvent("hard_saloon:giveSaloonWhiskey")
AddEventHandler("hard_saloon:giveSaloonWhiskey", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  4
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "whiskey", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("hard_saloon:giveSaloonRum")
AddEventHandler("hard_saloon:giveSaloonRum", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  4
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "rum", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("hard_saloon:giveSaloonBourbon")
AddEventHandler("hard_saloon:giveSaloonBourbon", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  4
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "bourbon", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("hard_saloon:giveSaloonGin")
AddEventHandler("hard_saloon:giveSaloonGin", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  4
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "gin", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)

RegisterServerEvent("hard_saloon:giveSaloonPeanuts")
AddEventHandler("hard_saloon:giveSaloonPeanuts", function()
    local _source = source
    if count == nil then 
        count = 1
    end
    local User = VorpCore.getUser(source) -- Return User with functions and all characters
    local Character = VorpCore.getUser(source).getUsedCharacter
    local playername = Character.firstname .. ' ' .. Character.lastname
    local money = Character.money
    local take =  5
    local total = money - take
    TriggerEvent("vorpCore:canCarryItems", tonumber(_source), 1, function(canCarry)
        if canCarry then
            if total >= 0 then
                Character.removeCurrency(0, take)
                VorpInv.addItem(_source, "consumable_crackers", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source, "You dont have enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "You cant carry more of these", 3000)
        end
    end)
end)