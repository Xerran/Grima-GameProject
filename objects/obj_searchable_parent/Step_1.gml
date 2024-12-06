/// @description Figures out if the Player is nearby, activating/deactivating visuals

// First we must determine if the Player is currently nearby
var _player_distance = point_distance(x, y, obj_player.x, obj_player.y)

// If Player is close enough to search the Searchable, then we generate some text
if (_player_distance < (sprite_height / 2) + 16) {
		
	player_nearby = true
	
	if ( !text_created && !obj_game.text_exists && !searched ) {
		my_text = instance_create_layer(x, y - 8, "Enemies", obj_searchable_text)
		text_created = true
		
		// Sets this Searchable as belonging to the Text instance
		my_text.my_searchable = self
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

	

