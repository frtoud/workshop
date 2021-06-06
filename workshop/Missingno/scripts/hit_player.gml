if (my_hitboxID.orig_player_id != self) exit; //Only our own hitboxes


//Bubbles internal lockout logic (kind of heavy)
if (my_hitboxID.attack == AT_FSPECIAL_2)
{
    var victim_player = hit_player_obj.player;
    with (pHitBox) 
    if ("url" in orig_player_id && orig_player_id.url == other.url && attack == AT_FSPECIAL_2)
    {
        can_hit[victim_player] = -other.msg_fspecial_bubble_lockout;
    }
}