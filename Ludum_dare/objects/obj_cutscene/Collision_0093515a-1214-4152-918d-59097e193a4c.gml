global.cutscene = true
obj_camera.cutscene_spd = 0.03
obj_player.has_control = false

with(obj_camera){
	timeline_index = cut_test
	timeline_position = 0;
}

instance_destroy();

