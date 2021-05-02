//update.gml

//=====================================================
// if holding a CD; restore if its missing.
if (uhc_has_cd_blade && !instance_exists(uhc_current_cd))
{ 
    print("hey dude not cool i was hodling tht >:[")
    uhc_current_cd = instance_create(x, y, "obj_article1"); 
}

//=====================================================
//All states that don't count for charges
uhc_no_charging = (state == PS_RESPAWN) || (state == PS_SPAWN)
               || (state == PS_ATTACK_GROUND && attack == AT_TAUNT);
                  
//=====================================================
//FSPECIAL recharge
if (uhc_fspecial_charge_current < uhc_fspecial_charge_max)
    && !uhc_no_charging
{
    uhc_fspecial_charge_current++;
}

//=====================================================
// Blade respawn cooldown
uhc_cd_can_respawn = uhc_cd_respawn_timer >= uhc_cd_respawn_timer_max;
if (!uhc_cd_can_respawn && !uhc_no_charging)
&& !instance_exists(uhc_current_cd)
{
    uhc_cd_respawn_timer++
}

//=====================================================
// If this was true (from previous frame) and you were sent to hitstun, lose charge
if (uhc_nspecial_is_charging) && (state_cat == SC_HITSTUN)
{
    uhc_nspecial_charges = 0;
}
uhc_nspecial_is_charging = (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND)
                            && ((attack == AT_NSPECIAL) && window < 3);