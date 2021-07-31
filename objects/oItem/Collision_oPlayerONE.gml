effect_create_above(ef_star, phy_position_x, phy_position_y, 0.75, c_silver);
effect_create_above(ef_ring, phy_position_x, phy_position_y, 1, iColor);
var choice = Chance(0.5);
switch iColor
{
	case c_aqua://Primary
		if choice { other.damagePrimary += 0.25; oControl.pDamageP1 = other.damagePrimary; }
		else { other.ratePrimary -= 0.05; oControl.pRateP1 = other.ratePrimary; }
		break;
	case c_blue://Secondary
		if choice { other.damageSecondary += 0.25; oControl.sDamageP1 = other.damageSecondary; }
		else { other.rateSecondary -= 0.05; oControl.sRateP1 = other.rateSecondary; }
		break;
	case c_fuchsia://Speed
		if choice { other.speedMax += 0.05; oControl.sMaxP1 = other.speedMax; }
		else { other.speedAccel += 0.01; oControl.sAccelP1 = other.speedAccel; }
		break;
	case c_green://Boost
		if choice { other.boostMax += 0.05; oControl.bPowerP1 = other.boostMax; }
		else { other.boostChargeRate += 0.05; oControl.bRateP1 = other.boostChargeRate; }
		break;
	case c_maroon://Shield
		if choice { other.shieldHealth += 0.5; oControl.sStrengthP1 = other.shieldHealth; }
		else { other.shieldChargeRate += 0.05; oControl.sRechargeP1 = other.shieldChargeRate; }
		break;
	case c_orange://Burst
		if choice { other.burstRadius += 2; oControl.bRadiusP1 = other.burstRadius; }
		else { other.burstChargeRate += 0.05; oControl.bCooldownP1 = other.burstChargeRate; }
		break;
	case c_purple://Missiles
		if choice { other.missileDamage += 0.25; oControl.mDamageP1 = other.missileDamage; }
		else { other.missileVolley += 1; oControl.mVolleyP1 = other.missileVolley; }
		break;
	case c_silver://Lazer
		if choice { other.lazerLife += 2; oControl.lTimeP1 = other.lazerLife; }
		else { other.lazerChargeRate += 0.05; oControl.lCooldownP1 = other.lazerChargeRate; }
		break;
	case c_teal://Turrets
		if choice { other.turretDamage += 0.25; oControl.tDamageP1 = other.turretDamage; }
		else { other.turretRate -= 0.05; oControl.tRateP1 = other.turretRate; }
		break;
	case c_yellow://Mines
		if choice { other.minesMax += 1; oControl.mMaxP1 = other.minesMax; }
		else { other.minesRadius += 2; oControl.mRadiusP1 = other.minesRadius; }
		break;
}
instance_destroy();