set_attack_value(AT_NTHROW, AG_CATEGORY, 2);
set_attack_value(AT_NTHROW, AG_SPRITE, sprite_get("nspecial"));
set_attack_value(AT_NTHROW, AG_NUM_WINDOWS, 5);
set_attack_value(AT_NTHROW, AG_HAS_LANDING_LAG, 4);
set_attack_value(AT_NTHROW, AG_OFF_LEDGE, 1);
set_attack_value(AT_NTHROW, AG_AIR_SPRITE, sprite_get("nspecial"));
set_attack_value(AT_NTHROW, AG_HURTBOX_SPRITE, sprite_get("nspecial_hurt"));

set_window_value(AT_NTHROW, 1, AG_WINDOW_TYPE, 1);
set_window_value(AT_NTHROW, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_NTHROW, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_NTHROW, 1, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_NTHROW, 1, AG_WINDOW_SFX, asset_get("sfx_bubblepop"));
set_window_value(AT_NTHROW, 1, AG_WINDOW_SFX_FRAME, 4);

set_window_value(AT_NTHROW, 2, AG_WINDOW_TYPE, 1);
set_window_value(AT_NTHROW, 2, AG_WINDOW_LENGTH, 3);
set_window_value(AT_NTHROW, 2, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_NTHROW, 2, AG_WINDOW_ANIM_FRAME_START, 2);

set_window_value(AT_NTHROW, 3, AG_WINDOW_TYPE, 1);
set_window_value(AT_NTHROW, 3, AG_WINDOW_LENGTH, 16);
set_window_value(AT_NTHROW, 3, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_NTHROW, 3, AG_WINDOW_ANIM_FRAME_START, 3);

set_num_hitboxes(AT_NTHROW, 1);

set_hitbox_value(AT_NTHROW, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NTHROW, 1, HG_WINDOW, 2);
set_hitbox_value(AT_NTHROW, 1, HG_LIFETIME, 10);
set_hitbox_value(AT_NTHROW, 1, HG_HITBOX_X, 25);
set_hitbox_value(AT_NTHROW, 1, HG_HITBOX_Y, -25);
set_hitbox_value(AT_NTHROW, 1, HG_WIDTH, 60);
set_hitbox_value(AT_NTHROW, 1, HG_HEIGHT, 60);
set_hitbox_value(AT_NTHROW, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_NTHROW, 1, HG_DAMAGE, 3);
set_hitbox_value(AT_NTHROW, 1, HG_ANGLE, 90);
set_hitbox_value(AT_NTHROW, 1, HG_BASE_KNOCKBACK, 5);