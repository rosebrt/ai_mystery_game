event_inherited();

tip = {
	x: x,
	y: y-1,
	x_vel: 0,
	y_vel: 0,
}

source = {
	x: 640,
	y: 130,
	x_vel: 0,
	y_vel: 0,
	powered: true
};

cable_points = 25;

cable = array_create(cable_points);
max_length = 200;
unit_dist = max_length/cable_points;
stiffness = .5; //0-1

var current_len = point_distance(tip.x,tip.y,source.x,source.y);
var current_unit = current_len/cable_points;

for (var i = 0; i < cable_points; ++i) {
	
	if(i==0)
		cable[i] = tip;
	if(i==cable_points-1)
		cable[i] = source;
	else
	    cable[i] = {
			x: x+i*current_unit,
			y: y,
			x_vel: random_range(-1,1),
			y_vel: random_range(-1,1)
		};
}