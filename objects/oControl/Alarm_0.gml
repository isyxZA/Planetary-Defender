///@description Spawn the player 
if global.gameMode == "SOLO"
{
	instance_create_layer(spawnXP1, spawnYP1, "Players", oPlayerONE);
	instance_create_layer(0, 0, "UIControl", oLevels);
}
else if global.gameMode == "COOP"
{
	instance_create_layer(spawnXP1, spawnYP1, "Players", oPlayerONE);
	instance_create_layer(spawnXP2, spawnYP2, "Players", oPlayerTWO);
	instance_create_layer(0, 0, "UIControl", oLevels);
}
