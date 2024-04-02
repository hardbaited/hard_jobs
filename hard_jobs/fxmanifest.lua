fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 'HardBaited#0001'


server_scripts {
    '**/server/*.lua'
}

client_scripts {
    '**/client/*.lua',
}

shared_scripts {
    	'Configs/*.lua',
	'locale.lua',
	'locales/en.lua',
}

dependency 'vorp_core'
