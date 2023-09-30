/// @desc Merge Bubbles

// Inherit the parent event
event_inherited();

var _bubble = instance_place(x,y,oBubbles);
if (_bubble != noone) {
	var _spd = min(mass, _bubble.mass) * 0.5;
	var _increase = (mass >= _bubble.mass) ? 1 : -1;
	mass += _spd * _increase;
	_bubble.mass -= _spd * _increase;
}

// Set Scale
radius = sqrt(mass / pi);
image_xscale = radius / 4;
image_yscale = radius / 4;

// Destroy
if (radius < 1) {
	instance_destroy();		
}