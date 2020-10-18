set_attack_value(AT_TAUNT, AG_SPRITE, sprite_get("taunt"));
set_attack_value(AT_TAUNT, AG_NUM_WINDOWS, 5);
set_attack_value(AT_TAUNT, AG_CATEGORY, 2);
set_attack_value(AT_TAUNT, AG_USES_CUSTOM_GRAVITY, 1);
set_attack_value(AT_TAUNT, AG_OFF_LEDGE, 1);
set_attack_value(AT_TAUNT, AG_HURTBOX_SPRITE, sprite_get("idle_hurt"));

set_window_value(AT_TAUNT, 1, AG_WINDOW_TYPE, 0);
set_window_value(AT_TAUNT, 1, AG_WINDOW_LENGTH, 3);
set_window_value(AT_TAUNT, 1, AG_WINDOW_CUSTOM_GRAVITY, gravity_speed);
set_window_value(AT_TAUNT, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
set_window_value(AT_TAUNT, 1, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0);
set_window_value(AT_TAUNT, 1, AG_WINDOW_CUSTOM_AIR_FRICTION, 0);
set_window_value(AT_TAUNT, 1, AG_WINDOW_ANIM_FRAMES, 1);
set_window_value(AT_TAUNT, 1, AG_WINDOW_ANIM_FRAME_START, 0);

set_window_value(AT_TAUNT, 2, AG_WINDOW_TYPE, 0);
set_window_value(AT_TAUNT, 2, AG_WINDOW_LENGTH, 15);
set_window_value(AT_TAUNT, 2, AG_WINDOW_VSPEED, -3.5);
set_window_value(AT_TAUNT, 2, AG_WINDOW_VSPEED_TYPE, 2);
set_window_value(AT_TAUNT, 2, AG_WINDOW_CUSTOM_GRAVITY, gravity_speed);
set_window_value(AT_TAUNT, 2, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_TAUNT, 2, AG_WINDOW_ANIM_FRAME_START, 1);
set_window_value(AT_TAUNT, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_TAUNT, 2, AG_WINDOW_SFX, asset_get("sfx_spin"));
set_window_value(AT_TAUNT, 2, AG_WINDOW_SFX_FRAME, 1);

set_window_value(AT_TAUNT, 3, AG_WINDOW_TYPE, 0);
set_window_value(AT_TAUNT, 3, AG_WINDOW_LENGTH, 36);
set_window_value(AT_TAUNT, 3, AG_WINDOW_CUSTOM_GRAVITY, 0.03);
set_window_value(AT_TAUNT, 3, AG_WINDOW_ANIM_FRAMES, 12);
set_window_value(AT_TAUNT, 3, AG_WINDOW_ANIM_FRAME_START, 6);

set_window_value(AT_TAUNT, 4, AG_WINDOW_TYPE, 10);
set_window_value(AT_TAUNT, 4, AG_WINDOW_LENGTH, 16);
set_window_value(AT_TAUNT, 4, AG_WINDOW_CUSTOM_GRAVITY, gravity_speed);
set_window_value(AT_TAUNT, 4, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_TAUNT, 4, AG_WINDOW_ANIM_FRAME_START, 18);

set_window_value(AT_TAUNT, 5, AG_WINDOW_TYPE, 0);
set_window_value(AT_TAUNT, 5, AG_WINDOW_LENGTH, 18);
set_window_value(AT_TAUNT, 5, AG_WINDOW_CUSTOM_GRAVITY, gravity_speed);
set_window_value(AT_TAUNT, 5, AG_WINDOW_ANIM_FRAMES, 3);
set_window_value(AT_TAUNT, 5, AG_WINDOW_ANIM_FRAME_START, 21);
set_window_value(AT_TAUNT, 5, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_TAUNT, 5, AG_WINDOW_SFX, asset_get("sfx_land_light"));
set_window_value(AT_TAUNT, 5, AG_WINDOW_SFX_FRAME, 1);
