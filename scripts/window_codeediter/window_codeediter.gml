/*function window_codeediter(){
	var script_value = variable_struct_get(global.temp.Script,script_name)
	if(global.windows.CodeEditer){
		imguigml_set_next_window_size(window_get_width()/2,window_get_height()/2,EImGui_Cond.Once)
		var ret = imguigml_begin(script_name + " - CodeEditer", global.windows.CodeEditer);
		var size = imguigml_get_window_size();
		global.windows.CodeEditer = ret[1]
		if (ret[0] && ret[1]) {
			//ret = imguigml_input_text_multiline(script_name+"##CodeEditer",script_value,999999,size[0]-100,size[1]-100)
			//script_value = ret[1]
			//variable_struct_set(global.temp.Script,script_name,script_value)
			var ce = global.temp.CodeEditer
			if (ce == undefined) {
				global.temp.CodeEditer = imguigml_texteditor_create();
				imguigml_texteditor_set_readonly(ce, false);
				imguigml_texteditor_set_text(ce,script_value)
			}else{
				imguigml_texteditor_render(ce, script_name+"##CodeEditer", size[0]-100,size[1]-100);	
				script_value = imguigml_texteditor_get_text(ce)
				variable_struct_set(global.temp.Script,script_name,script_value)
			}
		}
	}
}*/
function window_codeediter(){
	var script_list = variable_struct_get_names(global.temp.Script)
	for(var i=0;i<array_length(script_list);i++){
		var script_name = script_list[i]
		var scriptcon = variable_struct_get(global.temp.Script,script_name)
		var script_value = scriptcon[0]
		var script_path = scriptcon[1]
		
		imguigml_set_next_window_size(window_get_width()/2,window_get_height()/2,EImGui_Cond.Once)
		var ret = imguigml_begin(script_name + " - CodeEditer", global.windows.CodeEditer);
		var size = imguigml_get_window_size();
		if(!ret[1]){
			file_text_write_full(script_path,script_value)
			imguigml_texteditor_delete(variable_struct_get(global.temp.CodeEditer,script_name))
			variable_struct_remove(global.temp.Script,script_name)
			variable_struct_remove(global.temp.CodeEditer,script_name)
		}
		if (ret[0] && ret[1]) {
			if(variable_struct_exists(global.temp.CodeEditer,script_name)){
				ce = variable_struct_get(global.temp.CodeEditer,script_name)
				
				imguigml_texteditor_render(ce, script_name+"##CodeEditer", size[0]-100,size[1]-100);
				
				script_value = imguigml_texteditor_get_text(ce)
				variable_struct_set(global.temp.Script,script_name,[script_value,script_path])
			}else{
				var ce = imguigml_texteditor_create()
				variable_struct_set(global.temp.CodeEditer,script_name,ce)
				imguigml_texteditor_set_readonly(ce, false);
				imguigml_texteditor_set_text(ce,script_value)
			}
		}
	}
	show_debug_message(global.temp.CodeEditer)
}