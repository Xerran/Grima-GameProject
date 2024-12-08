/// @description Draws the lighting sytem

// Establish the current X and Y for the Lighting System
light_draw_x = camera_get_view_x( view_get_camera( 0 ) )
light_draw_y = camera_get_view_y( view_get_camera( 0 ) )

// Now we draw the current Lighting System
light_draw( global.system, light_draw_x, light_draw_y, true, true, 0 )

