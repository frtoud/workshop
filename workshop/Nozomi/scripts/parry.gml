
if ((attack == AT_DSPECIAL) && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND))
{
    if (enemy_hitboxID.type == 1)
    {
        set_state(PS_HITSTUN);
        perfect_hitpause = false;
    }
    else
    {
        //This should be zero, but it ends up parrying the same attack multiple times.
        can_be_hit[hit_player_obj.player] = 20;
        at_dspecial_has_parried = true;
    }
    //This parry state is reached when force-reflecting something.
    //You do not become invincible afterwards.
    invincible = false;
    perfect_dodged = false;
    perfect_dodging = false;
    
}