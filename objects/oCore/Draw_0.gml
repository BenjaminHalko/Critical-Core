/// @desc 

draw_set_color(c_white);
draw_primitive_begin(pr_trianglelist);
for(var i = 0; i < array_length(polygonPoints); i++) {
	var j = (i + 1) % array_length(polygonPoints);
	draw_vertex(x,y);
	draw_vertex(x+polygonPoints[i][0]*scale-sign(polygonPoints[i][0]), y+polygonPoints[i][1]*scale-sign(polygonPoints[i][1]));
	draw_vertex(x+polygonPoints[j][0]*scale-sign(polygonPoints[j][0]), y+polygonPoints[j][1]*scale-sign(polygonPoints[j][1]));
}
draw_primitive_end();