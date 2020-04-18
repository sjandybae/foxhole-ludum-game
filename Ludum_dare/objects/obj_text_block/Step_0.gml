angle += 0.3;
	if(angle >= pi*2)
		angle = pi*(-2);

/*if(distance_to_object(obj_player) < 20 && obj_player.up_key_press){
	activate = true;
	obj_player.has_control = false;
}*/

//if(is_gui)
//	font = global.fnt_normal_text
if(is_off == true){

	margin = lerp(margin, 0, 0.05)
	h = lerp(h, 0, 0.05)
	w = lerp(w, 0, 0.05)
	
	current_string = ""

}

draw_set_font(font);

if(distance_to_object(obj_player) < 20 && activate == true && is_off == false){
		
	h = string_height(current_string);
	
	w = string_width(current_string);
		half_w = w/2;
	
	//Text speed
	if( obj_player.grab_key_press || obj_player.kick_key)
		scroll = 1;
		
	else
		scroll = 0.5;
	
	//Waiting for player to press button

	//Text color
	if(string_char_at(message, index) == "@"){
			
		text_color = c_orange
	}
	
	if(string_char_at(message, index) == "+"){
			
		text_color = c_white
	}

	//Typing the dialogue
	if(string_char_at(message, index) != "*" && string_char_at(message, index) != "%"){
		
		if(new_line mod(2) == 0)
			letters += scroll;
			
		index += scroll;
		
		current_string = string_copy( message, next_index, round(letters) )
		
		if(string_char_at(current_string, letters) != " " && letters < string_length(message))
			alarm_set(0, 1.5);
			
		audio_sound_pitch(snd_text_box, random_range(0.7,1))
	}
	else{
		
		if(new_line mod(2) == 0 && string_char_at(message, index) == "*")
			new_line += 1;
	}
	
	//Closing dialogue
	if( global.interact_key && string_char_at(current_string, string_length(current_string)) == "%"){
		obj_player.has_control = true;
		activate = false;
	}
	
	//Getting new line
	if((global.interact_key || obj_player.grab_key_press || obj_player.kick_key) && new_line mod(2) == 1){
		index += 1
		next_index = index;
		letters = 1;
		new_line += 1
	}


}

else{
	h = 0;
	letters = 0;
	spread = 1;	
	activate = false;
	index = 1;
	next_index = 1
	new_line = 0;
}

