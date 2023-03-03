cam = view_camera[0];
view_size_h = camera_get_view_height(cam);
view_size_w = camera_get_view_width(cam);
view_size_half_h = 0.5*view_size_h;
view_size_half_w = 0.5*view_size_w;
surface_resize( application_surface, view_size_w, view_size_h );
display_set_gui_size(view_size_w, view_size_h);

global.mouse = instance_create_depth(0,0,0,Obj_Mouse);
global.desk = instance_create_depth(0,0,0,Obj_Desk);


global.fric = 0.1;

global.dev_mode = true;