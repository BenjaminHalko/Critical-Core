/// @desc 

image_alpha -= 0.01;
if (image_alpha <= 0) instance_destroy();

with(oScore) {
	if id == other.id continue;
	
	if (abs(x - other.x) < 20 and other.image_alpha > image_alpha and abs((y-16*(1-image_alpha)) - (other.y-16*(1-other.image_alpha))) < 8) {
		y -= 1;
	}
}