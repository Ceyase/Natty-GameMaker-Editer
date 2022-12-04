function gm_project_load(projectData,projectRootDir){
	
	global.projectname = projectData.name
	for(var i=0;i<array_length(projectData.Folders);i++){
		var item = projectData.Folders[i]
		item = item.folderPath
		var Pos = string_pos("/",item)
		item = string_copy(item,Pos+1,string_length(item))
		Pos = string_last_pos(".",item)
		item = string_copy(item,1,Pos-1)
		var dirlist = string_split(item,"/")
		for(var m=0;m<array_length(dirlist);m++){
			var SetPath = global.projectdir
			for(var n=0;n<array_length(dirlist);n++){
				if(variable_struct_exists(SetPath,dirlist[n])){
					SetPath = variable_struct_get(SetPath,dirlist[n])
				}else{
					variable_struct_set(SetPath,dirlist[n],{})
					SetPath = variable_struct_get(SetPath,dirlist[n])
				}
			}
		}
	}
	
	for(var i=0;i<array_length(projectData.resources);i++){
		var file = projectData.resources[i].id.path
		gm_resources_load(projectRootDir+file)
	}
	
	global.projectRootDir = projectRootDir
}