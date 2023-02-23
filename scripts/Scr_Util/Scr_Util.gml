function x_rel_rotated(_x_rel, _y_rel, _rot) {
	var base_angle = point_direction(0,0,_x_rel,_y_rel);
	var len = point_distance(0,0,_x_rel,_y_rel);
	var new_angle = clamp_degrees(base_angle + _rot);
	return lengthdir_x(len,new_angle);
}

function y_rel_rotated(_x_rel, _y_rel, _rot) {
	var base_angle = point_direction(0,0,_x_rel,_y_rel);
	var len = point_distance(0,0,_x_rel,_y_rel);
	var new_angle = clamp_degrees(base_angle + _rot);
	return lengthdir_y(len,new_angle);
}

function clamp_degrees(_angle) {
	return (_angle + 360)%360;
	
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