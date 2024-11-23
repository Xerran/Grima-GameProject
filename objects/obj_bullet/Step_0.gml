/// @description Tracks Bullet movement to enforce Range

var _distance_traveled = point_distance(xstart, ystart, x, y)

if (_distance_traveled > range) {
	instance_destroy()
}
