//pal_swap_init_system(shd_pal_swapper);

image_speed = 0;

//ideal_width = 0
//ideal_height = 360

global.multiplayer_mode = false

//Multiplayer rules
#region

global.max_points = 5
global.player_scores = array_create(global.max_points, 0)

global.player_scores = array_length_2d(global.player_scores, global.max_points)
global.player_scores = array_height_2d(4)

//Set value of scores
for(var i = 0; i < 4; i++){

	for(var j = 0; j < global.max_points; j++)
		global.player_scores[i, j] = 0;
	
}


#endregion

global.zoom = 1;
global.screen_shake = 0;

follow = obj_player;
spd = 0.12

aspect_ratio = display_get_width()/display_get_height();

view_height = 360 //def 1080/3
view_width = view_height * aspect_ratio

window_scale = 2

window_set_size(view_width*window_scale, view_height*window_scale)

alarm[0] = 1

surface_resize(application_surface, view_width*window_scale*global.zoom, view_height*window_scale*global.zoom)

/*
aspect_ratio = display_get_width()/display_get_height();

ideal_width = round(ideal_height * aspect_ratio)


if(ideal_width & 1)
	ideal_width++


for(var i = 1; i < room_last; i++){

	if(room_exists(i)){
		
		room_set_v
	
	}

}
*/


//game states
global.game_over = false
global.victory = false
cut_alpha = 0;
alpha_approach = 0

text_alpha = 0
text_alpha_approach = 0

//Fonts
message = 0;
global.fnt_normal_text = font_add_sprite_ext(spr_box_font, "!',.?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 0123456789-", true, 0);
global.fnt_sml_text = font_add_sprite_ext(spr_sml_font, "!',.?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 0123456789-", true, 0);



//cursors
wh_cur_x = 0;
wh_cur_y = 0;

bk_cur_x = 0;
bk_cur_y = 0;

//UI
alert_timer = 0;
global.happy_timer = 0;

whale_ui_hp = 0;



