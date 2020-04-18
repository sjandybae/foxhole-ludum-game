/// @desc Approach(start, limit, increment)
/// @arg Start is the value that needs to approach
/// @arg Limit is the value it will end at
/// @arg Increment is the speed at which the value will approach

var start, ending, difference;
 
start = argument0;
ending = argument1;
difference = argument2;
 
var result;
 
if (start < ending){
    result = min(start + difference, ending);
}else{
    result = max(start - difference, ending);
}
 
return result;

/*if(argument0 < argument1){
	argument0 += argument2;
		if(argument0 >= argument1)
			argument0 = argument1;

		return argument0;
}


if(argument0 > argument1){
	argument0 -= argument2;
		if(argument0 <= argument1)
			argument0 = argument1;
			
		return argument0;
}