fx_version 'cerulean'
game 'gta5'

author 'Jacobmaate'
description 'Lore-Style Lenco Bearcat'
version 'v1.0 (BETA #5)'

files {
    'data/vehicles.meta',
    'data/carvariations.meta',
    'data/carcols.meta',
    'data/handling.meta',
    'data/vehiclelayouts_jmbearcat.meta',
    'data/jmbearcat_game.dat151.rel'
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts_jmbearcat.meta'
data_file 'AUDIO_GAMEDATA' 'data/jmbearcat_game.dat'

client_script 'vehicle_names.lua'