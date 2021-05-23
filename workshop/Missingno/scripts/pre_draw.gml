//pre_draw.gml

//==================================================================
// back up drawing-related parameters that can get fiddled with
//todo: move to animation.gml?
copy_params(self, msg_anim_backup, msg_anim_backup);

//=============================================
//xorshift algorithm
if (!msg_unsafe_paused)
{
    var UINT_MAX = power(2,32) - 1;
    var rng = msg_unsafe_random;

    rng = (rng ^(rng << 13)) % UINT_MAX;
    rng = (rng ^(rng >> 17)) % UINT_MAX;
    rng = (rng ^(rng << 5 )) % UINT_MAX;

    msg_unsafe_random = rng;
    with (oPlayer) if (msg_unsafe_handler_id == other)
    { msg_unsafe_random = rng; }
}

//=============================================
// Reroll Missingno effects
user_event(0);

//==================================================================
// Plaid effect
gpu_push_state();
{
    ///Disable blend; write alpha only, don't alphatest
    gpu_set_blendenable(false);
    gpu_set_alphatestenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    ///Draw an alpha-zero background as a base "no draw" zone
    draw_set_alpha(0);
    draw_sprite_tiled(glitch_bg_spr, 0, 0, 0);
    draw_set_alpha(1);
    
    ///setup mask (exact position/sprite of player)
    manual_draw(false);

    ///Reenable blend, alphatest & colors
    gpu_set_blendenable(true);
    gpu_set_alphatestenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    ///Blend using destination pixels alpha, set by the mask
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    
    ///draw the masked "background"
    //cannot shade -- kills performance... 
    //uses preshaded backgrounds for this purpose
    draw_sprite_tiled_ext(glitch_bg_spr, get_player_color(player), draw_x, draw_y, 
                          1+small_sprites, 1+small_sprites, c_white, 1);
    
    //playtest zone fix (or unfix...?)
    ///Disable blend; write alpha only, don't alphatest
    gpu_set_blendenable(false);
    gpu_set_alphatestenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    ///Draw an alpha-one background to reallow draw
    draw_sprite_tiled(glitch_bg_spr, 0, 0, 0);
}
gpu_pop_state();
//==================================================================

//might need to override normal draw code
manual_draw(true);

//==================================================================
#define manual_draw(main_draw)
{
    var scale = 1 + small_sprites;
    var skips_draw = false;
    if (msg_unsafe_effects.bad_vsync.timer > 0)
    {
        var spr_w = sprite_get_width(sprite_index);
        var spr_h = sprite_get_height(sprite_index);
        var spr_cliptop = spr_h - msg_unsafe_effects.bad_vsync.cliptop;
        var spr_clipbot = spr_h - msg_unsafe_effects.bad_vsync.clipbot;
        var vsync_offset = msg_unsafe_effects.bad_vsync.horz;
        
        if (main_draw) shader_start();
        var pos_x = x - scale*sprite_xoffset + draw_x;
        var pos_y = y - scale*sprite_yoffset + draw_y;
        
        draw_sprite_part_ext(sprite_index, image_index, 
                             0, 0, spr_w, spr_cliptop, 
                             pos_x, pos_y, spr_dir * scale, scale, c_white, 1.0);
        draw_sprite_part_ext(sprite_index, image_index, 
                             0, spr_cliptop, spr_w, spr_clipbot - spr_cliptop, 
                             pos_x + vsync_offset, pos_y + spr_cliptop*scale, spr_dir * scale, scale, c_white, 1.0);
        draw_sprite_part_ext(sprite_index, image_index, 
                             0, spr_clipbot, spr_w, max(spr_h - spr_clipbot, 0), 
                             pos_x, pos_y + spr_clipbot*scale, spr_dir * scale, scale, c_white, 1.0);
        if (main_draw) shader_end();
        
        skips_draw = main_draw;
        
    }
    else if !main_draw || (small_sprites != msg_anim_backup.small_sprites)
    {
        if (main_draw) shader_start();
        draw_sprite_ext(sprite_index, image_index, x+draw_x, y+draw_y, 
                        scale*spr_dir, scale, spr_angle, c_white, 1);
        if (main_draw) shader_end();
        
        skips_draw = main_draw;
    }
    
    // to turn off normal rendering for this frame
    if (skips_draw) sprite_index = no_sprite;
}


//=========================================================
#define copy_params(source, target, limiter)
//Usage: for all variables in LIMITER: copy value from SOURCE to TARGET
{
    var keys = variable_instance_get_names(limiter)
    for (var k = 0; k < array_length(keys); k++)
    {
        variable_instance_set(target, keys[k], 
                              variable_instance_get(source, keys[k]));
    }
}