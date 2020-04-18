/*image_xscale = image_xscale * sign(obj_player.image_xscale);

if(obj_player.kick == 1 && obj_player.trigger == false){
x = obj_player.x + 5 * obj_player.face
y = obj_player.y+10;
}

if(obj_player.trigger == true){
	
	if(obj_player.kick == 1 || obj_player.kick == 5){
	x = obj_player.x + 22 * obj_player.face
	y = obj_player.y+7;
	}
	
	if(obj_player.kick == 2){
	x = obj_player.x + 20 * obj_player.face
	y = obj_player.y;
	}
	
}

if(obj_player.kick == 2)
	image_yscale = 2.5
	
if(obj_player.kick == 5){
	//image_yscale = 100
	//image_xscale = 100;
	
	x = obj_player.x + 8 * obj_player.face
	y = obj_player.y+7;
	
}
	
if(obj_player.kick == 1 && obj_player.trigger == true)
	image_yscale = 1.2
	
if(obj_player.kick == 1 && obj_player.trigger == false)
	image_yscale = 1
	