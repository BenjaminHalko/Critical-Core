#macro FIREBASE_LEADERBOARD_URL "https://ld54-69551-default-rtdb.firebaseio.com/"
#macro GXG_CHALLENGE_ID ""
#macro GOOGLEPLAY_LEADERBOARD_ID ""

#macro SAVEFILE "save.ini"

#macro BROWSER (global.ostype == OS.OSBROWSER)
#macro OPERA (global.ostype == OS.OSOPERA)
#macro DESKTOP (global.ostype == OS.OSDESKTOP)
#macro MOBILE (global.ostype == OS.OSMOBILE or os_type == os_android or global.mobileOperaGX)

#macro OTHER_LEADERBOARD (OPERA or MOBILE)

enum OS {
	OSBROWSER,
	OSOPERA,
	OSMOBILE,
	OSDESKTOP
}

function getOsType() {
	if(os_type == os_operagx) global.ostype = OS.OSOPERA;
	else if(os_browser != browser_not_a_browser) global.ostype = OS.OSBROWSER;
	else if(os_type == os_android) global.ostype = OS.OSMOBILE;
	else global.ostype = OS.OSDESKTOP;
	
	if OPERA {
		var _info = os_get_info();
		global.mobileOperaGX = _info[? "mobile"];
		ds_map_destroy(_info);
	} else {
		global.mobileOperaGX = false;	
	}
}