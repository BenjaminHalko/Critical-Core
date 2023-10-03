/// @desc 

// Move
x += xSpd;
y += ySpd;

// Collide with wall
if (collide) {
	var _wall = instance_place(x,y,oWall);
	if (_wall != noone) {
		if (object_index == oPlayer) {
			if (!_wall.flipped or deathDelay <= 0) { 
				GameOver();
			}
		} else {
			var _moveDir = point_direction(0,0,xSpd,ySpd);
			if (angle_difference(_moveDir, _wall.image_angle+90+_wall.flipped*180) <= 90) { 
				var _len = point_distance(0,0,xSpd,ySpd);
				var _dir = point_direction(0,0,xSpd,ySpd);
			    _dir = 2 * _wall.image_angle - _dir;
				xSpd = lengthdir_x(_len, _dir);
				ySpd = lengthdir_y(_len, _dir);
		
				_wall.touchPulse = 1;
				_wall.touchColor = c_aqua;
		
				while(!place_meeting(x-xSpd,y-ySpd,_wall)) {
					x += xSpd;
					y += ySpd;
				}
			}
		}
	}
} else if (!place_meeting(x,y,oCore)) {
	collide = true;	
}