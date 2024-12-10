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

// The minimum distance a Player must be to board up this Window
min_distance = sprite_height

// How much damage does this Window take per hit?
damage = 0

// What is the rate at which we take damage?
damage_rate = 0

// Is an enemy currently trying to break through?
engaged = false

// How long before an enemy tries to break through?
engagement_timer = 0

// Is this Window currently boarded up?
is_blocked = false

// Is this Window currently trapped?
is_trapped = false

// What is this Window's Spawn Area?
my_spawn = instance_nearest( x, y, obj_spawn_area )

// What is this Window's spawn rate?
spawn_rate = 0

// How many Zombies have we spawned recently?
zombie_spawns = 0

// How long before we dictate that we are going to spawn a specialty Enemy?
specialty_rate = 4

