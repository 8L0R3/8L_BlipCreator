local QBCore = exports['qb-core']:GetCoreObject()
QBCore = exports['qb-core']:GetCoreObject()

local blips = {}

local translation = require("translation")

local blipIcons = {
    { label = Lang:t("Standard"), value = 1 },
    { label = Lang:t("Large Circle"), value = 2 },
    { label = Lang:t("Small Circle"), value = 3 },
    { label = Lang:t("Police Officer"), value = 4 },
    { label = Lang:t("Police Area"), value = 5 },
    { label = Lang:t("Square"), value = 6 },
    { label = Lang:t("Player Position"), value = 7 },
    { label = Lang:t("North"), value = 8 },
    { label = Lang:t("Waypoint"), value = 9 },
    { label = Lang:t("Large Circle Outline"), value = 10 },
    { label = Lang:t("Up Arrow Outline"), value = 11 },
    { label = Lang:t("Down Arrow Outline"), value = 12 },
    { label = Lang:t("Up Arrow"), value = 13 },
    { label = Lang:t("Down Arrow"), value = 14 },
    { label = Lang:t("Police Helicopter"), value = 15 },
    { label = Lang:t("Speech Bubble"), value = 16 },
    { label = Lang:t("Garage"), value = 17 },
    { label = Lang:t("Drugs"), value = 18 },
    { label = Lang:t("Store"), value = 19 },
    { label = Lang:t("Weapon"), value = 21 },
    { label = Lang:t("Hospital"), value = 22 },
    { label = Lang:t("Star"), value = 23 },
    { label = Lang:t("Flag"), value = 24 },
    { label = Lang:t("Helicopter"), value = 43 },
    { label = Lang:t("Boat"), value = 427 },
    { label = Lang:t("Parachute"), value = 251 },
    { label = Lang:t("Motorcycle"), value = 226 },
    { label = Lang:t("Bicycle"), value = 348 },
    { label = Lang:t("Car"), value = 225 },
    { label = Lang:t("Truck"), value = 477 },
    { label = Lang:t("Car Wash"), value = 100 },
    { label = Lang:t("Clothing Store"), value = 73 },
    { label = Lang:t("Hair Salon"), value = 71 },
    { label = Lang:t("Tattoo Parlor"), value = 75 },
    { label = Lang:t("Bank"), value = 108 },
    { label = Lang:t("ATM"), value = 277 },
    { label = Lang:t("Restaurant"), value = 52 },
    { label = Lang:t("Fire Station"), value = 60 },
    { label = Lang:t("Prison"), value = 237 },
    { label = Lang:t("Airport"), value = 90 },
    { label = Lang:t("Gas Station"), value = 361 },
    { label = Lang:t("Bar"), value = 93 },
    { label = Lang:t("Amusement Park"), value = 102 },
    { label = Lang:t("Cinema"), value = 135 },
    { label = Lang:t("Museum"), value = 136 },
    { label = Lang:t("Theater"), value = 137 },
    { label = Lang:t("Park"), value = 160 },
    { label = Lang:t("Hotel"), value = 475 },
    { label = Lang:t("Bus Station"), value = 513 },
    { label = Lang:t("Train Station"), value = 515 },
    { label = Lang:t("Subway Station"), value = 512 },
    { label = Lang:t("School"), value = 430 },
    { label = Lang:t("College"), value = 431 },
    { label = Lang:t("University"), value = 432 },
    { label = Lang:t("Library"), value = 433 },
    { label = Lang:t("Church"), value = 304 },
    { label = Lang:t("Mosque"), value = 305 },
    { label = Lang:t("Temple"), value = 306 },
    { label = Lang:t("Synagogue"), value = 307 },
    { label = Lang:t("Clinic"), value = 362 },
    { label = Lang:t("Pharmacy"), value = 363 },
    { label = Lang:t("Dental Office"), value = 364 },
    { label = Lang:t("Veterinary Clinic"), value = 365 },
    { label = Lang:t("Police Station"), value = 60 },
    { label = Lang:t("Ambulance Station"), value = 74 },
    { label = Lang:t("Government Building"), value = 304 },
    { label = Lang:t("Court"), value = 305 },
    { label = Lang:t("City Hall"), value = 306 },
}

