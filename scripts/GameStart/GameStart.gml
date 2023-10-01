function GameStart() {
	instance_create_layer(room_width/2,room_height/2,"Core",oCore);
	global.lives = 3;
	global.score = 0;
	global.inGame = true;
	global.nextRound = false;
	global.gameOver = false;
	Respawn();
}

function GameEnd() {
	instance_destroy(oCore);
	instance_destroy(pEntity);
	LeaderboardPost();
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
	}
}

function ReturnToMenu() {
	global.lives = 3;
	global.score = 0;
	global.inGame = false;
	global.gameOver = false;
	global.nextRound = false;
	instance_destroy(oCore);
	instance_destroy(pEntity);
	instance_activate_object(oMenu);
}

function Respawn() {
	instance_destroy(pEntity);
	instance_create_layer(room_width/2,64,"Player",oPlayer);
	RoundStart();
	global.gameOver = false;
}

function RoundStart() {
	global.nextRound = false;
	global.left = 5000;
	oCore.targetScale = 0.1;
	oCore.delay = (global.gameOver) ? 2 : 4;
}

function GotoLeaderboard() {
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