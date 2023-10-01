/// @desc 

enableLive;

draw_set_font(fFont);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// TL
draw_text(8,8,$"SCORE\n {global.score}");

// TR
draw_text(200,8,"LEFT\n 2300");


// BL
draw_text(8,176,"PB\n 10000");
draw_text(8,200,"HISCORE\n 24020");

// BR
draw_text(200,176,$"ROUND\n {global.round}");
draw_text(200,200,$"LIVES\n {global.lives}");

if (gameStart % 2 == 1) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(room_width/2,room_height/2,"READY?");
}