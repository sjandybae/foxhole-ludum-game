//Total players
//global.player_count = global.total_devices

global.player_count = 1

//Creating the players in multiplayer
#region
if(instance_exists(obj_player) && global.multiplayer_mode){

	if(!instance_exists(obj_player_2) && global.player_count > 1)
		instance_create_layer(global.player_positions[2], global.player_positions[3], "Instances", obj_player_2)

	if(!instance_exists(obj_player_3) && global.player_count > 2)
		instance_create_layer(global.player_positions[4], global.player_positions[5], "Instances", obj_player_3)
		
	if(!instance_exists(obj_player_4) && global.player_count > 3)
		instance_create_layer(global.player_positions[6], global.player_positions[7], "Instances", obj_player_4)
		
		
	//Player 1 data
	obj_player.current_pal = global.player_data[0]
	obj_player.hat_index = global.player_data[1]
	
	if(percent > 0)
		obj_player.ammo_type = global.player_data[2]
		
	obj_player.cont_port = global.player_data[12]
	
	//player 2 data
	if(instance_exists(obj_player_2)){
		obj_player_2.current_pal = global.player_data[3]
		obj_player_2.hat_index = global.player_data[4]
		
		if(percent > 0)
			obj_player_2.ammo_type = global.player_data[5]
			
		obj_player_2.cont_port = global.player_data[13]
	}
	
	//player 3 data
	if(instance_exists(obj_player_3)){
		obj_player_3.current_pal = global.player_data[6]
		obj_player_3.hat_index = global.player_data[7]
		
		if(percent > 0)
			obj_player_3.ammo_type = global.player_data[8]
			
		obj_player_3.cont_port = global.player_data[14]
	}

	//player 3 data
	if(instance_exists(obj_player_4)){
		obj_player_4.current_pal = global.player_data[9]
		obj_player_4.hat_index = global.player_data[10]
		
		if(percent > 0)
			obj_player_4.ammo_type = global.player_data[11]
			
		obj_player_4.cont_port = global.player_data[15]
	}

		
	
}
#endregion

//Checking where we at
/*for(var i = 50; i<250; i++){

	if(ds_map_find_value(levels_ds_map, i) == room)
		level_index = i
	
}




