//draw hud

//Seems to prevent an error during a character reload
if ("at_uspecial_hover_meter" in self)
{
    var meter_x = temp_x+28;
    var meter_y = temp_y+8;
    
    if (anim_hud_fadeout > 0)
    {
        draw_sprite_ext(hud_hovermeter_spr, 2, meter_x, meter_y, 1, 1, 0, c_white, 
            ease_sineIn(0, 1, anim_hud_fadeout, anim_hud_timers_max));
    }
    if (anim_hud_rollin > 0)
    {
        var meter_height = 32;
        var meter_width = ease_linear(0, 4, anim_hud_rollin, anim_hud_timers_max);
        
        draw_sprite_part(hud_hovermeter_spr, 1, 0, 0, 
            meter_width, meter_height, meter_x, meter_y);
        
        var meter_fill = ease_sineInOut(0, meter_height - 4,
                           floor(at_uspecial_hover_meter), noz_uspecial_hover_max);
        var meter_top = (meter_height - meter_fill - 2);
        
        shader_start();
        draw_sprite_part(hud_hovermeter_spr, 0, 0, meter_top, 
            meter_width, meter_fill, meter_x-2, meter_y + meter_top);
        shader_end();
    }
}