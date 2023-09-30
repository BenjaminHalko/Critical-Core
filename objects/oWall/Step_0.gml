/// @desc 

enableLive;

touchPulse = ApproachFade(touchPulse, 0, 0.05, 0.7);
beatPulse = ApproachFade(beatPulse, 0, 0.05, 0.7);
image_blend = merge_color(c_white, beatColor, beatPulse);