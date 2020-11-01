//PreDraw
init_shader();

shader_start();

if (at_uspecial_hovering && state != PS_PRATFALL &&
        //Attack with exceptions to the Hover Hair drawing.
      !(state == PS_ATTACK_AIR && 
     ( (attack == AT_USPECIAL && !(image_index > 12 && image_index < 16) && image_index != 22)
    || (attack == AT_UAIR && image_index > 0 && image_index < 5 )
    || (attack == AT_NAIR && at_uspecial_exhausted)) ))
{
    draw_sprite_ext(at_uspecial_exhausted ? vfx_hair_exhausted_spr : vfx_hair_hover_spr, 
                    floor(anim_hover_hair_frame), x - (spr_dir * 4), y - 44, 
                    spr_dir, 1, 0, c_white, 1);
}

//NSPECIAL: Sing
if (attack == AT_NSPECIAL && (window > 1) &&
   (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) )
{
    var alpha = window == 2 ? ease_quadOut(0, 100, window_timer, 
                      get_window_value(AT_NSPECIAL, 2, AG_WINDOW_LENGTH))
             : (window == 5 ? ease_sineInOut(100, 0, window_timer, 
                       get_window_value(AT_NSPECIAL, 5, AG_WINDOW_LENGTH)) 
             : 100);
    
    draw_sprite_ext(sprite_get("vfx_nspecial"), 
       floor(get_gameplay_time() / 5 ) % 4, x, y-24, 1, 1, 
       floor(get_gameplay_time() * 5 ) % 360, c_white,
       (alpha) * 0.01 * 0.7 );
}

shader_end();

//Simulate parry VFX
if (anim_fakeparry_timer > 0)
{
    draw_sprite_ext(anim_fakeparry_bg, clamp(floor((20 - anim_fakeparry_timer)/4), 0, 5),
                    x, y-28, 2, 2, 0, c_white, 0.5);
}