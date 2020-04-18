
//Player stuff
#region

//Panel back
for(var i = 0; i < 4; i++){
	
	var player_x = 208 + 288 * i
	var player_y = 216
	
	draw_sprite_ext(spr_multiplayer_ui_2, 0, player_x-112, player_y-150, 2, 2, 0, c_white, 0.75)
	
	//draw_text(0, 0 + 32*i, player_ready[i])
	
	//draw_text(0, 120, global.player_index)
	
}

for(var p = 0; p < global.player_index; p++){
	
	if(player_ready[p] != 12 || player_ready[p] == 11){

		var player_x = 208 + 288 * p
		var player_y = 216


		//Panel
		draw_sprite_ext(spr_multiplayer_ui, p, player_x-112, player_y-150, 2, 2, 0, c_white, 1)

		draw_sprite_ext(spr_player_tag, 1+p, player_x, player_y-100, 2, 2, 0, c_white, 1)

		//legs
		pal_swap_set(spr_player_pal,palette_type[p],false);
		draw_sprite_ext(spr_idle_legs, 0, player_x, player_y, 2, 2, 0, c_white, 1)

		//torso
		draw_sprite_ext(spr_idle_torso, 0, player_x, player_y, 2, 2, 0, c_white, 1)

		gpu_set_blendmode(bm_max)
		draw_set_color(c_orange)

		draw_sprite_ext(spr_idle_lights, 0, player_x, player_y, 2, 2, 0, c_white, 1);

		gpu_set_blendmode(bm_normal)
		draw_set_color(c_white)

		pal_swap_reset();

		//Hat
		if(hat_type[p] >= 0)
			draw_sprite_ext(spr_hats, hat_type[p], player_x, player_y, 2, 2, 0, c_white, 1)

		pal_swap_set(spr_player_pal,palette_type[p],false);
		//cannon
		draw_sprite_ext(spr_idle_cannon, 0, player_x, player_y, 2, 2, 0, c_white, 1)

		gpu_set_blendmode(bm_max)
		draw_set_color(c_orange)

		draw_sprite_ext(spr_cannon_lights, 0, player_x, player_y, 2, 2, 0, c_white, 1);

		gpu_set_blendmode(bm_normal)
		draw_set_color(c_white)

		pal_swap_reset();


		//Ammo stats
		var ammo_x = player_x - 90
		var ammo_y = player_y + 316

		draw_sprite_ext(spr_multiplayer_ui, 11+ammo_index[p], player_x-112, player_y+32, 2, 2, 0, c_white, 1)

		for(var i = 0; i <= 3; i++){

			for(var j = 0; j <= 4; j++){
				draw_sprite_ext(spr_ui_ammo_stats, 1, ammo_x + 14 * j, ammo_y + 20*i, 2, 2, 0, c_white, 1)
		
				//damage
				if(i == 0 && j < ammo_damage[p]){
					draw_sprite_ext(spr_ui_ammo_stats, 0, ammo_x + 14 * j, ammo_y + 20*i, 2, 2, 0, c_white, 1)
					draw_sprite_ext(spr_ui_ammo_stats, 2, ammo_x + 74, ammo_y + 20*i, 2, 2, 0, c_white, 1)
				}
			
				//ammo capacity
				if(i == 1 && j < ammo_capacity[p]){
					draw_sprite_ext(spr_ui_ammo_stats, 0, ammo_x + 14 * j, ammo_y + 20*i, 2, 2, 0, c_white, 1)
					draw_sprite_ext(spr_ui_ammo_stats, 3, ammo_x + 74, ammo_y + 20*i, 2, 2, 0, c_white, 1)
				}
			
				//recoil
				if(i == 2 && j < ammo_recoil[p]){
					draw_sprite_ext(spr_ui_ammo_stats, 0, ammo_x + 14 * j, ammo_y + 20*i, 2, 2, 0, c_white, 1)
					draw_sprite_ext(spr_ui_ammo_stats, 4, ammo_x + 74, ammo_y + 20*i, 2, 2, 0, c_white, 1)
				}
			
				//rate of fire
				if(i == 3 && j < ammo_speed[p]){
					draw_sprite_ext(spr_ui_ammo_stats, 0, ammo_x + 14 * j, ammo_y + 20*i, 2, 2, 0, c_white, 1)
					draw_sprite_ext(spr_ui_ammo_stats, 5, ammo_x + 74, ammo_y + 20*i, 2, 2, 0, c_white, 1)
				}
		
			}
	
		}


		//Menu text

		//Color set
		var k = p*2

		if(menu_index[p] != 0)
			draw_sprite_ext(spr_multiplayer_ui, 4, player_x-112, player_y-150, 2, 2, 0, c_white, 1)
		else{
			draw_sprite_ext(spr_multiplayer_ui, 5, player_x-112, player_y-150, 2, 2, 0, c_white, 1)
	
			draw_sprite_ext(spr_multiplayer_ui, 6, player_x-112 + menu_bop[k], player_y-150, 2, 2, 0, c_white, 1)
			draw_sprite_ext(spr_multiplayer_ui, 7, player_x-112 + menu_bop[k+1], player_y-150, 2, 2, 0, c_white, 1)
	
		}
	
		draw_sprite_ext(spr_multiplayer_ui, 8, player_x-112, player_y-150, 2, 2, 0, c_white, 1)


		//Hat set
		if(menu_index[p] != 1)
			draw_sprite_ext(spr_multiplayer_ui, 4, player_x-112, player_y-150+48, 2, 2, 0, c_white, 1)
		else{
			draw_sprite_ext(spr_multiplayer_ui, 5, player_x-112, player_y-150+48, 2, 2, 0, c_white, 1)
	
			draw_sprite_ext(spr_multiplayer_ui, 6, player_x-112 + menu_bop[k], player_y-150+48, 2, 2, 0, c_white, 1)
			draw_sprite_ext(spr_multiplayer_ui, 7, player_x-112 + menu_bop[k+1], player_y-150+48, 2, 2, 0, c_white, 1)
	
		}
	
		draw_sprite_ext(spr_multiplayer_ui, 9, player_x-112, player_y-150+48, 2, 2, 0, c_white, 1)


		//ammo set
		if(menu_index[p] != 2)
			draw_sprite_ext(spr_multiplayer_ui, 4, player_x-112, player_y-150+96, 2, 2, 0, c_white, 1)
		else{
			draw_sprite_ext(spr_multiplayer_ui, 5, player_x-112, player_y-150+96, 2, 2, 0, c_white, 1)
	
			draw_sprite_ext(spr_multiplayer_ui, 6, player_x-112 + menu_bop[k], player_y-150+96, 2, 2, 0, c_white, 1)
			draw_sprite_ext(spr_multiplayer_ui, 7, player_x-112 + menu_bop[k+1], player_y-150+96, 2, 2, 0, c_white, 1)
	
		}	

		draw_sprite_ext(spr_multiplayer_ui, 10, player_x-112, player_y-150+96, 2, 2, 0, c_white, 1)

	}

}

#endregion

