var tilt = abs(other.rot)

if(global.water_lvl < global.max_water_lvl) && !(tilt > 30 && tilt < 330) {
	
	var scale = 0.15/image_xscale
	
	image_yscale -= scale
	image_alpha -= scale/15
	
	global.water_changed_timer = 60;
	global.water_lvl += 0.5
}


