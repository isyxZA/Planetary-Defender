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
				var spx = room_width * 0.5;
				var spy = room_height * 0.55;
				InitPlayerOne(spx, spy);
				alarm[0] = room_speed;
				InitCamera(spx, spy, 1366, 768);
				SetUI(buttonoverlay.gamesolo);
				break;
			case "COOP":
				var spx1 = room_width * 0.45;
				var spy1 = room_height * 0.55;
				var spx2 = room_width * 0.45;
				var spy2 = room_height * 0.55;
				InitPlayerOne(spx1, spy1);
				InitPlayerTwo(spx2, spy2);
				alarm[0] = room_speed;
				InitCamera(spx1, spy1, 1366, 768);
				SetUI(buttonoverlay.gamecoop);
				break;
		}
		break;
}