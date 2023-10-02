/// @desc 

if (!oLeaderboardAPI.draw) {
	draw_set_font(fFont);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	var _menuX = room_width/2 - 34;
	var _menuY = room_height/2 + 8;
	draw_text(_menuX - 8, _menuY + 16 * option + 4 * (option == 3), ">");
	draw_text(_menuX, _menuY, "START");
	
	_menuY += 16;
	draw_text(_menuX, _menuY, "LEADERBOARD");
	
	_menuY += 16;
	draw_set_color(merge_color(c_white, c_red, usernameFlash));
	draw_text(_menuX+random_range(-2,2)*usernameFlash, _menuY+random_range(-2,2)*usernameFlash, "USERNAME");
	draw_set_color(c_white);
	
	_menuY += 5;
	var _username = global.username;
	draw_set_font(fScore);
	if (blink and option == 2) _username += "_";
	if (global.username == "") {
		draw_set_color(c_dkgray);
		draw_text(_menuX+16, _menuY, "ENTER USERNAME");
		draw_set_color(c_white);
	}
	draw_text(_menuX + 16, _menuY, _username);
	
	_menuY += 18;
	draw_sprite(sAudioLine,0,_menuX,_menuY);
	draw_sprite(sAudioLine,1,_menuX+round(60 * global.audioVol),_menuY);
	draw_sprite(sAudio,0,_menuX+62,_menuY);
}