var midX = display_get_gui_width() * 0.5;
//var midY = display_get_gui_height() * 0.5;
var botY = display_get_gui_height() * 0.95;
draw_set_halign(fa_center);
draw_set_font(fnt12);
var txt1;
if instance_exists(oPlayerONE)
{
	txt1 = "Controller Connected: " + string(oPlayerONE.gamePad);
}
else
{
	txt1 = "";
}

draw_text(midX, botY, txt1);
draw_text(midX, botY - 32, string(enemyCount));