/// @desc 

// Collide with wall
if (collide) {
	var _wall = instance_place(x+xSpd,y+ySpd,oWall);
	if (_wall != noone) {
		var _dir = point_direction(0,0,xSpd,ySpd);
		var _angleDifference = angle_difference(_dir, _wall.image_angle+90+_wall.flipped*180);
		if (_angleDifference <= 90) { 
			var _oneX = lengthdir_x(1, _dir);
			var _oneY = lengthdir_y(1, _dir);
			while(!place_meeting(x,y,oWall)) {
				x += _oneX;	
				y += _oneY;
			}
			
			if (object_index != oPlayer) {
				var _len = point_distance(0,0,xSpd,ySpd);
				var _wallAngle = Wrap(_dir - clamp(_angleDifference, -85, 85) - _wall.flipped*180 - 90, 0, 360);
				_dir = 2 * _wallAngle - _dir;
				xSpd = lengthdir_x(_len, _dir);
				ySpd = lengthdir_y(_len, _dir);
			} else {
				xSpd = 0;
				ySpd = 0;
			}
		}
		
		if (object_index == oPlayer) {
			if (!_wall.flipped or deathDelay <= 0) { 
				GameOver();
			}
		}
	}
} else if (!place_meeting(x,y,oCore)) {
	collide = true;	
}

// Move
x += xSpd;
y += ySpd;