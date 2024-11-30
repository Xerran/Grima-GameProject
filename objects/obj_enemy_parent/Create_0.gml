/// @description Generic creation variables for all Enemy types

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

// States for Enemy types to transition through as they pursue objectives
enum STATES {
	IDLE,
	MOVE,
	ATTACK,
	DEAD
}

// Used to hold the current State of this particular entity
state = STATES.IDLE

// The distance between this Enemy instance and its current goal (Player/Brazier)
curr_goal_distance = 0

// Current Brazier the Enemy is moving towards
my_brazier = noone