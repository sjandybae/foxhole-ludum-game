//Grabbing and throwing bucket

//Placing bucket down
if(down_key_press && other.grabbed == 1){
	
	other.x = x
	other.rot = 0
	other.land = false
	
	throw = true
	hold = false
	
	alarm[0] = 5
	
	squish = 0.8
	
	other.grabbed = 0
}

//Throwing bucket
if(grab_key_press && other.grabbed == 1){
	
	//global.water_lvl = 0
	
	squish = 0.8
	
	other.grabbed = 0
	
	//thorwing up
	if(up_key){
		other.hsp = hsp
		other.vsp = -9
	}
	
	else{
		other.hsp = face*5
		other.vsp = -6
	}

	audio_play_sound(snd_throw, 1, 0)
	hold = false
	throw = true
	
	alarm[0] = 5
	
}

//Picking up bucket
else if(grab_key_hold && other.grabbed == 0 && throw == false && !crawl){
	
	other.rot = 0;
	other.grabbed = 1
	
	hold = true
	
}

//Nudgeing bucket
if(other.grabbed == 0){
	
	if(crawl){
		other.hsp = hsp*2
	}
	
}




//Bucket knocked
if(bucket_knocked == true){
	
	//global.water_lvl = 0
	
	squish = 0.8
	
	other.grabbed = 0
	
	other.hsp = face*-5
	other.vsp = -6

	audio_play_sound(snd_throw, 1, 0)
	hold = false
	throw = true
	bucket_knocked = false
	
	alarm[0] = 5
	
}

