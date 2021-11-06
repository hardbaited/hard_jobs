local VorpCore = {}

TriggerEvent("getCore",function(core)
    VorpCore = core
end)

RegisterServerEvent("vorp_ml_policejob:checkjob")
AddEventHandler("vorp_ml_policejob:checkjob", function()
    local _source = source
    local Character = VorpCore.getUser(_source).getUsedCharacter
    local job = Character.job
    if job == 'sheriff' then
        TriggerClientEvent('vorp_ml_policejob:open', _source)
    end
end)

--cuff

RegisterServerEvent('vorp_ml_policejob:cuffplayer')
AddEventHandler('vorp_ml_policejob:cuffplayer', function(target)
        TriggerClientEvent('vorp_ml_policejob:cuff', target)
        -- print('servercuff')
        --TriggerClientEvent("vorp:Tip", _source, _U('poner_esposas'), 4000) -- from server side
end)

RegisterServerEvent('vorp_ml_policejob:metervehiculo')
AddEventHandler('vorp_ml_policejob:metervehiculo', function(target)
        TriggerClientEvent('vorp_ml_policejob:meter', target)
        -- print('servercuff')
        
end)

RegisterServerEvent('vorp_ml_policejob:sacarvehiculo')
AddEventHandler('vorp_ml_policejob:sacarvehiculo', function(target)
    TriggerClientEvent('vorp_ml_policejob:sacar', target)
    -- print('servercuff')
        
end)

RegisterServerEvent('vorp_ml_policejob:uncuffplayer')
AddEventHandler('vorp_ml_policejob:uncuffplayer', function(target)
    local _source = source
    TriggerClientEvent('vorp_ml_policejob:uncuff', target)
    -- print('serveruncuff')
    --TriggerClientEvent("vorp:Tip", _source, _U('quitar_esposas'), 4000) -- from server side
end)

--lasso


RegisterServerEvent('vorp_ml_policejob:lassoplayer')
AddEventHandler('vorp_ml_policejob:lassoplayer', function(target)
    local _source = source
    --TriggerClientEvent('vorp_ml_policejob:lasso', target)
	TriggerClientEvent('vorp_ml_policejob:hogtie', target)
    -- print('serverlasso')
    TriggerClientEvent("vorp:Tip", _source, _U('atado'), 4000) -- from server side
end)

RegisterServerEvent('duty:setjob')
AddEventHandler('duty:setjob', function()
    local _source = source
    local User = VorpCore.getUser(source)
    local Character = User.getUsedCharacter

    if Character.job == 'sheriff' then
        Character.setJob("offsheriff")
    elseif Character.job == 'offsheriff' then
        Character.setJob("sheriff")
    elseif Character.job == 'doctor' then
        Character.setJob("offdoctor")
    elseif Character.job == 'offdoctor' then
        Character.setJob("doctor")
    end
end)
