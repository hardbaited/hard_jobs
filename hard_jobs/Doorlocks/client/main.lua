local buttons_prompt = GetRandomIntInRange(0, 0xffffff)
local active = false
-- RegisterNetEvent("vorp:SelectedCharacter")
-- AddEventHandler("vorp:SelectedCharacter", function(charid)
     TriggerServerEvent('gum_doorlock:Load')
-- end)
function Button_Prompt()
    Citizen.CreateThread(function()
        local str = 'Unlock'
        UnLockDoor = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(UnLockDoor, 0x27D1C284)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(UnLockDoor, str)
        PromptSetEnabled(UnLockDoor, true)
        PromptSetVisible(UnLockDoor, true)
        PromptSetHoldMode(UnLockDoor, true)
        PromptSetGroup(UnLockDoor, buttons_prompt)
        PromptRegisterEnd(UnLockDoor)
    end)
end
-- RegisterNetEvent("vorp:SelectedCharacter")
-- AddEventHandler("vorp:SelectedCharacter", function(charid)
	Citizen.CreateThread(function()
        Button_Prompt()
	    while true do
            Citizen.Wait(10)
            local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true
            for k,doorID in ipairs(ConfigDoorlocks.DoorList) do
                local distance
                if doorID.doors then
                    distance = #(playerCoords - doorID.doors[1].objCoords)
                else
                    distance = #(playerCoords - doorID.textCoords)
                end
                local maxDistance, displayText = 1.00, 'open'
                if doorID.distance then
                    maxDistance = doorID.distance
                end
                if distance < 1 then
                    letSleep = false
                    if doorID.locked then
                        if DoorSystemGetOpenRatio(doorID.object) ~= 0.0 then
                            DoorSystemSetOpenRatio(doorID.object, 0.0, true)
                            local object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object, 0)
                            SetEntityRotation(object, 0.0, 0.0, doorID.objYaw, 2, true)
                            if doorID.object2 ~= nil then
                            DoorSystemSetOpenRatio(doorID.object2, 0.0, true)
                            object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object2, 0)
                            SetEntityRotation(object, 0.0, 0.0, doorID.objYaw2, 2, true)
                            end
                        end
                        if DoorSystemGetDoorState(doorID.object) ~= 1 then
                            Citizen.CreateThread(function()
                            Citizen.InvokeNative(0xD99229FE93B46286,doorID.object,1,1,0,0,0,0)
                            end)
                            local object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object, 0)
                            Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object,doorID.locked)
                            SetEntityRotation(object, 0.0, 0.0, doorID.objYaw, 2, true)
                            if doorID.object2 ~= nil then
                            Citizen.CreateThread(function()
                                Citizen.InvokeNative(0xD99229FE93B46286,doorID.object2,1,1,0,0,0,0)
                            end)
                            object = Citizen.InvokeNative(0xF7424890E4A094C0, doorID.object2, 0)
                            Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object2,doorID.locked)
                            SetEntityRotation(object, 0.0, 0.0, doorID.objYaw2, 2, true)
                            end
                        end
                    else
                        if DoorSystemGetDoorState(doorID.object) ~= 0 then
                            Citizen.CreateThread(function()
                            Citizen.InvokeNative(0xD99229FE93B46286,doorID.object,1,1,0,0,0,0)
                            end)
                            Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object,doorID.locked)
                            if doorID.object2 ~= nil then
                            Citizen.CreateThread(function()
                                Citizen.InvokeNative(0xD99229FE93B46286,doorID.object2,1,1,0,0,0,0)
                            end)
                            Citizen.InvokeNative(0x6BAB9442830C7F53,doorID.object2,doorID.locked)
                            end
                        end
                    end
                end
                if distance < 1.0 then
                    DrawText3D(doorID.textCoords.x, doorID.textCoords.y, doorID.textCoords.z, " " ,doorID.locked)
                    if active == false then
                        local item_name = CreateVarString(10, 'LITERAL_STRING', "Door")
                        PromptSetActiveGroupThisFrame(buttons_prompt, item_name)
                    end
                    if PromptHasHoldModeCompleted(UnLockDoor) then
                        makeEntityFaceEntity(PlayerPedId(), doorID.textCoords , k)
                    end
                end
            end
            if letSleep then
                Citizen.Wait(100)
            end
        end
	end)
