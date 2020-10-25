//USER EVENT 1 - Ice Reflector
if (instance_place(x, y+5, asset_get("bubble_obj")) != noone)
{
    //don't reflect bubbles, too inconsistent
    window = 5;
    window_timer = 0;
}
else
{
    // Reflector's logic:
    // if it's a projectile hitbox:
    //  - that moves / was moving but stopped:
    //     - is no longer moving -> destroy it (should it count?)
    //     - else -> force a parry to reflect it
    //  - that doesn't move:
    //     - And it comes from a moving, bashable article -> force a parry
    //     - else -> become vulnerable
    
    var found_moving_article = false;
    var item = noone;
    
    //check for collisions with the hurtbox for best results
    with (hurtboxID) 
    {
        // Main cast doesnt use object_articleX, the bastards.
        // Here ShovelKnight is being especially annoying
        found_moving_article = (noone != instance_place(x, y, asset_get("mobile_gear_obj")))
                            || (noone != instance_place(x, y, asset_get("treasure_rock_obj")));
                        
        if (!found_moving_article) { item  = instance_place(x, y, obj_article1);
             found_moving_article = (item != noone) && (item.vsp != 0 || item.hsp != 0) && (!item.unbashable); }
        if (!found_moving_article) { item  = instance_place(x, y, obj_article2);
             found_moving_article = (item != noone) && (item.vsp != 0 || item.hsp != 0) && (!item.unbashable); }
        if (!found_moving_article) { item  = instance_place(x, y, obj_article3);
             found_moving_article = (item != noone) && (item.vsp != 0 || item.hsp != 0) && (!item.unbashable); }
        if (!found_moving_article) { item  = instance_place(x, y, obj_article_solid);
             found_moving_article = (item != noone) && (item.vsp != 0 || item.hsp != 0) && (!item.unbashable); }
        if (!found_moving_article) { item  = instance_place(x, y, obj_article_platform); //print_debug(string());
             found_moving_article = (item != noone) && (item.vsp != 0 || item.hsp != 0) && (!item.unbashable); }
    
        //Detect hitboxes.
        item = instance_place(x, y, pHitBox); 
    }
    
    //var team_attack = get_match_setting(???);
    
    if ((item != noone)
    //detects only if it could have damaged you
    && (item.player != player || item.can_hit_self)
    && (can_be_hit[item.player] == 0) && (item.can_hit[player])
    && (get_player_team(item.player) != get_player_team(player)) )
    {
        var moving = (abs(item.hsp) > 0.01 || abs(item.vsp) > 0.01);
        var was_moving = item.length > 1 
                       &&(get_hitbox_value(item.attack, item.hbox_num, HG_PROJECTILE_HSPEED) != 0
                       || get_hitbox_value(item.attack, item.hbox_num, HG_PROJECTILE_VSPEED) != 0);
        
        if (item.damage >= at_dspecial_damage_block)
        {
            //You've broken this reflector!
            //Become vulnerable & apply cooldown
            at_dspecial_damage_block = 0;
            item.damage *= noz_dspecial_breaking_mult;
            if (item.hitbox_timer > 0) 
            { item.hitbox_timer-- };
            window = 3;
            window_timer = 0;
        }
        else if ( (item.type == 2 ) && (!moving && was_moving) )
        {
            //Item stops moving: destroy it
            item.destroyed = true;
            item.was_parried = true;
            at_dspecial_damage_block -= item.damage;
	        anim_dspecial_shockwave_frame = 6;
            at_dspecial_has_parried = true;
        }
        else if ((item.type == 2 ) && (moving || found_moving_article))
        {
            //Force-Parry those cases.
            if (item.hitbox_timer > 0) 
            { item.hitbox_timer-- };
            window = 4;
            window_timer = 0;
            perfect_dodging = true;
            anim_dspecial_shockwave_frame = 6;
        }
        else
        {
            //Become vulnerable to 'projectiles' that don't move
            //Delay one frame to connect on the next update
            if (item.hitbox_timer > 0) 
            { item.hitbox_timer-- };
            window = 5;
            window_timer = 0;
        }
    }
}