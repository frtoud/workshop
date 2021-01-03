//got_parried

if (my_hitboxID.attack == AT_USPECIAL)
{
    at_uspecial_hover_meter = -1;
    set_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE, 7);
}
else if (my_hitboxID.attack == AT_DSPECIAL && my_hitboxID.hbox_num == 4)
{
    with (pHitBox)
    {
        //reflects the whole group
        if (orig_player_id == other && player == other.player
            && attack == AT_DSPECIAL && hbox_num == 4)
        {
            hsp *= -1;
            vsp *= -1;
            do_homing = false;
            player = other.hit_player;
        }
    }
}
