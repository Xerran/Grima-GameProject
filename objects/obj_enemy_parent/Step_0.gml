/// @description Determines Enemy behavior 

// Retrieves and stores distance to Player every step
distance_to_player = distance_to_object( obj_player )

// Determines what behavior this Enemy instance should pursue every single step
switch ( state ) {
	// If the Enemy is currently in the Idle state
	case STATES.IDLE:
		// Change to Idle Sprite
		sprite_index = spr_idle
		
		// Can Enemy start Hunting the Player? Are we already Hunting the Player?
		if ( distance_to_player <= hunt_distance or hunting ) {
			hunting = true
			curr_goal_distance = distance_to_player
			state = STATES.MOVE
		}
		
		// If we cannot find the Player, then we should find a Brazier to destroy
		if ( !hunting ) {
			my_brazier = instance_nearest( x, y, obj_brazier )
			curr_goal_distance = distance_to_object( my_brazier )
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
		if ( distance_to_player <= hunt_distance or hunting) {
			hunting = true
			curr_goal_distance = distance_to_player
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
			} else if ( can_attack ) {
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
			} else if ( can_attack ) {
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
			state = STATES.IDLE
		}

	break;
	
	// If the Enemy is currently in the Attack state
	case STATES.ATTACK:
		// Change to Attack Sprite
		sprite_index = spr_attack
		
		// We first have to figure out if we can actually Attack the Player
		if ( image_index >= attack_frame and can_attack ) {
			
			// Depending on Enemy Type, we will pursue one of two Attack behaviors
			switch ( enemy_id ) {
				// Zombies will approach the Player/brazier, and attempt to punch them, creating a wave 
				// and swiftly moving towards the target
				case 1:
				
					// Reset for next attack
					can_attack = false
					
					// Set the Zombie to be dangerous to touch
					is_hazard = true
					
					// Get the Attack direction
					attack_dir = point_direction(x, y, obj_player.x, obj_player.y )
			
					// Get the Attack velocity components
					a_velx += lengthdir_x( attack_distance / 2, attack_dir )
					a_vely += lengthdir_y( attack_distance / 2, attack_dir )
				
					// Create an obj_enemy_wave for some visual flair
					my_wave = instance_create_layer( x , y, "Bullets", obj_enemy_wave )
					my_wave.image_alpha = 0
				
					// While we are attacking, hold the Attack frame for a set time
					attack_timer = attack_hold
					
				break;
				
				
				// Cultists will approach the Player/brazier, and will fire out 3 bullets,
				// each of which will slowly approach target
				case 2:
					
					// Reset for next attack
					can_attack = false
					
					// Figure out where Bullet spawn point is
					bullet_spawn_x = x - ( sign( image_xscale ) * 22 )
					bullet_spawn_y = y - 34
					
					/*
					 * Here, we create 3 unique Bullet instances and have them each gain a Target
					 * and a Spawn Point
					 */
					
					// Create three new Bullet instances at the center of the Cultist's staff
					my_bullet1 = instance_create_layer( bullet_spawn_x, bullet_spawn_y, "Bullets", obj_enemy_bullet )
					my_bullet2 = instance_create_layer( bullet_spawn_x, bullet_spawn_y, "Bullets", obj_enemy_bullet )
					my_bullet3 = instance_create_layer( bullet_spawn_x, bullet_spawn_y, "Bullets", obj_enemy_bullet )
					
					// Chooses target for Bullets to pursue
					if ( my_brazier == noone ) {
						
						my_bullet1.target_id = instance_nearest( x, y, obj_player )
						my_bullet2.target_id = instance_nearest( x, y, obj_player )
						my_bullet3.target_id = instance_nearest( x, y, obj_player )
						
					} else {
						
						my_bullet1.target_id = my_brazier
						my_bullet2.target_id = my_brazier
						my_bullet3.target_id = my_brazier
						
					}
					
					// Chooses wait positions for each Bullet
					my_bullet1.wait_point_x = bullet_spawn_x
					my_bullet1.wait_point_y = bullet_spawn_y - 16
					
					my_bullet2.wait_point_x = bullet_spawn_x - 16
					my_bullet2.wait_point_y = bullet_spawn_y + 16
					
					my_bullet3.wait_point_x = bullet_spawn_x + 16
					my_bullet3.wait_point_y = bullet_spawn_y + 16
					
					// While we are attacking, hold the Attack frame for a set time
					attack_timer = attack_hold
					
					
				break;
			}
			
		// If enemy is attacking, then they will hold that attack frame for as long as the
		// attack_hold variable dictates
		} else if ( attack_timer-- > 0 ) {
			switch ( enemy_id ){
				
				// In case Enemy is Zombie
				case 1:
					// Sets Sprite to correct image index
					image_index = attack_frame
					if ( a_velx != 0 ) {
						image_xscale = sign( a_velx) * 2
					}
				
					// Gradually increases image_alpha of my_wave
					my_wave.image_alpha += 0.05
				
					// While the Zombie is attacking the Player, they will dash forward, while
					// when attacking a Brazier, they will not dash forward
					if ( my_brazier == noone ) {
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
				break;
				
				// In case Enemy is Cultist
				case 2:
					// Sets Sprite to correct image index
					image_index = attack_frame
					
				break;
			}
			
		// If enemy is done attacking, then they will reset for next attack
		} else if ( attack_timer-- <= 0 ) {
			switch ( enemy_id ) {
				
				// In case Enemy is Zombie
				case 1:
					// Set is_hazard to false, meaning Enemy is no longer hazardous
					is_hazard = false
					
					// Make Zombie wait a small while until they can next attack
					alarm[0] = attack_delay
					
					// Make sure attack velocity components are reset to 0
					a_velx = 0
					a_vely = 0
					
					// Allow Enemy to finish Attack animation
					attack_done = true
					
				break;
				
				// In case Enemy is Cultist
				case 2:
					
					// Now we allow Enemy to rest and return to Move state
					
					// Make Cultist wait a small while until they can next attack
					alarm[0] = attack_delay
					
					// Allow Enemy to finish Attack animation
					attack_done = true
					
					
				break;
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