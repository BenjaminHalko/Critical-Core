/// @desc Merge Bubbles

enableLive;

if (global.gameOver) exit;

// Inherit the parent event
event_inherited();

function absorb() {
	global.score += absorbAmount;
	global.left -= absorbAmount;
	if global.left <= 0 {
		global.left = 0;
		NextRound();
	}
	with(instance_create_layer(absorber.x,absorber.y-absorber.radius-1,"GUI",oScore)) {
		amount = round(other.absorbAmount);	
	}
	absorber.pulse = 1;
	absorber.mass += mass;	
}

if (!instance_exists(absorber)) {
	var _bubble = instance_place(x,y,oBubble);
	if (_bubble != noone) {
		if (allowMerge and _bubble.allowMerge) {
			if (object_index == oPlayer and !instance_exists(_bubble.absorber)) {
				_bubble.absorber = id;
				_bubble.absorbAmount = round(_bubble.mass*2);	
			}
				
			if (_bubble.object_index == oPlayer) {
				absorber = _bubble;
				absorbAmount = round(mass*2);
			} else {
				// Calculate the distance between the centers of the two bubbles
				var distance = point_distance(x, y, _bubble.x, _bubble.y);

				// Calculate the overlap (the sum of the radii minus the distance)
				var overlap = (sqrt(mass / pi) + sqrt(_bubble.mass / pi)) - distance;

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
						
						_bubble.xSpd = lerp(_bubble.xSpd, xSpd, _otherAbsorptionRatio / 2);
						_bubble.ySpd = lerp(_bubble.ySpd, ySpd, _otherAbsorptionRatio / 2);
					}
							
								
						
					if (mass < 1) instance_destroy();
					if (_bubble.mass < 1) {
						if (_bubble.absorber != noone and object_index == oPlayer) {
							with(_bubble) {
								absorb();	
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
} else {
	var _dist = point_distance(x,y,absorber.x,absorber.y);
	var _dir = point_direction(x,y,absorber.x,absorber.y);
	xSpd = lengthdir_x(5, _dir);
	ySpd = lengthdir_y(5, _dir);
	
	if _dist < 5 {
		absorb();
		instance_destroy();
	}
}

// Set Radius
radius = ApproachFade(radius, sqrt(mass / pi), 1, 0.7);
image_xscale = radius / 8;
image_yscale = radius / 8;

if (object_index != oPlayer and mass < 1) {
	instance_destroy();	
}