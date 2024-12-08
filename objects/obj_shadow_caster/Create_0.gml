/// @description Sets object as a Shadow Caster in Lighting System

// Establish object as a Shadow Caster upon creation
caster = light_caster_create( global.system )
light_caster_set_scale( caster, image_xscale, image_yscale )
light_caster_set_rotation( caster, image_angle )
light_caster_set_position( caster, x, y )