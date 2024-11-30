/// @description Establishes Zombie sprites for each State, and the Hunting/Attacking distances

// Inherit the parent event
event_inherited();

// Assign sprites for each State the Zombie will progress through
spr_idle = spr_zombie_idle
spr_walk = spr_zombie_walk
spr_attack = spr_zombie_attack
spr_hurt = spr_zombie_hurt
spr_die = spr_zombie_die

// Distance before we start Hunting the Player (if applicable)
hunt_distance = 100

// Sets the distance we stop from the Player
attack_distance = 18