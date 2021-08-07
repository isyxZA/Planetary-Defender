gameLevel = 1;
levelTimer = room_speed * 30;
spawnType = spawntypes.randomcircle;
spawnCycleMax = 12;
spawnCycleCount = 0;
spawnPauseCount = 0;

enemyHealth = 10;
enemyMass = 0.5;
enemyColor = c_white;
enemySize = irandom_range(20, 80);

alarm[1] = room_speed * 2;
alarm[2] = levelTimer;
alarm[3] = room_speed * 30;