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
  },
  [2] = = {
    name = "jerry_can",
    amount = 1,
    info = {},
    type = "item",
    slot = 2,
  }
}

Config.Items = {
  label = "PI Cabinet"
  slots = 8
  items = {
  [1] = { -- binoculars
      name = "binoculars",
      price = 100,
      amount = 25,
      info = {},
      type = "item",
      slot = 1,
  },
  [2] = { -- lockpick
      name = "lockpick",
      price = 15,
      amount = 50,
      info = {},
      type = "item",
      slot = 2,
  },
  [3] = { -- lockpick
      name = "lockpick",
      price = 15,
      amount = 50,
      info = {},
      type = "item",
      slot = 3,
  },
  [4] = { -- handcuffs
      name = "handcuffs",
      price = 250,
      amount = 50,
      info = {},
      type = "item",
      slot = 4,
  },
  [5] = {
      name = "weapon_snspistol_mk2",
      price = 0,
      amount = 1,
      info = {
          serie = "",
      },
      type = "weapon",
      slot = 5,
  },
  [6] = { -- pistol_ammo
      name = "pistol_ammo",
      price = 5,
      amount = 500,
      info = {},
      type = "item",
      slot = 6,
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
