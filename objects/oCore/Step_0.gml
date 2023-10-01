/// @desc 

enableLive;

if (!global.gameOver and !global.nextRound and global.audioTick and global.audioBeat % 1 == 0 and !global.roundIntro and playerHasMoved) {
	shootDir += 20 * (flipShootDir ? -1 : 1);
	coreShoot();
}

pulse = Approach(pulse,0,0.1);
scale = ApproachFade(scale,(targetScale * 208 + pulse * 10) / 208,1,0.7);
image_xscale = scale;
image_yscale = scale;
for(var i = 0; i < array_length(walls); i++) {
	with(walls[i].instance) {
		image_xscale = other.walls[i].scale * other.scale;
		x = lerp(xstart, other.walls[i].x, other.scale);
		y = lerp(ystart, other.walls[i].y, other.scale);
	}
}