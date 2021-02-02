//CSS_DRAW
var temp_x = x + 12;
var temp_y = y + 140;

draw_set_halign(fa_left);
draw_set_font(asset_get("fName"));

var text = "B" + string(get_char_info(player, INFO_VER_MAJOR))
         + "." + string(get_char_info(player, INFO_VER_MINOR));

draw_set_color(c_black);
for (i = -2; i <= 2; i += 2)
{
    for (j = -2; j <= 2; j += 2)
    {
        if !(i == 0 && j == 0)
        {
            draw_text_transformed(temp_x + i, temp_y + j, text, 1, 1, 0);
        }
    }
}
draw_set_color(c_white);
draw_text_transformed(temp_x, temp_y, text, 1, 1, 0);