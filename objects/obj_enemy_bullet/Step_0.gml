/// @description Slowly follows player, destroying self if goes out of range

// Once bullet's wait time has elapsed, follows after Player
if ( wait_time-- <= 0) {
	// Keeps track of distance traveled
	distance_traveled += 3

	// If distance traveled goes over range, then destroys bullet
	if (distance_traveled > range) {
		instance_destroy()
	
	// Otherwise, slowly tracks/follows player
	} else {
		direction = point_direction( x, y, target_id.x, target_id.y )
		speed = 3
	}
	
// If time is not up, Bullet moves towards assigned waiting point
} else {
	if ( x != wait_point_x or y != wait_point_y ) {
		direction = point_direction( x, y, wait_point_x, wait_point_y )
		speed = 1
	} else {
		speed = 0
	}
}