local blipColors = {
    { label = Lang:t("White"), value = 0 },
    { label = Lang:t("Red"), value = 1 },
    { label = Lang:t("Green"), value = 2 },
    { label = Lang:t("Blue"), value = 3 },
    { label = Lang:t("Yellow"), value = 5 },
    { label = Lang:t("Purple"), value = 7 },
    { label = Lang:t("Orange"), value = 17 },
    { label = Lang:t("Dark Red"), value = 76 },
    { label = Lang:t("Pink"), value = 24 },
    { label = Lang:t("Gray"), value = 3 },
    { label = Lang:t("Dark Purple"), value = 83 },
    { label = Lang:t("Dark Green"), value = 52 },
    { label = Lang:t("Dark Blue"), value = 26 },
    { label = Lang:t("Light Blue"), value = 4 },
    { label = Lang:t("Light Green"), value = 30 },
    { label = Lang:t("Dark Yellow"), value = 35 },
    { label = Lang:t("Light Red"), value = 6 },
    { label = Lang:t("Light Orange"), value = 8 },
    { label = Lang:t("Dark Orange"), value = 9 },
    { label = Lang:t("Gold"), value = 46 },
    { label = Lang:t("Silver"), value = 47 },
    { label = Lang:t("Bronze"), value = 48 },
    { label = Lang:t("Dark Brown"), value = 49 },
    { label = Lang:t("Light Brown"), value = 50 },
    { label = Lang:t("Dark Gray"), value = 51 },
    { label = Lang:t("Light Gray"), value = 52 },
    { label = Lang:t("Dark Pink"), value = 84 },
    { label = Lang:t("Light Pink"), value = 85 },
}

local function openBlipMenu(header, isMenuHeader, params)
    return {
        header = header,
        isMenuHeader = isMenuHeader or false,
        params = params or {}
    }
end

RegisterCommand('createblip', function()
    local player = PlayerId()
    local isAdmin = QBCore.Functions.HasPermission(player, "god")
    
    if isAdmin then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        exports['qb-menu']:openMenu({
            openBlipMenu("Blip Manager", true),
            openBlipMenu(Lang:t("blip_create"), false, { event = '8L_BlipCreator:client:openInput', args = { coords = coords } }),
            openBlipMenu(Lang:t("blip_edit"), false, { event = '8L_BlipCreator:client:editBlips' }),
            openBlipMenu(Lang:t("close"), false, { event = 'qb-menu:client:closeMenu' })
        })
    else
        local message = Lang:t("no_permission")
        QBCore.Functions.Notify(message, "error")
    end
end, false)


--RegisterKeyMapping('createblip', 'Open Blip Manager', 'keyboard', 'F7')

RegisterNetEvent('8L_BlipCreator:client:openInput', function(data)
    local dialog = {
        { type = "text", name = "blipName", label = Lang:t("blip_name"), default = "Blip Name" }
    }

    local input = exports['qb-input']:ShowInput({
        header = Lang:t("blip_desc"),
        submitText = Lang:t("next"),
        inputs = dialog
    })

    if input and input.blipName then
        local blipName = input.blipName

        local blipIconMenu = {
            openBlipMenu(translate.translate("blip_id"), false, { event = '8L_BlipCreator:client:customIcon', args = { name = blipName, coords = data.coords } }),
            openBlipMenu("Select Blip Icon", true)
        }

        for _, icon in ipairs(blipIcons) do
            table.insert(blipIconMenu, openBlipMenu(icon.label, false, { event = '8L_BlipCreator:client:selectIcon', args = { name = blipName, coords = data.coords, icon = icon.value } }))
        end

        table.insert(blipIconMenu, openBlipMenu(Lang:t("back"), false, { event = '8L_BlipCreator:client:openInput', args = data }))
        table.insert(blipIconMenu, openBlipMenu(Lang:t("close"), false, { event = 'qb-menu:client:closeMenu' }))

        exports['qb-menu']:openMenu(blipIconMenu)
    end
end)

