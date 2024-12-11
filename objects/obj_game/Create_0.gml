// Initializes all Game variables

// Initialize the Global Movement Planning Grid for Enemies
global.mp_grid = 0

// If an obj_searchable_text instance has been created, prevents the creation of any other instances
text_exists = false

// How many Braziers are still in existence?
braziers = 5

// How many Braziers are currently lit?
lit = 0

// Which room is the North Hallway?
north_hallway = noone

// Initial values for wood_containers, bullet_containers, and empty_containers -
// these help to ensure all resources are spread out randomly
wood_containers = 25
bullet_containers = 15
empty_containers = total_containers - ( wood_containers + bullet_containers )

// What text do we display to the Player at the beginning?
intro_text = "YOU HAVE ONE HOUR"

// How long do we display the intro text for?
intro_timer = 0

// What is the current Hour text?
curr_hour_text = "11 PM"

// How long does it take for an Hour to pass? (Currently set as 90 seconds)
hour_timer_max = game_get_speed( gamespeed_fps ) * 90

// For Game Balancing purposes, the initial "Hour" receives an additional 30 seconds
// (120 seconds - or 2 minutes total)
initial_timer = game_get_speed( gamespeed_fps ) * 120

// How long have we spent in this current Hour?
global_timer = initial_timer

// How many Hours have passed already? (Set as -1 initially to represent Prep Hour)
curr_hour = -1

// How many Hours must the Player survive to win?
hour_total = 6

// Macro for absolutely no spawns, engagements, or aggression from Grima
#macro PREP			-99



/*
 * ENEMY SPAWNER VALUES
 */
 

// Spawn Rate Values

// "Lowest" spawn rate for all Windows (45 seconds - or 2 per hour)
lowest_spawn_rate = game_get_speed( gamespeed_fps ) * 45

// "Low" spawn rate for all Windows (30 seconds - or 3 per hour)
low_spawn_rate = game_get_speed( gamespeed_fps ) * 30

// "Medium" spawn rate for all Windows (22.5 seconds - or 4 per hour)
medium_spawn_rate = game_get_speed( gamespeed_fps ) * 22.5

// "High" spawn rate for all Windows (18 seconds - or 5 per hour)
high_spawn_rate = game_get_speed( gamespeed_fps ) * 18

// What is the current spawn rate?
curr_spawn_rate = low_spawn_rate


// Engagement Time Values

// "Lowest" engagement rate for all Windows (25 seconds)
lowest_engagement = game_get_speed( gamespeed_fps ) * 25

// "Low" engagement rate for all Windows (20 seconds)
low_engagement = game_get_speed( gamespeed_fps ) * 20

// "Medium" engagement rate for all Windows (15 seconds)
medium_engagement = game_get_speed( gamespeed_fps ) * 15

// "High" engagement rate for all Windows (12 seconds)
high_engagement = game_get_speed( gamespeed_fps ) * 12

// What is the current engagement rate?
curr_engagement = low_engagement


// Engagement Success Rate Values

// "Lowest" chance of engagement success for all Windows (10% chance)
lowest_success_rate = 9

// "Low" chance of engagement success for all Windows (20% chance)
low_success_rate = 4

// "Medium" chance of engagement success for all Windows (25% chance)
medium_success_rate = 3

// "High" chance of engagement success for all Windows (33% chance)
high_success_rate = 2

// What is the current success rate?
curr_success_rate = low_success_rate


// Damage Values

// "Lowest" damage for all Windows (~7 hits to destroy a Window)
lowest_damage = 15

// "Low" damage for all Windows (5 hits to destroy a Window)
low_damage = 20

// "Medium" damage for all Windows (4 hits to destroy a Window)
medium_damage = 25

// "High" damage for all Windows (3 hits to destroy a Window)
high_damage = 34

// What is the current damage?
curr_damage = low_damage


// Damage Rate Values

// "Lowest" damage rate for all Windows (Every 25 seconds)
lowest_damage_rate = game_get_speed( gamespeed_fps ) * 25

// "Low" damage rate for all Windows (Every 20 seconds)
low_damage_rate = game_get_speed( gamespeed_fps ) * 20

// "Medium" damage rate for all Windows (Every 18 seconds)
medium_damage_rate = game_get_speed( gamespeed_fps ) * 18

// "High" damage rate for all Windows (Every 15 seconds)
high_damage_rate= game_get_speed( gamespeed_fps ) * 15

// What is the current damage rate?
curr_damage_rate = low_damage_rate



/*
 * GRIMA VALUES
 */


// Aggression Values

// "Low" aggression - Makes a move every 20 seconds
low_aggression = game_get_speed( gamespeed_fps ) * 20

// "Medium" aggression - Makes a move every 15 seconds
medium_aggression = game_get_speed( gamespeed_fps ) * 15

// "High" aggression - Makes a move every 10 seconds
high_aggression= game_get_speed( gamespeed_fps ) * 10

// What is the current aggression?
curr_aggression = low_aggression


// Move Success Rate Values

// "Low" chance of movement success for Grima (20% chance)
low_move_success = 4

// "Medium" chance of movement success for Grima (25% chance)
medium_move_success = 3

// "High" chance of movement success for Grima (33% chance)
high_move_success = 2

// What is the current movement success chance?
curr_move_success = low_move_success
