/// @description Assigns text and health

// The text to display
text = "Hold E to Search"

// The time it takes to fully search the Searchable instance
search_max = 100

// The search time a Player has already spent searching this instance
curr_search_time = 0

// Sets the text_exists variable of obj_game to true, so that no other Text objects can exist
obj_game.text_exists = true

// Sets the Searchable, Brazier, or Window instance for this particular Text instance
my_instance = noone

// Is this attached to "Searchable" instance, or to a Brazier?
is_brazier_text = false

// Is this attached to a Window?
is_window_text = false

// Is this attached to an Altar?
is_altar_text = false

// Is this a refill text?
is_refill = false

// Is this a response text? Only existing because the Player has already searched the Searchable?
response_text = false
