if(grabbed = 0 && ((hsp != 0 || vsp != 0)) && (other.hit == 0)){

	//Enemey is hit
	with(other){
		
		hsp = -3 * sign(other.x - x)
		vsp = -3;
		
		hit = 1
		combo = 1;
		alarm_set(0, 10);
	}

	//Damaging the enemey
	
	instance_create_depth(x, y, depth-1, obj_splash)
	
	audio_play_sound(snd_kick, 1, 0)

	//Ball rebounding
	hsp = hsp * (-0.8)
	vsp = -6;


}
	