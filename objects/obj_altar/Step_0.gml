/// @description Determines current behaviors

// Just to make sure we have actually attached to our Room at this point
if ( my_room != noone && instance_exists( my_room ) ) {

	// If our Room is dark, then we slowly degrade progress on generating a Blessed Wood
	if ( my_room.is_dark ) {
		
		// We only perform the following if our Text object actually exists
		if ( instance_exists( my_text ) ) {
		
			// Make Text Object's text "disappear"
			my_text.text = ""
		
		
			// Slowly degrade progress until Timer is once again below 0
			if ( timer > 0 ) {
			
				my_text.curr_search_time = timer--
			
			// If it is below 0, then let's get rid of the Text object - if it exists, that is
			} else {
			
				instance_destroy( my_text )
				
				// Also reset our Text_Created value
				text_created = false
				
			}
			
		}
		
	// Otherwise, we continue to generate a Blessed Wood
	} else {
		
		// If we already generated a Blessed Wood Instance, we can't begin generating another
		if ( !generated ) {
			
			// Until Timer is above Timer Max, we simply display the Text and Healthbar
			if ( timer++ < timer_max ) {
				
				// If we haven't yet created our Text object, let's do that
				if ( !instance_exists( my_text ) or my_text == noone ) {
					
					my_text = instance_create_layer( x, y - 24, "Text", obj_text )
					my_text.is_altar_text = true
					my_text.search_max = timer_max
					text_created = true
					
				}
				
				// Set our current Text
				text = "   Generating..."
				my_text.text = text
				
				// We also set the current Search Time to our Timer
				my_text.curr_search_time = timer
				
			// Looks like our Blessed Wood is done generating - let's spawn it!
			} else {
				
				instance_create_layer( x, y + 4, "Player", obj_blessed_wood )
				generated = true
				
				timer = 0
				my_text.curr_search_time = timer
				
			}
			
		// If we've already generated a Blessed Wood, then we can't generate a new one
		} else {
			
			// Change our Text and Timer values
			text = ""
			timer = 0
			
			// Also change our Text object's values
			my_text.text = text
			my_text.curr_search_time = timer
			
		}
		
	}

}
