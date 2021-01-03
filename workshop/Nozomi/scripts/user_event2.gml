//USER EVENT 2 - Counter

#macro SUCCESS_WINDOW 5

#macro HITSTOP_AMOUNT 8

//Detect hitboxes. (only those that could have damaged you)
//var team_attack = get_match_setting(???);

var target_object = noone;
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
		if (type == 1)
		{
		    with (orig_player_id) { do_hitpause(HITSTOP_AMOUNT); }
		    angle = point_direction(other.x, floor(other.y - other.char_height/2), 
		                            orig_player_id.x, floor(orig_player_id.y - orig_player_id.char_height/2));
		}
		else
		{
		    if (hsp != 0 || vsp != 0)
		    {
		    	angle = point_direction(hsp, vsp, 0, 0);
		    }
		    else if (x != xprevious || y != yprevious)
		    {
		    	angle = point_direction(xprevious, yprevious, x, y);
		    }
		    else
		    {
		    	angle = point_direction(other.x, floor(other.y - other.char_height/2), x, y);
		    }
		}
		if (damage > best_damage)
		{
			target_object = (type == 1 || (orig_player_id != noone && orig_player_id.player == player))
			                             ? orig_player_id : noone;
			target_angle = angle;
			best_damage = damage;
		}
	}
}

if (target_object == noone && target_angle != noone)
{
	at_dspecial_target_object.x = x + lengthdir_x(noz_dspecial_homing_distance, target_angle);
	at_dspecial_target_object.y = y - 20 + lengthdir_y(noz_dspecial_homing_distance, target_angle);
	
	target_object = at_dspecial_target_object;
}

if (target_object != noone)
{
	//counter sucess: spawn projectiles
	at_dspecial_counter_target = target_object;
	at_dspecial_countered_damage = best_damage;
	
	window = SUCCESS_WINDOW;
	window_timer = 0;
	// Shockwave
	create_hitbox(AT_DSPECIAL, 2, 0, -24);
	do_hitpause(HITSTOP_AMOUNT);
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
