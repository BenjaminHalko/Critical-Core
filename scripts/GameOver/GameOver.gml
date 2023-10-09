function GameOver(_instant=false) {
	oGUI.moveTutorial = false;
	oGUI.alarm[1] = -1;
	if (!global.gameOver) {
		global.gameOver = true;
		global.nextRound = false;
		global.roundIntro = false;
		with(oBubble) {
			if (object_index == oPlayer) continue;
			BurstBubble(id);	
		}
		if (!_instant) {
			audio_play_sound(snHit, 2, false);
			ScreenShake(4,20);
			call_later(30, time_source_units_frames, function() {
				if (global.inGame) {
					PlayerExplode();
					instance_destroy(oSpike);
					RestartRound();
				}
			});
		} else {
			PlayerExplode();
			instance_destroy(oSpike);
			RestartRound();
		}
	}
}

function NextRound() {
	if (!global.gameOver) {
		global.nextRound = true;
		global.round++;
		if (global.lives < 3) {
			global.lives++;
			oGUI.displayExtraLives = true;
		} else {
			oGUI.displayExtraLives = false;
		}
		global.score += 10000;
		oCore.targetScale = getCoreStart();
		audio_play_sound(snStart, 2, false, 1, 0, 1.2);
		with(oBubble) {
			if (object_index == oPlayer) continue;
			BurstBubble(id);	
		}
		with(oPlayer) {
			mass = 500;	
		}
		instance_destroy(oSpike);
	
		call_later(90, time_source_units_frames, function() {
			if (global.inGame) {
				RoundStart();
			}
		});
	}
}

function BurstBubble(_bubble) {
	with(_bubble) {
		repeat(max(10, mass / 50)) {
			var _dir = random(360);
			var _len = random(radius * 0.8);
			with(instance_create_depth(x+lengthdir_x(_len, _dir),y+lengthdir_y(_len, _dir), depth+1, oPlayerTrail)) {
				radius = random_range(other.radius / 4, other.radius / 3);
				image_blend = c_gray;
			}
		}
		instance_destroy();
	}
}

function PlayerExplode() {
	ScreenShake(12,40);
	audio_play_sound(snExplode, 2, false);
	instance_create_depth(x,y,oPlayer.depth,oPlayerTrail);
	with(oPlayer) {
		repeat(BROWSER ? 80 : max(80, mass / 4)) {
			var _radius = max(12,radius);
			var _dir = random(360);
			var _len = random(_radius * 0.8);
			with(instance_create_depth(x+lengthdir_x(_len, _dir),y+lengthdir_y(_len, _dir),depth+1,oPlayerTrail)) {
				radius = random_range(_radius / 5, _radius / 3);
				speed = random(2);
				direction = random(360);
				image_blend = choose(c_white, #FF005E, #9400DD);
				spd = random_range(0.01,0.02);
			}
		}
		instance_destroy();
	}
}

function RestartRound() {
	call_later(60, time_source_units_frames, function() {
		if (global.inGame) {
			if (--global.lives <= 0) {
			 	GameEnd();
			} else {
				Respawn();
			}
		}
	});
}