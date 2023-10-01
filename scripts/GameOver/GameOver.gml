function GameOver(_instant=false) {
	global.gameOver = true;
	global.nextRound = false;
	with(oBubble) {
		if (object_index == oPlayer) continue;
		BurstBubble(id);	
	}
	if (!_instant) {
		ScreenShake(1,30);
		call_later(30, time_source_units_frames, function() {
			PlayerExplode();
			instance_destroy(oSpike);
			RestartRound();
		});
	} else {
		PlayerExplode();
		instance_destroy(oSpike);
		RestartRound();
	}
}

function NextRound() {
	global.nextRound = true;
	with(oBubble) {
		if (object_index == oPlayer) continue;
		BurstBubble(id);	
	}
	instance_destroy(oSpike);
}

function BurstBubble(_bubble) {
	repeat(max(10, _bubble.mass / 50)) {
		var _dir = random(360);
		var _len = random(_bubble.radius * 0.8);
		with(instance_create_depth(_bubble.x+lengthdir_x(_len, _dir),_bubble.y+lengthdir_y(_len, _dir), _bubble.depth+1, oPlayerTrail)) {
			radius = random_range(_bubble.radius / 4, _bubble.radius / 3);
			image_blend = c_gray;
		}
	}
	instance_destroy(_bubble);
}

function PlayerExplode() {
	ScreenShake(20,30);
	with(oPlayer) {
		repeat(max(20, mass / 4)) {
			var _radius = max(8,radius);
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
		if (--global.lives <= 0) {
		 	GameEnd();
		} else {
			Respawn();
		}
	});
}