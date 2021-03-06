//Controls
#region

if(active = true){
	
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

}
#endregion


//Deactivated



//sprites
squish = lerp(squish, 1, 0.11)

scr_drawplayer()



//horizontal movement
if(active == false)
	move = 0;
else
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

if (place_meeting(x, y+vsp, obj_water) && !place_meeting(x, y-1, obj_water) && !audio_is_playing(snd_player_splash)){
	
	for(var i = 0; i <= 6; i++)
		instance_create_depth(x, y-8, depth-1,obj_droplet)
	
	audio_play_sound(snd_player_splash, 1, 0)
}

//Jumping
var platform = place_meeting(x, y+1, obj_jumpthrough) && !place_meeting(x, y, obj_jumpthrough);

if(place_meeting(x, y+1, obj_block) || platform){ //Update onground
	coyote = 6 // num of frames the game will allow you to jump after walking off a tile
	onground = true
}
else{
	coyote -= 1
	onground = false
}

if(jump_key_press == true) //Register player input
	jump_buffer = 5

jump_buffer -= 1 //reduce the jump_buffer
	
if(coyote > 0 && jump_buffer > 0){ //Initate the actual jump
	coyote = 0 //Reset coyote
	vsp = jspd
	squish = 1.5
	
	if(place_meeting(x,y,obj_water)) audio_sound_pitch(snd_fox_jump, random_range(0.5, 0.7))
	else audio_sound_pitch(snd_fox_jump, random_range(0.9, 1.1))
	audio_play_sound(snd_fox_jump, 1, 0)
}
	
if(vsp < 0){ //Jump truncation
	if(jump_key_release)
		vsp*=0.5;
}
	

//Crawling
if(down_key && onground){
	
	if(down_key_press){
		hsp = 0
		squish = 0.8
		vsp=-0.1
	}
	
	mask_index = spr_player_crawl
	crawl = true
}
else if(!down_key) && !place_meeting(x, y-16, obj_block) && crawl{
	crawl = false
	mask_index = spr_player
	squish = 0.8
}

//Holding state
if(collision_rectangle(x-8, y, x+8, y-48, obj_bucket, false, true) && hold)
	state = "holding"
else
	state = "normal"


//Raising the roof
if(grab_key_hold)
	hold = true
	
else if(!collision_rectangle(x-8, y, x+8, y-48, obj_bucket, false, true))
	hold = false

	
	
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
		audio_play_sound(snd_grass_step, 1, 0)
	}

	vsp = 0;

	
}

//Back drop
	#region
	
	//if(platform){

		if(place_meeting(x, y+abs(vsp), obj_jumpthrough) && !place_meeting(x, y, obj_jumpthrough) && vsp > 0){
			if (!place_meeting(x, y+sign(vsp), obj_jumpthrough))
			{
				y = y + sign(vsp);
			}
			
			if(vsp > 0 && !onground){
				squish = 0.7
				onground = true;
				audio_play_sound(snd_grass_step, 1, 0)
			}
		
			vsp = 0;
		}

	//}
	#endregion
	


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
	
	if crawl==true max_spd = 1.5
	else max_spd = 3
	max_vsp = 9.8
}


if(bucket_knocked == true && hold==false){
	bucket_knocked = false
}

