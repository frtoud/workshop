//ai_update.gml
if (get_training_cpu_action() == CPU_ROLL)
{
    //Reflector debug mode
    if (state == PS_IDLE || state == PS_PARRY_START)
    { 
        set_attack(AT_DSPECIAL); 
    }
    else
    {
        special_down = true;
    }
}

if (at_uspecial_hovering)
{
    joy_pad_idle = false;
    if (ai_recovering)
    {
        var stage_height = get_stage_data(SD_Y_POS);
        var stage_center = room_width / 2;
        if ( y > stage_height)
        {
            joy_dir = 90;
        }
        else if (y > stage_height - 30)
        {
            joy_dir = (x < stage_center) ? 45 : 135;
        }
        else
        {
            joy_dir = (x < stage_center) ? 0 : 180;
        }
    }
    else
    {
        joy_dir = (x < stage_center) ? 315 : 225;
    }
    
}