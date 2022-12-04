function window_dock(){
	imguigml_set_next_window_pos(0,window_get_height()/4*3)
	imguigml_set_next_window_size(window_get_width()/5*4,window_get_height()/4)
	var _window = imguigml_begin("##DockTab",true,EImGui_WindowFlags.NoResize|EImGui_WindowFlags.NoScrollbar|EImGui_WindowFlags.NoCollapse|EImGui_WindowFlags.NoNav|EImGui_WindowFlags.NoTitleBar);
	if(_window[0]){
	var _tabs = ["Output", "Search Results", "Breakpoints","Errors"];

	var _tab_active = imguigml_mem("DockTab", 0);
	imguigml_begin_tab_bar("DockTab");
	var _i=0;
	repeat(array_length(_tabs)) {
		var _ret = imguigml_begin_tab_item(_tabs[_i], undefined, ( _tab_active == 0));
		if (_ret[0]) {
			imguigml_memset("DockTab", _i);
			switch(_tabs[_i]){
				case "Output":
				window_output()
				break;
			}
			imguigml_end_tab_item();
		}
		++_i;
	}
	imguigml_end_tab_bar();
	_tab_active = imguigml_mem("DockTab");
	}
}