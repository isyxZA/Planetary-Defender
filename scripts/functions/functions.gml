/// @description InitPlayerOne()
function InitPlayerOne()
{
	//PLAYER ONE SETUP\\
	inputP1 = "";
	spawnXP1 = 0;
	spawnYP1 = 0;
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
	uictrXP1 = 0;
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

/// @description InitPlayerTwo()
function InitPlayerTwo()
{
	//PLAYER TWO STATS\\
	inputP2 = "";
	spawnXP2 = 0;
	spawnYP2 = 0;
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
	
	//Player UI
	uictrXP2 = 0;
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
			SpawnButton(192, 192, 1, "Singleplayer", "MAIN");
			SpawnButton(192, 320, 1, "Multiplayer", "MAIN");
			SpawnButton(192, 448, 1, "Exit", "MAIN");
			break;
		case buttonoverlay.sololobby:
			SpawnButton((room_width * 0.5) - (sprite_get_width(sButton) * 0.5), room_height * 0.8, 1, "Ready", "LOBBY");
			SpawnButton((room_width * 0.75) - (sprite_get_width(sButton) * 0.5), room_height * 0.8, 1, "Back", "LOBBY");
			SpawnButton((room_width * 0.25) - (sprite_get_width(sButton) * 0.5), room_height * 0.8, 1, "Exit", "LOBBY");
			instance_create_layer(0, 0, "Level", oLobby);
			//Spawn Player
			oControl.spawnXP1 = room_width * 0.5;
			oControl.spawnYP1 = room_height * 0.45;
			oControl.alarm[0] = room_speed;
			//Spawn input selection
			break;
		case buttonoverlay.cooplobby:
			SpawnButton((room_width * 0.5) - (sprite_get_width(sButton) * 0.5), room_height * 0.8, 1, "Ready", "LOBBYCOOP");
			SpawnButton((room_width * 0.75) - (sprite_get_width(sButton) * 0.5), room_height * 0.8, 1, "Back", "LOBBYCOOP");
			SpawnButton((room_width * 0.25) - (sprite_get_width(sButton) * 0.5), room_height * 0.8, 1, "Exit", "LOBBYCOOP");
			instance_create_layer(0, 0, "Level", oLobby);
			//Spawn Players
			oControl.spawnXP1 = room_width * 0.4;
			oControl.spawnYP1 = room_height * 0.45;
			oControl.spawnXP2 = room_width * 0.6;
			oControl.spawnYP2 = room_height * 0.45;
			oControl.alarm[0] = room_speed;
			//Spawn input selection
			break;
		case buttonoverlay.gamesolo:
			//Create the UI surfaces
			uictrXP1 = (display_get_gui_width() * 0.5);//UI X Center
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
			uiScale = 0.8;
			//PLAYER ONE\\
			uictrXP1 = (display_get_gui_width() * 0.25);//UI X Center
			//Bottom Center Main Panel
			uiW_1a = 500;//Width
			uiH_1a = 150;//Height
			uiSurf_1a = surface_create(uiW_1a, uiH_1a);
            surface_set_target(uiSurf_1a);
            draw_clear(c_black);
            surface_reset_target();
			uiX_1a = (display_get_gui_width() * 0.25) - ((uiW_1a * uiScale) * 0.5);//X Origin
			uiY_1a =  display_get_gui_height() - (uiH_1a * uiScale);//Y Origin
			//Side Panel
			uiW_1b = 100;//Width
			uiH_1b = 600;//Height
			uiSurf_1b = surface_create(uiW_1b, uiH_1b);
            surface_set_target(uiSurf_1b);
            draw_clear(c_black);
            surface_reset_target();
			uiX_1b = 0;//X Origin
			uiY_1b =  display_get_gui_height() * 0.05;//Y Origin
			uiH_1b = display_get_gui_height() - (uiY_1b * 2);//Adjust display height
			//PLAYER TWO\\
			uictrXP2 = (display_get_gui_width() * 0.75);
			//Bottom Center Main Panel
			uiW_2a = 500;//Width
			uiH_2a = 150;//Height
			uiSurf_2a = surface_create(uiW_2a, uiH_2a);
            surface_set_target(uiSurf_2a);
            draw_clear(c_black);
            surface_reset_target();
			uiX_2a = (display_get_gui_width() * 0.75) - ((uiW_2a * uiScale) * 0.5);//X Origin
			uiY_2a =  display_get_gui_height() - (uiH_2a * uiScale);//Y Origin
			//Side Panel
			uiW_2b = 100;//Width
			uiH_2b = 600;//Height
			uiSurf_2b = surface_create(uiW_2b, uiH_2b);
            surface_set_target(uiSurf_2b);
            draw_clear(c_black);
            surface_reset_target();
			uiX_2b = display_get_gui_width() - (uiW_2b * uiScale);//X Origin
			uiY_2b = display_get_gui_height() * 0.05;//Y Origin
			uiH_2b = display_get_gui_height() - (uiY_2b * 2);//Adjust display height
			break;
		case buttonoverlay.options:
			break;
	}
}

