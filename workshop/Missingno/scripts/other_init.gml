//other_init.gml


//keep in sync with other_init, I need this block on everyone *including* myself!
msg_unsafe_paused_timer = 0;
//random value calculated by handler missingno.
msg_unsafe_random = current_time;
msg_unsafe_handler_id = noone;

//missingno's Random is constant & dependent on individual frequency
//case 1: Missingno being unstable at higher damage
// - floor frequency/intensity of certain effects raised
//case 2: Missingno shaketrail while walking
// - specific state that induces frequency of an effect
//enemy randoms are temporary & decided by move interactions
//case 1:postgrab debuff
// - missingno starts effect timer & increases frequency of effect

//holds the various effects to handle
msg_unsafe_effects = 
{
    master_effect_timer: 0, //resets all frequencies to zero

//===========================================================
    shudder:         //type: PARAMETER
    {
        freq:0,      //chance per frame of activating, from 0 to 16
        
        horz_max:8,  //strengths of effect
        vert_max:8,
        horz:0,
        vert:0
    },

//===========================================================
    bad_vsync:       //type: REDRAW
    {
        freq:0,      //chance per frame of activating, from 0 to 16
        timer:0,     //time of effect duration
        
        cliptop:0, 
        clipbot:0, 
        horz_max:8,  //strength of middle segment's displacement
        horz:0
    },
//===========================================================
    bad_axis:        //type: REDRAW
    {
        freq:0,      //chance per frame of activating, from 0 to 16
        timer:0      //time of effect duration
    },
//===========================================================
    bad_crop:        //type: REDRAW
    {
        freq:0,      //chance per frame of activating, from 0 to 16
        timer:0      //time of effect duration
    }
//===========================================================
}

//ability to restore draw parameters
msg_anim_backup = 
{
    small_sprites:0,
    sprite_index:0, image_index:0,
    spr_angle:0, draw_x:0, draw_y:0
}
//=========================================================