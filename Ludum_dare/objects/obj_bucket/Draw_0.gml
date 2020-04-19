/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (global.water_changed_timer > 0) {
	draw_circle(x - 20, y - 20, 15, false)
	global.water_changed_timer--;
}
