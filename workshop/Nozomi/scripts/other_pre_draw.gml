// other_pre_draw
if ("other_player_id" in self && other_player_id != noz_handler_id) exit;

//===================================================================
//Sleep mashing
if (noz_sleep_mashanim_timer > 0 && noz_sleep_timer > 0)
{
    var mash_sqrt = sqrt(noz_sleep_mashanim_timer);
    draw_x = (other_player_id.anim_rand_x * mash_sqrt/2) - (mash_sqrt);
}

//===================================================================
//Freeze rotation-animation effect
else if (noz_freeze_timer > 0) 
{ 
    //Rotation effect while frozen
    if (free && (noz_freeze_anim_rotate != 0))
    {
        spr_angle = noz_freeze_anim_rotate;
        draw_x = (sin(degtorad(noz_freeze_anim_rotate)))*(char_height / 2);
        draw_y = -(1 - cos(degtorad(noz_freeze_anim_rotate)))*(char_height / 2);
    }
    
    //Icicle sprite (back)
    with (other_player_id) { shader_start(); }
    draw_sprite_ext(other_player_id.vfx_frozen_sprite, 0,
                    x, y-(char_height / 2), -spr_dir, 1, spr_angle, c_white, 1);
    with (other_player_id) { shader_end(); }
}

//===================================================================
//Setting Outline color
if (noz_snowstack_timer > 0) 
{ 
    outline_color = [0,80,120]; 
}
else 
{ 
    outline_color = [0, 0, 0]; 
}
init_shader();

//Reset in case anything happens & init_shader() can revert to black
//Also prevents the HUD icon from changing
outline_color = [0, 0, 0];

//===================================================================
//Kirby: Sleep radius visual effect
if (noz_has_kirby_ability && (attack == AT_EXTRA_3) 
 && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND)
 && (window < 3) )
{
    var alpha = window == 1 ? ease_quartIn(0, 100, window_timer, 
                      get_window_value(AT_EXTRA_3, 1, AG_WINDOW_LENGTH))
                            : ease_quartIn(100, 0, window_timer, 
                      get_window_value(AT_EXTRA_3, 2, AG_WINDOW_LENGTH));
             
    with (other_player_id) { shader_start(); }
    draw_sprite_ext(other_player_id.vfx_nspecial_spr, 
                    floor(get_gameplay_time() / 5 ) % 4, x, y-20, 1, 1, 
                    floor(get_gameplay_time() * 5 ) % 360, c_white,
                    (alpha) * 0.01 * 0.7 );
    with (other_player_id) { shader_end(); }
}
//===================================================================
