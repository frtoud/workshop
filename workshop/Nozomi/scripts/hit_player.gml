
if (my_hitboxID.orig_player == player) //ONLY CHECK WITH YOUR OWN HITBOXES!!
{
    var is_a_cloud = ("is_a_cloud" in my_hitboxID) && my_hitboxID.is_a_cloud;
    // Lingering projectile hitboxes: applies snow effects
    // BAIR with STRONG effects
    if ((( is_a_cloud )
    // Plus some specials!
      || (my_hitboxID.attack == AT_DSPECIAL) 
      || (my_hitboxID.attack == AT_FSPECIAL) ))
    {
        if (hit_player_obj.noz_snowimmune_timer == 0)
        {
            hit_player_obj.noz_snowstack_timer = noz_snowstack_timer_max;
            hit_player_obj.noz_handler_id = self;
            
            if (noz_rune_flags.frostbite) // Frostbite debuff
            { hit_player_obj.noz_snow_frostbite_timer = noz_snowstack_timer_max; }
        }
        
        // Exploding clouds
        if (is_a_cloud && noz_rune_flags.cloud_explode)
        {
            create_hitbox(my_hitboxID.attack, 3, my_hitboxID.x, my_hitboxID.y);
        }
    }
    // Strong attacks: apply ice effects
    else if ((hit_player_obj.noz_snowstack_timer > 0) && (
               (my_hitboxID.attack == AT_USTRONG)
            || (my_hitboxID.attack == AT_FSTRONG && (my_hitboxID.hbox_num == 4))
            || (my_hitboxID.attack == AT_DSTRONG && (my_hitboxID.hbox_num != 1))
            // [RUNE B] -- BAIR with STRONG effects
            || (my_hitboxID.attack == AT_BAIR && noz_rune_flags.bair_strong)
            ))
    {
        hit_player_obj.should_make_shockwave = false;
        hit_player_obj.orig_knock = 3;
        hit_player_obj.noz_snowstack_timer = 0;
        hit_player_obj.noz_snowimmune_timer = noz_snowimmune_timer_max;
        hit_player_obj.noz_freeze_timer = -1; //signal for initial ice effect
        hit_player_obj.noz_handler_id = self;
    }
    // FSTRONG needs to make sure you stay chilly until the end of the move
    else if ( (my_hitboxID.attack == AT_FSTRONG) 
         && (hit_player_obj.noz_snowstack_timer > 0) )
    {
        hit_player_obj.noz_snowstack_timer = 30;
    }
}