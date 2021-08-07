randomize();
surface_depth_disable(true);
game_set_speed(60, gamespeed_fps);

enemyCount = 0;

playMusic = false;

levelLevel = 0;
levelWave = "";

enemyWaveAlert = false;
enemyWaveText = "";

playerTracking = false;

aColor = c_red;

uiScale = 1;
uiOverlay = buttonoverlay.main;

doTransition = false;
flipTransition = false;
tCurX1 = 0;
tCurX2 = 0;

InitCamera();
InitPlayerOne();
InitPlayerTwo();