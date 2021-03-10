//post_draw.gml

//Restore drawing parameters
copy_params(msg_anim_backup, self, msg_anim_backup);

//=========================================================
#define copy_params(source, target, limiter)
//Usage: for all variables in LIMITER: copy value from SOURCE to TARGET
{
    var keys = variable_instance_get_names(limiter)
    for (var k = 0; k < array_length(keys); k++)
    {
        variable_instance_set(target, keys[k], 
                              variable_instance_get(source, keys[k]));
    }
}