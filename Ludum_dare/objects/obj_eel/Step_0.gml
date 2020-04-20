/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,obj_bucket)){
	obj_bucket.hsp = abs(obj_bucket.hsp)/obj_bucket.hsp * -5
	obj_bucket.vsp = -6*sign(image_yscale)
}


if(place_meeting(x,y,obj_player) && obj_player.hold == true){
	obj_player.bucket_knocked = true
}





if(global.pause == false)
{
#region
//Rendered or not
if(rendered == false)
	visible = false
	
if(rendered == true)
	visible = true;



//Being persistent
if(possess == true){
	persistent = true;
}
else{
	persistent = false;
}

//Counter hit
if(counter || floor_bounce){
	twirl += 15;
		
	if(twirl >= 360)
		twirl = 0
}

else
	twirl = Approach(twirl, 0, 40)

//getting hurt
if(possess == true){

	if(hit == 1 && damage_boost == false)
		damage_boost = true;

	if(damage_boost == true){

		blink += 1;
	
		if(blink == 5){
			visible = false;	
		}	

		if(blink >= 10){
			visible = true;	
			blink = 0;
		}

	}

	else
		visible = true;
	
}

else
	visible = true;

//Aura
aura += 0.2;
if(aura >= pi*2)
	aura = pi*(-2);



//friction
if(land = true && hit == 1)
{
	hsp = Approach(hsp, 0, 0.3)
		
	if(hsp == 0){
			
		counter = false;
		hit = 0
			
	}
}


//var wall = obj_block || obj_backdrop;

if(land == true && hit == 0){

//Dying
	if(hp <=0 ){
		
		instance_destroy();
	}
	
}
/*
//Door transitions
if(obj_transition.mode = TRANS_MODE.INTRO){

	if(next_room == true){
		x = obj_room_prev.x + 36;
		y = y - 1;
		next_room = false
		
		obj_jinn.x = obj_room_prev.x
		obj_jinn.y = self.y
	}
					
	if(prev_room == true){
		var prev_door = instance_nearest(x, y, obj_room_next)
		x = prev_door.x - 36
		y = y - 1;
		prev_room = false
		
		obj_jinn.x = obj_room_next.x
		obj_jinn.y = self.y
	}
	
	alarm_set(5, 1);

}

if(in_door == true){

	land = true;
	var nearest_door = instance_nearest(x, y, obj_room_door)

	x = nearest_door.x + 16
	y = nearest_door.y
	
}
*/
//event_inherited();

#endregion
}
else
	image_speed = 0;
	
	