set_attack_value(AT_BAIR, AG_CATEGORY, 1);
set_attack_value(AT_BAIR, AG_SPRITE, sprite_get("bair"));
set_attack_value(AT_BAIR, AG_HURTBOX_SPRITE, sprite_get("bair_hurt"));
set_attack_value(AT_BAIR, AG_NUM_WINDOWS, 3);
set_attack_value(AT_BAIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_BAIR, AG_LANDING_LAG, 4);

//Used for hovermode sprites in animation.gml
set_attack_value(AT_BAIR, 55, sprite_get("bair_hover"));

set_window_value(AT_BAIR, 1, AG_WINDOW_TYPE, 0);
set_window_value(AT_BAIR, 1, AG_WINDOW_LENGTH, 10);
set_window_value(AT_BAIR, 1, AG_WINDOW_ANIM_FRAMES, 3);

set_window_value(AT_BAIR, 2, AG_WINDOW_TYPE, 0);
set_window_value(AT_BAIR, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_BAIR, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_BAIR, 2, AG_WINDOW_ANIM_FRAME_START, 3);
set_window_value(AT_BAIR, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_BAIR, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));

set_window_value(AT_BAIR, 3, AG_WINDOW_TYPE, 0);
set_window_value(AT_BAIR, 3, AG_WINDOW_LENGTH, 10);
set_window_value(AT_BAIR, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_BAIR, 3, AG_WINDOW_ANIM_FRAME_START, 5);
set_window_value(AT_BAIR, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_BAIR, 2);

set_hitbox_value(AT_BAIR, 1, HG_PARENT_HITBOX, 0);
set_hitbox_value(AT_BAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_BAIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_BAIR, 1, HG_LIFETIME, 4);
set_hitbox_value(AT_BAIR, 1, HG_HITBOX_X, -15);
set_hitbox_value(AT_BAIR, 1, HG_HITBOX_Y, -15);
set_hitbox_value(AT_BAIR, 1, HG_WIDTH, 40);
set_hitbox_value(AT_BAIR, 1, HG_HEIGHT, 30);
set_hitbox_value(AT_BAIR, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_BAIR, 1, HG_DAMAGE, 9);
set_hitbox_value(AT_BAIR, 1, HG_ANGLE, 145);
set_hitbox_value(AT_BAIR, 1, HG_BASE_KNOCKBACK, 6);
set_hitbox_value(AT_BAIR, 1, HG_KNOCKBACK_SCALING, .75);
set_hitbox_value(AT_BAIR, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_BAIR, 1, HG_HITPAUSE_SCALING, .25);
set_hitbox_value(AT_BAIR, 1, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_BAIR, 1, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(AT_BAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_medium1"));
set_hitbox_value(AT_BAIR, 1, HG_HIT_LOCKOUT, 12);

//Lingering hitbox
set_hitbox_value(AT_BAIR, 2, HG_PARENT_HITBOX, 0);
set_hitbox_value(AT_BAIR, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_BAIR, 2, HG_WINDOW, 2);
set_hitbox_value(AT_BAIR, 2, HG_WINDOW_CREATION_FRAME, 2);
set_hitbox_value(AT_BAIR, 2, HG_LIFETIME, 36);
set_hitbox_value(AT_BAIR, 2, HG_HITBOX_X, -35);
set_hitbox_value(AT_BAIR, 2, HG_HITBOX_Y, -15);
set_hitbox_value(AT_BAIR, 2, HG_WIDTH, 40);
set_hitbox_value(AT_BAIR, 2, HG_HEIGHT, 40);
set_hitbox_value(AT_BAIR, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_BAIR, 2, HG_DAMAGE, 3);
set_hitbox_value(AT_BAIR, 2, HG_ANGLE, 90);
set_hitbox_value(AT_BAIR, 2, HG_BASE_KNOCKBACK, 1.5);
set_hitbox_value(AT_BAIR, 2, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_BAIR, 2, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_BAIR, 2, HG_HITPAUSE_SCALING, .1);
set_hitbox_value(AT_BAIR, 2, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_BAIR, 2, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_BAIR, 2, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(AT_BAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
set_hitbox_value(AT_BAIR, 2, HG_VISUAL_EFFECT, 6);

set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_SPRITE, sprite_get("cloud_proj_big"));
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_ANIM_SPEED, (9.0 / get_hitbox_value(AT_BAIR, 2, HG_LIFETIME)));
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_HSPEED, -1.25);
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_AIR_FRICTION, 0.3);
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_GROUND_FRICTION, 0.3);
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_PARRY_STUN, 0);
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_UNBASHABLE, 0);
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_BAIR, 2, HG_PROJECTILE_IS_TRANSCENDENT, 1);

