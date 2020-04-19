//UI coords
var _x = 8
var _y = 8

var _y2 = 680

//Water level
draw_healthbar(_x, _y, _x + global.max_water_lvl, _y+16, global.water_lvl, c_gray, c_blue, c_aqua, 0, true, true)


//whale hp
draw_healthbar(_x, _y2, _x + global.whale_hp, _y2+16, global.whale_hp, c_gray, c_red, c_lime, 0, true, true)



//draw_text(_x, _y+32, global.water_lvl)
