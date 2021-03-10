//pre_draw.gml

//==================================================================
// back up drawing-related parameters that can get fiddled with
copy_params(self, msg_anim_backup, msg_anim_backup);

//=============================================
//xorshift algorithm

var UINT_MAX = power(2,32) - 1;
with (msg_unsafe_random)
{
    rng = (rng ^(rng << 13)) % UINT_MAX;
    rng = (rng ^(rng >> 17)) % UINT_MAX;
    rng = (rng ^(rng << 5 )) % UINT_MAX;
}

var stringassembled = "";
for (var i = 0; i < 32; i++)
{ stringassembled += string(msg_unsafe_random.rng >> i & 1) }
draw_debug_text(x-20, y+(20), "rng: "+ string(msg_unsafe_random.rng) );
draw_debug_text(x-20, y+(36), stringassembled );
draw_debug_text(x-20, y+(52), "int: "+string(msg_unsafe_random.intensity)+" frq: "+string(msg_unsafe_random.frequency) );
//=============================================

// Reroll Missingno effects
user_event(0);

//==================================================================
// BSPECIAL must consider the small_sprites parameter of the stolen sprites!
if (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) && (attack == AT_DSPECIAL_2)
{
    small_sprites = at_bspecial_last_move.small_sprites;
}

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

#define manual_draw(main_draw)
{
    var scale = 1 + small_sprites;
    if (msg_unsafe_effects.vsync.timer > 0)
    {
        var spr_w = sprite_get_width(sprite_index);
        var spr_h = sprite_get_height(sprite_index);
        var spr_cliptop = spr_h - msg_unsafe_effects.vsync.cliptop;
        var spr_clipbot = spr_h - msg_unsafe_effects.vsync.clipbot;
        var vsync_offset = msg_unsafe_effects.vsync.offset;
        
        if (main_draw) shader_start();
        var pos_x = x - sprite_xoffset + draw_x;
        var pos_y = y - sprite_yoffset + draw_y;
        
        draw_sprite_part_ext(sprite_index, image_index, 
                             0, 0, spr_w, spr_cliptop, 
                             pos_x, pos_y, spr_dir * scale, scale, c_white, 1.0);
        draw_sprite_part_ext(sprite_index, image_index, 
                             0, spr_cliptop, spr_w, spr_clipbot - spr_cliptop, 
                             pos_x + vsync_offset, pos_y + spr_cliptop, spr_dir * scale, scale, c_white, 1.0);
        draw_sprite_part_ext(sprite_index, image_index, 
                             0, spr_clipbot, spr_w, max(spr_h - spr_clipbot, 0), 
                             pos_x, pos_y + spr_clipbot, spr_dir * scale, scale, c_white, 1.0);
        if (main_draw) shader_end();
        
        // to turn off normal rendering for this frame
        if (main_draw) sprite_index = no_sprite;
    }
    else if (!main_draw)
    {
        draw_sprite_ext(sprite_index, image_index, x+draw_x, y+draw_y, 
                        scale*spr_dir, scale, spr_angle, c_white, 1);
    }
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