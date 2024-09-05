local language = GetConvar('qb_locale')
local blips = {}
QBCore = exports['qb-core']:GetCoreObject()
local blipFile = "blips.json"
print('[^4Script^7][^6LUA^7][^18L_BlipCreator^7] Loading script...')
print('[^4Script^7][^6LUA^7][^18L_BlipCreator^7] Loading language : ( '..language..' ) ...')
Citizen.Wait(2500)

function SendDiscordWebhook(message)
    local webhook = Config.DiscordWebhook
    if webhook == "" then return end

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        username = "[8L_BlipCreator]",
        embeds = {{
            color = 3447003,
            title = "LOGS",
            description = message,
            footer = {
                text = os.date("%Y-%m-%d %H:%M:%S")
            }
        }}
    }), { ['Content-Type'] = 'application/json' })
end

local function isPlayerAdmin(playerId)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if Player then
        local group = Player.PlayerData.group
        return group == "god"
    end
    return false
end

local function loadBlipsFromFile()
    local resourceName = GetCurrentResourceName()
    local fileContent = LoadResourceFile(resourceName, blipFile)
    if fileContent then
        blips = json.decode(fileContent)
        print('[^4Script^7][^6LUA^7][^18L_BlipCreator^7] '.. Lang:t("script_loaded") .."")
        print("[^4Script^7][^6LUA^7][^18L_BlipCreator^7] ".. Lang:t("blip_loaded") .. "")
        local message = Lang:t("blip_loaded")
        SendDiscordWebhook(message)
    else
        print('[^4Script^7][^6LUA^7][^18L_BlipCreator^7] '.. Lang:t("script_loaded") .."")
        print("[^4Script^7][^6LUA^7][^18L_BlipCreator^7] ".. Lang:t("blip_loaded_fail") .."")
        local message = Lang:t("blip_loaded_fails")
        SendDiscordWebhook(message)
    end
end

local function saveBlipsToFile()
    local resourceName = GetCurrentResourceName()
    SaveResourceFile(resourceName, blipFile, json.encode(blips), -1)
    print("[^4Script^7][^6LUA^7][^18L_BlipCreator^7] ".. Lang:t("blip_save") .."")
end

local function sendBlipsToClient(playerId)
    TriggerClientEvent('8L_BlipCreator:client:loadBlips', playerId, blips)
end

local function sendBlipsToAllClients()
    for _, playerId in ipairs(GetPlayers()) do
        sendBlipsToClient(playerId)
    end
end

Citizen.CreateThread(function()
    Citizen.Wait(2500)
    loadBlipsFromFile()
    sendBlipsToAllClients()
end)

AddEventHandler('playerConnecting', function()
    local playerId = source
    Citizen.Wait(5000) 
    sendBlipsToClient(playerId)
end)

AddEventHandler('esx:playerLoaded', function(playerId)
    sendBlipsToClient(playerId)
end)

RegisterNetEvent('QBCore:Server:PlayerLoaded', function()
    local playerId = source
    sendBlipsToClient(playerId)
end)

RegisterNetEvent('8L_BlipCreator:server:createBlip')
AddEventHandler('8L_BlipCreator:server:createBlip', function(blipData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    -- Vérification si le joueur a la permission admin
    if not isPlayerAdmin(src) then
        print("[^4Script^7][^6LUA^7][^18L_BlipCreator^7] ".. Player .." ".. Lang:t("blip_no_perms") .."")
        TriggerClientEvent('QBCore:Notify', src, Lang:t("no_permission"), "error")
        local message = "".. Player .. " ".. Lang:t("blip_no_perms") .. ""
        SendDiscordWebhook(message)
        return
    end

    -- Vérification si le blip est déjà existant
    for _, blip in ipairs(blips) do
        if blip.name == blipData.name and blip.coords.x == blipData.coords.x and blip.coords.y == blipData.coords.y and blip.coords.z == blipData.coords.z then
            print("[^4Script^7][^6LUA^7][^18L_BlipCreator^7] ".. Player .." ".. Lang:t("blip_already_exist") .." ".. blipData.name .. "")
            local message = "".. Player .. " ".. Lang:t("blip_already_exist") .. " ".. blipData.name .. ""
            SendDiscordWebhook(message)
            return
        end
    end
    
    table.insert(blips, blipData)
    saveBlipsToFile()
    TriggerClientEvent('8L_BlipCreator:client:createBlip', -1, blipData)
    print("[^4Script^7][^6LUA^7][^18L_BlipCreator^7] ".. Player .." ".. Lang:t("blip_created") .." ".. blipData.name .. "")
    local message = "".. Player .. " ".. Lang:t("blip_created") .." ".. blipData.name .. ""
    SendDiscordWebhook(message)
end)


RegisterNetEvent('8L_BlipCreator:server:saveBlips')
AddEventHandler('8L_BlipCreator:server:saveBlips', function(clientBlips)
    blips = clientBlips
    saveBlipsToFile()
end)

RegisterNetEvent('8L_BlipCreator:server:updateBlip')
AddEventHandler('8L_BlipCreator:server:updateBlip', function(clientBlips)
    blips = clientBlips
    saveBlipsToFile()
end)
