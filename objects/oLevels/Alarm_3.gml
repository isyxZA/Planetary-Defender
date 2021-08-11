/// @description Choose Special Waves
if !global.gameOver
{
	var c = min(0.8, 0.25 + (gameLevel * 0.02));
	if Chance(c)
	{
		enemyColor = choose(c_aqua, c_blue, c_fuchsia, c_green, c_maroon, c_orange, c_purple, c_silver, c_teal, c_yellow);
		enemySize = irandom_range(30, 60);
		spawnType = choose(spawntypes.syncedcircle, 
							spawntypes.staggeredcircle, 
							spawntypes.syncedcircle, 
							spawntypes.staggeredcircle,
							spawntypes.syncedlines,
							spawntypes.syncedlines,
							spawntypes.staggeredlines, 
							spawntypes.syncedstars,
							spawntypes.syncedstars,
							spawntypes.staggeredstars,
							spawntypes.syncedhuge,
							spawntypes.staggeredhuge);
		spawnCycleCount = 0;
		spawnShape = choose("Circle", "Box", "Triangle", "Star");
		switch spawnType
		{
			case spawntypes.staggeredlines:
			case spawntypes.staggeredstars:
			case spawntypes.staggeredhuge:
			case spawntypes.syncedhuge:
				spawnPauseCount = 0;
				oControl.alarm[3] = room_speed;
				break;
			default:
				spawnPauseCount = 5;
				oControl.alarm[3] = room_speed * 4;
				break;
		}
	}
	else
	{
		spawnType = spawntypes.randomcircle;
		alarm[3] = room_speed * 10;
	}	
}