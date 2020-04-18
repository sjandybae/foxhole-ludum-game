if(global.water_lvl < global.max_water_lvl) && other.grabbed == 1{
	
	var scale = 0.15/image_xscale
	
	image_yscale -= scale
	image_alpha -= scale/15
	
	global.water_lvl += 0.25
}
