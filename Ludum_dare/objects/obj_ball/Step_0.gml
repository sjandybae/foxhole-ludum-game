#region

angle += 0.3;
if(angle >= pi*2)
	angle = pi*(-2);

rot += (hsp + abs(vsp) * facing ) * -1.5

/*if(grabbed == 0)
	active = true
else
	active = false*/

//Burning in fire
/*if(place_meeting(x, y, obj_spark) && flamable == true && burning < 1){
	burning += 0.002
	if(burning == 0.002)
		audio_play_sound(snd_fire_ball_hit, 1, 0)
}*/

/*if(burning > 0 && burning < 1 && in_water == false && place_meeting(x, y, obj_spark)){
	CreateEffectDepth(obj_spark, x + lengthdir_x(random_range(sprite_width/(-2), sprite_width/2), rot) + random_range(-1, 1), y + lengthdir_y(random_range(sprite_height/(-2), sprite_height/2), rot) * image_xscale + random_range(-1, 1), self.depth - 1, c_white, false)
	//CreateEffectDepth(obj_steam, x + lengthdir_x(random_range(sprite_width/(-2), sprite_width/2), rot) + random_range(-1, 1), y + lengthdir_y(random_range(sprite_height/(-2), sprite_height/2), rot) * image_xscale + random_range(-1, 1), self.depth, c_white, false)
}*/

if(burning >= 1)
	burning = 1;

//Bouncing squish
	if(h_squish != 1)
		h_squish = Approach(h_squish, 1, 0.1)
		
	if(v_squish != 1)
		v_squish = Approach(v_squish, 1, 0.1)

if(grabbed ==  0)
{ 
	
	//Destroying when inside a block
	if(collision_rectangle(x, y, x, y, obj_block, 0, 0))
		instance_destroy();
	
	//Not equipped
	slot = "empty"
	
	//Moving out of wall
	if(place_meeting(x, y, obj_block)){
		
		if((obj_player.x-x) > 0)
			move_outside_all(0, 1)
			
		if((obj_player.x-x) < 0)
			move_outside_all(180, 1)
	}
	
	
	//Depth
	if(instance_exists(obj_player))
		depth = obj_player.depth + 1
	
	//Facing direction
	facing = sign(hsp)
	
	persistent = false
	
	if( abs(hsp + vsp) < 1 )
		reflected = false
	
	if(bounce_sound == snd_rock)
		audio_sound_pitch(bounce_sound, random_range(0,5))
	else
		audio_sound_pitch(bounce_sound, random_range(0.9,1.1))
	
	//Frinction
	if(land)
		hsp = Approach(hsp, 0, weight/5)
		
	if(place_meeting(x, y, obj_water))
		hsp = Approach(hsp, 0, weight/20)
		
	if(!land && place_meeting(x, y, obj_water))
		vsp = Approach(vsp, 2, 0.25)
	
	//Building potential energy
	if(land == false){
		for(i = 0; i < vsp-(weight*3); i += 0.01)
		{
			p_eng = i;	
		}
	}
	else
		p_eng = 0;
	
	//Vertical movement
	if(in_water == false)
		vsp = vsp + grav;

	var hsp_final = hsp + hsp_carry;
	hsp_carry = 0;



	//Horizontal collision	
	if(is_sticky == false){
	
		if (place_meeting(x+hsp_final, y, obj_block))
		{
		
			yplus = 0;
	
			while(place_meeting(x + hsp_final, y - yplus, obj_block) && yplus <= abs(1 * hsp_final)) yplus += 1;
	
			if(place_meeting(x + hsp_final, y - yplus, obj_block)){
		
				while (!place_meeting(x+sign(hsp_final), y, obj_block))
				{
					x = x + sign(hsp_final);
				}

				//Bouncing
				if(hsp_final != 0 && vsp != 0 && can_bounce)
				{
					if(rendered == true)
						audio_play_sound(bounce_sound, 1, 0);
					instance_create_depth(x,y,-100,obj_splash);
					h_squish = 0.5
					v_squish = 1.5
				}

				if(can_bounce){
				
					//vsp = -abs(hsp)
					hsp_final = (hsp_final * -1)/2;
					hsp = (hsp * -1)/2;
				}
				else
					hsp_final = 0;
		
				if(grav ==0)
					grav = 0.5;
		
			}
			else{
				y -= yplus
				hsp = Approach(hsp, 0, 0.1)
			}
		
		}
	}
	else{
		if (place_meeting(x, y, obj_block)){
			hsp_final = 0;
			hsp = 0;
			p_eng = 0;
		}
	
	}
	x = x + hsp_final;


	//Back drop
	//var platform = instance_place(x, y + vsp + 2, obj_backdrop)

	#region
	/*if(platform && boomerang == false){

		if(bbox_bottom < platform.bbox_top){
			
			while (!place_meeting(x, y+sign(vsp), platform))
			{
				y = y + sign(vsp);
			}
	
			//hsp_carry = platform.hsp;
			//y += platform.vsp
	
			//Bouncing
			if(place_meeting(x, y-1, platform))
				vsp = (vsp * -1);
			
			else
				vsp = -p_eng;
			//*********
		
			if(vsp != 0)
			{
				hit = 0;
				if(rendered == true)
					audio_play_sound(bounce_sound, 1, 0);
					
				instance_create_depth(x,y,-100,obj_splash);
				instance_create_depth(x,y,-100,obj_dust);
				h_squish = 1.5
				v_squish = 0.5
			}
		
			land = true;
		
			if(grav ==0)
				grav = 0.5;
			}
		
	}*/
	#endregion

	
	//In air/ not in air
	if (place_meeting(x, y+1, obj_block))
		land = true;
	else
		land = false;



	//Vertical collision
	if(is_sticky == false){
	
		if (place_meeting(x, y+vsp, obj_block))
		{
			while (!place_meeting(x, y+sign(vsp), obj_block))
			{
				y = y + sign(vsp);
			}
	
			//Bouncing
			if(place_meeting(x, y-1, obj_block))
				vsp = (vsp * -1);
			
			else
				vsp = -p_eng;
			//*********
		
			if(abs(vsp) > 1)
			{
				hit = 0;
				if(rendered == true)
					audio_play_sound(bounce_sound, 1, 0);
				instance_create_depth(x,y,-100,obj_splash);
				h_squish = 1.5
				v_squish = 0.5
			}
		
			land = true;
		
			if(grav ==0)
				grav = 0.5;
		
		}
	
	}
	else{
		
		if (place_meeting(x, y, obj_block)){
			vsp = 0
			p_eng = 0
		}
		
	}

	y = y + vsp;
}

else if(grabbed == 1){
	
	depth = obj_player.depth - 1
	
	hsp = 0;
	vsp = 0;
	p_eng = 0;
	
	image_xscale = obj_player.image_xscale;
	
	var _x = 4
	
	x = obj_player.x + (_x * obj_player.face) 
	y = obj_player.y+8
	
	rot = 0
	
	persistent = true	
	
}

#endregion


