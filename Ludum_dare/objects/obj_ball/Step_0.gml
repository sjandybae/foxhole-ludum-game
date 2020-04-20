#region

angle += 0.3;
if(angle >= pi*2)
	angle = pi*(-2);

if(!land)
	rot += (hsp + abs(vsp) * facing ) * -1.5


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
		
	//in water
	if(place_meeting(x, y-8, obj_water)){
		
		if(global.water_lvl <= 50){
			var _vsp = -8/max(1, (global.water_lvl)/2)
			rot = Approach(rot, 0, 1)
		}
		else
			var _vsp = 0.5
		
		hsp = Approach(hsp, 0, weight/40)
		vsp = lerp(vsp, _vsp, 0.05)
		
		in_water = true
	}
	else
		in_water = false
		
		
		
	
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
	
	if(place_meeting(x, y+abs(vsp), obj_jumpthrough) && !place_meeting(x, y, obj_jumpthrough) && vsp > 0){
		if (!place_meeting(x, y+sign(vsp), obj_jumpthrough))
		{
			y = y + sign(vsp);
		}
			
		//if(place_meeting(x, y-1, obj_block))
			//	vsp = (vsp * -1);
			
			//else
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
		
			
	}
	
	#endregion

	
	//In air/ not in air
	var platform = place_meeting(x, y+1, obj_jumpthrough) && !place_meeting(x, y, obj_jumpthrough);
	
	if (place_meeting(x, y+1, obj_block) || platform)
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
	
	//persistent = true	
	
}

#endregion


