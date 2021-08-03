/// @description Player Inputs
switch playerInput
{
	case "GAMEPAD":
		if gamePad != -1
		{
			//Game Pad Inputs\\
			//Determine movement direction
			var hxa = gamepad_axis_value(gamePad, gp_axislh);
			var hya = gamepad_axis_value(gamePad, gp_axislv);
	
			var tRatio;
			if isBoosting { tRatio = 0.05; }
			else { tRatio = 0.1; }
	
			if hAxis != hxa { hAxis = lerp(hAxis, hxa, tRatio); }
			if vAxis != hya { vAxis = lerp(vAxis, hya, tRatio); }

			if hAxis != 0 || vAxis != 0
			{

				//phy_rotation = point_direction(0, 0, hAxis, vAxis);
				isMoving = true;
			}
			else
			{
				isMoving = false;
			}
	
			//Determine look angle
			var hPoint = gamepad_axis_value(gamePad, gp_axisrh);
			var vPoint = gamepad_axis_value(gamePad, gp_axisrv);

			if hPoint != 0 || vPoint != 0
			{
				mTimer = 0;
				var pdir = point_direction(0, 0, hPoint, -vPoint);
				phy_rotation += angle_difference(pdir, phy_rotation) * 0.1;
			}
			else
			{
				if mTimer < room_speed { ++mTimer; }
				if mTimer >= room_speed
				{
					var pdir = point_direction(0, 0, hAxis, -vAxis);
					phy_rotation += angle_difference(pdir, phy_rotation) * 0.1;
				}
			}
	
			//Activate speed boost
			if gamepad_button_check_pressed(gamePad, gp_shoulderl)
			{
				if boostCurTime < boostMaxTime { isBoosting = true; }
			}
			if gamepad_button_check_released(gamePad, gp_shoulderl)
			{
				isBoosting = false;
			}
	
			//Activate AOE Burst
			if gamepad_button_check_pressed(gamePad, gp_shoulderr)
			{
				if canBurst 
				{
					canBurst = false;
					burstCurTime = 0;
					alarm[5] = 1;
				}
			}
	
			//Shoot weapons
			//Fire main guns
			if gamepad_button_check_pressed(gamePad, gp_shoulderrb)
			{
				shootPrimary = true;
			}
			if gamepad_button_check_released(gamePad, gp_shoulderrb)
			{
				shootPrimary = false;
			}
			//Fire secondary guns
			if gamepad_button_check_pressed(gamePad, gp_shoulderlb)
			{
				shootSecondary = true;
			}
			if gamepad_button_check_released(gamePad, gp_shoulderlb)
			{
				shootSecondary = false;
			}
			//Fire auto turret
			if gamepad_button_check_pressed(gamePad, gp_face3)
			{
				if canTurret
				{
					canTurret = false;
					shootTurret = true;
					turretCurTime = 0;
					turretCurVolley = 0;
					alarm[3] = turretRate;
				}
			}
			//Fire lazer
			if gamepad_button_check_pressed(gamePad, gp_face4)
			{
				if canLazer
				{
					canLazer = false;
					shootLazer = true;
					//Spawn lazer
					SpawnLazer(phy_position_x, phy_position_y, pColor, id);
				}
			}
			//Fire homing missiles
			if gamepad_button_check_pressed(gamePad, gp_face1)
			{
				if canMissile
				{
					canMissile = false;
					shootMissile = true;
					missileCurTime = 0;
					missileCurVolley = 0;
					alarm[4] = room_speed * 0.5;
				}
			}
			//Lay a mine
			if gamepad_button_check_pressed(gamePad, gp_face2)
			{
				if minesActive < minesMax
				{
					//Spawn a mine
					++minesActive;
					SpawnBomb(phy_position_x, phy_position_y, c_red, minesRadius, id);
				}
			}
	
			//Set camera zoom level
			if gamepad_button_check_pressed(gamePad, gp_padu)
			{ 
			    if oControl.zoomLevel != 1
				{
			        oControl.zoomLevel -= 1;
			        if oControl.zoomLevel < 1 { oControl.zoomLevel = 1; }
					//Set target width according to zoom level
					switch oControl.zoomLevel 
					{
					    case 1:
					        oControl.targetWidth  = 960;
					        break;
					    case 2:
					        oControl.targetWidth  = 1366;
					        break;
					    case 3:
					        oControl.targetWidth  = 1600;
					        break;
					}
			    }
			} 
			else if gamepad_button_check_pressed(gamePad, gp_padd)
			{ 
			    if oControl.zoomLevel != 3
				{
			        oControl.zoomLevel += 1;
			        if oControl.zoomLevel > 3 { oControl.zoomLevel = 3; }
					//Set target width according to zoom level
					switch oControl.zoomLevel 
					{
					    case 1:
					        oControl.targetWidth  = 960;
					        break;
					    case 2:
					        oControl.targetWidth  = 1366;
					        break;
					    case 3:
					        oControl.targetWidth  = 1600;
					        break;
					}
			    }
			}
		}
		else
		{
			playerInput = "KEYBOARD";
		}
		break;
	case "KEYBOARD":
		//Keyboard and Mouse Inputs\\
		var pkey;
		var skey;
		var up    = 0;
		var down  = 0;
		var left  = 0;
		var right = 0;
	
		if keyboard_check(ord("W")) { up    = -1; } 
		if keyboard_check(ord("S")) { down  =  1; }
		if keyboard_check(ord("A")) { left  = -1; }
		if keyboard_check(ord("D")) { right =  1; } 
		
		//Determine movement direction
		hAxis = left + right;
		vAxis = up + down;
	
		if hAxis != 0 || vAxis != 0
		{
			//if splitKeyboard { phy_rotation = point_direction(0, 0, hAxis, vAxis); }
			isMoving = true;
		}
		else 
		{
			isMoving = false;
		}
	
		if !global.splitKeyboard
		{
			pkey = mb_left;
			skey = mb_right;
			if device_mouse_raw_x(0) == mxPrev && device_mouse_raw_y(0)	== myPrev
			{
				if mTimer <= room_speed 
				{ 
					++mTimer; 
				}
			}
			else
			{
				mTimer = 0;
			}

			//Determine look angle
			if mTimer < room_speed
			{
				var pdir = -point_direction(phy_position_x, phy_position_y, mouse_x, mouse_y);
				phy_rotation += angle_difference(pdir, phy_rotation) * 0.1;
			}
			else
			{
				var pdir = point_direction(0, 0, hAxis, -vAxis);
				phy_rotation += angle_difference(pdir, phy_rotation) * 0.1;
			}
	
			mxPrev = device_mouse_raw_x(0);
			myPrev = device_mouse_raw_y(0);
		}
		//Playing with a split keyboardd
		else
		{
			pkey = vk_shift;
			skey = vk_control;
			phy_rotation = point_direction(0, 0, hAxis, vAxis);
		}
	
		//Activate speed boost
		if keyboard_check_pressed(vk_space)
		{
			if boostCurTime < boostMaxTime { isBoosting = true; }
		}
		if keyboard_check_released(vk_space)
		{
			isBoosting = false;
		}
	
		//Activate AOE Burst
		if keyboard_check_pressed(vk_lalt)
		{
			if canBurst 
			{
				canBurst = false;
				burstCurTime = 0;
				alarm[5] = 1;
			}
		}
	
		//Shoot weapons
		//Fire main guns
		if keyboard_check_pressed(pkey)
		{
			shootPrimary = true;
		}
		if keyboard_check_released(pkey)
		{
			shootPrimary = false;
		}
		//Fire secondary guns
		if keyboard_check_pressed(skey)
		{
			shootSecondary = true;
		}
		if keyboard_check_released(skey)
		{
			shootSecondary = false;
		}
		//Fire auto turret
		if keyboard_check_pressed(ord("Q"))
		{
			if canTurret
			{
				canTurret = false;
				shootTurret = true;
				turretCurTime = 0;
				turretCurVolley = 0;
				alarm[3] = turretRate;
			}
		}
		//Fire lazer
		if keyboard_check_pressed(ord("R"))
		{
			if canLazer
			{
				canLazer = false;
				shootLazer = true;
				//Spawn lazer
				SpawnLazer(phy_position_x, phy_position_y, pColor, id);
			}
		}
		//Fire homing missiles
		if keyboard_check_pressed(ord("E"))
		{
			if canMissile
			{
				canMissile = false;
				shootMissile = true;
				missileCurTime = 0;
				missileCurVolley = 0;
				alarm[4] = room_speed * 0.5;
			}
		}
		//Lay a mine
		if keyboard_check_pressed(ord("F"))
		{
			if minesActive < minesMax
			{
				//Spawn a mine
				++minesActive;
				SpawnBomb(phy_position_x, phy_position_y, c_red, minesRadius, id);
			}
		}
		
		//Set camera zoom level
		if mouse_wheel_up() || keyboard_check_pressed(vk_add) 
		{ 
			if oControl.zoomLevel != 1
			{
			    oControl.zoomLevel -= 1;
			    if oControl.zoomLevel < 1 { oControl.zoomLevel = 1; }
				//Set target width according to zoom level
				switch oControl.zoomLevel 
				{
					case 1:
					    oControl.targetWidth  = 960;
					    break;
					case 2:
					    oControl.targetWidth  = 1366;
					    break;
					case 3:
					    oControl.targetWidth  = 1600;
					    break;
				}
			}
		} 
		else if mouse_wheel_down() || keyboard_check_pressed(vk_subtract) 
		{ 
			if oControl.zoomLevel != 3
			{
			    oControl.zoomLevel += 1;
			    if oControl.zoomLevel > 3 { oControl.zoomLevel = 3; }
				//Set target width according to zoom level
				switch oControl.zoomLevel 
				{
					case 1:
					    oControl.targetWidth  = 960;
					    break;
					case 2:
					    oControl.targetWidth  = 1366;
					    break;
					case 3:
					    oControl.targetWidth  = 1600;
					    break;
				}
			}
		}
		break;
}

