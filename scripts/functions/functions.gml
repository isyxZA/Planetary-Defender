/// @description InitPlayerOne(xpos, ypos)
/// @param xpos
/// @param ypos
function InitPlayerOne(xpos, ypos)
{
	//PLAYER ONE SETUP\\
	inputP1 = "";
	spawnXP1 = xpos;
	spawnYP1 = ypos;
	scoreP1 = 0;
	hBarP1 = 0;
	//Primary Weapon Stats
	pRateP1 = 0;
	pDamageP1 = 0;
	//Secondary Weapon Stats
	sRateP1 = 0;
	sDamageP1 = 0;
	//Speed Stats
	sMaxP1 = 0;
	sAccelP1 = 0;
	//Boost Stats
	bRateP1 = 0;
	bTimeP1 = 0;
	bBarP1 = 0;
	//Shield Stats
	sStrengthP1 = 0;
	sRechargeP1 = 0;
	sBarP1 = 0;
	//Burst Stats
	bRadiusP1 = 0;
	bCooldownP1 = 0;
	bbBarP1 = 0;
	//Missiles Stats
	mVolleyP1 = 0;
	mDamageP1 = 0;
	mBarP1 = 0;
	//Lazer Stats
	lTimeP1 = 0;
	lCooldownP1 = 0;
	lBarP1 = 0;
	//Turret Stats
	tRateP1 = 0;
	tDamageP1 = 0;
	tBarP1 = 0;
	//Mines Stats
	mMaxP1 = 0;
	mRadiusP1 = 0;
	mmBarP1 = 0;
	
	//Player UI
	uimidX = 0;
	//Bottom Center Main Panel
	uiW_1a = 0;
	uiH_1a = 0;
	uiSurf_1a = -1;
	uiX_1a = 0;
	uiY_1a = 0;
	//Side Panel
	uiW_1b = 0;
	uiH_1b = 0;
	uiSurf_1b = -1;
	uiX_1b = 0;
	uiY_1b = 0;
}

/// @description InitPlayerTwo(xpos, ypos)
/// @param xpos
/// @param ypos
function InitPlayerTwo(xpos, ypos)
{
	//PLAYER TWO STATS\\
	inputP2 = "";
	spawnXP2 = xpos;
	spawnYP2 = ypos;
	scoreP2 = 0;
	hBarP2 = 0;
	//Primary Weapon Stats
	pRateP2 = 0;
	pDamageP2 = 0;
	//Secondary Weapon Stats
	sRateP2 = 0;
	sDamageP2 = 0;
	//Speed Stats
	sMaxP2 = 0;
	sAccelP2 = 0;
	//Boost Stats
	bRateP2 = 0;
	bTimeP2 = 0;
	bBarP2 = 0;
	//Shield Stats
	sStrengthP2 = 0;
	sRechargeP2 = 0;
	sBarP2 = 0;
	//Burst Stats
	bRadiusP2 = 0;
	bCooldownP2 = 0;
	bbBarP2 = 0;
	//Missiles Stats
	mVolleyP2 = 0;
	mDamageP2 = 0;
	mBarP2 = 0;
	//Lazer Stats
	lTimeP2 = 0;
	lCooldownP2 = 0;
	lBarP2 = 0;
	//Turret Stats
	tRateP2 = 0;
	tDamageP2 = 0;
	tBarP2 = 0;
	//Mines Stats
	mMaxP2 = 0;
	mRadiusP2 = 0;
	mmBarP2 = 0;
	
	//Bottom Center Main Panel
	uiW_2a = 0;
	uiH_2a = 0;
	uiSurf_2a = -1;
	uiX_2a = 0;
	uiY_2a = 0;
	//Side Panel
	uiW_2b = 0;
	uiH_2b = 0;
	uiSurf_2b = -1;
	uiX_2b = 0;
	uiY_2b = 0;
}

