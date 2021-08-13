global.canClick = true;

switch room
{
	case rmMenu:
		playMusic = true;
		global.gameOver = false;
		SpawnCamera(0, 0, 1280, 720);
		uiOverlay = buttonoverlay.main;
		SetUI(uiOverlay);
		alarm[9] = -1;
		break;
	case rmGame:
		alarm[9] = random_range(room_speed * 1, room_speed * 2);
		playMusic = true;
		global.gameOver = false;
		playerTracking = false;
		switch global.gameMode
		{
			case "SOLO":
				scoreP1 = 0;
				spawnXP1 = room_width * 0.5;
				spawnYP1 = room_height * 0.55;
				alarm[0] = room_speed;
				x = spawnXP1;
				y = spawnYP1;
				SpawnCamera(spawnXP1, spawnYP1, 960, 540);
				uiOverlay = buttonoverlay.gamesolo;
				SetUI(uiOverlay);
				break;
			case "COOP":
				scoreP1 = 0;
				scoreP2 = 0;
				spawnXP1 = room_width * 0.45;
				spawnYP1 = room_height * 0.55;
				spawnXP2 = room_width * 0.55;
				spawnYP2 = room_height * 0.55;
				alarm[0] = room_speed;
				x = room_width * 0.5;
				y = room_height * 0.55;
				SpawnCamera(room_width * 0.5, room_height * 0.55, 0, 0);
				uiOverlay = buttonoverlay.gamecoop;
				SetUI(uiOverlay);
				break;
		}
		break;
}