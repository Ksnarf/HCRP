local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local isInMarker              = false
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}


local menu = false




-- Citizen.CreateThread(function()
    -- while ESX == nil do
        -- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        -- Citizen.Wait(0)
        -- PlayerData = ESX.GetPlayerData()
    -- end
-- end)

-- RegisterNetEvent('esx:playerLoaded')
-- AddEventHandler('esx:playerLoaded', function(xPlayer)
    -- PlayerData = xPlayer
-- end)

-- RegisterNetEvent('esx:setJob')
-- AddEventHandler('esx:setJob', function(job)
    -- PlayerData.job = job
-- end)

-- Display markers
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        local sleep = true
        for k,v in pairs(Config.Zones) do
            if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Marker.x, v.Marker.y, v.Marker.z, true) < Config.DrawDistance) then
                DrawMarker(v.Type, v.Marker.x, v.Marker.y, v.Marker.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
                sleep = false
            end
        end
        if sleep then
            Citizen.Wait(500)
        end
    end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local coords      = GetEntityCoords(GetPlayerPed(-1))
        local isInMarker  = false
        local currentZone = nil

        for k,v in pairs(Config.Zones) do
            if(GetDistanceBetweenCoords(coords, v.Marker.x, v.Marker.y, v.Marker.z, true) < v.Size.x) then
                isInMarker  = true
                currentZone = k
            end
        end

        if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
            HasAlreadyEnteredMarker = true
            LastZone                = currentZone
            TriggerEvent('esx_lift:hasEnteredMarker', currentZone)
        end

        if not isInMarker and HasAlreadyEnteredMarker then
            HasAlreadyEnteredMarker = false
            TriggerEvent('esx_lift:hasExitedMarker', LastZone)
        end
    end
end)

AddEventHandler('esx_lift:hasExitedMarker', function(zone)

    CurrentAction = nil
    -- --ESX.UI.Menu.CloseAll()

end)


function _U(text)
	return Locales['fr'][text]
	-- tostring(text)
end

AddEventHandler('esx_lift:hasEnteredMarker', function(zone)

    if zone == 'Entrance1' then
      CurrentAction     = 'menu_Entrance1'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'Entrance2' then
      CurrentAction     = 'menu_Entrance2'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'Entrance3' then
      CurrentAction     = 'menu_Entrance3'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'UrgenceParking' then
      CurrentAction     = 'menu_UrgenceParking'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'Parking' then
      CurrentAction     = 'menu_Parking'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'UrgencePrive' then
      CurrentAction     = 'menu_UrgencePrive'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'Operation' then
      CurrentAction     = 'menu_Operation'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'RoomPrive' then
      CurrentAction     = 'menu_RoomPrive'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'Room1' then
      CurrentAction     = 'menu_Room1'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'Room2' then
      CurrentAction     = 'menu_Room2'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

    if zone == 'Room3' then
      CurrentAction     = 'menu_Room3'
      CurrentActionMsg  = _U('PushForChooseYourFloor')
      CurrentActionData = {}
    end

end)

-- Key Controls
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(5)

        if CurrentAction ~= nil then

            SetTextComponentFormat('STRING')
            AddTextComponentString(CurrentActionMsg)
            DisplayHelpTextFromStringLabel(0, 0, 1, -1)

            if IsControlJustReleased(0,  Keys['E']) then

				if CurrentAction == 'menu_Entrance1' then
					OpenLift01()
				end

				if CurrentAction == 'menu_Entrance2' then
					OpenLift02()
				end

				if CurrentAction == 'menu_Entrance3' then
					OpenLift03()
				end

				if CurrentAction == 'menu_UrgenceParking' then
					OpenParking()
				end

				if CurrentAction == 'menu_Parking' then
					OpenParking()
				end

				if CurrentAction == 'menu_UrgencePrive' then
					OpenStaff()
				end

				if CurrentAction == 'menu_Operation' then
					OpenStaff()
				end

				if CurrentAction == 'menu_RoomPrive' then
					OpenStaff()
				end

				if CurrentAction == 'menu_Room1' then
					OpenLift01()
				end

				if CurrentAction == 'menu_Room2' then
					OpenLift02()
				end

				if CurrentAction == 'menu_Room3' then
					OpenLift03()
				end

                CurrentAction = nil

            end
        end
    end
end)

