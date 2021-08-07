effect_create_above(ef_star, phy_position_x, phy_position_y, 0.75, c_silver);
effect_create_above(ef_ring, phy_position_x, phy_position_y, 1, iColor);
SpawnFlare(x, y, sFlare01, 5, 2, c_white);
var choice = Chance(0.5);
switch iColor
{
	case c_aqua://Primary
		if choice 
		{ 
			other.primaryDamage += 2; 
			oControl.pDamageP2 = other.primaryDamage; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "PRIMARY DMG ++"; tColor = other.iColor; }
		}
		else 
		{ 
			if other.primaryRate > 0.02
			{
				other.primaryRate -= 0.01;
			} 
			oControl.pRateP2 = other.primaryRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "PRIMARY DMG ++"; tColor = other.iColor; }
		}
		break;
	case c_blue://Secondary
		if choice 
		{ 
			other.secondaryDamage += 2; 
			oControl.sDamageP2 = other.secondaryDamage; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SECONDARY DMG ++"; tColor = other.iColor; }
		}
		else 
		{ 
			if other.secondaryRate > 0.02
			{
				other.secondaryRate -= 0.01;
			}
			oControl.sRateP2 = other.secondaryRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SECONDARY RATE ++"; tColor = other.iColor; }
		}
		break;
	case c_fuchsia://Speed
		if choice 
		{ 
			other.speedMax += 5; 
			oControl.sMaxP2 = other.speedMax; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SPEED MAX ++"; tColor = other.iColor; }
		}
		else 
		{ 
			other.speedAccel += 0.05; 
			oControl.sAccelP2 = other.speedAccel; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SPEED ACCEL ++"; tColor = other.iColor; }
		}
		break;
	case c_green://Boost
		if choice 
		{ 
			other.boostMaxTime += 10; 
			oControl.bTimeP2 = other.boostMaxTime; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "BOOST TIME ++"; tColor = other.iColor; }
		}
		else 
		{ 
			other.boostChargeRate += 0.05; 
			oControl.bRateP2 = other.boostChargeRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "BOOST RATE ++"; tColor = other.iColor; }
		}
		break;
	case c_maroon://Shield
		if choice 
		{ 
			other.shieldMax += 2; 
			oControl.sStrengthP2 = other.shieldMax; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SHIELD MAX ++"; tColor = other.iColor; }
		}
		else 
		{ 
			other.shieldChargeRate += 0.01; 
			oControl.sRechargeP2 = other.shieldChargeRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SHIELD RATE ++"; tColor = other.iColor; }
		}
		break;
	case c_orange://Burst
		if choice 
		{ 
			other.burstRadius += 2; 
			oControl.bRadiusP2 = other.burstRadius; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "BURST RADIUS ++"; tColor = other.iColor; }
		}
		else 
		{ 
			if other.burstCooldown > 20
			{
				other.burstCooldown -= 10; 
			} 
			oControl.bCooldownP2 = other.burstCooldown; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "BURST RATE ++"; tColor = other.iColor; }
		}
		break;
	case c_purple://Missiles
		if choice 
		{ 
			other.missileDamage += 2; 
			oControl.mDamageP2 = other.missileDamage; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "MISSILE DMG ++"; tColor = other.iColor; }
		}
		else 
		{ 
			other.missileVolley += 1; 
			oControl.mVolleyP2 = other.missileVolley; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "MISSILE AMT ++"; tColor = other.iColor; }
		}
		break;
	case c_silver://Lazer
		if choice 
		{ 
			other.lazerMaxLife += 10; 
			oControl.lTimeP2 = other.lazerMaxLife; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "LAZER TIME ++"; tColor = other.iColor; }
		}
		else 
		{ 
			other.lazerChargeRate += 0.1; 
			oControl.lCooldownP2 = other.lazerChargeRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "LAZER RATE ++"; tColor = other.iColor; }
		}
		break;
	case c_teal://Turrets
		if choice 
		{ 
			other.turretDamage += 2; 
			oControl.tDamageP2 = other.turretDamage; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "TURRET DMG ++"; tColor = other.iColor; }
		}
		else 
		{ 
			if other.turretRate > 1
			{
				other.turretRate -= 1; 
			} 
			oControl.tRateP2 = other.turretRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "TURRET RATE ++"; tColor = other.iColor; }
		}
		break;
	case c_yellow://Mines
		if choice 
		{ 
			other.minesMax += 1; 
			oControl.mMaxP2 = other.minesMax; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "MINES MAX ++"; tColor = other.iColor; }
		}
		else 
		{ 
			other.minesRadius += 5; 
			oControl.mRadiusP2 = other.minesRadius; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "MINE RADIUS ++"; tColor = other.iColor; }
		}
		break;
}

if audio_system_is_available() && audio_sound_is_playable(sndItem)
{
	audio_play_sound(sndItem, 0, false);
}

instance_destroy();