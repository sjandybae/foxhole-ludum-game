//event_inherited()
//polygon = polygon_from_instance(id)


//template control panel
if(global.pause == false){
#region
//Possessed movement



//On the ground or not
if(!place_meeting(x, y+1, obj_block) /*&& !place_meeting(x, y+1, obj_backdrop)*/)
		land = false
	else
		land = true

var hsp_final = hsp + hsp_carry;
hsp_carry = 0;

//Moving outside of wall
if(place_meeting(x, y, obj_block))
	move_outside_all(90*image_xscale, 1)

//Horizontal collision
if (place_meeting(x+hsp_final, y, obj_block))
{
	//Slope
	yplus = 0;
	
	while(place_meeting(x + hsp_final, y - yplus, obj_block) && yplus <= abs(1 * hsp_final)) yplus += 1;
	
	if(place_meeting(x + hsp_final, y - yplus, obj_block)){
	
		while (!place_meeting(x+sign(hsp_final), y, obj_block))
		{
			x = x + sign(hsp_final);
		}

		hsp_final = 0;
		hsp = 0;
		
	}
	else
	{
		y -= yplus;	
	}
	
	
}
x = x + hsp_final;


//Down slope
/*	if(hsp_final != 0){
		if(place_meeting(x, y+vsp+2, obj_slope)){
			
			while(!place_meeting(x + hsp_final, y+vsp, obj_block))//if(!place_meeting(x+hsp_final, y+vsp, obj_slope))
			{
				y += 1;
			}
		}
	}*/

//Vertical collision
/*var platform = instance_place(x, y + vsp, obj_backdrop)

if(platform){

	if(bbox_bottom < platform.bbox_top){
		while (!place_meeting(x, y+sign(vsp), platform))
		{
			y = y + sign(vsp);
		}
	
		hsp_carry = platform.hsp;
	
		land = true;
	
		vsp = 0;
	}
}*/

//verticel collision

if (place_meeting(x, y+vsp, obj_block))
{
	while (!place_meeting(x, y+sign(vsp), obj_block))
	{
		y = y + sign(vsp);
	}
	
	land = true;
	
	vsp = 0;
}

if(vsp != 0)
	land = false;

y = y + vsp;

//Vertical movement
if(grav != 0){

	if(land == false)
		vsp = vsp + grav;
	if(vsp > 9.8)
		vsp = 9.8;
	
}

#endregion
}

else
	image_speed = 0;
