function GameStart() {
	instance_create_layer(room_width/2,room_height/2,"Core",oCore);
	global.lives = 3;
	global.score = 0;
	global.round = 1;
	global.inGame = true;
	global.nextRound = false;
	Respawn();
}

function GameEnd() {
	instance_destroy(oCore);
	instance_destroy(pEntity);
	LeaderboardPost();
	GotoLeaderboard();
}

function ReturnToMenu() {
	global.inGame = false;
	global.gameOver = false;
	global.nextRound = false;
	global.roundIntro = false;
	oGUI.moveTutorial = false;
	oGUI.alarm[1] = -1;
	instance_destroy(oCore);
	instance_destroy(pEntity);
	instance_destroy(oPlayerTrail);
	instance_activate_object(oMenu);
}

function Respawn() {
	instance_destroy(pEntity);
	instance_create_layer(room_width/2,44,"Player",oPlayer);
	RoundStart();
	global.gameOver = false;
}

function RoundStart() {
	global.nextRound = false;
	global.roundIntro = true;
	with (oCore) {
		playerHasMoved = false;
		shootDir = 0;
		flipShootDir = !flipShootDir;
	}
	call_later(global.gameOver ? 60 : 90, time_source_units_frames, function() {
		if (global.inGame) {
			global.roundIntro = false;
			if (!global.gameOver) oGUI.alarm[1] = 180;
		}
	})
	setLeft();
	with(oCore) {
		targetScale = getCoreStart();
	}
}

function GotoLeaderboard() {
	with(oLeaderboardAPI) {
		var _index = array_find_index(scores, function(_val) {
			return _val.name == global.username;
		});
		
		if (_index != -1) {
			scoreOffsetTarget = max(0, min(_index-3, array_length(scores)-scoresPerPage));
			scoreOffset = scoreOffsetTarget;
		} else {
			scoreOffsetTarget = 0;
			scoreOffset = 0;
		}
					
		draw = true;
		disableSelect = true;
	}
}