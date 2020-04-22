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


//World
global.overworld = false;



//Pause
screenshot = -1;
global.pause = false
global.pause_key = keyboard_check_pressed(vk_enter) || gamepad_button_check_released(4, gp_start);

//Room transition
w = display_get_gui_width();
h = display_get_gui_height();
h_half = h/2;

player_index = 0;

next_screen = 0;
changing_rooms = false;
slide = w 



enum TRANS_MODE
{
	OFF,
	NEXT,
	PREV,
	RETURN,
	GOTO,
	RESTART,
	REROOM,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1;
target = room;









