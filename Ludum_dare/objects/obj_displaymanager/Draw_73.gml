

var pl_x = obj_player.x
var wh_x = obj_whale.x


var pl_y = obj_player.y
var wh_y = obj_whale.y

//cursor X
if(pl_x <= wh_x){
	
	cur_x = lerp(cur_x, camera_get_view_x(view)+view_width, 1)
	cur_x = clamp(cur_x, camera_get_view_x(view)+view_width, wh_x)
}
else{
	cur_x = lerp(cur_x, wh_x, 1)
	cur_x = clamp(cur_x, wh_x, camera_get_view_x(view))
}

//cursor Y
if(pl_y < wh_y){
	
	cur_y = lerp(cur_y, camera_get_view_y(view)+view_height, 1)
	cur_y = clamp(cur_y, camera_get_view_y(view)+view_height, wh_y)
}
else{
	cur_y = lerp(cur_y, camera_get_view_y(view), 1)
	cur_y = clamp(cur_y, wh_y, camera_get_view_y(view))
}

draw_sprite(spr_cursors, 0, cur_x, cur_y)
