function gm_assets_load(assetsname){
	assetcon = variable_struct_get(global.filemap,assetsname)
	switch(assetcon[0]){
		case "GMScript":
		gm_script_load(assetcon[1])
		break;
	}
}