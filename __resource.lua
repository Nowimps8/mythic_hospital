resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Mythic Framework Hospital & Damage System'

version '2.0.0'

client_scripts {
	-- Config Files
	'strings.lua',
	'config.lua',
	'definitions.lua',
	'functional_config.lua',
	'client/scaleform.lua',
	
	'client/shared/defines.lua',
	'client/shared/functions.lua',
	'client/shared/threads.lua',

	-- Wound Files
	'client/wound/defines.lua',
	'client/wound/functions.lua',
	'client/wound/events.lua',
	'client/wound/threads.lua',

	-- Hospital Files
	'client/hospital/shared/events.lua',
	'client/hospital/hospital/functions.lua',
	'client/hospital/hospital/teleports.lua',
	'client/hospital/hospital/events.lua',
	'client/hospital/hospital/threads.lua',
	'client/hospital/hidden/events.lua',
	'client/hospital/hidden/threads.lua',
	
	'client/items.lua',
}

server_scripts {
	'strings.lua',
	'config.lua',
	'server/billing.lua',
	'server/wound.lua',

	'server/hospital/shared/defines.lua',
	'server/hospital/shared/functions.lua',
	'server/hospital/hospital/events.lua',
	'server/hospital/hidden/events.lua',
	'server/hospital/hidden/threads.lua',
}

dependencies {
	'mythic_progbar',
	'mythic_notify',
}

exports {
	'IsInjuredOrBleeding',
	'DoLimbAlert',
	'DoBleedAlert',
	'ResetAll'
}

server_exports {
    'GetCharsInjuries',
}
