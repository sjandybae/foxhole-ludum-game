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

/*if(mode != TRANS_MODE.OFF)
{

	draw_set_color(c_black);
	draw_set_alpha(percent)
	draw_rectangle(0, 0, w, percent * h_half, false);
	draw_rectangle(0, h, w, h-(percent * h_half), false);
	
	
}

draw_set_alpha(1)
draw_set_color(c_white);*/

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
	
	/*draw_set_color(c_black);
	draw_set_alpha(0.5)
	draw_rectangle(0, 0, w, h, false);
	
	if(global.inv_space > 0){
		draw_set_color(c_white);
		draw_set_alpha(1)
		
	}
	
	draw_sprite_ext(spr_hud_border, 0, w/2, h/2, 2, 2, 0, c_white, 1);*/
}


//Drawing map


//Full map
if(global.cutscene == false && global.multiplayer_mode == false){
#region
if(global.pause == true){

	draw_set_alpha(1)

	minimap_width = 512
	minimap_height = 512

	column_minus = 10;
	row_minus = 7;

	minimap_x = (view_w)/2 + 64;
	minimap_y = (view_h)/3
	
	minimap_left = 0
	minimap_top = 0

	draw_set_color(c_white)
	draw_rectangle(minimap_x-2, minimap_y-2, minimap_x + minimap_width + 1, minimap_y + minimap_height + 1, false)

	draw_sprite_part(spr_full_map, 0, minimap_left, minimap_top, minimap_width, minimap_height, minimap_x, minimap_y)


	for(var j = 1; j<32; j++){
	
		for(var i = 1; i<32; i++){
		
			var cell = "column" + string(j) + "_" + "row" + string(i)
		
		
			if(minimap_ds_map[? cell ] != 2)
				draw_sprite( spr_map_empty, minimap_ds_map[? cell ], minimap_x + (j * 16), minimap_y + (i * 16) )
			else
				draw_sprite( spr_map_elements, 0, minimap_x + (j * 16), minimap_y + sin(global.wave_angle) + (i * 16) )

		}
	}

	//Player position
	draw_sprite_ext(spr_map_selected, 1, minimap_x + 16 * minimap_cell_column, minimap_y + 16 * minimap_cell_row, 1, 1, 0, c_white, 1 )

}

#endregion

//Mini map

#region
else{
	
	//old row = 5, column = 7, column_minus = 3, row_minus = 2, width = 112, hieght = 80, 24, 8, 16, 8
	/*
	var scale = 2;
	
	draw_set_alpha(1)
	
	minimap_width = 80*scale
	minimap_height = 48*scale
	
	column_minus = 2;
	row_minus = 1;
	
	minimap_x = (view_w*2) - (minimap_width + 16);
	minimap_y = 16
	
	
	minimap_left = (minimap_cell_column - 2) * 16*scale
	minimap_top = (minimap_cell_row - 1) * 16*scale

	draw_set_color(c_white)
	draw_rectangle(minimap_x-2, minimap_y-2, minimap_x + minimap_width + 1, minimap_y + minimap_height + 1, false)

	draw_sprite_part_ext(spr_full_map, 0, minimap_left/scale, minimap_top/scale, minimap_width/scale, minimap_height/scale, minimap_x, minimap_y, 1*scale, 1*scale, c_white, 1)


	for(var j = 0; j<5; j++){
	
		for(var i = 0; i<3; i++){
		
			var cell = "column" + string( j + minimap_cell_column - column_minus ) + "_" + "row" + string(i + minimap_cell_row - row_minus)
		
			
			draw_sprite_ext( spr_map_empty, minimap_ds_map[? cell ], minimap_x + (j * 16*scale), minimap_y + (i * 16*scale), 1*scale, 1*scale, 0, c_white, 1 )
				
			

		}
	}

	//Player position
	draw_sprite_ext(spr_map_selected, 0, minimap_x + 16*scale + column_minus * 8*scale, minimap_y + 8*scale + row_minus * 8*scale, 1*scale, 1*scale, 0, c_white, abs(sin(global.wave_angle)))
	*/
	
}

#endregion
}

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












