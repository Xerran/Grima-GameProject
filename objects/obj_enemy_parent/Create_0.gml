/// @description Generic creation variables for all Enemy types

// Upon Enemy initialization, set current HP to the maximum HP for this Enemy type
curr_hp = health_max

// Are we currently hunting the Player?
hunting = false 

// Creates a path with the Motion Planning Grid to chase the Player
path = path_add() 

// Sets a delay for calculating the path to the Player
path_delay = 30

// Sets a timer for calculating the path to the Player
path_timer = irandom(60)

// General re-size of Sprite for use in game
image_xscale = 2
image_yscale = 2

// Hold previous X and Y to assist with causing the Enemy to face the correct direction
x_prev = x
y_prev = y

// Variables to assist with applying Knockback when attacked by the Player
hsp = 0
vsp = 0

// States for Enemy types to transition through as they pursue objectives
enum STATES {
	IDLE,
	MOVE,
	HURT,
	ATTACK,
	DEAD
}

// Used to hold the current State of this particular entity
state = STATES.IDLE

// Used to calculate how long the Enemy remains Hurt
hurt_timer = 0

// The distance between this Enemy instance and its current goal (Player/Brazier)
curr_goal_distance = 0

// Current distance to player
distance_to_player = 0

// Current Brazier the Enemy is moving towards
my_brazier = noone

// If an Enemy has been hit with a Sword, then they cannot be re-damaged by that Sword
hit_with_sword = false


/*
 *  ATTACK VARIABLES
 */ 

// The frame we perform the attack
attack_frame = 0

// How long do we hold this frame?
attack_hold = 0

// Are we still holding the attack frame?
attack_timer = 0

// What direction are we attacking in?
attack_dir = 0

// The X and Y components of the Attack velocity
a_velx = 0
a_vely = 0

// Can we currently attack?
can_attack = true

// Delay between attacks
attack_delay = 0

// Are we done attacking?
attack_done = false

// How much damage this enemy deals
damage = 0

// Are we currently dangerous for the Player to touch?
is_hazard = false

// Keeps track of current obj_enemy_wave instance for Zombies
my_wave = noone

// The three Bullets that a Cultist has generated
my_bullet1 = noone
my_bullet2 = noone
my_bullet3 = noone

// Assigned spawn point for all Bullets
bullet_spawn_x = 0
bullet_spawn_y = 0

