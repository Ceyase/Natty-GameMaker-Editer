function runcommand(Command){
	var obj = instance_create_depth(0,0,0,processCatch)
	obj.ProcessID = ProcessExecuteAsync(Command)
	obj.Start = true
}