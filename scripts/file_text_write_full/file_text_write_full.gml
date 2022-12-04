// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function file_text_write_full(FilePath,Text){
	var File = file_text_open_write(FilePath)
	var FileText = ""
	if(File = -1){
		return undefined
	}
	file_text_write_string(File,Text)
	file_text_close(File)
	return FileText
}
  