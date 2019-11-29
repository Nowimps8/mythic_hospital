--[[
    ADD YOUR FRAMEWORK BILLING HERE

    If the player is bill successfully, return true. If they're not, return false
]]
ESX             = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function BillPlayer(source, amount)
    return true
    local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeBank(amount)
end