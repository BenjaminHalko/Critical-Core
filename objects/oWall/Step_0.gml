/// @desc 

enableLive;

beatPulse = ApproachFade(beatPulse, 0, 0.05, 0.7);
colorPulse = ApproachFade(colorPulse, 0, 0.02, 0.7);
image_blend = merge_color(c_white, oMusicController.wallPulseColor, colorPulse);