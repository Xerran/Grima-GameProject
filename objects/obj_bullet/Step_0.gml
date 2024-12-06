/// @description Tracks Bullet movement to enforce Range

// Keeps track of distance traveled
var _distance_traveled = point_distance(xstart, ystart, x, y)

// If distance traveled goes over range, then destroys bullet
if (_distance_traveled > range) {
	instance_destroy()
}
