for(var j = 0; j < room_height; j+=16){
		for(var i = 0; i < room_width; i+=16){
			
			randomize();
			var chance = irandom_range(0,10)
			var spikes = place_meeting(x, y, obj_spikes)
			
			//fawna
			if(!place_meeting(i, j-1, obj_block) && place_meeting(i, j+1, obj_block)) && !spikes{
				
				//rocks n bones
				if(chance == 0 || chance == 1){
					var debree = instance_create_depth(i+8, j+16+random_range(0,2), 1, obj_deco)
					debree.sprite_index = spr_stlag2
					debree.image_index = irandom_range(0, 7)
					debree.random_wind = 0
				}
				
			}
			
			//stalagtites
			if(place_meeting(i, j-1, obj_block) && !place_meeting(i, j+1, obj_block)) && !spikes{
				
				//stalagtites
				if(chance >= 5){
					var rock = instance_create_depth(i+8, j-8, 1, obj_deco)
					rock.sprite_index = spr_stlag2
					rock.image_index = irandom_range(3,6)
					rock.image_yscale = -1
					rock.random_wind = 0
				}
				
				
			}
		}
	}