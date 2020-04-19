/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(grabbed == 0){
	event_inherited();
	
	var tilt = abs(rot)
	
	if(abs(rot) >= 360)
		rot = 0
	
	if(tilt > 30 && tilt < 330) && !place_meeting(x, y, obj_water) && global.water_lvl > 0 && land{
		
		instance_create_depth(x,y,depth+1,obj_droplet)
		global.water_changed_timer = 60;
		global.water_lvl -= 0.5
	}
		
	depth = obj_player.depth - 1
}

else if(grabbed == 1){
	
	var pl = obj_player
	
	depth = pl.depth - 1
	
	hsp = 0;
	vsp = 0;
	p_eng = 0;
	
	image_xscale = pl.image_xscale;
	
	var _x = 2
	
	if(pl.crawl){
		y = pl.y-8*pl.squish
	}
	else
		y = pl.y-26*pl.squish
	
	x = pl.x - (_x * pl.face) 
	
	
	//Tilting
	if(abs(pl.hsp) > 2 )
		rot = Approach(rot, 45*pl.face, 0.5)
	else
		rot = lerp(rot, 0, 0.1)
		
	//Dripping water
	if(abs(rot) >= 30){
		global.water_changed_timer = 60;
		global.water_lvl -= 0.5
		if(global.water_lvl > 0)
			instance_create_depth(x,y,depth+1,obj_droplet)
	}
	persistent = true	
	
	
	//Restoring squish
	h_squish = Approach(h_squish, 1, 0.1)
	v_squish = Approach(v_squish, 1, 0.1)
	
}