RegisterNetEvent('8L_BlipCreator:client:customIcon', function(data)
    local dialog = {
        { type = "number", name = "customIcon", label = Lang:t("blip_id"), default = "" }
    }
    local input = exports['qb-input']:ShowInput({
        header = Lang:t("blip_id"),
        submitText = Lang:t("next"),
        inputs = dialog
    })
    if input and input.customIcon then
        data.icon = tonumber(input.customIcon) 
        TriggerEvent('8L_BlipCreator:client:selectIcon', data)
    end
end)

RegisterNetEvent('8L_BlipCreator:client:selectIcon', function(data)
    local blipColorMenu = {
        openBlipMenu(Lang:t("blip_id_color"), false, { event = '8L_BlipCreator:client:customColor', args = data }),
        openBlipMenu("Select Blip Color", true)
    }
    for _, color in ipairs(blipColors) do
        table.insert(blipColorMenu, openBlipMenu(color.label, false, { event = '8L_BlipCreator:client:createBlip', args = { name = data.name, coords = data.coords, icon = data.icon, color = color.value } }))
    end
    table.insert(blipColorMenu, openBlipMenu(Lang:t("back"), false, { event = '8L_BlipCreator:client:selectIcon', args = data }))
    table.insert(blipColorMenu, openBlipMenu(Lang:t("close"), false, { event = 'qb-menu:client:closeMenu' }))
    exports['qb-menu']:openMenu(blipColorMenu)
end)

RegisterNetEvent('8L_BlipCreator:client:customColor', function(data)
    local dialog = {
        { type = "number", name = "customColor", label = Lang:t("blip_id_color"), default = "" }
    }

    local input = exports['qb-input']:ShowInput({
        header = Lang:t("blip_id_color"),
        submitText = Lang:t("next"),
        inputs = dialog
    })

    if input and input.customColor then
        data.color = tonumber(input.customColor) 
        TriggerEvent('8L_BlipCreator:client:createBlip', data)
    end
end)

RegisterNetEvent('8L_BlipCreator:client:createBlip', function(data)
    local blipName = data.name
    local blipCoords = data.coords
    local blipIcon = data.icon
    local blipColor = data.color
    local blip = AddBlipForCoord(blipCoords.x, blipCoords.y, blipCoords.z)
    SetBlipSprite(blip, blipIcon)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, blipColor)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(blipName)
    EndTextCommandSetBlipName(blip)

    table.insert(blips, { blip = blip, name = blipName, coords = blipCoords, icon = blipIcon, color = blipColor })
    TriggerServerEvent('8L_BlipCreator:server:saveBlips', blips)
end)

RegisterNetEvent('8L_BlipCreator:client:loadBlips', function(serverBlips)
    for _, blipData in ipairs(serverBlips) do
        local blip = AddBlipForCoord(blipData.coords.x, blipData.coords.y, blipData.coords.z)
        SetBlipSprite(blip, blipData.icon or 1)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 1.0)
        SetBlipColour(blip, blipData.color or 2)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(blipData.name)
        EndTextCommandSetBlipName(blip)

        table.insert(blips, { blip = blip, name = blipData.name, coords = blipData.coords, icon = blipData.icon, color = blipData.color })
    end
end)

