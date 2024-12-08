/// @description Initialize the Lighting System

// Set the seed to a random value
randomize()

// We initialize the width and length of the lighting system, which is equal to the camera
// width and length
lighting_width = camera_get_view_width( view_get_camera( 0 ) )
lighting_height = camera_get_view_height( view_get_camera( 0 ) )
lighting_color = make_color_hsv( 0, 0, 0.075 * 255 )

// Here, we create the lighting system
global.system = light_init( lighting_width, lighting_height, 1024, lighting_color, 1, -1, noone )

// Used for drawing the current Lighting System
light_draw_x = 0
light_draw_y = 0
