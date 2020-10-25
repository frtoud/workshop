// other_pre_draw
if ("other_player_id" in self && other_player_id != noz_handler_id) exit;

if (noz_freeze_timer > 0) 
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
