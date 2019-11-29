Citizen.CreateThread(function()
    local s = Scaleform.Request("MIDSIZED_MESSAGE")
    s:CallFunction("SHOW_MIDSIZED_MESSAGE", '', Config.Strings.HospitalCheckIn)
    while true do
        if IsEntityDead(PlayerPedId()) then
            Citizen.Wait(1)
            local plyCoords = GetEntityCoords(PlayerPedId(), 0)
            local distance = #(vector3(Config.Hidden.Location.x, Config.Hidden.Location.y, Config.Hidden.Location.z) - plyCoords)
            if distance < 10 then
                DrawMarker(25, Config.Hidden.Location.x, Config.Hidden.Location.y, Config.Hidden.Location.z - 0.99, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 139, 16, 20, 250, false, false, 2, false, false, false, false)
    
                if not IsPedInAnyVehicle(PlayerPedId(), true) then
                    if distance < 3 then
                        s:Render3D(Config.Hospital.Location.x, Config.Hospital.Location.y, Config.Hospital.Location.z - 0.5, 0.0, 0.0, -GetGameplayCamRot().z, 3.5, 3.5, 0.0)
                        --Print3DText(Config.Hidden.Location, Config.Strings.HiddenCheckIn)
                        if IsControlJustReleased(0, Config.Keys.Revive) then
                            if not usedHiddenRev then
                                if (GetEntityHealth(PlayerPedId()) < 200) or (IsInjuredOrBleeding()) then
                                    exports['mythic_progbar']:ProgressWithStartEvent({
                                        name = "hidden_hospital_action",
                                        duration = 1500,
                                        label = Config.Strings.HiddenCheckInAction,
                                        useWhileDead = true,
                                        canCancel = true,
                                        controlDisables = {
                                            disableMovement = true,
                                            disableCarMovement = true,
                                            disableMouse = false,
                                            disableCombat = true,
                                        },
                                    }, function()
                                        isInHospitalBed = true
                                    end, function(status)
                                        if not status then
                                            DoScreenFadeOut(1000)

                                            while not IsScreenFadedOut() do
                                                Citizen.Wait(10)
                                            end

                                            TriggerServerEvent('mythic_hospital:server:AttemptHiddenRevive')
                                        end
                                    end)
                                else
                                    exports['mythic_notify']:SendAlert('error', Config.Strings.NotHurt)
                                end
                            else
                                exports['mythic_notify']:SendAlert('error', Config.Strings.HiddenCooldown)
                            end
                        end
                    end
                end
            else
                Citizen.Wait(1000)
            end
        else
            Citizen.Wait(5000)
        end
    end
end)