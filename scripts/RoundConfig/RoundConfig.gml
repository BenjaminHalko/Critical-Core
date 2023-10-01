function setLeft() {
	enableLive;
	
	switch(global.round) {
		case 1: {
			global.left = 1000;
		} break;
		case 2: {
			global.left = 2000;
		} break;
		default: {
			global.left = global.round * 1000;
		} break;
	}
}

function getCoreStart() {
	enableLive;
	
	return 0.1 + 0.01 * global.round;
}

function getCoreIncrease() {
	enableLive;
	
	return 0.005 + 0.003 * global.round;
}

function coreShoot() {
	enableLive;
	
	var _shoot = function(_shootDir, _obj, _size) {
		var _layer = _obj == oSpike ? "Spikes" : "Bubbles";
		with(instance_create_layer(x+lengthdir_x(5,_shootDir),y+lengthdir_y(5,_shootDir),_layer,_obj)) {
			var _dir = _shootDir + random_range(-10,10);
			var _spd = random_range(1, 1.5);
			if (_obj == oSpike) _spd = random_range(0.5, 1);
			xSpd = lengthdir_x(_spd, _dir);
			ySpd = lengthdir_y(_spd, _dir);
		
			if (object_index == oBubble) {
				mass = _size;
				setRadius();
			}
		}
	}
	
	switch(global.round) {
		case 1: {
			_shoot(shootDir, oBubble, random_range(100, 150));
			_shoot(shootDir+180, oBubble, random_range(100, 150));
		} break;
		case 2: {
			_shoot(shootDir, oBubble, random_range(80, 120));
			_shoot(shootDir+120, oBubble, random_range(80, 120));
			_shoot(shootDir+240, oBubble, random_range(80, 120));
		}
	}
}