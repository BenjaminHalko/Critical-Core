/// @desc 

enableLive;

if (draw) {
	draw_set_font(fScore);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	
	var _x = 73;
	var _y = 62;
	
	draw_text(_x+8, _y, "PLACE");
	draw_text(_x+42, _y, "NAME");
	draw_text(_x+80, _y, "SCORE");
	draw_text(_x+104, _y, "ROUND");
	
	draw_set_halign(fa_left);
	
	for(var i = max(0, scoreOffsetTarget-1); i < min(array_length(scores), scoreOffsetTarget+scoresPerPage+1); i++) {
		draw_set_color((scores[i].name == global.username) ? c_yellow : c_white);
		draw_set_alpha(1 - median(0, 1, abs((i - scoreOffset) - 3.5) - 3.5));
		var _scoreY = _y + (i - scoreOffset) * 9 + 16;
		
		var _place = string(i + 1);
		if ((i+1) % 10 == 1 and i+1 != 11) _place += "st";
		else if ((i+1) % 10 == 2 and i+1 != 12) _place += "nd";
		else if ((i+1) % 10 == 3 and i+1 != 13) _place += "rd";
		else _place += "th";
		
		draw_text(_x, _scoreY, _place);
		draw_text(_x+22, _scoreY, scores[i].name);
		draw_text(_x+70, _scoreY, scores[i].points);
		draw_text(_x+102, _scoreY, scores[i].level);
	}
	draw_set_alpha(1);
	
	if (scoreOffsetTarget != 0) {
		draw_sprite(sArrow, 0, room_width/2, _y+18);	
	}
	
	if (scoreOffsetTarget < array_length(scores)-scoresPerPage) {
		draw_sprite_ext(sArrow, 0, room_width/2, _y+94, 1, -1, 0, c_white, 1);	
	}
	
	draw_set_color(c_dkgray);
	draw_set_halign(fa_center);
	draw_text(room_width/2,170,"PRESS ENTER TO");
	draw_text(room_width/2,178,"CONTINUE");
}