//USER EVENT 2 - Counter

#macro SUCCESS_WINDOW 5

#macro HITSTOP_AMOUNT 8

//Detect hitboxes. (only those that could have damaged you)
//var team_attack = get_match_setting(???);


var target_angle = noone;
var best_damage = 0.99; //minimum damage is 1

with (pHitBox)
{
	if ( (damage > 0) && (player != other.player || can_hit_self)
	  && (other.can_be_hit[player] == 0) && (can_hit[other.player])
	  && (groundedness == 0 || (other.free ? 2 : 1) == groundedness)
	  && (get_player_team(other.player) != get_player_team(player))
	  && place_meeting(x, y, other.hurtboxID) )
	{
		var angle = 0;
		if (type = 1)
		{
		    with (orig_player_id) { do_hitpause(HITSTOP_AMOUNT); }
		    angle = point_direction(other.x, floor(other.y - other.char_height/2), 
		                            orig_player_id.x, floor(orig_player_id.y - orig_player_id.char_height/2));
		}
		else
		{
		    destroyed = true;
		    angle = point_direction(other.x, floor(other.y - other.char_height/2), x, y);
		}
		if (damage > best_damage)
		{
			target_angle = angle;
			best_damage = damage;
		}
	}
}

if (target_angle != noone)
{
	//counter sucess: spawn projectiles
	at_dspecial_countered_angle = target_angle;
	at_dspecial_countered_damage = best_damage;
	
	window = SUCCESS_WINDOW;
	window_timer = 0;
	invincible = true;
	do_hitpause(HITSTOP_AMOUNT);
	invince_time = noz_dspecial_invince_time;
}

//==================================================================
#define do_hitpause(hitpause_length)
{
    //Do not override previous old_hsp values if already in hitpause
    if (!hitpause)
    {
        old_hsp = hsp;
        old_vsp = vsp;
        hitpause = true;
    }
    hitstop = hitpause_length;
    hitstop_full = hitpause_length;
}
