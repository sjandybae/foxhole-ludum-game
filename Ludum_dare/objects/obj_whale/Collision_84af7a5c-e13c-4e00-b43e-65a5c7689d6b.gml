with(other){

	if(vsp > 0 && grabbed == 0){
		vsp = -7
		audio_play_sound(snd_bounce, 1, 0)
		other.wobble = 0
	}

}
