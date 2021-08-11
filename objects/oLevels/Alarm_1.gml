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
					var xx = (room_width * 0.5) + lengthdir_x(1400, rd);
					var yy = (room_height * 0.5) + lengthdir_y(1400, rd);
					spawnShape = choose("Circle", "Box", "Triangle", "Star");
					with instance_create_layer(xx, yy, "Players", oEnemy)
					{
						isSpecial = false;
						eHealth = oLevels.enemyHealth;
						eColor = choose(c_aqua, c_blue, c_fuchsia, c_green, c_maroon, c_orange, c_purple, c_silver, c_teal, c_yellow);
						activeColor = eColor;
						shape = oLevels.spawnShape
						mass =  oLevels.enemyMass;
						size = irandom_range(32, 96);
						switch shape
						{
							case "Circle":
								FixtureCreateCircle(size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Box":
								FixtureCreateBox(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Triangle":
								FixtureCreateTriangle(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Star":
								FixtureCreateStar(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
						}
						var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
						targetX = lengthdir_x(size*mass, dd);
						targetY = lengthdir_y(size*mass, dd);
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
							shape = oLevels.spawnShape;
							mass = oLevels.enemyMass;
							size = oLevels.enemySize;
							switch shape
							{
								case "Circle":
									FixtureCreateCircle(size, mass, 1, 0.1, 0.2, 0.2);
									break;
								case "Box":
									FixtureCreateBox(size, size, mass, 1, 0.1, 0.2, 0.2);
									break;
								case "Triangle":
									FixtureCreateTriangle(size, size, mass, 1, 0.1, 0.2, 0.2);
									break;
								case "Star":
									FixtureCreateStar(size, size, mass, 1, 0.1, 0.2, 0.2);
									break;
							}
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
						shape = oLevels.spawnShape;
						mass = oLevels.enemyMass;
						size = oLevels.enemySize;
						switch shape
						{
							case "Circle":
								FixtureCreateCircle(size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Box":
								FixtureCreateBox(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Triangle":
								FixtureCreateTriangle(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Star":
								FixtureCreateStar(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
						}
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
							shape = oLevels.spawnShape;
							mass = oLevels.enemyMass;
							size = oLevels.enemySize;
							switch shape
							{
								case "Circle":
									FixtureCreateCircle(size, mass, 1, 0.1, 0.2, 0.2);
									break;
								case "Box":
									FixtureCreateBox(size, size, mass, 1, 0.1, 0.2, 0.2);
									break;
								case "Triangle":
									FixtureCreateTriangle(size, size, mass, 1, 0.1, 0.2, 0.2);
									break;
								case "Star":
									FixtureCreateStar(size, size, mass, 1, 0.1, 0.2, 0.2);
									break;
							}
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
				
					var xx = (room_width * 0.5) + lengthdir_x(1300, rd);
					var yy = (room_height * 0.5) + lengthdir_y(1300, rd);
					with instance_create_layer(xx, yy, "Players", oEnemy)
					{
						isSpecial = true;
						eHealth = 1 + oLevels.gameLevel;
						eColor = oLevels.enemyColor;
						activeColor = eColor;
						shape = oLevels.spawnShape;
						mass = 0.3;
						size = oLevels.enemySize;
						switch shape
						{
							case "Circle":
								FixtureCreateCircle(size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Box":
								FixtureCreateBox(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Triangle":
								FixtureCreateTriangle(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Star":
								FixtureCreateStar(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
						}
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
						alarm[1] = room_speed * 0.5; 
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
							shape = oLevels.spawnShape;
							mass = oLevels.enemyMass;
							size = oLevels.enemySize;
							switch shape
							{
								case "Circle":
									FixtureCreateCircle(size, mass, 1, 0.1, 0.2, 0.2);
									break;
								case "Box":
									FixtureCreateBox(size, size, mass, 1, 0.1, 0.2, 0.2);
									break;
								case "Triangle":
									FixtureCreateTriangle(size, size, mass, 1, 0.1, 0.2, 0.2);
									break;
								case "Star":
									FixtureCreateStar(size, size, mass, 1, 0.1, 0.2, 0.2);
									break;
							}
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
				
					var xx = (room_width * 0.5) + lengthdir_x(1300, rd);
					var yy = (room_height * 0.5) + lengthdir_y(1300, rd);
					with instance_create_layer(xx, yy, "Players", oEnemy)
					{
						isSpecial = true;
						eHealth = 1 + oLevels.gameLevel;
						eColor = oLevels.enemyColor;
						activeColor = eColor;
						shape = oLevels.spawnShape;
						mass = 0.3;
						size = oLevels.enemySize;
						switch shape
						{
							case "Circle":
								FixtureCreateCircle(size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Box":
								FixtureCreateBox(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Triangle":
								FixtureCreateTriangle(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
							case "Star":
								FixtureCreateStar(size, size, mass, 1, 0.1, 0.2, 0.2);
								break;
						}
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
						alarm[1] = room_speed * 0.5; 
					}
					break;
				case spawntypes.syncedhuge:
					var mx = 360/4;
					for (var i = 0; i < 3; ++i)
					{
						var rd = mx * i;
						var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
						var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
						with instance_create_layer(xx, yy, "Players", oEnemy)
						{
							isSpecial = false;
							isHuge = true;
							eHealth = 200 + (oLevels.enemyHealth * 2);
							mass = 0.4;
							size = 300;
							eColor = oLevels.enemyColor;
							activeColor = eColor;
							shape = oLevels.spawnShape
							alarm[0] = room_speed;
							var rr = choose(0, 1, 2, 3);
							switch shape
							{
								case "Circle":
									FixtureCreateCircle(size, mass, 1, 0.1, 0, 0.2);
									break;
								case "Box":
									FixtureCreateBox(size, size, mass, 1, 0.1, 0, 0.2);
									break;
								case "Triangle":
									FixtureCreateTriangle(size, size, mass, 1, 0.1, 0, 0.2);
									break;
								case "Star":
									FixtureCreateStar(size, size, mass, 1, 0.1, 0, 0.2);
									break;
							}
							var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
							targetX = lengthdir_x(size*mass, dd);
							targetY = lengthdir_y(size*mass, dd);
						}
					}
					spawnType = spawntypes.randomcircle;
					spawnCycleCount = 0;
					alarm[3] = room_speed * 10;
					alarm[1] = room_speed;
					break;
				case spawntypes.staggeredhuge:
					++spawnCycleCount;
					var mx = 360/4;
					var rd = mx * spawnCycleCount;
					var xx = (room_width * 0.5) + lengthdir_x(1500, rd);
					var yy = (room_height * 0.5) + lengthdir_y(1500, rd);
					with instance_create_layer(xx, yy, "Players", oEnemy)
					{
						isSpecial = false;
						isHuge = true;
						eHealth = 200 + (oLevels.enemyHealth * 2);
						mass = 0.4;
						size = 300;
						eColor = oLevels.enemyColor;
						activeColor = eColor;
						shape = oLevels.spawnShape
						alarm[0] = room_speed;
						var rr = choose(0, 1, 2, 3);
						switch shape
						{
							case "Circle":
								FixtureCreateCircle(size, mass, 1, 0.1, 0, 0.2);
								break;
							case "Box":
								FixtureCreateBox(size, size, mass, 1, 0.1, 0, 0.2);
								break;
							case "Triangle":
								FixtureCreateTriangle(size, size, mass, 1, 0.1, 0, 0.2);
								break;
							case "Star":
								FixtureCreateStar(size, size, mass, 1, 0.1, 0, 0.2);
								break;
						}
						var dd = point_direction(phy_position_x, phy_position_y, room_width * 0.5, room_height * 0.5);
						targetX = lengthdir_x(size*mass, dd);
						targetY = lengthdir_y(size*mass, dd);
					}
	
					if spawnCycleCount >= 3
					{ 
						spawnType = spawntypes.randomcircle;
						spawnCycleCount = 0;
						alarm[3] = room_speed * 10; 
						alarm[1] = room_speed;
					}
					else 
					{ 
						alarm[1] = room_speed * 0.5; 
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