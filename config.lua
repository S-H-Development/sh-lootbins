-- |||||||||||||||||||||||||||||||||||||||||
-- ||                                     ||
-- ||                                     ||
-- ||  ░S░.░H░.░ ░D░e░v░e░l░o░p░m░e░n░t░  ||
-- ||                                     ||
-- ||                                     ||
-- |||||||||||||||||||||||||||||||||||||||||

Config = {}

Config.Webhook = "https://discord.com/api/webhooks/1224140769716207726/x0uGS_bEkHQApPScFFMIg0vGldlECfSBU_h-D5YCWbtdexPqShVmE1HB_g3o5x1WtE54"

-- Wait Config Settings
Config.Wait = {
    Interval = 300, -- Seconds. (300 Seconds = 5mins). Time to wait inbetween searching Bins.
    Notification = 4, -- Seconds. Time notification is on the screen.
    SearchDuration = 5 -- Seconds. Time to search the Bin.
}

-- Item Models to Search
Config.Bins = { -- Models of Bins to Search
    'p_streettrashcannbx01x', -- Main Saint Denis Trashbin
    'p_trashbin01bx', -- Idk what these others are
    'p_trashbin01x',
    'p_trashbinset01x'
}

-- Item Config Settings
Config.ItemPercent = 50 -- Less than or Equal to this number will give item (between 1 and 100)
Config.ItemAmount = 1, 5 -- Between 1 and 5 Items per search
Config.Items = { -- List of possible items to give.
    "glassbottle",
    "rock",
    "fibers",
    "sap",
    "wood"
}

Config.MoneyAmount = 1, 6 -- Between 1 and 6 Cash per search
