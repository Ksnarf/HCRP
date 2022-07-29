Config = {}
Config.Objects = {}
Config.HandCuffItem = 'handcuffs'

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Locations = {
    ["duty"] = {
      [1] =
    },
    ["motorpool"] = {
      [1] =
    },
    ["stash"] = {
      [1] =
    },
    ["trash"] = {}

    ["fingerprint"] {
      [1] =
    },
    ["offices"] = {
      [1] =
    },
}

Config.AuthorizedVehicles = {
  -- Desk Clerk
    [0] = {},
  -- Investigator
    [1] = {
      ["taxi5"] = "Investigator Car"
    },
  -- Sr. Investigator
    [2] = {
      ["taxi5"] = "Investigator Car"
    }
}

Config.AmmoLabels = {
  ["AMMO_PISTOL"] = "9MM"
}

Config.CarItems = {
  [1] = = {
    name = "binoculars",
    amount = 1,
    info = {},
    type = "item",
    slot = 1,
  }
}

Config.Items = {
  label = "PI Cabinet"
  slots = 8
  items = {
  [6] = { -- binoculars
      name = "binoculars",
      price = 100,
      amount = 25,
      info = {},
      type = "item",
      slot = 1,
  },




  [1] = {
      name = "weapon_snspistol_mk2",
      price = 0,
      amount = 1,
      info = {
          serie = "",
      },
      type = "weapon",
      slot = 2,
  }
}
