//Powerups
global.has_grenade = true;
global.ammo_count = 0;


//Player states
player_no = 1
cont_port = 12
creator_id = self



dead = false

player_state = "Idle"
sub_state = "None"
state_type = "Idle"

//Door stuff
in_door = false;
prev_room = false;
next_room = false;

door_x = 0;
door_y = 0;

respawn_x = 0;
respawn_y = 0;


enemey_y = 0;

has_control = true;
global.money = 0;
global.jinn_meter_max = 50;
global.jinn_meter = 0

not_in_room = false;
trigger = false;

max_hp = 5;
hp = max_hp;

player_lives = 1

eat = false;

hurt = false;
invinsible = false;
blink = 0
squish = 0;

global.equipped = false;

global.slot_1 = array_create(2, "empty")
global.slot_2 = array_create(2, "empty")

ammo = 0;

shoot = 0;
charge_shot = 0;
air_dash = false;
can_dash = true;

ledge_grab = false;
blasted = false

//Jinn skills
skill_active = false;
jinn_skill = "Dash"
dash = false;
grapple = false;

grapple_x = 0
grapple_y = 0

temp_x = 0;
temp_y = 0;

Orbit = 0

orbit_angle = 0;

in_water = false;
grav = 0.25;
move = 0;
incr = 0.25;
level = 1;
hsp = 0;
skid = false;
slide = false;



hsp_carry = 0;
run = 0;
jog = false;
vsp = 0;

yplus = 0;
yminus = 0;

vsp_carry = 0;
jspd = -7;
grab = 0;
pick = 0;
acel = 0;
max_speed = 0;
land = false;
landed = false;
aura = 0;

can_fire = true

reload_index = 1;

charge = 0;

aim = "right"

ammo_type = "rapid"
grenade_type = "normal" //normal, tesla

laser = 0;

can_throw = true
max_ammo = 1

if(ammo_type == "burst")
	max_ammo = 1

ammo = 1;
ammo_index = 0;

junk_ammo = array_create(6, 0)

recoil_angle = 0;
recoil_magnitude = 0;
spin_angle = 0;
leg_sprites = 0;
light_sprites = 0;

x_pos = 0;
y_pos = 0;

throw = 0;
depth = -98

face = 1;
kick = 0;

spin = 0;
ball_jump = 0;
possessed = false;

//Flying controls
can_float = false

//Controls
analogue_up = 0;
analogue_down = 0;
analogue_left = 0
analogue_right = 0;

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

jump_key_hold = keyboard_check(ord("Z")) || gamepad_button_check(0, gp_face1);
jump_key_press = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(0, gp_face1);
jump_key_release = keyboard_check_released(ord("Z")) || gamepad_button_check_released(0, gp_face1);

jinn_key = keyboard_check_pressed(ord("D")) || gamepad_button_check_released(0, gp_face2);
kick_key = keyboard_check_pressed(ord("A")) || gamepad_button_check_released(0, gp_face4);
kick_2_key = keyboard_check_pressed(ord("S")) || gamepad_button_check_released(0, gp_face4);

kick_key_hold = keyboard_check(ord("A")) || gamepad_button_check(0, gp_face4);
kick_2_key_hold = keyboard_check(ord("S")) || gamepad_button_check(0, gp_face4);

kick_key_release = keyboard_check_released(ord("A")) || gamepad_button_check_released(4, gp_face3);

grab_key_press = keyboard_check_pressed(ord("X")) || gamepad_button_check_released(0, gp_face3);
grab_key_hold = keyboard_check(ord("X")) || gamepad_button_check(0, gp_face3);
grab_key_release = keyboard_check_released(ord("X")) || gamepad_button_check_released(0, gp_face3);

skill_key = keyboard_check_pressed(ord("C")) || gamepad_button_check_released(0, gp_shoulderr);

inventory_key = keyboard_check_pressed(ord("V")) || gamepad_button_check_released(0, gp_shoulderr);

create_key = keyboard_check_pressed(ord("F")) || gamepad_button_check_released(0, gp_shoulderr);

aim_down_key_press = keyboard_check_pressed(ord("F")) || gamepad_button_check_pressed(4, gp_shoulderlb);
aim_down_key_hold = keyboard_check(ord("F")) || gamepad_button_check(4, gp_shoulderlb);
aim_down_key_release = keyboard_check_released(ord("F")) || gamepad_button_check_released(4, gp_shoulderlb);

aim_up_key_press = keyboard_check_pressed(ord("C")) || gamepad_button_check_pressed(4, gp_shoulderrb);
aim_up_key_hold = keyboard_check(ord("C")) || gamepad_button_check(4, gp_shoulderlb);
aim_up_key_release = keyboard_check_released(ord("C")) || gamepad_button_check_released(4, gp_shoulderlb);

aim_invert_down_key_press = keyboard_check_pressed(ord("G")) || gamepad_button_check_pressed(4, gp_shoulderlb);
aim_invert_down_key_hold = keyboard_check(ord("G")) || gamepad_button_check(4, gp_shoulderlb);
aim_invert_down_key_release = keyboard_check_released(ord("G")) || gamepad_button_check_released(4, gp_shoulderlb);

aim_invert_up_key_press = keyboard_check_pressed(ord("V")) || gamepad_button_check_pressed(4, gp_shoulderrb);
aim_invert_up_key_hold = keyboard_check(ord("V")) || gamepad_button_check(4, gp_shoulderrb);
aim_invert_up_key_release = keyboard_check_released(ord("V")) || gamepad_button_check_released(4, gp_shoulderrb);

jump_button = 0;

//Directional inputs for moves
button6 = 0;
button8 = 0;
button4 = 0;
button2 = 0;

special_move = 0;

//Shaders
upixelH = shader_get_uniform(shade_outline, "pixel_h")
upixelW = shader_get_uniform(shade_outline, "pixel_w")

texelW = texture_get_texel_width(sprite_get_texture(sprite_index, 0))
texelH = texture_get_texel_height(sprite_get_texture(sprite_index, 0))

//Audio
step_sound = snd_step

//Bullet time
bullet_time = false

//Customiztion stuff
hat_angle = 0;
hat_index = -2

has_hat = true

has_jetpack = false
jet_fuel = 20
max_jet_fuel = jet_fuel

//Palette stuff
current_pal = 30;
my_pal_sprite=spr_player_pal;

///Override stuff.
override_surface=noone;
override_pal_index=1;



/*part_emitter_region(explo, explosion, x-1, x+1, y-1, y+1, ps_shape_ellipse, ps_distr_gaussian)
part_emitter_stream(explo, explosion, debree, 1)








