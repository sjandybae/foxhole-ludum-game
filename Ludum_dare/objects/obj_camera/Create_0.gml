//audio_play_sound(snd_first_zone, 1, 1)

//Multiplayer rules

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

