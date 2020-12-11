//USER EVENT 0 AKA. other_update.gml

with (oPlayer)
{
    // Runs from each opponent's perspective
	// if multiple Nozomis are in a match, this code is only executed by the
	// latest Nozomi to have applied an effect to you.
	// Avoids counters from getting decremented multiple times per frame
	if (noz_handler_id == other) 
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
			noz_sleep_interrupt_timer = 0;
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
			noz_freeze_anim_rotate = 0;
			noz_sleep_anim_timer = 0;
			noz_sleep_interrupt_timer = 0;
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
						//Prevents frozen players from being catapulted offstage
						//can happen if they get hit again mid-freeze; during hitpause
						noz_freeze_hsp = clamp(hsp, -other.noz_freeze_max_hsp, 
						                             other.noz_freeze_max_hsp);
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
						   ( place_meeting(x + 5, y, asset_get("par_block")) 
						  || place_meeting(x - 5, y, asset_get("par_block")) )
						{
						  	noz_freeze_hsp = -noz_freeze_hsp;
						}
						//detect ceilings
						else if (noz_freeze_vsp < 0 &&
							place_meeting(x, y - 5, asset_get("par_block")) )
						{
						  	noz_freeze_vsp = 0;
						}
						
						vsp = noz_freeze_vsp;
						noz_freeze_vsp += other.noz_freeze_grav;
						hsp = noz_freeze_hsp;
						noz_freeze_anim_rotate += other.noz_freeze_anim_speed;
					}
					else
					{
						//bounce
						if (noz_freeze_vsp > -1)
						{
						   noz_freeze_vsp = abs(noz_freeze_vsp) * -0.75;
						   noz_freeze_vsp -= 1;
						}
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
				
				if (state_cat == SC_HITSTUN || noz_sleep_timer < 0)
				{ 
					noz_sleep_timer = 0; 
					noz_sleep_mashanim_timer = 0;
				    noz_sleep_interrupt_timer = 0;
				}
				else 
				{
				    var mashing = false;
					
					if ( state_cat == SC_GROUND_NEUTRAL || state == PS_PRATLAND)
					|| ( state_cat == SC_AIR_NEUTRAL || state == PS_PRATFALL)
					|| (noz_sleep_interrupt_timer >= other.noz_nspecial_interruption_time)
					{
						state = (free ? PS_PRATFALL : PS_PRATLAND);
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
						
						if ("temp_level" in self)
						{
							//AIs can mash too
							// level of AI * 10% = ratio of perfect input mashing frames
							mashing = (get_gameplay_time() % 10 < temp_level)
						}
						else
						{
							if (joy_pad_idle)
							{
								noz_sleep_last_joy_dir = -1;
							}
							else
							{
								// converts range [0-360] into [0-3] to count cardinal directions only
								var cardinal_joy_dir = floor((joy_dir + 45) / 90) % 4;
								if (noz_sleep_last_joy_dir != cardinal_joy_dir)
								{
									mashing = true;
									noz_sleep_last_joy_dir = cardinal_joy_dir;
								}
							}
							
							if (jump_pressed || shield_pressed || attack_pressed || special_pressed
							|| up_strong_pressed || down_strong_pressed || left_strong_pressed || right_strong_pressed)
							{
								mashing = true;
								
								//reset all buffers
								clear_button_buffer( PC_JUMP_PRESSED );
								clear_button_buffer( PC_SHIELD_PRESSED );
								clear_button_buffer( PC_ATTACK_PRESSED );
								clear_button_buffer( PC_STRONG_PRESSED );
								clear_button_buffer( PC_SPECIAL_PRESSED );
							}
						}
						
						if (noz_sleep_mashanim_timer > 0)
						{
							noz_sleep_mashanim_timer--;
						}
						else if (mashing)
						{
							var k = spawn_hit_fx(x-(char_height/2) + (char_height* other.anim_rand_y), 
												y-(char_height * other.anim_rand_x), 14);
							k.draw_angle = joy_pad_idle ? 
											(other.anim_rand_x * other.anim_rand_y * 360)
										: (joy_dir + 90) % 360;
							noz_sleep_mashanim_timer = 20;
						}
					}
					else
					{
						//delayed interruption for a move in progress
						noz_sleep_interrupt_timer++;
						mashing = true;
					}
					
					noz_sleep_timer -= mashing ? other.noz_nspecial_mashing_bonus : 1;
					noz_sleep_anim_timer++;
				}
			}
			//===========================================================
			// Grace period
			else if (noz_sleepimmune_timer > 0)
			{
				noz_sleepimmune_timer--;
				noz_sleep_anim_timer = 0;
				noz_sleep_interrupt_timer = 0;
			}
		}
    }
}