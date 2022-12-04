///@desc example - Step
if (surface_exists(application_surface)){
	surface_resize(application_surface,window_get_width(),window_get_height())
}
if (keyboard_check_pressed(vk_f1))
	game_restart();	

if (keyboard_check_pressed(vk_f2))
  imguigml_deactivate();

if (keyboard_check_pressed(vk_f3))
  imguigml_activate();
  
if (keyboard_check_pressed(vk_f4))
  room_goto(rm_test_persistance);
  
if (keyboard_check_pressed(vk_f5)) {
  imguigml_toggle_cursor();
  Cursor_visible = !Cursor_visible;
  window_set_cursor(Cursor_visible ? cr_arrow : cr_none);
}

if (keyboard_check_pressed(vk_f6)) {
	if (surface_exists(Surface)) 
		surface_free(Surface);
}

if (imguigml_ready()) {
	if(imguigml_begin_main_menu_bar()){
				imguigml_menu_item("File")
				imguigml_menu_item("Edit")
				imguigml_menu_item("Build")
				imguigml_menu_item("Windows")
				imguigml_menu_item("Tools")
				imguigml_menu_item("Marketplace")
				imguigml_menu_item("Layouts")
				imguigml_menu_item("Help")
				imguigml_end_main_menu_bar()
	}
	var size = [ 0, 0 ];
	var pos = [ 0, 0 ];
  if (ShowTestWindow) {
		imguigml_push_font(Font)
		imguigml_set_next_window_size(650, 350, EImGui_Cond.Once);
		
		imguigml_set_next_window_pos(0,20)
		var ret = imguigml_begin("主窗口", ShowTestWindow);
		
    ShowTestWindow = ret[1];
    if (ret[0] && ret[1]) {
			var doggo_button = imguigml_sprite_button(doggo, 0, sprite_get_width(doggo), sprite_get_height(doggo));
			if (doggo_button) ShowDoggoWindow = !ShowDoggoWindow;
			imguigml_same_line();
		  imguigml_begin_child("测试", 0, 170, true); 
			{
				if (imguigml_button("按压测试") && !instance_exists(test_collapsing_header)) {
					instance_create_depth(0,0,0,test_collapsing_header);
				}
			  
				imguigml_same_line();
				if (imguigml_button("绘制列表") && !instance_exists(test_drawlist)) {
					instance_create_depth(0,0,0, test_drawlist);
				}
			
				imguigml_same_line();
				if (imguigml_button("Z Buffer 测试") && !instance_exists(test_depth)) {
					instance_create_depth(0,0,0, test_depth);
				}
			
				imguigml_same_line();
				if (imguigml_button("颜色测试") && !instance_exists(test_color_inputs)) {
					instance_create_depth(0,0,0, test_color_inputs);
				}
			
				imguigml_same_line();
				if (imguigml_button("显示文本") && !instance_exists(test_display)) {
					instance_create_depth(0,0,0, test_display);
				}
			
				imguigml_same_line();
			
				if(imguigml_button("精灵测试")){
					instance_create_depth(0, 0, 0, test_sprite);	
				}
				
				imguigml_same_line();
			  if (imguigml_button("Text Editor")) {
			    if (TextEditor == undefined) {
			      TextEditor = imguigml_texteditor_create();
			      imguigml_texteditor_set_readonly(TextEditor, false);
			    } else
			      TextEditor = imguigml_texteditor_destroy(TextEditor);
			  }
				
				imguigml_same_line()
				if (imguigml_button("ImGui Demo") || imguigml_mem("ImguiDemo", false)) {
					ret = imguigml_show_demo_window(true);
					imguigml_memset("ImguiDemo", ret[1]);
				}
				
				imguigml_same_line();
				
				if (imguigml_button("ComboBox") && !instance_exists(test_combo)) {
					instance_create_depth(0, 0, 0, test_combo);
				}
				      
				imguigml_push_item_width(32);
			  imguigml_text("Max Actors: "); 
			  imguigml_pop_item_width();
			  imguigml_same_line();
			  ret = imguigml_slider_int("##hidelabel",Actors,0,2000);
			  if (ret[0]) Actors = ret[1];

			  imguigml_push_item_width(32);
			  imguigml_text("Completion: ");
			  imguigml_pop_item_width();  
			  imguigml_same_line(); 
			  ret = imguigml_input_text("##hidelabel2", Completion_string, 64, EImGui_InputTextFlags.CallbackCompletion|EImGui_InputTextFlags.EnterReturnsTrue, example_input_completion_callback);
			  Completion_string = ret[1];

			  imguigml_push_item_width(32);
			  imguigml_text("Filter: ");
			  imguigml_pop_item_width();  
			  imguigml_same_line(); 
			  ret = imguigml_input_text("##hidelabel3", Filter_string, 64, EImGui_InputTextFlags.CallbackCharFilter, example_input_char_filter_callback);
			  if (ret[0]) Filter_string = ret[1];

			  imguigml_push_item_width(32);
			  imguigml_text("History: ");
			  imguigml_pop_item_width();  
			  imguigml_same_line(); 
			  ret = imguigml_input_text("##hidelabel4", History_string, 64, EImGui_InputTextFlags.CallbackHistory, example_input_history_callback);
			  if (ret[0]) History_string = ret[1];

			  imguigml_push_item_width(32);
			  imguigml_text("Always: ");
			  imguigml_pop_item_width();  
			  imguigml_same_line(); 
			  ret = imguigml_input_text("##hidelabel5", Always_string, 64, EImGui_InputTextFlags.CallbackAlways, example_input_always_callback);
			  if (ret[0]) Always_string = ret[1];
			  imguigml_same_line(); 
			  imguigml_text(Always_out);
           
			  imguigml_push_item_width(32);
			  imguigml_text("Integer: ");
			  imguigml_pop_item_width();  
			  imguigml_same_line(); 
			  ret = imguigml_input_int("##hidelabel6", Input_num, 1, 10);
			  if (ret[0]) Input_num = ret[1];
		    
      
			} imguigml_end_child(); 

			imguigml_separator();
      imguigml_slider_float3("Some floats!", 0.2, 0.4, 0.6, 0.0, 1.0);
      imguigml_plot_histogram("Histogram", [ 0.1, 2.0, 4.5, 2.5, 1.0, 2.0 ]);    
		} 
		
		size = imguigml_get_window_size();
		pos  = imguigml_get_window_pos();
	  imguigml_end();
	} 

  if (ShowDoggoWindow) {
    imguigml_set_next_window_pos(pos[0] + size[0] + 5, pos[1], EImGui_Cond.Once);
    var ret = imguigml_begin("DOGGO DOGGO DOGGO", ShowDoggoWindow);
    ShowDoggoWindow = ret[1];
		
		//imguigml_image(surface_get_texture(Surface), surface_get_width(Surface), surface_get_height(Surface));
		imguigml_text("Surface");
		imguigml_surface(Surface);
		imguigml_text("Surface Button");
		if(imguigml_surface_button(Surface)){
			show_message("Clickish");	
		}
		imguigml_text("sprite_add button");
		if(imguigml_sprite_button(added_sprite, 0)){
			show_message("Clickish");	
		}
		imguigml_text("sprite button");
		if(imguigml_sprite_button(doggo, 0)){
			show_message("Clickish");	
		}
		
		imguigml_text("sprite / add_sprite");

		for (var i = 0;i < 4; ++i ) {
			imguigml_sprite(added_sprite, 0);
			imguigml_same_line();
			imguigml_sprite(doggo, 0);
			imguigml_same_line();
			imguigml_sprite(doggo, 0);
			imguigml_same_line();
			imguigml_sprite(doggo, 0);    
    }
    var doggo_size = imguigml_get_window_size();
    imguigml_end();
    pos[1] += doggo_size[1] + 5;
  }
  
  if (TextEditor != undefined) {	
    imguigml_set_next_window_pos(pos[0] + size[0] + 5, pos[1], EImGui_Cond.Once);
    var ret = imguigml_begin("Text Editor", true);
    if (ret[0] && ret[1])
      imguigml_texteditor_render(TextEditor, "Edit some text!", 500, 300);
    else if (!ret[1])
      TextEditor = imguigml_texteditor_destroy(TextEditor);
    imguigml_end();
  }
}