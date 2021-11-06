fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 'HardBaited#0001'


server_scripts {
    'Configs/*.lua',
    '**/server/*.lua'
}

client_scripts {
    'Configs/*.lua',
	'**/client/*.lua',
}

shared_scripts {
	'locale.lua',
	'locales/es.lua',
	'locales/en.lua',
}

dependency 'vorp_core'
