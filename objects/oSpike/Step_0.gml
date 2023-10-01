/// @desc 

enableLive;

// Inherit the parent event
event_inherited();

image_angle -= 10;

var _bubble = instance_place(x,y,oBubble);
if (_bubble != noone) {
	if (_bubble.object_index == oBubble) {
		repeat(max(10, _bubble.mass / 50)) {
			var _dir = random(360);
			var _len = random(_bubble.radius * 0.8);
			with(instance_create_depth(_bubble.x+lengthdir_x(_len, _dir),_bubble.y+lengthdir_y(_len, _dir), _bubble.depth+1, oPlayerTrail)) {
				radius = random_range(_bubble.radius / 4, _bubble.radius / 3);
				image_blend = c_white;
			}
		}
		instance_destroy(_bubble);
		instance_destroy();
	}
}