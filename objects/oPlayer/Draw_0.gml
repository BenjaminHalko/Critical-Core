/// @desc 

enableLive;

draw_set_color(c_blue);
draw_circle(x-1,y-1,radius,false);

// Draw Blaster
draw_sprite_ext(sPlayerCannon,0,
	x+lengthdir_x(radius+2-cannonKnockback, shootDir),
	y+lengthdir_y(radius+2-cannonKnockback, shootDir),
1,1,shootDir,c_white,1);