/// @description Allows for drawing of Global Motion Planning Grid

// Draws the Motion-Planning Grid for debugging purposes
if ( keyboard_check(vk_alt) ) {
	mp_grid_draw(global.mp_grid)
}
