/// @description Allows for Collisions with "Solid" objects (like walls)

// First we set our target values
var _target_x = x
var _target_y = y

// Now we get the last step position of the Player, out of the collision
x = xprevious
y = yprevious

// We need to get the distance that we want the Player to *actually* move
var _distance_x = abs(_target_x - x)
var _distance_y = abs(_target_y - y)

/// We now move the Player as far as they can before hitting the solid
repeat (_distance_x) {
	
	if ( !place_meeting(x + sign(_target_x - x), y, obj_solid) ) {
		
		x += sign( _target_x - x )
		
	}
	
}

repeat (_distance_y) {
	
	if ( !place_meeting(x, y + sign(_target_y - y), obj_solid) ) {
		
		y += sign( _target_y - y )
		
	}
	
}