fx_version 'adamant'
games { 'gta5' }

-- Script Description
description 'emsgator by CandiMods  store.candimods.com' 

files {
	'data/vehicles.meta',
	'data/carvariations.meta',
	'data/carcols.meta',
	'data/handling.meta', 
}

data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'HANDLING_FILE' 'data/handling.meta'

client_scripts {
	'script/vehiclenames.lua'
}