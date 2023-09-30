/// @desc 

enableLive;

var _shoot = function(_shootDir) {
	var _isSpike = choose(true, false);
	var _layer = _isSpike ? "Spikes" : "Bubbles";
	var _obj = _isSpike ? oSpike : oBubble;
	with(instance_create_layer(x,y,_layer,_obj)) {
		var _dir = _shootDir + random_range(-10,10);
		var _spd = random_range(1, 1.5);
		xSpd = lengthdir_x(_spd, _dir);
		ySpd = lengthdir_y(_spd, _dir);
		
		if (object_index == oBubble) {
			mass = random_range(20, 30);
			setRadius();
		}
	}
}

if (global.audioTick and global.audioBeat % 1 == 0) {
	shootDir += 20;
	
	_shoot(shootDir);
}