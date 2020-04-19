draw_sprite_ext(sprite_index, image_index, x, y, 
image_xscale + (sin(wobble) * sign(image_xscale))/24
,image_yscale - (sin(wobble))/24
,0
,c_white
,1)