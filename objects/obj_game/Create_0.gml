//

rollback_define_player(obj_player, "Instances");

if (!rollback_join_game()) {
	rollback_create_game(5, true);
}