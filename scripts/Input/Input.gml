function Input() {
	var _gpLeft, _gpRight, _gpUp, _gpDown, _gpSelect = false;
	
	for(var i = 0; i < gamepad_get_device_count(); i++) {
		_gpLeft = gamepad_button_check(i,gp_padl) or max(0, -gamepad_axis_value(i,gp_axislh));
		_gpRight = gamepad_button_check(i,gp_padr) or max(0, gamepad_axis_value(i,gp_axislh));
		_gpUp = gamepad_button_check(i,gp_padu) or max(0, -gamepad_axis_value(i,gp_axislv));
		_gpDown = gamepad_button_check(i,gp_padd) or max(0, gamepad_axis_value(i,gp_axislv));
		for(var j = gp_face1; j <= gp_face4; j++) if(gamepad_button_check_pressed(i,j)) _gpSelect = true;
		
		if(_gpLeft or _gpRight or _gpDown or _gpUp or _gpSelect) break;
	}

	keyLeft = keyboard_check(vk_left) or keyboard_check(ord("A")) or _gpLeft;
	keyRight = keyboard_check(vk_right) or keyboard_check(ord("D")) or _gpRight;
	keyUp = keyboard_check(vk_up) or keyboard_check(ord("W")) or _gpUp;
	keyDown = keyboard_check(vk_down) or keyboard_check(ord("S")) or _gpDown;
	keySelect = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_shift) or _gpSelect;	
}