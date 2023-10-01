/// @desc 

enableLive;

var _shoot = function(_shootDir, _obj) {
	var _layer = _obj == oSpike ? "Spikes" : "Bubbles";
	with(instance_create_layer(x+lengthdir_x(5,_shootDir),y+lengthdir_y(5,_shootDir),_layer,_obj)) {
		var _dir = _shootDir + random_range(-10,10);
		var _spd = random_range(1, 1.5);
		if (_obj == oSpike) _spd = random_range(0.5, 1);
		xSpd = lengthdir_x(_spd, _dir);
		ySpd = lengthdir_y(_spd, _dir);
		
		if (object_index == oBubble) {
			mass = random_range(75, 100);
			setRadius();
		}
	}
}

if (!global.gameOver and global.audioTick and global.audioBeat % 1 == 0) {
	if (--delay < 0) {
		shootDir += 20;
		_shoot(shootDir, choose(oBubble, oBubble, oBubble, oBubble, oSpike));
		_shoot(shootDir+180, choose(oBubble, oBubble, oBubble, oBubble, oSpike));
	}
}

pulse = Approach(pulse,0,0.1);
scale = ApproachFade(scale,(targetScale * 208 + pulse * 10) / 208,1,0.7);
image_xscale = scale;
image_yscale = scale;
for(var i = 0; i < array_length(walls); i++) {
	with(walls[i].instance) {
		image_xscale = other.walls[i].scale * other.scale;
		x = lerp(xstart, other.walls[i].x, other.scale);
		y = lerp(ystart, other.walls[i].y, other.scale);
	}
}