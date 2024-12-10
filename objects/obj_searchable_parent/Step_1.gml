/// @description Figures out if the Player is nearby, activating/deactivating visuals

// First we must determine if the Player is currently nearby
var _player_distance = point_distance( x, y, obj_player.x, obj_player.y )

// If Player is close enough to search the Searchable, then we generate some text
if ( _player_distance < search_distance ) {
		
	player_nearby = true
	
	// If no other Text is in existence at the moment, then we can create our Text instance
	if ( !text_created && !obj_game.text_exists && !searched ) {
		
		my_text = instance_create_layer(x, y - 8, "Text", obj_text)
		text_created = true
		
		// Sets this Searchable as belonging to the Text instance
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


// Depending on the Player's current Y, we will either appear in front of or behind the
// Player sprite

// If the Player is above this Instance, then it should appear to be in front of the Player
if ( obj_player.y < y ) {
	
	depth = obj_player.depth - 1
	
// Otherwise, the Player should appear to be in front of this instance
} else {
	
	depth = obj_player.depth + 3
	
}

