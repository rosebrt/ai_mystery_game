event_inherited();


draw_curve_sprite(cable,0,array_length(cable),0,10,Spr_Plug1Cable,0);

if(global.dev_mode) {
	draw_set_color(c_yellow);
	for (var i = 0; i < cable_points; ++i) {
		var node = cable[i];
		draw_circle(node.x,node.y,3,true);
	}
	draw_set_color(c_white);
}