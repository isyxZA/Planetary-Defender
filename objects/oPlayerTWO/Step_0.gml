/// @description Player Inputs
switch playerInput
{
	case "GAMEPAD":
		if gamePad != -1 && gamePad != undefined
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
				phy_rotation += angle_difference(pdir, phy_rotation) * 0.2;
			}
			else
			{
				if mTimer < room_speed { ++mTimer; }
				if mTimer >= room_speed
				{
					var pdir = point_direction(0, 0, hAxis, -vAxis);
					phy_rotation += angle_difference(pdir, phy_rotation) * 0.2;
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
					burstCurRadius = 0;
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
		}
		else
		{
			playerInput = "KEYBOARD";
		}
		break;
	case "KEYBOARD":
		//Keyboard and Mouse Inputs\\
		var ukey;//Up
		var dkey;//Down
		var lkey;//Left
		var rkey;//Right
		var pkey;//Primary
		var skey;//Secondary
		var key1;//Boost
		var key2;//Burst
		var key3;//Turret
		var key4;//Missile
		var key5;//Lazer
		var key6;//Mines
		
		if global.splitKeyboard
		{ 
			ukey = vk_up;//Up
			dkey = vk_down;//Down
			lkey = vk_left;//Left
			rkey = vk_right;//Right
			pkey = vk_numpad1;//Primary
			skey = vk_numpad2;//Secondary
			key1 = vk_numpad0;//Boost
			key2 = vk_decimal;//Burst
			key3 = vk_numpad3;//Turret
			key4 = vk_numpad4;//Missile
			key5 = vk_numpad5;//Lazer
			key6 = vk_numpad6;//Mines
		}
		else 
		{ 
			ukey = ord("W");//Up
			dkey = ord("S");//Down
			lkey = ord("A");//Left
			rkey = ord("D");//Right
			pkey = mb_left;//Primary
			skey = mb_right//Secondary
			key1 = vk_space;//Boost
			key2 = ord("C");//Burst
			key3 = ord("Q");//Turret
			key4 = ord("E");//Missile
			key5 = ord("R");//Lazer
			key6 = ord("F");//Mines
		}

		//Determine movement direction
		var up    = 0;
		var down  = 0;
		var left  = 0;
		var right = 0;
	
		if keyboard_check(ukey) { up    = -1; } 
		if keyboard_check(dkey) { down  =  1; }
		if keyboard_check(lkey) { left  = -1; }
		if keyboard_check(rkey) { right =  1; } 
	
		hAxis = left + right;
		vAxis = up + down;
	
		if hAxis != 0 || vAxis != 0
		{
			isMoving = true;
		}
		else 
		{
			isMoving = false;
		}
	
		if !global.splitKeyboard
		{
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
				phy_rotation += angle_difference(pdir, phy_rotation) * 0.2;
			}
			else
			{
				var pdir = point_direction(0, 0, hAxis, -vAxis);
				phy_rotation += angle_difference(pdir, phy_rotation) * 0.2;
			}
	
			mxPrev = device_mouse_raw_x(0);
			myPrev = device_mouse_raw_y(0);
			
			//Fire main guns
			if mouse_check_button_pressed(pkey)
			{
				shootPrimary = true;
			}
			if mouse_check_button_released(pkey)
			{
				shootPrimary = false;
			}
			//Fire secondary guns
			if mouse_check_button_pressed(skey)
			{
				shootSecondary = true;
			}
			if mouse_check_button_released(skey)
			{
				shootSecondary = false;
			}
		}
		//Playing with a split keyboard
		else
		{
			phy_rotation = point_direction(0, 0, hAxis, vAxis);
			
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
		}
	
		//Activate speed boost
		if keyboard_check_pressed(key1)
		{
			if boostCurTime < boostMaxTime { isBoosting = true; }
		}
		if keyboard_check_released(key1)
		{
			isBoosting = false;
		}
	
		//Activate AOE Burst
		if keyboard_check_pressed(key2)
		{
			if canBurst 
			{
				canBurst = false;
				burstCurRadius = 0;
				burstCurTime = 0;
				alarm[5] = 1;
			}
		}
	
		//Fire auto turret
		if keyboard_check_pressed(key3)
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
		
		//Fire homing missiles
		if keyboard_check_pressed(key4)
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
		
		//Fire lazer
		if keyboard_check_pressed(key5)
		{
			if canLazer
			{
				canLazer = false;
				shootLazer = true;
				//Spawn lazer
				SpawnLazer(phy_position_x, phy_position_y, pColor, id);
			}
		}
		
		//Lay a mine
		if keyboard_check_pressed(key6)
		{
			if minesActive < minesMax
			{
				//Spawn a mine
				++minesActive;
				SpawnBomb(phy_position_x, phy_position_y, c_red, minesRadius, id);
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
		if audio_system_is_available() && audio_sound_is_playable(sndBullet)
		{
			audio_play_sound(sndBullet, 0, false);
		}
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
		if audio_system_is_available() && audio_sound_is_playable(sndBullet)
		{
			audio_play_sound(sndBullet, 0, false);
		}
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
			if owner == oPlayerTWO.id
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
	if audio_system_is_available() && audio_sound_is_playable(sndMissile)
	{
		audio_play_sound(sndMissile, 0, false);
	}
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
		if audio_system_is_available() && audio_sound_is_playable(sndTurret)
		{
			audio_play_sound(sndTurret, 0, false);
		}
	}
}

if burstActive
{
	var ecc = collision_circle(phy_position_x, phy_position_y, burstRadius, oEnemy, false, true);
	if ecc != noone
	{
		with ecc
		{
			oControl.scoreP2 += 100;
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "+ 100"; tColor = c_yellow; }
			if Chance(0.2)
			{
				var item = instance_create_layer(phy_position_x, phy_position_y, "Players", oItem);
				item.iColor = eColor;
				effect_create_above(ef_spark, phy_position_x, phy_position_y, 1, eColor);
				effect_create_above(ef_ellipse, phy_position_x, phy_position_y, 1, eColor);
			}
			instance_destroy();
		}
	}
}

if shieldHealth < shieldMax && shieldCanCharge
{
	shieldHealth = lerp(shieldHealth, shieldMax, shieldChargeRate);
}
sA = 1 * shieldHealth/shieldMax;