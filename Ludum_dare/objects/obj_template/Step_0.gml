//event_inherited()
//polygon = polygon_from_instance(id)


//template control panel
if(global.pause == false){
#region
//Possessed movement

if(possess == true)
{
	//Movement
	if(hit == 0)
		move = obj_player.right_key - obj_player.left_key;

	//Facing direction
	if(obj_player.right_key_press)
		face = 1;
	
	if(obj_player.left_key_press)
		face = -1;
		

	//Horizontal movement
	if(move != 0){
		
		if(land == true && hit == 0)
			hsp = Approach(hsp, max_speed * move, incr )
				
		if(land == false)
			hsp = Approach(hsp, max_speed * face, incr )
	
	}

	if(move == 0 && vsp == 0 )
	{
			
		if(place_meeting(x, y+1, obj_slope) && yplus == 0)
			hsp = Approach(hsp, 0, incr/4)
		else
			hsp = Approach(hsp, 0, incr)
	}
		
		
	//Jumping
	if( (place_meeting(x, y+1, obj_block) || place_meeting(x, y+1, obj_backdrop) && obj_player.jump_key_press) && !place_meeting(x, y-8, obj_block))
	{
		if (obj_player.jump_key_press){
			vsp = jspd;
			audio_play_sound(snd_jump, 1, 0);
		}
	}
	
	if(vsp < 0)
	{
		if(obj_player.jump_key_release)
			vsp*=0.5;
	}
	
	//getting not possessed
	if( (obj_player.jinn_key || global.jinn_meter == 0) && !place_meeting(obj_player.x, obj_player.y-8, obj_block))
	{
		if(obj_player.possessed == true){
			possess = false;
			obj_player.vsp = -7;
			obj_player.kick = 0;
			obj_player.ball_jump = true;
			
			with(obj_player){
				invinsible = true;
				alarm_set(4, 200)
			}
			
			CreateEffectDepth(obj_hit_spark, x, y, depth-1, c_white, snd_hit)
			audio_play_sound(snd_hit, 1, 0)
			
			vsp = -3;
			hp -= 2;
			hsp = 4 * sign(obj_player.x - x);
			hit = 1;
			
			//Reverting hp back to normal
			max_hp = max_hp - max_hp/2
			hp = hp - hp/2
			
			obj_jinn.swoop = false;
			obj_player.possessed = false;
		}
		
		else{
			persistent = false;
			//scr_slide_transition(TRANS_MODE.RETURN, global.room_stay)
			obj_jinn.following = obj_player;
			//room_goto(global.room_stay)
			obj_jinn.swoop = false;
		}
	}
	
}

//On the ground or not
if(!place_meeting(x, y+1, obj_block) && !place_meeting(x, y+1, obj_backdrop))
		land = false
	else
		land = true

var hsp_final = hsp + hsp_carry;
hsp_carry = 0;

//Moving outside of wall
if(place_meeting(x, y, obj_block))
	move_outside_all(90*image_xscale, 1)

//Horizontal collision
if (place_meeting(x+hsp_final, y, obj_block))
{
	//Slope
	yplus = 0;
	
	while(place_meeting(x + hsp_final, y - yplus, obj_block) && yplus <= abs(1 * hsp_final)) yplus += 1;
	
	if(place_meeting(x + hsp_final, y - yplus, obj_block)){
	
		while (!place_meeting(x+sign(hsp_final), y, obj_block))
		{
			x = x + sign(hsp_final);
		}


		if(counter == true){
			hsp_final = hsp_final * -0.5
			hsp = hsp * -0.5
			vsp = -7
			CreateEffect(obj_hit_spark, x, y, "Effects", c_white, snd_kick)
			counter = false;
		}

		else{
			hsp_final = 0;
			hsp = 0;
		}

		
	}
	else
	{
		y -= yplus;	
	}
	
	
}
x = x + hsp_final;


//Down slope
	if(hsp_final != 0){
		if(place_meeting(x, y+vsp+2, obj_slope)){
			
			while(!place_meeting(x + hsp_final, y+vsp, obj_block))//if(!place_meeting(x+hsp_final, y+vsp, obj_slope))
			{
				y += 1;
			}
		}
	}

//Vertical collision
var platform = instance_place(x, y + vsp, obj_backdrop)

if(platform){

	if(bbox_bottom < platform.bbox_top){
		while (!place_meeting(x, y+sign(vsp), platform))
		{
			y = y + sign(vsp);
		}
	
		hsp_carry = platform.hsp;
	
		land = true;
	
		vsp = 0;
	}
}

//verticel collision

if (place_meeting(x, y+vsp, obj_block))
{
	while (!place_meeting(x, y+sign(vsp), obj_block))
	{
		y = y + sign(vsp);
	}
	
	land = true;
	
	
	if(floor_bounce == true){
		vsp = -6
		CreateEffect(obj_hit_spark, x, y + sprite_width/2, "Effects", c_white, snd_kick)
		floor_bounce = false;
	}
		
	else
		vsp = 0;
}

if(vsp != 0)
	land = false;

y = y + vsp;

//Vertical movement
if(grav != 0){

	if(land == false)
		vsp = vsp + grav;
	if(vsp > 9.8)
		vsp = 9.8;
	
}

#endregion
}

else
	image_speed = 0;
