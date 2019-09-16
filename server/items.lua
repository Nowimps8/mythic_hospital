ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('gauze', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:gauze', source)
	xPlayer.removeInventoryItem('gauze', 1)
end)

ESX.RegisterUsableItem('bandage', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:bandage', source)
	xPlayer.removeInventoryItem('bandage', 1)
end)

ESX.RegisterUsableItem('firstaid', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:firstaid', source)
	xPlayer.removeInventoryItem('firstaid', 1)
end)

ESX.RegisterUsableItem('medkit', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:medkit', source)
	xPlayer.removeInventoryItem('medkit', 1)
end)

ESX.RegisterUsableItem('vicodin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:vicodin', source)
	xPlayer.removeInventoryItem('vicodin', 1)
end)

ESX.RegisterUsableItem('hydrocodone', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:hydrocodone', source)
	xPlayer.removeInventoryItem('hydrocodone', 1)
end)

ESX.RegisterUsableItem('morphine', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('mythic_hospital:items:morphine', source)
	xPlayer.removeInventoryItem('morphine', 1)
end)
