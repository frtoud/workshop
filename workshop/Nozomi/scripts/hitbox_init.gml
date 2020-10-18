
// Lingering projectile hitboxes inherit Nozomi's speed
if ( (attack == AT_BAIR && hbox_num == 2)
  || (attack == AT_FAIR && hbox_num == 2)
  || (attack == AT_DATTACK && hbox_num == 2)  )
{ 
    hsp += player_id.hsp; 
}

// Lingering projectile for DTILT has a cooldown; avoids spamming too many at once
if ( (attack == AT_DTILT && hbox_num == 2) )
{ 
    with (player_id)
    {
        at_dtilt_proj_cooldown = noz_dtilt_proj_cooldown_max; 
        set_num_hitboxes(AT_DTILT, 1);
    }
}

// Lingering projectile for BAIR needs to be flipped
if ( (attack == AT_BAIR && hbox_num == 2) )
{
    spr_dir *= -1;
}