var bbox_side;

if(hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left

if collision_point(bbox_side+hsp, bbox_bottom-1, obj_block,false,false) || collision_point(bbox_side+hsp, bbox_top, obj_block,false,false){

	
	if(hsp > 0) x = x - (x mod 16) + 15 - (bbox_right - x)
	else x = x - (x mod 16) - (bbox_right - x)
	hsp=0
	
}
