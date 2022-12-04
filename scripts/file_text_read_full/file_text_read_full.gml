// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function file_text_read_full(FilePath){
	var File = file_text_open_read(FilePath)
	var FileText = ""
	if(File = -1){
		return undefined
	}
	while !(file_text_eof(File)){
		FileText += file_text_readln(File);
	}
	file_text_close(File)
	return FileText
}