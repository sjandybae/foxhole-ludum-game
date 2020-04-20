//audio_play_sound(snd_first_zone, 1, 1)

//Multiplayer rules
last_man = 0;

bop_h = 0;
bop_v = 0;
look_down = 0;

ammo_index = 0

golf_mode = false;
global.shots = 0;

follow = 0;

global.wave_angle = 0;
global.zoom = 1;
global.pause = false;

view_w = camera_get_view_width(view_camera[0])
view_h = camera_get_view_height(view_camera[0])


//Global keys
screenshot = -1;

global.pause_key = keyboard_check_pressed(vk_enter) || gamepad_button_check_released(4, gp_start);
global.interact_key = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1);


//Playing music
/*audio_group_load(audiogroup_music)
audio_play_sound(snd_desert_theme_intro, 1, 0)*/




//Map variables
/*minimap_ds_map = ds_map_create();

minimap_x = 0;
minimap_y = 0;

minimap_left = 0
minimap_top = 0;


minimap_cell_column = 10
minimap_cell_row = 10

minimap_width = 112
minimap_height = 80

column_minus = 3;
row_minus = 2;

for(dsColumn = 1; dsColumn < 59; dsColumn++){
	
	for(dsRow = 1; dsRow < 41; dsRow++){
	
		//              Columns                              Rows
		var StringAdd = "column" + string(dsColumn) + "_" + "row" + string(dsRow)
		ds_map_add(minimap_ds_map, StringAdd, 1)
	
	}

}

//To show
/*ds_map_set(minimap_ds_map, "column8_row10", 0)
ds_map_set(minimap_ds_map, "column9_row10", 0)
ds_map_set(minimap_ds_map, "column10_row10", 0)*/
//ds_map_set(minimap_ds_map, "column10_row10", 0)

//Cutscene variables
global.cutscene = false
cutscene_spd = 0.007

cutscene_x = 0
cutscene_y = 0;

cutmove_x = 0;
cutmove_y = 0;

cutscale = 1;
scale_approach = 1;

cutangle = 0;
angle_approach = 0;

cutalpha = 1;
alpha_approach = 1;

approach_spd = 0.05

cutscene_sprite = array_create(10, 0);
cutscene_text = array_create(10, 0);

black_bar_height = 0
height_approach = 0;

