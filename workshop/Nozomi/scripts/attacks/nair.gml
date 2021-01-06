set_attack_value(AT_NAIR, AG_CATEGORY, 1);
set_attack_value(AT_NAIR, AG_SPRITE, sprite_get("nair"));
set_attack_value(AT_NAIR, AG_NUM_WINDOWS, 4);
set_attack_value(AT_NAIR, AG_HURTBOX_SPRITE, sprite_get("nair_hurt"));

//Used for hovermode sprites in animation.gml
set_attack_value(AT_NAIR, 55, sprite_get("nair_hover"));

set_window_value(AT_NAIR, 1, AG_WINDOW_TYPE, 0);
set_window_value(AT_NAIR, 1, AG_WINDOW_LENGTH, 6);
set_window_value(AT_NAIR, 1, AG_WINDOW_ANIM_FRAMES, 2);
set_window_value(AT_NAIR, 1, AG_WINDOW_SFX_FRAME, 2);

set_window_value(AT_NAIR, 2, AG_WINDOW_TYPE, 0);
set_window_value(AT_NAIR, 2, AG_WINDOW_LENGTH, 12);
set_window_value(AT_NAIR, 2, AG_WINDOW_ANIM_FRAMES, 6);
set_window_value(AT_NAIR, 2, AG_WINDOW_HAS_SFX, 1);
set_window_value(AT_NAIR, 2, AG_WINDOW_VSPEED, -1);
set_window_value(AT_NAIR, 2, AG_WINDOW_SFX, asset_get("sfx_spin"));
set_window_value(AT_NAIR, 2, AG_WINDOW_ANIM_FRAME_START, 2);

set_window_value(AT_NAIR, 3, AG_WINDOW_TYPE, 0);
set_window_value(AT_NAIR, 3, AG_WINDOW_LENGTH, 10);
set_window_value(AT_NAIR, 3, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_NAIR, 3, AG_WINDOW_ANIM_FRAME_START, 8);

set_window_value(AT_NAIR, 4, AG_WINDOW_TYPE, 0);
set_window_value(AT_NAIR, 4, AG_WINDOW_LENGTH, 15);
set_window_value(AT_NAIR, 4, AG_WINDOW_ANIM_FRAMES, 5);
set_window_value(AT_NAIR, 4, AG_WINDOW_ANIM_FRAME_START, 13);

set_num_hitboxes(AT_NAIR, 7);

