//pal_swap_init_system(shd_pal_swapper);

ideal_width = 0
ideal_height = 360

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

//Keeping player score
global.score_keeping = array_create(4, 0)

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



//cursors
wh_cur_x = 0;
wh_cur_y = 0;

bk_cur_x = 0;
bk_cur_y = 0;





