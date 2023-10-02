/// @desc 

randomize();

getOsType();

surface_resize(application_surface, 256, 224);

if (DESKTOP) {
	window_set_size(256*3, 224*3);
	window_center();
}

// Load Save Data
ini_open(SAVEFILE);
global.username = ini_read_string("settings","username","");
global.audioVol = ini_read_real("settings","vol",0.7);
global.pb =  ini_read_real("score","score",0);
ini_close();

audio_master_gain(global.audioVol);

instance_create_layer(0,0,layer,oLeaderboardAPI);

room_goto_next();