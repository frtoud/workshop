// Other_post_draw
if (other_player_id != noz_handler_id) exit;

if (noz_freeze_timer > 0)
{
    //Icicle sprite (front)
    with (other_player_id) { shader_start(); }
    var fx_frame = noz_freeze_timer > other_player_id.noz_freeze_base_stun ? 1 : 2;
    draw_sprite_ext(other_player_id.vfx_frozen_sprite, fx_frame, 
                    x, y-(char_height / 2), -spr_dir, 1, spr_angle, c_white, 1);
    with (other_player_id) { shader_end(); }
}
