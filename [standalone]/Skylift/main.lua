
--[[ Feel free to edit this mod for private use only. Don't reupload this mod anywhere without my permission. --]]

Skylift_t = ScriptThread("Skylift") 

-- Run function
function Skylift_t:Run()
	local pPed = LocalPlayer()
	local pVehicleSwitch = false
	while self:IsRunning() do

		--Vehicle Switch
		if pPed:IsInVehicle() then
			if pVehicleSwitch == false then
				local pMyVehicle = pPed:GetVehicle()
				local pMyVehHash = pMyVehicle:GetModel()
				if pMyVehHash == VEHICLE_SKYLIFT then
					gui.NotifyAboveMap("Press '~g~e~s~' to use the magnet", 2000)
				end
				pVehicleSwitch = true
			end
		else
			if pVehicleSwitch == true then
				pVehicleSwitch = false
			end
		end
		--Attach the vehicle
		if IsKeyDown(KEY_E) then
			if pPed:IsInVehicle() then
				local pMyVehicle = pPed:GetVehicle()
				local pMyVehHash = pMyVehicle:GetModel()
				if pMyVehHash == VEHICLE_SKYLIFT then
					local pNearbyVehicles = pPed:GetNearbyVehicles(2)
					for k, vehicle in pairs(pNearbyVehicles) do
						if vehicle.ID ~= pPed:GetVehicle() then
							if natives.ENTITY.IS_ENTITY_ATTACHED_TO_ANY_VEHICLE(vehicle.ID) then
								local pMyVehicle = pPed:GetVehicle()
								if natives.ENTITY.IS_ENTITY_ATTACHED_TO_ENTITY(vehicle.ID, pMyVehicle.ID) then
									natives.ENTITY.DETACH_ENTITY(vehicle.ID, true, true)
								end
							else
								local pHash = vehicle:GetModel()
								if natives.VEHICLE.IS_THIS_MODEL_A_CAR(pHash) or natives.VEHICLE.IS_THIS_MODEL_A_BIKE(pHash) or natives.VEHICLE.IS_THIS_MODEL_A_TRAIN(pHash) or natives.VEHICLE.IS_THIS_MODEL_A_BICYCLE(pHash) or natives.VEHICLE.IS_THIS_MODEL_A_QUADBIKE(pHash) then
									local pVehPos1 = vehicle:GetPosition()
									local pVehPos2 = pMyVehicle:GetPosition()
									local pDist = natives.GAMEPLAY.GET_DISTANCE_BETWEEN_COORDS(pVehPos1.x, pVehPos1.y, pVehPos1.z, pVehPos2.x, pVehPos2.y, pVehPos2.z, true)
									if pDist <= 7 then
										natives.ENTITY.ATTACH_ENTITY_TO_ENTITY(vehicle.ID, pMyVehicle.ID, 0, 0.0, -3.0, -1.0, 0.0, 0.0, 0.0, true, true, true, true, 1, true)
									end
								end	
							end
						end
					end
				end
			end
		end
		
		-- Wait
		self:Wait(0)
	end
end


-- OnError
function Skylift_t:OnError()
	print("Oh no! The skylift script caused an error!")
	self:Reset()
end
 
-- Register
Skylift_t:Register()