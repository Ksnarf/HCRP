fx_version 'adamant'
games { 'gta5' }

-- Script Description
description 'emsgator by CandiMods  store.candimods.com' 

files {
	'vehicles.meta',
	'carvariations.meta',
	'carcols.meta',
	'handling.meta', 
}

data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'
data_file 'HANDLING_FILE' 'handling.meta'

client_scripts {
	'vehiclenames.lua'
}