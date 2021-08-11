/// @description Increment Level
++gameLevel;

//Adjust enemy difficulty by level
if global.gameMode == "SOLO"
{
	enemyHealth += 3;
}
else
{
	enemyHealth += 6;
}


//Adjust special waves spawn amount
if spawnCycleMax < 62
{
	++spawnCycleMax;
}

alarm[2] = levelTimer;