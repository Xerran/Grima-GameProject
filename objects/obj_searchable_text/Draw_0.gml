/// @description Draws Text and "Healthbar" to represent Player searching

draw_set_font(fnt_searchable)

draw_text(x - 32, y - 16, text)

draw_healthbar(x - 32, y - 1, x + 32, y + 1, health_max, c_black, c_white, c_white, 0, false, false)

