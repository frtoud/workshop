set_attack_value(AT_DTILT, AG_SPRITE, sprite_get("dtilt"));
set_attack_value(AT_DTILT, AG_NUM_WINDOWS, 3);
set_attack_value(AT_DTILT, AG_HURTBOX_SPRITE, sprite_get("dtilt_hurt"));

set_window_value(AT_DTILT, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_DTILT, 1, AG_WINDOW_LENGTH, 4);
set_window_value(AT_DTILT, 1, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DTILT, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_DTILT, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
set_window_value(AT_DTILT, 1, AG_WINDOW_SFX_FRAME, 3);

set_window_value(AT_DTILT, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_DTILT, 2, AG_WINDOW_LENGTH, 4);
set_window_value(AT_DTILT, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_DTILT, 2, AG_WINDOW_ANIM_FRAME_START, 1);

set_window_value(AT_DTILT, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_DTILT, 3, AG_WINDOW_LENGTH, 8);
set_window_value(AT_DTILT, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_DTILT, 3, AG_WINDOW_ANIM_FRAME_START, 2);
set_window_value(AT_DTILT, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

set_num_hitboxes(AT_DTILT, 2);

set_hitbox_value(AT_DTILT, 1, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_DTILT, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_DTILT, 1, HG_WINDOW, 2);
set_hitbox_value(AT_DTILT, 1, HG_LIFETIME, 3);
set_hitbox_value(AT_DTILT, 1, HG_HITBOX_X, 16);
set_hitbox_value(AT_DTILT, 1, HG_HITBOX_Y, -10);
set_hitbox_value(AT_DTILT, 1, HG_WIDTH, 40);
set_hitbox_value(AT_DTILT, 1, HG_HEIGHT, 20);
set_hitbox_value(AT_DTILT, 1, HG_SHAPE, 0);
set_hitbox_value(AT_DTILT, 1, HG_PRIORITY, 1);
set_hitbox_value(AT_DTILT, 1, HG_DAMAGE, 5);
set_hitbox_value(AT_DTILT, 1, HG_ANGLE, 75);
set_hitbox_value(AT_DTILT, 1, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_DTILT, 1, HG_KNOCKBACK_SCALING, .1);
set_hitbox_value(AT_DTILT, 1, HG_BASE_HITPAUSE, 5);
set_hitbox_value(AT_DTILT, 1, HG_HITPAUSE_SCALING, .35);
set_hitbox_value(AT_DTILT, 1, HG_VISUAL_EFFECT_X_OFFSET, 30);
set_hitbox_value(AT_DTILT, 1, HG_VISUAL_EFFECT_Y_OFFSET, 10);
set_hitbox_value(AT_DTILT, 1, HG_HIT_SFX, asset_get("sfx_blow_weak1"));

//Lingering hitbox
set_hitbox_value(AT_DTILT, 2, HG_PARENT_HITBOX, 0);
set_hitbox_value(AT_DTILT, 2, HG_HITBOX_TYPE, 2);
set_hitbox_value(AT_DTILT, 2, HG_WINDOW, 2);
set_hitbox_value(AT_DTILT, 2, HG_WINDOW_CREATION_FRAME, 3);
set_hitbox_value(AT_DTILT, 2, HG_LIFETIME, 32);
set_hitbox_value(AT_DTILT, 2, HG_HITBOX_X, 30);
set_hitbox_value(AT_DTILT, 2, HG_HITBOX_Y, -18);
set_hitbox_value(AT_DTILT, 2, HG_WIDTH, 30);
set_hitbox_value(AT_DTILT, 2, HG_HEIGHT, 30);
set_hitbox_value(AT_DTILT, 2, HG_PRIORITY, 4);
set_hitbox_value(AT_DTILT, 2, HG_DAMAGE, 2);
set_hitbox_value(AT_DTILT, 2, HG_ANGLE, 90);
set_hitbox_value(AT_DTILT, 2, HG_BASE_KNOCKBACK, 1.3);
set_hitbox_value(AT_DTILT, 2, HG_KNOCKBACK_SCALING, 0);
set_hitbox_value(AT_DTILT, 2, HG_BASE_HITPAUSE, 2);
set_hitbox_value(AT_DTILT, 2, HG_HITPAUSE_SCALING, .1);
set_hitbox_value(AT_DTILT, 2, HG_IGNORES_PROJECTILES, 1);
set_hitbox_value(AT_DTILT, 2, HG_VISUAL_EFFECT_X_OFFSET, 0);
set_hitbox_value(AT_DTILT, 2, HG_VISUAL_EFFECT_Y_OFFSET, 0);
set_hitbox_value(AT_DTILT, 2, HG_HIT_SFX, asset_get("sfx_icehit_weak1"));
set_hitbox_value(AT_DTILT, 2, HG_VISUAL_EFFECT, 6);

set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_SPRITE, sprite_get("cloud_proj_small"));
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_ANIM_SPEED, 1.0/6);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_MASK, -1);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_HSPEED, 3);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_WALL_BEHAVIOR, 0);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_AIR_FRICTION, 3);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_GROUND_FRICTION, 0.25);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_PARRY_STUN, 1);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_UNBASHABLE, 1);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_IS_TRANSCENDENT, 1);

