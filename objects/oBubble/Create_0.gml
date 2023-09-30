/// @desc

enableLive;

// Inherit the parent event
event_inherited();

allowMerge = false;
mass = 0;
radius = 0;
absorbing = false;
absorbAmount = 0;
setRadius = function() {
	radius = sqrt(mass / pi);
	image_xscale = radius / 4;
	image_yscale = radius / 4;
}