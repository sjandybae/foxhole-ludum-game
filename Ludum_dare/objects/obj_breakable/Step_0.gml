/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var bucket = obj_bucket

if(collision_rectangle(x-4, y-4, x+36, y+36, bucket, false, true)) && (bucket.hsp != 0 || bucket.vsp != 0) && bucket.land == false{
	destroy = true

	with(bucket){
		hsp = hsp * -0.5
		vsp = vsp * -0.5
	}
}

if(destroy)
	instance_destroy()
