effect_create_above(ef_star, phy_position_x, phy_position_y, 0.75, c_silver);
effect_create_above(ef_ring, phy_position_x, phy_position_y, 1, iColor);
var choice = Chance(0.5);
switch iColor
{
	case c_aqua://Primary
		if choice 
		{ 
			other.primaryDamage += 0.5; 
			oControl.pDamageP1 = other.primaryDamage; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "PRIMARY DMG ++"; }
		}
		else 
		{ 
			other.primaryRate -= 0.05; 
			oControl.pRateP1 = other.primaryRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "PRIMARY DMG ++"; }
		}
		break;
	case c_blue://Secondary
		if choice 
		{ 
			other.secondaryDamage += 0.5; 
			oControl.sDamageP1 = other.secondaryDamage; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SECONDARY DMG ++"; }
		}
		else 
		{ 
			other.secondaryRate -= 0.05;
			oControl.sRateP1 = other.secondaryRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SECONDARY RATE ++"; }
		}
		break;
	case c_fuchsia://Speed
		if choice 
		{ 
			other.speedMax += 0.05; 
			oControl.sMaxP1 = other.speedMax; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SPEED MAX ++"; }
		}
		else 
		{ 
			other.speedAccel += 0.01; 
			oControl.sAccelP1 = other.speedAccel; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SPEED ACCEL ++"; }
		}
		break;
	case c_green://Boost
		if choice 
		{ 
			other.boostMaxTime += 0.05; 
			oControl.bTimeP1 = other.boostMaxTime; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "BOOST TIME ++"; }
		}
		else 
		{ 
			other.boostChargeRate += 0.05; 
			oControl.bRateP1 = other.boostChargeRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "BOOST RATE ++"; }
		}
		break;
	case c_maroon://Shield
		if choice 
		{ 
			other.shieldHealth += 0.5; 
			oControl.sStrengthP1 = other.shieldHealth; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SHIELD MAX ++"; }
		}
		else 
		{ 
			other.shieldChargeRate += 0.05; 
			oControl.sRechargeP1 = other.shieldChargeRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "SHIELD RATE ++"; }
		}
		break;
	case c_orange://Burst
		if choice 
		{ 
			other.burstRadius += 2; 
			oControl.bRadiusP1 = other.burstRadius; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "BURST RADIUS ++"; }
		}
		else 
		{ 
			other.burstCooldown -= 10; 
			oControl.bCooldownP1 = other.burstCooldown; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "BURST RATE ++"; }
		}
		break;
	case c_purple://Missiles
		if choice 
		{ 
			other.missileDamage += 0.5; 
			oControl.mDamageP1 = other.missileDamage; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "MISSILE DMG ++"; }
		}
		else 
		{ 
			other.missileVolley += 1; 
			oControl.mVolleyP1 = other.missileVolley; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "MISSILE AMT ++"; }
		}
		break;
	case c_silver://Lazer
		if choice 
		{ 
			other.lazerMaxLife += 10; 
			oControl.lTimeP1 = other.lazerMaxLife; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "LAZER TIME ++"; }
		}
		else 
		{ 
			other.lazerChargeRate += 0.1; 
			oControl.lCooldownP1 = other.lazerChargeRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "LAZER RATE ++"; }
		}
		break;
	case c_teal://Turrets
		if choice 
		{ 
			other.turretDamage += 0.5; 
			oControl.tDamageP1 = other.turretDamage; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "TURRET DMG ++"; }
		}
		else 
		{ 
			other.turretRate -= 1; 
			oControl.tRateP1 = other.turretRate; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "TURRET RATE ++"; }
		}
		break;
	case c_yellow://Mines
		if choice 
		{ 
			other.minesMax += 1; 
			oControl.mMaxP1 = other.minesMax; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "MINES MAX ++"; }
		}
		else 
		{ 
			other.minesRadius += 5; 
			oControl.mRadiusP1 = other.minesRadius; 
			with instance_create_layer(x, y, "Buttons", oAlerts) { txt = "MINE RADIUS ++"; }
		}
		break;
}
instance_destroy();