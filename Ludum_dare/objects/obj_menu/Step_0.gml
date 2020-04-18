for(var i = 0; i < 4; i++){
	
	//Menu controls
	#region

	//Players
	var keyboard_port = player_ready[i]
	
	ready_port[i] = global.connected_cont[i] /*&& i != global.player_index*/
	ready_button[i] = (keyboard_check_pressed(ord("A"))) || gamepad_button_check_pressed(ready_port[i], gp_face1)
	
	//menu_port[i] = global.connected_cont[i]
	menu_left[i] = (keyboard_check_pressed(vk_left) && keyboard_port == 11) || gamepad_button_check_pressed(menu_port[i], gp_padl)
	menu_right[i] = (keyboard_check_pressed(vk_right) && keyboard_port == 11) || gamepad_button_check_pressed(menu_port[i], gp_padr)
	menu_up[i] = (keyboard_check_pressed(vk_up) && keyboard_port == 11) || gamepad_button_check_pressed(menu_port[i], gp_padu)
	menu_down[i] = (keyboard_check_pressed(vk_down) && keyboard_port == 11) || gamepad_button_check_pressed(menu_port[i], gp_padd)

	menu_confirm[i] = (keyboard_check_pressed(ord("A")) && keyboard_port == 11) || gamepad_button_check_pressed(menu_port[i], gp_face1)
	menu_cancel[i] = (keyboard_check_pressed(vk_space) && keyboard_port == 11) || gamepad_button_check_pressed(menu_port[i], gp_start)
	
	
	#endregion

	//Navigating
	#region

	if(menu_up[i]){
	
		if(menu_index[i] == 0)
			menu_index[i] = 2
		
		else
			menu_index[i] -= 1
			
	
	}
	
	if(menu_down[i]){
	
		if(menu_index[i] == 2)
			menu_index[i] = 0
		
		else
			menu_index[i] += 1
	
	}
	
	var j = i*2

	if(menu_right[i])
		menu_bop[j] = 8

	if(menu_left[i])
		menu_bop[j+1] = -8
	
	menu_bop[j] = lerp(menu_bop[j], 0, 0.1)
	menu_bop[j+1] = lerp(menu_bop[j+1], 0, 0.1)

	//Palette select
	#region
	if(menu_index[i] == 0){

		if(menu_left[i]){
	
			if(palette_type[i] == 0)
				palette_type[i] = palette_limit
		
			else
				palette_type[i]--

		}

		if(menu_right[i]){
	
			if(palette_type[i] == palette_limit)
				palette_type[i] = 0
		
			else
				palette_type[i]++
		
			//hat_type += 2

		}

	}
	#endregion


	//Hat select
	#region
	if(menu_index[i] == 1){

		if(menu_left[i]){
	
			if(hat_type[i] == -2)
				hat_type[i] = hat_limit
		
			else
				hat_type[i] -= 2

		}

		if(menu_right[i]){
	
			if(hat_type[i] == hat_limit)
				hat_type[i] = -2
		
			else
				hat_type[i] += 2

		}

	}
	#endregion

	//Ammo select
	#region
	if(menu_index[i] == 2){

		if(menu_left[i]){
	
			if(ammo_index[i] == 0)
				ammo_index[i] = 4
		
			else
				ammo_index[i] -= 1

		}

		if(menu_right[i]){
	
			if(ammo_index[i] == 4)
				ammo_index[i] = 0
		
			else
				ammo_index[i] += 1

		}

	}

	if(ammo_index[i] == 0){
		ammo_kind[i] = "default"
	
		ammo_damage[i] = 3;
		ammo_capacity[i] = 1;
		ammo_recoil[i] = 4;
		ammo_speed[i] = 1
	}
	
	if(ammo_index[i] == 1){
		ammo_kind[i] = "rapid"
	
		ammo_damage[i] = 1;
		ammo_capacity[i] = 5;
		ammo_recoil[i] = 1;
		ammo_speed[i] = 3
	}
	
	if(ammo_index[i] == 2){
		ammo_kind[i] = "missile"
	
		ammo_damage[i] = 1;
		ammo_capacity[i] = 1;
		ammo_recoil[i] = 2;
		ammo_speed[i] = 1
	}
	
	if(ammo_index[i] == 3){
		ammo_kind[i] = "blast"
	
		ammo_damage[i] = 2;
		ammo_capacity[i] = 2;
		ammo_recoil[i] = 3;
		ammo_speed[i] = 2
	}
	
	if(ammo_index[i] == 4){
		ammo_kind[i] = "burst"
	
		ammo_damage[i] = 3;
		ammo_capacity[i] = 1;
		ammo_recoil[i] = 5;
		ammo_speed[i] = 1
	}


	#endregion

	#endregion


	//player 1 choice
	var b = i*3
	
	global.player_data[b] = palette_type[i]
	global.player_data[b+1] = hat_type[i]
	global.player_data[b+2] = ammo_kind[i]

	/*//player 2 choice
	global.player_data[3] = palette_type[1]
	global.player_data[4] = hat_type[1]
	global.player_data[5] = ammo_kind[1]*/


	//Going to rooms
	if(ready_button[i]){
		
		//Keyboard check
		if(ready_button[i] == keyboard_check_pressed(ord("A"))){
			player_ready[global.player_index] = 11
			menu_port[global.player_index] = 11
			
			global.player_data[global.player_index+12] = 11

		}
		
		//Gamepad check
		else{
			player_ready[global.player_index] = global.connected_cont[i]
			menu_port[global.player_index] = player_ready[global.player_index]
			
			global.player_data[global.player_index+12] = menu_port[global.player_index]

		}
		
		alarm[0] = 1
		
		//scr_slide_transition(TRANS_MODE.GOTO, rm_arena_3)
	}
	
	if(menu_cancel[i]){
		
		//global.player_data[global.player_index+12] = 11
		scr_slide_transition(TRANS_MODE.GOTO, rm_arena_1_1)
			
	}

}

//menu sounds

if(menu_up[0] || menu_down[0]) || (menu_up[1] || menu_down[1]) || (menu_up[2] || menu_down[2]) || (menu_up[3] || menu_down[3])
	audio_play_sound(snd_menu_select_2, 1, 0)
	
if(menu_left[0] || menu_right[0]) || (menu_left[1] || menu_right[1]) || (menu_left[2] || menu_right[2]) || (menu_left[3] || menu_right[3])
	audio_play_sound(snd_menu_select, 1, 0)


