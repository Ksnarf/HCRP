QBCore = nil
--New QBCore way of getting the Object comment out if your using old QB
QBCore = exports['qb-core']:GetCoreObject()

--Old way kept for old QBCore users uncomment if you use old QB
--Citizen.CreateThread(function()
--	while QBCore == nil do
--      TriggerEvent("QBCore:GetObject", function(obj)QBCore = obj end)
--	end
--end)

local isFueling = false

exports['qb-target']:AddVehicle({
    options = {
      { 
        type = "client",
        event = 'cc-fuel:client:petrolcanrefuel',
        label = 'Refuel Car', 
        icon = 'fas fa-gas-pump',
        item = 'weapon_petrolcan',
	    canInteract = function(entity)
            if GetVehicleEngineHealth(entity) <= 0 then return false end
		    if isFueling == false then
			    local curGasCanDurability = GetCurrentGasCanDurability()
                if curGasCanDurability == nil then return false end
            	if curGasCanDurability > 0 then return true end
            	return false
		    end
		    return false
	    end
      },
      {
          type="client",
          event="cc-fuel:client:siphonfuel",
          label = "Siphon Fuel",
          icon = 'fas fa-gas-pump',
          item = 'fuelsiphon',
          canInteract = function(entity)
            if GetVehicleEngineHealth(entity) <= 0 then return false end
            if isFueling then return false end
            local curGasCanDurability = GetCurrentGasCanDurability()
            if curGasCanDurability == nil then return false end
            if curGasCanDurability >= 100 then return false end
            
            return Config.AllowFuelSiphoning
        end
      }
    },
    distance = 2.5,
})

exports['qb-target']:AddTargetModel(Config.GasPumpModels, {
    options = {
        {
            icon = "fas fa-gas-pump",
            label = "Get Fuel",
            action = function(entity)
                TriggerEvent("cc-fuel:client:pumprefuel", entity)
            end
        },
		{
			type = "client",
			event = "cc-fuel:client:buypetrolcan",
			icon =  "fas fa-gas-pump",
			label = "Buy Petrol Can"
		},
		{
			type = "client",
			event = "cc-fuel:client:refillpetrolcan",
			icon =  "fas fa-gas-pump",
			label = "Refuel Petrol Can",
            canInteract = function(entity)
                local gasCanDurability = GetCurrentGasCanDurability()
                if gasCanDurability == nil then return false end
                if gasCanDurability >= 100 then return false end
                return true
            end
		}
    },
    distance = 3.0
})

--Fuel siphon event
RegisterNetEvent("cc-fuel:client:siphonfuel")
AddEventHandler("cc-fuel:client:siphonfuel",function() 
    local petrolCanDurability = GetCurrentGasCanDurability()

    local PlayerPed = PlayerPedId()
    local Vehicle = QBCore.Functions.GetClosestVehicle()

    local PlayerCoords = GetEntityCoords(PlayerPed)
    local vehicleCoords = GetEntityCoords(Vehicle)

    local distanceToVehicle =  #(PlayerCoords - vehicleCoords)
    
    local petrolCanDurability = GetCurrentGasCanDurability()

    
    if distanceToVehicle > 2.5 then
        QBCore.Functions.Notify("You are too far away from the vehicle","error")
        return
    end

    --Check petrol can is able to take fuel
    if petrolCanDurability == nil then
        QBCore.Functions.Notify("You need a petrol can in your hands","error")
        return
    elseif petrolCanDurability == 100 then
        QBCore.Functions.Notify("You petrol can is full","error")
        return
    end
    local currentFuel = GetVehicleFuelLevel(Vehicle)
    --Check car is able to have fuel taken
    if currentFuel > 0 then
        --Start taking the fuel
        TaskTurnPedToFaceEntity(PlayerPed, Vehicle, 1000)
	    Citizen.Wait(1000)
	
	    LoadAnimDict("timetable@gardener@filling_can")
	    TaskPlayAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)

        isFueling = true

        Citizen.CreateThread(function() 
            local fuelToTake = Config.SiphonRate
            while isFueling do
                Citizen.Wait(500)

		        currentFuel = (currentFuel - fuelToTake)
                petrolCanDurability = (petrolCanDurability + fuelToTake )

                if currentFuel <= 0 then
                    currentFuel = 0
                    isFueling = false
                end

                SetFuel(Vehicle, currentFuel)
                
                if petrolCanDurability >= 100 then
                    isFueling = false
                end
            end

            TriggerEvent("weapons:client:SetWeaponQuality",petrolCanDurability)
        end)

        while isFueling do
            for _, controlIndex in pairs(Config.DisableKeys) do
                DisableControlAction(0, controlIndex)
            end

			DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5, Config.Strings.CancelSiphoningFuel .. " | Vehicle: " .. Round(currentFuel, 1) .. "%")

            if not IsEntityPlayingAnim(PlayerPed, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 3) then
                TaskPlayAnim(PlayerPed, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
            end

            if IsControlJustReleased(0, 38) or DoesEntityExist(GetPedInVehicleSeat(vehicle, -1)) then
                isFueling = false
            end

            Citizen.Wait(0)
        end

        ClearPedTasks(PlayerPed)
        QBCore.Functions.Notify("You siphoned fuel","success")
    else
        QBCore.Functions.Notify("The tank is empty","error")
    end


end)

