
if(global.overworld == false){

#region
/*//Reflected ball
if(hurt == false && invinsible == false && other.reflected == true){
	
	hurt = true;
	invinsible = true;
	
	if(x < other.x)
		hsp = (2 + (random_range(-0.5, 0.5)) ) * (-1);
	
	if(x > other.x)
		hsp = (2 + (random_range(-0.5, 0.5)) );
		
	vsp = -4;
	hp -= 3
	CreateEffectDepth(obj_hit_spark, x, y, depth-1, c_white, snd_hit)
	
	other.reflected = false;
	
	alarm_set(4, 200)
}


//Grab and throwing
if(hurt == true && grab != 2){
	
	if(global.slot_1[1] == "ball"){
		global.slot_1[0].grabbed = 0
		global.slot_1[0] = "empty"
		global.slot_1[1] = "empty"
	}
	
	if(global.slot_2[1] == "ball"){
		global.slot_2[0].grabbed = 0
		global.slot_2[0] = "empty"
		global.slot_2[1] = "empty"
	}
	
}


if(possessed == false && hurt == false){
	
	if(trigger == false){
		
		if(distance_to_object(other) <= 10 && grab_key_hold && other.grabbed == 0 && throw == 0 && pick == 0 && other.hit == 0 && (global.slot_1[0] == "empty" || global.slot_2[0] == "empty") && global.slot_1[1] != "ball")
		{

			audio_play_sound(snd_pick, 1, 0);
			other.grabbed = 1;
			
			if(other != obj_stick)
				grab = 1;
				
			if(global.slot_1[0] != "empty" && global.slot_2[0] == "empty"){
				
				global.slot_2[0] = other
				global.slot_2[1] = global.slot_2[0].type
				
				global.slot_2[0].slot = 2
			}

			if(global.slot_1[0] == "empty"){
				
				global.slot_1[0] = other
				global.slot_1[1] = global.slot_1[0].type
				
				global.slot_1[0].slot = 1
			}
				
			pick = 1
				
			alarm_set(2, 5);
			ball_jump = 0;
	
		}

		

		if(kick_key && pick == 0)
		{
			if( grab != 0  && throw == 0 /*&& pick == 1)
			{
				if(other.grabbed == 1)
				{
					//other.rot = 90;
					
					//other.grabbed = 0;
				
					var thrown;
				
					if(global.slot_1[0] != "empty" && global.slot_2[0] == "empty"){
						with(global.slot_1[0]) grabbed = 0
						//global.slot_1[0] = "empty"
						thrown = global.slot_1[0]
						global.slot_1[1] = "empty"
					}
				
					if(global.slot_1[0] != "empty" && global.slot_2[0] != "empty"){
						with(global.slot_2[0]) grabbed = 0
						//global.slot_2[0] = "empty"
						thrown = global.slot_2[0]
						global.slot_2[1] = "empty"
					}
				
					thrown.x = x-4 * image_xscale;
					thrown.y = y-5;
				
					//throw = 1;
				
					if(thrown.hit == 0){
						with(thrown){
							alarm_set(0,10);	
						}
					}
				
					thrown.hit = 1;
			
					/*if(up_key)
					{
						thrown.hsp = hsp*1.05;
						thrown.vsp = -15/thrown.weight;
					
						audio_play_sound(snd_throw, 1, 0);
					}
			
					else
					if(down_key)
					{
						if(vsp == 0){
							throw = 0;
							thrown.vsp = 2;
						}
						
						else{
							thrown.hsp = hsp*1.05;
							thrown.vsp = 15;
							thrown.p_eng += 3;
							vsp = -5
					
							audio_play_sound(snd_throw, 1, 0);
					
						}
					}
			
					else
					{
						thrown.hsp = (6 * face)/thrown.weight + hsp/2;
						thrown.vsp = -9;
						audio_play_sound(snd_throw, 1, 0);
					}
			
						if(thrown == global.slot_1[0])
							global.slot_1[0] = "empty"
							
						if(thrown == global.slot_2[0])
							global.slot_2[0] = "empty"
			
						image_index = 0;
						pick = 0;
						grab = 0;
						kick = 0;
						//other.grav = 0
						global.equipped = false
				}
		
			}
		}
	
	}
	
	if(trigger == true){
		
		if(jinn_key_hold && other.hit == 0 && other.grabbed == 0)
		{

			//audio_play_sound(snd_pick, 1, 0);
			other.grabbed = 2;
			audio_play_sound(snd_pick, 1, 0)
			alarm_set(2, 5);
			ball_jump = 0;
			ammo += 1
			
			other.slot = ammo
	
		}
		
	}
	

	//Ball jumping
	/*if(ledge_grab == false && (((other.hsp != 0 || other.vsp != 0) && other.grav != 0 && jump_key_hold && other.hit == 0 && other.grabbed == 0) || (kick == 8 && !kick_key_hold && land == false && other.grabbed != 1 && (other.hsp != 0 || other.vsp != 0)) || (jump_key_press && grab_key_press) || (other.boomerang == true && jump_key_hold && kick != 7)) )
	{
		if(ball_jump == 0)
			image_index = 0
		
		if(grab == 0)
			ball_jump = 1;
			
		throw = 0;
		squish = 1.5
	
		//alarm_set(4,25);
		audio_play_sound(snd_balljump, 1, 0);
		audio_play_sound(other.bounce_sound, 1, 0);
		instance_create_depth(x,y+10,-100,obj_splash);
		vsp = jspd;
		
		if(other.hit == 0){
			with(other){
				alarm_set(0,5);	
			}
		}
		
		other.vsp = 10;
		other.hit = 1;
	}


}*/
 
 
#endregion

}

if(hurt == false && invinsible == false && other.reflected == true){
			
	hp -= 1;
	hurt = true;
	invinsible = true;
	
	recoil_angle = -20*face
	
	hsp = 3*sign(x - other.x)
		
	vsp = -4;
	
	CreateEffect(obj_hit_spark, x, y, "Effects", c_white, snd_hit)
	
	alarm_set(4, 50)
	
	alarm_set(2, 10)
}

if(ammo_type == "junk" && ammo < max_ammo && can_fire == true && can_throw == true){

	junk_ammo[ammo] = other.sprite_index
	junk_ammo[ammo+3] = other.image_index
	
	ammo += 1
	audio_play_sound(snd_bumb, 1, 0)
	
	instance_destroy(other)
	
}
	