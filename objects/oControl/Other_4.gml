switch room
{
	case rmMenu:
		InitCamera(1280, 720);
		SetUI(buttonoverlay.main);
		break;
	case rmLobby:
		InitCamera(1280, 720);
		SetUI(buttonoverlay.lobby);
		break;
	case rmGame:
		switch global.netStatus
		{
			case "DISCONNECTED":
				playerSpawnX = room_width * 0.5;
				playerSpawnY = room_height * 0.5;
				alarm[0] = room_speed;
				InitCamera(960, 540);
				/*
				//Spawn the level
				var hCells = mapWidth/cellSize;
				var vCells = mapHeight/cellSize;
				var oX = 520+(cellSize*0.5);
				var oY = 520+(cellSize*0.5);
				var cX;
				var cY;
				for (var i = 0; i < hCells; ++i)
				{
					cX = oX + (cellSize*i)
					//Add resource
					for (var ii = 0; ii < vCells; ++ii)
					{
						cY = oY + (cellSize*ii)
						if Chance(0.1)
						{
							with instance_create_layer(cX, cY, "Resources", oResource)
							{
								InitResource();
							}
						}
					}
				}
	
				instance_deactivate_region(cam_x, cam_y, cam_w, cam_h, false, true);
				instance_activate_region(cam_x, cam_y, cam_w, cam_h, true);
				*/
				break;
			case "SPLITSCREEN":
				break;
			case "HOST":
				break;
			case "CLIENT":
				break;
		}
		break;
}