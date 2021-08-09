if !global.gameOver
{
	var c = min(0.6, 0.2 + (gameLevel * 0.01));
	if Chance(c)
	{
		enemyColor = choose(c_aqua, c_blue, c_fuchsia, c_green, c_maroon, c_orange, c_purple, c_silver, c_teal, c_yellow);
		enemySize = irandom_range(30, 60);
		spawnType = choose(spawntypes.syncedcircle, 
							spawntypes.staggeredcircle, 
							spawntypes.staggeredlines, 
							spawntypes.syncedlines,
							spawntypes.syncedstars,
							spawntypes.staggeredstars);
		spawnCycleCount = 0;
		spawnPauseCount = 5;
		oControl.alarm[3] = room_speed * 5;
	}
	else
	{
		spawnType = spawntypes.randomcircle;
		alarm[3] = room_speed * 10;
	}	
}