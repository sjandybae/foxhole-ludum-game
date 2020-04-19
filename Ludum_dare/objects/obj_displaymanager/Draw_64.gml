//UI coords
var _x = 8
var _y = 8

var _y2 = 580

//Water level
draw_healthbar(_x, _y, _x + global.max_water_lvl, _y+16, global.water_lvl, c_gray, c_blue, c_aqua, 0, true, true)


//whale hp
draw_healthbar(_x, _y2, _x+15, _y2+100, 100 - (global.whale_hp / global.whale_max_hp * 100), c_white, c_red, c_red, 3, true, false)


//draw_text(_x, _y+32, global.water_lvl)
