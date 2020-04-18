

//on ground
if(land == true){
	
	//Legs
	if(move != 0 && can_fire == true){
		
		if(aim_invert_down_key_hold || aim_invert_up_key_hold)
			leg_sprites = spr_reverse_legs
		else
			leg_sprites = spr_run_legs
		
		timeline_index = tim_run;

		
		timeline_speed = 0.27 * max(0.5, abs(hsp)/4);
			
		timeline_running = true;
		timeline_loop = true

	}
	else{
		timeline_running = false
		
		leg_sprites = spr_idle_legs
		
		leg_index = image_index
	}
	
	
	//torso
	if(throw == true){
		sprite_index = spr_throw_grenade
		image_speed = 1.3
		
		if(image_index > 3)
			throw = false
	}
	
	//Running torso
	else if(move != 0 && can_fire == true && (aim == "left" || aim == "right") ){
		sprite_index = spr_run_torso
		image_index = leg_index
		
		if(abs(hsp) > 5)
			recoil_angle = -15*face
	}
	
	else{
		sprite_index = spr_idle_torso
	
		if(aim == "right" || aim == "left")
			image_index = 0
		
		else if(aim == "up")
			image_index = 1
		
		else if(aim == "up_right" || aim == "up_left")
			image_index = 2
		
		else if(aim == "down_right" || aim = "down_left")
			image_index = 3
		
		else if(aim == "down")
			image_index = 4
	}
	
}



//in air
if(land == false){

	timeline_speed = 0;
	timeline_position = 0;
	x_pos = 0
	y_pos = 0

	if(ball_jump == true && can_fire == true && throw == false){
		sprite_index = spr_ball_jump
		
		
		image_speed = 3
	}
	
	else if(throw == true){
		sprite_index = spr_throw_grenade
		image_speed = 1.3
		
		if(image_index > 3)
			throw = false
			
		spin_angle = 0
		
		leg_sprites = spr_idle_jump_legs
	}
		
	else{
		sprite_index = spr_idle_torso
		
		leg_sprites = spr_idle_jump_legs
		leg_index = sprite_index
	
		if(aim == "right" || aim == "left")
			image_index = 0
		
		else if(aim == "up")
			image_index = 1
		
		else if(aim == "up_right" || aim == "up_left")
			image_index = 2
		
		else if(aim == "down_right" || aim = "down_left")
			image_index = 3
		
		else if(aim == "down")
			image_index = 4
	}
	
}


//Cannon lights
if(ball_jump == true)
	light_sprites = spr_cannon_light_spin
	
else if(throw == true)
	light_sprites = spr_cannon_throw
	
else
	light_sprites = spr_cannon_lights



