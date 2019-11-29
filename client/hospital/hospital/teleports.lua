local s

function IsNearTeleport()
    local shortest = 100000
    local tpDist = 0
    for _, tp in pairs(Config.Teleports) do
        if s == nil then
            s = Scaleform.Request("MIDSIZED_MESSAGE")
        end

        local ply = PlayerPedId()
        local plyCoords = GetEntityCoords(ply, 0)
        local distance = #(vector3(tp.x, tp.y, tp.z) - plyCoords)
        if distance < (tp.range * 2) then
            DrawMarker(25, tp.x, tp.y, tp.z - 0.99, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 1.0, 139, 16, 20, 250, false, false, 2, false, false, false, false)
            if currentTp ~= tp then
                s:CallFunction("SHOW_MIDSIZED_MESSAGE", '', tp.text)
                currentTp = tp
            end

            if GetVehiclePedIsIn(ply, false) == 0 then
                if distance < tp.range then
                    s:Render3D(tp.x, tp.y, tp.z - 0.5, 0.0, 0.0, -GetGameplayCamRot().z, 3.5, 3.5, 0.0)
                    --Print3DText(tp, tp.text)
                    tpDist = tp.range
                else
                    tpDist = nil
                end
            else
                tpDist = nil
            end
        else
            currentTp = nil
        end

        if distance < shortest then
            shortest = distance
        end
    end

    return shortest, tpDist
end