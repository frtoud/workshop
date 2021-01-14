set_attack_value(AT_DSPECIAL, AG_CATEGORY, 2);
set_attack_value(AT_DSPECIAL, AG_SPRITE, sprite_get("dspecial"));
set_attack_value(AT_DSPECIAL, AG_NUM_WINDOWS, 4);
set_attack_value(AT_DSPECIAL, AG_HAS_LANDING_LAG, 0);
set_attack_value(AT_DSPECIAL, AG_OFF_LEDGE, 1);
set_attack_value(AT_DSPECIAL, AG_AIR_SPRITE, sprite_get("dspecial_air"));
set_attack_value(AT_DSPECIAL, AG_HURTBOX_SPRITE, sprite_get("dspecial_hurt"));

set_window_value(AT_DSPECIAL, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_LENGTH, 4);
set_window_value(AT_DSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 1);

set_window_value(AT_DSPECIAL, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_LENGTH, 4);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_GOTO, 4);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_SFX, asset_get("sfx_zetter_shine"));
set_window_value(AT_DSPECIAL, 2, AG_WINDOW_SFX_FRAME, 0);

set_window_value(AT_DSPECIAL, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_LENGTH, 24);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_INVINCIBILITY, 1);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_SFX, asset_get("sfx_zetter_shine"));
set_window_value(AT_DSPECIAL, 3, AG_WINDOW_SFX_FRAME, 0);

set_window_value(AT_DSPECIAL, 4, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 4, AG_WINDOW_LENGTH, 8);
set_window_value(AT_DSPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_DSPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(AT_DSPECIAL, 4, AG_WINDOW_HAS_WHIFFLAG, 1);

//Counter Success
set_window_value(AT_DSPECIAL, 5, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 5, AG_WINDOW_LENGTH, 24);
set_window_value(AT_DSPECIAL, 5, AG_WINDOW_INVINCIBILITY, 1);
set_window_value(AT_DSPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_DSPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 9);

//Reflection window
set_window_value(AT_DSPECIAL, 6, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 6, AG_WINDOW_LENGTH, 20);
set_window_value(AT_DSPECIAL, 6, AG_WINDOW_INVINCIBILITY, 2);
set_window_value(AT_DSPECIAL, 6, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_DSPECIAL, 6, AG_WINDOW_ANIM_FRAME_START, 1);

//Hidden instant-Parry window
set_window_value(AT_DSPECIAL, 7, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 7, AG_WINDOW_LENGTH, 3);
set_window_value(AT_DSPECIAL, 7, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DSPECIAL, 7, AG_WINDOW_ANIM_FRAME_START, 4);

//Hidden vulnerability window
set_window_value(AT_DSPECIAL, 8, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 8, AG_WINDOW_LENGTH, 3);
set_window_value(AT_DSPECIAL, 8, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DSPECIAL, 8, AG_WINDOW_ANIM_FRAME_START, 4);

//Counter Fail
set_window_value(AT_DSPECIAL, 9, AG_WINDOW_TYPE, 1);
set_window_value(AT_DSPECIAL, 9, AG_WINDOW_LENGTH, 32);
set_window_value(AT_DSPECIAL, 9, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_DSPECIAL, 9, AG_WINDOW_ANIM_FRAME_START, 5);

set_num_hitboxes(AT_DSPECIAL, 3);

set_hitbox_value(AT_DSPECIAL, 1, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_WINDOW, 2);
set_hitbox_value(AT_DSPECIAL, 1, HG_LIFETIME, 2);
set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_Y, -24);
set_hitbox_value(AT_DSPECIAL, 1, HG_WIDTH, 80);
set_hitbox_value(AT_DSPECIAL, 1, HG_HEIGHT, 80);
set_hitbox_value(AT_DSPECIAL, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE, 0);
set_hitbox_value(AT_DSPECIAL, 1, HG_DAMAGE, 2);
set_hitbox_value(AT_DSPECIAL, 1, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSPECIAL, 1, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DSPECIAL, 1, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_DSPECIAL, 1, HG_VISUAL_EFFECT, 27);
set_hitbox_value(AT_DSPECIAL, 1, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE_FLIPPER, 8);
set_hitbox_value(AT_DSPECIAL, 1, HG_MUNO_OBJECT_LAUNCH_ANGLE, -2);
set_hitbox_value(AT_DSPECIAL, 1, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_GROUP, -1);

