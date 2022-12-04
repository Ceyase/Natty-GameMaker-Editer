if(Start){
	Output = ExecutedProcessReadFromStandardOutput(ProcessID)
	FreeExecutedProcessStandardOutput(ProcessID)
	global.comoutput += Output
	if!(ProcIdExists(ProcessID)){
		instance_destroy()
	}
}