if (surface_exists(application_surface)){
	surface_resize(application_surface,window_get_width(),window_get_height())
}

if (imguigml_ready()) {
	imguigml_push_font(Font)
	window_codeediter()
	window_mainbar()
	window_assets()
	window_dock()
}
