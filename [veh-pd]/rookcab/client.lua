Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerped = GetPlayerPed(-1)
        local primary = GetVehiclePedIsIn(playerped)
        if DoesEntityExist(primary) then -- If player is in a vehicle
            local carModel = GetEntityModel(primary)
            if carModel == GetHashKey("rookcab") then
                local TrailerFound, TrailerInt = GetVehicleTrailerVehicle(primary)
                if TrailerInt ~= 0 then
                    if IsVehicleSirenOn(primary) then
                        if not IsVehicleSirenOn(TrailerInt) then
                            SetVehicleSiren(TrailerInt, true)
                        end
                    else
                        if IsVehicleSirenOn(TrailerInt) then
                            SetVehicleSiren(TrailerInt, false)
                        end
                    end
                end
            end
        end
    end
end)