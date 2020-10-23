sprite_change_offset("idle", 28, 50);
sprite_change_offset("hurt", 26, 50);
sprite_change_offset("spinhurt", 30, 52);
sprite_change_offset("crouch", 34, 48);
sprite_change_offset("walk", 32, 50);
sprite_change_offset("walkturn", 28, 48);
sprite_change_offset("dash", 32, 60);
sprite_change_offset("dashstart", 34, 52);
sprite_change_offset("dashstop", 38, 56);
sprite_change_offset("dashturn", 32, 66);

sprite_change_offset("jumpstart", 30, 44);
sprite_change_offset("jump", 30, 68);
sprite_change_offset("doublejump", 30, 60);
sprite_change_offset("walljump", 32, 52);
sprite_change_offset("pratfall", 32, 62);
sprite_change_offset("pratland", 32, 44);
sprite_change_offset("land", 28, 44);
sprite_change_offset("landinglag", 28, 44);

sprite_change_offset("parry", 30, 52);
sprite_change_offset("roll_forward", 28, 48);
sprite_change_offset("roll_backward", 28, 52);
sprite_change_offset("airdodge", 32, 66);
sprite_change_offset("waveland", 32, 44);
sprite_change_offset("tech", 32, 54);

sprite_change_offset("jab", 38, 48);
sprite_change_offset("dattack", 40, 56);
sprite_change_offset("ftilt", 36, 48);
sprite_change_offset("dtilt", 32, 46);
sprite_change_offset("utilt", 40, 74);

sprite_change_offset("nair", 48, 68);
sprite_change_offset("fair", 32, 68);
sprite_change_offset("bair", 38, 68);
sprite_change_offset("uair", 38, 76);
sprite_change_offset("dair", 30, 72);

//should match 1:1 with the regular variant offsets above
sprite_change_offset("nair_hover", 48, 68);
sprite_change_offset("fair_hover", 32, 68);
sprite_change_offset("bair_hover", 38, 68);
sprite_change_offset("uair_hover", 38, 76);

sprite_change_offset("idle_hover", 20, 50);
sprite_change_offset("vfx_hair_hover", 36, 30);
sprite_change_offset("vfx_hair_exhausted", 36, 24);

sprite_change_offset("article1", 8, 2);
sprite_change_offset("article1_spawn", 18, -4);
sprite_change_offset("article1_col", 8, 0);
sprite_change_collision_mask( "article1", false, 2, 0, 0, 16, 2, 1 );
sprite_change_collision_mask( "article1_col", false, 2, 0, 0, 16, 0, 1 );

sprite_change_offset("cloud_proj_small", 32, 32);
sprite_change_offset("cloud_proj_big", 28, 26);
sprite_change_offset("vfx_snow_twinkle", 3, 3);
sprite_change_offset("vfx_ice_small", 27, 28);
sprite_change_offset("vfx_ice_big", 29, 32);
sprite_change_offset("vfx_ice_dstrong", 56, 30);
sprite_change_collision_mask( "vfx_ice_dstrong", false, 2, 0, 0, 112, 30, 1 );
sprite_change_offset("vfx_frozen", 52, 56);
sprite_change_offset("vfx_nspecial", 52, 52);
sprite_change_offset("vfx_nspecial_notes_left", 52, 52);
sprite_change_offset("vfx_nspecial_notes_right", 52, 52);
sprite_change_offset("vfx_sleep", 24, 38);
sprite_change_offset("vfx_shine", 45, 46);
 
sprite_change_offset("fstrong", 36, 48);
sprite_change_offset("ustrong", 32, 52);
sprite_change_offset("dstrong", 28, 60);
 
sprite_change_offset("nspecial", 28, 56);
sprite_change_offset("nspecial_air", 28, 56);
sprite_change_offset("fspecial", 34, 66);
sprite_change_offset("uspecial", 46, 60);
sprite_change_offset("dspecial", 32, 56);
sprite_change_offset("dspecial_air", 32, 56);
sprite_change_offset("dspecial_shine", 35, 36);
 
sprite_change_offset("taunt", 40, 68);
sprite_change_offset("plat", 37, 14);

set_victory_theme(sound_get("victory"));
set_victory_bg(sprite_get("victory"));