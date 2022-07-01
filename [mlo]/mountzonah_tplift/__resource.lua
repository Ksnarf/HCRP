resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Lift' 

version '0.1'

client_scripts {
	-- '@es_extended/locale.lua',
	'locales/fr.lua',
	'client/GUI.lua',
	'config.lua',
	'client/client.lua'
}

server_scripts {
	-- '@es_extended/locale.lua',
	'config.lua'
}