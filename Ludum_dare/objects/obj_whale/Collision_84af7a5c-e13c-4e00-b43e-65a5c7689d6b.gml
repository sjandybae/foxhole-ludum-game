with(other){

	if(vsp > 0 && grabbed == 0){
		vsp = -10
		other.wobble = 0
		
		audio_play_sound(snd_bounce, 1, 0)
		if (global.water_lvl > 0) {
			audio_play_sound(snd_splash, 1, 0)
			global.whale_hp += global.water_lvl*2
			global.water_lvl = 0
			
			
			for(var i = 0; i <= 10; i++)
				instance_create_depth(x, y, depth-1,obj_droplet)
			
			
		}
		else {
		
		}
	}

}
