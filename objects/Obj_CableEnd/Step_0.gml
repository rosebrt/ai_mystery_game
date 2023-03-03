event_inherited();

var first_node = cable[0];
var last_node = cable[cable_points-1];

first_node.x = x;
first_node.y = y;

// last and first node are fixed
for (var i = 1; i < cable_points-1; ++i) {
	
	var node = cable[i];
	var prev_node = cable[i-1];
	var next_node = cable[i+1];
	
	var prev_dist = point_distance(node.x,node.y,prev_node.x,prev_node.y);
	var next_dist = point_distance(node.x,node.y,next_node.x,next_node.y);
								   				
	var prev_dir = point_direction(node.x,node.y,prev_node.x,prev_node.y);
	var next_dir = point_direction(node.x,node.y,next_node.x,next_node.y);
	
	var prev_force = stiffness*(prev_dist - unit_dist);
	var next_force = stiffness*(next_dist - unit_dist);
	
	node.x_vel += lengthdir_x(prev_force,prev_dir) + lengthdir_x(next_force,next_dir);
	node.y_vel += lengthdir_y(prev_force,prev_dir) + lengthdir_y(next_force,next_dir);
	
	node.x_vel *= 0.9;
	node.y_vel *= 0.9;
	
//	//var x_dist = (cable[i-1].x - cable[i].x);
//	//var y_dist = (cable[i-1].y - cable[i].y);
	
//	//cable[i].x_vel = 0;
//	//cable[i].y_vel = 0;
	
//	//if( sqrt(x_dist*x_dist + y_dist*y_dist) > unit_dist) {
//	//	cable[i].x_vel = x_dist*0.4;
//	//	cable[i].y_vel = y_dist*0.4;
//	//}
	
//	//cable[i].x += cable[i].x_vel;
//	//cable[i].y += cable[i].y_vel;
//	//cable[i].x_vel *= (1-global.fric);
//	//cable[i].y_vel *= (1-global.fric);
}

for (var i = 1; i < cable_points-1; ++i) {
	var node = cable[i];
	node.x += node.x_vel;
	node.y += node.y_vel;
}