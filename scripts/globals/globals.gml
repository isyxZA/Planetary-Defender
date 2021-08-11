global.gameMode = "SOLO";
global.gameOver = false;
global.splitKeyboard = false;

global.canClick = true; 
global.debug = false;

global.controllers = ds_list_create();
ds_list_clear(global.controllers);
global.highScoreP1 = 0;
global.highScoreP2 = 0;

global.particleSystem = -1;

#macro DROPRATE 0.3
#macro c_steelblue make_color_rgb(58, 125, 165)
#macro c_fuelyellow make_color_rgb(244, 166, 36)
#macro c_ashgray make_color_rgb(174, 180, 183)