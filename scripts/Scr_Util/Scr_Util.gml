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