//Day passing...
global.day_timer -= 1;

//Draining whale hp
global.whale_hp -= 0.1

global.whale_hp = clamp(global.whale_hp, 0, global.whale_max_hp)

//emotions
if emotion == "normal"{
	spd = 0.04
	image_index = 0	
}

if emotion == "happy"{
	spd = 0.1
	image_index = 1	
}

if emotion == "sad"{
	spd = 0.01
	image_index = 2	
}

//breathing
wobble += spd

if(wobble >= pi)
	wobble = -pi
	
//whale sad
if (global.whale_hp / global.whale_max_hp < 0.3)
	emotion = "sad"
else if(emotion != "happy")
	emotion = "normal"
	
	
//game over
if(global.whale_hp <= 0 && global.game_over == false){
	
	with(obj_displaymanager){
		timeline_position = 0
		timeline_index = tim_game_over
		timeline_speed = 0.007
		timeline_running = true
		global.game_over = true
	}
}

//victory
if(global.day_timer <= 0){
	
	with(obj_displaymanager){
		timeline_speed = 0.007
		timeline_index = tim_victory
		timeline_running = true
	}
}
