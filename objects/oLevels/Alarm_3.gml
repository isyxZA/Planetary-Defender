if !global.gameOver
{
	if Chance(0.25)
	{
		enemyColor = choose(c_aqua, c_blue, c_fuchsia, c_green, c_maroon, c_orange, c_purple, c_silver, c_teal, c_yellow);
		enemySize = irandom_range(30, 60);
		spawnType = choose(spawntypes.syncedcircle, spawntypes.staggeredcircle, spawntypes.staggeredlines, spawntypes.syncedlines);
		spawnCycleCount = 0;
		spawnPauseCount = 5;
		oControl.alarm[3] = room_speed * 5;
	}
	else
	{
		spawnType = spawntypes.randomcircle;
		alarm[3] = room_speed * irandom_range(4, 8);
	}	
}