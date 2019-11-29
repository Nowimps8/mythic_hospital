Citizen.CreateThread(function()
    local s = Scaleform.Request("MIDSIZED_MESSAGE")
    s:CallFunction("SHOW_MIDSIZED_MESSAGE", '', Config.Strings.HospitalCheckIn)
    while true do
        Citizen.Wait(1)
        local plyCoords = GetEntityCoords(PlayerPedId(), 0)
        local distance = #(vector3(Config.Hospital.Location.x, Config.Hospital.Location.y, Config.Hospital.Location.z) - plyCoords)
        if distance < 10 then
            DrawMarker(25, Config.Hospital.Location.x, Config.Hospital.Location.y, Config.Hospital.Location.z - 0.99, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 139, 16, 20, 250, false, false, 2, false, false, false, false)

            if not IsPedInAnyVehicle(PlayerPedId(), true) then
                if distance < 3 then
                    s:Render3D(Config.Hospital.Location.x, Config.Hospital.Location.y, Config.Hospital.Location.z - 0.5, 0.0, 0.0, -GetGameplayCamRot().z, 3.5, 3.5, 0.0)
                    --Print3DText(Config.Hospital.Location, Config.Strings.HospitalCheckIn)
                    if IsControlJustReleased(0, Config.Keys.Revive) then
                        if IsEntityDead(PlayerPedId()) then
                            exports['mythic_progbar']:ProgressWithStartEvent({
                                name = "hospital_action",
                                duration = 2500,
                                label = Config.Strings.HospitalCheckInAction,
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
                                    TriggerServerEvent('mythic_hospital:server:RequestBed')
                                else
                                    isInHospitalBed = false
                                end
                            end)
                        else
                            if (GetEntityHealth(PlayerPedId()) < 200) or (IsInjuredOrBleeding()) then
                                exports['mythic_progbar']:ProgressWithStartEvent({
                                    name = "hospital_action",
                                    duration = 2500,
                                    label = Config.Strings.HospitalCheckInAction,
                                    useWhileDead = true,
                                    canCancel = true,
                                    controlDisables = {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    },
                                    animation = {
                                        animDict = "missheistdockssetup1clipboard@base",
                                        anim = "base",
                                        flags = 49,
                                    },
                                    prop = {
                                        model = "p_amb_clipboard_01",
                                        bone = 18905,
                                        coords = { x = 0.10, y = 0.02, z = 0.08 },
                                        rotation = { x = -80.0, y = 0.0, z = 0.0 },
                                    },
                                    propTwo = {
                                        model = "prop_pencil_01",
                                        bone = 58866,
                                        coords = { x = 0.12, y = 0.0, z = 0.001 },
                                        rotation = { x = -150.0, y = 0.0, z = 0.0 },
                                    },
                                }, function()
                                    isInHospitalBed = true

                                    if IsScreenFadedOut() then -- Hopeful error prevention if you start checkin right as you're blacking out
                                        DoScreenFadeIn(100)
                                    end
                                end, function(status)
                                    if not status then
                                        TriggerServerEvent('mythic_hospital:server:RequestBed')
                                    else
                                        isInHospitalBed = false
                                    end
                                end)
                            else
                                exports['mythic_notify']:SendAlert('error', Config.Strings.NotHurt)
                            end
                        end
                    end
                end
            end
        else
            Citizen.Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if not IsEntityDead(PlayerPedId()) then
            local short, dist = IsNearTeleport()
            if dist ~= nil and currentTp ~= nil then
                local player = PlayerPedId()
                if IsControlJustReleased(0, Config.Keys.Revive) then
                    if not IsPedInAnyVehicle(player, true) then
                        DoScreenFadeOut(500)
                        while not IsScreenFadedOut() do
                            Citizen.Wait(10)
                        end
                
                        SetEntityCoords(player, Config.Teleports[currentTp.destination].x, Config.Teleports[currentTp.destination].y, Config.Teleports[currentTp.destination].z, 0, 0, 0, false)
                        SetEntityHeading(player, Config.Teleports[currentTp.destination].h)
                
                        Citizen.Wait(100)
                
                        DoScreenFadeIn(1000)
                    end
                end

                Citizen.Wait(1)
            elseif short < 25 then
                Citizen.Wait(5)
            else
                Citizen.Wait(30 * short)
            end
        else
            Citizen.Wait(1000)
        end
    end
end)