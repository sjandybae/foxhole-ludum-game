#macro view view_camera[0]
camera_set_view_size(view, view_width * global.zoom, view_height * global.zoom)
//surface_resize(application_surface, (view_width*window_scale) - global.zoom, (view_height*window_scale) - global.zoom)
display_set_gui_size(view_width*window_scale, view_height*window_scale)

		/*var zoom_out = instance_place(x, y, obj_camera_zoom)
		
		if(zoom_out)
			other.follow = zoom_out
		else*/
			follow = obj_camera
		

 
if(instance_exists(follow)){
	
	shake = random_range(global.screen_shake * -1, global.screen_shake)

	var shake_buffer = 24
	
	
	var _x = clamp(follow.x  - (view_width * global.zoom)/2 , shake_buffer, (room_width-view_width) - shake_buffer * global.zoom)
	var _y = clamp(follow.y  - (view_height * global.zoom )/2 ,shake_buffer, (room_height-view_height) - shake_buffer * global.zoom)
	
	var _cur_x = camera_get_view_x(view)
	var _cur_y = camera_get_view_y(view)
	
	_x += shake
	_y += shake
	
	if(obj_transition.percent > 1)
		spd = 1
	else
		spd = 0.12
	
	camera_set_view_pos(view, lerp(_cur_x + shake, _x, spd), lerp(_cur_y + shake, _y, spd))
	
}


//Screen shake going back to zero
global.screen_shake *= 0.9


//ui stuff
if(instance_exists(obj_whale))
	whale_ui_hp = lerp(whale_ui_hp, global.whale_hp, 0.1)



//Cutscene stuff

if(timeline_index == tim_prologue){
	
	if keyboard_check(vk_anykey)
		timeline_speed = 0.05
	else
		timeline_speed = 0.002
}

cut_alpha = lerp(cut_alpha, alpha_approach, 0.05)





