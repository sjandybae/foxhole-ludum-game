if(obj_player.inventory_key && grabbed == 0){

	global.inventory[global.inv_space] = object_index
	global.inv_space += 1
	instance_destroy();
	
}
