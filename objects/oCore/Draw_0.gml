/// @desc 

draw_set_color(c_white);
draw_primitive_begin(pr_trianglelist);
for(var i = 0; i < array_length(polygonPoints); i++) {
	var j = (i + 1) % array_length(polygonPoints);
	draw_vertex(x,y);
	draw_vertex(x+polygonPoints[i][0]*scale, y+polygonPoints[i][1]*scale);
	draw_vertex(x+polygonPoints[j][0]*scale, y+polygonPoints[j][1]*scale);
}
draw_primitive_end();