
if (my_hitboxID.orig_player == player) //ONLY CHECK WITH YOUR OWN HITBOXES!!
{
 // Lingering projectile hitboxes: applies snow effects
    if (((my_hitboxID.attack == AT_BAIR    && my_hitboxID.hbox_num == 2)
      || (my_hitboxID.attack == AT_FAIR    && my_hitboxID.hbox_num == 2)
      || (my_hitboxID.attack == AT_DTILT   && my_hitboxID.hbox_num == 2)
      || (my_hitboxID.attack == AT_DATTACK && my_hitboxID.hbox_num == 2)
    // Plus some specials!
      || (my_hitboxID.attack == AT_DSPECIAL) 
      || (my_hitboxID.attack == AT_FSPECIAL) ))
    {
        if (hit_player_obj.noz_snowimmune_timer == 0)
        {
            hit_player_obj.noz_snowstack_timer = noz_snowstack_timer_max;
            hit_player_obj.noz_handler_id = self;
        }
    }
    // Strong attacks: apply ice effects
    else if ( ((my_hitboxID.attack == AT_USTRONG)
            || (my_hitboxID.attack == AT_FSTRONG && (my_hitboxID.hbox_num == 4))
            || (my_hitboxID.attack == AT_DSTRONG && (my_hitboxID.hbox_num != 1)))
            && (hit_player_obj.noz_snowstack_timer > 0) )
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
    // Sing Sleeping
    else if (my_hitboxID.attack == AT_NSPECIAL 
          && hit_player_obj.noz_sleepimmune_timer == 0)
    {
        hit_player_obj.noz_sleep_timer = noz_nspecial_sleep_max;
        hit_player_obj.noz_handler_id = self;
    }
}