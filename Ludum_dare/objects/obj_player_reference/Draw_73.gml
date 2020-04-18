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
}