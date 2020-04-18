for(var i = 0; i < gamepad_get_device_count(); i++){
		
	if(gamepad_is_connected(i) == 1){
		global.ports[i] = 1
		
		global.connected_cont[port_no] = i
		
		port_no++
	}
	else
		global.connected_cont[port_no] = 12

}

alarm[1] = 2

port_no = 0;
