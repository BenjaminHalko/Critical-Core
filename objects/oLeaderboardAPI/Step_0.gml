/// @desc 

enableLive;

if (draw) {
	Input();
	if(disableSelect) {
		keySelect = false;
		disableSelect = false;
	}
	if (scoreOffset == scoreOffsetTarget) {
		if (array_length(scores)-scoresPerPage <= 0) {
			scoreOffsetTarget = 0;
		} else {
			scoreOffsetTarget = median(scoreOffsetTarget + keyDown - keyUp, 0, array_length(scores)-scoresPerPage);
		}
	}
	scoreOffset = Approach(scoreOffset, scoreOffsetTarget, 0.4);
	
	if (keySelect) {
		draw = false;
		if (global.inGame) {
			oGUI.alarm[0] = 1;
		} else {
			oMenu.disableSelect = true;
		}
	}
}
	