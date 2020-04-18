
//Bouncing on enemey's head with shield
/*if(place_meeting(x, y+1, other) && other.hit == 0 && kick == 8){
	
	other.hp -= 2
	other.hit = 1;
	other.hsp = max(3 * image_xscale, hsp)
	other.vsp = -3;
	
	if(jump_key_hold)
		vsp = jspd
	else
		vsp = -5
	
	CreateEffectDepth(obj_hit_spark, x, y+24, depth-1, c_white, snd_hit)
	
	var shield = instance_nearest(x, y, obj_shield)
	
	shield.durability -= 1

}*/
if( ((abs(hsp) > 5 || ball_jump == true) && !place_meeting(x, y+1, obj_block)) || can_fire == false) && (other.hit == 0 || other.combo == 0){
	
	
	if(place_meeting(x, y+vsp, other))
		vsp =  min(-5, abs(hsp) * -0.8)
	
	else{
		vsp = abs(hsp) * -0.8
		hsp = hsp * -0.8
	}
	
	CreateEffect(obj_hit_spark, x, y, "Effects", c_white, false)
	audio_play_sound(snd_hit, 1, 0)
	can_fire = true
	ball_jump = true
	
	
	
	with(other){
	
		hit = 1;
		combo = 1;
		
		alarm_set(0, 20);
		
		hsp = other.hsp*-0.5
		vsp = -5
		hp -= 1;
	
	}
	
	
				
}

else if(possessed == false && hurt == false && invinsible == false && other.possess == false && other.hit == 0){
			
	hp -= 1;
	hurt = true;
	invinsible = true;
	
	recoil_angle = -20*face
	
	if(x < other.x)
		hsp = (4 + (random_range(-0.5, 0.5)) ) * (-1);
	
	if(x > other.x)
		hsp = (4 + (random_range(-0.5, 0.5)) ) ;
		
	vsp = -4;
	
	CreateEffect(obj_hit_spark, x, y, "Effects", c_white, snd_kick)
	
	alarm_set(4, 50)
	
	alarm_set(2, 10)
}
