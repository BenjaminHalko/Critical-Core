/// @desc 

enableLive;

// Inherit the parent event
event_inherited();

shootDir = point_direction(x,y,mouse_x,mouse_y);

if (mouse_check_button_pressed(mb_left)) {
	cannonKnockback = 6;
	
	with(instance_create_layer(x+lengthdir_x(radius-5,shootDir),y+lengthdir_y(radius-5,shootDir),"Bubbles",oBubble)) {
		xSpd = lengthdir_x(1, other.shootDir);
		ySpd = lengthdir_y(1, other.shootDir);
		mass = 30;
		setRadius();
	}
	
	xSpd -= lengthdir_x(0.8, shootDir);
	ySpd -= lengthdir_y(0.8, shootDir);
	mass -= 50;
}

if (mass <= 0) {
	instance_destroy();	
}

// Fade Values
cannonKnockback = ApproachFade(cannonKnockback, 0, 1, 0.7);