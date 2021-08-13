if y1_timer < y1_duration 
{
    y1_timer ++;
    y1_pos  = EaseQuint(y1_timer, y1_start, y1_to, y1_duration);
    xscale1 = EaseQuint(y1_timer, 0, 1, y1_duration);
    yscale1 = EaseQuint(y1_timer, 0, 1, y1_duration);
}
if y2_timer < y2_duration 
{ 
    y2_timer ++;
    y2_pos  = EaseQuart(y2_timer, y2_start, y2_to, y2_duration);
    xscale2 = EaseQuart(y2_timer, 0, 1, y2_duration);
    yscale2 = EaseQuart(y2_timer, 0, 1, y2_duration);
}
if y3_timer < y3_duration 
{ 
    y3_timer ++;
    y3_pos  = EaseQuint(y3_timer, y3_start, y3_to, y3_duration);
    xscale3 = EaseQuint(y3_timer, 0, 1, y3_duration);
    yscale3 = EaseQuint(y3_timer, 0, 1, y3_duration);
}

rot += 0.25;
p1r -= 1;
p2r -= 0.6;
p3r -= 0.4;
if floor(rot) == 360 { rot = 0; }
if floor(p1r) == 360 { p1r = 0; }
if floor(p2r) == 360 { p2r = 0; }
if floor(p3r) == 360 { p3r = 0; }

p1x = x_anchor + lengthdir_x(420, rot);
p1y = y_anchor + lengthdir_y(420, rot);

p2x = x_anchor + lengthdir_x(420, rot + 120);
p2y = y_anchor + lengthdir_y(420, rot + 120);

p3x = x_anchor + lengthdir_x(420, rot + 240);
p3y = y_anchor + lengthdir_y(420, rot + 240);