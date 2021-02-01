//article1_update

//======================================================================
if (should_die && !dying)
{
    dying = true;
    article_timer = 0;
    
    //farewell to the neighbors
    if (instance_exists(left_plat))
    { left_plat.right_plat = noone; }
    if (instance_exists(right_plat))
    { right_plat.left_plat = noone; }
    
    instance_destroy(plat_collider);
}
//======================================================================
if (dying)
{
    if (has_proj)
    {
        //spawn the projectile on death
        has_proj = false;
    }
    
    if (article_timer >= 12)
    {
        instance_destroy(); exit;
    }
    
    image_index = 3 + floor(article_timer / 4);
}
//======================================================================
else
{
    image_index = 3 - 
    (spr_dir < 1 ? (2*(left_plat != noone) + (right_plat != noone))
                 : ((left_plat != noone) + 2*(right_plat != noone)) );

    //=====================================================================
    //dstrong spikes
    if (spike_timer > 0)
    {
        if (spike_timer == spike_hitbox_frame)
        {
            sound_play(asset_get("sfx_ice_end"), false, noone, 0.5, 1.5);
            create_hitbox(AT_DSTRONG, 5, x + spike_dir * 6, y-10);
        }
        if (spike_timer == spike_spread_frame)
        {
            var neighbor = spike_dir > 0 ? right_plat : left_plat;
            if (instance_exists(neighbor) && !neighbor.should_die)
            {
                neighbor.spike_timer = spike_timer_max;
                neighbor.spike_dir = spike_dir;
                //earlier platforms were updated first; correction needed
                if (neighbor.article_timer < article_timer)
                { neighbor.spike_timer--; }
            }
        }
        spike_timer--;
    }
    //=====================================================================
    else if (does_not_decay)
    {
        //prevent death by natural causes
    }
    else if (article_timer >= player_id.noz_fspecial_lifetime)
    {
        should_die = true;
    }
    else if (plat_collider != noone && article_timer >= player_id.noz_fspecial_airtime)
    {
        should_die = true;
        has_proj = true;
    }
    
    //Sync collider article if you weren't spawned on top of something
    if (free && plat_collider == noone)
    { 
        //partnered Platform collider
        plat_collider = instance_create(x, y, "obj_article_platform");
        plat_collider.player_id = player_id;
        plat_collider.visible = false;
        plat_collider.sprite_index = player_id.article1_col_spr;
        plat_collider.through_platforms = true;
        
        //override regular article physics
        can_be_grounded = false;
        ignores_walls = true;
        through_platforms = true;
    }
    
    //frosty debuffs
    var victim = instance_position(x, y-2, oPlayer)
    if (victim != noone && victim != player_id && !victim.free
        && get_player_team(player_id.player) != get_player_team(victim.player)
        && victim.noz_snowimmune_timer < 1)
    {
        if (victim.noz_snowstack_timer < 5)
        {
            victim.noz_snowstack_timer = 5;
            victim.noz_handler_id = player_id;
        }

        // Frostbite debuff
        if (player_id.noz_rune_flags.frostbite
            && victim.noz_snow_frostbite_timer < 5)
        { victim.noz_snow_frostbite_timer = 5; }
    }
    
    //sparkles randomly
    if (player_id.anim_do_draw_twinkle &&
        player_id.anim_rand_twinkle == random_twinkle)
    {
        spawn_twinkle(player_id.vfx_snow_twinkle, x, y-8, 12);
    }
}
article_timer++;
anim_timer++;

//======================================================================
#define spawn_twinkle(vfx, pos_x, pos_y, radius)
with (player_id)
{
    var kx = pos_x - (radius / 2) + anim_rand_x * radius;
    var ky = pos_y - (radius / 2) + anim_rand_y * radius;
    
    var k = spawn_hit_fx(kx, ky, vfx);
}