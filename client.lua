progressbar = exports["feather-progressbar"]:initiate()
BccUtils = exports['bcc-utils'].initiate()

CreateThread(function()
    local PromptGroup = BccUtils.Prompt:SetupPromptGroup()
    local firstprompt = PromptGroup:RegisterPrompt("Search", 0x760A9C6F, 1, 1, true, 'hold', {timedeventhash = "SHORT_TIMED_EVENT_MP"})
    while true do
        Wait(1)
        local interval = false
        local playerPed = GetEntityCoords(PlayerPedId())
        for k, v in pairs(Config.Bins) do
            local distcheck = DoesObjectOfTypeExistAtCoords(playerPed.x, playerPed.y, playerPed.z, 1.25, GetHashKey(Config.Bins[k]), 0)
            if distcheck then
                PromptGroup:ShowGroup("Bin")
                firstprompt:TogglePrompt(true)
                if firstprompt:HasCompleted() then
                    ProgressBar()
                    Animation()
                    TriggerServerEvent('sh:Reward')
                    firstprompt:TogglePrompt(false)
                    interval = true
                end
            end
            if interval then
                Wait(Config.Wait.Interval * 1000)
                interval = false
            end
        end
    end
end)

function ProgressBar()
    progressbar.start("Searching Bin", Config.Wait.SearchDuration * 1000, function()
    end, 'innercircle')
end

function Animation()
    RequestAnimDict("amb_work@world_human_bartender@serve_player")
    while not HasAnimDictLoaded("amb_work@world_human_bartender@serve_player") do
        Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "amb_work@world_human_bartender@serve_player", "take_beer_trans_pour_whiskey", 8.0, 8.0,
        100000000000000, 1, 0, true, 0, false, 0, false)
    Wait(Config.Wait.SearchDuration * 1000)
    StopAnimTask(PlayerPedId(), "amb_work@world_human_bartender@serve_player", "take_beer_trans_pour_whiskey")
end
