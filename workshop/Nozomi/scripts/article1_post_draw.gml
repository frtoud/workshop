//article1_post_draw

if (!should_die && anim_timer < 9)
{
    draw_sprite_ext(player_id.article1_spawn_spr, floor(anim_timer / 3), 
                    x, y, spr_dir, 1, 0, c_white, 1);
}