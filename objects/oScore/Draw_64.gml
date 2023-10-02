/// @desc 

draw_set_font(fScore);
draw_set_color(negative ? c_red : (double ? #56e08d : c_white));
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

var _amount = negative ? $"-{amount}": (double ? $"{amount}x2" : string(amount));

draw_set_alpha(image_alpha);
draw_text(x,y-16*(1-image_alpha),_amount);
draw_set_alpha(1);