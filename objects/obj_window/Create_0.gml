/// @description Initialize all variables

// What are the HP variables of this Window?
hp_max = 100
curr_hp = 0

// Is a Player currently nearby?
player_nearby = false

// Text instance created by this Window
my_text = noone

// Have we already created a Text instance?
text_created = false

// What Text do we display to the Player?
text = "Hold E to Barricade"

// The minimum distance a Player must be from this Window to board it up
min_distance = sprite_height

// Current distance of the Player from this Instance
player_distance = 0

// How much damage does this Window take per hit?
damage = 0

// What is the rate at which we take damage?
damage_rate = 0

// How long has it been since we were last damaged by an Enemy?
// (set to low_damage_rate at start)
damaged_timer = obj_game.low_damage_rate

// Have we been recently damaged by an Enemy?
enemy_damaged = false

// Have we been recently damaged by the Player?
player_damaged = false

// How long do we flash after being damaged?
flash_timer = 3

// How long before an enemy tries to break through?
engagement_timer = PREP

// How long has it been since an Enemy has attempted to Engage this Window?
// (set to low_engagement at start)
curr_engagement_timer = obj_game.low_engagement

// What is the success rate of an Enemy trying to Engage this Window?
success_rate = 0

// What is the current Hour?
curr_hour = obj_game.curr_hour


// The States of the Window object
enum WINDOW {
	
	OPEN,
	BLOCKED,
	ENGAGED,
	TRAPPED
	
}

// What is the State of this Window Instance?
state = WINDOW.OPEN

// What is this Window's Spawn Area?
my_spawn = instance_nearest( x, y, obj_spawn_area )

// What is this Window's Damage Area?
my_damage_area = instance_nearest( x, y, obj_damage_window )

// Set this as the Window for the Damage Area
my_damage_area.my_window = self

// What is this Window's spawn rate?
spawn_rate = PREP

// How long have we spent trying to spawn an Enemy? (set to low_spawn_rate at start)
spawn_timer = obj_game.low_spawn_rate

// How many Zombies have we spawned recently?
zombie_spawns = 0

// How long before we dictate that we are going to spawn a specialty Enemy?
specialty_rate = 3

// What type of Enemy are we going to Spawn?
spawn_type = 0

// What is the sound range?
range = 500

