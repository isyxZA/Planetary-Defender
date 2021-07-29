/// @description Camera Controls
 
//Zoom the view to target width and height
if camera_get_view_width(myCamera) != targetWidth 
{
    var view_dif = (camera_get_view_width(myCamera)-targetWidth);
    start_view_x = camera_get_view_width(myCamera);
    start_view_y = camera_get_view_height(myCamera);
    if camera_get_view_width(myCamera) < targetWidth 
	{
		camera_set_view_size(myCamera, camera_get_view_width(myCamera)-(view_dif*(zoomSpeed*zSpeedAdj)), camera_get_view_height(myCamera));
		camera_set_view_size(myCamera, camera_get_view_width(myCamera), camera_get_view_width(myCamera)/viewRatio);
        //Center the view
		camera_set_view_pos(myCamera, camera_get_view_x(myCamera)-(abs(camera_get_view_width(myCamera) -start_view_x)/2), 
				                        camera_get_view_y(myCamera)-(abs(camera_get_view_height(myCamera)-start_view_y)/2));
    }
    else if camera_get_view_width(myCamera) > targetWidth 
	{ 
		camera_set_view_size(myCamera, camera_get_view_width(myCamera)+(view_dif*-(zoomSpeed*zSpeedAdj)), camera_get_view_height(myCamera));
		camera_set_view_size(myCamera, camera_get_view_width(myCamera), camera_get_view_width(myCamera)/viewRatio);
        //Center the view
		camera_set_view_pos(myCamera, camera_get_view_x(myCamera)+(abs(camera_get_view_width(myCamera) -start_view_x)/2), 
				                        camera_get_view_y(myCamera)+(abs(camera_get_view_height(myCamera)-start_view_y)/2));
    }

	//Keeps the view inside the room
	camera_set_view_pos(myCamera, clamp(camera_get_view_x(myCamera), 256, room_width - (camera_get_view_width(myCamera) + 256)),
									clamp(camera_get_view_y(myCamera), 256, room_height- (camera_get_view_height(myCamera) + 256)));
										

	cam_x = camera_get_view_x(myCamera);
	cam_y = camera_get_view_y(myCamera);
	cam_w = camera_get_view_width(myCamera);
	cam_h = camera_get_view_height(myCamera);
	//instance_deactivate_region(cam_x, cam_y, cam_w, cam_h, false, true);
	//instance_activate_region(cam_x, cam_y, cam_w, cam_h, true);
	//instance_activate_object(oPlayerONE);
}

if instance_exists(oPlayerONE) && oPlayerONE.isMoving
{
	cam_x = camera_get_view_x(myCamera);
	cam_y = camera_get_view_y(myCamera);
	cam_w = camera_get_view_width(myCamera);
	cam_h = camera_get_view_height(myCamera);
	
	//instance_deactivate_region(cam_x, cam_y, cam_w, cam_h, false, true);
	//instance_activate_region(cam_x, cam_y, cam_w, cam_h, true);
	//instance_activate_object(oPlayerONE);
}