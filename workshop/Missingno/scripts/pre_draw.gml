//pre_draw.gml

//==================================================================
gpu_push_state();
{
    ///Disable blend; write alpha only, don't alphatest
    gpu_set_blendenable(false);
    gpu_set_alphatestenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    ///Draw an alpha-zero background as a base "no draw" zone
    draw_set_alpha(0);
    draw_sprite_tiled(glitch_bg_spr, 0, 0, 0);
    ///draw_circle_color(x, y, 100, c_white, c_white, false);
    draw_set_alpha(1);
    
    ///setup mask (exact position/sprite of player)
    draw_sprite_ext(sprite_index, image_index, x, y, spr_dir, 1, 0, c_white, 1);
    
    ///Reenable blend, alphatest & colors
    gpu_set_blendenable(true);
    gpu_set_alphatestenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    ///Blend using destination pixels alpha, set by the mask
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    
    ///draw the masked "background"
    //shader_start();
    draw_sprite_tiled(glitch_bg_spr, 0, 0, 0);
    //shader_end();
    
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