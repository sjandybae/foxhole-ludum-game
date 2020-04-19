//Movement variables
hsp = 0
vsp = 0
max_vsp = 9.8
grav = 0.25
jspd = -6.25
move = 0;
max_spd = 3
onground = false //No longer in use
jump_buffer = 15 //jake
coyote = 0 //jake
face = 1
squish = 1;

//Gameplay variables
throw = false
hold = false
crawl = false
global.max_water_lvl = 100
global.water_lvl = 0


//Controls
#region
up_key = keyboard_check(vk_up) || gamepad_button_check(0, gp_padu);
down_key = keyboard_check(vk_down) || gamepad_button_check(0, gp_padd);

up_key_press = keyboard_check_pressed(vk_up) || gamepad_button_check_pressed(0, gp_padu);
up_key_release = keyboard_check_released(vk_up) || gamepad_button_check_released(0, gp_padu);

down_key_press = keyboard_check_pressed(vk_down) || gamepad_button_check_pressed(0, gp_padd);
down_key_release = keyboard_check_released(vk_down) || gamepad_button_check_released(0, gp_padd);

right_key = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr);
left_key = keyboard_check(vk_left) || gamepad_button_check(0, gp_padl);

right_key_press = keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(0, gp_padr);
left_key_press = keyboard_check_pressed(vk_left) || gamepad_button_check_pressed(0, gp_padl);

grab_key_press = keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_face2);
grab_key_hold = keyboard_check(ord("X")) || gamepad_button_check(0, gp_face2);

jump_key_hold = keyboard_check(ord("Z")) || gamepad_button_check(0, gp_face1);
jump_key_press = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1);
jump_key_release = keyboard_check_released(ord("Z")) || gamepad_button_check_released(0, gp_face1);
#endregion

