///@desc example - create

ShowTestWindow = true;
ShowDoggoWindow = false;

Actors = 1000;
Tabs = 0;

Completion_string = "Press Tab!";
Filter_string = "'a' is filtered, all input TOLOWER";
History_string = "press up/down!";
Always_string  = "I am an always callbacked text field.";
Always_out = "";

Input_num = 5;

Cursor_visible = true;

Colour1 = make_color_rgb(96, 128, 255);
Alpha1  = 1;
TextEditor = undefined;
Surface = -1;

added_sprite = sprite_add("sprite_add_test.png", 0, 0, 0, 0, 0);

Font = imguigml_add_font_from_ttf("simhei.ttf", 14.0);	