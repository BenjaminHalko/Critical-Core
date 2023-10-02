/// @desc 

if (global.render) {
	surface_set_target(surfacePong);
	draw_clear_alpha(c_black, 0);
	shader_set(shBlur);
	shader_set_uniform_f(uBlurVector,0,1);
	draw_surface(application_surface,0,0);
	surface_reset_target();

	shader_set_uniform_f(uBlurVector,1,0);
	draw_surface_ext(surfacePong,0,0,1,1,0,make_color_hsv(0,0,255*0.7),1);
	shader_reset();

	gpu_set_blendmode(bm_add);
	draw_surface_ext(application_surface,0,0,1,1,0,make_color_hsv(0,0,255*0.7),1);
	gpu_set_blendmode(bm_normal);
}