-- end)
function makeEntityFaceEntity( entity1, coords , k)
    local p1 = GetEntityCoords(entity1, true)
    local p2 = coords
    local dx = p2.x - p1.x
    local dy = p2.y - p1.y
    local heading = GetHeadingFromVector_2d(dx, dy)
    SetEntityHeading( entity1, heading )
    Wait(100)
    ClearPedTasks(ped)
    prop_name = 'P_KEY02X'
    local ped = entity1
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(ped, "SKEL_R_Finger12")
    local key = false
    if not IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
        local waiting = 0
        RequestAnimDict("script_common@jail_cell@unlock@key")
        while not HasAnimDictLoaded("script_common@jail_cell@unlock@key") do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                break
            end
        end
        Wait(100)
        TaskPlayAnim(ped, 'script_common@jail_cell@unlock@key', 'action', 8.0, -8.0, 2500, 31, 0, true, 0, false, 0, false)
        Wait(750)
        AttachEntityToEntity(prop, ped,boneIndex, 0.02, 0.0120, -0.00850, 0.024, -160.0, 200.0, true, true, false, true, 1, true)
        key = true
        while key do
            if IsEntityPlayingAnim(ped, "script_common@jail_cell@unlock@key", "action", 3) then
                Wait(100)
            else
                ClearPedSecondaryTask(ped)
                DeleteObject(prop)
                RemoveAnimDict("script_common@jail_cell@unlock@key")
                key = false
                TriggerEvent("gum_doorlock:updatedoor", k)
                break
            end
        end
    end
end

RegisterNetEvent('gum_doorlock:updatedoor')
AddEventHandler('gum_doorlock:updatedoor', function(door)
    TriggerServerEvent("gum_doorlock:updatedoorsv", door, function(cb) end)
end)

RegisterNetEvent('gum_doorlock:changedoor')
AddEventHandler('gum_doorlock:changedoor', function(doorID)
    local name   = ConfigDoorlocks.DoorList[doorID]
    name.locked = not name.locked
    TriggerServerEvent('gum_doorlock:updateState', doorID, name.locked, function(cb) end)
end)

function DrawText3D(x, y, z, text , state)
    local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoord())
    SetTextScale(0.35, 0.35)
    SetTextFontForCurrentCommand(1)
    SetTextColor(255, 255, 255, 215)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    SetTextCentre(1)
    DisplayText(str,_x,_y)
    if state then
        DrawSprite("generic_textures", "lock", _x, _y+0.0125, 0.04, 0.045, 0.1, 100, 1, 1, 255, 0)
    else
        DrawSprite("generic_textures", "lock", _x, _y+0.0125, 0.04, 0.045, 0.1, 67, 160, 71, 255, 0)
    end
end

RegisterNetEvent('gum_doorlock:setState')
AddEventHandler('gum_doorlock:setState', function(doorID, state)
    ConfigDoorlocks.DoorList[doorID].locked = state
end)

--FixBankDoors / Turn on if you have a problems with Bank Doors.
local door_hashes = {
   -408139633,      -- BANCO DE VALENTINE
   -1652509687,     -- BANCO DE VALENTINE
   -1477943109,     -- BANCO DE SAINT DENIS
   2089945615,      -- BANCO DE SAINT DENIS
   -2136681514,     -- BANCO DE SAINT DENIS
   1733501235,      -- BANCO DE SAINT DENIS
   -977211145,      -- BANCO DE RHODES
   -1206757990,     -- BANCO DE RHODES
   531022111,       -- BANCO DE BLACKWATER
   -667091646,       -- BANCO DE BLACKWATER
}

Citizen.CreateThread(function()
   for k,v in pairs(door_hashes) do 
       Citizen.InvokeNative(0xD99229FE93B46286,v,1,1,0,0,0,0)
       Citizen.InvokeNative(0x6BAB9442830C7F53,v,0) 
   end
end)