/// @description Sets the Player as being nearby, thus allowing this Instance to be Searched

player_nearby = true

if ( !text_created ) {
	my_text = instance_create_layer(x, y - 8, "Enemies", obj_searchable_text)
}
