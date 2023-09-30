/// @desc 

draw_set_font(fScore);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_set_alpha(image_alpha);
draw_text(x,y-16*(1-image_alpha),amount);
draw_set_alpha(1);