function x_rel_rotated(_x_rel, _y_rel, _rot) {
	///Returns an x position rotated by the given angle, but still relative to the original point
	var base_angle = point_direction(0,0,_x_rel,_y_rel);
	var len = point_distance(0,0,_x_rel,_y_rel);
	var new_angle = clamp_degrees(base_angle + _rot);
	return lengthdir_x(len,new_angle);
}

function y_rel_rotated(_x_rel, _y_rel, _rot) {
	///Returns a y position rotated by the given angle, but still relative to the original point
	var base_angle = point_direction(0,0,_x_rel,_y_rel);
	var len = point_distance(0,0,_x_rel,_y_rel);
	var new_angle = clamp_degrees(base_angle + _rot);
	return lengthdir_y(len,new_angle);
}

function clamp_degrees(_angle) {
	return (_angle + 720)%360;
	
}

function approach_angle(_angle,_target,_step ) {
	//returns the given angle, shifted my step size, towards the destination
	var diff = angle_difference(_target,_angle);
	if ( diff <= _step )
		return _target;
	return _angle + (_step*sign(diff));
}

function instance_nearest_except(_x, _y, _obj, _exception) {
    var inst = noone;
    var distClosest = infinity;
    with (_obj) {
        var dist = point_distance(x, y, _x, _y);
        if (id != _exception && dist < distClosest) {
            inst = id;
            distClosest = dist;
        }
    }
    return inst;
}

function snapnode_nearest_in(_x, _y) {
    var inst = noone;
    var distClosest = infinity;
    with (Obj_SnapNode) {
        var dist = point_distance(x, y, _x, _y);
        if (self.type == sn_type.in_node && dist < distClosest) {
            inst = id;
            distClosest = dist;
        }
    }
    return inst;
}

function rotate_sprite_offset(_inst,_x_rel,_y_rel,_angle) {
	
	_inst.image_angle += _angle;
	var xm = x_rel_rotated(_x_rel,_y_rel,_angle);
	var ym = y_rel_rotated(_x_rel,_y_rel,_angle);
	
	_inst.x += (_x_rel - xm);
	_inst.y += (_y_rel - ym);
	
}
	
//CARDINAL CURVE
function draw_curve(points_list, list_start=0, list_end, tension) {
	
	var ps = [];
	var points_len = array_length(points_list);
	
	if points_len < 2 return;
	

	for(var i = list_start; i < list_end + 1; i++) {
		if i == list_start ps[array_length(ps)] = points_list[i];
		if i < list_end ps[array_length(ps)] = points_list[i];
		else ps[array_length(ps)] = points_list[list_end-1];
	}

	
	for(var i = 1; i < array_length(ps) - 2; i++) {
		
	    var p0 = ps[i - 1];
	    var p1 = ps[i];
	    var p2 = ps[i + 1];
	    var p3 = ps[i + 2];
		
		var m1x = (1 - tension) * (p2.x - p1.x + ((p1.x - p0.x) / 1 - (p2.x - p0.x) * 0.5));
		var m2x = (1 - tension) * (p2.x - p1.x + ((p3.x - p2.x) / 1 - (p3.x - p1.x) * 0.5));
		var m1y = (1 - tension) * (p2.y - p1.y + ((p1.y - p0.y) / 1 - (p2.y - p0.y) * 0.5));
		var m2y = (1 - tension) * (p2.y - p1.y + ((p3.y - p2.y) / 1 - (p3.y - p1.y) * 0.5));
		
	    var ax = 2 * p1.x - 2 * p2.x + m1x + m2x;
	    var ay = 2 * p1.y - 2 * p2.y + m1y + m2y;
	    var bx = -3 * p1.x + 3 * p2.x - 2 * m1x - m2x;
	    var by = -3 * p1.y + 3 * p2.y - 2 * m1y - m2y;
	    var cx = m1x;
	    var cy = m1y;
	    var dx = p1.x;
	    var dy = p1.y;
		
		var amount = 15; // number of points in each segment, 25 is fine
		var prevx = dx;
		var prevy = dy;

	    for(var j = 1; j <= amount; j++) {
	        var t = j / amount;
	        var px = ax * t * t * t + bx * t * t + cx * t + dx;
	        var py = ay * t * t * t + by * t * t + cy * t + dy;
			
			draw_line(px, py, prevx, prevy);
			
			prevx = px;
			prevy = py;
	    }
	}
}
	
