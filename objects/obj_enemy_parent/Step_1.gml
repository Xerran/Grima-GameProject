/// @description Helps to place Sprite in front of/behind nearby Searchables

// If the Player is above this Instance, then it should appear to be in front of the Player
if ( obj_player.y < y ) {
	
	depth = obj_player.depth - 1
	
// Otherwise, the Player should appear to be in front of this Instance
} else {
	
	depth = obj_player.depth + 2
	
}

// If the Enemy is close to any Searchables or Braziers, we should avoid them looking
// like they are unnecessarily in front of/behind any
var _nearest_searchable = instance_nearest( x, y, obj_searchable_parent )
var _nearest_brazier = instance_nearest( x, y, obj_brazier )

// If we're very close to a Searchable, then let's place ourselves in accordance with it
if ( distance_to_object( _nearest_searchable ) < 32 ) {
	
	// If we're below the Searchable, then we should appear in front of it
	if ( _nearest_searchable.y < y ) {
	
		depth = _nearest_searchable.depth + 1
	
	// Otherwise, we should appear behind it
	} else {
	
		depth = _nearest_searchable.depth - 1
	
	}
	
}

// Searchables take Priority, but we should also accomodate Braziers
if ( distance_to_object( _nearest_brazier ) < 64 ) {
	
	// If we're below the Brazier, then we should appear in front of it
	if ( _nearest_brazier.y < y ) {
	
		depth = _nearest_brazier.depth + 1
	
	// Otherwise, we should appear behind it
	} else {
	
		depth = _nearest_brazier.depth - 1
	
	}
	
}


