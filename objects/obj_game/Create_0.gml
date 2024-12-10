// Initializes all Game variables

// Initialize the Global Movement Planning Grid for Enemies
global.mp_grid = 0

// These two help to ensure that all of the Blessed Wood and Bullets are
// placed randomly in the available containers


// If an obj_searchable_text instance has been created, prevents the creation of any other instances
text_exists = false

// How many Braziers are still in existence?
braziers = 5

// How many Braziers are currently lit?
lit = 0

// Which room is the North Hallway?
north_hallway = noone

// Initial values for wood_containers, bullet_containers, and empty_containers
wood_containers = 20
bullet_containers = 15
empty_containers = total_containers - ( wood_containers + bullet_containers )

