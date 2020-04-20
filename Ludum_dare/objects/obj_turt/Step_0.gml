/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(mode == "passive"){
	sprite_index = spr_turt
	hsp = 0.5 * -face
	if(place_meeting(x+hsp,y,obj_block)){//Wallbump
		 hsp = 0
		 face *= -1
	}
}

if(mode == "shelled"){
	twirl = sin(state_timer)*state_timer/10 //IMPORTANT GET DURRANI TO HELP
	hsp /= 2
	sprite_index = spr_turt_shell
	if(state_timer < 1){
		face *= -1
		vsp = -3
		mode = "passive"
	}
}

//IMPORTANT GETTING HIT WITH BUCKET SHELLS TURT

if(place_meeting(x,y,obj_player)){//player bounce
	if(obj_player.vsp > 0){
		obj_player.vsp = -9
		state_timer = 60*3
		mode = "shelled"
	}
}

if(state_timer > 0){
	state_timer -= 1
}