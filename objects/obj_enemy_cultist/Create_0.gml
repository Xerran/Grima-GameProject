/// @description Establishes Cultist sprites for each State, and the Hunting/Attacking distances

// Inherit the parent event
event_inherited();

// Assign sprites for each State the Cultist will progress through
spr_idle = spr_cultist_idle
spr_walk = spr_cultist_walk
spr_attack = spr_cultist_attack
spr_hurt = spr_cultist_hurt
spr_die = spr_cultist_die

// Distance before we start Hunting the Player (if applicable)
hunt_distance = 200

/*
 *  ATTACK VARIABLES
 */ 

// Sets the distance we stop from the Player
attack_distance = 100

// The frame we perform the attack
attack_frame = 6

// How long do we hold this frame?
attack_hold = 10

// Delay between attacks
attack_delay = 100

// How much damage this enemy deals
damage = 15