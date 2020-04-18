/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(grabbed == 0)
	event_inherited();

else if(grabbed == 1){
	
	var pl = obj_player
	
	//depth = pl.depth - 1
	
	hsp = 0;
	vsp = 0;
	p_eng = 0;
	
	image_xscale = pl.image_xscale;
	
	var _x = 4
	
	x = pl.x + (_x * pl.face) 
	y = pl.y+10
	
	//Tilting
	if(abs(pl.hsp) > 2 )
		rot = Approach(rot, 45*pl.face, 0.5)
	else
		rot = lerp(rot, 0, 0.1)
		
	//Dripping water
	if(rot >= 30)
		global.water_lvl -= 0.5
	
	persistent = true	
	
}

depth = obj_player.depth - 1

