/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

obj_timer -= 1

if(obj_timer < 0){
	if place_meeting(x,y+16, obj_block){
		vsp = -10
	}
	obj_timer = 100
}