/// @description Determines Sprite depth

// Depending on the Player's current Y, we will either appear in front of or behind the
// Player sprite

// If the Player is above this Instance, then it should appear to be in front of the Player
if ( obj_player.y < y ) {
	
	depth = obj_player.depth - 1
	
// Otherwise, the Player should appear to be in front of this instance
} else {
	
	depth = obj_player.depth + 3
	
}