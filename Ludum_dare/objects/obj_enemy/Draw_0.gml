event_inherited()

if(possess == true){
	draw_sprite_ext(sprite_index, image_index, x, y + (sin(aura)*4), face + ((sin(aura))/8) * face, 1 - (sin(aura))/8, slope_angle, c_purple, 0.5)
	draw_sprite_ext(sprite_index, image_index, x, y + (sin(aura)*1), face + ((sin(aura))/10) * face, 1 - (sin(aura))/10, slope_angle, c_purple, 0.75)
}

draw_sprite_ext(sprite_index, image_index, x, y, face*image_xscale, image_yscale, slope_angle + twirl, c_white, 1)

//Drawing hp bar

if(possess == true)
	draw_sprite_ext(sprite_index, image_index, x, y, face*image_xscale, image_yscale, slope_angle, c_black, global.zoom/50)
	//draw_sprite_ext(spr_possess, -1, x, y - 32 + (sin(aura)*4), face + ((sin(aura))/8) * face, 1 - (sin(aura))/8, image_angle, c_white, 1)

if(combo != 0){
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(sprite_index, image_index, x, y, face*image_xscale, image_yscale, slope_angle + twirl, c_white, 1)
	gpu_set_blendmode(bm_normal)
}
