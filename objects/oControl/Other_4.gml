switch room
{
	case rmMenu:
		InitCamera(0, 0, 1280, 720);
		SetUI(buttonoverlay.main);
		break;
	case rmLobby:
		InitCamera(0, 0, 1280, 720);
		SetUI(buttonoverlay.lobby);
		break;
	case rmGame:
		alarm[1] = room_speed;
		switch global.netStatus
		{
			case "DISCONNECTED":
				spawnXP1 = room_width * 0.5;
				spawnYP1 = room_height * 0.55;
				alarm[0] = room_speed;
				InitCamera(spawnXP1, spawnYP1, 1366, 768);
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