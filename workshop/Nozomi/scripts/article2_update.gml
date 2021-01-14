//article2_update

//sync position just in case
x = player_id.at_dspecial_zone_position.x;
y = player_id.at_dspecial_zone_position.y;

if (shine_cooldown > 0) shine_cooldown--;

//update radius
anim_timer += clamp(player_id.at_dspecial_zone_timer - anim_timer, -16, 32);
radius = ease_quintOut(0, max_radius, min(max_timer/2, anim_timer), max_timer/2);
draw_angle += 3;
                          
// applying frost to targets
if (radius > 0) with (oPlayer)
{
    if (self != other.player_id && (noz_snowimmune_timer == 0) 
    && get_player_team(player) != get_player_team(other.player_id.player)
    && hurtboxID == collision_circle(other.x, other.y, other.radius, 
                                     hurtboxID, true, false))
    {
    	//Slowing within zone
    	var slow_factor = (free ? 0.025 : 0.05);
    	slow_factor += clamp(0.015 * abs(hsp), 0, 0.20)
		hsp *= (1 - slow_factor);
		
    	if (noz_snowstack_timer < 5)
    	{
        	noz_handler_id = other.player_id;
			noz_snowstack_timer = 5;
    	}
        // [RUNE I] -- Frostbite debuff
        if (has_rune("I") && noz_snow_frostbite_timer < 5)
        { noz_snow_frostbite_timer = 5; }
    }
}

//sparkles
if (radius > 0) with (player_id)
{
    spawn_twinkle_round(vfx_snow_twinkle, other.x, other.y, other.radius)
}

//===========================================================
#define spawn_twinkle_round(vfx, pos_x, pos_y, radius)
{
    var width = radius * 2;
    var kx = -(radius) + anim_rand_x * width;
    var ky = -(radius) + anim_rand_y * width;
    var adjusted_x = pos_x + kx - (0.25*abs(ky)*(kx/radius));
    var adjusted_y = pos_y + ky - (0.25*abs(kx)*(ky/radius));
    
    spawn_hit_fx(adjusted_x, adjusted_y, vfx);

}
