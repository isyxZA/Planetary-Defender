///@description Spawn the player 
if global.gameMode == "SOLO"
{
	instance_create_layer(spawnXP1, spawnYP1, "Players", oPlayerONE);
}
else if global.gameMode == "COOP"
{
	instance_create_layer(spawnXP1, spawnYP1, "Players", oPlayerONE);
	instance_create_layer(spawnXP2, spawnYP2, "Players", oPlayerTWO);
}

if room == rmGame 
{
	instance_create_layer(0, 0, "Level", oLevels);
}