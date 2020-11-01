//USER EVENT 1 - Ice Reflector
if (instance_place(x, y+5, asset_get("bubble_obj")) != noone)
{
    //don't reflect bubbles, too inconsistent
    window = 5;
    window_timer = 0;
    exit;
}

// Reflector's logic:
// if it's a projectile hitbox:
//  - that moves / was moving but stopped:
//     - is no longer moving -> destroy it
//     - does_not_reflect -> manually flip its speed
//     - else -> force a parry to reflect it
//  - that doesn't move:
//     - And it comes from a moving article -> force a parry
//     - else -> become vulnerable

var found_moving_article = false;
var total_damage_reflected = 0;
var need_parry      = false;
var need_parry_fx   = false;
var need_vulnerable = false;

//check for collisions with the hurtbox for best results
with (hurtboxID)
{
    // Main cast doesnt use object_articleX, the bastards.
    // Here ShovelKnight is being especially annoying
    found_moving_article = (noone != instance_place(x, y, asset_get("mobile_gear_obj")))
                        || (noone != instance_place(x, y, asset_get("treasure_rock_obj")))
                        || find_moving_article(obj_article1)
                        || find_moving_article(obj_article2)
                        || find_moving_article(obj_article3)
                        || find_moving_article(obj_article_solid)
                        || find_moving_article(obj_article_platform);
}

//Detect hitboxes. (only projectiles that could have damaged you)
//var team_attack = get_match_setting(???);
with (pHitBox)
{
	if ( (type == 2) && (player != other.player || can_hit_self)
	  && (other.can_be_hit[player] == 0) && (can_hit[other.player])
	  && (groundedness == 0 || (other.free ? 2 : 1) == groundedness)
	  && (get_player_team(other.player) != get_player_team(player))
	  && place_meeting(x, y, other.hurtboxID))
	{
		
        found_moving_article = found_moving_article
                            || find_moving_parent(pHitBox)
                            || find_moving_parent(obj_article1)
                            || find_moving_parent(obj_article2)
                            || find_moving_parent(obj_article3)
                            || find_moving_parent(obj_article_solid)
                            || find_moving_parent(obj_article_platform);
		
        var moving = (abs(hsp) > 0.01 || abs(vsp) > 0.01)
                  || (xprevious != x || yprevious != y);
        var was_moving = false;
        with (other)
        {
            was_moving = other.length > 1 
            &&(get_hitbox_value(other.attack, other.hbox_num, HG_PROJECTILE_HSPEED) != 0
            || get_hitbox_value(other.attack, other.hbox_num, HG_PROJECTILE_VSPEED) != 0);
	    }
	    
		var manual_parry = does_not_reflect || projectile_parry_stun
		       //Elliana does not use the does_not_reflect flag
		       || (player_id.url == CH_ELLIANA && attack == AT_NSPECIAL);
		       
		if   (player_id.url == CH_ETALUS && attack == AT_FSPECIAL)
		  || (player_id.url == CH_SHOVEL_KNIGHT && attack == AT_UTILT)
		{
			//Destroy these cases; too weird to reflect.
			moving = false;
			was_moving = true;
		}
		
		//with (other)
		//{
		//	print_debug("======================================");
		//	print_debug("fma: " + string(found_moving_article));
		//	print_debug("mov: " + string(moving));
		//	print_debug("wmv: " + string(was_moving));
		//	print_debug("man: " + string(manual_parry));
		//}
        
        total_damage_reflected += damage;
        var has_dmg_bonus = true;
        
        if (other.at_dspecial_damage_block <= total_damage_reflected)
        {
        	need_vulnerable = true;
        }
        else if (!moving && was_moving)
        {
	        //Item stops moving: destroy it
	        destroyed = true;
	        was_parried = true;
	        need_parry_fx = true;
        }
        else if (moving && manual_parry)
        {
        	//Manual reflection
        	vsp *= -1;
        	hsp *= -1;
        	spr_dir *= -1;
        	hitbox_timer = 0;
        	can_hit_self = true;
        	can_hit[other.player] = false;
        	can_hit[player] = true;
        	
	        was_parried = true;
        	projectile_parry_stun = false;
        	need_parry_fx = true;
        }
        else if (moving || found_moving_article)
        {
	        //Delay one frame to connect on the next update
            if (hitbox_timer > 0) 
            { hitbox_timer--; }
            if (length < 2) 
            { length++; }
	        
        	projectile_parry_stun = false;
        	need_parry = true;
        }
        else //Non moving Non-article
        {
	        //Delay one frame to connect on the next update
            if (hitbox_timer > 0) 
            { hitbox_timer--; }
            if (length < 2 && //Exception for Ori NSPECIAL tap because of visual oddities
            !(player_id.url == CH_ORI && attack == AT_NSPECIAL && hbox_num == 1) ) 
            { length++; }
            total_damage_reflected -= damage; //does not count as reflected
        	need_vulnerable = true;
        	has_dmg_bonus = false;
        }
        
        if (has_dmg_bonus)
        { damage = floor(damage * other.noz_dspecial_dmg_mult); }
	}
}

at_dspecial_damage_block -= total_damage_reflected;
if (at_dspecial_damage_block <= 0)
{
    //You've broken this reflector!
    //SFX?
    at_dspecial_damage_block = 0;
    sound_play(asset_get("sfx_absa_orb_miss"), 0, -1, 1.5, 1);
    set_state(free ? PS_PRATFALL : PS_PRATLAND);
}
else if (need_parry)
{
    //Activate force-parrying.
    window = 4;
    window_timer = 0;
    perfect_dodging = true;
    anim_dspecial_shockwave_frame = 6;
}
else if (need_parry_fx)
{
	anim_fakeparry_timer = 20;
	sound_play(asset_get("sfx_parry_success"));
	at_dspecial_has_parried = true;
	anim_dspecial_shockwave_frame = 6;
}
else if (need_vulnerable)
{
    //Become vulnerable to 'projectiles' that don't move
    window = 5;
    window_timer = 0;
}

#define find_moving_article(obj)
{ 
	var item = instance_place(x, y, obj);
    return ( (item != noone) && ((item.vsp != 0 || item.hsp != 0)
          || (item.xprevious != item.x || item.yprevious != item.y)) );
}

#define find_moving_parent(obj)
{
	var found = false;
	with (obj)
	{
		if ( (self != other) && (obj != pHitBox || type == 2) && (other.player_id == player_id)
		&&	 ( place_meeting(x, y, other) || instance_position(x, y, other) )
		&& ((vsp != 0 || hsp != 0) || (xprevious != x || yprevious != y)) )
        {
            found = true; break;
        }
	}
	return found;
}