/// @description SetUI(overlay)
/// @param overlay
function SetUI(overlay)
{
	switch overlay
	{
		case buttonoverlay.main:
			SpawnButton(192, 192, "Singleplayer", "MAIN");
			SpawnButton(192, 320, "Multiplayer", "MAIN");
			SpawnButton(192, 448, "Exit", "MAIN");
			break;
		case buttonoverlay.sololobby:
			SpawnButton(192, 192, "Ready", "LOBBY");
			SpawnButton(192, 320, "Options", "LOBBY");
			SpawnButton(192, 448, "Back", "LOBBY");
			break;
		case buttonoverlay.cooplobby:
			SpawnButton(192, 192, "Ready", "LOBBYCOOP");
			SpawnButton(192, 320, "Options", "LOBBYCOOP");
			SpawnButton(192, 448, "Back", "LOBBYCOOP");
			break;
		case buttonoverlay.gamesolo:
			//Create the UI surfaces
			uimidX = (display_get_gui_width() * 0.5);
			//Bottom Center Main Panel
			uiW_1a = 500;
			uiH_1a = 150;
			uiSurf_1a = surface_create(uiW_1a, uiH_1a);
            surface_set_target(uiSurf_1a);
            draw_clear(c_black);
            surface_reset_target();
			uiX_1a = (display_get_gui_width() * 0.5) - (uiW_1a * 0.5);
			uiY_1a =  display_get_gui_height() - uiH_1a;
			//Side Panel
			uiW_1b = 100;
			uiH_1b = 600;
			uiSurf_1b = surface_create(uiW_1b, uiH_1b);
            surface_set_target(uiSurf_1b);
            draw_clear(c_black);
            surface_reset_target();
			uiX_1b = 0;
			uiY_1b =  display_get_gui_height() * 0.05;
			uiH_1b = display_get_gui_height() - (uiY_1b * 2);
			break;
		case buttonoverlay.gamecoop:
			//Create the UI surfaces
			uimidX = (display_get_gui_width() * 0.5);
			//PLAYER ONE\\
			//Bottom Center Main Panel
			uiW_1a = 500;
			uiH_1a = 150;
			uiSurf_1a = surface_create(uiW_1a, uiH_1a);
            surface_set_target(uiSurf_1a);
            draw_clear(c_black);
            surface_reset_target();
			uiX_1a = (display_get_gui_width() * 0.5) - (uiW_1a * 0.5);
			uiY_1a =  display_get_gui_height() - uiH_1a;
			//Side Panel
			uiW_1b = 100;
			uiH_1b = 600;
			uiSurf_1b = surface_create(uiW_1b, uiH_1b);
            surface_set_target(uiSurf_1b);
            draw_clear(c_black);
            surface_reset_target();
			uiX_1b = 0;
			uiY_1b =  display_get_gui_height() * 0.05;
			uiH_1b = display_get_gui_height() - (uiY_1b * 2);
			//PLAYER TWO\\
			//Bottom Center Main Panel
			uiW_2a = 500;
			uiH_2a = 150;
			uiSurf_2a = surface_create(uiW_2a, uiH_2a);
            surface_set_target(uiSurf_2a);
            draw_clear(c_black);
            surface_reset_target();
			uiX_2a = (display_get_gui_width() * 0.5) - (uiW_2a * 0.5);
			uiY_2a =  display_get_gui_height() - uiH_2a;
			//Side Panel
			uiW_2b = 100;
			uiH_2b = 600;
			uiSurf_2b = surface_create(uiW_2b, uiH_2b);
            surface_set_target(uiSurf_2b);
            draw_clear(c_black);
            surface_reset_target();
			uiX_2b = 0;
			uiY_2b =  display_get_gui_height() * 0.05;
			uiH_2b = display_get_gui_height() - (uiY_2b * 2);
			break;
		case buttonoverlay.options:
			break;
	}
}

/// @description SpawnButton(xpos, ypos, text, hsize, vsize)
/// @param xpos
/// @param ypos
/// @param text
function SpawnButton(xpos, ypos, text, overlay)
{
	var btn = instance_create_layer(xpos, ypos, "Buttons", oButton);
	btn.txt = text;
	btn.activeOverlay = overlay;
}

/// @description SpawnBullet(type, xpos, ypos, color, angle, hforce, vforce, scale, damage, spawner)
/// @param xpos
/// @param ypos
/// @param color
/// @param angle
/// @param hforce
/// @param vforce
/// @param scale
/// @param damage
/// @param spawner
function SpawnBullet(xpos, ypos, color, angle, hforce, vforce, scale, damage, spawner)
{
	var blt = instance_create_layer(xpos, ypos, "Players", oBullet);
	blt.bColor = color;
	blt.rot    = angle;
	blt.xForce = hforce;
	blt.yForce = vforce;
	blt.xScale = scale;
	blt.yScale = scale;
	blt.damage = damage;
	blt.owner  = spawner;
	blt.phy_fixed_rotation = true;
}

/// @description SpawnLazer(xpos, ypos, color, spawner)
/// @param xpos
/// @param ypos
/// @param color
/// @param spawner
function SpawnLazer(xpos, ypos, color, spawner)
{
	var lzr = instance_create_layer(xpos, ypos, "Players", oLazer);
	lzr.bColor = color;
	lzr.owner  = spawner;
}

/// @description SpawnBomb(xpos, ypos, color, radius, spawner)
/// @param xpos
/// @param ypos
/// @param color
/// @param radius
/// @param spawner
function SpawnBomb(xpos, ypos, color, radius, spawner)
{
	var bmb = instance_create_layer(xpos, ypos, "Players", oBomb);
	bmb.bColor = color;
	bmb.bRadius = radius;
	bmb.owner  = spawner;
}

/// @description SpawnMissile(xpos, ypos, color, target, spawner)
/// @param xpos
/// @param ypos
/// @param color
/// @param target
/// @param spawner
function SpawnMissile(xpos, ypos, color, target, spawner)
{
	var msl = instance_create_layer(xpos, ypos, "Players", oMissile);
	msl.bColor = color;
	msl.target = target;
	msl.owner  = spawner;
}

/// @description Chance(percent) Returns true or false depending on RNG
/// @param percent
function Chance(percent)
{
	return percent > random(1);
}

//CAMERA\\
/// @description InitCamera()
function InitCamera(xpos, ypos, view_width, view_height)
{
	switch room
	{
		case rmMenu:
		case rmLobby:
			//For camera follow
			view_camera[view_current] = camera_create_view(xpos, ypos, view_width, view_height);
			break;
		case rmGame:
			//For camera follow
			view_camera[view_current] = camera_create_view(xpos - (view_width * 0.5), ypos - (view_height * 0.5), 
															view_width, view_height, 0, oPlayerONE, 5, 5, 1024, 1024);
			break;
	}
	

	//Assign the camera to the active view
	myCamera = view_camera[view_current];
	//Default for 16:9
	viewRatio = 1.777777777777778;
	//Start zoom level
	zoomLevel = 2;
	//Adjust zoom speed here
	zoomSpeed = 2;
	//Speed adjustment ratio
	zSpeedAdj = 0.025;
	//Set camera initial position and size
	targetWidth  = camera_get_view_width(myCamera);
	var start_view_x  = camera_get_view_x(myCamera);
	var start_view_y  = camera_get_view_y(myCamera);
	cam_x = start_view_x;
	cam_y = start_view_y;
	cam_w = targetWidth;
	cam_h = targetWidth/viewRatio;
}