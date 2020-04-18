combo = 0;

//Dying
	if(hp <=0 ){
		
			instance_create_layer(x, y, "Effects", obj_enemey_die)
			
			if(drop != false){
				if(drop_chance == 1)
					instance_create_layer(x, y, "Instances", drop)	
			}
			
			audio_play_sound(snd_enemy_die2, 1, 0);
	
	
			instance_destroy();
	}