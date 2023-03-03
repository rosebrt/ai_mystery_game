#macro SCREENGREEN #7EB581

enum drag_modes {
	directional,
	leaning,
	still,
}

function ds_list_swap(_list,_index1,_index2) {
	var temp = _list[| _index1];
	_list[| _index1] = _list[| _index2];
	_list[| _index2] = temp;
}

function bubble_sort_depth(_list) {
	var n = ds_list_size(_list);
	for (var i = 0; i < n-1; ++i) {
	    for (var j = 0; j < n-i-1; ++j) {
		    if( _list[| j].depth > _list[| j+1].depth )
				ds_list_swap(_list,j+1,j);
		}
	}
	return _list;
}

enum sn_type {
	out_node,
	in_node
}

function create_snapnode(_type,_parent,_id="any",_dir=0,_x_rel=0,_y_rel=0) {
	var sn = instance_create_depth(_parent.x+_x_rel,_parent.y+_y_rel,0,Obj_SnapNode);
	
	sn.sn_type = _type;
	sn.parent_item = _parent;
	sn.snap_id = _id;
	sn.dir = _dir;
	sn.x_rel = _x_rel;
	sn.y_rel = _y_rel;
	
	return sn;
}