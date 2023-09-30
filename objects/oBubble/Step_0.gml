/// @desc Merge Bubbles

enableLive;

// Inherit the parent event
event_inherited();

if (!absorbing) {
	var _bubble = instance_place(x,y,oBubble);
	if (_bubble != noone) {
		if (allowMerge and _bubble.allowMerge) {
			if (object_index == oPlayer and !_bubble.absorbing) {
				_bubble.absorbing = true;
				_bubble.absorbAmount = round(_bubble.mass*2);	
			}
				
			if (_bubble.object_index == oPlayer) {
				absorbing = true;
				absorbAmount = round(mass*2);
			} else {
				// Calculate the distance between the centers of the two bubbles
				var distance = point_distance(x, y, _bubble.x, _bubble.y);

				// Calculate the overlap (the sum of the radii minus the distance)
				var overlap = (2 * sqr(mass) + 2 * sqr(_bubble.mass)) - distance;

				// Check if there is any overlap
				if (overlap > 0) {
						
					// Calculate the absorption amount
					var _absorption = min(overlap, mass, _bubble.mass); // Absorb at most the mass of the absorbing bubble

					// Calculate the ratio of absorption for each bubble
					var _absorptionRatio = _absorption / mass;
					var _otherAbsorptionRatio = _absorption / _bubble.mass;
		
					// Calculate the one to absorb
					_absorption *= (object_index == oPlayer or (mass >= _bubble.mass and _bubble.object_index != oPlayer)) ? 1 : -1;

					// Update mass
					mass += _absorption;
					_bubble.mass -= _absorption;

					// Update speed
					if (object_index != oPlayer) {
						xSpd = lerp(xSpd, _bubble.xSpd, _absorptionRatio / 2);
						ySpd = lerp(ySpd, _bubble.ySpd, _absorptionRatio / 2);
					}
							
					_bubble.xSpd = lerp(_bubble.xSpd, xSpd, _otherAbsorptionRatio / 2);
					_bubble.ySpd = lerp(_bubble.ySpd, ySpd, _otherAbsorptionRatio / 2);			
						
					if (mass < 1) instance_destroy();
					if (_bubble.mass < 1) {
						if (_bubble.absorbing and object_index == oPlayer) {
							global.score += _bubble.absorbAmount;
							with(instance_create_layer(oPlayer.x,oPlayer.y-oPlayer.radius-1,"GUI",oScore)) {
								amount = round(_bubble.absorbAmount);	
							}
						}
						instance_destroy(_bubble);
					}
				}
			}
		}
	} else {
		allowMerge = true;
	}
}

if (absorbing) {
	var _dir = point_direction(x,y,oPlayer.x,oPlayer.y);
	xSpd = lengthdir_x(0.2, _dir);
	ySpd = lengthdir_y(0.2, _dir);
}

// Set Radius
radius = ApproachFade(radius, sqrt(mass / pi), 1, 0.7);
image_xscale = radius / 4;
image_yscale = radius / 4;

if (mass < 1) {
	instance_destroy();	
}