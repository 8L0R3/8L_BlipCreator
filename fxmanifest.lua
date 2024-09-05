fx_version "adamant"
name '8L_BlipCreator'
description "Blips creator for QBCore"
author "8L0R3"
version '1.1.2'
repository 'https://github.com/8L0R3/8L_BlipCreator'

game "gta5"

shared_script {
    '@qb-core/shared/locale.lua',
    "shared/*.lua",
    "locales/*lua",
   -- "translation.lua
}

client_script { 
    "client/*.lua",
    "shared/*.lua",
    --"translation.lua",
    "locales/*lua"
    --"translation.lua"
}

server_script {
    "server/server.lua",
    "shared/*.lua",
    --"translation.lua",
    "locales/*lua"
    --"translation.lua"
}

dependencies {
    'qb-core',
    'qb-menu',
    'qb-input'
}

files {
    "locales/*.lua"
}

lua54 'yes'