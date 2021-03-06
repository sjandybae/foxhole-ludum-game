

//total number of controllers
global.total_devices = global.ports[0] + global.ports[1] + global.ports[2] + global.ports[3] + global.ports[4] + global.ports[5] + global.ports[6] + global.ports[7] + global.ports[8] + global.ports[9] + global.ports[10] + global.ports[11]

if(global.total_devices < 1)
	global.total_devices = 1

//global.player_count = global.total_devices

if(port_no > 3)
	port_no = 3




//Pausing
global.pause_key = keyboard_check_pressed(vk_enter) || gamepad_button_check_released(0, gp_start);

if(global.pause_key){

	global.pause = !global.pause
	if(!sprite_exists(screenshot)){
		screenshot = sprite_create_from_surface(application_surface, 0, 0, view_wport, view_hport, 0, 0, 0, 0)	
	}
}

if(global.pause == true /*|| changing_rooms == true*/){
	instance_deactivate_all(true)
	
}

else{
	
	if(sprite_exists(screenshot))
		sprite_delete(screenshot);
	
	
	instance_activate_all();
	changing_rooms = false
}

if(percent > 1.1){
	//instance_activate_all();
	changing_rooms = false
}

//Room Transition
if(mode != TRANS_MODE.OFF){
	
	if(mode == TRANS_MODE.INTRO)
	{
		percent = max(0, percent - max((percent/10), 0.005));
		
	}
	else
	{
		percent = min(1.2, percent + max(((1.2- percent)/10), 0.005));
	}
	
	if(percent == 1.2 || percent == 0){
	
		switch(mode)
		{
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF;
				break;
			}
			
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				/*slide = 0;
				
				if(global.multiplayer_mode == false){
					level_index++
				
					global.XVAL++
				
					var new_lvl = ds_map_find_value(levels_ds_map, level_index)
				
					if(new_lvl != undefined)
						room_goto(new_lvl);
				}
				else
					room_goto_next()*/

				break;
			}
			
			case TRANS_MODE.PREV:
			{	
				mode = TRANS_MODE.INTRO;
				//slide = w*-1;
				
				/*mode = TRANS_MODE.INTRO;
				slide = 0;

				if(global.multiplayer_mode == false){
					level_index--

					var new_lvl = ds_map_find_value(levels_ds_map, level_index)
				
					global.XVAL--
				
					if(new_lvl != undefined)
						room_goto(new_lvl);
				}
				else
					room_goto_previous();*/
				
				break;
			}
			
			case TRANS_MODE.RETURN:
			{
				
				mode = TRANS_MODE.INTRO;
				//room_goto(target);
				break;
			}
			
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				
				with(obj_displaymanager){
					cut_alpha = 0
					alpha_approach = 0;	
				}
				
				/*if(instance_exists(obj_room_target)){
					obj_player.x = obj_room_target	
				}*/
				
				//obj_player.x = obj_room_door.x
				//obj_player.y = obj_room_door.y
				break;
			}
			
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
			
			case TRANS_MODE.REROOM:
			{
				mode = TRANS_MODE.INTRO;
				
				global.whale_hp = global.whale_max_hp
				timeline_position = 0
				global.game_over = false
				timeline_running = false
				
				room_restart();
				break;
			}
			
			case TRANS_MODE.OFF:
			{
				
				//with(obj_player) prev_room = false;	
			}
			
		}
	
	}
}

//depth = -300

//levels ds_map stuff
/*xt_level = level_index+1
prev_level = level_index-1*/


//Paralax
var _cam_x = camera_get_view_x(view_camera[0]) ;
//var _cam_y = camera_get_view_y(view_camera[0]) ;

layer_x("Background", _cam_x * 0.25); // Change the background layer name to whatever you use in the room editor
layer_x("Backgrounds_1", _cam_x * 0.5);   // Change the 0.25 and 0.5 values to change the speed of the effect

layer_x("Backgrounds_3", _cam_x * 0.75);
layer_x("Backgrounds_4", _cam_x * 0.85);


layer_x("Tiles_6", _cam_x * 0.03);
layer_x("Background_Tiles", _cam_x * 0.02);
layer_x("Background_Cave_Tiles", _cam_x * 0.02);
layer_x("Fore_1", _cam_x * 0.01);


layer_x("Shadows", _cam_x * 0.02);





