PlayerLoaded = false
allowWash = true

function Draw3DText(x,y,z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x,y,z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(true)
    SetTextColour(255,255,255, 215)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 700
    DrawRect(_x, _y + 0.0150, 0.06 + factor, 0.03, 41, 11, 41, 100)
end

    PlayerLoaded = true
    local location = Config.Location
    while true do
        local pedCoords = GetEntityCoords(PlayerPedId())
        if PlayerLoaded == true then
            if Vdist(pedCoords, location) < Config.MaxDistance then
                Draw3DText(location.x, location.y, location.z, "~w~Press ~y~[E] ~w~to wash your dirty money.", 0.4)
                if Vdist(pedCoords, location) < Config.ClickDistance and IsControlPressed(1, 38) then
                    if allowWash == true then
                        TriggerServerEvent('moneyWash:washMoney')
                        Citizen.CreateThread(function()
                            allowWash = false
                            Citizen.Wait(2500)
                            allowWash = true
                        end)
                    end
                end
            end
        end
        Citizen.Wait(0)
    end