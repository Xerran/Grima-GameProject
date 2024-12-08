/// @description Initializes the Motion Planning Grid of the "Game" Room

// We first check to see if the current Room is "Game" or not, that way
// we don't create a MP Grid if we don't need it
if ( room_get_name(room) == room_get_name(rm_game) ) {
	// Sets the "Grid Size" of the room
	#macro GS		32 

	// Number of tiles in the room (Room dimension / 32)
	var _width = ceil(room_width / GS)
	var _height = ceil(room_height / GS)

	// Now we create the Motion Planning Grid
	global.mp_grid = mp_grid_create(0, 0, _width, _height, GS, GS)

	// We need to add solid instances to Grid to allow for collisions
	mp_grid_add_instances(global.mp_grid, obj_solid, true)
	
	
}