//Boost control
if isBoosting
{
	if boostCurrent != boostMax
	{
		boostCurrent = lerp(boostCurrent, boostMax, speedAccel)
	}
	
	if boostCurTime < boostMaxTime
	{
		//Increase time spent boosting
		boostCurTime += 2;
	}
	else
	{
		isBoosting = false;
	}
}
else
{
	if boostCurrent != 0
	{
		boostCurrent = lerp(boostCurrent, 0, speedAccel)
	}
	
	if boostCurTime > 0
	{
		boostCurTime -= boostChargeRate;
	}
}


if isMoving
{
	//Speed control
	//Accelerate
	if speedCurrent != speedMax 
	{
		speedCurrent = lerp(speedCurrent, speedMax, speedAccel);
	}
	
	//Movement and Collision Detection\\
	//Speed to apply to the horizontal and vertical axis
	var spd = (speedCurrent + boostCurrent);
	//hSpeed = (hAxis * (spd*abs(hAxis)));
	//vSpeed = (vAxis * (spd*abs(vAxis)));
	hSpeed = (hAxis * spd);
	vSpeed = (vAxis * spd);
	//Move
	physics_apply_force(phy_position_x, phy_position_y, hSpeed, vSpeed);
}

if shootPrimary
{
	if canPrimary
	{
		canPrimary = false;
		alarm[1] = room_speed * primaryRate;
		//Spawn a bullet
		var ptx = lengthdir_x(10000, image_angle);
        var pty = lengthdir_y(10000, image_angle);
		var psx = phy_position_x+(ptx*0.002);
		var psy = phy_position_y+(pty*0.002);
		var pbc = c_red;
		SpawnBullet(psx, psy, pbc, -phy_rotation, ptx, pty, 0.6, primaryDamage, id);
	}
}

