//Assign Controller
if !ds_list_empty(global.controllers)
{
	gamePad = global.controllers[| 0];
	playerInput = "GAMEPAD";
}
else
{
	gamePad = -1;
	playerInput = "KEYBOARD";
}

//Movement Speed
isMoving = false;
hSpeed = 0;
vSpeed = 0;
hAxis = 0;
vAxis = 0;
dir = "E";
speedCurrent = 0;
speedMax = 40;
speedAccel = 0.2;

//Speed Boost
isBoosting = false;
boostCurrent = 0;
boostMax = 40;
boostMaxTime = room_speed * 2;
boostCurTime = 0;
boostChargeRate = 2;

//Primary Weapon
shootPrimary = false;
canPrimary = true;
primaryRate = 0.3;
primaryDamage = 7;

//Secondary Weapon
shootSecondary = false;
canSecondary = true;
secondaryRate = 0.5;
secondaryDamage = 14;

//AOE Burst Weapon
canBurst = true;
burstRadius = 96;
burstCurRadius = 0;
burstRadTime = room_speed * 0.75;
burstCooldown = room_speed * 10;
burstCurTime = burstCooldown;
burstActive = false;

//Missiles Weapon
shootMissile = false;
canMissile = true;
missileVolley = 4;
missileCurVolley = 0;
missileDamage = 20;
missileCooldown = room_speed * 10;
missileCurTime = missileCooldown;

//Lazer Weapon
shootLazer = false;
canLazer = true;
lazerMaxLife = room_speed * 10;
lazerCurLife = lazerMaxLife;
lazerChargeRate = 0.1;

//Turret Weapon
shootTurret = false;
canTurret = true;
turretVolley = 24;
turretCurVolley = 0;
turretRate = room_speed * 0.2;
turretDamage = 5;
turretCooldown = room_speed * 10;
turretCurTime = turretCooldown;

//Mines Weapon
minesMax = 1;
minesRadius = 96;
minesActive = 0;

//Shield
shieldMax = 10;
shieldHealth = shieldMax;
shieldChargeRate = 0.01;
shieldCanCharge = true;
sImage = 0;
sA = 1 * shieldHealth/shieldMax;

//Hull
hHealth = 100;

//Mouse previous tracking
mxPrev = mouse_x;
myPrev = mouse_y;
mTimer = 0;

//Damage control
canDamage = true;
dTimer = room_speed;

canBeDamaged = true;

//Sprite animation
aImage = 0;
alarm[0] = room_speed * 0.1;

pColor = c_fuelyellow;

lColor1 = c_orange;
lColor2 = c_white;
lColor3 = c_yellow;
lPosition = 0;

p1Emitter = part_emitter_create(global.particleSystem);

//Feed stats to UI control
//Primary Weapon Stats
oControl.pRateP1   = primaryRate;
oControl.pDamageP1 = primaryDamage;
//Secondary Weapon Stats
oControl.sRateP1   = secondaryRate;
oControl.sDamageP1 = secondaryDamage;
//Speed Stats
oControl.sMaxP1   = speedMax;
oControl.sAccelP1 = speedAccel;
//Boost Stats
oControl.bRateP1  = boostChargeRate;
oControl.bTimeP1  = boostMaxTime;
//Shield Stats
oControl.sStrengthP1 = shieldHealth;
oControl.sRechargeP1 = shieldChargeRate;
//Burst Stats
oControl.bRadiusP1   = burstRadius;
oControl.bCooldownP1 = burstCooldown;
//Missiles Stats
oControl.mVolleyP1 = missileVolley;
oControl.mDamageP1 = missileDamage;
//Lazer Stats
oControl.lTimeP1     = lazerMaxLife;
oControl.lCooldownP1 = lazerChargeRate;
//Turret Stats
oControl.tRateP1   = turretRate;
oControl.tDamageP1 = turretDamage;
//Mines Stats
oControl.mMaxP1    = minesMax;
oControl.mRadiusP1 = minesRadius;