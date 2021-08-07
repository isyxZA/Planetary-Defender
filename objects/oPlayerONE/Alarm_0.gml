/// @description Sprite animation
if aImage < sprite_get_number(sAura)-1 { ++aImage; }
	else { aImage = 0; }
if sImage < sprite_get_number(sShield)-1 { ++sImage; }
	else { sImage = 0; }
alarm[0] = room_speed * 0.1;