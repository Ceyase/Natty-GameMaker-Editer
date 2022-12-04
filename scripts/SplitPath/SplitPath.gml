function SplitPath(FilePath){
	var Pos = string_last_pos("/",FilePath) //检测最后一个/的位置
	if(string_last_pos("\\",FilePath) > Pos){
		 Pos = string_last_pos("\\",FilePath) //检测最后一个\的位置
	}
	return [string_copy(FilePath,1,Pos),string_copy(FilePath,Pos+1,string_length(FilePath))]
}