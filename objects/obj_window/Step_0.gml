/// @description Determines Blocked and Unblocked behaviors

// What is the current state of the Window?
switch ( state ) {
	
	// In the case that the Window is Open, we check to see if the Player is 
	// nearby so that we can display the relevant text. Regardless of where the
	// Player is, we will spawn Enemies at set intervals (plus a randomized delay)
	// in this Window's Spawn Area
	case WINDOW.OPEN:
	
		// First we must determine if the Player is currently nearby
		player_distance = point_distance( x, y, obj_player.x, obj_player.y )

		// If Player is close enough to search the Searchable, then we generate some text
		if ( player_distance < min_distance ) {
		
			player_nearby = true
	
			// If we haven't yet created the Text, and the Player actually has Blessed Wood, 
			// then we create the Text
				if ( !text_created && obj_player.blessed_wood > 0 ) {
		
				my_text = instance_create_layer( x - 6, y - 8, "Text", obj_text )
				my_text.text = text
				my_text.is_window_text = true
				text_created = true
		
				// Sets this Window as belonging to the Text instance
				my_text.my_instance = self
			}
	
		// Otherwise, we delete the Text
		} else {
		
			player_nearby = false
	
			// Only delete the text if it actually exists
			if ( text_created ) {
		
				instance_destroy(my_text)
				text_created = false
		
			}
		}
		
		
		/*
		 * ENEMY SPAWNING SECTION
		 */
		
		// Now, regardless of if the Player is close or not, we try to Spawn some
		// Enemies - unless it is the first Hour of gameplay
		if ( spawn_rate != PREP ) {
			
			// We check to see how long it has been since our last Spawn - if it has
			// been long enough, we Spawn an Enemy!
			if ( spawn_timer-- <= 0 ) {
				
				// Let's randomly decide what kind of Enemy to spawn - 75% zombie, 25% cultist
				spawn_type = irandom( specialty_rate )
				
				// If we rolled the maximum value, then we'll go ahead and Spawn a Cultist - 
				// also if we've Spawned too many Zombies recently, we'll force a Cultist to spawn
				if ( spawn_type == specialty_rate or zombie_spawns == specialty_rate ) {
					
					instance_create_layer( my_spawn.x, my_spawn.y, "Player", obj_enemy_cultist )
					
					// Reset how many Zombies we have Spawned
					zombie_spawns = 0
					
				// Otherwise, let's spawn a Zombie
				} else {
					
					instance_create_layer( my_spawn.x, my_spawn.y, "Player", obj_enemy_zombie )
					
					// Increment how many Zombies we have Spawned
					zombie_spawns++
					
				}
				
				// Finally, let's reset our spawn_timer
				spawn_timer = spawn_rate
				
			}
			
		}
	
	break;


	// In the case that the Window is Blocked
	case WINDOW.BLOCKED:
		
		// We try at set intervals to attack this Window and destroy the barricade - 
		// unless it is the first Hour of gameplay
		if ( engagement_timer != PREP ) {
			
			// First let's check how long it has been since an attempt has been made to Engage
			// this Window
			if ( curr_engagement_timer-- <= 0 ) {
				
				// Engagement success is randomly determined, so let's see if this Window
				// is now Engaged or not
				var _is_engaged = irandom( success_rate )
				
				// Engagement was a success! We now change our state and reset the timer
				if ( _is_engaged == 0 ) {
					
					state = WINDOW.ENGAGED
					
					curr_engagement_timer = engagement_timer
					
					// Let's also play a random Zombie sound to signal the success
					switch ( irandom( 2 ) ) {
						
						// Play Zombie Sound 1
						case 0:
							
							// We only want nearby Players to hear this
							audio_play_sound_at( snd_zombie1, x, y, 0, 100, 320, 1, false, 1, 0.5 )
							
						break;
						
						// Play Zombie Sound 2
						case 1:
							
							// We only want nearby Players to hear this
							audio_play_sound_at( snd_zombie2, x, y, 0, 100, 320, 1, false, 1, 0.5 )
							
						break;
						
						// Play Zombie Sound 3
						case 2:
							
							// We only want nearby Players to hear this
							audio_play_sound_at( snd_zombie3, x, y, 0, 100, 320, 1, false, 1, 0.5 )
							
						break;
						
					}
					
				// If Engagement was a failure, we reset the timer
				} else {
					
					curr_engagement_timer = engagement_timer
					
					// Let's also reset the Spawn Timer
					spawn_timer = spawn_rate
					
				}
				
			}
			
		}
		
	break;
	
	
	// In the case that the Window is Engaged
	case WINDOW.ENGAGED:
		
		// First let's check how long it has been since this Window has been Damaged
		if ( damaged_timer-- <= 0 ) {
			
			// Now we Damage the Window
			curr_hp -= damage
			
			// Let's also play a sound to signal that the Window is being Damaged
			switch( irandom( 1 ) ) {
				
				// Window Damage Sound 1
				case 0:
				
					// We only want nearby Players to hear this
					audio_play_sound_at( snd_window_damage1, x, y, 0, 100, 320, 1, false, 1)
				
				break;
				
				// Window Damage Sound 2
				case 1:
				
					// We only want nearby Players to hear this
					audio_play_sound_at( snd_window_damage2, x, y, 0, 100, 320, 1, false, 1)
				
				break;
				
			}
			
			// After that, we determine if the Window still has HP or not
			// If it does, we reset the damage timer
			if ( curr_hp > 0 ) {
				
				damaged_timer = damage_rate
				
			// If the HP is below 0, this Window returns to the Open state, and
			// an Enemy spawns
			} else {
				
				// Return to the Open state
				state = WINDOW.OPEN
				
				// Let's randomly decide what kind of Enemy to spawn - 75% zombie, 25% cultist
				spawn_type = irandom( specialty_rate )
				
				// If we rolled the maximum value, then we'll go ahead and Spawn a Cultist - 
				// also if we've Spawned too many Zombies recently, we'll force a Cultist to spawn
				if ( spawn_type == specialty_rate or zombie_spawns == specialty_rate ) {
					
					instance_create_layer( my_spawn.x, my_spawn.y, "Player", obj_enemy_cultist )
					
					// Reset how many Zombies we have Spawned
					zombie_spawns = 0
					
				// Otherwise, let's spawn a Zombie
				} else {
					
					instance_create_layer( my_spawn.x, my_spawn.y, "Player", obj_enemy_zombie )
					
					// Increment how many Zombies we have Spawned
					zombie_spawns++
					
				}
			
			}
			
		}
		
	break;
	
	
	// In the case that the Window is Trapped
	case WINDOW.TRAPPED:
		
		// First we must determine if the Player is currently nearby
		player_distance = point_distance( x, y, obj_player.x, obj_player.y )

		// If Player is close enough to search the Searchable, then we generate some text
		if ( player_distance < min_distance ) {
		
			player_nearby = true
	
			// If we haven't yet created the Text, and the Player actually has Blessed Wood, 
			// then we create the Text
				if ( !text_created && obj_player.blessed_wood > 0 ) {
		
				my_text = instance_create_layer( x - 6, y - 8, "Text", obj_text )
				my_text.text = text
				my_text.is_window_text = true
				text_created = true
		
				// Sets this Window as belonging to the Text instance
				my_text.my_instance = self
			}
	
		// Otherwise, we delete the Text
		} else {
		
			player_nearby = false
	
			// Only delete the text if it actually exists
			if ( text_created ) {
		
				instance_destroy(my_text)
				text_created = false
		
			}
		}
		
		
		/*
		 * ENEMY SPAWNING SECTION
		 */
		
		// Now, regardless of if the Player is close or not, we try to Spawn some
		// Enemies - unless it is the first Hour of gameplay
		if ( spawn_rate != PREP ) {
			
			// We check to see how long it has been since our last Spawn - if it has
			// been long enough, we Spawn an Enemy!
			if ( spawn_timer-- <= 0 ) {
				
				// Let's randomly decide what kind of Enemy to spawn - 75% zombie, 25% cultist
				spawn_type = irandom( specialty_rate )
				
				// If we rolled the maximum value, then we'll go ahead and Spawn a Cultist - 
				// also if we've Spawned too many Zombies recently, we'll force a Cultist to spawn
				if ( spawn_type == specialty_rate or zombie_spawns == specialty_rate ) {
					
					instance_create_layer( my_spawn.x, my_spawn.y, "Player", obj_enemy_cultist )
					
					// Reset how many Zombies we have Spawned
					zombie_spawns = 0
					
				// Otherwise, let's spawn a Zombie
				} else {
					
					instance_create_layer( my_spawn.x, my_spawn.y, "Player", obj_enemy_zombie )
					
					// Increment how many Zombies we have Spawned
					zombie_spawns++
					
				}
				
				// Finally, let's reset our spawn_timer
				spawn_timer = spawn_rate
				
			}
			
		}
		
	break;

}