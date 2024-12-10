/// @description Initializes Variables upon Instance creation

// Text to be displayed by this particular Searchable object
my_text = noone

// Have we already created Text that is displaying?
text_created = false

// What is our Search Distance for when the Player approaches?
search_distance = 0

// Sets the Search Distance depending on how tall the Sprite is
// For taller Searchables
if ( ( sprite_height / 2 ) > 16 ) {
	
	search_distance = sprite_height / 2
	
// For shorter Searchables
} else {
	
	search_distance = ( sprite_height / 2 ) + 16
	
}

// When we create this Instance, we have to decide if this is an empty Searchable,
// or if it will contain a Blessed Wood or Bullet Refill
contains = irandom( 2 )

// In concert with the variables held by obj_game, we will now determine what Item
// this Searchable has. There can only be a limited number of Empty, Bullet_Pickup,
// and Blessed Wood-containing Searchables at any time for the sake of game balance,
// but this will allow us to randomly decide what Items go where.

// Using our random integer as the basis for our Switch
switch ( contains ) {
	
	// Our first case is if the Searchable is Empty
	case 0:
	
		// This is simple enough, we simply check if we can have any more empty Searchables, 
		// then assign no item (noone) if we still can
		if ( obj_game.empty_containers > 0 ) {
			
			item = noone
			
			// Of course, we also decrease the number of empty Searchables allowed
			obj_game.empty_containers--
			
		// Otherwise, we put an actual Item into this Searchable depending on what is left.
		// Let's start with Bullets
		} else if ( obj_game.bullet_containers > 0 ) {
			
			item = obj_bullet_pickup
			
			// Of course, we also decrease the number of available spots to put Bullets
			obj_game.bullet_containers--
			
		// Looks like we're all out of available Bullet containers, so we fill this one
		// with Blessed Wood
		} else {
			
			item = obj_blessed_wood
			
			// Of course, we also decrease the number of available spots to put Blessed Wood
			obj_game.wood_containers--
			
		}
	
	break;
	
	// Our second case is if the Searchable contains Bullets
	case 1:
	
		// This is simple enough, we simply check if we can have any more Searchables with Bullets, 
		// then assign the Bullet_Pickup item if we can
		if ( obj_game.bullet_containers > 0 ) {
			
			item = obj_bullet_pickup
			
			// Of course, we also decrease the number of available spots to put Bullets
			obj_game.bullet_containers--
			
		// Otherwise, let's put a Blessed Wood into this container if we can
		} else if ( obj_game.wood_containers > 0 ) {
			
			item = obj_blessed_wood
			
			// Of course, we also decrease the number of available spots to put Blessed Wood
			obj_game.wood_containers--
			
		// Looks like we're all out of items - that means this Instance is empty
		} else {
			
			item = noone
			
			// Of course, we also decrease the number of empty Searchables allowed
			obj_game.empty_containers--
			
		}
		
	
	break;
	
	// Our third case is if the Searchable contains Blessed Wood
	case 2:
	
		// This is simple enough, we simply check if we can have any more Searchables with Blessed 
		// Wood, then assign the Blessed Wood item if we can
		if ( obj_game.wood_containers > 0 ) {
			
			item = obj_blessed_wood
			
			// Of course, we also decrease the number of available spots to put Blessed Wood
			obj_game.wood_containers--
			
		// Otherwise, let's put a Bullet_Pickup item into this container if we can
		} else if ( obj_game.bullet_containers > 0 ) {
			
			item = obj_bullet_pickup
			
			// Of course, we also decrease the number of available spots to put Bullets
			obj_game.bullet_containers--
			
		// Looks like we're all out of items - that means this Instance is empty
		} else {
			
			item = noone
			
			// Of course, we also decrease the number of empty Searchables allowed
			obj_game.empty_containers--
			
		}
	
	break;
	
	
}