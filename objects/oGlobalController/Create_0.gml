/// @desc 

getOsType();

surface_resize(application_surface, 256, 224);

if (DESKTOP) {
	window_set_size(256*3, 224*3);
	window_center();
}

//instance_create_layer(0,0,layer,oLeaderboardAPI);

room_goto_next();