function draw_curve_ext(points_list, list_start=0, list_end, tension, _resolution=15, _width, _color) {
	
	var ps = [];
	var points_len = array_length(points_list);
	
	if points_len < 2 return;
	

	for(var i = list_start; i < list_end + 1; i++) {
		if i == list_start ps[array_length(ps)] = points_list[i];
		if i < list_end ps[array_length(ps)] = points_list[i];
		else ps[array_length(ps)] = points_list[list_end-1];
	}

	
	for(var i = 1; i < array_length(ps) - 2; i++) {
		
	    var p0 = ps[i - 1];
	    var p1 = ps[i];
	    var p2 = ps[i + 1];
	    var p3 = ps[i + 2];
		
		var m1x = (1 - tension) * (p2.x - p1.x + ((p1.x - p0.x) / 1 - (p2.x - p0.x) * 0.5));
		var m2x = (1 - tension) * (p2.x - p1.x + ((p3.x - p2.x) / 1 - (p3.x - p1.x) * 0.5));
		var m1y = (1 - tension) * (p2.y - p1.y + ((p1.y - p0.y) / 1 - (p2.y - p0.y) * 0.5));
		var m2y = (1 - tension) * (p2.y - p1.y + ((p3.y - p2.y) / 1 - (p3.y - p1.y) * 0.5));
		
	    var ax = 2 * p1.x - 2 * p2.x + m1x + m2x;
	    var ay = 2 * p1.y - 2 * p2.y + m1y + m2y;
	    var bx = -3 * p1.x + 3 * p2.x - 2 * m1x - m2x;
	    var by = -3 * p1.y + 3 * p2.y - 2 * m1y - m2y;
	    var cx = m1x;
	    var cy = m1y;
	    var dx = p1.x;
	    var dy = p1.y;
		
		var amount = _resolution; // number of points in each segment, 25 is fine
		var prevx = dx;
		var prevy = dy;

	    for(var j = 1; j <= amount; j++) {
	        var t = j / amount;
	        var px = ax * t * t * t + bx * t * t + cx * t + dx;
	        var py = ay * t * t * t + by * t * t + cy * t + dy;
			
			draw_line_width_color(px, py, prevx, prevy, _width, _color, _color);
			
			prevx = px;
			prevy = py;
	    }
	}
}
	
function draw_curve_sprite(points_list, _x_offset=0, _y_offset=0, tension, _resolution=15, _sprite, _frame=0, _color=c_white, _alpha=1) {
	
	var ps = [];
	var points_len = array_length(points_list);
	var list_end = points_len;
	var padding = 0.5;
	if(_alpha != 1)
		padding = 0;
	
	var _sprite_width = sprite_get_width(_sprite);
	
	if points_len < 2 return;
	

	for(var i = 0; i < list_end + 1; i++) {
		if i == 0 ps[array_length(ps)] = points_list[i];
		if i < list_end ps[array_length(ps)] = points_list[i];
		else ps[array_length(ps)] = points_list[list_end-1];
	}

	
	for(var i = 1; i < array_length(ps) - 2; i++) {
		
	    var p0 = ps[i - 1];
	    var p1 = ps[i];
	    var p2 = ps[i + 1];
	    var p3 = ps[i + 2];
		
		var m1x = (1 - tension) * (p2.x - p1.x + ((p1.x - p0.x) / 1 - (p2.x - p0.x) * 0.5));
		var m2x = (1 - tension) * (p2.x - p1.x + ((p3.x - p2.x) / 1 - (p3.x - p1.x) * 0.5));
		var m1y = (1 - tension) * (p2.y - p1.y + ((p1.y - p0.y) / 1 - (p2.y - p0.y) * 0.5));
		var m2y = (1 - tension) * (p2.y - p1.y + ((p3.y - p2.y) / 1 - (p3.y - p1.y) * 0.5));
		
	    var ax = 2 * p1.x - 2 * p2.x + m1x + m2x;
	    var ay = 2 * p1.y - 2 * p2.y + m1y + m2y;
	    var bx = -3 * p1.x + 3 * p2.x - 2 * m1x - m2x;
	    var by = -3 * p1.y + 3 * p2.y - 2 * m1y - m2y;
	    var cx = m1x;
	    var cy = m1y;
	    var dx = p1.x;
	    var dy = p1.y;
		
		var amount = _resolution; // number of points in each segment, 25 is fine
		var prevx = dx;
		var prevy = dy;

	    for(var j = 1; j <= amount; j++) {
	        var t = j / amount;
	        var px = ax * t * t * t + bx * t * t + cx * t + dx;
	        var py = ay * t * t * t + by * t * t + cy * t + dy;
			
			var angle = point_direction(prevx,prevy,px,py);
			var length = point_distance(prevx,prevy,px,py)+padding;
			
			draw_sprite_ext(_sprite,_frame,px+_x_offset,py+_y_offset,length/_sprite_width,1,angle,_color,_alpha);
			
			prevx = px;
			prevy = py;
	    }
	}
}