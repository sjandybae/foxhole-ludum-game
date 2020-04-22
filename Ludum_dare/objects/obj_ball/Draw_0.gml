

/*if((vsp != 0 || hsp != 0) || obj_player.kick != 0){
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, rot - 20, c_white, 0.5)
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, rot - 40, c_white, 0.25)
}*/

/*if(type == "sword" && obj_player.kick == 2){
	draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, image_xscale * h_squish, image_yscale * v_squish, rot, c_white, 1/2);
	draw_sprite_ext(sprite_index, image_index, xprevious, yprevious, image_xscale * h_squish, image_yscale * v_squish, rot, c_black, burning/2);	
}*/

if(glowing == true){

	gpu_set_blendmode(bm_dest_color)
	draw_set_color(c_black)

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * h_squish, image_yscale * v_squish, rot, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * h_squish, image_yscale * v_squish, rot, c_black, burning);

	gpu_set_blendmode(bm_add)
	draw_set_color(c_yellow)

	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * h_squish, image_yscale * v_squish, rot, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * h_squish, image_yscale * v_squish, rot, c_black, burning);

	gpu_set_blendmode(bm_normal)
	draw_set_color(c_white)

}

else{
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * h_squish, image_yscale * v_squish, rot, c_white, image_alpha);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * h_squish, image_yscale * v_squish, rot, c_black, burning);
}


if(grabbed == 1){

	with(obj_player){
	
		if(hold && !crawl)
		draw_sprite_ext(sprite_index+1, image_index, x, y, face/squish, image_yscale*squish, image_angle, c_white, 1)

	}

}


