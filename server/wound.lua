local PlayerInjuries = {}

function GetCharsInjuries(source)
    return PlayerInjuries[source]
end

RegisterServerEvent('mythic_hospital:server:SyncInjuries')
AddEventHandler('mythic_hospital:server:SyncInjuries', function(data)
    PlayerInjuries[source] = data
end)