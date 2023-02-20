#macro SCREENGREEN #7EB581

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