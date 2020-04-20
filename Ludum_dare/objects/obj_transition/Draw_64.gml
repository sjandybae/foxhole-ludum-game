//Controller ports
/*for(i = 0; i < gamepad_get_device_count(); i++){
	draw_text(0, 0 + i * 24, global.ports[i])
	
	draw_text(24, 0 + i * 24, i)
}


for(i = 0; i < 4; i++){
	draw_text(64, 0 + i * 24, global.connected_cont[i])
	
	draw_text(88, 0 + i * 24, port_no)
}

draw_text(112, 0, global.total_devices)*/

//check buttons
/*var port = global.connected_cont[1]



var left = gamepad_button_check_pressed(port, gp_axisrh)
var right = gamepad_button_check_pressed(port, gp_padr)
var up = gamepad_button_check_pressed(port, gp_padu)
var down = gamepad_button_check_pressed(port, gp_padd)

var bt_b = gamepad_button_check_pressed(port, gp_face1)
var bt_a = gamepad_button_check_pressed(port, gp_face2)
var bt_x = gamepad_button_check_pressed(port, gp_face3)
var bt_y = gamepad_button_check_pressed(port, gp_face4)

draw_text(x, y, left)
draw_text(x+16, y, right)
draw_text(x+32, y, up)
draw_text(x+48, y, down)

draw_text(x+64, y, bt_b)
draw_text(x+80, y, bt_a)
draw_text(x+96, y, bt_x)
draw_text(x+112, y, bt_y)

draw_text(x + 128, y, gamepad_get_description(port))*/


//Room transitions
//if(changing_rooms == true)
//	draw_sprite_ext(prev_screen, 0, 0-percent, 0, 1, 1, 0, c_white, 1)

if(mode != TRANS_MODE.OFF)
{

	draw_set_color(c_black);
	draw_set_alpha(percent)
	draw_rectangle(0, 0, w, percent * h_half, false);
	draw_rectangle(0, h, w, h-(percent * h_half), false);
	
	
}

draw_set_alpha(1)
draw_set_color(c_white);

/*
if(slide != w){
	
	draw_sprite_ext(prev_screen, 0, 0, 0, 1, 1, 0, c_white, 1)
	
	draw_set_color(c_black)
	draw_set_alpha(cos(slide))
	draw_rectangle(0, 0, w, h, false)
	draw_set_alpha(1)
	draw_set_color(c_white)

	if(slide > 0){
		//draw_sprite_ext(prev_screen, 0, 0-slide, 0, 1, 1, 0, c_white, 1)
		//draw_sprite_ext(next_screen, 0, w-slide, 0, 1, 1, 0, c_white, 1)
		draw_sprite_ext(player_leg_sprite, player_index, w + slide, player_y-48, player_face*2, 2, 0, c_white, 1)
		draw_sprite_ext(player_sprite, player_index, w + slide, player_y-48, player_face*2, 2, 0, c_white, 1)
	}
	
	if(slide < 0){
		//draw_sprite_ext(prev_screen, 0, 0+slide, 0, 1, 1, 0, c_white, 1)
		//draw_sprite_ext(next_screen, 0, w+slide, 0, 1, 1, 0, c_white, 1)
		
		draw_sprite_ext(player_leg_sprite, player_index, w + slide, player_y-48, player_face*2, 2, 0, c_white, 1)
		draw_sprite_ext(player_sprite, player_index, w + slide, player_y-48, player_face*2, 2, 0, c_white, 1)
	}
	
	
	
	//draw_sprite_ext(player_leg_sprite, player_index, w - slide, player_y-48, player_face*2, 2, 0, c_white, 1)
	//draw_sprite_ext(player_sprite, player_index, w - slide, player_y-48, player_face*2, 2, 0, c_white, 1)
}*/



if(global.pause == true){
	draw_sprite_ext(screenshot, 0, 0, 0, 1, 1, 0, c_white, 1);
	
	draw_set_color(c_black);
	draw_set_alpha(0.5)
	draw_rectangle(0, 0, w, h, false);

	draw_set_alpha(1)	
	draw_set_font(global.fnt_normal_text);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(w/2, h/2, "PAUSED");
}


//Drawing map


/*if(room_speed <= 10){
	draw_set_color(c_white);
	draw_set_alpha(0.5)
	draw_rectangle(0, 0, w, h, false);
	draw_set_alpha(1)
}*/

//Drawing Player UI

//draw_text(0,96,prev_level); draw_text(48,96,level_index); draw_text(96,96,next_level)


/*
for(var i = 0; i <= 5; i++){
	
	draw_text(0, 32*i, string(global.wrld1[i]) )
	
	var lvl = ds_map_find_value(levels_ds_map, 98+i)
	draw_text(64, 32*i, string(lvl) )

	
	draw_text(128, 32*i, 98+i )
	
	draw_text(192, 32, level_index )
}*/

//draw_text(192, 32, level_index )












