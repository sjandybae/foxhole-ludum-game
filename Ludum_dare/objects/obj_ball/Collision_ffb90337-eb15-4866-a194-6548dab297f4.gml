/*if(reflected == false && grabbed = 0 && reflected == false && ((hsp != 0 || vsp != 0) || boomerang == true) && (other.hit == 0 || other.combo == 0) && other.possess == false){

	//Enemey is hit
	with(other){
		
		hsp = -3 * sign(other.x - x)
		vsp = -3;
		
		hit = 1
		combo = 1;
		alarm_set(0, 10);
	}

	//Damaging the enemey
	
	instance_create_depth(x, y, depth-1, obj_hit_spark)
	
	if(other.counter == false)
		audio_play_sound(snd_kick, 1, 0)
	else
		audio_play_sound(snd_counter_hit, 1, 0)

	//Ball rebounding
	hsp = -2 * facing;
	vsp = -3;


}
	