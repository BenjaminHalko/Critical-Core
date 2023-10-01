/// @desc 

enableLive;

if (global.gameOver) exit;

// Inherit the parent event
event_inherited();

image_angle -= 10;

var _bubble = instance_place(x,y,oBubble);
if (_bubble != noone) {
	if (_bubble.object_index == oBubble) {
		BurstBubble(_bubble);
		instance_destroy();
	} else {
		GameOver();	
	}
}