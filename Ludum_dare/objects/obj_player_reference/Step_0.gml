
//has control or not
if(global.multiplayer_mode == false)
	persistent = true
else
	persistent = false

if(obj_transition.mode == TRANS_MODE.RETURN) || (hurt == true)
	has_control = false
else if(blasted == false && global.cutscene == false)
	has_control = true
	
//Getting hurt

if(global.multiplayer_mode == false){
	
	if(global.connected_cont[player_no - 1] != 12)
		cont_port = global.connected_cont[player_no - 1]
	else
		cont_port = 11
	
}

if(has_control == true){
#region

	//Player 1 controls
	#region
		
		var threshold = 0.5

		
		if(gamepad_axis_value(cont_port, gp_axislv) <= -threshold)
			analogue_up = 1;
		else
			analogue_up = 0;
			
		if(gamepad_axis_value(cont_port, gp_axislv) >= threshold)
			analogue_down = 1;
		else
			analogue_down = 0;
			
		if(gamepad_axis_value(cont_port, gp_axislh) >= threshold)
			analogue_right = 1;
		else
			analogue_right = 0;
			
		if(gamepad_axis_value(cont_port, gp_axislh) <= -threshold)
			analogue_left = 1;
		else
			analogue_left = 0;
		
		up_key = (keyboard_check(vk_up) && cont_port == 11) || gamepad_button_check(cont_port, gp_padu) || analogue_up
		down_key = (keyboard_check(vk_down)&& cont_port == 11)  || gamepad_button_check(cont_port, gp_padd) || analogue_down

		up_key_press = (keyboard_check_pressed(vk_up) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_padu);
		up_key_release = (keyboard_check_released(vk_up) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_padu);

		down_key_press = (keyboard_check_pressed(vk_down) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_padd);
		down_key_release = (keyboard_check_released(vk_down) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_padd);

		right_key = (keyboard_check(vk_right) && cont_port == 11)  || gamepad_button_check(cont_port, gp_padr) || analogue_right
		left_key = (keyboard_check(vk_left) && cont_port == 11)  || gamepad_button_check(cont_port, gp_padl) || analogue_left

		right_key_press = (keyboard_check_pressed(vk_right) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_padr);
		left_key_press = (keyboard_check_pressed(vk_left) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_padl);

		jump_key_hold = (keyboard_check(ord("Z")) && cont_port == 11)  || gamepad_button_check(cont_port, gp_face1);
		jump_key_press = (keyboard_check_pressed(ord("Z")) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_face1);
		jump_key_release = (keyboard_check_released(ord("Z")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_face1);

		jinn_key = (keyboard_check_pressed(ord("D")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_face2);
		kick_key = (keyboard_check_pressed(ord("A")) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_face3);
		kick_2_key = (keyboard_check_pressed(ord("S")) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_face4);

		kick_key_hold = (keyboard_check(ord("A")) && cont_port == 11)  || gamepad_button_check(cont_port, gp_face3);
		kick_2_key_hold = (keyboard_check(ord("S")) && cont_port == 11)  || gamepad_button_check(cont_port, gp_face4);
	
		kick_key_release = (keyboard_check_released(ord("A")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_face3);

		grab_key_press = keyboard_check_pressed(ord("X")) //|| gamepad_button_check_released(4, gp_face4);
		grab_key_hold = keyboard_check(ord("X")) //|| gamepad_button_check(4, gp_face4);

		skill_key = (keyboard_check_pressed(ord("C")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_shoulderr);

		inventory_key = (keyboard_check_pressed(ord("V")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_shoulderr);

		create_key = (keyboard_check_pressed(ord("F")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_shoulderr);

		aim_down_key_press = (keyboard_check_pressed(ord("F")) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_shoulderl);
		aim_down_key_hold = (keyboard_check(ord("F")) && cont_port == 11)  || gamepad_button_check(cont_port, gp_shoulderl);
		aim_down_key_release = (keyboard_check_released(ord("F")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_shoulderl);

		aim_up_key_press = (keyboard_check_pressed(ord("C")) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_shoulderr);
		aim_up_key_hold = (keyboard_check(ord("C")) && cont_port == 11)  || gamepad_button_check(cont_port, gp_shoulderr);
		aim_up_key_release = (keyboard_check_released(ord("C")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_shoulderr);

		aim_invert_down_key_press = (keyboard_check_pressed(ord("G")) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_shoulderlb);
		aim_invert_down_key_hold = (keyboard_check(ord("G")) && cont_port == 11)  || gamepad_button_check(cont_port, gp_shoulderlb);
		aim_invert_down_key_release = (keyboard_check_released(ord("G")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_shoulderlb);

		aim_invert_up_key_press = (keyboard_check_pressed(ord("V")) && cont_port == 11)  || gamepad_button_check_pressed(cont_port, gp_shoulderrb);
		aim_invert_up_key_hold = (keyboard_check(ord("V")) && cont_port == 11)  || gamepad_button_check(cont_port, gp_shoulderrb);
		aim_invert_up_key_release = (keyboard_check_released(ord("V")) && cont_port == 11)  || gamepad_button_check_released(cont_port, gp_shoulderrb);



		inventory_key = 0 //keyboard_check_pressed(ord("V")) || gamepad_button_check_pressed(4, gp_shoulderl);

		create_key = keyboard_check_pressed(ord("F")) || gamepad_button_check_pressed(cont_port, gp_shoulderlb);
	
	#endregion
	
	
	
	//Input buffer frames
	var buffer_frame = 10;

	//Up key
	if(up_key_press)
		button8 = 0
	else
		button8 = Approach(button8, 0, 1)
	
	//Down key
	if(down_key_press)
		button2 = 0
	else
		button2 = Approach(button2, 0, 1)
	
	//Left key
	if(left_key_press)
		button4 = 0
	else
		button4 = Approach(button4, 0, 1)

	//Right key
	if(right_key_press)
		button6 = 0
	else
		button6 = Approach(button6, 0, 1)
		
	//Jump buffer
	if(jump_key_press)
		jump_button = buffer_frame
	else
		jump_button = Approach(jump_button, 0, 1)


#endregion
}
else{
#region
	up_key = 0
	down_key = 0

	up_key_press = 0
	down_key_press = 0

	right_key = 0
	left_key = 0

	right_key_press = 0
	left_key_press = 0

	jump_key_hold = 0
	jump_key_press = 0
	jump_key_release = 0

	jinn_key = 0
	jinn_key_hold = 0
	kick_key = 0
	kick_key_hold = 0

	grab_key_press = 0
	grab_key_release = 0
	grab_key_hold = 0

	run_key = 0

	skill_key = 0

	inventory_key = 0

	create_key = 0
	
#endregion
}

//interact button
global.interact_key = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1);


//Player control panel

//In the level
if(global.overworld == false && dead == false){
	#region

	//Player states
	
	//Hurt State
	if(hurt == true){
		player_state = "Hurt"
		kick = 0	
	}
	
	//Attack state
	if( kick != 0 ){
		
		state_type = "Attack"
		
		if(kick == 1)
			sub_state = "Kick"
			
		if(kick == 2)
			sub_state = "Normal_swing"
			
		if(kick == 3)
			sub_state = "Send_jinn"
			
		if(kick == 4)
			sub_state = "Up_swing"
			
		if(kick == 2 && down_key)
			sub_state = "Down_swing"
			
		if(kick == 5)
			sub_state = "Flash_kick"
	}
	
	//Moving state
	if(hsp != 0 && kick == 0)
		state_type = "Moving"
	
	if( move != 0 && slide == false && skid == false){

		if(abs(hsp) < 3)
			player_state = "Walk"
			
		else if(abs(hsp) > 3 && abs(hsp) <= 5)
			player_state = "Jog"
			
		else
			player_state = "Run"
	}
	
	//Sliding/Skiding state
	if(slide == true){
		player_state = "Slide"	
	}
	
	if(skid == true){
		player_state = "Skid"
	}
		
	//Standing State
	if( move == 0 && hsp == 0 && kick == 0){
		player_state = "Idle"
		if(kick == 0)
			state_type = "Standing"
	}
		
	//In air state
	if( !place_meeting(x-abs(hsp)*face, yprevious+1, obj_block) && !place_meeting(x-abs(hsp)*face, yprevious+1, obj_backdrop) && !place_meeting(x-abs(hsp)*face, yprevious+1, obj_crate)){
		
		player_state = "Air"
	}
	
	//Landing state
	if(player_state != "Air"){
		
		player_state = "Land"	
	}
		
	//Grabbing object state
	if(grab != 0 && kick == 0){
		
		if grab == 1
			sub_state = "Grab_ball"
				
		if grab == 2
			sub_state = "Grab_weapon"
	}
	
	if(throw != 0){
	
		sub_state = "Throwing"
	
	}

	
	//Jinn skill states
	
	if(skill_active){
		sub_state = jinn_skill
	}

	if(possessed == true){

		image_alpha = Approach(image_alpha, 0, 0.05);
		
		grab = 0;
		pick = 0;
		if(instance_exists(obj_ball))
			obj_ball.grabbed = 0;
		
	
		global.equipped = false;
	
		ledge_grab = false;
	
		ball_jump = false;
	
	}

	if(possessed == false){

	if(skill_active == true){
	
		if(jinn_skill == "Dash"){
			
			
			if(!down_key){
				hsp = Approach(max_speed, 8, 4) * face
				vsp = Approach(vsp, 0, 1)
			}
			
			
			if(image_index <= 1){
				CreateEffectDepth(obj_dust, x + 16 * face, y + 8 + random_range(-2, 2), depth - 1, c_white, false)
				instance_create_depth(x + random_range(-2, 2), y + random_range(-2, 2), depth, obj_feather)
			}
			
			if(land == true)
				instance_create_depth(x, y+24, -100, obj_dust);
		}
		
		if(jinn_skill == "Grapple" && grapple == true){
			if(jump_key_press || land == true){
				
				vsp = abs(hsp) * -1
				hsp = hsp
				
				skill_active = false
				grapple = false
				
			}
				
			vsp = Approach(vsp, 0, 1)				

			var Center_X = grapple_x
			var Center_Y = grapple_y

			Orbit = abs(grapple_x - temp_x) * 1.5

			// Orbital motion
			
			/*if(orbit_angle != 270 && orbit_angle > 270)
				hsp = Approach(hsp, 5, 0.1)
				
			if(orbit_angle != 270 && orbit_angle < 270)
				hsp = Approach(hsp, -5, 0.1)*/
			
			if(left_key)
				hsp = Approach(hsp, -9.8, 0.2)
				
			if(right_key)
				hsp = Approach(hsp, 9.8, 0.2)
			
			orbit_angle += hsp;
			
			if(orbit_angle != 270)
				orbit_angle = Approach(orbit_angle, 270, sign(hsp) * 5)
			
			
			if(orbit_angle >= 360) orbit_angle -= 360;

			// Update position
			x = lengthdir_x(Orbit, orbit_angle) + Center_X;
			y = lengthdir_y(Orbit, orbit_angle) + Center_Y;
				
		}
	
	}
	
	if(skill_active == false){
		temp_x = x;
		temp_y = y;	
	}
	
	//Aura
	aura += 0.1;
	if(aura >= pi*2)
		aura = pi*(-2);

	//Sprites
	if(squish != 0)
		squish = Approach(squish, 0, 0.1)
		
	mask_index = spr_player
		
	image_xscale = face;
	
	scr_drawplayer();

	/*if(trigger == false){
		if(kick == 0)
			scr_drawplayer();
	
		if(kick >= 1)
			scr_drawplayer_kick();
	}

	if(trigger == true){
		if(kick == 0)
			scr_drawplayer_pos();
	
		if(kick != 0)
			scr_drawplayer_kick_pos();
	}*/
	
	//Respawing
	if(land == true && !place_meeting(x, y, obj_spikes) && !place_meeting(x, y, obj_cannot_respawn)){
	
		respawn_x = xprevious-16 * face
		respawn_y = y;
	
	}
	

	//hurt
	if(hp >= max_hp)
		hp = max_hp

	if(hurt == true){
	
		if(grab != 2){
			grab = 0;
			pick = 0;
		}
		throw = 0;
		ledge_grab = false;
	}

	if(invinsible == true){

		blink += 1;
	
		if(blink == 5){
			visible = false;	
		}	

		if(blink >= 10){
			visible = true;	
			blink = 0;
		}

	}

	else{
		if(possessed == false && invinsible == false)
			visible = true;
	}

	if(possessed == false && hurt == false && has_control == true && grapple == false){
	
		//Movement
		/*if(landed == true)
			hsp = Approach(hsp, 0, 0.1)*/
	
		if(dash == false && slide == false){
			move = right_key - left_key;
		
		
		}
		
		if(ledge_grab)
			run = 1;

		//Facing direction
		if((skill_active == false ) && dash == false && slide == false && (kick == 0 || kick == 8) && ledge_grab == false) && (!aim_invert_down_key_hold && !aim_invert_up_key_hold){
			if(right_key){
				face = 1;
				
				if(land == true)
					alarm_set(7, 80)
			}
	
			if(left_key){
				face = -1;
				
				if(land == true)
					alarm_set(7, 80)
			}
	
		}
		else if(slide == true && hsp != 0){
			face = sign(hsp)	
		}
		
		//Resetting image index
		if(left_key_press && hsp > 0 && state_type != "Attack" && place_meeting(x, y+1, obj_block)){
			image_index = 0;
			recoil_angle = face * 13 * -1
			
			if(skill_active && jinn_skill == "Dash")
				skill_active = false
		}
			
		if(right_key_press && hsp < 0 && state_type != "Attack" && place_meeting(x, y+1, obj_block)){
			image_index = 0;
			recoil_angle = face * 13 * -1
	
			if(skill_active && jinn_skill == "Dash")
				skill_active = false
		}
	
	}

	
	if(hsp == 0 || land == false || (!place_meeting(x, y+1, obj_slope) && !down_key)){
		slide = false
		audio_stop_sound(snd_skid)
	}

	
	if((move == 1 && hsp < 0) || (move == -1 && hsp > 0) && (place_meeting(x, y+1, obj_block) || place_meeting(x, y+1, obj_backdrop)) && kick == 0){
		skid = true;	
	}
	else
		skid = false;

	if(land == false)
		skid = false

	if(hurt == false){
	//Running
	
		if(in_water == true)
			max_speed = Approach(max_speed, 3, 0.1);
	
		if(land == true)
		{
			if(has_control == true){
				
				if(place_meeting(x, y+1, obj_slope) && yplus != 0 && slide == false)
						max_speed = Approach(max_speed, 3, incr * 0.7);
				
				else{
					
					/*if(ball_jump == true)
						max_speed = abs(hsp)*/
					
					/*else*/ if(in_water == false && can_fire == true)
						max_speed = Approach(max_speed, 4, incr * 0.7);
						
					/*if(abs(hsp) > max_speed && move == 0)
						max_speed = abs(hsp)*/
				}
				

			}
			
			
		}
		
		/*else if(abs(hsp) > max_speed)
				max_speed = abs(hsp)*/
			
	}

	//Horizontal movement
	if( hurt == false && air_dash == false && ledge_grab == false && slide == false && grapple == false){
		
		if(move != 0 && can_fire == true){
			
			if(abs(hsp) < max_speed)
				hsp = Approach(hsp, max_speed*move, incr)
			else
				hsp = Approach(hsp, abs(hsp)*move, incr)
				
			if(land == true && abs(hsp) > 6){
				hsp = Approach(hsp, 6*move, incr)
			}
				
		}

		if(move == 0 && slide == false && land == true )
		{
			
			if(place_meeting(x, y+1, obj_slope) && yplus == 0)
				hsp = Approach(hsp, 0, incr/4)
			else
				hsp = Approach(hsp, 0, incr)
		}
	}

	//Vertical movement
	if((dash == false ) && air_dash == false && ledge_grab == false && in_water == false && grapple == false){
		//if( blasted == false  && hsp == 0 ){
			vsp = vsp + grav;
		//}
	}
	
	if(!place_meeting(x, y+1, obj_block) && !place_meeting(x, y+1, obj_backdrop))
		land = false;

	//Stopping
	if( kick == 3){
		vsp = Approach(vsp, 0, 0.25)
	
		if(land == true || kick == 2 )
			hsp = Approach(hsp, 0, incr)
	}

	//Jumping
	if(possessed == false && hurt == false && has_control == true){
		if(vsp != 0)	
			land = false;

		if(jump_key_press){
			if(in_water == true)
				vsp = jspd/2;	
		}

		if(  (jump_button))
		{
			if ((player_state != "Air") && jump_button){
			
			
				//Dash cancel
				squish = 1.5
				
				if(ledge_grab == true){
					vsp = jspd/1.2;	
					run = 0;
				}
			
				landed = false;
				audio_play_sound(snd_jump, 1, 0);
			
			}
			
		
		}
		
	
		if(vsp < 0)
		{
			if(jump_key_release)
				vsp*=0.5;
		}
	
	
	}
	

	//Vertical collision

	var vsp_final = vsp + vsp_carry;
	vsp_carry = 0;

	//Jump through blocks
	var platform = instance_place(x, y + vsp_final + 1, obj_backdrop);

	//Back drop
	#region
	if(platform && dash == false){

		if(bbox_bottom < platform.bbox_top){
			while (!place_meeting(x, y+sign(vsp_final), platform))
			{
				y = y + sign(vsp_final);
			}
	
			hsp_carry = platform.hsp;
			
			if(platform.vsp != 0)
				y += platform.vsp;

	
			if(vsp_final > 1){
				//kick = 0
				//squish = 1.5
				
				if(kick == 0){
					landed = true
				
					if(skill_active == false)
						image_index = 0;
				}
					
				can_dash = true
		
				instance_create_depth(x-8, y+24, -100, obj_dust);
				instance_create_depth(x+8, y+24, -100, obj_dust);
				audio_play_sound(snd_step, 1, 0);
			}
		
			
			if(vsp_final >= 0)
				land = true;
		
			ball_jump = 0;
			vsp_final = 0;
			vsp = 0;
		}

	}
	#endregion

	//var box =  instance_nearest(x, y, obj_crate)
	
	//if(box.grabbed == 0){
		var crate = instance_place(x, y + vsp_final + 1, obj_crate);

		//Crate
		#region
		
		if(crate && crate.grabbed == 0 && dash == false && !(down_key && jump_key_press)){

			if(bbox_bottom < crate.bbox_top){
				while (!place_meeting(x, y+sign(vsp_final), crate))
				{
					y = y + sign(vsp_final);
				}
				
				hsp_carry = crate.hsp_carry;
				
				if(crate.vsp != 0)
					y += crate.vsp;
	
				if(vsp_final > 1){
					//kick = 0
					//squish = 1.5
				
					if(kick == 0){
						landed = true
				
						if(skill_active == false)
							image_index = 0;
					}
					
					can_dash = true
		
					instance_create_depth(x-8, y+24, -100, obj_dust);
					instance_create_depth(x+8, y+24, -100, obj_dust);
					audio_play_sound(snd_step, 1, 0);
				}
		
				hurt = false;
				if(vsp_final >= 0)
					land = true;
		
				ball_jump = 0;
				vsp_final = 0;
				vsp = 0;
			}

		}
		#endregion
	
	//}

	//Stuck in Solid block
	if(collision_rectangle(x+7, y, x-7, y+4, obj_block, 0, 0))
		move_outside_all(180*image_xscale, 1)

	//Horizontal collision
	var hsp_final = hsp + hsp_carry;
	hsp_carry = 0;

	if (place_meeting(x+hsp_final, y, obj_block))
	{
		//Slope
		yplus = 0;
	
		//while(place_meeting(x + hsp_final, y - yplus, obj_block) && yplus <= abs(1 * hsp_final)) yplus += 1;
	
		if(place_meeting(x + hsp_final, y - yplus, obj_block)){
	
			while (!place_meeting(x+sign(hsp_final), y, obj_block))
			{
				x = x + sign(hsp_final);
			}

			hsp_final = 0;
			hsp = 0;
			
		}
	
	}

	//Out of the room
	if x > -32 && x < room_width
		x = x + hsp_final;

	//Down slope
		/*]if(hsp_final != 0 ){
			if(place_meeting(x, y+vsp+1, obj_slope)){
			
				yminus = 1;
			
				while(!place_meeting(x + hsp_final, y+vsp, obj_block) && yminus != 0)//if(!place_meeting(x+hsp_final, y+vsp, obj_slope))
				{
					yplus = 0
					
					if(yminus == 1)
						y += yminus;
				}
			}
			else
				yminus = 0;
		}*/

	//Vertical collision

	if (place_meeting(x, y+vsp_final, obj_block))
	{
	
		while (!place_meeting(x, y+sign(vsp_final), obj_block))
		{
			y = y + sign(vsp_final);
		}
		
		if(vsp_final >= 0)
			land = true;
		
		ball_jump = 0;

		vsp_final = 0;
		vsp = 0;

	
	}

	y = y + vsp_final;


	//Room tansitions
	/*if(prev_room == true){

		//var prev_door = instance_nearest(x, y, obj_room_next)
		//x = prev_door.x - 10
	}*/

	#endregion
	
	mask_index = spr_player
	



//Getting in door
#region
/*
if(possessed == false && global.multiplayer_mode == false){
		if(obj_transition.mode = TRANS_MODE.INTRO){

			if(next_room == true){
				x = obj_room_prev.x + 36;
				y = obj_room_prev.y+40;
				next_room = false
		
			}
					
			if(prev_room == true){
				var prev_door = instance_nearest(x, y, obj_room_next)
				x = prev_door.x - 16
				y = prev_door.y+40;
				prev_room = false
		
			}
			
	
			alarm_set(5, 1);

		}

		var next_door;
			
		//if(instance_position(door_x, door_y, obj_room_door) == obj_room_door)
			next_door = instance_position(door_x, door_y, obj_room_door)

		//else
			//next_door = instance_nearest(x, y, obj_room_door)

		if(in_door == true ){

			//land = true;

			/*x = next_door.x + 16
			
			if(global.overworld == false)
				y = next_door.y + 24.5
				
			else
				y = next_door.y + 20;
				
			if(obj_transition.mode = TRANS_MODE.INTROobj_transition.percent == 1.2){
				x = door_x
				y = door_y
			}
		
	
		}
	}*/

#endregion


	}

}



