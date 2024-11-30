/// @description Determines Enemy behavior 

// Retrieves and stores distance to Player every step
var _distance_to_player = distance_to_object( obj_player )

// Determines what behavior this Enemy instance should pursue every single step
switch ( state ) {
	// If the Enemy is currently in the Idle state
	case STATES.IDLE:
		// Change to Idle Sprite
		sprite_index = spr_idle
		
		// Can Enemy start Hunting the Player? Are we already Hunting the Player?
		if ( _distance_to_player <= hunt_distance or hunting ) {
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
		// Change to Move Sprite if not currently Hurt
		sprite_index = spr_walk
		
		
		// Update current Facing Direction
		var _dir = sign( x - x_prev )
	
		if ( _dir != 0 ) {
			image_xscale = ( _dir * 2 )
		}
		// Update current Position
		x_prev = x
		y_prev = y
	
		// We begin by establishing if the Player is currently within Hunting distance, or if we are
		// already Hunting the Player
		if ( _distance_to_player <= hunt_distance or hunting) {
			hunting = true
			curr_goal_distance = _distance_to_player
			my_brazier = noone
		}
		
		// After this, we run through if the Enemy is Hunting the Player, or is moving towards a Brazier
		// First we run through the Hunting a Player options
		if ( hunting ) {
			// Is the Player currently still within Hunting distance, and also too far to Attack?
			if ( curr_goal_distance > attack_distance ) {
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
			// Is Enemy close enough to attack?
			} else {
				path_end()
				state = STATES.ATTACK
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
	// If the Enemy is currently in the Hurt state
	case STATES.HURT:
		// Change to Hurt Sprite
		sprite_index = spr_hurt

		// Apply the Knockback
		x += hsp
		y += vsp

		// Apply drag over time
		hsp *= 0.91
		vsp *= 0.91

		// To help simplify Knockback, once hsp and vsp have been reduced sufficiently, allow them to be reduced
		// to 0
		if ( abs( hsp ) < 0.1 ) {
			hsp = 0
		}

		if ( abs( vsp ) < 0.1 ) {
			vsp = 0
		}
		
		if ( hurt_timer-- <= 0 ) {
			state = STATES.MOVE
		}

	break;
	// If the Enemy is currently in the Attack state
	case STATES.ATTACK:
		// Change to Attack Sprite
		sprite_index = spr_attack
		
		// We first have to figure out if we can actually Attack the Player
		if ( image_index >= attack_frame and can_attack ) {
			// We reset for the next Attack
			can_attack = false
			alarm[0] = attack_delay
			
			// Get the Attack direction
			attack_dir = point_direction(x, y, obj_player.x, obj_player.y )
			
			// Get the Attack velocity components
			a_velx += lengthdir_x( attack_distance, attack_dir )
			a_vely += lengthdir_y( attack_distance, attack_dir )
			
			// Now, depending on Enemy Type, we will pursue one of two Attack behaviors
			
			// Zombies will approach the Player, and attempt to punch them, creating a wave and moving
			// towards the Player a little bit
			if ( enemy_id == 1 ) {
				
				// Set the Zombie to be dangerous to touch
				is_hazard = true
				
				// Create an obj_enemy_wave for some visual flair
				my_wave = instance_create_layer( x , y, "Bullets", obj_enemy_wave )
				my_wave.image_alpha = 0
				
				// While we are attacking, hold the Attack frame for a set time
				attack_timer = attack_hold
			}
		} else if ( attack_timer-- > 0 ) {
			if ( enemy_id == 1 ) {
				
				// Sets Sprite to correct image index
				image_index = attack_frame
				image_xscale = sign( a_velx) * 2
				
				// Gradually increases image_alpha of my_wave
				my_wave.image_alpha += 0.05
				
				// Apply the attack velocity
				x += a_velx 
				y += a_vely 

				// Apply drag over time
				a_velx *= 0.9
				a_vely *= 0.9

				// To help simplify attack velocity, once a_velx and a_vely have been reduced sufficiently, 
				// allow them to be reduced to 0
				if ( abs( a_velx ) < 0.1 ) {
					a_velx = 0
				}

				if ( abs( a_vely ) < 0.1 ) {
					a_vely = 0
				}
			}
		} else if ( attack_timer-- <= 0 ) {
			if ( enemy_id == 1 ) {
				// Set is_hazard to false, meaning Enemy is no longer hazardous
				is_hazard = false
				
				// Destroy the obj_enemy_wave we created
				instance_destroy(my_wave)
				
				// Make sure attack velocity components are reset to 0
				a_velx = 0
				a_vely = 0
				
				// Allow rest of Attack animation to play
				attack_done = true
			}
		}
	break;
	// If the Enemy runs out of health, they are immediately placed in the Dead state
	case STATES.DEAD:
		// Change to Die Sprite
		sprite_index = spr_die
		// Other functions are performed by Collision events, this is purely for the Sprite change
	break;
}