global.music_volume = 0.35;
global.music_volume_set = 0.35
global.current_music = 0
global.new_track = false;

if(global.multiplayer_mode){
	alarm[0] = 1
	global.current_music = snd_a1_intro
}
else
	global.current_music = snd_first_zone

prev_track = false

changing_music = false

