/// @description When this Instance is Destroyed, create an obj_enemy_poof

instance_create_layer( x, y, "Enemies", obj_enemy_poof)

// There's also a chance they will create a Health Pickup
// Zombies have a lower chance, while Cultists have a higher chance
switch ( enemy_id ) {
	
	// In case Zombie
	case 1:
		
		// 20% chance
		if ( irandom( 4 ) == 0 ) {
			
			instance_create_layer( x, y, "Bullets", obj_health_pickup )
			
		}
		
	break;
	
	// In case Cultist
	case 2:
		
		// 50% chance
		if ( irandom( 1 ) == 0 ) {
			
			instance_create_layer( x, y, "Bullets", obj_health_pickup )
			
		}
		
	break;
	
}
