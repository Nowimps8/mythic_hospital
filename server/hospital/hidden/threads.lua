Citizen.CreateThread(function()
    while true do
        for k, v in pairs(RecentlyUsedHidden) do
            local now = os.time()

            if v <= now then
                TriggerClientEvent('mythic_hospital:client:HiddenSetup', k)
                RecentlyUsedHidden[k] = nil
            end
        end

        Citizen.Wait(1000)
    end
end)