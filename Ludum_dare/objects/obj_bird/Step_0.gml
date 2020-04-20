/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(mode == "passive"){
	if(obj_timer < 1){
		if(roam < 1){//Return to origin
			x = homex
			y = homey
			//hsp = lerp(x,homex,0.1)
			//vsp = lerp(y,homey,0.1)
			roam = random_range(3,5)
		} else {
			randomize()
			hsp = random_range(-2, 2)
			vsp = random_range(-2, 2)
			roam -= 1
		}
		obj_timer = 60*random_range(2,5)
	}
	hsp /= fric
	vsp /= fric
	obj_timer -= 1
	if(distance_to_object(obj_player) < 32*2){
		mode = "attack"
	}
}


if(mode == "attack"){
	hsp = lerp(x, obj_player.x, 0.1)
	vsp = lerp(y, obj_player.y, 0.1)
}

//After bird is hit by bucket, reset it's ability to be hit by bucket.