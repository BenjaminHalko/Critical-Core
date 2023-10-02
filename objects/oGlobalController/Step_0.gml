/// @desc Game Step

// Fullscreen
if (DESKTOP and (keyboard_check_pressed(vk_f4) or keyboard_check_pressed(vk_f11))) window_set_fullscreen(!window_get_fullscreen());

// Browser Resizing
ScaleCanvas();

// Back
if (global.inGame or oLeaderboardAPI.draw) {
	Input();
	if (keyBack) {
		audio_play_sound(snBlip, 2, false);
		ReturnToMenu();
	}
}

// Render
if (keyboard_check_pressed(vk_tab)) {
	global.render = !global.render;
	Save("settings","render",global.render);
}