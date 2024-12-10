/// @description Governs all Game Behaviors

// If all 5 Braziers are lit, then the North Hallway is no longer counted as being dark,
// with its Candelabras lighting up to signify as much (this debuffs enemies that
// enter through the North window by making them move at walk speed rather than immediately
// at sprint speed)

// Firs we ensure that the North Hallway has been set
if ( north_hallway != noone ) {
	
	if ( lit == 5 ) {
	
		north_hallway.is_dark = false
	
	// However, if even one Brazier is destroyed or unlit, the North Hallway is made dark
	} else {
	
		north_hallway.is_dark = false
	
	}
	
} 
