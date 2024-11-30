/// @description Prevents Enemy overlap

// If an Enemy encounters another Enemy, checks to make sure that they won't overlap in the X axis
// Also ensures that an Enemy instance won't be shoved into a Solid object by this interaction
if ( !( collision_point(x - lengthdir_x( separation_dis, point_direction( x, y, other.x, other.y ) ), y, obj_solid, false, true) ) ) {
	x -= lengthdir_x( separation_dis, point_direction( x, y, other.x, other.y ) );
}

// If an Enemy encounters another Enemy, checks to make sure that they won't overlap in the Y axis
// Also ensures that an Enemy instance won't be shoved into a Solid object by this interaction
if ( !( collision_point(x, y - lengthdir_y( separation_dis, point_direction( x, y, other.x, other.y ) ), obj_solid, false, true) ) ) {
	y -= lengthdir_y( separation_dis, point_direction( x, y, other.x, other.y ) );
}

