/// @description Establishes Zombie sprites for each State, and the Hunting/Attacking variables

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

/*
 *  ATTACK VARIABLES
 */ 

// Sets the distance we stop from the Player
attack_distance = 32

// The frame we perform the attack
attack_frame = 8

// How long do we hold this frame?
attack_hold = 40

// Delay between attacks
attack_delay = 100

// How much damage this enemy deals
damage = 10
 