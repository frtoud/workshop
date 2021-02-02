set_attack_value(AT_FAIR, AG_CATEGORY, 1);
set_attack_value(AT_FAIR, AG_SPRITE, sprite_get("fair"));
set_attack_value(AT_FAIR, AG_NUM_WINDOWS, 4);
set_attack_value(AT_FAIR, AG_HAS_LANDING_LAG, 1);
set_attack_value(AT_FAIR, AG_LANDING_LAG, 4);
set_attack_value(AT_FAIR, AG_HURTBOX_SPRITE, sprite_get("fair_hurt"));

//Used for hovermode sprites in animation.gml
set_attack_value(AT_FAIR, 55, sprite_get("fair_hover"));

set_window_value(AT_FAIR, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_FAIR, 1, AG_WINDOW_LENGTH, 10);
set_window_value(AT_FAIR, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FAIR, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_FAIR, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
set_window_value(AT_FAIR, 1, AG_WINDOW_SFX_FRAME, 9);

set_window_value(AT_FAIR, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_FAIR, 2, AG_WINDOW_LENGTH, 6);
set_window_value(AT_FAIR, 2, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_FAIR, 2, AG_WINDOW_ANIM_FRAME_START, 2);

set_window_value(AT_FAIR, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_FAIR, 3, AG_WINDOW_LENGTH, 12);
set_window_value(AT_FAIR, 3, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_FAIR, 3, AG_WINDOW_ANIM_FRAME_START, 4);
set_window_value(AT_FAIR, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_window_value(AT_FAIR, 4, AG_WINDOW_TYPE, 1);
set_window_value(AT_FAIR, 4, AG_WINDOW_LENGTH, 15);
set_window_value(AT_FAIR, 4, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_FAIR, 4, AG_WINDOW_ANIM_FRAME_START, 7);

set_num_hitboxes(AT_FAIR, 2);

set_hitbox_value(AT_FAIR, 1, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_FAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_FAIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_FAIR, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_FAIR, 1, HG_HITBOX_X, 18);
set_hitbox_value(AT_FAIR, 1, HG_HITBOX_Y, -25);
set_hitbox_value(AT_FAIR, 1, HG_WIDTH, 40);
set_hitbox_value(AT_FAIR, 1, HG_HEIGHT, 55);
set_hitbox_value(AT_FAIR, 1, HG_PRIORITY, 2);
set_hitbox_value(AT_FAIR, 1, HG_DAMAGE, 7);
set_hitbox_value(AT_FAIR, 1, HG_ANGLE, 35);
set_hitbox_value(AT_FAIR, 1, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_FAIR, 1, HG_KNOCKBACK_SCALING, .65);
set_hitbox_value(AT_FAIR, 1, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_FAIR, 1, HG_HITPAUSE_SCALING, .25);
set_hitbox_value(AT_FAIR, 1, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_FAIR, 1, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(AT_FAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_medium1"));
set_hitbox_value(AT_FAIR, 1, HG_HIT_LOCKOUT, 12);

//Lingering hitbox
set_hitbox_value(AT_FAIR, 2, HG_PARENT_HITBOX, 0);
set_hitbox_value(AT_FAIR, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_FAIR, 2, HG_WINDOW, 2);
set_hitbox_value(AT_FAIR, 2, HG_WINDOW_CREATION_FRAME, 2);
set_hitbox_value(AT_FAIR, 2, HG_LIFETIME, 36);
set_hitbox_value(AT_FAIR, 2, HG_HITBOX_X, 35);
set_hitbox_value(AT_FAIR, 2, HG_HITBOX_Y, -15);
set_hitbox_value(AT_FAIR, 2, HG_WIDTH, 40);
set_hitbox_value(AT_FAIR, 2, HG_HEIGHT, 40);
set_hitbox_value(AT_FAIR, 2, HG_PRIORITY, 2);
set_hitbox_value(AT_FAIR, 2, HG_DAMAGE, 3);
set_hitbox_value(AT_FAIR, 2, HG_ANGLE, 90);
set_hitbox_value(AT_FAIR, 2, HG_BASE_KNOCKBACK, 1.5);
set_hitbox_value(AT_FAIR, 2, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_FAIR, 2, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_FAIR, 2, HG_HITPAUSE_SCALING, .1);
set_hitbox_value(AT_FAIR, 2, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_FAIR, 2, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_FAIR, 2, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(AT_FAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
set_hitbox_value(AT_FAIR, 2, HG_VISUAL_EFFECT, 6);

set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_SPRITE, sprite_get("cloud_proj_big"));
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ANIM_SPEED, (8.0 / get_hitbox_value(AT_FAIR, 2, HG_LIFETIME)));
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_HSPEED, 1.5);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_AIR_FRICTION, 0.3);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_GROUND_FRICTION, 0.3);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_PARRY_STUN, 0);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_UNBASHABLE, 0);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_IS_TRANSCENDENT, 1);

// Exploding clouds
if (noz_rune_flags.cloud_explode)
{
    set_hitbox_value(AT_FAIR, 2, HG_DAMAGE, 0);
    set_hitbox_value(AT_FAIR, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
    set_hitbox_value(AT_FAIR, 2, HG_HIT_SFX, asset_get("sfx_icehit_heavy1"));
    
    set_hitbox_value(AT_FAIR, 3, HG_HITBOX_TYPE, 2);
    set_hitbox_value(AT_FAIR, 3, HG_LIFETIME, 8);
    set_hitbox_value(AT_FAIR, 3, HG_WIDTH, 90);
    set_hitbox_value(AT_FAIR, 3, HG_HEIGHT, 90);
    set_hitbox_value(AT_FAIR, 3, HG_PRIORITY, 5);
    set_hitbox_value(AT_FAIR, 3, HG_DAMAGE, 12);
    set_hitbox_value(AT_FAIR, 3, HG_ANGLE, 55);
    set_hitbox_value(AT_FAIR, 3, HG_BASE_KNOCKBACK, 8);
    set_hitbox_value(AT_FAIR, 3, HG_KNOCKBACK_SCALING, 1);
    set_hitbox_value(AT_FAIR, 3, HG_BASE_HITPAUSE, 10);
    set_hitbox_value(AT_FAIR, 3, HG_HITPAUSE_SCALING, .5);
    set_hitbox_value(AT_FAIR, 3, HG_HIT_SFX, sound_get("sfx_noz_ice_medium"));
    set_hitbox_value(AT_FAIR, 3, HG_VISUAL_EFFECT, 1);
    
    set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_SPRITE, sprite_get("vfx_shine"));
    set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_ANIM_SPEED, 0.5);
    set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_MASK, -1);
    set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_WALL_BEHAVIOR, 1);
    set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
    set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_PARRY_STUN, 0);
    set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_UNBASHABLE, 1);
    set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
    set_hitbox_value(AT_FAIR, 3, HG_PROJECTILE_IS_TRANSCENDENT, 1);
    set_hitbox_value(AT_FAIR, 3, HG_MUNO_OBJECT_LAUNCH_ANGLE, -2);
}

// Cloud extensions
var duration = get_hitbox_value(AT_FAIR, 2, HG_LIFETIME);
if (noz_rune_flags.cloud_longer) { duration += noz_long_cloud_big; }
if (noz_rune_flags.cloud_kick) { duration += noz_long_cloud_big_kick; }
set_hitbox_value(AT_FAIR, 2, HG_LIFETIME, duration);