function OpenLift01()
    -- --ESX.UI.Menu.CloseAll()
	
				
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'GroundFloor_menu',
        {
            title    = _U('ChooseYourFloor'),
            elements = {
                {label = _U('Entrance1'), value = 'Entrance1'},
                {label = _U('Room1'), value = 'Room1'},
            }
        },
        function(data, menu)
            if data.current.value == 'Entrance1' then
               Entrance1Tp()
            elseif data.current.value == 'Room1' then
                Room1Tp()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenLift02()
    --ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'GroundFloor_menu',
        {
            title    = _U('ChooseYourFloor'),
            elements = {
                {label = _U('Entrance2'), value = 'Entrance2'},
                {label = _U('Room2'), value = 'Room2'},
            }
        },
        function(data, menu)
            if data.current.value == 'Entrance2' then
               Entrance2Tp()
            elseif data.current.value == 'Room2' then
                Room2Tp()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenLift03()
    --ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'GroundFloor_menu',
        {
            title    = _U('ChooseYourFloor'),
            elements = {
                {label = _U('Entrance3'), value = 'Entrance3'},
                {label = _U('Room3'), value = 'Room3'},
            }
        },
        function(data, menu)
            if data.current.value == 'Entrance3' then
               Entrance3Tp()
            elseif data.current.value == 'Room3' then
                Room3Tp()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenParking()
    --ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'GroundFloor_menu',
        {
            title    = _U('ChooseYourFloor'),
            elements = {
                {label = _U('UrgenceParking'), value = 'UrgenceParking'},
                {label = _U('Parking'), value = 'Parking'},
            }
        },
        function(data, menu)
            if data.current.value == 'UrgenceParking' then
               UrgenceParkingTp()
            elseif data.current.value == 'Parking' then
                ParkingTp()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function OpenStaff()
    --ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'GroundFloor_menu',
        {
            title    = _U('ChooseYourFloor'),
            elements = {
                {label = _U('UrgencePrive'), value = 'UrgencePrive'},
                {label = _U('Operation'), value = 'Operation'},
                {label = _U('RoomPrive'), value = 'RoomPrive'},
            }
        },
        function(data, menu)
            if data.current.value == 'UrgencePrive' then
               UrgencePriveTp()
            elseif data.current.value == 'Operation' then
                OperationTp()
            elseif data.current.value == 'RoomPrive' then
                RoomPriveTp()
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end


function Entrance1Tp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.Entrance1.Spawn.x, Config.Zones.Entrance1.Spawn.y, Config.Zones.Entrance1.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.Entrance1.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function Entrance2Tp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.Entrance2.Spawn.x, Config.Zones.Entrance2.Spawn.y, Config.Zones.Entrance2.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.Entrance2.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function Entrance3Tp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.Entrance3.Spawn.x, Config.Zones.Entrance3.Spawn.y, Config.Zones.Entrance3.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.Entrance3.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function Room1Tp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.Room1.Spawn.x, Config.Zones.Room1.Spawn.y, Config.Zones.Room1.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.Room1.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function Room2Tp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.Room2.Spawn.x, Config.Zones.Room2.Spawn.y, Config.Zones.Room2.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.Room2.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function Room3Tp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.Room3.Spawn.x, Config.Zones.Room3.Spawn.y, Config.Zones.Room3.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.Room3.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function UrgenceParkingTp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.UrgenceParking.Spawn.x, Config.Zones.UrgenceParking.Spawn.y, Config.Zones.UrgenceParking.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.UrgenceParking.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function ParkingTp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.Parking.Spawn.x, Config.Zones.Parking.Spawn.y, Config.Zones.Parking.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.Parking.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function UrgencePriveTp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.UrgencePrive.Spawn.x, Config.Zones.UrgencePrive.Spawn.y, Config.Zones.UrgencePrive.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.UrgencePrive.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function OperationTp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.Operation.Spawn.x, Config.Zones.Operation.Spawn.y, Config.Zones.Operation.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.Operation.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end

function RoomPriveTp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.RoomPrive.Spawn.x, Config.Zones.RoomPrive.Spawn.y, Config.Zones.RoomPrive.Spawn.z)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.RoomPrive.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

end


--[[function PillboxHeliTp()
    --ESX.UI.Menu.CloseAll()

        --local pos = GetEntityCoords(GetPlayerPed(-1), true)
        local heading = GetGameplayCamRelativeHeading()

            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "lift", 1.0)
            --TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            DoScreenFadeOut(1000)
            Citizen.Wait(3000)
            SetEntityCoords(GetPlayerPed(-1), Config.Zones.PillboxHeli.Spawn.x, Config.Zones.PillboxHeli.Spawn.y, Config.Zones.PillboxHeli.Spawn.z-1)
            SetEntityHeading(GetPlayerPed(-1), Config.Zones.PillboxHeli.Heading)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 25, "demo", 0.2)
            SetGameplayCamRelativeHeading(heading)
            DoScreenFadeIn(1000)

        local heli = Config.HelicopterSpawner

        if not IsAnyVehicleNearPoint(heli.SpawnPoint.x, heli.SpawnPoint.y, heli.SpawnPoint.z, 3.0) and PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
            ESX.Game.SpawnVehicle('polmav', {
                x = heli.SpawnPoint.x,
                y = heli.SpawnPoint.y,
                z = heli.SpawnPoint.z
            }, heli.Heading, function(vehicle)
                SetVehicleModKit(vehicle, 0)
                SetVehicleLivery(vehicle, 1)
            end)

        end

end]]

