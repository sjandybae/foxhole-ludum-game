/// @desc scr_solid(aim,obj)
/// @arg Aim, check where the player is going
/// @arg Object, check which object to collide with

var aim = argument[0]
var ob = argument[1]

var _x, _y

if(aim == "right")
	_x = bbox_right
	
if(aim == "left")
	_x = bbox_left

	
var col = place_meeting(_x, bbox_bottom, ob) || place_meeting(_x, bbox_top, ob)


return col
