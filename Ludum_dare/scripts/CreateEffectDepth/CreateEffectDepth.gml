/// @desc CreateEffectDepth(object_effect, x_cord, y_cord, depth, color, sound)
/// @arg object_effect is the effect to be created
/// @arg x_cord is the x position
/// @arg y_cord is the y position
/// @arg depth is the depth at which it will be created
/// @arg color is its image color
/// @arg souond is the sound it will play

var fx = instance_create_depth(argument1, argument2, argument3, argument0);

fx.image_blend = argument4

if(argument5 != false){
	
	audio_play_sound(argument5, 1, 0);
	
}