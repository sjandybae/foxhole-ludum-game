/*if(ball_jump != 0)
	draw_sprite_ext(sprite_index, image_index-1, x, y, face, 1, 0, c_white, 0.5);*/

//Multiplayer GUI
#region

if(global.multiplayer_mode){
	draw_sprite(spr_player_tag, player_no, x, y-16 + sin(global.wave_angle))
		
	//lives
	/*for(var i = 0; i < player_lives; i++){
		
		draw_sprite_ext(spr_ui_ammo_stats, 0, x-26, y-16 + 7*i, -1, 1, 90, c_white, 1)
		
	}*/
	
	if(has_jetpack){
	
		draw_sprite_stretched(spr_jinnbar, 1, x+14, y-4, 10, max_jet_fuel)
		draw_sprite_stretched(spr_jinnbar, 0, x+14, y-4, 10, jet_fuel)
		draw_sprite_ext(spr_jinnbar, 2, x+14, y-4, 1, -1, 0, c_white, 1)
		draw_sprite_ext(spr_jinnbar, 2, x+14, y-4+max_jet_fuel, 1, 1, 0, c_white, 1)
		
	}
	
		
	if(ammo == 0){
		
		draw_sprite_ext(spr_reload, 0, x - 24, y, 1, 1, 0, c_white, 1 )
		
	}
	
	
}

#endregion

if(global.overworld){
	
	gpu_set_fog(true, c_black, 0, 1);
	
	draw_sprite_pos(
	sprite_index,
	image_index,
	x - (sprite_width/2) + 10,
	y - 16,
	x + (sprite_width/2) + 10,
	y - 16,
	x + (sprite_width/2),
	y,
	x - (sprite_width/2),
	y,
	0.5
	);

	gpu_set_fog(false, c_white, 0, 0);

}



draw_set_color(c_black)
//Shadows
#region

//light
if(instance_exists(obj_fake_light)){

	var light = instance_nearest(x, y, obj_fake_light)
	
	var _x = (x - light.x)/8
	var _y = (y - light.y)/8
	
	var sh_alpha = 8/max(distance_to_object(light),2)
}
else{
	var _x = 0
	var _y = 0
	var sh_alpha = 0 
}


//Jet pack
if(has_jetpack == true)
	draw_sprite_ext(spr_jetpack_equip, 0, x+_x + x_pos - recoil_angle/3, y + y_pos +_y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_black, sh_alpha);


//spining aura

pal_swap_set(my_pal_sprite,current_pal,false);

if(ball_jump == true && can_fire == true){

	draw_sprite_ext(sprite_index, image_index, x+_x - recoil_angle/3, y+_y, image_xscale*1.3, image_yscale*1.3, recoil_angle+spin_angle, c_black, sh_alpha);


}

//draw legs
if(ball_jump == false || can_fire == false) || throw == true{

	if(land == false)
		draw_sprite_ext(leg_sprites, image_index, x+_x - recoil_angle/5, y+_y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle * 1.5, c_black, sh_alpha);

	if(land == true)
		draw_sprite_ext(leg_sprites, leg_index, x+_x, y+_y, image_xscale, image_yscale, 0, c_black, sh_alpha);

}

//draw torso
draw_sprite_ext(sprite_index, image_index, x+_x + x_pos - recoil_angle/3, y+_y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_black, sh_alpha);



//suit lights

if(dead == false){

#region


	gpu_set_blendmode(bm_max)
	draw_set_color(c_orange)

		//spining aura
		if(ball_jump == true && can_fire == true){

			draw_sprite_ext(spr_ball_lights, image_index, x - recoil_angle/3, y, image_xscale*1.3, image_yscale*1.3, recoil_angle+spin_angle, c_black, sh_alpha);

		}

		//draw legs
		if(ball_jump == false || can_fire == false) || throw == true{

			if(land == false)
				draw_sprite_ext(spr_idle_jump_lights, image_index, x - recoil_angle/5, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle * 1.5, c_black, sh_alpha);

			if(land == true && leg_sprites == spr_idle_legs)
				draw_sprite_ext(spr_legs_light, leg_index, x, y, image_xscale, image_yscale, 0, c_black, sh_alpha);
			
			if(land == true && leg_sprites == spr_run_legs)
				draw_sprite_ext(spr_run_lights, leg_index, x, y, image_xscale, image_yscale, 0, c_black, sh_alpha);

		}

		//draw torso
		if(sprite_index == spr_run_torso)
			draw_sprite_ext(spr_run_lights_torso, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_black, sh_alpha);
	
		else if(sprite_index != spr_run_torso){
			if(throw == 0)
				draw_sprite_ext(spr_idle_lights, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_black, sh_alpha);
			else
				draw_sprite_ext(spr_throw_lights, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_black, sh_alpha);
		}
	
		draw_set_alpha(1)
			gpu_set_blendmode(bm_normal)
			draw_set_color(c_white)
	

#endregion

pal_swap_reset();

}


