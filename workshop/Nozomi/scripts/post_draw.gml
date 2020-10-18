
shader_start();
//DSPECIAL: Ice Shine
if (attack == AT_DSPECIAL && (window == 2 || window == 4 || window == 5)
   && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND) )
{
    var vfxframe = (get_gameplay_time() / 3 ) % 4;
    draw_sprite(sprite_get("dspecial_shine"), vfxframe, x, y-24);
}

//force-show the parry frame
else if (state == PS_PARRY && image_index == dodge_startup_frames)
{
    draw_sprite_ext(sprite_index, image_index, x, y, spr_dir, 1, 0, c_white, 1);
}
shader_end();