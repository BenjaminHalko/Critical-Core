/// @desc 

if (global.gameOver) exit;

// Inherit the parent event
event_inherited();

// Movement
Input();
xSpd = ApproachFade(xSpd, (keyRight - keyLeft) * 2, 1, 0.7);
ySpd = ApproachFade(ySpd, (keyDown - keyUp) * 2, 1, 0.7);

if (keyLeft or keyRight or keyUp or keyDown) {
	oCore.playerHasMoved = true;
	oGUI.moveTutorial = false;
	oGUI.alarm[1] = -1;
}

if (!global.nextRound and !global.roundIntro and oCore.playerHasMoved) {
	var _dist = point_distance(0,0,xSpd,ySpd) / 3;
	mass -= _dist + mass / 200;
	
	if (radius < 1) {
		GameOver(true);
	}
}

// Fade Values
pulse = ApproachFade(pulse, 0, 0.05, 0.7);
image_blend = merge_color(#FF005E, #9400DD, pulse);

// Trail
if (irandom(2 + BROWSER * 2) == 0) {
	var _dir = random(360);
	var _len = random(radius * 0.55);
	with(instance_create_depth(x+lengthdir_x(_len, _dir), y+lengthdir_y(_len,_dir), depth+1, oPlayerTrail)) {
		radius = other.radius / 3;
	}
}