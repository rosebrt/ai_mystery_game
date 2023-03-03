// Inherit the parent event
event_inherited();

wall_map = [	[1,1,1,1,1,1,1,1,1,1],
				[1,0,0,0,0,0,0,0,0,1],
				[1,0,0,0,0,0,0,0,0,1],
				[1,1,1,0,0,0,0,0,0,1],
				[1,1,1,0,0,0,0,0,0,1],
				[1,0,0,0,0,1,1,0,0,1],
				[1,0,0,0,0,1,1,0,0,1],
				[1,0,0,0,0,0,0,0,0,1],
				[1,0,0,0,0,0,0,0,0,1],
				[1,1,1,1,1,1,1,1,1,1]	];
grid_scale = 10;	
			
ball = {
	size: 0.6,
	x: 6,
	y: 3,
	xsp: .1,
	ysp: .1
}

function touching_wall(_x, _y) {
	var gx = floor(_x)
	var gy = floor(_y)
	
	if(outside_bounds(_x,_y))
		return true;
	
	return( wall_map[gy][gx] == 1)
}

function outside_bounds(_x, _y) {
	return(_x < 0 || _y < 0 || _x > 9 || _y > 9)
}