RegisterNetEvent('8L_BlipCreator:client:editBlips', function()
    local menu = {
        openBlipMenu(Lang:t("blip_edit"), true)
    }

    for i, blipData in ipairs(blips) do
        table.insert(menu, openBlipMenu(blipData.name, false, { event = '8L_BlipCreator:client:manageBlip', args = { index = i, blipData = blipData } }))
    end

    table.insert(menu, openBlipMenu(Lang:t("back"), false, { event = 'createblip' }))
    table.insert(menu, openBlipMenu(Lang:t("close"), false, { event = 'qb-menu:client:closeMenu' }))

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('8L_BlipCreator:client:manageBlip', function(data)
    local blipData = data.blipData
    local index = data.index

    exports['qb-menu']:openMenu({
        openBlipMenu(Lang:t("blip_edit")" - " .. blipData.name, true),
        openBlipMenu(Lang:t("blip_id"), false, { event = '8L_BlipCreator:client:changeIcon', args = { index = index, name = blipData.name, coords = blipData.coords } }),
        openBlipMenu(Lang:t("blip_id_color"), false, { event = '8L_BlipCreator:client:changeColor', args = { index = index, name = blipData.name, coords = blipData.coords } }),
        openBlipMenu(Lang:t("blip_del"), false, { event = '8L_BlipCreator:client:deleteBlip', args = { index = index } }),
        openBlipMenu(Lang:t("back"), false, { event = '8L_BlipCreator:client:editBlips' }),
        openBlipMenu(Lang:t("close"), false, { event = 'qb-menu:client:closeMenu' })
    })
end)

RegisterNetEvent('8L_BlipCreator:client:changeIcon', function(data)
    local blipIconMenu = {
        openBlipMenu(Lang:t("blip_id"), false, { event = '8L_BlipCreator:client:customIcon', args = data }),
        openBlipMenu("Select Blip Icon", true)
    }
    for _, icon in ipairs(blipIcons) do
        table.insert(blipIconMenu, openBlipMenu(icon.label, false, { event = '8L_BlipCreator:client:updateIcon', args = { index = data.index, icon = icon.value, name = data.name, coords = data.coords } }))
    end
    table.insert(blipIconMenu, openBlipMenu(Lang:t("back"), false, { event = '8L_BlipCreator:client:manageBlip', args = data }))
    table.insert(blipIconMenu, openBlipMenu(Lang:t("close"), false, { event = 'qb-menu:client:closeMenu' }))
    exports['qb-menu']:openMenu(blipIconMenu)
end)

RegisterNetEvent('8L_BlipCreator:client:updateIcon', function(data)
    local blip = blips[data.index].blip
    SetBlipSprite(blip, data.icon)
    blips[data.index].icon = data.icon
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(data.name)
    EndTextCommandSetBlipName(blip)

    TriggerServerEvent('8L_BlipCreator:server:updateBlip', blips)
end)

RegisterNetEvent('8L_BlipCreator:client:changeColor', function(data)
    local blipColorMenu = {
        openBlipMenu(Lang:t("blip_id_color"), false, { event = '8L_BlipCreator:client:customColor', args = data }),
        openBlipMenu("Select Blip Color", true)
    }
    for _, color in ipairs(blipColors) do
        table.insert(blipColorMenu, openBlipMenu(color.label, false, { event = '8L_BlipCreator:client:updateColor', args = { index = data.index, color = color.value, name = data.name, coords = data.coords } }))
    end
    table.insert(blipColorMenu, openBlipMenu(Lang:t("back"), false, { event = '8L_BlipCreator:client:manageBlip', args = data }))
    table.insert(blipColorMenu, openBlipMenu(Lang:t("close") false, { event = 'qb-menu:client:closeMenu' }))
    exports['qb-menu']:openMenu(blipColorMenu)
end)

RegisterNetEvent('8L_BlipCreator:client:updateColor', function(data)
    local blip = blips[data.index].blip
    SetBlipColour(blip, data.color)
    blips[data.index].color = data.color
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(data.name)
    EndTextCommandSetBlipName(blip)

    TriggerServerEvent('8L_BlipCreator:server:updateBlip', blips)
end)

RegisterNetEvent('8L_BlipCreator:client:deleteBlip', function(data)
    local blip = blips[data.index].blip
    RemoveBlip(blip)
    table.remove(blips, data.index)
    TriggerServerEvent('8L_BlipCreator:server:updateBlip', blips)
end)
