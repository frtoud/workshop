
shader_start();
//=============================================================================
//DSPECIAL: Ice Shine
if (attack == AT_DSPECIAL && (window == 3 || (window >= 6 && window < 9))
   && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) )
{
    var vfxframe = (get_gameplay_time() / 3 ) % 4;
    draw_set_alpha(0.5 * ease_quadOut(1, 2, floor(at_dspecial_damage_block), noz_dspecial_damage_max));
    draw_sprite(sprite_get("dspecial_shine"), vfxframe, x, y-(char_height/2));
    draw_set_alpha(1);
}
if (anim_dspecial_shockwave_frame > 0)
{ 
    draw_sprite(vfx_shine_spr, 4 - min(anim_dspecial_shockwave_frame, 4),
                x, y-(char_height/2)); 
}


//=============================================================================
//force-show the parry frame instead of being greyed out
if (state == PS_PARRY && image_index == dodge_startup_frames)
{
    draw_sprite_ext(sprite_index, image_index, x, y, spr_dir, 1, 0, c_white, 1);
}

//Skip drawing indicators if not needed
if (!draw_indicator) exit;

//=============================================================================
//FSPECIAL cooldown on indicator
var indicator_x = x + 1;
var indicator_y = y - char_height - hud_offset - 20;
if (at_fspecial_soft_cooldown_timer > 0)
{
    draw_sprite_ext(indicator_spr, 0, indicator_x, indicator_y, 2, 2, 0, c_black, 0.5);
}
else if (anim_indicatorflash_timer > 0)
{
    var indic_alpha = (1.0 * anim_indicatorflash_timer) / anim_indicatorflash_max;
    draw_sprite_ext(indicator_spr, 0, indicator_x, indicator_y, 2, 2, 0, c_white, indic_alpha);
}

//=============================================================================
//Hovermeter on indicator
var meter_x = x;
var meter_y = indicator_y - 2;
var meter_height = 6;
var meter_width_max = 15;
    
if (anim_hud_fadeout > 0)
{
    var blink_timer = floor(anim_hud_timers_max / 2);
    var meter_width = ease_linear(0, meter_width_max, anim_hud_fadeout, anim_hud_timers_max);
    draw_sprite_part(hovermeter_spr, 1, 0, 0, 2*meter_width,
                     meter_height, meter_x-meter_width, meter_y);
    draw_sprite_part_ext(hovermeter_spr, 2, 0, 0, 2*meter_width, meter_height,
                         meter_x-meter_width, meter_y, 1, 1, c_white, 
                ease_sineIn(0, 1, anim_hud_fadeout, anim_hud_timers_max));
}
if (anim_hud_rollin > 0)
{
    
    var meter_width = ease_linear(0, meter_width_max, anim_hud_rollin, anim_hud_timers_max);
    draw_sprite_part(hovermeter_spr, 1, 0, 0, 2*meter_width, 
                     meter_height, meter_x-meter_width, meter_y);
    
    var meter_fill = ease_sineInOut(0, floor(2*meter_width - 4),
                       floor(at_uspecial_hover_meter), noz_uspecial_hover_max);
    var meter_right = min(2*meter_width -2, meter_fill);
    
    draw_sprite_part(hovermeter_spr, 0, 0, 0, 
        meter_right+2, 6, meter_x-meter_width, meter_y);
}

shader_end();