if(has_hat){

	//Hats
	var hat_change = max(abs(move), ball_jump)
	
	draw_sprite_ext(spr_hats, hat_index + hat_change, x+_x + x_pos - recoil_angle/3, y+_y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle+hat_angle, c_black, sh_alpha);


}



#endregion

//Normal sprites
#region

//Jet pack
if(has_jetpack == true)
	draw_sprite_ext(spr_jetpack_equip, 0, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha);


//spining aura

pal_swap_set(my_pal_sprite,current_pal,false);

if(ball_jump == true && can_fire == true){

	gpu_set_blendmode(bm_max)
	draw_set_color(c_orange)


	draw_sprite_ext(sprite_index, image_index, x - recoil_angle/3, y, image_xscale*1.3, image_yscale*1.3, recoil_angle+spin_angle, c_orange, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x - recoil_angle/3, y, image_xscale*1.2, image_yscale*1.2, recoil_angle+spin_angle/1.2, c_green, image_alpha);
	draw_sprite_ext(sprite_index, image_index, xprevious - recoil_angle/3, yprevious, image_xscale*1.2, image_yscale*1.2, recoil_angle+spin_angle/1.3, c_blue, image_alpha);

	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)

}

//draw legs
if(ball_jump == false || can_fire == false) || throw == true{

	if(land == false)
		draw_sprite_ext(leg_sprites, image_index, x - recoil_angle/5, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle * 1.5, c_white, image_alpha);

	if(land == true)
		draw_sprite_ext(leg_sprites, leg_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

}

//draw torso
draw_sprite_ext(sprite_index, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha);


//Muzzel lighting
if(abs(recoil_angle) > 10 && can_fire == false) || place_meeting(x, y, obj_explosion){

	draw_set_alpha( abs(recoil_angle)/90 )
	gpu_set_blendmode(bm_max)
	draw_set_color(c_orange)


	//draw legs
	if(ball_jump == false || can_fire == false){

		if(land == false){
			draw_sprite_ext(leg_sprites, image_index, x-face - recoil_angle/5, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle * 1.5, c_black, image_alpha/2);
			draw_sprite_ext(leg_sprites, image_index, x+face - recoil_angle/5, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle * 1.5, c_white, image_alpha);
			draw_sprite_ext(leg_sprites, image_index, x+face - recoil_angle/5, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle * 1.5, c_yellow, image_alpha);
		}

		if(land == true){
			draw_sprite_ext(leg_sprites, image_index, x-face, y, image_xscale/max(1, squish), image_yscale * max(1, squish), 0, c_black, image_alpha/2);
			draw_sprite_ext(leg_sprites, image_index, x+face, y, image_xscale/max(1, squish), image_yscale * max(1, squish), 0, c_white, image_alpha);
			draw_sprite_ext(leg_sprites, image_index, x+face, y, image_xscale/max(1, squish), image_yscale * max(1, squish), 0, c_yellow, image_alpha);
		}
			

	}

	//draw torso
	draw_sprite_ext(sprite_index, image_index, x-face - recoil_angle/3, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_black, image_alpha/2);
	draw_sprite_ext(sprite_index, image_index, x+face - recoil_angle/3, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x+face - recoil_angle/3, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_yellow, image_alpha);

	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)

}






//Dash ammo
if(ball_jump == true && can_fire == false && ammo_type == "dash"){

	gpu_set_blendmode(bm_max)
	draw_set_color(c_orange)


	draw_sprite_ext(sprite_index, image_index, x - recoil_angle/3, y, image_xscale*1.3, image_yscale*1.3, recoil_angle+spin_angle, c_orange, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x - recoil_angle/3, y, image_xscale*1.2, image_yscale*1.2, recoil_angle+spin_angle/1.2, c_green, image_alpha);
	draw_sprite_ext(sprite_index, image_index, xprevious - recoil_angle/3, yprevious, image_xscale*1.2, image_yscale*1.2, recoil_angle+spin_angle/1.3, c_blue, image_alpha);

	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)

}

//suit lights

