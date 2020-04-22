//Transition screen
if(mode != TRANS_MODE.OFF)
{

	draw_set_color(c_black);
	draw_set_alpha(percent)
	draw_rectangle(0, 0, w, percent * h_half, false);
	draw_rectangle(0, h, w, h-(percent * h_half), false);
	
	
}

draw_set_alpha(1)
draw_set_color(c_white);


//Pause screen
if(global.pause == true){
	draw_sprite_ext(screenshot, 0, 0, 0, 1, 1, 0, c_white, 1);
	
	draw_set_color(c_black);
	draw_set_alpha(0.5)
	draw_rectangle(0, 0, w, h, false);

	draw_set_alpha(1)	
	draw_set_font(global.fnt_normal_text);
	draw_set_halign(fa_middle);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(w/2, h/2, "PAUSED");
}

