//Enemey control panel
if(global.pause == false)
{
#region
//Rendered or not
if(rendered == false)
	visible = false
	
if(rendered == true)
	visible = true;




//Counter hit
if(counter || floor_bounce){
	twirl += 15;
		
	if(twirl >= 360)
		twirl = 0
}

else
	twirl = Approach(twirl, 0, 40)




//friction
if(land = true && hit == 1)
{
	hsp = Approach(hsp, 0, 0.3)
		
	if(hsp == 0){
			
		counter = false;
		hit = 0
			
	}
}


if(land == true && hit == 0){

//Dying
	if(hp <=0 ){
		
		instance_destroy();
	}
	
}

event_inherited();

#endregion
}
else
	image_speed = 0;
	
	