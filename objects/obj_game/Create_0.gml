// Initializes all Game variables

// Initialize the Global Movement Planning Grid for Enemies
global.mp_grid = 0

// These two help to ensure that all of the Blessed Wood and Bullets are
// placed randomly in the available containers
wood_placement_delay = irandom(5)

bullet_placement_delay = irandom(4)

// If an obj_searchable_text instance has been created, prevents the creation of any other instances
text_exists = false