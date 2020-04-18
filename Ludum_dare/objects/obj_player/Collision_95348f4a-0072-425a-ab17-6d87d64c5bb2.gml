//Grabbing and throwing bucket

//Placing bucket down
if(grab_key_press && down_key && other.grabbed == 1){
	
	other.x = x
	other.grabbed = 0
	other.rot = 0
	other.land = false
	
}

//Throwing bucket
if(grab_key_press && other.grabbed == 1){
	
	//global.water_lvl = 0
	
	other.grabbed = 0
	
	//thorwing up
	if(up_key){
		other.hsp = hsp
		other.vsp = -9
	}
	
	else{
		other.hsp = face*5
		other.vsp = -6
	}
	
}

//Picking up bucket
else if(grab_key_press && other.grabbed == 0 ){
	
	other.rot = 0;
	other.grabbed = 1
	
}