isMoving = false;
speedCurrent = 0;
speedMax = 40;
speedAccel = 0.2;

isBoosting = false;
boostCurrent = 0;
boostMax = 40;
boostCooldown = room_speed * 2;
boostChargeRate = 0.1;

burstRadius = 128;
burstCooldown = room_speed * 8;
burstChargeRate = 0.1;

missileVolley = 4;
missileDamage = 20;

lazerLife = room_speed * 4;
lazerChargeRate = 0.1;

turretRate = 0.2;
turretDamage = 5;

minesMax = 2;
minesRadius = 128;

mxPrev = mouse_x;
myPrev = mouse_y;

canDamage = true;
dTimer = room_speed;

shootPrimary = false;
firePrimary = true;
ratePrimary = 0.3;
damagePrimary = 7;
shootSecondary = false;
fireSecondary = true;
rateSecondary = 0.5;
damageSecondary = 14;

shieldHealth = 10;
shieldChargeRate = 0.1;

if !ds_list_empty(global.controllers)
{
	gamePad = global.controllers[| 0];
}
else
{
	gamePad = -1;
}

hSpeed = 0;
vSpeed = 0;
hAxis = 0;
vAxis = 0;
dir = "E";

mTimer = 0;

aImage = 0;
alarm[0] = room_speed * 0.1;

//Primary Weapon Stats
oControl.pRateP1 = ratePrimary;
oControl.pDamageP1 = damagePrimary;
//Secondary Weapon Stats
oControl.sRateP1 = rateSecondary;
oControl.sDamageP1 = damageSecondary;
//Speed Stats
oControl.sMaxP1 = speedMax;
oControl.sAccelP1 = speedAccel;
//Boost Stats
oControl.bRateP1 = boostChargeRate;
oControl.bPowerP1 = boostMax;
//Shield Stats
oControl.sStrengthP1 = shieldHealth;
oControl.sRechargeP1 = shieldChargeRate;
//Burst Stats
oControl.bRadiusP1 = burstRadius;
oControl.bCooldownP1 = burstChargeRate;
//Missiles Stats
oControl.mVolleyP1 = missileVolley;
oControl.mDamageP1 = missileDamage;
//Lazer Stats
oControl.lTimeP1 = lazerLife;
oControl.lCooldownP1 = lazerChargeRate;
//Turret Stats
oControl.tRateP1 = turretRate;
oControl.tDamageP1 = turretDamage;
//Mines Stats
oControl.mMaxP1 = minesMax;
oControl.mRadiusP1 = minesRadius;