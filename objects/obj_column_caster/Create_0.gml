/// @description Sets object as a circular Shadow Caster in Lighting System

// Our list of points to use in the creation of this circular Shadow Caster
points_x = ds_list_create()
points_y = ds_list_create()


// Add all relevant points to the points lists

// Top right of Circle
ds_list_add( points_x, 3 )
ds_list_add( points_y, -9 )
ds_list_add( points_x, 3 )
ds_list_add( points_y, -8 )
ds_list_add( points_x, 5 )
ds_list_add( points_y, -8 )
ds_list_add( points_x, 6 )
ds_list_add( points_y, -7 )
ds_list_add( points_x, 7 )
ds_list_add( points_y, -6 )
ds_list_add( points_x, 8 )
ds_list_add( points_y, -5 )
ds_list_add( points_x, 8 )
ds_list_add( points_y, -3 )
ds_list_add( points_x, 9 )
ds_list_add( points_y, -3 )

// Bottom right of Circle
ds_list_add( points_x, 9 )
ds_list_add( points_y, 3 )
ds_list_add( points_x, 8 )
ds_list_add( points_y, 3 )
ds_list_add( points_x, 8 )
ds_list_add( points_y, 5 )
ds_list_add( points_x, 7 )
ds_list_add( points_y, 6 )
ds_list_add( points_x, 6 )
ds_list_add( points_y, 7 )
ds_list_add( points_x, 5 )
ds_list_add( points_y, 8 )
ds_list_add( points_x, 3 )
ds_list_add( points_y, 8 )
ds_list_add( points_x, 3 )
ds_list_add( points_y, 9 )

// Bottom left of circle
ds_list_add( points_x, -3 )
ds_list_add( points_y, 9 )
ds_list_add( points_x, -3 )
ds_list_add( points_y, 8 )
ds_list_add( points_x, -5 )
ds_list_add( points_y, 8 )
ds_list_add( points_x, -6 )
ds_list_add( points_y, 7 )
ds_list_add( points_x, -7 )
ds_list_add( points_y, 6 )
ds_list_add( points_x, -8 )
ds_list_add( points_y, 5 )
ds_list_add( points_x, -8 )
ds_list_add( points_y, 3 )
ds_list_add( points_x, -9 )
ds_list_add( points_y, 3 )

// Top left of Circle
ds_list_add( points_x, -9 )
ds_list_add( points_y, -3 )
ds_list_add( points_x, -8 )
ds_list_add( points_y, -3 )
ds_list_add( points_x, -8 )
ds_list_add( points_y, -5 )
ds_list_add( points_x, -7 )
ds_list_add( points_y, -6 )
ds_list_add( points_x, -6 )
ds_list_add( points_y, -7 )
ds_list_add( points_x, -5 )
ds_list_add( points_y, -8 )
ds_list_add( points_x, -3 )
ds_list_add( points_y, -8 )
ds_list_add( points_x, -3 )
ds_list_add( points_y, -9 )


// Establish object as a circular Shadow Caster upon creation
caster = light_caster_create_from_points( global.system, points_x, points_y )
light_caster_set_scale( caster, image_xscale, image_yscale )