--Action events
RegisterNetEvent("cc-fuel:client:refillpetrolcan")
AddEventHandler("cc-fuel:client:refillpetrolcan", function()
    local petrolCanDurability = GetCurrentGasCanDurability()
    if petrolCanDurability ~= nil then
        if petrolCanDurability == 100 then
            QBCore.Functions.Notify("Your can is full","error")
        else
            local refillCost = math.floor(100 - petrolCanDurability)
            if refillCost > 0 then
                local currentCash = QBCore.Functions.GetPlayerData().money['cash']  
			    if currentCash >= refillCost then
					TriggerServerEvent('cc-fuel:server:pay', refillCost, GetPlayerServerId(PlayerId()))
					TriggerEvent("weapons:client:SetWeaponQuality",100)
				    QBCore.Functions.Notify("You refilled your petrol can","success")
                else
                    QBCore.Functions.Notify("Not enough cash to refill the can","error")
                end
            end
        end
    else
        QBCore.Functions.Notify("You don't have a petrol can to refill","error")
    end
end)

RegisterNetEvent("cc-fuel:client:buypetrolcan")
AddEventHandler("cc-fuel:client:buypetrolcan", function()
    local currentCash = QBCore.Functions.GetPlayerData().money['cash']
    if currentCash >= Config.JerryCanCost then
		TriggerServerEvent('QBCore:Server:AddItem', "weapon_petrolcan", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["weapon_petrolcan"], "add")
		TriggerServerEvent('cc-fuel:server:pay', Config.JerryCanCost, GetPlayerServerId(PlayerId()))
		QBCore.Functions.Notify("You bought a jerry can","success")
	else
		QBCore.Functions.Notify("You don't have enough money to buy a jerry can","error")
	end
end)

RegisterNetEvent("cc-fuel:client:pumprefuel")
AddEventHandler("cc-fuel:client:pumprefuel", function(pump) 
    local PlayerPed = PlayerPedId()
    local Vehicle = QBCore.Functions.GetClosestVehicle()

    --Check player is close to pump
    local pumpCoords = GetEntityCoords(pump)
    local PlayerCoords = GetEntityCoords(PlayerPed)
    local vehicleCoords = GetEntityCoords(Vehicle)

    local distanceToPump =  #(PlayerCoords - pumpCoords)
    local distanceToVehicle =  #(PlayerCoords - vehicleCoords)

    
    if distanceToVehicle > 2.5 then
        QBCore.Functions.Notify("You are too far away from the vehicle","error")
        return
    end

    --Check car is able to be fueled
    

    if CanFuelVehicle(Vehicle) then
        --Start the fueling
        TaskTurnPedToFaceEntity(PlayerPed, Vehicle, 1000)
	    Citizen.Wait(1000)
	
	    LoadAnimDict("timetable@gardener@filling_can")
	    TaskPlayAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)

        --Go Kaboom if the engine on
        if GetIsVehicleEngineRunning(Vehicle) and Config.VehicleEngineOnBlowUp then
            local Chance = math.random(1, 100)
            if Chance <= Config.VehicleBlowUpChance then
                AddExplosion(vehicleCoords, 5, 50.0, true, false, true)
                return
            end
        end

        isFueling = true
        local currentCost = 0
        local currentFuel = GetVehicleFuelLevel(Vehicle)
        local currentCash = QBCore.Functions.GetPlayerData().money['cash']

        Citizen.CreateThread(function() 
            local fuelToAdd = Config.PetrolPumpRefuelRate
            while isFueling do
                Citizen.Wait(500)
		        
		        local extraCost = fuelToAdd / 1.5 * Config.CostMultiplier
                
                currentFuel = currentFuel + fuelToAdd

                if currentFuel > 100.0 then
                    currentFuel = 100.0
                    isFueling = false
                end

                currentCost = currentCost + extraCost

                if currentCash >= currentCost then
                    SetFuel(Vehicle, currentFuel)
                else
                    isFueling = false
                end
            end
        end)

        while isFueling do
            for _, controlIndex in pairs(Config.DisableKeys) do
                DisableControlAction(0, controlIndex)
            end

            local extraString = "\n" .. "Cost " .. ": ~g~$" .. Round(currentCost, 1)

			DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, Config.Strings.CancelFuelingPump .. extraString)
			DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5, Round(currentFuel, 1) .. "%")

            if not IsEntityPlayingAnim(PlayerPed, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 3) then
                TaskPlayAnim(PlayerPed, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
            end

            if IsControlJustReleased(0, 38) or DoesEntityExist(GetPedInVehicleSeat(vehicle, -1)) then
                isFueling = false
            end

            Citizen.Wait(0)
        end

        ClearPedTasks(PlayerPed)

		TriggerServerEvent('cc-fuel:server:pay', currentCost, GetPlayerServerId(PlayerId()))
        QBCore.Functions.Notify("You paid $" .. currentCost .. " for fuel","success")
    else
        QBCore.Functions.Notify("The tank is full","error")
    end

end)

