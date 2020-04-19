//UI coords
var _x = 50
var _y = 50

var _y2 = 674

//Water level
//draw_healthbar(_x, _y, _x + global.max_water_lvl, _y+16, global.water_lvl, c_gray, c_blue, c_aqua, 0, true, true)
//draw_text(_x, _y, global.water_lvl)

//whale hp
draw_healthbar(_x + 3, _y2-86, _x + 12, _y2, 100 - (global.whale_hp / global.whale_max_hp * 100), c_gray, c_red, c_red, 3, true, false)
draw_sprite(spr_whale_ui, 0, _x, display_get_gui_height() - 80)


