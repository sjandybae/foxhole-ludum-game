for(var j = 0; j < room_height; j+=16){
		for(var i = 0; i < room_width; i+=16){
			
			randomize();
			var chance = irandom_range(0,10)
			var spikes = place_meeting(x, y, obj_spikes)
			
			//fawna
			if(!place_meeting(i, j-1, obj_block) && place_meeting(i, j+1, obj_block)) && !spikes{
				
				//plants
				if(chance == 0 || chance == 1)
					instance_create_depth(i+8, j+16+random_range(0,4), 1, obj_deco)
					
				//grass
				if(chance == 2 || chance == 3){
					var grass = instance_create_depth(i+8, j+16+random_range(0,2), 1, obj_deco)
					grass.image_index = irandom_range(8, 9)
				}
					
				//rocks
				else if(chance == 2 || chance == 4)
					instance_create_depth(i+8, j+8, 1, obj_rock+irandom_range(0,2))

				
			}
			
			//stalagtites and vines
			if(place_meeting(i, j-1, obj_block) && !place_meeting(i, j+1, obj_block)) && !spikes{
				
				//stalagtites
				if(chance == 0){
					var rock = instance_create_depth(i+8, j+24+random_range(-4,0), 1, obj_deco)
					rock.sprite_index = spr_stlag
					rock.image_index = irandom_range(0,1)
					rock.random_wind = 0
				}
				
				//vines
				if(chance == 1 || chance == 2){
					var vine = instance_create_depth(i+8, j+random_range(-4,0), 1, obj_deco)
					vine.image_index = irandom_range(3,14)
					
					if(vine.image_index == 3 || vine.image_index == 4)
						vine.random_wind = 0
					
					vine.image_yscale = -1
				}
				
			}
		}
	}