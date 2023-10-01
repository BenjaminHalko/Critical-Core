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
	scoreOffset = Approach(scoreOffset, scoreOffsetTarget, 0.2);
	
	if (keySelect) {
		draw = false;
		oMenu.disableSelect = true;
	}
}
	