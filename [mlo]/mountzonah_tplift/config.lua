Config                            = {}
Config.DrawDistance               = 30.0
Config.Locale                     = 'en'
Config.showMarker = true

Config.HelicopterSpawner = {
    SpawnPoint = { x = 351.386, y = -588.124, z = 74.165 },
    Heading    = 0.0
}


Config.Zones = {

    Entrance1 = {--
        Marker  = { x = -493.537109375, y = -327.13165283203, z = 41.420713043213  },
        Spawn   = { x = -493.537109375, y = -327.13165283203, z = 42.320713043213 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Room1"}
    },

    Entrance2 = {--
        Marker  = { x = -490.51202392578, y = -327.44174194336, z = 41.420713043213 },
        Spawn   = {  x = -490.51202392578, y = -327.44174194336, z = 42.320713043213  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Room2"}
    },

    Entrance3 = {--
        Marker  = { x = -487.48541259766, y = -328.02755737305, z = 41.420724487305 },
        Spawn   = { x = -487.48541259766, y = -328.02755737305, z = 42.320724487305 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Room3"}
    },

    UrgenceParking = {--
        Marker  = { x = -436.1484375, y = -359.90380859375, z = 34.009778594971},
        Spawn   = { x = -436.1484375, y = -359.90380859375, z = 34.909778594971 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 350.57266,
		canGoTo = {"Parking"}
    },

    Parking = {--
        Marker  = { x = -418.69403076172, y = -344.67877197266, z = 23.331834411621 },
        Spawn   = { x = -418.69403076172, y = -344.67877197266, z = 24.231834411621},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 106.25228,
		canGoTo = {"UrgenceParking"}
    },
    UrgencePrive = {--
        Marker  = { x = -452.4372253418, y = -288.46655273438, z = 33.894596099854 },
        Spawn   = { x = -452.4372253418, y = -288.46655273438, z = 34.894596099854 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 109.63311,
		canGoTo = {"Operation","RoomPrive","Helipad"}
    },
    Operation = {--
        -- Marker  = { x = -452.52206420898, y = -288.47439575195, z = -129.100 },
		Marker  = { x = -452.52206420898, y = -288.47439575195, z = -131.850 },
        Spawn   = { x = -452.52206420898, y = -288.47439575195, z = -130.850 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 109.63311,
		canGoTo = {"UrgencePrive","RoomPrive","Helipad"}
    },
    RoomPrive = {--
        Marker  = { x = -452.58471679688, y = -288.41131591797, z = 68.604219055176 },
        Spawn   = { x = -452.58471679688, y = -288.41131591797, z = 69.504219055176 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 109.63311,
		canGoTo = {"Operation","UrgencePrive","Helipad"}
    },
    Helipad = {--
        Marker  = { x = -439.7956, y = -335.8121, z = 77.3007 },
        Spawn   = { x = -439.7956, y = -335.8121, z = 78.3007 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 84.2652,
        canGoTo = {"Operation","UrgencePrive","RoomPrive"}
    },
        Helipad2 = {--
        Marker  = { x = -440.3188, y = -339.8967, z = 77.3129 },
        Spawn   = { x = -440.3188, y = -339.8967, z = 78.312 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 84.2652,
        canGoTo = {"Operation","UrgencePrive","RoomPrive"}
    },
        Helipad3 = {--
        Marker  = { x = -449.4819, y = -338.6976, z = 77.3130 },
        Spawn   = { x = -449.4819, y = -338.6976, z = 78.3130  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 257.6642,
        canGoTo = {"Operation","UrgencePrive","RoomPrive"}
    },
        Helipad4 = {--
        Marker  = { x = -448.9596, y = -334.7570, z = 77.3130 },
        Spawn   = { x = -448.9596, y = -334.7570, z = 78.3130 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 257.6642,
        canGoTo = {"Operation","UrgencePrive","RoomPrive"}
    },
    Room1 = {--
        Marker  = { x = -493.62640380859, y = -327.10382080078, z = 68.604829406738 },
        Spawn   = { x = -493.62640380859, y = -327.10382080078, z = 69.504829406738},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance1"}
    },
    Room2 = {--
        Marker  = { x = -490.54724121094, y = -327.59460449219, z = 68.604783630371 },
        Spawn   = { x = -490.54724121094, y = -327.59460449219, z = 69.504783630371 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance2"}
    },
    Room3 = {--
        Marker  = { x = -487.6123046875, y = -328.17980957031, z = 68.604608154297 },
        Spawn   = { x = -487.6123046875, y = -328.17980957031, z = 69.504608154297 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance3"}
    }
}

--Made By Sarish => AuroraRP