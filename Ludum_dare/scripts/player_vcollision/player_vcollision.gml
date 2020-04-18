var bbox_side;

if(vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top

if collision_point(bbox_right, bbox_side+vsp, obj_block,false,false) || collision_point(bbox_left, bbox_side+vsp, obj_block,false,false){ 
	
	if(vsp > 0){
		y = y - (y mod 32) + 31 - (bbox_bottom - y)
	}
	
	else y = y - (y mod 32) - (bbox_top - y)
	vsp=0
}

