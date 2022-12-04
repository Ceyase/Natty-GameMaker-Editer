function gm_build_run(){
	var runtimeroot = "C:/ProgramData/GameMakerStudio2/Cache/runtimes/runtime-2022.11.0.73"
	if(global.projectFile != ""){
		//runcommand("ping www.baidu.com")
		runcommand(runtimeroot + "/bin/igor/windows/x64/Igor.exe /uf=C:\\Users\\Administrator\\AppData\\Roaming\\GameMakerStudio2\\luoyu2331_2507852 /rp="+runtimeroot+" /project="+global.projectFile+" /cache=F:\\Git\\Temp /temp=F:\\Git\\Temp -- Windows Run")
	}
}