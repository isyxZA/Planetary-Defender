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
				playerSpawnY = room_height * 0.55;
				alarm[0] = room_speed;
				InitCamera(1366, 768);
				SetUI(buttonoverlay.gamesolo);
				break;
			case "COOP":
				break;
			case "HOST":
				break;
			case "CLIENT":
				break;
		}
		break;
}