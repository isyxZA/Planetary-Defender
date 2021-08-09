/// @description Increment Level
++gameLevel;

//Adjust enemy difficulty by level
if global.gameMode == "SOLO"
{
	++enemyHealth;
}
else
{
	enemyHealth += 2;
}


//Adjust special waves spawn amount
if spawnCycleMax < 48
{
	++spawnCycleMax;
}

alarm[2] = levelTimer;