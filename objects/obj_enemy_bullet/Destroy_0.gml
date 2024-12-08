/// @description Creates an obj_enemy_bullet_hit instance

speed = 0

instance_create_layer(x, y, "Bullets", obj_enemy_bullet_hit)

// Destroy Light
light_delete( my_light )
