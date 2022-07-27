Config = {}
-- Written and built off QB Framework by Ksnarf
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Targets = {}

Config.AttachedVehicle = MinimalMetersForDamage
Config.AuthorizedIds = {

  Config.MaxStatusValues = {
    ["engine"] = 1000.0,
    ["body"] = 1000.0,
    ["radiator"] = 100,
    ["axle"] = 100,
    ["brakes"] = 100,
    ["clutch"] = 100,
    ["fuel"] = 100,
  }

  Config.ValuesLabels = {
    ["engine"] = "Engine",
    ["body"] = "Body",
    ["radiator"] = "Radiator",
    ["axle"] = "Drive Shaft",
    ["brakes"] = "Brakes",
    ["clutch"] = "Clutch",
    ["fuel"] = "Fuel Tank",
  }

  Config.RepairCost = {
    ["body"] = "plastic",
    ["radiator"] = "aluminum",
    ["axle"] = "steel",
    ["brakes"] = "iron",
    ["clutch"] = "aluminum",
    ["fuel"] = "plastic",
  }

  Config.RepairCostAmount = {
    ["engine"] = {
        item = "metalscrap",
        costs = 2,
    },
    ["body"] = {
        item = "plastic",
        costs = 3,
    },
    ["radiator"] = {
        item = "aluminum",
        costs = 5,
    },
    ["axle"] = {
        item = "steel",
        costs = 2,
    },
    ["brakes"] = {
        item = "copper",
        costs = 5,
    },
    ["clutch"] = {
        item = "copper",
        costs = 6,
    },
    ["fuel"] = {
        item = "plastic",
        costs = 5,
    },
  }

  Config.Locations = {
    ["exit"] = vector3(-339.04, -135.53, 39),
    ["duty"] = vector3(841.72, -824.35, 26.33),
    ["stash"] = vector3(-319.49, -131.9, 38.98),
    ["vehicle"] = vector4(844.55, -814.97, 26.33, 13.24),
  }

  Config.MinimalMetersForDamage = { -- Minimum distance player needs to drive in order to vehicle to get damaged
      [1] = {
          min = 8000,
          max = 12000,
          multiplier = {
              min = 1,
              max = 8,
          }
      },
      [2] = {
          min = 12000,
          max = 16000,
          multiplier = {
              min = 8,
              max = 16,
          }
      },
      [3] = {
          min = 12000,
          max = 16000,
          multiplier = {
              min = 16,
              max = 24,
          }
      },
  }

  Config.Damages = { -- Part labels which will be damaged
      ["radiator"] = "Radiator",
      ["axle"] = "Drive Shaft",
      ["brakes"] = "Brakes",
      ["clutch"] = "Clutch",
      ["fuel"] = "Fuel Tank",
  }

}
