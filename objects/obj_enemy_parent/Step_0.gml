/// @description Insert description here
// You can write your code in this editor

// Retrieves and stores distance to Player every step
var _distance_to_player = distance_to_object(obj_player)

// Can Enemy start Hunting the Player? Are is Enemy already Hunting the Player and has just attacked?
if (( _distance_to_player <= hunt_distance or hunting ) && _distance_to_player > attack_distance ) {
	
	// Ensure Enemy is now Hunting, if wasn't already
	hunting = true
	
	// Should we go ahead and calculate the path to the Player?
	if ( path_timer-- <= 0 ) {
		// Reset our timer first, this time to the delay
		path_timer = path_delay
	
		// Can we make a path to the Player?
		var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, choose(0, 1))

		// Start path if the Player is reachable
		if (_found_player) {
			path_start(path, move_speed, path_action_stop, false)
		}
	}
} else {
	// Is Enemy close enough to attack?
	if ( _distance_to_player <= attack_distance ) {
		path_end()
	}
}
