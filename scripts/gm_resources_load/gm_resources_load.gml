function gm_resources_load(resources_path){
	resources_path = string_replace_all(resources_path,"\\","/")

	var resdata = file_text_read_json(resources_path)
	if(resdata = undefined){
		return undefined
	}
	var respath = resdata.parent.path
	var Pos = string_pos("/",respath)
	respath = string_copy(respath,Pos+1,string_length(respath))
	Pos = string_last_pos(".",respath)
	respath = string_copy(respath,1,Pos-1)
	var dirlist = string_split(respath,"/")
	var defdir = global.projectdir
	
	if(dirlist[0] != global.projectname){
		for(var i=0;i<array_length(dirlist);i++){
			defdir = variable_struct_get(defdir,dirlist[i])
		}
	}

	if(variable_struct_exists(defdir,"_file")){
		array_push(variable_struct_get(defdir,"_file"),resdata.name)
	}
	else{
		variable_struct_set(defdir,"_file",[resdata.name])
	}
	
	variable_struct_set(global.filemap,resdata.name,[resdata.resourceType,resources_path])
}