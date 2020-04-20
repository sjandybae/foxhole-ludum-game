with(other){

	if(vsp > 0 && grabbed == 0){
		vsp = -7
		other.wobble = 0
		
		audio_play_sound(snd_bounce, 1, 0)
		if (global.water_lvl > 0) {
			audio_play_sound(snd_splash, 1, 0)
			global.whale_hp += global.water_lvl*2
			global.water_lvl = 0
		}
		else {
		
		}
	}

}
