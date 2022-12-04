function window_mainbar(){
	if(imguigml_begin_main_menu_bar()){
		if(imguigml_begin_menu("File")){
			if(imguigml_menu_item("New Project","CTRL+N")){}
			if(imguigml_menu_item("Open Project","CTRL+O")){
				var FilePath = get_open_filename_ext("GameMaker Project File|*.yyp","",working_directory,"Choose the GameMaker Project")
				if (FilePath != ""){
					var FileJson = file_text_read_json(FilePath)
					var Filepath = SplitPath(FilePath)
					gm_project_load(FileJson,Filepath[0])
				}
			}
			if(imguigml_menu_item("Import Project")){}
			// if(imguigml_menu_item("Recent Projects")){}
			imguigml_separator()
			
			if(imguigml_menu_item("Save Project","CTRL+S")){}
			if(imguigml_menu_item("Save Project As","CTRL+SHIFT+S")){}
			if(imguigml_begin_menu("Export Project")){
				if(imguigml_menu_item("YYZ")){}
				if(imguigml_menu_item("As Template")){}
				imguigml_end_menu()
			}
			imguigml_separator()
			
			if(imguigml_menu_item("New IDE")){}
			imguigml_separator()
			
			if(imguigml_menu_item("Preferences","CTRL+SHIFT+P")){}
			imguigml_separator()
			
			if(imguigml_menu_item("My Account")){}
			if(imguigml_menu_item("Logout")){}
			imguigml_separator()
			
			if(imguigml_menu_item("Exit","ALT+F4")){
				game_end()
			}
			imguigml_end_menu()
		}
		if(imguigml_begin_menu("Edit")){
			if(imguigml_menu_item("Undo","CTRL+Z")){}
			if(imguigml_menu_item("Redo","CTRL+Y")){}
			if(imguigml_menu_item("Search & Replace","CTRL+SHIFT+F")){}
			imguigml_end_menu()
		}
		if(imguigml_begin_menu("Build")){
			if(imguigml_menu_item("Run","F5")){}
			if(imguigml_menu_item("Debug","F6")){}
			if(imguigml_menu_item("Clean","CTRL+F7")){}
			imguigml_separator()
			if(imguigml_menu_item("Create Executable","CTRL+F8")){}
			imguigml_end_menu()
		}
		if(imguigml_begin_menu("Windows")){
			if(imguigml_menu_item("Asset Browser")){}
			if(imguigml_menu_item("Output")){}
			if(imguigml_menu_item("Search Results")){}
			if(imguigml_menu_item("Breakpoints")){}
			if(imguigml_menu_item("Compile Errors")){}
			if(imguigml_menu_item("Syntax Errors")){}
			if(imguigml_menu_item("Inspector")){}
			imguigml_end_menu()
		}
		if(imguigml_begin_menu("Tools")){
			if(imguigml_menu_item("Texture Groups")){}
			if(imguigml_menu_item("Audio Groups")){}
			if(imguigml_menu_item("Sound Mixer")){}
			if(imguigml_menu_item("Generate Project Images")){}
			if(imguigml_menu_item("Create Local Package")){}
			if(imguigml_menu_item("Import Local Package")){}
			imguigml_end_menu()
		}
		if(imguigml_begin_menu("Marketplace")){
			if(imguigml_menu_item("Open Marketplace")){}
			imguigml_separator()
			if(imguigml_menu_item("My Library")){}
			if(imguigml_menu_item("My Purchase History")){}
			imguigml_separator()
			if(imguigml_menu_item("Update Existing Package")){}
			if(imguigml_menu_item("Create Package")){}
			imguigml_end_menu()
		}
		if(imguigml_begin_menu("Layouts")){
			if(imguigml_menu_item("Save Layouts")){}
			if(imguigml_menu_item("Load Layouts")){}
			imguigml_separator()
			if(imguigml_menu_item("Reset Layouts")){}
			imguigml_separator()
			if(imguigml_menu_item("Show All Windows")){}
			if(imguigml_menu_item("Close All Windows")){}
			imguigml_end_menu()
		}
		if(imguigml_begin_menu("Help")){
			if(imguigml_menu_item("Open Manual")){}
			if(imguigml_menu_item("Knowledge Base")){}
			if(imguigml_menu_item("Report a Bug")){}
			if(imguigml_menu_item("Open Log in Explorer")){}
			imguigml_separator()
			if(imguigml_menu_item("GameMaker.io")){}
			if(imguigml_menu_item("GameMaker Community")){}
			imguigml_separator()
			if(imguigml_menu_item("Release Notes")){}
			if(imguigml_menu_item("Current Runtime Release Notes")){}
			if(imguigml_menu_item("Required SDKs")){}
			imguigml_separator()
			if(imguigml_menu_item("Open Project in Explorer")){}
			imguigml_separator()
			if(imguigml_menu_item("Licences")){}
			if(imguigml_menu_item("About")){}
			imguigml_end_menu()
		}
		imguigml_end_main_menu_bar()
	}
}