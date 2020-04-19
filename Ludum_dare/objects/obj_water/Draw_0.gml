draw_self()

for(var i = 0; i< image_xscale; i++){
	//draw_sprite_ext(spr_water_waves, wave_index-1, x+16*i, (y-image_yscale*16)+2, 1, 1, 0, c_white, 0.25)	
	draw_sprite(spr_water_waves, wave_index, x+16*i, y-image_yscale*16)	
	
}

