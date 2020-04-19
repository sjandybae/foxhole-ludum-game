//On ground

if(onground){
	
	//Standing
	if(!crawl){
	
		//idle
		if(abs(hsp) < 0.1){
			if hold == false sprite_index = spr_idle

			else sprite_index = spr_idle_hold
		}
		
		//moving
		else{
			if(hold)
				sprite_index = spr_run_hold
			else
				sprite_index = spr_run
	
			image_speed = abs(hsp)/2
		}
	
	}
	
	//Crawling
	else
		sprite_index = spr_crawl
}

//In air
else{

	sprite_index = spr_jump
	
}



