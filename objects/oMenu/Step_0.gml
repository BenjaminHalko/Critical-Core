/// @desc 

enableLive;

if (!oLeaderboardAPI.draw) {
	Input();
	if(disableSelect) {
		keySelect = false;
		disableSelect = false;
	}
	if (DESKTOP or BROWSER) {
		if (enterUsername) {
			if (alarm[0] <= 0) alarm[0] = 30;
			if keyboard_lastkey != vk_nokey {
				if (keyboard_lastkey == vk_backspace or (ord(keyboard_lastchar) >= 32 and ord(keyboard_lastchar) <= 255)) and string_length(keyboard_string) <= 10 and (keyboard_lastkey != vk_space or string_length(global.username) > 0) global.username = keyboard_string;
				else keyboard_string = global.username;
				keyboard_lastkey = vk_nokey;
			}
			if (keyboard_check_pressed(vk_enter) and global.username != "") {
				Save("settings","username",global.username);
				enterUsername = false;
			}
		} else {
			if (keyDown or keyUp) and !keyboard_check(ord("W")) and !keyboard_check(ord("S")) {
				if (acceptMenuInput) {
					if (option != 2 or global.username != "") {
						if (option == 2) {
							Save("settings","username",global.username);
						}
						option = Wrap(option + keyDown - keyUp, 0, 3);
						if (option == 2) keyboard_string = global.username;
						acceptMenuInput = false;
					}
				}
			} else {
				acceptMenuInput	= true;	
			}
			
			if (option == 0 and keySelect) {
				oGUI.alarm[0] = 1;
				instance_deactivate_object(id);	
			}
		
			if (option == 1 and keySelect) {
				with(oLeaderboardAPI) {
					var _index = array_find_index(scores, function(_val) {
						return _val.name == global.username;
					});
		
					if (_index != -1) {
						scoreOffsetTarget = median(_index-3, 0, array_length(scores)-scoresPerPage);
						scoreOffset = scoreOffsetTarget;
					} else {
						scoreOffsetTarget = 0;
						scoreOffset = 0;
					}
					
					draw = true;
					disableSelect = true;
				}
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
					}
				} else {
					volAcceptMenuInput = true;	
				}
			}
		}
	}
}