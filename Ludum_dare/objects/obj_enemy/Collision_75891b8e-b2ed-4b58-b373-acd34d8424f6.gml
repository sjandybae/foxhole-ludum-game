if(hit == 0 || combo == 0){
	
	instance_create_depth(x, y, 1, obj_hit_spark)
	audio_play_sound(snd_hit, 1, 0)
	
	if(obj_player.slide == false)
		hsp = obj_player.hsp/2 + (obj_player.face * 4);
	
	if(obj_player.kick == 1)
		vsp = -3;
		
	if(obj_player.kick == 2)
		vsp = -9;
		
	if( (obj_player.kick == 1 && obj_player.run > 0) || obj_jinn.pawnch == true){
			
		//if(obj_player.face == face && counter == false){
			counter = !counter

			room_speed = 10
				
				
			if(obj_jinn.pawnch == true)
				global.zoom = 128;
			else
				global.zoom = 64;
				
			alarm_set(10, 1);
			
			if(obj_jinn.pawnch == true){
				hp -= 5
				floor_bounce = true
			}
			else
				hp -= 2;
			
			instance_create_depth(x, y, 1, obj_hit_spark)
			audio_play_sound(snd_hit, 1, 0)
			
		//}
			
		vsp = -8;
	}
		
	if(obj_player.slide == true)
		vsp = -7
		
	if(obj_player.trigger == false)
		hp -= 1;
		
	else
		hp -= 3;
		
	hit = 1;
	combo = 1;
	
	alarm_set(0, 10);
}