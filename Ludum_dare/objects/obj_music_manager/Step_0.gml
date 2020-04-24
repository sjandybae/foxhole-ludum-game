audio_group_load(audiogroup_music)

audio_group_set_gain(audiogroup_music, global.music_volume, 0)

global.music_volume = lerp(global.music_volume, global.music_volume_set, 0.05)

if(!audio_is_playing(global.current_music)){
	
	//audio_play_sound(global.current_music, 2, 0)
}
	
//changing tracks
if(changing_music == true){

	timeline_index = tim_music_change
	timeline_speed = 0.025
	timeline_running = true
	
}
else{
	timeline_running = false
	timeline_position = 0	
}
