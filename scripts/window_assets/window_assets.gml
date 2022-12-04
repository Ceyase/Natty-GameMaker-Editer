function window_assets(){
	if(global.windows.Assets){
		imguigml_set_next_window_pos(window_get_width()/5*4,23)
		imguigml_set_next_window_size(window_get_width()/5, window_get_height()-23);
		//var ret = imguigml_begin("Assets", global.windows.Assets,EImGui_WindowFlags.NoResize|EImGui_WindowFlags.NoScrollbar|EImGui_WindowFlags.NoCollapse);
		var ret = imguigml_begin("Assets", global.windows.Assets,EImGui_WindowFlags.NoResize|EImGui_WindowFlags.NoScrollbar|EImGui_WindowFlags.NoCollapse|EImGui_WindowFlags.NoNav|EImGui_WindowFlags.NoTitleBar);
		//global.windows.Assets = ret[1]
		if (ret[0] && ret[1]) {
			imguigml_text("Asset Browser")
			imguigml_text("Search:")
			imguigml_same_line()
			ret = imguigml_input_text("##SearchAsset",global.Search.Assets,999)
			global.Search.Assets = ret[1]
			imguigml_begin_child("Asset"){
				 
				function PushTheHeader(names,rootdir,time,dir){
					
					if(array_length(names) = 0){
						return;
					}
					
					for(var i=0;i<array_length(names);i++){
						var tempdir = variable_struct_get(rootdir,names[i])
						if(names[i] = "_file"){
							var text = ""
							repeat(time){
								text += "  "
							}
							for(var m=0;m<array_length(rootdir._file);m++){
								if(dir == "" or variable_struct_get(global.filediropenmap,dir)){
									var filename = rootdir._file[m]
									imguigml_text(text+"--")
									imguigml_same_line()
									if(imguigml_button(filename+"##asset")){
										gm_assets_load(filename)
									}
								}
							}
						}
						else{
							var floderid = dir+"|"+names[i]
							if(dir = ""){
								if(variable_struct_names_count(tempdir) == 0){
									var ret = imguigml_collapsing_header(names[i]+"##"+floderid,undefined,EImGui_TreeNodeFlags.Bullet)
									variable_struct_set(global.filediropenmap,floderid,ret[0])
								}else{
									var ret = imguigml_collapsing_header(names[i]+"##"+floderid)
									variable_struct_set(global.filediropenmap,floderid,ret[0])
								}
								
							}
							else if(variable_struct_exists(global.filediropenmap,dir)){
								if(variable_struct_get(global.filediropenmap,dir)){
									var text = ""
									repeat(time){
										text += "  "	
									}
									imguigml_text(text+"--")
									imguigml_same_line()
									var ret = imguigml_collapsing_header(names[i]+"##"+floderid)
									variable_struct_set(global.filediropenmap,floderid,ret[0])
								}else{
									variable_struct_set(global.filediropenmap,floderid,false)
								}
							}
							var name = variable_struct_get_names(tempdir)
							PushTheHeader(name,tempdir,time+1,floderid)
						}
					}
				}
				
				var name = variable_struct_get_names(global.projectdir)
				PushTheHeader(name,global.projectdir,0,"")
			}
			imguigml_end_child()
		}
		imguigml_end();
	}
}