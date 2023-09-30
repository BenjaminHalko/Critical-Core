/// @desc 

// Move
x += lengthdir_x(spd, dir);
y += lengthdir_y(spd, dir);

// Collide with wall
var _wall = instance_place(x,y,oWall);
if (_wall != noone) {
    dir = 2 * _wall.image_angle - dir;
}