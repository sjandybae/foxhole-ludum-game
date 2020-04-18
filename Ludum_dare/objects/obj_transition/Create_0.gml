//
global.multiplayer_mode = false

//Controller ports
global.cutscene = false
global.ports = array_create(gamepad_get_device_count(), 0)
global.connected_cont = array_create(4, 12)
port_no = 0;

alarm[1] = 1

global.player_count = 2
global.total_devices = 0

global.player_positions = array_create(8, 0)
global.player_data = array_create(16, 0)

//Player 1 position
global.player_positions[0] = 1552
global.player_positions[1] = 456

//player 2 position
global.player_positions[2] = 2032
global.player_positions[3] = 456

//player 3 position
global.player_positions[4] = 1584
global.player_positions[5] = 320

//player 4 position
global.player_positions[6] = 1984
global.player_positions[7] = 320

//World
global.overworld = false;

//Inventory
global.inv_space_max = 10;
global.inv_space = 0;
global.chip_count = 0;
global.inventory = array_create(global.inv_space_max)

//Pause
screenshot = -1;
global.pause = false
global.pause_key = keyboard_check_pressed(vk_enter) || gamepad_button_check_released(4, gp_start);

//Room transition
w = display_get_gui_width();
h = display_get_gui_height();
h_half = h/2;

player_y = 0;
player_x = 0;

player_sprite = 0;
player_leg_sprite = 0;

player_face = 0;
player_index = 0;

prev_screen = 0;
next_screen = 0;
changing_rooms = false;
slide = w 

slide_change = w/15
hp_drain = 0;
dark_alpha = 0;

enum TRANS_MODE
{
	OFF,
	NEXT,
	PREV,
	RETURN,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;

//Map things
#region
view_w = camera_get_view_width(view_camera[0])
view_h = camera_get_view_height(view_camera[0])

//Map variables
minimap_ds_map = ds_map_create();

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

blinking = 1;

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
ds_map_set(minimap_ds_map, "column10_row10", 0)
#endregion


//levels
#region
/*
global.len = 5
global.wrld1 = array_create(20, undefined)
global.wrld1_1 = array_create(20, undefined)

//set levels

levels_ds_map = ds_map_create();
level_index = 100
next_level = level_index+1
prev_level = level_index-1

global.XVAL = 0
global.YVAL = 0


ds_map_set(levels_ds_map, level_index, rm_starting)
ds_map_set(levels_ds_map, prev_level, undefined)
ds_map_set(levels_ds_map, next_level, undefined)

//surface level
for(var i = 0; i <= 5; i++){
	
	global.wrld1[i] = rm_starting+i
}

//cave
for(var i = 0; i <= 2; i++){
	
	global.wrld1_1[i] = rm_2_1+i
	
	ds_map_set(levels_ds_map, 199+i, global.wrld1_1[i])
}



//randomize levels
for(var i = 5; i >= 0; i--){
	
	randomize()
	var r = random(i)
	
	var temp = global.wrld1[i]
	
	//leftest room
	if(i == 5)
		ds_map_set(levels_ds_map, 97, rm_1_0)
		
	//rightest room
	if(i == 0)
		ds_map_set(levels_ds_map, 104, rm_1_final)
	
	global.wrld1[i] = global.wrld1[r]
	global.wrld1[r] = temp
	
	ds_map_set(levels_ds_map, 98+i, global.wrld1[i])
	
}
*/
#endregion


//starting the game
/*var len = ds_map_size(levels_ds_map)

	
if(global.multiplayer_mode == false){
	for(var i = 98; i<=98+len; i++){
		
		level_index = i
		
		if(ds_map_find_value(levels_ds_map, i) == 19){
			room_goto(ds_map_find_value(levels_ds_map, i))
			exit	
		}
		
	}
}








