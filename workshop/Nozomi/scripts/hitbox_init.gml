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
    is_a_cloud = !has_rune("B");
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
    if (attack != AT_DTILT) { hsp += player_id.hsp; }

    // [RUNE H] -- Kicking clouds
    if (has_rune("H"))
    {
        //save friction
        saved_friction = frict;
        boosted_friction = frict * player_id.noz_cloudkick_friction;
    
        kick_cooldown = 8;
        kick_boosted = 0;
    }
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
