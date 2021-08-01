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
}

if room == rmGame
{
	switch global.netStatus
	{
		case "DISCONNECTED":
			if instance_exists(oPlayerONE) 
			{ 
				//Boost Bar
				bBarP1 = 100 - (100 * (oPlayerONE.boostCurTime/oPlayerONE.boostMaxTime));
				//AOE Burst Bar
				bbBarP1 = 100 * (oPlayerONE.burstCurTime/oPlayerONE.burstCooldown);
				//Hull Health Bar
				hBarP1 = oPlayerONE.hHealth;
				//Shield Level Bar
				sBarP1 = oPlayerONE.shieldHealth * 10;
				//Turret Bar
				tBarP1 = 100 * (oPlayerONE.turretCurTime/oPlayerONE.turretCooldown);
				//Missile Bar
				mBarP1 = 100 * (oPlayerONE.missileCurTime/oPlayerONE.missileCooldown);
				//Lazer Bar
				lBarP1 = 100 * (oPlayerONE.lazerCurLife/oPlayerONE.lazerMaxLife);
				//Mines Bar
				mmBarP1 = 100 - (100 * (oPlayerONE.minesActive/oPlayerONE.minesMax));
				//Track the player high score
				if scoreP1 > global.highScoreP1 { global.highScoreP1 = scoreP1; }
				//Track camera position and projection
				if oPlayerONE.isMoving
				{
					cam_x = camera_get_view_x(myCamera);
					cam_y = camera_get_view_y(myCamera);
					cam_w = camera_get_view_width(myCamera);
					cam_h = camera_get_view_height(myCamera);
				}
			}
			break;
		case "COOP":
			break;
		case "CLIENT":
			break;
		case "HOST":
			break;
	}
}