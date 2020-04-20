if(instance_exists(obj_whale)){

//UI coords
var _x = 50
var _y = 50

var _y2 = 674

//Water level
//draw_healthbar(_x, _y, _x + global.max_water_lvl, _y+16, global.water_lvl, c_gray, c_blue, c_aqua, 0, true, true)
//draw_text(_x, _y, global.water_lvl)

//TEST UI for day timer
draw_healthbar(display_get_gui_width() - 20, _y2-86, display_get_gui_width() - 10, _y2, global.day_timer / global.max_day_timer * 100, c_orange, c_orange, c_aqua, 2, true, false)


//whale hp
draw_healthbar(_x + 3, _y2-86, _x + 12, _y2, 100 - (whale_ui_hp / global.whale_max_hp * 100), c_gray, c_red, c_red, 3, true, false)
draw_sprite(spr_whale_ui, 0, _x, display_get_gui_height() - 80)


if (global.whale_hp / global.whale_max_hp < 0.3) alert_timer++;
else alert_timer = 0



	draw_set_font(global.fnt_normal_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_color(c_orange);

if (global.happy_timer > 0) {
	global.happy_timer--;
	draw_text(_x + 44, _y2 + 14, "THANKS!");
} else if (alert_timer > 30) {
	draw_text(_x + 44, _y2 + 14, "HELP!");
}
if (alert_timer > 60) alert_timer = 0;

}


//Prologue
if(timeline_running && timeline_index == tim_prologue){

	draw_sprite_ext(spr_prologue, image_index, 0, 0, 1, 1, 0, c_white, cut_alpha)
	
	draw_set_alpha(1)	
	
}


//gameover screen
if(timeline_running && timeline_index == tim_game_over){

	var w = display_get_gui_width()
	var h = display_get_gui_height()

	draw_set_color(c_black);
	draw_set_alpha(cut_alpha/2)
	draw_rectangle(0, 0, w, h, false);

	draw_set_alpha(cut_alpha)	
	
	draw_set_font(global.fnt_normal_text);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(w/2, h/2, "GAME OVER");
	
	draw_set_alpha(1)	
	
}

//victory screen
if(timeline_running && timeline_index == tim_victory){

	var w = display_get_gui_width()
	var h = display_get_gui_height()

	draw_set_alpha(cut_alpha)	
	
	draw_set_font(global.fnt_normal_text);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(w/2, h/2, "You survived the day!");
	
	draw_set_alpha(1)	
	
}

