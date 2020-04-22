//room_speed = 60;
depth = -200

//Interact button
global.interact_key = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1);


//Normal camera
if(instance_exists(obj_player)){
	
	x = obj_player.x
	y = obj_player.y
}

//Wave angle variable
global.wave_angle += 0.05

if(global.wave_angle >= pi)
	global.wave_angle = pi*(-1);

if(!place_meeting(x, y, obj_camera_zoom) && global.multiplayer_mode == false)
	global.zoom = lerp(global.zoom, 1, 0.06)



//Cutscenes
if(global.cutscene = true){

	
	timeline_speed = cutscene_spd
	timeline_running = true

	cutscene_y = lerp(cutscene_y, cutmove_y, approach_spd)
	cutscene_x = lerp(cutscene_x, cutmove_x, approach_spd)

	cutscale = lerp(cutscale, scale_approach, approach_spd)

	cutangle = lerp(cutangle, angle_approach, approach_spd)

	cutalpha = lerp(cutalpha, alpha_approach, approach_spd)
	
	
}

