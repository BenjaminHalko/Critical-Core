/// @desc 

enableLive;

shootDir = random(360);
x = room_width/2;
y = room_height/2;

pulse = 0;
targetScale = 0.1;
scale = 0;

delay = 0;

walls = [];
with(oWall) {
	array_push(other.walls, {
		x: x,
		y: y,
		dir: image_angle,
		scale: image_xscale
	});
}

for(var i = 0; i < array_length(walls); i++) {
	var _wall = instance_create_depth(x,y,depth-1,oWall);
	with(_wall) {
		image_angle = other.walls[i].dir;
		image_xscale = 0;
		flipped = true;
		index = -1;
	}
	walls[i].instance = _wall;
}

polygonPoints = [
	[-24, -104],
	[24, -104],
	[104, -24],
	[104, 24],
	[24, 104],
	[-24, 104],
	[-104, 24],
	[-104, -24]
]