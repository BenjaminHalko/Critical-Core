function collide(_object) {
	// Calculate relative velocity
    var relativeVelX = _object.x - x;
    var relativeVelY = _object.y - y;

    // Calculate relative speed
    var relativeSpeed = point_distance(0, 0, relativeVelX, relativeVelY);

    // Normalize relative velocity
    relativeVelX /= relativeSpeed;
    relativeVelY /= relativeSpeed;

    // Calculate new velocities using the reflection formula
    var newVelX = spd * (relativeVelX - 2 * dot_product(spd, dir, relativeVelX, relativeVelY) * relativeVelX);
    var newVelY = spd * (relativeVelY - 2 * dot_product(spd, dir, relativeVelX, relativeVelY) * relativeVelY);

    // Apply the new velocities
    spd = newVelX;
    dir = point_direction(0, 0, newVelX, newVelY);

    // Apply the new velocities to _object
    _object.spd = _object.spd * (relativeVelX + 2 * dot_product(_object.spd, _object.dir, -relativeVelX, -relativeVelY) * relativeVelX);
    _object.dir = point_direction(0, 0, _object.spd * relativeVelX, _object.spd * relativeVelY);
}