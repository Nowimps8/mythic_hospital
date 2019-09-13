ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('gauze', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('nw_injury:items:gauze', source)
end)

ESX.RegisterUsableItem('bandage', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('nw_injury:items:bandage', source)
end)

ESX.RegisterUsableItem('firstaid', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('nw_injury:items:firstaid', source)
end)

ESX.RegisterUsableItem('medkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('nw_injury:items:medkit', source)
end)

ESX.RegisterUsableItem('vicodin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('nw_injury:items:vicodin', source)
end)

ESX.RegisterUsableItem('hydrocodone', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('nw_injury:items:hydrocodone', source)
end)

ESX.RegisterUsableItem('morphine', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('nw_injury:items:morphine', source)
end)
