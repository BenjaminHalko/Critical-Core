/// @desc 

if (global.gameOver) exit;

// Inherit the parent event
event_inherited();

image_angle -= 10;

if (!place_meeting(x,y,oCore)) {
	var _bubble = instance_place(x,y,oBubble);
	if (_bubble != noone) {
		if (_bubble.object_index == oBubble) {
			BurstBubble(_bubble);
		} else {
			audio_play_sound(snPointLoss, 2, false)
			with(instance_create_layer(_bubble.x,_bubble.y-_bubble.radius-1,"GUI",oScore)) {
				amount = 200;
				negative = true;
			}
			global.left += 200;
			global.score -= 200;
			_bubble.mass -= 100;
		}
		instance_destroy();
	}
}