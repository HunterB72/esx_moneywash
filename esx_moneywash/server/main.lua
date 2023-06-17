ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent('moneyWash:washMoney')
AddEventHandler('moneyWash:washMoney', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local blackMoney = xPlayer.getAccount('black_money').money
    if blackMoney >= Config.MinMoney then
        
        xPlayer.removeAccountMoney('black_money', blackMoney)
            
        local feeAmount = (blackMoney * Config.FeeAmount) / 100
            
        TriggerClientEvent('esx:showNotification', src, TranslateCap("start_washing", ESX.Math.GroupDigits(blackMoney)))
            
        Citizen.Wait(5000)
        
        xPlayer.addMoney(blackMoney - feeAmount)

        TriggerClientEvent('esx:showNotification', src, TranslateCap("go_out", ESX.Math.GroupDigits(feeAmount)))
    else
        TriggerClientEvent('esx:showNotification', src, TranslateCap("no_dmoney", ESX.Math.GroupDigits(blackMoney)))
    end
end)
