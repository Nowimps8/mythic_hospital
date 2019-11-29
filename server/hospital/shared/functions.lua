function CalculateBill(injuries, base)
    local totalBill = base
    if injuries ~= nil then
        for k, v in pairs(injuries.limbs) do
            if v.isDamaged then
                totalBill = totalBill + (Config.InjuryBase * v.severity)
            end
        end

        if injuries.isBleeding > 0 then
            totalBill = totalBill + (Config.InjuryBase * injuries.isBleeding)
        end
    end

    return totalBill
end