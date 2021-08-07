global.gameMode = "SOLO";
global.gameOver = false;
global.splitKeyboard = false;

global.canClick = true; 
global.debug = false;

global.controllers = ds_list_create();
ds_list_clear(global.controllers);
global.highScoreP1 = 0;
global.highScoreP2 = 0;

#macro DROPRATE 0.3