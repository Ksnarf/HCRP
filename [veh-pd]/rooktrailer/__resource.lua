-- Leaked By: Leaking Hub | J. Snow | leakinghub.com

resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
 
files {

    'carvariations.meta',
    'carcols.meta',
    'vehicles.meta',
    
}

data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'CARCOLS_FILE' 'carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'



client_script {
    'client.lua'    -- Not Required
}