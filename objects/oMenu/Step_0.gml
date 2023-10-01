/// @desc 

enableLive;

if (!oLeaderboardAPI.draw) {
	Input();
	if(disableSelect) {
		keySelect = false;
		disableSelect = false;
	}
	if (DESKTOP or BROWSER) {
		if (keyDown or keyUp) and !keyboard_check(ord("W")) and !keyboard_check(ord("S")) {
			if (acceptMenuInput) {
				if (option == 2) {
					Save("settings","username",global.username);
				}
				option = Wrap(option + keyDown - keyUp, 0, 3);
				if (option == 2) keyboard_string = global.username;
				acceptMenuInput = false;
				audio_play_sound(snBlip,2,false);
			}
		} else {
			acceptMenuInput	= true;	
		}
			
		if (option == 0 and keySelect) {
			if (global.username != "") {
				oGUI.alarm[0] = 1;
				instance_deactivate_object(id);
			} else {
				usernameFlash = 1;
				audio_play_sound(snBlip,2,false);
			}
		}
		
		if (option == 1 and keySelect) {
			GotoLeaderboard();
			audio_play_sound(snBlip,2,false);
		}
	
		if (option == 2) {
			if (alarm[0] <= 0) alarm[0] = 30;
			if keyboard_lastkey != vk_nokey {
				if (keyboard_lastkey == vk_backspace or (ord(keyboard_lastchar) >= 32 and ord(keyboard_lastchar) <= 255)) and string_length(keyboard_string) <= 10 and (keyboard_lastkey != vk_space or string_length(global.username) > 0) global.username = keyboard_string;
				else keyboard_string = global.username;
				keyboard_lastkey = vk_nokey;
			}
		}
	
		if (option == 3) {
			if (keyLeft or keyRight) {
				if (volAcceptMenuInput) {
					volAcceptMenuInput = false;
					global.audioVol = clamp(global.audioVol + (keyRight - keyLeft) * 0.1, 0, 1);
					Save("settings","vol",global.audioVol);
					audio_master_gain(global.audioVol);
					audio_play_sound(snBlip,2,false);
				}
			} else {
				volAcceptMenuInput = true;	
			}
		}
	}
	
	usernameFlash = Approach(usernameFlash, 0, 0.04);
}