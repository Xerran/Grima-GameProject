/// @description Determines Enemy behavior 

// Retrieves and stores distance to Player every step
var _distance_to_player = distance_to_object( obj_player )

// Determines what behavior this Enemy instance should pursue every single step
switch ( state ) {
	// If the Enemy is currently in the Idle state
	case STATES.IDLE:
		// Change to Idle Sprite
		sprite_index = spr_idle
		
		// Can Enemy start Hunting the Player?
		if ( _distance_to_player <= hunt_distance ) {
			hunting = true
			curr_goal_distance = _distance_to_player
			state = STATES.MOVE
		}
		
		// If we cannot find the Player, then we should find a Brazier to destroy
		if ( !hunting ) {
			curr_goal_distance = distance_to_object( obj_brazier )
			my_brazier = instance_nearest( x, y, obj_brazier )
			state = STATES.MOVE
		}
		
	break;
	// If the Enemy is currently in the Move state
	case STATES.MOVE:
		// Change to Move Sprite
		sprite_index = spr_walk
		
		// Update current Facing Direction
		var _dir = sign( x - x_prev )
		
		if ( _dir != 0 ) {
			image_xscale = ( _dir * 2 )
		}
		
		// Update current Position
		x_prev = x
		y_prev = y
	
		// We begin by establishing if the Player is currently within Hunting distance
		if ( _distance_to_player <= hunt_distance) {
			hunting = true
			curr_goal_distance = _distance_to_player
			my_brazier = noone
		}
		
		// After this, we run through if the Enemy is Hunting the Player, or is moving towards a Brazier
		// First we run through the Hunting a Player options
		if ( hunting ) {
			// Is the Player currently still within Hunting distance, and also too far to Attack?
			if ( curr_goal_distance <= hunt_distance && curr_goal_distance > attack_distance ) {
				// Should we go ahead and recalculate the path to the Player?
				if ( path_timer-- <= 0 ) {
					// Reset our timer first, this time to the delay
					path_timer = path_delay
	
					// Can we make a path to the Player?
					var _found_player = mp_grid_path( global.mp_grid, path, x, y, obj_player.x, obj_player.y, choose( 0, 1 ) )

					// Start path if the Player is reachable
					if (_found_player) {
						path_start( path, move_speed, path_action_stop, false )
					}
				}
			} else {
				// Is Enemy close enough to attack?
				if ( curr_goal_distance <= attack_distance ) {
					path_end()
					state = STATES.ATTACK
				
				// If not, should we still be Hunting the Player?
				} else if ( curr_goal_distance <= hunting_distance ) { 
					hunting = true
				
				// If Player is far enough out of our Hunting range, then we should return to IDLE/other behaviors
				} else if ( hunting && curr_goal_distance > ( 1.5 * hunting_distance ) ) {
					hunting = false
					state = STATES.IDLE
				}
			} 
		// If we are not currently Hunting the Player, we should get on that Brazier
		} else { 
			// If the Brazier is not close enough for us to Attack, then we should move closer
			if ( curr_goal_distance > attack_distance ) {
				// Should we go ahead and recalculate the path to the Brazier?
				if ( path_timer-- <= 0 ) {
					// Reset our timer first, this time to the delay
					path_timer = path_delay
	
					// Can we make a path to the Brazier?
					var _found_brazier = mp_grid_path( global.mp_grid, path, x, y, my_brazier.x, my_brazier.y, choose( 0, 1 ) )

					// Start path if the Brazier is reachable
					if (_found_brazier) {
						path_start( path, move_speed, path_action_stop, false )
					}
				}
			// Looks like we've found our Brazier - let's Attack it!
			} else {
				path_end()
				state = STATES.ATTACK
			}
		}
	break;
	// If the Enemy is currently in the Attack state
	case STATES.ATTACK:
		// Change to Attack Sprite
		sprite_index = spr_attack
		
	break;
	// If the Enemy runs out of health, they are immediately placed in the Dead state
	case STATES.DEAD:
		// Change to Idle Sprite
		sprite_index = spr_die
		
	break;
}