set_hitbox_value(AT_NAIR, 1, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_NAIR, 1, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 1, HG_WINDOW, 2);
set_hitbox_value(AT_NAIR, 1, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_NAIR, 1, HG_LIFETIME, 2);
set_hitbox_value(AT_NAIR, 1, HG_HITBOX_Y, -28);
set_hitbox_value(AT_NAIR, 1, HG_WIDTH, 90);
set_hitbox_value(AT_NAIR, 1, HG_HEIGHT, 30);
set_hitbox_value(AT_NAIR, 1, HG_PRIORITY, 3);
set_hitbox_value(AT_NAIR, 1, HG_DAMAGE, 1);
set_hitbox_value(AT_NAIR, 1, HG_ANGLE, 25);
set_hitbox_value(AT_NAIR, 1, HG_ANGLE_FLIPPER, 9);
set_hitbox_value(AT_NAIR, 1, HG_TECHABLE, 3);
set_hitbox_value(AT_NAIR, 1, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_NAIR, 1, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_NAIR, 1, HG_VISUAL_EFFECT, 302);
set_hitbox_value(AT_NAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
set_hitbox_value(AT_NAIR, 1, HG_HITBOX_GROUP, 1);
set_hitbox_value(AT_NAIR, 1, HG_MUNO_OBJECT_LAUNCH_ANGLE, -1);

set_hitbox_value(AT_NAIR, 2, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_NAIR, 2, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 2, HG_WINDOW, 2);
set_hitbox_value(AT_NAIR, 2, HG_WINDOW_CREATION_FRAME, 5);
set_hitbox_value(AT_NAIR, 2, HG_LIFETIME, 2);
set_hitbox_value(AT_NAIR, 2, HG_HITBOX_Y, -28);
set_hitbox_value(AT_NAIR, 2, HG_HITBOX_GROUP, 2);
set_hitbox_value(AT_NAIR, 2, HG_MUNO_OBJECT_LAUNCH_ANGLE, -1);

set_hitbox_value(AT_NAIR, 3, HG_PARENT_HITBOX, 1);
set_hitbox_value(AT_NAIR, 3, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 3, HG_WINDOW, 2);
set_hitbox_value(AT_NAIR, 3, HG_WINDOW_CREATION_FRAME, 10);
set_hitbox_value(AT_NAIR, 3, HG_LIFETIME, 2);
set_hitbox_value(AT_NAIR, 3, HG_HITBOX_Y, -28);
set_hitbox_value(AT_NAIR, 3, HG_HITBOX_GROUP, 3);
set_hitbox_value(AT_NAIR, 3, HG_MUNO_OBJECT_LAUNCH_ANGLE, -1);

//Launcher hit
set_hitbox_value(AT_NAIR, 4, HG_PARENT_HITBOX, 0);
set_hitbox_value(AT_NAIR, 4, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 4, HG_WINDOW, 3);
set_hitbox_value(AT_NAIR, 4, HG_WINDOW_CREATION_FRAME, 4);
set_hitbox_value(AT_NAIR, 4, HG_LIFETIME, 3);
set_hitbox_value(AT_NAIR, 4, HG_HITBOX_Y, -28);
set_hitbox_value(AT_NAIR, 4, HG_WIDTH, 60);
set_hitbox_value(AT_NAIR, 4, HG_HEIGHT, 30);
set_hitbox_value(AT_NAIR, 4, HG_PRIORITY, 1);
set_hitbox_value(AT_NAIR, 4, HG_DAMAGE, 3);
set_hitbox_value(AT_NAIR, 4, HG_ANGLE, 70);
set_hitbox_value(AT_NAIR, 4, HG_BASE_KNOCKBACK, 7);
set_hitbox_value(AT_NAIR, 4, HG_KNOCKBACK_SCALING, .2);
set_hitbox_value(AT_NAIR, 4, HG_BASE_HITPAUSE, 6);
set_hitbox_value(AT_NAIR, 4, HG_HITPAUSE_SCALING, .2);
set_hitbox_value(AT_NAIR, 4, HG_HIT_SFX, asset_get("sfx_blow_medium2"));
set_hitbox_value(AT_NAIR, 4, HG_HITBOX_GROUP, -1);

//Feet hitboxes
//Should mirror hitboxes 1 through 3; with a higher angle
set_hitbox_value(AT_NAIR, 5, HG_PARENT_HITBOX, 0);
set_hitbox_value(AT_NAIR, 5, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 5, HG_WINDOW, 2);
set_hitbox_value(AT_NAIR, 5, HG_WINDOW_CREATION_FRAME, 0);
set_hitbox_value(AT_NAIR, 5, HG_LIFETIME, 2);
set_hitbox_value(AT_NAIR, 5, HG_HITBOX_Y, -18);
set_hitbox_value(AT_NAIR, 5, HG_WIDTH, 24);
set_hitbox_value(AT_NAIR, 5, HG_HEIGHT, 30);
set_hitbox_value(AT_NAIR, 5, HG_BASE_KNOCKBACK, 5);
set_hitbox_value(AT_NAIR, 5, HG_HITBOX_GROUP, 1);
set_hitbox_value(AT_NAIR, 5, HG_PRIORITY, 1);
set_hitbox_value(AT_NAIR, 5, HG_DAMAGE, 1);
set_hitbox_value(AT_NAIR, 5, HG_ANGLE, 42);
set_hitbox_value(AT_NAIR, 5, HG_ANGLE_FLIPPER, 4);
set_hitbox_value(AT_NAIR, 5, HG_TECHABLE, 3);
set_hitbox_value(AT_NAIR, 5, HG_BASE_HITPAUSE, 3);
set_hitbox_value(AT_NAIR, 5, HG_VISUAL_EFFECT, 302);
set_hitbox_value(AT_NAIR, 5, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
set_hitbox_value(AT_NAIR, 5, HG_HITBOX_GROUP, 1);
set_hitbox_value(AT_NAIR, 5, HG_MUNO_OBJECT_LAUNCH_ANGLE, -1);

set_hitbox_value(AT_NAIR, 6, HG_PARENT_HITBOX, 5);
set_hitbox_value(AT_NAIR, 6, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 6, HG_WINDOW, 2);
set_hitbox_value(AT_NAIR, 6, HG_WINDOW_CREATION_FRAME, 5);
set_hitbox_value(AT_NAIR, 6, HG_LIFETIME, 2);
set_hitbox_value(AT_NAIR, 6, HG_HITBOX_Y, -18);
set_hitbox_value(AT_NAIR, 6, HG_HITBOX_GROUP, 2);
set_hitbox_value(AT_NAIR, 6, HG_MUNO_OBJECT_LAUNCH_ANGLE, -1);

set_hitbox_value(AT_NAIR, 7, HG_PARENT_HITBOX, 5);
set_hitbox_value(AT_NAIR, 7, HG_HITBOX_TYPE, 1);
set_hitbox_value(AT_NAIR, 7, HG_WINDOW, 2);
set_hitbox_value(AT_NAIR, 7, HG_WINDOW_CREATION_FRAME, 10);
set_hitbox_value(AT_NAIR, 7, HG_LIFETIME, 2);
set_hitbox_value(AT_NAIR, 7, HG_HITBOX_Y, -18);
set_hitbox_value(AT_NAIR, 7, HG_HITBOX_GROUP, 3);
set_hitbox_value(AT_NAIR, 7, HG_MUNO_OBJECT_LAUNCH_ANGLE, -1);
