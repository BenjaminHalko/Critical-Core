/// @desc 

getOsType();

surface_resize(application_surface, 256, 224);

if (DESKTOP) {
	window_set_size(256*3, 224*3);
	window_center();
}

//instance_create_layer(0,0,layer,oLeaderboardAPI);

// Load Save Data
ini_open(SAVEFILE);
global.username = ini_read_string("settings","username","");
global.audioVol = ini_read_real("settings","vol",0.7);
ini_close();

audio_master_gain(global.audioVol);

room_goto_next();