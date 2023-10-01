/// @desc 

enableLive;

var _shoot = function(_shootDir, _obj) {
	var _layer = _obj == oSpike ? "Spikes" : "Bubbles";
	with(instance_create_layer(x+lengthdir_x(5,_shootDir),y+lengthdir_y(5,_shootDir),_layer,_obj)) {
		var _dir = _shootDir + random_range(-10,10);
		var _spd = random_range(1, 1.5);
		xSpd = lengthdir_x(_spd, _dir);
		ySpd = lengthdir_y(_spd, _dir);
		
		if (object_index == oBubble) {
			mass = random_range(50, 100);
			setRadius();
		}
	}
}

if (global.audioTick and global.audioBeat % 1 == 0) {
	shootDir += 20;
	
	_shoot(shootDir, choose(oBubble, oBubble, oBubble, oBubble, oSpike));
	
	_shoot(shootDir+180, choose(oBubble, oBubble, oBubble, oBubble, oSpike));
}