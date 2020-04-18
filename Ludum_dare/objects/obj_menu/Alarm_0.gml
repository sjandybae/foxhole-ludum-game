
if(global.player_index == 0){
	
	if(global.player_index != 4){
		
		//Player 1 data
		/*instance_create_layer(160, 144, "Instances", obj_player)
		
		obj_player.current_pal = global.player_data[0]
		obj_player.hat_index = global.player_data[1]
	
		
		obj_player.ammo_type = global.player_data[2]
		
		obj_player.cont_port = global.player_data[12]*/
		
		
		global.player_index++
		audio_play_sound(snd_player_ready, 1, 0)
		
	}
		
}

else if(player_ready[global.player_index-1] != player_ready[global.player_index]) && global.player_index == 1{
	
	if(global.player_index != 4){
		global.player_index++
		audio_play_sound(snd_player_ready, 1, 0)
	}
		
}

else if(player_ready[global.player_index-1] != player_ready[global.player_index] && player_ready[global.player_index-2] != player_ready[global.player_index]) && global.player_index == 2{
	
	if(global.player_index != 4){
		global.player_index++
		audio_play_sound(snd_player_ready, 1, 0)
	}
}

else if(player_ready[global.player_index-1] != player_ready[global.player_index] && player_ready[global.player_index-2] != player_ready[global.player_index] && player_ready[global.player_index-3] != player_ready[global.player_index]) && global.player_index == 3{
	
	if(global.player_index != 4){
		global.player_index++
		audio_play_sound(snd_player_ready, 1, 0)	
	}
	
}


