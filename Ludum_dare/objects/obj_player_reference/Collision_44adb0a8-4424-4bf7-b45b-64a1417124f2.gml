if(hurt == false && invinsible == false && other.player_id != self){
	
	hp -= other.damage;
	hurt = true;
	invinsible = true;
	
	if(x < other.x)
		hsp = (4 + (random_range(-0.5, 0.5)) ) * (-1);
	
	if(x > other.x)
		hsp = (4 + (random_range(-0.5, 0.5)) ) ;
		
	vsp = -4;
	
	instance_create_layer(x, y, "Effects", obj_hit_spark)
	audio_play_sound(snd_hit, 1, 0)
	
	alarm_set(4, 50)
	
	alarm_set(2, 10)
}
