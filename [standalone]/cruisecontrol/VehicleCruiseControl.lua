local ToggleKey

JM36.CreateThread(function()
	
	local SetControlNormal, math_min, math_abs, GetEntitySpeedVector, IsControlJustPressed
		= SetControlNormal, math.min, math.abs, GetEntitySpeedVector, IsControlJustPressed
	
	local VehicleEligible, CruiseControlSpeed, LastVehicle
	
	local Player = Info.Player
	local Vehicle = Player.Vehicle
	
	local yield = JM36.yield
	while true do
		if Vehicle.Id ~= LastVehicle and Vehicle.IsIn and Vehicle.IsOp then
			CruiseControlSpeed = false
			LastVehicle = Vehicle.Id
			local Vehicle_Type = Vehicle.Type
			VehicleEligible = Vehicle_Type.Bike or Vehicle_Type.Car or Vehicle_Type.Quadbike
		end
		
		if VehicleEligible and Vehicle.IsIn and Vehicle.IsOp then
			if IsControlJustPressed(0, ToggleKey) then
				CruiseControlSpeed = not CruiseControlSpeed and GetEntitySpeedVector(LastVehicle, true).y
			end
			if CruiseControlSpeed then
				local CurrentSpeed = GetEntitySpeedVector(LastVehicle, true).y
				SetControlNormal
				(
					27,
					CurrentSpeed > CruiseControlSpeed and 72 or 71,
					math_min(math_abs(CruiseControlSpeed-CurrentSpeed), 1.0)
				)
			end
		end
		yield()
	end
end)

return{
	init	=	function()
					ToggleKey = tonumber(configFileRead("VehicleCruiseControl.ini").ToggleKey or 73)
				end
}