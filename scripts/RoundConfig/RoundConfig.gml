function setLeft() {
	switch(global.round) {
		case 1: {
			global.left = 1000;	
		} break;
		case 2: {
			global.left = 1200;
		} break;
		case 3: {
			global.left = 1500;	
		} break;
		default: {
			global.left = 1600 + 200 * (global.round - 3);
		}
	}
}

function getCoreStart() {
	return 0.1 + 0.008 * global.round;
}

function getCoreIncrease() {
	return 0.004 + 0.0005 * global.round;
}

function coreShoot() {
	var _shoot = function(_shootDir, _obj, _size = 0) {
		var _layer = _obj == oSpike ? "Spikes" : "Bubbles";
		with(instance_create_layer(x+lengthdir_x(5,_shootDir),y+lengthdir_y(5,_shootDir),_layer,_obj)) {
			var _dir = _shootDir + random_range(-5,5);
			var _spd = random_range(1, 1.5);
			if (_obj == oSpike) _spd = random_range(0.4, 0.8) + 0.01 * global.round;
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
		} break;
		case 3: {
			_shoot(shootDir, oBubble, random_range(90, 110));
			_shoot(shootDir+180, oSpike);
			_shoot(shootDir+90, oBubble, random_range(100, 150));
			_shoot(shootDir+270, oBubble, random_range(100, 150));
		} break;
		case 4: {
			_shoot(shootDir, oBubble, random_range(150, 180));
			_shoot(shootDir+180, choose(oBubble, oSpike), random_range(150, 180));
		} break;
		default: {
			if (global.round % 3 == 0) {
				_shoot(shootDir, oBubble, random_range(90, 110));
				_shoot(shootDir+180, oSpike);
				_shoot(shootDir+90, oBubble, random_range(100, 150));
				_shoot(shootDir+270, oBubble, random_range(100, 150));
			} else if (global.round % 3 == 1) {
				_shoot(shootDir, irandom(6) == 0 ? oSpike : oBubble, random_range(150, 200));
				_shoot(shootDir+180, irandom(6) == 0 ? oSpike : oBubble, random_range(150, 200));
			} else {
				_shoot(shootDir, irandom(6) == 0 ? oSpike : oBubble, random_range(130, 180));
				_shoot(shootDir+120, oBubble, random_range(100, 120));
				_shoot(shootDir+240, irandom(3) == 0 ? oSpike : oBubble, random_range(150, 200));
			}			
		} break;
	}
}