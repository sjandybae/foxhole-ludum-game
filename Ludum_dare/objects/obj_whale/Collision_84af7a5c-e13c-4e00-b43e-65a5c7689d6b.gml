with(other){

	if(vsp > 0 && grabbed == 0){
		vsp = -10
		hsp = hsp * -0.9 
		other.wobble = 0
		
		audio_play_sound(snd_bounce, 1, 0)
		if (global.water_lvl > 0) {
			audio_play_sound(snd_splash, 1, 0)
			global.whale_hp += global.water_lvl * 3
			global.water_lvl = 0
			
			other.emotion = "happy"
			global.happy_timer = 120;
			
			with(other){
				alarm[0] = 120
			}
			
			for(var i = 0; i <= 10; i++)
				instance_create_depth(x, y, depth-1,obj_droplet)
			
			
		}
		else {
		
		}
	}

}
