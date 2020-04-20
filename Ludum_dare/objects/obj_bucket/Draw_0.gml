/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (global.water_changed_timer > 0) {
	draw_circle(x - 20, y - 20, 15, false)
	
	//Water level
	draw_healthbar(x - 30, y-32, x - 10, y-9, global.water_lvl, c_gray, c_blue, c_aqua, 3, true, false)
	draw_sprite(spr_water_ui, 0, x - 20, y - 20)
	

	global.water_changed_timer--;
}
