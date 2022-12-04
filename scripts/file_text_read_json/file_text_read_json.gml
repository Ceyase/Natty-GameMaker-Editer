function file_text_read_json(FilePath){
	var File = file_text_open_read(FilePath)
	var FileText = ""
	if(File = -1){
		return undefined
	}
	while !(file_text_eof(File)){
		FileText += file_text_readln(File);
	}
	file_text_close(File)
	return json_parse(FileText)
}