if shootSecondary
{
	if canSecondary
	{
		//Spawn a bullet
		canSecondary = false;
		alarm[2] = room_speed * secondaryRate;
		//Spawn a bullet
		var stx = lengthdir_x(10000, image_angle);
        var sty = lengthdir_y(10000, image_angle);
		var ssx = phy_position_x+(stx*0.002);
		var ssy = phy_position_y+(sty*0.002);
		var sbc = c_purple;
		SpawnBullet(ssx, ssy, sbc, -phy_rotation, stx, sty, 1.2, secondaryDamage, id);
	}
}

if shootLazer
{
	if lazerCurLife > 0 
	{
		lazerCurLife -= 2;
	}
	else
	{
		shootLazer = false;
		//Destroy existing lazer
		with oLazer
		{
			if owner == oPlayerONE.id
			{
				instance_destroy();
			}
		}
	}
}
else
{
	if lazerCurLife < lazerMaxLife
	{
		lazerCurLife += lazerChargeRate;
	}
	else
	{
		if canLazer == false 
		{ 
			canLazer = true; 
			lazerCurLife = lazerMaxLife;
		}
	}
}

if shootMissile
{
	shootMissile = false;
	//Spawn a missile
	++missileCurVolley;
	var mt = instance_nearest(phy_position_x, phy_position_y, oEnemy);
	SpawnMissile(phy_position_x, phy_position_y, c_yellow, mt, id);
}

if shootTurret
{
	shootTurret = false;
	//Spawn a bullet
	++turretCurVolley;
	//Get target direction
	var tgt = instance_nearest(phy_position_x, phy_position_y, oEnemy);
	if tgt != noone
	{
		var tda = point_direction(phy_position_x, phy_position_y, tgt.phy_position_x, tgt.phy_position_y);
		var ttx = lengthdir_x(10000, tda);
        var tty = lengthdir_y(10000, tda);
		var tsx = phy_position_x+(ttx*0.002);
		var tsy = phy_position_y+(tty*0.002);
		var tbc = c_green;
		SpawnBullet(tsx, tsy, tbc, tda, ttx, tty, 0.4, turretDamage, id);
	}
}