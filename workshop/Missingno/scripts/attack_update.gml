//B - Reversals
if (attack == AT_NSPECIAL || attack == AT_FSPECIAL || attack == AT_DSPECIAL || attack == AT_USPECIAL)
{
    trigger_b_reverse();
}

switch (attack)
{
//=============================================================
    case AT_FSPECIAL: // Charge & Water Gun
    {
        if (window == 2)
        {
            if (window_timer == get_window_value(AT_FSPECIAL, 2, AG_WINDOW_LENGTH) - 1)
            && (msg_fspecial_charge < 2)
            {
                msg_fspecial_charge++;
                sound_play(asset_get("sfx_may_arc_cointoss"));
            }
            else if (is_special_pressed(DIR_ANY))
            {
                if (msg_fspecial_charge == 0)
                {
                    window = 3;
                    window_timer = 0;
                }
                else if (msg_fspecial_charge == 1)
                {
                    set_attack(AT_FSPECIAL_2);
                }
                else
                {
                    set_attack(AT_FSPECIAL_2); //AT_FSPECIAL_AIR
                }
                msg_fspecial_charge = 0;
                state_timer = 0;
            }
        }
    } break;
//=============================================================
    case AT_FSPECIAL_2: // Bubblebeam
    {
        if (window == 2)
        {
            var hitbox = create_hitbox(AT_FSPECIAL_2, 1, x+(spr_dir*20), y-30);
            hitbox.hsp += spr_dir * msg_fspecial_bubble_random_hsp_boost 
                                  * (0.5 - random_func(0, 100, true)/ 100.0);
            hitbox.image_index = 2 * random_func(1, 6, true);
        }
    } break;
//=============================================================
    case AT_FSPECIAL_AIR: // Hydro Pump
    {
        
    } break;
//=============================================================
    default: break;
}

if (attack == AT_NSPECIAL){
    if (window == 3){
        if (special_pressed){
            window = 1;
            window_timer = 0;
        }
    }
}

if (attack == AT_USPECIAL){
    if (window == 1 && window_timer == 1){
        times_through = 0;
    }
    if (window == 2){
        if (window_timer == get_window_value(attack, 2, AG_WINDOW_LENGTH)){
            if (times_through < 10){
                times_through++;
                window_timer = 0;
            }
        }
        if (!joy_pad_idle){
            hsp += lengthdir_x(1, joy_dir);
            vsp += lengthdir_y(1, joy_dir);
        } else {
            hsp *= .6;
            vsp *= .6;
        }
        var fly_dir = point_direction(0,0,hsp,vsp);
        var fly_dist = point_distance(0,0,hsp,vsp);
        var max_speed = 12;
        if (fly_dist > max_speed){
            hsp = lengthdir_x(max_speed, fly_dir);
            vsp = lengthdir_y(max_speed, fly_dir);
        }
        if (special_pressed && times_through > 0){
            window = 4;
            window_timer = 0;
        }
        if (shield_pressed){
            window = 3;
            window_timer = 0;
        }
    }
    if (window > 3 && window < 6 && window_timer == get_window_value(attack, window, AG_WINDOW_LENGTH)){
        window++;
        window_timer = 0;
    }
}
/*
if (attack == AT_DSPECIAL && window_timer == 12 && window == 2 && false) {
    //set_player_damage(player, -500);
    var target = noone;
    with (oPlayer)
    {
        if (self != other)
        target = self;
    }
    //crashes when used with base cast
    //damage also switches
    var temp_player = self.player;
    self.player = target.player;
    self.hurtboxID.player = player;
    target.player = temp_player;
    target.hurtboxID.player = temp_player;
    
    
}
*/