if(dead == false){

#region


	gpu_set_blendmode(bm_max)
	draw_set_color(c_orange)

		//spining aura
		if(ball_jump == true && can_fire == true){

			draw_sprite_ext(spr_ball_lights, image_index, x - recoil_angle/3, y, image_xscale*1.3, image_yscale*1.3, recoil_angle+spin_angle, c_orange, image_alpha);

		}

		//draw legs
		if(ball_jump == false || can_fire == false) || throw == true{

			if(land == false)
				draw_sprite_ext(spr_idle_jump_lights, image_index, x - recoil_angle/5, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle * 1.5, c_white, image_alpha);

			if(land == true && leg_sprites == spr_idle_legs)
				draw_sprite_ext(spr_legs_light, leg_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
			
			if(land == true && leg_sprites == spr_run_legs)
				draw_sprite_ext(spr_run_lights, leg_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

		}

		//draw torso
		if(sprite_index == spr_run_torso)
			draw_sprite_ext(spr_run_lights_torso, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha);
	
		else if(sprite_index != spr_run_torso){
			if(throw == 0)
				draw_sprite_ext(spr_idle_lights, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha);
			else
				draw_sprite_ext(spr_throw_lights, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha);
		}
	
		draw_set_alpha(1)
			gpu_set_blendmode(bm_normal)
			draw_set_color(c_white)
	

#endregion

pal_swap_reset();

}


if(has_hat){

	//Hats
	var hat_change = max(abs(move), ball_jump)
	
	draw_sprite_ext(spr_hats, hat_index + hat_change, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle+hat_angle, c_white, image_alpha);

	//Muzzel hat
	if(abs(recoil_angle) > 10 && can_fire == false) || place_meeting(x, y, obj_explosion){

		draw_set_alpha( abs(recoil_angle)/90 )
		gpu_set_blendmode(bm_max)
		draw_set_color(c_orange)
	
		draw_sprite_ext(spr_hats, hat_index + hat_change, x+face + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle+hat_angle, c_white, image_alpha);
		draw_sprite_ext(spr_hats, hat_index + hat_change, x+face + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle+hat_angle, c_white, image_alpha);

		draw_set_alpha(1)
		gpu_set_blendmode(bm_normal)
		draw_set_color(c_white)

	}

}


//Cannon sprites
pal_swap_set(my_pal_sprite,current_pal,false);

if(sprite_index = spr_idle_torso || sprite_index = spr_run_torso)
	draw_sprite_ext(sprite_index+1, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha);

//Charging
if(charge > 3){

	draw_set_alpha( abs(recoil_angle)/90 )
	gpu_set_blendmode(bm_add)
	draw_set_color(c_orange)


	if(sprite_index = spr_idle_torso || sprite_index = spr_run_torso)
		draw_sprite_ext(sprite_index+1, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, charge/2);

	draw_sprite_ext(spr_glow, 0, x, y, 1, 1, 0, c_orange, abs(sin(global.wave_angle))/1.5)

	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)

}

//Muzzel lighting
if(abs(recoil_angle) > 10 && can_fire == false) || place_meeting(x, y, obj_explosion){

	draw_set_alpha( abs(recoil_angle)/90 )
	gpu_set_blendmode(bm_max)
	draw_set_color(c_orange)

	if(sprite_index = spr_idle_torso || sprite_index = spr_run_torso){
		draw_sprite_ext(sprite_index+1, image_index, x-face + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha/2);
		draw_sprite_ext(sprite_index+1, image_index, x+face + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha);
		draw_sprite_ext(sprite_index+1, image_index, x+face + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha);
	}
	
	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)

}

//Cannon light

#region

//Cannon ready or not
		if(ammo > 0){
	
			gpu_set_blendmode(bm_max)
			draw_set_color(c_orange)
	
			if(sprite_index != spr_run_torso){
				draw_sprite_ext(light_sprites, image_index, x + x_pos - recoil_angle/3, y-2 + y_pos, image_xscale*1.1/max(1, squish), image_yscale*1.1 * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha/2);
				draw_sprite_ext(light_sprites, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, image_alpha/max(1, squish) );
			}

			gpu_set_blendmode(bm_normal)
			draw_set_color(c_white)
		}

#endregion

pal_swap_reset();


//Reload flash
#region
pal_swap_set(my_pal_sprite,31,false);

if(ball_jump == true && can_fire == true){

	draw_sprite_ext(sprite_index, image_index, x - recoil_angle/3, y, image_xscale*1.3, image_yscale*1.3, recoil_angle+spin_angle, c_white, 1 - reload_index);


	draw_set_alpha(1)


}

//draw legs
if(ball_jump == false || can_fire == false) || throw == true{

	if(land == false)
		draw_sprite_ext(leg_sprites, image_index, x - recoil_angle/5, y, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle * 1.5, c_white, 1 - reload_index);

	if(land == true)
		draw_sprite_ext(leg_sprites, leg_index, x, y, image_xscale, image_yscale, 0, c_white, 1 - reload_index);

}

//draw torso
draw_sprite_ext(sprite_index, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, 1 - reload_index);

if(sprite_index = spr_idle_torso || sprite_index = spr_run_torso){
	draw_sprite_ext(sprite_index+1, image_index, x + x_pos - recoil_angle/3, y + y_pos, image_xscale/max(1, squish), image_yscale * max(1, squish), recoil_angle+spin_angle, c_white, 1 - reload_index);
}

pal_swap_reset();
#endregion

#endregion









