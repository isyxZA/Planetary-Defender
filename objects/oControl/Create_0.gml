randomize();
surface_depth_disable(true);
game_set_speed(60, gamespeed_fps);

enemyCount = 0;

playMusic = false;

levelLevel = 0;
levelWave = "";

enemyWaveAlert = false;
enemyWaveText = "";

aColor = c_red;

uiScale = 1;

InitCamera();
InitPlayerOne();
InitPlayerTwo();