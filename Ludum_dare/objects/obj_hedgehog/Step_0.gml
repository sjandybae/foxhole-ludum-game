/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(mode == "passive"){
	hsp = 1 * face
	if(place_meeting(x+hsp,y,obj_block)){//Wallbump
		 hsp = 0
		 face *= -1
		 vsp -= 1
	}
}

if(mode == "balled"){
	twirl = sin(state_timer)*state_timer/10 //IMPORTANT GET DURRANI TO HELP
	hsp /= 2
	if(state_timer < 1){
		face *= -1
		vsp = -3
		mode = "passive"
	}
}

//IMPORTANT GETTING HIT WITH BUCKET BALLS HOG

if(place_meeting(x,y,obj_player)){//player bounce
	obj_player.vsp = -3
	//PLAYER DROP BUCKET
	//obj_player.hsp = lerp(x, obj_player.x, 0)	//IMPORTANT, PLATER HORIZONTAL KNOCKBACK
	state_timer = 60*3
	mode = "balled"
}

if(state_timer > 0){
	state_timer -= 1
}