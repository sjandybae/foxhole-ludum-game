if(land == false){

	if(!collision_rectangle(x-16, y-16, x, y-15, obj_block, false, false) && vsp > 0){
		if(ledge_grab == false)
			audio_play_sound(snd_step, 1, 0)
			
		face = -1;
		ledge_grab = true;
		vsp = 0;
	}
	else if(!collision_rectangle(x+16, y-16, x, y-15, obj_block, false, false) && vsp > 0){
		if(ledge_grab == false)
			audio_play_sound(snd_step, 1, 0)
		
		face = 1;
		ledge_grab = true;
		vsp = 0;
	}

}
