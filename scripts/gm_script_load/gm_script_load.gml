function gm_script_load(scriptpath){
	var scriptdata = file_text_read_json(scriptpath)
	var scriptname = scriptdata.name
	var scriptrootpath = SplitPath(scriptpath)[0]
	var scriptvalue = file_text_read_full(scriptrootpath + scriptname + ".gml")
	
	variable_struct_set(global.temp.Script,scriptname,[scriptvalue,scriptrootpath + scriptname + ".gml"])
}