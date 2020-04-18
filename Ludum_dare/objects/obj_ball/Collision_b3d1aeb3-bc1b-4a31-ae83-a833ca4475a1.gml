if(hit == 0 && grabbed == 0){

	if(obj_player.slide == false){

		if(obj_player.kick == 1){

			if(obj_player.up_key)
				{
					hsp = obj_player.hsp + 1*obj_player.face;
					vsp = (-17 + (random_range(-0.5,0.5)) )/weight;
				}
			
				else if(obj_player.down_key){
			
					hsp = obj_player.hsp + 3*obj_player.face;
					
					if(obj_player.land == false){
						vsp = 20;
						p_eng += 8;
					}
				}
			
				else
					{
						hsp = (10 * obj_player.face)/weight + obj_player.hsp;
						vsp = -4;
					}
		}
		
		if(obj_player.kick == 5){
			hsp = obj_player.hsp + 3*obj_player.face;
			vsp = (-17 + (random_range(-0.5,0.5)) )/weight;
		}
		
			
	}
	else{
		vsp = (abs(obj_player.hsp) * -2)/weight
		hsp = obj_player.hsp * -0.5
	}
			
	instance_create_layer(x, y, "Effects", obj_splash)
	audio_play_sound(snd_kick, 1, 0)
	hit = 1;
	
	reflected = false;
	
	alarm_set(0,10);

}
