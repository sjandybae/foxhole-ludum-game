speed = lerp(speed, 0, 0.05)

//if(sprite_index != spr_pulse){
	image_xscale = lerp(image_xscale, 2, 0.05)
	image_yscale = lerp(image_yscale, 2, 0.05)
//}

image_alpha= Approach(image_alpha, 0, 0.05)

if(image_alpha <= 0)
	instance_destroy();
	
	
