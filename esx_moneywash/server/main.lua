ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('moneyWash:washMoney')
AddEventHandler('moneyWash:washMoney', function()
    local plr = ESX.GetPlayerFromId(source)
    local blackMoney = plr.getAccount('black_money').money
    if blackMoney ~= 0 then
        plr.removeAccountMoney('black_money', blackMoney)
        TriggerClientEvent('esx:showNotification', plr.source, 'Washing your ~g~$' .. tostring(blackMoney) ..' dirty money!')
        Citizen.Wait(5000)
        plr.addMoney(blackMoney)
        TriggerClientEvent('esx.showNotification', plr.source, "Run before the cops get here.")
    else
        TriggerClientEvent('esx.showNotification', plr.source, 'You dont have any dirty money, come back when you do.')
    end
end)