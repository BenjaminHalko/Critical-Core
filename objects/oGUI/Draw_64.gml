/// @desc 

enableLive;

draw_set_font(fFont);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _displayString = function(_num, _digits) {
	return string_replace_all(string_format(_num,_digits,0)," ","0");
}

// TL
draw_text(8,8,$"SCORE\n {_displayString(global.score, 5)}");

// TR
draw_text(200,8,$"LEFT\n {global.left}");


// BL
draw_text(8,176,$"PB\n {_displayString(global.pb, 5)}");
draw_text(8,200,$"HISCORE\n {_displayString(global.highscore, 5)}");

// BR
draw_text(200,176,$"ROUND\n {global.round}");
draw_text(200,200,$"LIVES\n {global.lives}");

if (gameStart % 2 == 1) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width/2,room_height/2,"READY?");
}