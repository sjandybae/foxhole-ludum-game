//On ground

if(onground){
	
	//Standing
	if(!crawl){
	
		if hold == false sprite_index = spr_idle

		else sprite_index = spr_idle_hold
	
	}
	
	//Crawling
	else
		sprite_index = spr_crawl
}

//In air
else{

	sprite_index = spr_jump
	
}



