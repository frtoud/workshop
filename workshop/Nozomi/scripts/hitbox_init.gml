is_a_cloud = false;

//====================================================================
// Lingering projectile cloud hitboxes
if (hbox_num == 2) && ( (attack == AT_FAIR)
                     || (attack == AT_DTILT)
                     || (attack == AT_DATTACK))
{
    is_a_cloud = true;
}
else if ( (attack == AT_BAIR && hbox_num == 2) )
{
    is_a_cloud = !player_id.noz_rune_flags.bair_strong;
    // Lingering projectile for BAIR needs to be flipped
    spr_dir *= -1;
    if (!is_a_cloud)
    {
       //still inherit Nozomi's speed
       hsp += player_id.hsp; 
    }
}

if (is_a_cloud)
{
    //Save length (in timer) of 2 frames of animation
    anim_fade_frames = (2.0 / img_spd);
    
    //inherit Nozomi's speed
    hsp += player_id.hsp * ((attack == AT_DTILT) ? 0.75 : 1);
    
    //DATTACK cloud needs some help on platforms
    if (attack == AT_DATTACK) { dattack_speedcheck_timer = 20; }

    // Kicking clouds
    is_kickable = player_id.noz_rune_flags.cloud_kick;
    if (is_kickable)
    {
        //save friction
        saved_friction = frict;
        boosted_friction = frict * player_id.noz_cloudkick_friction;
    
        kick_cooldown = 8;
        kick_boosted = 0;
    }
    //Extended clouds
    is_extended = player_id.noz_rune_flags.cloud_longer;
    snow_width = (attack == AT_FAIR || attack == AT_BAIR)? 20 : 12;
    snow_depth = 0;
    restore_hit_timer = 0;
}
//====================================================================
// Lingering projectile for DTILT has a cooldown; avoids spamming too many at once
if ( (attack == AT_DTILT && hbox_num == 2) )
{ 
    with (player_id)
    {
        at_dtilt_proj_cooldown = noz_dtilt_proj_cooldown_max; 
        set_num_hitboxes(AT_DTILT, 1);
    }
}
//DSPECIAL's counter shards
if (attack == AT_DSPECIAL && hbox_num == 4)
{
	do_homing = true;
	if ("homing_target" not in self) 
       { homing_target = noone; }
}
