/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

obj_timer -= 1

if(obj_timer < 0){
	if place_meeting(x,y+16, obj_block){
		vsp = -7
		hsp = 2 * -face
	}
	obj_timer = 130
}

if(place_meeting(x,y+16, obj_block)){
	hsp /= 1.1
}

if(place_meeting(x,y,obj_player)){//player bounce
	obj_player.vsp = -3
	//PLAYER DROP BUCKET
	//obj_player.hsp = lerp(x, obj_player.x, 0)	//IMPORTANT, PLATER HORIZONTAL KNOCKBACK
	player_stun_timer = 30
	obj_player.bucket_knocked = true
	if(obj_player.x - x < 0){
		obj_player.hsp = - 5
	} else {
		obj_player.hsp = 5
	}
}

if(place_meeting(x+hsp,y,obj_block)){//Wallbump
	 hsp = 0
	 face *= -1
}