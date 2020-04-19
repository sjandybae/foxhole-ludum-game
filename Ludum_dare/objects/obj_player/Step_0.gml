//Controls
#region
up_key = keyboard_check(vk_up) || gamepad_button_check(0, gp_padu);
down_key = keyboard_check(vk_down) || gamepad_button_check(0, gp_padd);

up_key_press = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu);
up_key_release = keyboard_check_released(vk_up) || gamepad_button_check_released(0, gp_padu);

down_key_press = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd);
down_key_release = keyboard_check_released(vk_down) || gamepad_button_check_released(0, gp_padd);

right_key = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr);
left_key = keyboard_check(vk_left) || gamepad_button_check(0, gp_padl);

right_key_press = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr);
left_key_press = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl);

grab_key_press = keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_face2);
grab_key_hold = keyboard_check(ord("X")) || gamepad_button_check(0, gp_face2);

jump_key_hold = keyboard_check(ord("Z")) || gamepad_button_check(0, gp_face1);
jump_key_press = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1);
jump_key_release = keyboard_check_released(ord("Z")) || gamepad_button_check_released(0, gp_face1);
#endregion


//sprites
squish = lerp(squish, 1, 0.11)

scr_drawplayer()



//horizontal movement
move = right_key - left_key;

if(move != 0)
	hsp = lerp(hsp, max_spd*move, 0.1)

if(right_key_press)
	face = 1

if(left_key_press)
	face = -1
	
	
	
//stopping
if(onground && move == 0)
	hsp = lerp(hsp, 0, 0.1)
	
//if abs(hsp) <= 0.1 hsp = 0




//verticle movement
vsp = vsp + grav

if(vsp >= max_vsp)
	vsp = max_vsp


//Jumping
if(place_meeting(x, y+1, obj_block)) //Update onground
	coyote = 6 // num of frames the game will allow you to jump after walking off a tile
else
	coyote -= 1

if(jump_key_press == true) //Register player input
	jump_buffer = 15

jump_buffer -= 1 //reduce the jump_buffer
	
if(coyote > 0 && jump_buffer > 0){ //Initate the actual jump
	coyote = 0 //Reset coyote
	vsp = jspd
	squish = 1.5
}
	
if(vsp < 0){ //Jump truncation
	if(jump_key_release)
		vsp*=0.5;
}
	

//Crawling
if(down_key && onground){
	
	if(down_key_press){
		squish = 0.8
		vsp=-0.1
	}
	
	mask_index = spr_player_crawl
	crawl = true
}
else if(!down_key) && !place_meeting(x, y-4, obj_block) && crawl{
	crawl = false
	mask_index = spr_player
	squish = 0.8
}

//Hit box
/*if crawl==true mask_index = spr_player_crawl
else mask_index = spr_player*/
	
	
//Collisions

#region
//Horizontal collision
if (place_meeting(x+hsp, y, obj_block))
	{
		//Slope
		yplus = 0;
	
		//while(place_meeting(x + hsp_final, y - yplus, obj_block) && yplus <= abs(1 * hsp_final)) yplus += 1;
	
		if(place_meeting(x + hsp, y - yplus, obj_block)){
	
			while (!place_meeting(x+sign(hsp), y, obj_block))
			{
				x = x + sign(hsp);
			}

			hsp = 0;
			
		}
	
	}
	
x = x + hsp


//Verticle collision
if (place_meeting(x, y+vsp, obj_block)){
	
	while (!place_meeting(x, y+sign(vsp), obj_block))
	{
		y = y + sign(vsp);
	}
		
	if(vsp > 0 && !onground){
		squish = 0.7
		onground = true;
	}
		
	ball_jump = 0;

	vsp = 0;

	
}

y = y + vsp;
#endregion


//Water levels
global.water_lvl = clamp(global.water_lvl, 0, global.max_water_lvl)


//In water or not
if(instance_place(x, y-1, obj_water)){
	max_spd = 1.5
	max_vsp = 3
}
else{
	
	if crawl==true max_spd = 2
	else max_spd = 3
	max_vsp = 9.8
}




