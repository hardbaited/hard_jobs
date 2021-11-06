-- Medic Station
Citizen.CreateThread(function()
    while true do
        local ped = GetPlayerPed()
        local coords = GetEntityCoords(PlayerPedId())
        local sleep = true

        for k,v in pairs(ConfigMD.ZonesMedic) do
            if GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) <= 2 then
                sleep = false
                TriggerEvent("enter:medic")
                if whenKeyJustPressed(keys["G"]) then
                    TriggerServerEvent("hard_jobs:checkjob")
                end
            end
        end
        Citizen.Wait(5)
        
        if sleep then
            Wait(1000)
        end
    end
end)

function openMedicmenu()
	MenuData.CloseAll()
	local elements = {
		{label = "Medicine", value = 'med' , desc = "Mr. Harrys Magic Medicine $5"},
		{label = "Horse Medicine", value = 'med2' , desc = "Horse Medicine $5"},
		{label = "Dog Medicine", value = 'med3' , desc = "Dog Medicine $5"},
	}
   MenuData.Open('default', GetCurrentResourceName(), 'menuapi',
	{
		title    = "Medic Shop",
		subtext    = "Buy Meds",
		align    = 'left',
		elements = elements,
	},
	function(data, menu)
		if  (data.current.value == 'med') then 
            TriggerServerEvent("hard_medic:giveMedicMeds")
            TriggerEvent("vorp:TipRight", "You Bought 1 Medicine", 2000)
        elseif (data.current.value == 'med2') then 
            TriggerServerEvent("hard_medic:giveMedicStim")
            TriggerEvent("vorp:TipRight", "You Bought 1 Horse Medicine", 2000)
        elseif (data.current.value == 'med3') then 
            TriggerServerEvent("hard_medic:giveMedicDoghealth")
            TriggerEvent("vorp:TipRight", "You Bought 1 Dog Medicine", 2000)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end


RegisterNetEvent("enter:medic")
AddEventHandler("enter:medic", function()
    SetTextScale(0.5, 0.5)
    --SetTextFontForCurrentCommand(1)
    local msg = "Press G To Access The Medic Shop"
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", msg, Citizen.ResultAsLong())

    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

RegisterNetEvent("hard_medic:open2")
AddEventHandler("hard_medic:open2", function(cb)
    openMedicmenu()
end)

function whenKeyJustPressed(key)
    if Citizen.InvokeNative(0x580417101DDB492F, 0, key) then
        return true
    else
        return false
    end
end

Citizen.CreateThread(function()
    for k, v in pairs(ConfigMD.ZonesMedic) do
        local blip = N_0x554d9d53f696d002(1664425300, v.Pos.x, v.Pos.y, v.Pos.z)
        SetBlipSprite(blip, 2555280553, 1)
        Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Pharmacy")
    end
end)
