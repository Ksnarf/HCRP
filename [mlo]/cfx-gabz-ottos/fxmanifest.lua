fx_version 'cerulean'
game 'gta5'
author 'Gabz'
description 'Ottos'
version '8.0.3'
lua54 'yes'
this_is_a_map 'yes'

dependencies { 
    '/server:4960',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 4960.
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
    'cfx-gabz-mapdata', -- ⚠️PLEASE READ⚠️; Requires [cfx-gabz-mapdata] to work properly.
    'cfx-gabz-247', -- ⚠️PLEASE READ⚠️; Requires [cfx-gabz-247] to work properly.
    'cfx-gabz-pizzeria', -- ⚠️PLEASE READ⚠️; Requires [cfx-gabz-pizzeria] to work properly.
}

server_scripts {
    'version_check.lua',
}

escrow_ignore {
    'stream/**/*.ytd',
}
dependency '/assetpacks'