//Counter-shockwave (early, for hitpause & projectiles)
set_hitbox_value(AT_DSPECIAL, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_WINDOW, 5);
set_hitbox_value(AT_DSPECIAL, 2, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_DSPECIAL, 2, HG_LIFETIME, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_HITBOX_Y, -24);
set_hitbox_value(AT_DSPECIAL, 2, HG_WIDTH, 100);
set_hitbox_value(AT_DSPECIAL, 2, HG_HEIGHT, 100);
set_hitbox_value(AT_DSPECIAL, 2, HG_PRIORITY, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_DAMAGE, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_EFFECT, 9); //Polite
set_hitbox_value(AT_DSPECIAL, 2, HG_ANGLE, 45);
set_hitbox_value(AT_DSPECIAL, 2, HG_BASE_KNOCKBACK, 1);
set_hitbox_value(AT_DSPECIAL, 2, HG_ANGLE_FLIPPER, 8);
set_hitbox_value(AT_DSPECIAL, 2, HG_BASE_HITPAUSE, 8);
set_hitbox_value(AT_DSPECIAL, 2, HG_HITBOX_GROUP, -1);

//Counter-shockwave
set_hitbox_value(AT_DSPECIAL, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DSPECIAL, 3, HG_WINDOW, 5);
set_hitbox_value(AT_DSPECIAL, 3, HG_WINDOW_CREATION_FRAME, 1);
set_hitbox_value(AT_DSPECIAL, 3, HG_LIFETIME, 1);
set_hitbox_value(AT_DSPECIAL, 3, HG_HITBOX_Y, -24);
set_hitbox_value(AT_DSPECIAL, 3, HG_WIDTH, 160);
set_hitbox_value(AT_DSPECIAL, 3, HG_HEIGHT, 160);
set_hitbox_value(AT_DSPECIAL, 3, HG_PRIORITY, 2);
set_hitbox_value(AT_DSPECIAL, 3, HG_DAMAGE, 2);
set_hitbox_value(AT_DSPECIAL, 3, HG_ANGLE, 45);
set_hitbox_value(AT_DSPECIAL, 3, HG_HIT_LOCKOUT, noz_dspecial_pre_homing_time);
set_hitbox_value(AT_DSPECIAL, 3, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSPECIAL, 3, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DSPECIAL, 3, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_DSPECIAL, 3, HG_VISUAL_EFFECT, 27);
set_hitbox_value(AT_DSPECIAL, 3, HG_HIT_SFX, asset_get("sfx_icehit_weak2"));
set_hitbox_value(AT_DSPECIAL, 3, HG_ANGLE_FLIPPER, 8);
set_hitbox_value(AT_DSPECIAL, 3, HG_HITBOX_GROUP, -1);

//Counter-shards
set_hitbox_value(AT_DSPECIAL, 4, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DSPECIAL, 4, HG_LIFETIME, 300);
set_hitbox_value(AT_DSPECIAL, 4, HG_WINDOW_CREATION_FRAME, 2);
set_hitbox_value(AT_DSPECIAL, 4, HG_WIDTH, 20);
set_hitbox_value(AT_DSPECIAL, 4, HG_HEIGHT, 20);
set_hitbox_value(AT_DSPECIAL, 4, HG_PRIORITY, 1);
set_hitbox_value(AT_DSPECIAL, 4, HG_DAMAGE, 1);
set_hitbox_value(AT_DSPECIAL, 4, HG_BASE_KNOCKBACK, 4);
set_hitbox_value(AT_DSPECIAL, 4, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DSPECIAL, 4, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_DSPECIAL, 4, HG_VISUAL_EFFECT, 27);
set_hitbox_value(AT_DSPECIAL, 4, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
set_hitbox_value(AT_DSPECIAL, 4, HG_ANGLE, 45);
set_hitbox_value(AT_DSPECIAL, 4, HG_ANGLE_FLIPPER, 8);
set_hitbox_value(AT_DSPECIAL, 4, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DSPECIAL, 4, HG_PROJECTILE_SPRITE, sprite_get("shard_proj"));
set_hitbox_value(AT_DSPECIAL, 4, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DSPECIAL, 4, HG_PROJECTILE_WALL_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL, 4, HG_PROJECTILE_GROUND_BEHAVIOR, 1);
set_hitbox_value(AT_DSPECIAL, 4, HG_PROJECTILE_DESTROY_EFFECT, 6);
set_hitbox_value(AT_DSPECIAL, 4, HG_PROJECTILE_IS_TRANSCENDENT, 1);
set_hitbox_value(AT_DSPECIAL, 4, HG_PROJECTILE_DOES_NOT_REFLECT, 1); //manual reflection logic
