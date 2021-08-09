/// @description Spawn the enemy UFOs
if !global.gameOver
{
	if spawnPauseCount <= 1
	{
		if oControl.enemyCount < 200
		{
			switch spawnType
			{
				case spawntypes.randomcircle:
					var rd = random(360);
					var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
					var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
					with instance_create_layer(xx, yy, "Players", oEnemy)
					{
						isSpecial = false;
						eHealth = oLevels.enemyHealth;
						eColor = choose(c_aqua, c_blue, c_fuchsia, c_green, c_maroon, c_orange, c_purple, c_silver, c_teal, c_yellow);
						activeColor = eColor;
						var rr = choose(0, 1, 2, 3);
						switch rr
						{
							case 0:
								shape = "Circle";
								mass =  oLevels.enemyMass;
								size = irandom_range(32, 80);
								FixtureCreateCircle(size, mass, 1, 0.1, 0.2, 0.2);
								var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
								targetX = lengthdir_x(size*mass, dd);
								targetY = lengthdir_y(size*mass, dd);
								break;
							case 1:
								shape = "Box";
								mass = oLevels.enemyMass;
								size = irandom_range(32, 76);
								FixtureCreateBox(size, size, mass, 1, 0.1, 0.2, 0.2);
								var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
								targetX = lengthdir_x(size*mass, dd);
								targetY = lengthdir_y(size*mass, dd);
								break;
							case 2:
								shape = "Triangle";
								mass = oLevels.enemyMass;
								size = irandom_range(24, 96);
								FixtureCreateTriangle(size, size, mass, 1, 0.1, 0.2, 0.2);
								var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
								targetX = lengthdir_x(size*mass, dd);
								targetY = lengthdir_y(size*mass, dd);
								break;
							case 3:
								shape = "Star";
								mass = oLevels.enemyMass;
								size = irandom_range(48, 96);
								FixtureCreateStar(size, size, mass, 1, 0.1, 0.2, 0.2);
								var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
								targetX = lengthdir_x(size*mass, dd);
								targetY = lengthdir_y(size*mass, dd);
								break;
						}
					}
				
					if global.gameMode == "SOLO" { alarm[1] = max(room_speed*0.1, room_speed-gameLevel); }
					else { alarm[1] = max(room_speed, (room_speed * 0.5)-gameLevel); }
					break;
				case spawntypes.syncedcircle:
					var mx = 360/spawnCycleMax;
					for (var i = 0; i < spawnCycleMax; ++i)
					{
						var rd = mx * i;
						var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
						var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
						with instance_create_layer(xx, yy, "Players", oEnemy)
						{
							isSpecial = true;
							eHealth = 1 + oLevels.gameLevel;
							eColor = oLevels.enemyColor;
							activeColor = eColor;
							shape = "Circle";
							mass = oLevels.enemyMass;
							size = oLevels.enemySize;
							FixtureCreateCircle(size, mass, 0.8, 0.1, 0.2, 0.2);
							var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
							targetX = lengthdir_x(size*mass, dd);
							targetY = lengthdir_y(size*mass, dd);
							alarm[0] = room_speed;
						}
					}
					spawnType = spawntypes.randomcircle;
					spawnCycleCount = 0;
					alarm[3] = room_speed * 10;
					alarm[1] = room_speed * 3;
					break;
				case spawntypes.staggeredcircle:
					++spawnCycleCount;
					var mx = 360/spawnCycleMax;
					var rd = mx * spawnCycleCount;
					var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
					var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
					with instance_create_layer(xx, yy, "Players", oEnemy)
					{
						isSpecial = true;
						eHealth = 1 + oLevels.gameLevel;
						eColor = oLevels.enemyColor;
						activeColor = eColor;
						shape = "Circle";
						mass = oLevels.enemyMass;
						size = oLevels.enemySize;
						FixtureCreateCircle(size, mass, 0.8, 0.1, 0.2, 0.2);
						var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
						targetX = lengthdir_x(size*mass, dd);
						targetY = lengthdir_y(size*mass, dd);
						alarm[0] = room_speed;
					}
			
					if spawnCycleCount >= spawnCycleMax
					{ 
						spawnType = spawntypes.randomcircle;
						spawnCycleCount = 0;
						alarm[3] = room_speed * 10; 
						alarm[1] = room_speed * 3;
					}
					else 
					{ 
						alarm[1] = room_speed * 0.1; 
					}
					break;
				case spawntypes.syncedlines:
					spawnCycleCount += 4;
					for (var i = 0; i < 4; ++i)
					{
						var rd;
						switch i
						{
							case 0:
								rd = 0;
								break;
							case 1:
								rd = 90;
								break;
							case 2:
								rd = 180;
								break;
							case 3:
								rd = 270;
								break;
						}
						var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
						var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
						with instance_create_layer(xx, yy, "Players", oEnemy)
						{
							isSpecial = true;
							eHealth = 1 + oLevels.gameLevel;
							eColor = oLevels.enemyColor;
							activeColor = eColor;
							shape = "Triangle";
							mass = oLevels.enemyMass;
							size = oLevels.enemySize;
							FixtureCreateTriangle(size, size, mass, 0.5, 0.1, 0.2, 0.2);
							var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
							targetX = lengthdir_x(size*mass, dd);
							targetY = lengthdir_y(size*mass, dd);
							alarm[0] = room_speed;
						}
					}
					if spawnCycleCount >= spawnCycleMax
					{ 
						spawnType = spawntypes.randomcircle;
						spawnCycleCount = 0;
						alarm[3] = room_speed * 10; 
						alarm[1] = room_speed * 3;
					}
					else 
					{ 
						alarm[1] = room_speed * 2; 
					}
					break;
				case spawntypes.staggeredlines:
					++spawnCycleCount;
					var rd;
					var mx = spawnCycleMax/4;
				
					if spawnCycleCount <= mx { rd = 0; }
					else if spawnCycleCount <= (mx * 2) { rd = 180; }
					else if spawnCycleCount <= (mx * 3) { rd = 90; }
					else { rd = 270; }
				
					var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
					var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
					with instance_create_layer(xx, yy, "Players", oEnemy)
					{
						isSpecial = true;
						eHealth = 1 + oLevels.gameLevel;
						eColor = oLevels.enemyColor;
						activeColor = eColor;
						shape = "Triangle";
						mass = oLevels.enemyMass;
						size = oLevels.enemySize;
						FixtureCreateTriangle(size, size, mass, 0.5, 0.1, 0.2, 0.2);
						var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
						targetX = lengthdir_x(size*mass, dd);
						targetY = lengthdir_y(size*mass, dd);
						alarm[0] = room_speed;
					}
					if spawnCycleCount >= spawnCycleMax
					{ 
						spawnType = spawntypes.randomcircle;
						spawnCycleCount = 0;
						alarm[3] = room_speed * 10; 
						alarm[1] = room_speed;
					}
					else 
					{ 
						alarm[1] = room_speed; 
					}
					break;
				case spawntypes.syncedstars:
					spawnCycleCount += 4;
					for (var i = 0; i < 4; ++i)
					{
						var rd;
						switch i
						{
							case 0:
								rd = 45;
								break;
							case 1:
								rd = 135;
								break;
							case 2:
								rd = 225;
								break;
							case 3:
								rd = 315;
								break;
						}
						var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
						var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
						with instance_create_layer(xx, yy, "Players", oEnemy)
						{
							isSpecial = true;
							eHealth = 1 + oLevels.gameLevel;
							eColor = oLevels.enemyColor;
							activeColor = eColor;
							shape = "Star";
							mass = oLevels.enemyMass;
							size = oLevels.enemySize;
							FixtureCreateStar(size, size, mass, 0.5, 0.1, 0.2, 0.2);
							var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
							targetX = lengthdir_x(size*mass, dd);
							targetY = lengthdir_y(size*mass, dd);
							alarm[0] = room_speed;
						}
					}
					if spawnCycleCount >= spawnCycleMax
					{ 
						spawnType = spawntypes.randomcircle;
						spawnCycleCount = 0;
						alarm[3] = room_speed * 10; 
						alarm[1] = room_speed * 2;
					}
					else 
					{ 
						alarm[1] = room_speed * 1.5; 
					}
					break;
				case spawntypes.staggeredstars:
					++spawnCycleCount;
					var rd;
					var mx = spawnCycleMax/4;
				
					if spawnCycleCount <= mx { rd = 45; }
					else if spawnCycleCount <= (mx * 2) { rd = 135; }
					else if spawnCycleCount <= (mx * 3) { rd = 225; }
					else { rd = 315; }
				
					var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
					var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
					with instance_create_layer(xx, yy, "Players", oEnemy)
					{
						isSpecial = true;
						eHealth = 1 + oLevels.gameLevel;
						eColor = oLevels.enemyColor;
						activeColor = eColor;
						shape = "Star";
						mass = oLevels.enemyMass;
						size = oLevels.enemySize;
						FixtureCreateStar(size, size, mass, 0.5, 0.1, 0.2, 0.2);
						var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
						targetX = lengthdir_x(size*mass, dd);
						targetY = lengthdir_y(size*mass, dd);
						alarm[0] = room_speed;
					}
					if spawnCycleCount >= spawnCycleMax
					{ 
						spawnType = spawntypes.randomcircle;
						spawnCycleCount = 0;
						alarm[3] = room_speed * 10; 
						alarm[1] = room_speed;
					}
					else 
					{ 
						alarm[1] = room_speed; 
					}
					break;
			}
		}
		else
		{
			alarm[1] = room_speed; 
		}
	}
	else
	{
		--spawnPauseCount;
		alarm[1] = room_speed; 
	}
}