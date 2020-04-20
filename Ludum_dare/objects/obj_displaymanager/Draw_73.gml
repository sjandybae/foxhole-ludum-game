if(instance_exists(obj_player)){

var wh_margin = 16

var pl_x = obj_player.x
var wh_x = obj_whale.x
var bk_x = obj_bucket.x


var pl_y = obj_player.y
var wh_y = obj_whale.y-96
var bk_y = obj_bucket.y


//whale cursor
#region
//wh_cursor X
if(pl_x <= wh_x){
	
	wh_cur_x = lerp(wh_cur_x, (camera_get_view_x(view)+view_width)-wh_margin, 0.5)
	wh_cur_x = clamp(wh_cur_x, (camera_get_view_x(view)+view_width)-wh_margin, wh_x)
}
else{
	wh_cur_x = lerp(wh_cur_x, max(wh_x, camera_get_view_x(view))+wh_margin, 0.5)
	//wh_cur_x = clamp(wh_cur_x, wh_x, camera_get_view_x(view))
}

//wh_cursor Y
if(camera_get_view_y(view) < wh_y){
	
	wh_cur_y = lerp(wh_cur_y, (camera_get_view_y(view)+view_height)-wh_margin, 0.5)
	wh_cur_y = clamp(wh_cur_y, (camera_get_view_y(view)+view_height)-wh_margin, wh_y)
}
else{
	wh_cur_y = lerp(wh_cur_y, camera_get_view_y(view)+wh_margin, 0.5)
	wh_cur_y = clamp(wh_cur_y, wh_y, camera_get_view_y(view)+wh_margin)
}

if(point_distance(pl_x, pl_y, wh_x, wh_y) > 400)
	var wh_cur_alpha = 1
else
	var wh_cur_alpha = 0

draw_sprite_ext(spr_cursors, 0, wh_cur_x, wh_cur_y, 1, 1, 0, c_white, wh_cur_alpha)

#endregion



//Bucket wh_cursor
#region
//wh_cursor X
if(pl_x <= bk_x){
	
	bk_cur_x = lerp(bk_cur_x, (camera_get_view_x(view)+view_width)-wh_margin, 0.5)
	bk_cur_x = clamp(bk_cur_x, (camera_get_view_x(view)+view_width)-wh_margin, bk_x)
}
else{
	bk_cur_x = lerp(bk_cur_x, max(bk_x, camera_get_view_x(view))+wh_margin, 0.5)
	//wh_bk_cur_x = clamp(wh_bk_cur_x, wh_x, camera_get_view_x(view))
}

//wh_bk_cursor Y
if(camera_get_view_y(view) < bk_y){
	
	bk_cur_y = lerp(bk_cur_y, (camera_get_view_y(view)+view_height)-wh_margin, 0.5)
	bk_cur_y = clamp(bk_cur_y, (camera_get_view_y(view)+view_height)-wh_margin, bk_y)
}
else{
	bk_cur_y = lerp(bk_cur_y, (camera_get_view_y(view))+wh_margin, 0.5)
	bk_cur_y = clamp(bk_cur_y, bk_y, (camera_get_view_y(view))+wh_margin)
}

if(point_distance(pl_x, pl_y, bk_x, bk_y) > 400)
	var bk_cur_alpha = 1
else
	var bk_cur_alpha = 0

draw_sprite_ext(spr_cursors, 1, bk_cur_x, bk_cur_y, 1, 1, 0, c_white, bk_cur_alpha)

#endregion

}



