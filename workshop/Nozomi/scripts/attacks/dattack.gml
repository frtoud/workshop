set_attack_value(AT_DATTACK, AG_SPRITE, sprite_get("dattack"));
set_attack_value(AT_DATTACK, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DATTACK, AG_HURTBOX_SPRITE, sprite_get("dattack_hurt"));

set_window_value(AT_DATTACK, 1, AG_WINDOW_TYPE, 0);
set_window_value(AT_DATTACK, 1, AG_WINDOW_LENGTH, 12);
set_window_value(AT_DATTACK, 1, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_DATTACK, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_DATTACK, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_medium2"));
set_window_value(AT_DATTACK, 1, AG_WINDOW_SFX_FRAME, 10);

set_window_value(AT_DATTACK, 2, AG_WINDOW_TYPE, 0);
set_window_value(AT_DATTACK, 2, AG_WINDOW_LENGTH, 16);
set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DATTACK, 2, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_DATTACK, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_DATTACK, 2, AG_WINDOW_CUSTOM_GROUND_FRICTION, .03);

set_window_value(AT_DATTACK, 3, AG_WINDOW_TYPE, 0);
set_window_value(AT_DATTACK, 3, AG_WINDOW_LENGTH, 16);
set_window_value(AT_DATTACK, 3, AG_WINDOW_ANIM_FRAMES, 4);
set_window_value(AT_DATTACK, 3, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_DATTACK, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_DATTACK, 3, AG_WINDOW_CUSTOM_GROUND_FRICTION, .5);


set_num_hitboxes(AT_DATTACK, 2);

set_hitbox_value(AT_DATTACK, 1, HG_PARENT_HITBOX, 0);
set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DATTACK, 1, HG_WINDOW, 2);
set_hitbox_value(AT_DATTACK, 1, HG_LIFETIME, 12);
set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_Y, -16);
set_hitbox_value(AT_DATTACK, 1, HG_HITBOX_X, 12);
set_hitbox_value(AT_DATTACK, 1, HG_WIDTH, 40);
set_hitbox_value(AT_DATTACK, 1, HG_HEIGHT, 40);
set_hitbox_value(AT_DATTACK, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_DATTACK, 1, HG_DAMAGE, 5);
set_hitbox_value(AT_DATTACK, 1, HG_ANGLE, 361);
set_hitbox_value(AT_DATTACK, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_DATTACK, 1, HG_KNOCKBACK_SCALING, .3);
set_hitbox_value(AT_DATTACK, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_DATTACK, 1, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
set_hitbox_value(AT_DATTACK, 1, HG_HIT_LOCKOUT, 12);

//Lingering hitbox
set_hitbox_value(AT_DATTACK, 2, HG_PARENT_HITBOX, 0);
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DATTACK, 2, HG_WINDOW, 2);
set_hitbox_value(AT_DATTACK, 2, HG_WINDOW_CREATION_FRAME, 4);
set_hitbox_value(AT_DATTACK, 2, HG_LIFETIME, 30);
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_X, 30);
set_hitbox_value(AT_DATTACK, 2, HG_HITBOX_Y, -18);
set_hitbox_value(AT_DATTACK, 2, HG_WIDTH, 30);
set_hitbox_value(AT_DATTACK, 2, HG_HEIGHT, 30);
set_hitbox_value(AT_DATTACK, 2, HG_PRIORITY, 4);
set_hitbox_value(AT_DATTACK, 2, HG_DAMAGE, 2);
set_hitbox_value(AT_DATTACK, 2, HG_ANGLE, 80);
set_hitbox_value(AT_DATTACK, 2, HG_BASE_KNOCKBACK, 1);
set_hitbox_value(AT_DATTACK, 2, HG_KNOCKBACK_SCALING, .1);
set_hitbox_value(AT_DATTACK, 2, HG_BASE_HITPAUSE, 2);
set_hitbox_value(AT_DATTACK, 2, HG_HITPAUSE_SCALING, .1);
set_hitbox_value(AT_DATTACK, 2, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DATTACK, 2, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_DATTACK, 2, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(AT_DATTACK, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
set_hitbox_value(AT_DATTACK, 2, HG_VISUAL_EFFECT, 6);

set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_SPRITE, sprite_get("cloud_proj_small"));
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_ANIM_SPEED, 1.0/5);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_HSPEED, 2);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_AIR_FRICTION, 3);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_GROUND_FRICTION, 0.25);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_PARRY_STUN, 0);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DATTACK, 2, HG_PROJECTILE_IS_TRANSCENDENT, 1);