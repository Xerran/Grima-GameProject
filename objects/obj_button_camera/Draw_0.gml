/// @description Only Draws if the Overlay is Showing

if ( obj_grima_controller.show_overlay ) {
	
	depth = obj_grima_controller.depth - 1
	
	draw_self()

	draw_set_font(fnt_searchable)

	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)

	draw_text(x, y, btn_txt)

	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
}
