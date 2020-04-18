//if(global.multiplayer_mode){

//Player ammo
if(ammo_type == "default")
	ammo_index = 0
		
if(ammo_type == "blast")
	ammo_index = 2
		
if(ammo_type == "rapid")
	ammo_index = 4
			
if(ammo_type == "burst")
	ammo_index = 6
			
if(ammo_type == "missile")
	ammo_index = 8
	
if(ammo_type == "saw")
	ammo_index = 10

	
	//Player 1 
	#region
	if(player_no == 1){
		
		var x_ = 2
		var y_ = 2
		
		//Speedometer
		var s = lerp(0, abs(hsp)*100, 0.05)
		
		//draw_healthbar(x_+128, 64, 256, 128, s, c_gray, c_green, c_red, 0, true, true)
		
		//Player HP
		draw_sprite_ext(spr_player_stats, 4, x_+54, y_+16, 2, 2, 0, c_white, 1)
		
		for(var i = 0; i < hp; i++)
			draw_sprite_ext(spr_player_stats, 5, x_+54+10*i, y_+16, 2, 2, 0, c_white, 1)
		
		
			
		for(var j = 0; j < max_ammo; j++)
			draw_sprite_ext(spr_ammo_ui, ammo_index, x_+32, y_+78 + 20*j, 2, 2, 0, c_white, 1)
			
		for(var k = 0; k < ammo; k++)
			draw_sprite_ext(spr_ammo_ui, ammo_index+1, x_+32, y_+78 + 20*k, 2, 2, 0, c_white, 1)
		
		//grenade
		if(!can_throw)
			draw_sprite_ext(spr_ui_grenade, 0, x_ + 80, y_ + 70, 2, 2, 0, c_white, 1)
		else
			draw_sprite_ext(spr_ui_grenade, 1, x_ + 80, y_ + 70, 2, 2, 0, c_white, 1)
		
		//PLayer headshot
		draw_sprite_ext(spr_player_stats, 0, x_, y_, 2, 2, 0, c_white, 1)
		
		draw_sprite_ext(spr_player_stats, 1, x_, y_, 2, 2, 0, c_white, 0.5)

		pal_swap_set(my_pal_sprite,current_pal,false);
		draw_sprite_ext(spr_player_stats, 2, x_, y_, 2, 2, 0, c_white, 1)
		
		gpu_set_blendmode(bm_add)
		draw_sprite_ext(spr_player_stats, 3, x_, y_, 2, 2, 0, c_white, 1)
		gpu_set_blendmode(bm_normal)
		
		pal_swap_reset();
	
	}
	#endregion
	
	//Player 2
	#region
	if(player_no == 2){
		
		var x_ = ((camera_get_view_width(view_camera[0])*2)/global.zoom) - 66
		var y_ = 2
		
		//Player HP
		draw_sprite_ext(spr_player_stats, 4, x_-58, y_+16, 2, 2, 0, c_white, 1)
		
		for(var i = 0; i < hp; i++)
			draw_sprite_ext(spr_player_stats, 5, x_-18-10*i, y_+16, 2, 2, 0, c_white, 1)
		
		
			
		for(var j = 0; j < max_ammo; j++)
			draw_sprite_ext(spr_ammo_ui, ammo_index, x_+32, y_+78 + 20*j, -2, 2, 0, c_white, 1)
			
		for(var k = 0; k < ammo; k++)
			draw_sprite_ext(spr_ammo_ui, ammo_index+1, x_+32, y_+78 + 20*k, -2, 2, 0, c_white, 1)
		
		//grenade
		if(!can_throw)
			draw_sprite_ext(spr_ui_grenade, 0, x_ - 22, y_ + 70, 2, 2, 0, c_white, 1)
		else
			draw_sprite_ext(spr_ui_grenade, 1, x_ - 22, y_ + 70, 2, 2, 0, c_white, 1)
		
		//PLayer headshot
		draw_sprite_ext(spr_player_stats, 0, x_, y_, 2, 2, 0, c_white, 1)
		
		draw_sprite_ext(spr_player_stats, 1, x_, y_, 2, 2, 0, c_white, 0.5)

		pal_swap_set(my_pal_sprite,current_pal,false);
		draw_sprite_ext(spr_player_stats, 2, x_, y_, 2, 2, 0, c_white, 1)
		
		gpu_set_blendmode(bm_add)
		draw_sprite_ext(spr_player_stats, 3, x_, y_, 2, 2, 0, c_white, 1)
		gpu_set_blendmode(bm_normal)
		
		pal_swap_reset();
	
	}
	#endregion
	
	//Player 3
	#region
	if(player_no == 3){
		
		var x_ = 2
		var y_ = ((camera_get_view_height(view_camera[0])*2)/global.zoom) - 66
		
		//Player HP
		draw_sprite_ext(spr_player_stats, 4, x_+54, y_+16, 2, 2, 0, c_white, 1)
		
		for(var i = 0; i < hp; i++)
			draw_sprite_ext(spr_player_stats, 5, x_+54+10*i, y_+16, 2, 2, 0, c_white, 1)
		
		
			
		for(var j = 0; j < max_ammo; j++)
			draw_sprite_ext(spr_ammo_ui, ammo_index, x_+32, y_-20 - 20*j, 2, 2, 0, c_white, 1)
			
		for(var k = 0; k < ammo; k++)
			draw_sprite_ext(spr_ammo_ui, ammo_index+1, x_+32, y_-20 - 20*k, 2, 2, 0, c_white, 1)
		
		//grenade
		if(!can_throw)
			draw_sprite_ext(spr_ui_grenade, 0, x_ + 80, y_ - 12, 2, 2, 0, c_white, 1)
		else
			draw_sprite_ext(spr_ui_grenade, 1, x_ + 80, y_ - 12, 2, 2, 0, c_white, 1)
		
		//PLayer headshot
		draw_sprite_ext(spr_player_stats, 0, x_, y_, 2, 2, 0, c_white, 1)
		
		draw_sprite_ext(spr_player_stats, 1, x_, y_, 2, 2, 0, c_white, 0.5)

		pal_swap_set(my_pal_sprite,current_pal,false);
		draw_sprite_ext(spr_player_stats, 2, x_, y_, 2, 2, 0, c_white, 1)
		
		gpu_set_blendmode(bm_add)
		draw_sprite_ext(spr_player_stats, 3, x_, y_, 2, 2, 0, c_white, 1)
		gpu_set_blendmode(bm_normal)
		
		pal_swap_reset();
	
	}
	#endregion
	
	//Player 4
	#region
	if(player_no == 4){
		
		var x_ = ((camera_get_view_width(view_camera[0])*2)/global.zoom) - 66
		var y_ = ((camera_get_view_height(view_camera[0])*2)/global.zoom) - 66
		
		//Player HP
		draw_sprite_ext(spr_player_stats, 4, x_-58, y_+16, 2, 2, 0, c_white, 1)
		
		for(var i = 0; i < hp; i++)
			draw_sprite_ext(spr_player_stats, 5, x_-18-10*i, y_+16, 2, 2, 0, c_white, 1)
		
		
			
		for(var j = 0; j < max_ammo; j++)
			draw_sprite_ext(spr_ammo_ui, ammo_index, x_+32, y_-20 - 20*j, -2, 2, 0, c_white, 1)
			
		for(var k = 0; k < ammo; k++)
			draw_sprite_ext(spr_ammo_ui, ammo_index+1, x_+32, y_-20 - 20*k, -2, 2, 0, c_white, 1)
		
		//grenade
		if(!can_throw)
			draw_sprite_ext(spr_ui_grenade, 0, x_ - 22, y_ - 12, 2, 2, 0, c_white, 1)
		else
			draw_sprite_ext(spr_ui_grenade, 1, x_ - 22, y_ - 12, 2, 2, 0, c_white, 1)
		
		//PLayer headshot
		draw_sprite_ext(spr_player_stats, 0, x_, y_, 2, 2, 0, c_white, 1)
		
		draw_sprite_ext(spr_player_stats, 1, x_, y_, 2, 2, 0, c_white, 0.5)

		pal_swap_set(my_pal_sprite,current_pal,false);
		draw_sprite_ext(spr_player_stats, 2, x_, y_, 2, 2, 0, c_white, 1)
		
		gpu_set_blendmode(bm_add)
		draw_sprite_ext(spr_player_stats, 3, x_, y_, 2, 2, 0, c_white, 1)
		gpu_set_blendmode(bm_normal)
		
		pal_swap_reset();
	
	}
	#endregion
	
//}
