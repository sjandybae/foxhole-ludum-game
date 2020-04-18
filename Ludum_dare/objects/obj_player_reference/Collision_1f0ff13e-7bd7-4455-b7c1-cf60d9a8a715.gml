if(other.player_no != player_no) && other.dead == false{
	
	if(abs(hsp) > 4 && land == false){
		other.hsp = hsp * 0.9
		
		can_fire = true
		
		//vsp = abs(hsp) * -0.9
		hsp = hsp * -0.9
		
		/*if(other.ammo > 0 && ammo != max_ammo){
			ammo += 1
			other.ammo -= 1
		}*/
		
		CreateEffect(obj_hit_spark, x, y, "Effects", c_white, snd_kick)
		ball_jump = true

	}
	
	if(vsp > 3 && land == false){
		
		var my_vsp = abs(vsp)
		var their_vsp = abs(other.vsp)
		
		if(jump_key_hold)
			vsp = -7
			
		else
			vsp = max(my_vsp, their_vsp) * -0.9
		
		other.vsp = max(my_vsp, their_vsp) * 0.9
		
		if(other.ammo > 0 && ammo != max_ammo){
			ammo += 1
			other.ammo -= 1
		}
		
		CreateEffect(obj_hit_spark, x, y, "Effects", c_white, snd_kick)
		ball_jump = true

	}
	
	/*else if(abs(hsp) > abs(other.hsp)){
		other.hsp = hsp
		//hsp = Approach(hsp, 0, 0.25)
	}*/
	
}
