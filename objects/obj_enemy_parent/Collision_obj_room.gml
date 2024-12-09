/// @description If Enemy is in a "dark" room, they speed up

// If the room we are currently touching is dark, we speed up & make the Enemy glow
if ( other.is_dark ) {
	
	move_speed = sprint_speed

	
// Otherwise, we slow down to normal pace
} else {
	
	move_speed = walk_speed
	
	
}
