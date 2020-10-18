//set_attack.gml
switch (attack)
{
    case AT_JAB:
    {
        //prevents you from using the move...?
        //is this intended?
        //move_cooldown[AT_JAB] = 40;
    } break;
    case AT_FSPECIAL:
    {
        //at_fspecial_cooldown_override = true;
        //move_cooldown[AT_FSPECIAL] = noz_fspecial_cooldown;
    } break;
    default:
    break;
}