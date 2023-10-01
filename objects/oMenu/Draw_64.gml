/// @desc 

enableLive;

if (!oLeaderboardAPI.draw) {
	draw_set_font(fFont);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	if (!enterUsername) {
		var _menuX = room_width/2 - 34;
		var _menuY = room_height/2 + 8;
		draw_text(_menuX - 8, _menuY + 16 * option + 4 * (option == 3), ">");
		draw_text(_menuX, _menuY, "START");
	
		_menuY += 16;
		draw_text(_menuX, _menuY, "LEADERBOARD");
	
		_menuY += 16;
		draw_text(_menuX, _menuY, "USERNAME");
	
		_menuY += 5;
		var _username = global.username;
		draw_set_font(fScore);
		if (blink and option == 2) _username += "_";
		draw_text(_menuX + 16, _menuY, _username);
	
		_menuY += 18;
		draw_sprite(sAudioLine,0,_menuX,_menuY);
		draw_sprite(sAudioLine,1,_menuX+round(60 * global.audioVol),_menuY);
		draw_sprite(sAudio,0,_menuX+62,_menuY);
	} else {
		var _menuX = room_width/2 - 38;
		var _menuY = room_height/2 + 8;
	
		draw_text(_menuX - 12, _menuY, "ENTER USERNAME");
	
		_menuY += 8;
		var _username = global.username;
		if (blink) _username += "_";
		draw_text(_menuX + 8, _menuY, _username);
	}
}