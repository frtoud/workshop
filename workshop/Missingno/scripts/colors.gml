
//(R,G,B) - (H,S,V)
//NB. needs to overlap slightly so ordering is important

// 30: 30: 30 -   0:  0: 11
set_color_profile_slot(0, 0,  30,  30, 30); // Black
set_color_profile_slot_range(0, 180, 100, 15);

//122:122:153 - 240: 20: 60
set_color_profile_slot(0, 1, 122, 122, 153); // Lavender
set_color_profile_slot_range(1, 180, 100, 35);

//229:174:135 -  24: 41: 89
set_color_profile_slot(0, 2, 229, 174, 135); // Peach
set_color_profile_slot_range(2, 180, 100, 20);

//255:255:230 -  60:  9:100
set_color_profile_slot(0, 3, 255, 255, 230); // White
set_color_profile_slot_range(3, 180, 30, 10);

//Technical
//  0:255:  0 -  120:100:100
set_color_profile_slot(0, 7,  0,  255,  0); // Patterned
set_color_profile_slot_range(7, 180, 70, 10);

set_num_palettes(6);

//Blue Color
set_color_profile_slot(1, 0,  30,  30,  30);
set_color_profile_slot(1, 1, 111, 151, 199);
set_color_profile_slot(1, 2, 167, 199, 231);
set_color_profile_slot(1, 3, 255, 255, 230);

//Red Color
set_color_profile_slot(2, 0,  30,  30,  30);
set_color_profile_slot(2, 1, 207,  79,  47);
set_color_profile_slot(2, 2, 247, 159,  79);
set_color_profile_slot(2, 3, 255, 255, 230);

//Green Color
set_color_profile_slot(3, 0,  30,  30,  30);
set_color_profile_slot(3, 1,  71, 159,  87);
set_color_profile_slot(3, 2, 159, 207, 127);
set_color_profile_slot(3, 3, 255, 255, 230);

//Black Color
set_color_profile_slot(4, 7, 180, 180, 180);

//Yellow Color
set_color_profile_slot(5, 7, 235, 248, 69);
/**/