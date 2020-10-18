//ai_update.gml
if (get_training_cpu_action() == CPU_ROLL)
{
    if (state == PS_IDLE || state == PS_PARRY_START)
    { 
        set_attack(AT_DSPECIAL); 
    }
    else
    {
        special_down = true;
    }
}

if (ai_recovering)
{
    //TODO: actually make less stupid AI hover recovery
    
    joy_pad_idle = false;
    joy_dir = 90;
}