// [RUNE L] -- Exploding clouds
if (has_rune("L"))
{
    set_hitbox_value(AT_DTILT, 2, HG_DAMAGE, 0);
    set_hitbox_value(AT_DTILT, 2, HG_PROJECTILE_ENEMY_BEHAVIOR, 0);
    set_hitbox_value(AT_DTILT, 2, HG_HIT_SFX, asset_get("sfx_icehit_heavy1"));
    
    set_hitbox_value(AT_DTILT, 3, HG_HITBOX_TYPE, 2);
    set_hitbox_value(AT_DTILT, 3, HG_LIFETIME, 8);
    set_hitbox_value(AT_DTILT, 3, HG_WIDTH, 70);
    set_hitbox_value(AT_DTILT, 3, HG_HEIGHT, 70);
    set_hitbox_value(AT_DTILT, 3, HG_PRIORITY, 5);
    set_hitbox_value(AT_DTILT, 3, HG_DAMAGE, 10);
    set_hitbox_value(AT_DTILT, 3, HG_ANGLE, 55);
    set_hitbox_value(AT_DTILT, 3, HG_BASE_KNOCKBACK, 6);
    set_hitbox_value(AT_DTILT, 3, HG_KNOCKBACK_SCALING, 0.8);
    set_hitbox_value(AT_DTILT, 3, HG_BASE_HITPAUSE, 10);
    set_hitbox_value(AT_DTILT, 3, HG_HITPAUSE_SCALING, .5);
    set_hitbox_value(AT_DTILT, 3, HG_HIT_SFX, sound_get("sfx_noz_ice_medium"));
    set_hitbox_value(AT_DTILT, 3, HG_VISUAL_EFFECT, 1);
    
    set_hitbox_value(AT_DTILT, 3, HG_PROJECTILE_SPRITE, sprite_get("vfx_ice_big"));
    set_hitbox_value(AT_DTILT, 3, HG_PROJECTILE_ANIM_SPEED, 0.7);
    set_hitbox_value(AT_DTILT, 3, HG_PROJECTILE_MASK, -1);
    set_hitbox_value(AT_DTILT, 3, HG_PROJECTILE_WALL_BEHAVIOR, 1);
    set_hitbox_value(AT_DTILT, 3, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
    set_hitbox_value(AT_DTILT, 3, HG_PROJECTILE_PARRY_STUN, 0);
    set_hitbox_value(AT_DTILT, 3, HG_PROJECTILE_UNBASHABLE, 1);
    set_hitbox_value(AT_DTILT, 3, HG_PROJECTILE_DOES_NOT_REFLECT, 1);
    set_hitbox_value(AT_DTILT, 3, HG_PROJECTILE_IS_TRANSCENDENT, 1);
    set_hitbox_value(AT_DTILT, 3, HG_MUNO_OBJECT_LAUNCH_ANGLE, -2);
}

// [RUNE G] -- Longer clouds
// [RUNE H] -- Kicking clouds
var duration = get_hitbox_value(AT_DTILT, 2, HG_LIFETIME);
if (has_rune("G")) { duration += 80; }
if (has_rune("H")) { duration += 32; }
set_hitbox_value(AT_DTILT, 2, HG_LIFETIME, duration);