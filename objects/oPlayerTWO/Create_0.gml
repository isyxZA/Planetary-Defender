//Assign Controller
if !ds_list_empty(global.controllers) && ds_list_size(global.controllers > 1)
{
	gamePad = global.controllers[| 1];
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
shieldHealth = 10;
shieldChargeRate = 0.1;

//Hull
hHealth = 100;

//Mouse previous tracking
mxPrev = mouse_x;
myPrev = mouse_y;
mTimer = 0;

//Damage control
canDamage = true;
dTimer = room_speed;

//Sprite animation
aImage = 0;
alarm[0] = room_speed * 0.1;

pColor = c_blue;

//Feed stats to UI control
//Primary Weapon Stats
oControl.pRateP2   = primaryRate;
oControl.pDamageP2 = primaryDamage;
//Secondary Weapon Stats
oControl.sRateP2   = secondaryRate;
oControl.sDamageP2 = secondaryDamage;
//Speed Stats
oControl.sMaxP2   = speedMax;
oControl.sAccelP2 = speedAccel;
//Boost Stats
oControl.bRateP2  = boostChargeRate;
oControl.bTimeP2  = boostMaxTime;
//Shield Stats
oControl.sStrengthP2 = shieldHealth;
oControl.sRechargeP2 = shieldChargeRate;
//Burst Stats
oControl.bRadiusP2   = burstRadius;
oControl.bCooldownP2 = burstCooldown;
//Missiles Stats
oControl.mVolleyP2 = missileVolley;
oControl.mDamageP2 = missileDamage;
//Lazer Stats
oControl.lTimeP2     = lazerMaxLife;
oControl.lCooldownP2 = lazerChargeRate;
//Turret Stats
oControl.tRateP2   = turretRate;
oControl.tDamageP2 = turretDamage;
//Mines Stats
oControl.mMaxP2    = minesMax;
oControl.mRadiusP2 = minesRadius;