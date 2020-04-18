if( activate == true && is_gui == true ){

	message_x = obj_camera.view_w
	message_y = obj_camera.view_h

	if(is_off == false)
		margin = 16

	draw_set_font(global.fnt_normal_text);

	//Draw text box
	draw_set_alpha(1);
	draw_set_color(c_orange);
	
	for(var i = 0; i < 4; i += 0.05)
		draw_roundrect(message_x - half_w - margin - i, message_y - margin - h - (38+i), message_x + half_w + margin + i, message_y - margin - (22-i), true);
	//draw_sprite(spr_text_arrow, 0, x, y - margin - 19)
	
	draw_set_alpha(0.75);
	draw_set_color(c_black);
	draw_roundrect(message_x - half_w - margin, message_y - margin - h - 38, message_x + half_w + margin, message_y - margin - 22, false);

	//write message
	draw_set_alpha(1);
	draw_set_color(text_color);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	//if(index != string_length(message) )
		//draw_sprite_ext(spr_text_arrow, 0, x + half_w + 6, y - margin - 32 + sin(angle/2), 0.5, 0.5, 0, c_white, 1)
	
	draw_text( message_x, message_y - h - 38, current_string );
	
	draw_set_color(c_white);
	

}

/*else if(distance_to_object(obj_player) < 20)
	draw_sprite_ext(spr_arrow, 1, x, y + (sin(angle)*2) - 29, 1 + (sin(angle))/6, 1 - (sin(angle))/6, 0, c_white, 1);