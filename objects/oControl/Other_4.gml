global.canClick = true;

switch room
{
	case rmMenu:
		InitCamera(0, 0, 1280, 720);
		SetUI(buttonoverlay.main);
		break;
	case rmGame:
		playMusic = true;
		switch global.gameMode
		{
			case "SOLO":
				spawnXP1 = room_width * 0.5;
				spawnYP1 = room_height * 0.55;
				alarm[0] = room_speed;
				x = spawnXP1;
				y = spawnYP1;
				InitCamera(spawnXP1, spawnYP1, 1366, 768);
				SetUI(buttonoverlay.gamesolo);
				break;
			case "COOP":
				spawnXP1 = room_width * 0.45;
				spawnYP1 = room_height * 0.55;
				spawnXP2 = room_width * 0.55;
				spawnYP2 = room_height * 0.55;
				alarm[0] = room_speed;
				x = room_width * 0.5;
				y = room_height * 0.55;
				InitCamera(room_width * 0.5, room_height * 0.5, 1366, 768);
				SetUI(buttonoverlay.gamecoop);
				break;
		}
		break;
}