/// @description SpawnButton(xpos, ypos, text, hsize, vsize)
/// @param xpos
/// @param ypos
/// @param scale
/// @param text
function SpawnButton(xpos, ypos, scale, text, overlay)
{
	var btn = instance_create_layer(xpos, ypos, "Buttons", oButton);
	btn.txt = text;
	btn.activeOverlay = overlay;
	btn.image_xscale = scale;
	btn.image_yscale = scale;
	btn.xmid = xpos + ((sprite_get_width(sButton) * scale) * 0.5);
	btn.ymid = ypos + ((sprite_get_height(sButton) * scale) * 0.5);
}

/// @description SpawnBoundary(xpos, ypos, xscale, yscale)
/// @param xpos
/// @param ypos
/// @param xscale
/// @param yscale
function SpawnBoundary(xpos, ypos, xscale, yscale)
{
	var bdr = instance_create_layer(xpos, ypos, "Players", oBoundary);
	bdr.image_xscale = xscale;
	bdr.image_yscale = yscale;
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

/// @description SpawnFlare(xpos, ypos, xSize, ySize, color)
function SpawnFlare(xpos, ypos, xSize, ySize, color)
{
	var flr = instance_create_layer(xpos, ypos, "Players", oFlares);
	flr.fColor = color;
	flr.xTarget = xSize;
	flr.yTarget = ySize;
}

/// @description Chance(percent) Returns true or false depending on RNG
/// @param percent
function Chance(percent)
{
	return percent > random(1);
}

//CAMERA\\
/// @description InitCamera()
function InitCamera()
{
	//Camera
	myCamera = -1;
	//Default for 16:9
	viewRatio = 1.777777777777778;
	//Zoom level
	zoomLevel = 0;
	//zZoom speed
	zoomSpeed = 2;
	//Speed adjustment ratio
	zSpeedAdj = 0.025;
	//Position and size
	targetWidth = 0;
	cam_x = 0;
	cam_y = 0;
	cam_w = 0;
	cam_h = 0;
}

/// @description SpawnCamera()
function SpawnCamera(xpos, ypos, view_width, view_height)
{
	switch room
	{
		case rmMenu:
			//For camera follow
			view_camera[0] = camera_create_view(xpos, ypos, view_width, view_height);
			//Assign the camera to the active view
			myCamera = view_camera[0];
			break;
		case rmGame:
			//For camera follow
			view_camera[0] = camera_create_view(xpos - (view_width * 0.5), ypos - (view_height * 0.5), 
															view_width, view_height, 0, oControl, 5, 5, 1024, 1024);
			//Assign the camera to the active view
			myCamera = view_camera[0];
			zoomLevel = 2;
			targetWidth = 1366;
			break;
	}
}