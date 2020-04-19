//Draining whale hp
global.whale_hp -= 0.1

global.whale_hp = clamp(global.whale_hp, 0, global.whale_max_hp)

wobble += 0.04

if(wobble >= pi)
	wobble = -pi

