/// @description Generic creation variables for 

// Are we currently hunting the Player?
hunting = false 

// Distance before we start Hunting the Player (if applicable)
hunt_distance = 200

// Sets tje distance we stop from the Player
attack_distance = 18

// Creates a path with the Motion Planning Grid to chase the Player
path = path_add() 

// Sets a delay for calculating the path to the Player
path_delay = 30

// Sets a timer for calculating the path to the Player
path_timer = irandom(60)