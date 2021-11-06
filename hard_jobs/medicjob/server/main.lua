local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

VorpInv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent("hard_jobs:checkjob")
AddEventHandler("hard_jobs:checkjob", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'medic' then
        TriggerClientEvent('hard_medic:open2', _source)
    else
        TriggerClientEvent("vorp:Tip", _source, "Last time i checked you are not a medic <3", 4000) -- from server side
    end
end)

RegisterServerEvent("hard_medic:giveMedicMeds")
AddEventHandler("hard_medic:giveMedicMeds", function()
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
                VorpInv.addItem(_source, "consumable_medicine", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source,"Not enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "Hard says your inventory is full :)", 3000)
        end
    end)
end)

RegisterServerEvent("hard_medic:giveMedicStim")
AddEventHandler("hard_medic:giveMedicStim", function()
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
                VorpInv.addItem(_source, "stim", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source,"Not enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "Hard says your inventory is full :)", 3000)
        end
    end)
end)

RegisterServerEvent("hard_medic:giveMedicDoghealth")
AddEventHandler("hard_medic:giveMedicDoghealth", function()
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
                VorpInv.addItem(_source, "Health_For_Dog", 1)
            else
                TriggerClientEvent("vorp:TipRight", _source,"Not enough money", 3000)
            end
        else
            TriggerClientEvent("vorp:TipRight", _source, "Hard says your inventory is full :)", 3000)
        end
    end)
end)
