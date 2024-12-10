/// @description Determines Blocked and Unblocked behaviors

// First we must determine if the Player is currently nearby
var _player_distance = point_distance( x, y, obj_player.x, obj_player.y )

// If Player is close enough to search the Searchable, then we generate some text
if ( _player_distance < min_distance ) {
		
	player_nearby = true
	
	// If we haven't yet created the Text, and the Player actually has Blessed Wood, 
	// then we create the Text
		if ( !text_created && obj_player.blessed_wood > 0 && !is_blocked ) {
		
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
