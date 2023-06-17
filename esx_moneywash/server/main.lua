ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('moneyWash:washMoney')
AddEventHandler('moneyWash:washMoney', function()
    local plr = ESX.GetPlayerFromId(source)
    local blackMoney = plr.getAccount('black_money').money
    if blackMoney ~= 0 then
        plr.removeAccountMoney('black_money', blackMoney)
            
        local feeAmount = (blackMoney * Config.FeeAmount) / 100
            
        TriggerClientEvent('esx:showNotification', plr.source, TranslateCap('start_washing'))
            
        Citizen.Wait(5000)
        
        plr.addMoney(blackMoney - feeAmount)
        TriggerClientEvent('esx:showNotification', plr.source, TranslateCap('go_out'))
    else
        TriggerClientEvent('esx:showNotification', plr.source, TranslateCap('no_dmoney'))
    end
end)
