function GameStart() {
	instance_create_layer(room_width/2,room_height/2,"Core",oCore);
	global.lives = 3;
	global.score = 0;
	global.inGame = true;
	Respawn();
}

function GameEnd() {
	instance_destroy(oCore);
	instance_destroy(pEntity);
	oLeaderboardAPI.draw = true;
}

function ReturnToMenu() {
	global.lives = 3;
	global.score = 0;
	global.inGame = false;
	instance_destroy(oCore);
	instance_destroy(pEntity);
	instance_activate_object(oMenu);
}

function Respawn() {
	global.gameOver = false;
	instance_destroy(pEntity);
	instance_create_layer(room_width/2,64,"Player",oPlayer);
	global.left = 5000;
	oCore.targetScale = 0.1;
	audio_resume_sound(oMusicController.music);
}