RegisterNetEvent("cc-fuel:client:petrolcanrefuel")
AddEventHandler("cc-fuel:client:petrolcanrefuel", function() 
    local PlayerPed = PlayerPedId()
    local Vehicle = QBCore.Functions.GetClosestVehicle()

    local PlayerCoords = GetEntityCoords(PlayerPed)
    local vehicleCoords = GetEntityCoords(Vehicle)

    local distanceToVehicle =  #(PlayerCoords - vehicleCoords)
    
    local petrolCanDurability = GetCurrentGasCanDurability()

    
    if distanceToVehicle > 2.5 then
        QBCore.Functions.Notify("You are too far away from the vehicle","error")
        return
    end

    --Check petrol can can fuel car
    if petrolCanDurability == nil then
        QBCore.Functions.Notify("You need a petrol can in your hands","error")
        return
    elseif petrolCanDurability <= 0 then
        QBCore.Functions.Notify("You petrol can is empty","error")
        return
    end

    --Check car is able to be fueled
    if CanFuelVehicle(Vehicle) then
        --Start the fueling
        TaskTurnPedToFaceEntity(PlayerPed, Vehicle, 1000)
	    Citizen.Wait(1000)
	
	    LoadAnimDict("timetable@gardener@filling_can")
	    TaskPlayAnim(ped, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)

        --Go Kaboom if the engine on
        if GetIsVehicleEngineRunning(Vehicle) and Config.VehicleEngineOnBlowUp then
            local Chance = math.random(1, 100)
            if Chance <= Config.VehicleBlowUpChance then
                AddExplosion(vehicleCoords, 5, 50.0, true, false, true)
                return
            end
        end

        isFueling = true
        local currentFuel = GetVehicleFuelLevel(Vehicle)
        local currentCash = QBCore.Functions.GetPlayerData().money['cash']

        Citizen.CreateThread(function()
            local fuelToAdd = Config.PetrolCanRefuelRate 
            while isFueling do
                Citizen.Wait(500)
		        
                currentFuel = currentFuel + fuelToAdd
                petrolCanDurability = (petrolCanDurability - fuelToAdd)

                if currentFuel > 100.0 then
                    currentFuel = 100.0
                    isFueling = false
                end

                SetFuel(Vehicle, currentFuel)
                
                if petrolCanDurability <= 0 then
                    isFueling = false
                end
            end

            TriggerEvent("weapons:client:SetWeaponQuality",petrolCanDurability)
        end)

        while isFueling do
            for _, controlIndex in pairs(Config.DisableKeys) do
                DisableControlAction(0, controlIndex)
            end

			DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5, Config.Strings.CancelFuelingJerryCan .. "| Vehicle: " .. Round(currentFuel, 1) .. "%")

            if not IsEntityPlayingAnim(PlayerPed, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 3) then
                TaskPlayAnim(PlayerPed, "timetable@gardener@filling_can", "gar_ig_5_filling_can", 2.0, 8.0, -1, 50, 0, 0, 0, 0)
            end

            if IsControlJustReleased(0, 38) or DoesEntityExist(GetPedInVehicleSeat(vehicle, -1)) then
                isFueling = false
            end

            Citizen.Wait(10)
        end

        ClearPedTasks(PlayerPed)
        QBCore.Functions.Notify("You refueled your car","success")
    else
        QBCore.Functions.Notify("The tank is full","error")
    end

end)

--Update fuel thread
Citizen.CreateThread(function()
    for index = 1, #Config.Blacklist do
		if type(Config.Blacklist[index]) == 'string' then
			Config.Blacklist[GetHashKey(Config.Blacklist[index])] = true
		else
			Config.Blacklist[Config.Blacklist[index]] = true
		end
	end

	for index = #Config.Blacklist, 1, -1 do
		table.remove(Config.Blacklist, index)
	end

    local fuelSynced = false

    local inBlacklisted = false
	while true do
		Citizen.Wait(1000)

		local ped = PlayerPedId()

		if IsPedInAnyVehicle(ped) then
			local vehicle = GetVehiclePedIsIn(ped)

			if Config.Blacklist[GetEntityModel(vehicle)] then
				inBlacklisted = true
			else
				inBlacklisted = false
			end

			if not inBlacklisted and GetPedInVehicleSeat(vehicle, -1) == ped then
				if not fuelSynced then
                    SetFuel(vehicle, GetFuel(vehicle))
                    fuelSynced = true
                end
                if IsVehicleEngineOn(vehicle) then
                    SetFuel(vehicle, GetVehicleFuelLevel(vehicle) - Config.FuelUsage[Round(GetVehicleCurrentRpm(vehicle), 1)] * (Config.Classes[GetVehicleClass(vehicle)] or 1.0) / 10)
                end
			end
		else
			if fuelSynced then
				fuelSynced = false
			end

			if inBlacklisted then
				inBlacklisted = false
			end
		end
	end
end)

