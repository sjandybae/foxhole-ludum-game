if(other.hit == 1 && hit == 0 ){
	hsp = other.hsp;
	other.hsp = other.hsp * -0.75
	
	vsp = -3;
	other.vsp = -3;
	
	instance_create_depth(x, y, 1, obj_splash)
	audio_play_sound(snd_kick, 1, 0)
	
	hit = 1;
		
}

if(other.hit == 0 && hit == 0){

	move_contact_all(0, 2)
	
}