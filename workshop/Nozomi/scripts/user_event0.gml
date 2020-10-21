//USER EVENT 0 AKA. other_update.gml

with (oPlayer)
{
    // Runs from each opponent's perspective
	// if multiple Nozomis are in a match, this code is only executed by the
	// latest Nozomi to have applied an effect to you.
	// Avoids counters from getting decremented multiple times per frame
	if (self != other && noz_handler_id == other) 
	{	   
		//===========================================================
		// Resets on death/parry
		if (state == PS_RESPAWN || (invincible && state == PS_PARRY))
		{
			noz_freeze_timer = 0;
			noz_freeze_anim_rotate = 0;
			noz_snowstack_timer = 0;
			noz_snowimmune_timer = 0;
			noz_sleep_timer = 0;
			noz_sleepimmune_timer = 0;
			noz_sleep_anim_timer = 0;
			noz_handler_id = noone;
		}
		//===========================================================
		//Stop tracking if theres nothing left to handle
		else if (0 == noz_freeze_timer
		      && 0 == noz_snowstack_timer
		      && 0 == noz_snowimmune_timer
		      && 0 == noz_sleep_timer
		      && 0 == noz_sleepimmune_timer)
		{
			noz_handler_id = noone;
		}
		else
		{
			//===========================================================
			// Snow effect
			if (noz_snowstack_timer > 0) 
			{
			    if (!hitpause)
			    { noz_snowstack_timer--; }
				if (noz_snowstack_timer == 0)
				{ 
					sound_play(asset_get("sfx_ice_uspecial_jump"), 
					           false, noone, 0.6, 1.5);
				}
				else if (other.anim_do_draw_twinkle)
				{
				    var kx = x + other.anim_rand_x * char_height - (char_height / 2);
				    var ky = y - other.anim_rand_y * char_height;
					
					//Back to Nozomi's perspective
					with (other) 
					{ 
						var k = spawn_hit_fx(kx, ky, vfx_snow_twinkle); 
						k.depth = depth - 1;
					}
				}
			}
			//===========================================================
			//Frozen effect
			else if (noz_freeze_timer != 0) 
			{
				if (!hitpause)
				{
					if (noz_freeze_timer == -1)
					{
						noz_snowimmune_timer = other.noz_snowimmune_timer_max;
						noz_freeze_hsp = hsp;
						noz_freeze_vsp = -(other.noz_freeze_base_vsp
						 + get_player_damage(player) * other.noz_freeze_mult_vsp);
						
						noz_freeze_timer = other.noz_freeze_base_stun
						 + floor(noz_freeze_vsp / -other.noz_freeze_grav);
						hitstun = noz_freeze_timer;
						noz_anim_freeze_rotate = 0;
					}
					else if (free)
					{
						//detect wallbounces
						can_wall_tech = false;
						if (hsp * noz_freeze_hsp < 0) &&
						   ( place_meeting(x + 1, y, asset_get("par_block")) 
						  || place_meeting(x - 1, y, asset_get("par_block")) )
						{
						  	noz_freeze_hsp = -noz_freeze_hsp;
						}
						
						vsp = noz_freeze_vsp;
						noz_freeze_vsp += other.noz_freeze_grav;
						hsp = noz_freeze_hsp;
						noz_freeze_anim_rotate += other.noz_freeze_anim_speed;
					}
					else
					{
						//bounce
						noz_freeze_vsp *= -0.65;
						noz_freeze_vsp -= 1;
						vsp = noz_freeze_vsp;
						hsp = noz_freeze_hsp;
					}
					
					noz_freeze_timer--;
					
					if ( noz_freeze_timer == 0 || state_cat != SC_HITSTUN)
					{
						//Effect ended
						sound_play(asset_get("sfx_ice_fspecial_hit_ground"));
						noz_freeze_timer = 0;
						noz_freeze_anim_rotate = 0;
					}
					else 
					{
						set_state(PS_HITSTUN);
						hitstun = 3;
						if (noz_freeze_timer == other.noz_freeze_base_stun)
						{
							//Effect almost ended
							sound_play(asset_get("sfx_ice_end"));
						}
					}
				}
			}
			//===========================================================
			// Grace period
			else if (noz_snowimmune_timer > 0)
			{
				noz_snowimmune_timer--;
			}
			
			//============================================================
			// Sleep effect
			if (noz_sleep_timer > 0)
			{
				if (state_cat == SC_GROUND_NEUTRAL || state == PS_PRATLAND)
				{
					state = PS_PRATLAND;
					//avoid sfx/vfx
					state_timer = 1;
					if ((noz_sleep_anim_timer % 45) == 10)
					{
					    var kx = x + other.anim_rand_x * char_height - (char_height / 2);
					    var ky = y - (char_height * 0.75);
						
						//Back to Nozomi's perspective
						with (other) 
						{ 
							var k = spawn_hit_fx(kx, ky, vfx_sleep); 
							k.spr_dir = 1;
							k.depth = depth - 1;
						}
						sound_play(asset_get("sfx_cub_yawn"), false, noone, 1, 0.8);
					}
				}
				noz_sleep_timer--;
				noz_sleep_anim_timer++;
				
				if (hitpause) 
				{
					//if you get hit: stop being asleep
					//if you hit something: sleep time is reduced
					noz_sleep_timer = (state_cat == SC_HITSTUN) ?
					                   0 : floor(noz_sleep_timer * 0.9);
				}
				
				
				if ( (noz_sleepimmune_timer <= 0)
			        && ((state_cat == SC_HITSTUN) 
				    || noz_handler_id.state_cat == SC_HITSTUN
				    || noz_handler_id.at_nspecial_flagforimmune))
				{
				    noz_sleepimmune_timer = noz_handler_id.noz_nspecial_sleepimmune_max;
				}
			}
			//===========================================================
			// Grace period
			else if (noz_sleepimmune_timer > 0)
			{
				noz_sleepimmune_timer--;
				noz_sleep_anim_timer = 0;
			}
		}
    }
}