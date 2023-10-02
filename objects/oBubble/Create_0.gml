/// @desc

enableLive;

// Inherit the parent event
event_inherited();

allowMerge = false;
mass = 0;
radius = 0;
absorber = noone;
absorbAmount = 0;

double = irandom(19) == 0;

setRadius = function() {
	radius = sqrt(mass / pi);
	image_xscale = radius / 8;
	image_yscale = radius / 8;
}