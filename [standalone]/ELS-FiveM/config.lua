outputLoading = false
playButtonPressSounds = true
printDebugInformation = false

vehicleSyncDistance = 150
environmentLightBrightness = 0.006
lightDelay = 10 -- Time in MS
flashDelay = 15

panelEnabled = true
panelType = "original"
panelOffsetX = 0.0
panelOffsetY = 0.0

allowedPanelTypes = {
    "original",
    "old"
}

-- https://docs.fivem.net/game-references/controls

shared = {
    horn = 86,
}

keyboard = {
    modifyKey = 131, -- shift
    stageChange = 85, -- E
    guiKey = 136, -- w
    takedown = 83, -- =
    siren = {
        tone_one = 157, -- 1
        tone_two = 158, -- 2
        tone_three = 160, -- 3
    },
    pattern = {
        primary = 163, -- 9
        secondary = 162, -- 8
        advisor = 161, -- 7
    },
    warning = 246, -- Y
    secondary = 303, -- U
    primary = 29, -- b
}

controller = {
    modifyKey = 73,
    stageChange = 174,
    takedown = 172,
    siren = {
        tone_one = 173,
    },
}
