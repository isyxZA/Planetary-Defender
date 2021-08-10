/// @description Stat Tracking, Camera
if room == rmGame
{
	var tw = targetWidth;//Camera target width
	if !global.gameOver
	{
		if instance_exists(oPlanet) && oPlanet.pHealth <= 0
		{
			global.gameOver = true;
			alarm[7] = room_speed;
			if instance_exists(oPlayerONE) { with oPlayerONE { instance_destroy(); } }
			if instance_exists(oPlayerTWO) { with oPlayerTWO { instance_destroy(); } }
			camera_set_view_target(myCamera, oPlanet);
			targetWidth = 1270;
		}
		
		if instance_exists(oLevels)
		{
			levelLevel = oLevels.gameLevel;
			switch oLevels.spawnType
			{
				case spawntypes.randomcircle:
					levelWave = "Random Wave";
					break;
				case spawntypes.syncedcircle:
					levelWave = "Synced Circle";
					break;
				case spawntypes.staggeredcircle:
					levelWave = "Staggered Circle";
					break;
				case spawntypes.syncedlines:
					levelWave = "Synced Lines";
					break;
				case spawntypes.staggeredlines:
					levelWave = "Staggered Line";
					break;
			}
		}
		if global.gameMode == "SOLO"
		{
			if instance_exists(oPlayerONE) 
			{ 
				//Player controls
				inputP1 = oPlayerONE.playerInput;
				//Boost Bar
				bBarP1 = 100 - (100 * (oPlayerONE.boostCurTime/oPlayerONE.boostMaxTime));
				//AOE Burst Bar
				bbBarP1 = 100 * (oPlayerONE.burstCurTime/oPlayerONE.burstCooldown);
				//Hull Health Bar
				hBarP1 = oPlayerONE.hHealth;
				//Shield Level Bar
				sBarP1 = oPlayerONE.shieldHealth * 10;
				//Turret Bar
				tBarP1 = 100 * (oPlayerONE.turretCurTime/oPlayerONE.turretCooldown);
				//Missile Bar
				mBarP1 = 100 * (oPlayerONE.missileCurTime/oPlayerONE.missileCooldown);
				//Lazer Bar
				lBarP1 = 100 * (oPlayerONE.lazerCurLife/oPlayerONE.lazerMaxLife);
				//Mines Bar
				mmBarP1 = 100 - (100 * (oPlayerONE.minesActive/oPlayerONE.minesMax));
				//Track the player high score
				if scoreP1 > global.highScoreP1 { global.highScoreP1 = scoreP1; }
			
				x = oPlayerONE.phy_position_x;
				y = oPlayerONE.phy_position_y;
				
				var pd = point_distance(x, y, oPlanet.x, oPlanet.y) + 1024;
				tw = max(targetWidth, min(4096, pd));
			}
			else
			{
				if playerTracking 
				{ 
					camera_set_view_target(myCamera, oPlanet);
					targetWidth = 1270;
					tw = targetWidth;
					global.gameOver = true; 
					alarm[7] = room_speed;
				}
			}
		}
		else if global.gameMode == "COOP"
		{
			var pone = false;
			var ptwo = false;
			if instance_exists(oPlayerONE) 
			{ 
				pone = true;
				//Player controls
				inputP1 = oPlayerONE.playerInput;
				//Boost Bar
				bBarP1 = 100 - (100 * (oPlayerONE.boostCurTime/oPlayerONE.boostMaxTime));
				//AOE Burst Bar
				bbBarP1 = 100 * (oPlayerONE.burstCurTime/oPlayerONE.burstCooldown);
				//Hull Health Bar
				hBarP1 = oPlayerONE.hHealth;
				//Shield Level Bar
				sBarP1 = oPlayerONE.shieldHealth * 10;
				//Turret Bar
				tBarP1 = 100 * (oPlayerONE.turretCurTime/oPlayerONE.turretCooldown);
				//Missile Bar
				mBarP1 = 100 * (oPlayerONE.missileCurTime/oPlayerONE.missileCooldown);
				//Lazer Bar
				lBarP1 = 100 * (oPlayerONE.lazerCurLife/oPlayerONE.lazerMaxLife);
				//Mines Bar
				mmBarP1 = 100 - (100 * (oPlayerONE.minesActive/oPlayerONE.minesMax));
				//Track the player high score
				if scoreP1 > global.highScoreP1 { global.highScoreP1 = scoreP1; }
			}
		
			if instance_exists(oPlayerTWO) 
			{ 
				ptwo = true;
				//Player controls
				inputP2 = oPlayerTWO.playerInput;
				//Boost Bar
				bBarP2 = 100 - (100 * (oPlayerTWO.boostCurTime/oPlayerTWO.boostMaxTime));
				//AOE Burst Bar
				bbBarP2 = 100 * (oPlayerTWO.burstCurTime/oPlayerTWO.burstCooldown);
				//Hull Health Bar
				hBarP2 = oPlayerTWO.hHealth;
				//Shield Level Bar
				sBarP2 = oPlayerTWO.shieldHealth * 10;
				//Turret Bar
				tBarP2 = 100 * (oPlayerTWO.turretCurTime/oPlayerTWO.turretCooldown);
				//Missile Bar
				mBarP2 = 100 * (oPlayerTWO.missileCurTime/oPlayerTWO.missileCooldown);
				//Lazer Bar
				lBarP2 = 100 * (oPlayerTWO.lazerCurLife/oPlayerTWO.lazerMaxLife);
				//Mines Bar
				mmBarP2 = 100 - (100 * (oPlayerTWO.minesActive/oPlayerTWO.minesMax));
				//Track the player high score
				if scoreP2 > global.highScoreP2 { global.highScoreP2 = scoreP2; }
			}
		
			if pone && ptwo 
			{ 
				if oPlayerONE.playerInput == "KEYBOARD" && oPlayerTWO.playerInput == "KEYBOARD" { global.splitKeyboard = true; }
				else { global.splitKeyboard = false; }
			
				x = (oPlayerONE.phy_position_x + oPlayerTWO.phy_position_x) * 0.5; 
				y = (oPlayerONE.phy_position_y + oPlayerTWO.phy_position_y) * 0.5;
			
				tw = max(targetWidth, min(4096, abs(oPlayerONE.x - oPlayerTWO.x) + 512), min(4096, (abs(oPlayerONE.y - oPlayerTWO.y) + 512) * viewRatio));
			}
			else if pone 
			{  
				x = oPlayerONE.phy_position_x; 
				y = oPlayerONE.phy_position_y;
				global.splitKeyboard = false;
				var pd = point_distance(x, y, oPlanet.x, oPlanet.y) + 1024;
				tw = max(targetWidth, min(4096, pd));
			}
			else if ptwo 
			{ 
				x = oPlayerTWO.phy_position_x; 
				y = oPlayerTWO.phy_position_y;
				global.splitKeyboard = false;
				var pd = point_distance(x, y, oPlanet.x, oPlanet.y) + 1024;
				tw = max(targetWidth, min(4096, pd));
			}
			else
			{
				//Both players are dead
				if playerTracking 
				{ 
					camera_set_view_target(myCamera, oPlanet);
					targetWidth = 1270;
					tw = targetWidth;
					global.gameOver = true; 
					alarm[7] = room_speed;
				}
			}
		}
	}
	//Camera width and height control
	if camera_get_view_width(myCamera) != tw 
	{
	var view_dif = (camera_get_view_width(myCamera)-tw);
	var start_view_x = camera_get_view_width(myCamera);
	var start_view_y = camera_get_view_height(myCamera);
	if camera_get_view_width(myCamera) < tw 
	{
		camera_set_view_size(myCamera, camera_get_view_width(myCamera) - (view_dif*(zoomSpeed*zSpeedAdj)), camera_get_view_height(myCamera));
		camera_set_view_size(myCamera, camera_get_view_width(myCamera), camera_get_view_width(myCamera) / viewRatio);
		//Center the view
		camera_set_view_pos(myCamera, camera_get_view_x(myCamera)-(abs(camera_get_view_width(myCamera) - start_view_x)/2), 
								        camera_get_view_y(myCamera)-(abs(camera_get_view_height(myCamera)- start_view_y)/2));
	}
	else if camera_get_view_width(myCamera) > tw 
	{ 
		camera_set_view_size(myCamera, camera_get_view_width(myCamera) + (view_dif*-(zoomSpeed*zSpeedAdj)), camera_get_view_height(myCamera));
		camera_set_view_size(myCamera, camera_get_view_width(myCamera), camera_get_view_width(myCamera)/viewRatio);
		//Center the view
		camera_set_view_pos(myCamera, camera_get_view_x(myCamera)+(abs(camera_get_view_width(myCamera) - start_view_x)/2), 
								        camera_get_view_y(myCamera)+(abs(camera_get_view_height(myCamera)- start_view_y)/2));
	}

	//Keeps the view inside the room
	camera_set_view_pos(myCamera, clamp(camera_get_view_x(myCamera), 256, room_width - (camera_get_view_width(myCamera) + 256)),
									clamp(camera_get_view_y(myCamera), 256, room_height - (camera_get_view_height(myCamera) + 256)));
	}
	
	//Track camera projection
	cam_x = camera_get_view_x(myCamera);
	cam_y = camera_get_view_y(myCamera);
	cam_w = camera_get_view_width(myCamera);
	cam_h = camera_get_view_height(myCamera);
	
	//Parallax Stars
	layer_x("BG1", cam_x * 0.25);
	layer_y("BG1", cam_y * 0.15);
	layer_x("BG0", cam_x * 0.5);
	layer_y("BG0", cam_y * 0.4);
}
else if room == rmMenu
{
	var p1 = false;
	var p2 = false;
	
	if instance_exists(oPlayerONE) { p1 = true; }
	if instance_exists(oPlayerTWO) { p2 = true; }
	
	if p1 && p2
	{
		if oPlayerONE.playerInput == "KEYBOARD" && oPlayerTWO.playerInput == "KEYBOARD"
		{
			global.splitKeyboard = true;
		}
		else 
		{
			global.splitKeyboard = false;
		}
	}
	else if p1
	{
		global.splitKeyboard = false;
	}
}

if doTransition
{
	if !flipTransition
	{
		if tCurX2 < room_width { tCurX2 = lerp(tCurX2, room_width*2, 0.02); }
		else { flipTransition = true; }
	}
	else
	{
		if tCurX1 < room_width { tCurX1 = lerp(tCurX1, room_width*2, 0.02); }
		else 
		{ 
			//End of transition
			doTransition = false; 
			if startGame
			{
				startGame = false;
				audio_stop_all();
				room_goto(rmGame);
			}
		}
	}
}