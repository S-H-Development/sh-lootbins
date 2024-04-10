local VORPcore = exports.vorp_core:GetCore()

BccUtils = exports['bcc-utils'].initiate()
local discord = BccUtils.Discord.setup(Config.Webhook, 'sh-LootBins','https://media.discordapp.net/attachments/1128162991280500762/1128556949106065509/idea2.png?ex=661f5c90&is=660ce790&hm=ffeba15c9a567e750a975df679cb0507ae44810ff8091a0889516ef8dc77d0b1&=&format=webp&quality=lossless&width=328&height=350')

RegisterServerEvent('sh:Reward', function()
    local Character = VORPcore.getUser(source).getUsedCharacter

    local randomNumber = math.random(1, 100)
    if randomNumber <= Config.ItemPercent then
        local itemList = Config.Items
        local itemAmount = math.random(Config.ItemAmount)
        local getItem = math.random(1, #itemList)
        local pickItem = itemList[getItem]

        exports.vorp_inventory:canCarryItems(source, itemAmount)
        exports.vorp_inventory:addItem(source, pickItem, itemAmount)
        TriggerClientEvent('vorp:TipRight', source, 'Reward Item: ' ..itemAmount..'x ' ..pickItem, Config.Wait.Notification * 1000)
        discord:sendMessage("Character Name: " .. Character.firstname .. " " .. Character.lastname .. "\n Identifier:" .. Character.identifier .. "\n Reward Item: " ..itemAmount.."x " ..pickItem)
    else
        local moneyAmount = math.random(Config.MoneyAmount) -- Example
        Character.addCurrency(0, moneyAmount)
        
        TriggerClientEvent('vorp:TipRight', source, 'Reward Money: ' ..moneyAmount .. '$', Config.Wait.Notification * 1000)
        discord:sendMessage("Character Name: " .. Character.firstname .. " " .. Character.lastname .. "\n Identifier:" .. Character.identifier .. "\n Reward Money: " ..moneyAmount .. "$")
    end
end)
